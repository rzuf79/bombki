#!/usr/bin/env bash
# Install the Win64 FPC RTL and MinGW cross tools, configure a target-aware
# FPC wrapper, and verify the dual-target BOMBKI build.

set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FPC_NAME="${FPC:-fpc}"
INSTALL_DIR=""
INSTALL_DIR_SET=0
MINGW_LIB_DIR="/usr/x86_64-w64-mingw32/lib"
ARCHIVE=""
INSTALL_PACKAGES=1
RUN_BUILD=1
BUILD_OUTPUT_DIR=""
DOWNLOAD_ARCHIVE=""
TEMP_DIR=""

usage() {
  cat <<'EOF'
Usage: setup_fpc_windows_cross.sh [options]

Install/configure x86_64 Windows cross-compilation for build_fpc.py on
Debian/Ubuntu x86_64 Linux. Installs MinGW packages with apt, downloads the
Win64 RTL matching the installed FPC version, creates a private FPC wrapper
and binutils prefix, then builds both Linux and Windows executables.

Options:
  --fpc PATH             FPC executable (default: FPC env var or fpc)
  --install-dir PATH     Private RTL/wrapper/tool directory
  --mingw-lib-dir PATH   MinGW import-library directory
  --archive PATH         Use an already downloaded matching FPC Win64 archive
  --build-output-dir PATH Send verified build artifacts to this directory
  --skip-packages        Do not run apt; use already installed MinGW packages
  --no-build             Set up tools but do not run the dual-target build
  -h, --help             Show this help
EOF
}

fail() {
  printf 'setup_fpc_windows_cross.sh: %s\n' "$*" >&2
  exit 1
}

while (($#)); do
  case "$1" in
    --fpc) (($# >= 2)) || fail '--fpc requires a path'; FPC_NAME="$2"; shift 2 ;;
    --install-dir) (($# >= 2)) || fail '--install-dir requires a path'; INSTALL_DIR="$2"; INSTALL_DIR_SET=1; shift 2 ;;
    --mingw-lib-dir) (($# >= 2)) || fail '--mingw-lib-dir requires a path'; MINGW_LIB_DIR="$2"; shift 2 ;;
    --archive) (($# >= 2)) || fail '--archive requires a path'; ARCHIVE="$2"; shift 2 ;;
    --build-output-dir) (($# >= 2)) || fail '--build-output-dir requires a path'; BUILD_OUTPUT_DIR="$2"; shift 2 ;;
    --skip-packages) INSTALL_PACKAGES=0; shift ;;
    --no-build) RUN_BUILD=0; shift ;;
    -h|--help) usage; exit 0 ;;
    *) fail "unknown option: $1" ;;
  esac
done

[[ "$(uname -s)" == Linux ]] || fail 'this setup helper supports Linux hosts only'
[[ "$(uname -m)" == x86_64 ]] || fail 'this setup helper supports x86_64 hosts only'
command -v apt-get >/dev/null 2>&1 || fail 'apt-get is required (Debian/Ubuntu)'
command -v tar >/dev/null 2>&1 || fail 'tar is required'
command -v python3 >/dev/null 2>&1 || fail 'python3 is required'

FPC_PATH="$(command -v "$FPC_NAME" || true)"
[[ -n "$FPC_PATH" ]] || fail "FPC not found: $FPC_NAME"
FPC_VERSION="$("$FPC_PATH" -iV 2>/dev/null | head -n 1)"
[[ "$FPC_VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || fail "cannot determine FPC version from $FPC_PATH"
[[ "$("$FPC_PATH" -iTP 2>/dev/null)" == x86_64 ]] || fail 'FPC must target x86_64'
[[ "$("$FPC_PATH" -iTO 2>/dev/null)" == linux ]] || fail 'the installed FPC must be a Linux compiler'
if ((!INSTALL_DIR_SET)); then
  INSTALL_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/bombki/fpc-cross/$FPC_VERSION"
fi
mkdir -p "$INSTALL_DIR"
INSTALL_DIR="$(cd "$INSTALL_DIR" && pwd)"

if ((INSTALL_PACKAGES)); then
  if ((EUID == 0)); then
    APT=(apt-get)
  elif command -v sudo >/dev/null 2>&1; then
    APT=(sudo apt-get)
  else
    fail 'install MinGW packages as root, or rerun where sudo is available; alternatively use --skip-packages'
  fi
  "${APT[@]}" update
  "${APT[@]}" install -y binutils-mingw-w64-x86-64 mingw-w64-x86-64-dev
fi

[[ -d "$MINGW_LIB_DIR" ]] || fail "MinGW import-library directory not found: $MINGW_LIB_DIR"
MINGW_LIB_DIR="$(cd "$MINGW_LIB_DIR" && pwd)"
AS_PATH="$(command -v x86_64-w64-mingw32-as || true)"
LD_PATH="$(command -v x86_64-w64-mingw32-ld || command -v x86_64-w64-mingw32-ld.bfd || true)"
[[ -n "$AS_PATH" ]] || fail 'x86_64-w64-mingw32-as not found; install binutils-mingw-w64-x86-64'
[[ -n "$LD_PATH" ]] || fail 'x86_64-w64-mingw32-ld(.bfd) not found; install binutils-mingw-w64-x86-64'

TEMP_DIR="$(mktemp -d "${TMPDIR:-/tmp}/bombki-fpc-cross.XXXXXX")"
cleanup() {
  [[ -z "$TEMP_DIR" ]] || rm -rf "$TEMP_DIR"
  [[ -z "$DOWNLOAD_ARCHIVE" ]] || rm -f "$DOWNLOAD_ARCHIVE"
}
trap cleanup EXIT

if [[ -z "$ARCHIVE" ]]; then
  command -v curl >/dev/null 2>&1 || fail 'curl is required to download the FPC Win64 RTL archive'
  ARCHIVE="$(mktemp "${TMPDIR:-/tmp}/fpc-win64-${FPC_VERSION}.XXXXXX.tar")"
  DOWNLOAD_ARCHIVE="$ARCHIVE"
  URL="https://downloads.freepascal.org/fpc/dist/${FPC_VERSION}/x86_64-win64/fpc-${FPC_VERSION}.x86_64-win64.tar"
  printf 'Downloading FPC %s Win64 RTL from %s\n' "$FPC_VERSION" "$URL"
  curl -fL --retry 2 -o "$ARCHIVE" "$URL" || fail "could not download matching FPC archive: $URL"
else
  ARCHIVE="$(cd "$(dirname "$ARCHIVE")" && pwd)/$(basename "$ARCHIVE")"
  [[ -s "$ARCHIVE" ]] || fail "archive not found or empty: $ARCHIVE"
fi

OUTER="fpc-${FPC_VERSION}.x86_64-win64"
tar -tf "$ARCHIVE" "$OUTER/binary.x86_64-win64.tar" >/dev/null 2>&1 \
  || fail "archive is not the official FPC ${FPC_VERSION} x86_64-win64 distribution"

mkdir -p "$TEMP_DIR/rtl" "$TEMP_DIR/console"
tar -xOf "$ARCHIVE" "$OUTER/binary.x86_64-win64.tar" \
  | tar -xOf - x86_64-win64-base.x86_64-linux.tar.gz \
  | tar -xzf - -C "$TEMP_DIR/rtl" --wildcards 'units/x86_64-win64/rtl/*'
tar -xOf "$ARCHIVE" "$OUTER/binary.x86_64-win64.tar" \
  | tar -xOf - units-rtl-console.x86_64-win64.tar.gz \
  | tar -xzf - -C "$TEMP_DIR/console" --strip-components=5 --wildcards \
      "lib/fpc/$FPC_VERSION/units/x86_64-win64/rtl-console/*"

RTL_DEST="$INSTALL_DIR/units/x86_64-win64"
mkdir -p "$INSTALL_DIR/bin" "$RTL_DEST"
[[ -s "$TEMP_DIR/rtl/units/x86_64-win64/rtl/system.ppu" ]] \
  || fail 'the downloaded archive did not contain the Win64 RTL system unit'
[[ -s "$TEMP_DIR/console/rtl-console/crt.ppu" ]] \
  || fail 'the downloaded archive did not contain the Win64 console CRT unit'
cp -a "$TEMP_DIR/rtl/units/x86_64-win64/rtl" "$RTL_DEST/"
cp -a "$TEMP_DIR/console/rtl-console" "$RTL_DEST/"

ln -sfn "$AS_PATH" "$INSTALL_DIR/bin/x86_64-w64-mingw32-as"
ln -sfn "$LD_PATH" "$INSTALL_DIR/bin/x86_64-w64-mingw32-ld"
if AR_PATH="$(command -v x86_64-w64-mingw32-ar || true)"; then
  ln -sfn "$AR_PATH" "$INSTALL_DIR/bin/x86_64-w64-mingw32-ar"
fi

WRAPPER="$INSTALL_DIR/fpc-wrapper"
{
  printf '#!/usr/bin/env bash\n'
  printf 'FPC_EXEC=%q\n' "$FPC_PATH"
  printf 'RTL_DIR=%q\n' "$RTL_DEST/rtl"
  printf 'CONSOLE_DIR=%q\n' "$RTL_DEST/rtl-console"
  printf 'MINGW_LIB_DIR=%q\n' "$MINGW_LIB_DIR"
  cat <<'EOF'
case " $* " in
  *" -Twin64 "*)
    exec "$FPC_EXEC" "$@" "-Fu$RTL_DIR" "-Fu$CONSOLE_DIR" "-Fl$MINGW_LIB_DIR"
    ;;
  *) exec "$FPC_EXEC" "$@" ;;
esac
EOF
} > "$WRAPPER"
chmod 755 "$WRAPPER"

printf '\nFPC: %s (%s)\n' "$FPC_PATH" "$FPC_VERSION"
printf 'Win64 RTL: %s\n' "$RTL_DEST"
printf 'MinGW libraries: %s\n' "$MINGW_LIB_DIR"
printf 'Cross-binutils prefix: %s/bin/x86_64-w64-mingw32-\n' "$INSTALL_DIR"
printf 'FPC wrapper: %s\n' "$WRAPPER"

if ((RUN_BUILD)); then
  BUILD_ARGS=(--fpc "$WRAPPER")
  [[ -z "$BUILD_OUTPUT_DIR" ]] || BUILD_ARGS+=(--output-dir "$BUILD_OUTPUT_DIR")
  FPC_WINDOWS_CROSS_PREFIX="$INSTALL_DIR/bin/x86_64-w64-mingw32-" \
    python3 "$PROJECT_DIR/analysis-tools/build_fpc.py" "${BUILD_ARGS[@]}"
else
  printf '\nSetup complete. Verify/build both targets with:\n'
  printf 'FPC_WINDOWS_CROSS_PREFIX=%q python3 %q --fpc %q\n' \
    "$INSTALL_DIR/bin/x86_64-w64-mingw32-" \
    "$PROJECT_DIR/analysis-tools/build_fpc.py" "$WRAPPER"
fi

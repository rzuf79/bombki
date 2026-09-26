#!/usr/bin/env bash
#
# pas-conformance.sh -- Turbo-Pascal-mode conformance sweep for the BOMBKI
# reconstruction sources (pascal-decomp/reconstructed/).
#
# The reconstruction is still theoretical: MONSTRA/SWIAT are interface
# skeletons (BODY TODO), PRZEDM depends on MONSTRA, BOMBKI depends on all of
# them, and the W*/BAZAR files are fragments awaiting unit wrappers. Nothing
# links yet.  This sweep pins CURRENT expectations (analysis-tools/
# pas-manifest.txt) and fails the build only on drift from those:
#
#   PASS target compiles   -> OK   (bodies landed -- good)
#   PASS target fails      -> REGRESSION, build fails
#   FAIL target fails      -> OK   (documented reconstruction gap)
#   FAIL target compiles   -> STALE MANIFEST, build fails (flip it to PASS)
#
# scaffold targets are tracked for completeness but never compiled (they are
# fragments or a disassembly listing).  It runs on stock Free Pascal in
# Turbo-Pascal language mode (-Mtp); the 16-bit i8086-msdos build and the
# DOSBox run hook build on top of this sweep -- see CI-PROPOSAL.md.

set -u

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
RECON="$ROOT/pascal-decomp/reconstructed"
MANIFEST="$ROOT/pascal-decomp/analysis-tools/pas-manifest.txt"
FPC="${FPC:-fpc}"
BUILD="$(mktemp -d)"

ERRORS=0

bad() { echo "::error::$*" >&2; ERRORS=$((ERRORS + 1)); }

if ! command -v "$FPC" >/dev/null 2>&1; then
  echo "Free Pascal not found. Install it, e.g.: sudo apt-get install fpc" >&2
  exit 2
fi
echo "[info] FPC: $($FPC -iV 2>/dev/null | head -n1)"

trim() {
  local s="$*"
  s="${s#"${s%%[![:space:]]*}"}"
  s="${s%"${s##*[![:space:]]}"}"
  printf '%s' "$s"
}

unit_header_ok() {
  # First non-comment line must be 'unit <name>;' / 'program <name>;'
  # matching the file name (checked before compiling).
  local file="$1" base="${1##*/}" stem="${base%.*}" first
  first="$(grep -m1 -E '^(unit|program|library)[[:space:]]+[A-Za-z_][A-Za-z0-9_]*' "$file" 2>/dev/null || true)"
  if [[ -z "$first" ]]; then
    bad "$file: no unit/program header (fragment or listing?)"
  elif [[ ! "${first,,}" == *"${stem,,};"* ]]; then
    bad "$file: header '${first%;*}' does not match file name $base"
  fi
}

sweep() {
  local file="$1" expected="$2"
  local path="$ROOT/$file" name="${file##*/}" err result

  if [[ ! -f "$path" ]]; then
    bad "$file: manifest target missing"
    echo "| $file | MISSING | mismatched manifest |"
    return 0
  fi
  if grep -q $'\r' "$path"; then
    echo "[info] $file: CR bytes found (LF expected)" >&2
  fi

  if [[ "$expected" == "scaffold" ]]; then
    echo "| $file | exists | scaffold |"
    return 0
  fi

  unit_header_ok "$path"

  err="$(mktemp --suffix=.err)"
  if "$FPC" -Mtp -Fu"$RECON" -FU"$BUILD" -FE"$BUILD" "$path" >"$err" 2>&1; then
    result=PASS
  else
    result=FAIL
  fi

  if [[ "$result" == "$expected" ]]; then
    echo "| $file | $result | ok |"
    if [[ "$result" == "FAIL" ]]; then
      echo "--- $name: current gap (expected) ---" >&2
      tail -n 8 "$err" >&2
    fi
  else
    bad "$name: observed $result, manifest expects $expected"
    echo "| $file | $result | MISMATCH (manifest: $expected) |"
    echo "--- $name: error tail ---" >&2
    tail -n 12 "$err" >&2
  fi
  rm -f "$err"
}

# ---- sweep ----------------------------------------------------------------

rows=("| target | status | vs manifest |" "| --- | --- | --- |")
while IFS='|' read -r file expected note; do
  line="$(printf '%s' "$file" | tr -d '[:space:]')"
  [[ -z "$line" || "$line" == \#* ]] && continue
  rows+=("$(sweep "$(trim "$file")" "$(trim "$expected")")")
done < "$MANIFEST"

echo
echo "### Pascal reconstruction conformance"
printf '%s\n' "${rows[@]}"
if [[ -n "${GITHUB_STEP_SUMMARY:-}" ]]; then
  printf '%s\n' "# Pascal reconstruction conformance" "" "${rows[@]}" > "$GITHUB_STEP_SUMMARY"
fi

echo
if (( ERRORS > 0 )); then
  echo "Conformance: $ERRORS problem(s). Fix regressions or update the manifest."
  exit 1
fi
echo "Conformance: manifest matches observed status."

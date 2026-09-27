#!/bin/sh
#
# pas-conformance.sh -- TP-mode conformance sweep for the BOMBKI
# reconstruction sources (pascal-decomp/reconstructed/).
#
# Compiles every unit with Free Pascal in Turbo-Pascal mode (-Mtp) and
# links the BOMBKI program against the compiled units, then checks the
# produced binary exists. Order follows the dependency chain:
# MONSTRA -> PRZEDM -> SWIAT, then BOMBKI (program).
#
# Fails the run if any target fails to compile or the binary is missing.
# Requires: fpc (Free Pascal), e.g. `apt-get install -y fpc`.

set -u

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
RECON="$ROOT/pascal-decomp/reconstructed"
FPC="${FPC:-fpc}"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

if ! command -v "$FPC" >/dev/null 2>&1; then
  echo "::error::Free Pascal not found (install fpc first)" >&2
  exit 2
fi
echo "FPC: $("$FPC" -iV 2>/dev/null | head -n1)"

passed=0
failed=0

compile_unit() {
  local file="$1"
  local log="$TMP/$(basename "$file").log"
  if "$FPC" -Mtp -Fu"$TMP" -FU"$TMP" "$file" >"$log" 2>&1; then
    echo "PASS  $(basename "$file")"
    passed=$((passed + 1))
  else
    echo "FAIL  $(basename "$file")"
    echo "--- $file (last 30 lines) ---"
    tail -n 30 "$log"
    failed=$((failed + 1))
  fi
}

compile_and_check_binary() {
  local file="$1"
  local log="$TMP/$(basename "$file").log"
  if ! "$FPC" -Mtp -Fu"$TMP" -FU"$TMP" -FE"$TMP" "$file" >"$log" 2>&1; then
    echo "FAIL  $(basename "$file")"
    echo "--- $file (last 30 lines) ---"
    tail -n 30 "$log"
    failed=$((failed + 1))
    return
  fi
  local bin=""
  [ -s "$TMP/BOMBKI" ]     && bin="$TMP/BOMBKI"
  [ -s "$TMP/BOMBKI.exe" ] && bin="$TMP/BOMBKI.exe"
  if [ -n "$bin" ]; then
    echo "PASS  $(basename "$file") -> binary $bin ($(wc -c <"$bin") bytes)"
    passed=$((passed + 1))
  else
    echo "FAIL  $(basename "$file") (binary missing or empty under $TMP)"
    echo "--- $file (last 30 lines) ---"
    tail -n 30 "$log"
    failed=$((failed + 1))
  fi
}

echo "required targets (must compile):"
compile_unit "$RECON/MONSTRA.PAS"
compile_unit "$RECON/PRZEDM.PAS"
compile_unit "$RECON/SWIAT.PAS"
compile_and_check_binary "$RECON/BOMBKI.PAS"
echo ""
echo "passed: $passed, failed: $failed"
if [ "$failed" -gt 0 ]; then
  echo "::error::conformance sweep failed: $failed target(s) did not compile / binary missing"
  exit 1
fi
echo "conformance OK"
exit 0

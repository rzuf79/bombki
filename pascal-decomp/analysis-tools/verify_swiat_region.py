#!/usr/bin/env python3
"""Verify SWIAT's TPU code against the relocated final EXE image."""

import re
import struct
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
exe = (ROOT / "og" / "BOMBKI.EXE").read_bytes()
header_paragraphs, = struct.unpack_from("<H", exe, 8)
image = exe[header_paragraphs * 16:]
code = (ROOT / "pascal-decomp/analysis-results/tpu_reports/SWIAT.code.bin").read_bytes()

start = 0xF5D0
size = 0x129C7 - start
assert len(code) == size
compared = len(code) - 0x0E
differences = [(i, a, b) for i, (a, b) in enumerate(
    zip(code[0x0E:], image[start:start + compared])) if a != b]
unexplained = [(i, a, b) for i, a, b in differences if a != 0]
assert not unexplained, f"non-relocation byte mismatches: {unexplained[:10]}"
assert len(differences) == 3987, f"unexpected number of patched cells: {len(differences)}"
print(f"SWIAT img 0x{start:X}..0x{start + compared - 1:X}: "
      f"{compared} comparable bytes, {len(differences)} patched zero slots, "
      "0 nonzero mismatches")

# Compare every string referenced by a room instruction with the source,
# including command operands and literal bytes represented by #decimal.
source = (ROOT / "pascal-decomp/reconstructed/SWIAT.PAS").read_text(encoding="utf-8")
literals = set()
for match in re.finditer(r"(?:'[^']*'|#\d+)+", source):
    token = match.group()
    chars = re.findall(r"'([^']*)'|#(\d+)", token)
    literals.add(b"".join(text.encode("cp437") if text else bytes([int(num)])
                          for text, num in chars))
listings = ROOT / "pascal-decomp/analysis-results/disasm"
missing = []
checked = 0
for listing in listings.glob("SWIAT-POKOJ*.asm"):
    for match in re.finditer(r'\bmov\s+di,.*?; str:"(.*)"',
                             listing.read_text(encoding="utf-8")):
        text = match.group(1).encode("cp437")
        checked += 1
        if text not in literals:
            missing.append((listing.name, text))
assert not missing, f"room strings missing from source: {missing}"
print(f"{checked} referenced room-string operands present in SWIAT.PAS")

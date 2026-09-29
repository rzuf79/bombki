#!/usr/bin/env python3
"""List main-program context dispatches and calls in the EXE listing."""

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
START, END = 0xB193, 0xF5CA
lines = [f"; BOMBKI main-program loop img 0x{START:X}..0x{END - 1:X}"]
listing = ROOT / "pascal-decomp/analysis-results/disasm/annotated-BOMBKI.asm"
for line in listing.read_text(encoding="utf-8").splitlines():
    match = re.match(r"^([0-9A-F]{5}):\s+[0-9A-F]{4}\s+(\w+)\s+(.*)", line)
    if match is None or not START <= int(match[1], 16) < END:
        continue
    mnemonic, operands = match[2], match[3].split(" ; ")[0].strip()
    # CS=0 here: 16-bit relative CALL/JMP wraps IP, not the image address.
    if mnemonic in ("call", "jmp") and operands.startswith("0x"):
        operands = hex(int(operands, 16) & 0xFFFF)
    if (mnemonic == "cmp" and "[0x1d6]" in operands
            or mnemonic == "lcall" and not operands.startswith(("0x1c71", "0x1c0f"))
            or mnemonic == "call"
            or mnemonic == "jmp" and operands in ("0xb0f0", "0xb193", "0xf5c2")):
        lines.append(f"{match[1]}  {mnemonic:6} {operands}")

out = ROOT / "pascal-decomp/analysis-results/disasm/BOMBKI-main-dispatch.asm"
out.write_text("\n".join(lines) + "\n", encoding="utf-8", newline="\n")
print(f"wrote {out}: {len(lines)} dispatch/call lines")

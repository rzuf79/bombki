#!/usr/bin/env python3
"""Decode the SWIAT unit code region (EXE img 0xF5D0..0x129C6) per-proc.

Ground truth: BOMBKI.EXE final build. The 12 room procs sit at paragraph
0xF5D; entry img = 0xF5D0 + entry (img offsets below). The 13289 bytes
SWIAT.code.bin[0x0E:] match EXE img 0xF5D0..0x129B8 modulo patched
zero relocation slots. The TPU dump omits the last 14 bytes of the region;
the EXE is the transcription source. Strings resolve at base 0xF5D0.
"""
import re, struct, sys
from pathlib import Path
from capstone import Cs, CS_ARCH_X86, CS_MODE_16

ROOT = Path(__file__).resolve().parents[2]
IMAGE = ROOT / "og" / "BOMBKI.EXE"
OUT = ROOT / "pascal-decomp" / "analysis-results" / "disasm" / "SWIAT-region.asm"

d = open(IMAGE, "rb").read()
(hdr,) = struct.unpack_from("<H", d, 8)
img = d[hdr * 16:]

SW_BASE = 0xF5D0          # SWIAT code para -> img
SW_END = 0x129C7          # region end (exclusive)

# proc name -> (entry packed, block packed start, block size)
PROCS = [
    ("POKOJ5",   0x196, 0x0000, 0x435),
    ("POKOJ0",   0x48F, 0x0435, 0x143),
    ("POKOJ1",   0x90F, 0x0578, 0x71D),
    ("POKOJ4",   0xE77, 0x0C95, 0x3F7),
    ("POKOJ13",  0x1233, 0x108C, 0x468),
    ("POKOJE",   0x15BD, 0x14F4, 0x53C),
    ("POKOJ11",  0x1C91, 0x1A30, 0x547),
    ("POKOJ30",  0x2068, 0x1F77, 0x298),
    ("POKOJ60",  0x232E, 0x220F, 0x2AF),
    ("POKOJ75",  0x260C, 0x24BE, 0x311),
    ("POKOJ83",  0x28FA, 0x27CF, 0x2CA),
    ("POKOJ100", 0x2E44, 0x2A99, 0x95E),
]

# known far targets: img -> name (from annotate.py PROCS, absolute seg:ofs*16)
KNOWN = {
    0x4F53: "KillDispatch",
    0x12ACA: "Room",
    0x129D0 + 0x3114: "PRZEDM_MODE",
    0x129D0 + 0x44A6: "PRZEDM_WALKA",
    0x129D0 + 0x0F77: "PRZEDM_tier",
    0x1C71 * 16: "System",
    0x1C0F * 16: "CRT",
}
FIELDS = {  # DGROUP offset -> name (subset used in SWIAT region; see annotate.py)
    0x52: "MaxLoad?0x52", 0x62: "MaxLoad", 0x6C: "CheckpointStage",
    0x180: "PreviousRoom", 0x182: "PRZED", 0x186: "Item_Serce",
    0x194: "PRAKTYK", 0x19C: "Energy", 0x1AC: "ManaCur", 0x1AE: "ManaMax",
    0x1B0: "MonsterHP", 0x1D2: "fleeFlag", 0x1D4: "KUNSZT", 0x1D6: "context",
    0x1D8: "ArenaSouthLatch", 0x212: "LootMoney", 0x216: "Item_KompletUbranSyf",
    0x218: "OutfitEquipped", 0x21A: "ForsaLo", 0x21C: "ForsaHi",
    0x248: "QuestType", 0x24A: "QuestCount", 0x25C: "CharacterLevel",
    0x25D: "SkillPorownywanie", 0x262: "QuestPhase", 0x664: "EnergyMax",
    0x686: "PowerLevel",
}


def pascal_str(a):
    if not (0 < a < len(img)):
        return None
    n = img[a]
    if not (1 <= n <= 250) or a + 1 + n >= len(img):
        return None
    b = img[a + 1:a + 1 + n]
    if all(0x20 <= x <= 0x7E or 0x80 <= x <= 0xFF for x in b):
        return b.decode("cp437")
    return None


MD = Cs(CS_ARCH_X86, CS_MODE_16)
MD.detail = True

lines = []
lines.append("; SWIAT unit code region decode — EXE img 0x%05X..0x%05X" % (SW_BASE, SW_END - 1))
lines.append("; source: BOMBKI.EXE final build; TPU matches through img 0x129B8 (mod reloc slots)")
lines.append("")
entries = []
for name, entry, bstart, bsize in PROCS:
    eimg = SW_BASE + entry
    simg = SW_BASE + bstart
    eend = min(simg + bsize, SW_END)
    if name == "POKOJ100":
        pass  # keep eend; last block ends at region end
    entries.append((name, len(lines)))
    lines.append("; ===== PROC %s @ img %05X (block %04X..%04X) =====" % (name, eimg, simg, eend - 1))
    # scan block for inline pascal strings first
    strings = []
    a = simg
    while a < eend - 2:
        s = pascal_str(a)
        if s is not None:
            strings.append((a, s))
            a += 1 + img[a]
        else:
            a += 1
    for sa, s in strings:
        lines.append(";   str@img%05X: '%s'" % (sa, s))
    lines.append("")
    # linear decode of the block (entry to end) — mis-decoded string bytes
    # are identified by matching the str@ offsets above
    a = eimg
    while a < eend:
        next_str = None
        for (sa, s) in strings:
            if sa > a:
                next_str = (sa, s)
                break
        if next_str and a == next_str[0]:
            if img[a] and pascal_str(a):
                skip = 1 + img[a]
                lines.append("%05X: %02X%02X  %-7s %s" % (a, img[a], img[a + 1], "db", "'%s'" % (next_str[1],)))
                a += skip
                continue
        insns = list(MD.disasm(img[a:a + 24], a))
        if not insns:
            lines.append("%05X: %02X      db      0x%02X" % (a, img[a], img[a]))
            a += 1
            continue
        insn = insns[0]
        op = insn.op_str
        com = []
        # cs-relative string pushes: mov di,imm ; push cs ; push di
        if insn.mnemonic == "mov" and insn.size == 3 and insn.bytes[0] == 0xBF:
            imm = insn.bytes[1] | (insn.bytes[2] << 8)
            nxt = img[insn.address + 3:insn.address + 6]
            if len(nxt) >= 2 and nxt[0] == 0x0E:  # push cs after mov di,imm
                ta = SW_BASE + imm if SW_BASE <= (SW_BASE + imm) < SW_END else 0
                s = pascal_str(ta) if ta else None
                if s is not None:
                    com.append('str:"%s"' % s)
        # memory operands -> dgroup names
        for m in re.finditer(r"\[(0x[0-9a-fA-F]{3,4})\]", op):
            off = int(m.group(1), 16)
            if off in FIELDS:
                com.append("data:" + FIELDS[off])
        # far calls
        if insn.mnemonic in ("lcall", "jmp") and re.search(r"0x[0-9a-fA-F]+,\s*0x[0-9a-fA-F]+", op):
            m = re.search(r"0x([0-9a-fA-F]+),\s*0x([0-9a-fA-F]+)", op)
            if m:
                seg = int(m.group(1), 16)
                ofs = int(m.group(2), 16)
                tg = seg * 16 + ofs
                if SW_BASE <= tg < SW_END:
                    nm = next((n for n, e, b, s in PROCS if SW_BASE + e == tg), None)
                    com.append("->SWIAT:%s" % nm if nm else "->SWIAT+%04X" % (tg - SW_BASE))
                elif tg in KNOWN:
                    com.append("->%s" % KNOWN[tg])
                else:
                    com.append("->para%04X:%04X" % (seg, ofs))
        # near call/jump inside region
        if insn.mnemonic in ("call", "jmp") and op.startswith("0x"):
            nt = int(op, 16)
            if SW_BASE <= nt < SW_END:
                nm = next((n for n, e, b, s in PROCS if SW_BASE + e == nt), None)
                com.append("->SWIAT:%s" % nm if nm else None)
        note = (" ; " + ", ".join(x for x in com if x)) if com else ""
        lines.append("%05X: %02X%02X  %-7s %s%s" % (insn.address, img[insn.address], img[insn.address + 1], insn.mnemonic, op, note))
        a = insn.address + insn.size
    lines.append("")

lines = [line.rstrip() for line in lines]
OUT.write_text("\n".join(lines).rstrip() + "\n", encoding="utf-8", newline="\n")
for i, (name, start) in enumerate(entries):
    stop = entries[i + 1][1] if i + 1 < len(entries) else len(lines)
    (OUT.parent / f"SWIAT-{name}.asm").write_text(
        "\n".join(lines[start:stop]).rstrip() + "\n", encoding="utf-8", newline="\n")
print("wrote", OUT, len(lines), "lines")

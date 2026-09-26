import re, sys
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
s="mov ax, word ptr [0x1ac]"
m=re.match(r"mov (ax|al), (?:word|byte) ptr (?:ds:)?\[0x([0-9a-f]+)\]",s)
print("match:",m, m.groups() if m else None)

import io,re,sys
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
lines=io.open(r"E:\Develop\Reverse\bombki\analysis-results\disasm\annotated-BOMBKI.asm",encoding="utf-8").read().splitlines()
print("---- commands referenced with strcmp in 14800-15400 (dispatcher) ----")
for l in lines:
    l=l.strip()
    if not l: continue
    try: n=int(l.split(':')[0],16)
    except: continue
    if not (0x14800<=n<=0x15400): continue
    m=re.match(r'^([0-9A-F]{5}):\s*[0-9A-F]{4}\s+mov\s+di,\s*0x([0-9A-F]{3,4})\s*;\s*str:"(.*)"$',l)
    if m:
        print("%-6s mov di,0x%03X %r"%(m.group(1),int(m.group(2),16),m.group(3)))
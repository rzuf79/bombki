import io,re,sys
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
lines=io.open(r"E:\Develop\Reverse\bombki\RECONSTRUCTED\disasm\annotated-BOMBKI.asm",encoding="utf-8").read().splitlines()
pat=re.compile(r'mov\s+word ptr \[(0x[0-9A-Fa-f]{3,4})\], ax\s*;?\s*(data:(\w+))?|mov\s+byte ptr \[(0x[0-9A-Fa-f]{3,4})\], al\s*;?\s*(data:(\w+))?')
for l in lines:
    l=l.strip()
    if not l: continue
    try: n=int(l.split(':')[0],16)
    except: continue
    if not (0x12AC7<=n<=0x13055): continue
    m=pat.search(l)
    if m:
        if m.group(1):
            print("%05X  [%s] = %s"%(n,m.group(1),m.group(3) or "?"))
        else:
            print("%05X  [%s](b) = %s"%(n,m.group(4),m.group(6) or "?"))
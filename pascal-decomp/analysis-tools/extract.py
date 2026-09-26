import io
src=io.open(r"E:\Develop\Reverse\bombki\analysis-results\disasm\annotated-BOMBKI.asm",encoding="utf-8",errors="replace").read().splitlines()
out=io.open(r"C:\TEMP\opencode\dispatch12414b.txt","w",encoding="utf-8")
for l in src:
    l=l.strip()
    if not l: continue
    try: n=int(l.split(":")[0],16)
    except: continue
    if 0x12660<=n<=0x129C6:
        out.write(l+"\n")
out.close()
print("ok")
import os, struct, re
from collections import defaultdict
EXE=r"E:\Develop\Reverse\bombki\BOMBKI.EXE"
OUT=os.path.join(os.path.dirname(os.path.abspath(__file__)),"..","analysis-results","disasm","procs")
def u16(b,o): return struct.unpack_from("<H",b,o)[0]
d=open(EXE,"rb").read()
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
base=hdr*16
exesz=(cnt-1)*512+pp
img=d[base:base+exesz-base]
os.makedirs(OUT,exist_ok=True)
def pstr_at(P):
    if P<0 or P>=len(img): return None
    n=img[P]
    if not (2<=n<=120) or P+1+n>len(img): return None
    t=bytes(img[P+1:P+1+n])
    try: s=t.decode("cp437")
    except Exception: return None
    if not all(c in s for c in s) or re.search(r"[{@^\x00-\x1f]",s): return None
    if s.strip(" ?!.,:;\"'()-")=="" or "  " in s: return None
    if not any(c.isalpha() for c in s): return None
    return s
stroffs=[struct.unpack_from("<H",m.group(1))[0]
         for m in re.finditer(rb"\xBf(.{2})\x0e\x57",bytes(img))]
segs=defaultdict(int)
for m in re.finditer(rb"\x9a(....)",bytes(img)):
    segs[struct.unpack_from("<HH",m.group(1))[1]]+=1
with open(os.path.join(OUT,"strings.txt"),"w",encoding="cp437") as f:
    f.write("; cs-relative const offsets referenced as far-const pushes (mov di,imm; push cs)\n")
    for o in sorted(set(stroffs)):
        f.write("%04X  %s\n"%(o,pstr_at(o) or "<data>"))
print("const refs:",len(set(stroffs)))
print("top lcall segments:")
for s,n in sorted(segs.items(),key=lambda kv:-kv[1])[:8]:
    print("  %04X  x%d"%(s,n))

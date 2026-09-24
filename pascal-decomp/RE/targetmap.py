import os, struct, re
from collections import defaultdict, Counter
EXE=r"E:\Develop\Reverse\bombki\BOMBKI.EXE"
OUT=r"E:\Develop\Reverse\bombki\RECONSTRUCTED\disasm\procs\TARGETMAP.ASM"
def u16(b,o): return struct.unpack_from("<H",b,o)[0]
d=open(EXE,"rb").read()
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
base=hdr*16; exesz=(cnt-1)*512+pp; img=d[base:base+exesz-base]
cells=[]
for i in range(rels):
    s,o=struct.unpack_from("<HH",d,tab+4*i)
    c=s*16+o
    if c+4<=len(img):
        ts,to=struct.unpack_from("<HH",img,c)
        cells.append((c,ts,to))
# all distinct stored far targets (game destinations), sorted by address
dst=Counter((ts,to) for (c,ts,to) in cells)
dst=Counter({k:v for k,v in dst.items() if k[0]*16+k[1]<len(img)})
from capstone import Cs,CS_ARCH_X86,CS_MODE_16
md=Cs(CS_ARCH_X86,CS_MODE_16); md.skipdata=True; md.detail=True
# one-pass linear flat disasm of whole image for cross-view; but keep cell-focused:
lines=["; TARGETMAP -- every loader-fixed far destination (game + runtime) in EXE",
       "; image %d B, base file%05X, entry para%04X:ofs%04X"%(len(img),base,0,ip),
       ";", "; <addr> <refs> : first 3 insns", ""]
for (ts,to),n in sorted(dst.items(), key=lambda kv:(kv[0][0]*16+kv[0][1])):
    P=ts*16+to
    if P>=len(img): continue
    hdr_="  %04X:%04X  x%d"%(ts,to,n)
    if ts==0x0E42 or ts==0x05DD or ts==0x129D:
        hdr_+="   <== GAME CODE"
    lines.append(hdr_)
    cnt2=0
    for ins in md.disasm(bytes(img[P:P+0x40]),P):
        lines.append("      %-7s %s"%(ins.mnemonic,ins.op_str))
        cnt2+=1
        if cnt2>=3: break
    lines.append("")
with open(OUT,"wb") as f:
    f.write(("\r\n".join(lines)+"\r\n").encode("cp437","replace"))
print("distinct far destinations:",len(dst))
print("-> TARGETMAP.ASM lines",len(lines))
# how many distinct GAME-proc paragraphs
g=Counter(ts for (ts,to) in dst if ts in (0x0E42,0x05DD,0x129D))
for s,n in g.most_common():
    print("  game para %04X  %d distinct targets"%((s*16+0)//16,n))

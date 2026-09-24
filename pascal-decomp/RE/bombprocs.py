import os, struct, re
from collections import Counter, defaultdict
X=os.path.dirname(os.path.abspath(__file__))
EXE=r"E:\Develop\Reverse\bombki\BOMBKI.EXE"
OUT=os.path.join(X,"..","RECONSTRUCTED","disasm","procs")
def u16(b,o): return struct.unpack_from("<H",b,o)[0]
d=open(EXE,"rb").read()
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
ibase=hdr*16
exesz=(cnt-1)*512+pp
img=bytearray(d[ibase:ibase+exesz-ibase])
# reloc cells: (c, stored_seg, stored_ofs)  stored=loader-fixed absolute
cells=[]
for i in range(rels):
    s,o=struct.unpack_from("<HH",d,tab+4*i)
    c=s*16+o
    if 0<=c+4<len(img):
        ts,to=struct.unpack_from("<HH",img,c)
        cells.append((c,ts,to))
print("image %d B  cells %d"%(len(img),len(cells)))
# game procs: every stored target that falls inside one of the hot code
# paragraphs (which we seed from histogram) is a proc entry.
hot=Counter(ts for (c,ts,to) in cells)
tops=[(s,n) for s,n in hot.most_common(3)]
print("hot stored paragraphs:", " ".join("%04X x%d"%(s,n) for s,n in tops))
# collect, per hot para, its entry offsets + a section label
entry={}
for (c,ts,to) in cells:
    if ts in (0x0E42,0x05DD) and 0 <= ts*16+to < len(img):
        entry.setdefault((ts,to),0)
        entry[(ts,to)]+=1
os.makedirs(OUT,exist_ok=True)
try:
    from capstone import Cs,CS_ARCH_X86,CS_MODE_16
    md=Cs(CS_ARCH_X86,CS_MODE_16); md.skipdata=True
except Exception as e:
    print("capstone missing:",e); md=None
names={(0x0E42,0x0000):"MONSTRA.body_WSTEP",(0x0E42,0x0000|0):"MONSTRA.body_WSTEP"}
lines=[]
for (ts,to) in sorted(entry):
    P=ts*16+to
    nm=names.get((ts,to),"proc_%04X_%04X"%(ts,to))
    lines.append("; ======== %s  ========  (cell para %04X:ofs %04X, img%05X)"%(nm,ts,to,P))
    if md:
        for i in md.disasm(bytes(img[P:P+0x800]),P):
            lines.append("  %04X:%04X  %-8s %s"%(i.address//16,i.address%16,i.mnemonic,i.op_str))
            if i.mnemonic in ("retf","iret"): break
    lines.append("")
rp=os.path.join(OUT,"BOMBKI-procs.asm")
open(rp,"wb").write(("\r\n".join(lines)+"\r\n").encode("cp437","replace"))
print("-> %s  (%d procs, %d lines)"%(rp,len(entry),len(lines)))

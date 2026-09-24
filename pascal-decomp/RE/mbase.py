import os, struct, re
EXE=r"E:\Develop\Reverse\bombki\BOMBKI.EXE"
d=open(EXE,"rb").read()
def u16(b,o): return struct.unpack_from("<H",b,o)[0]
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
base=hdr*16; exesz=(cnt-1)*512+pp; img=d[base:base+exesz-base]
# BODY-A ref cluster: [0x19c],[0x19e],[0x1ac],[0x1b0],[0x1c8],[0x1ca],[0x1cc],[0x1ce],[0x1d0]
# hypothesis MONSTRA base = 0x1ac
mbase=0x1AC
names=["MAXE","JAMNIK","OWCZAREK","SPANIEL","PUDEL","PIESEK","TAKSOWKARZ","SPRZEDAWCA","ZAMIATACZ","PIJAK","ZEBRAK","MINIBARMAN","GRUBAS","DJ","PEDAL","PARA","MACIEK","OGOL","DRZWI","STARUCH","SILNY"]
print("MONSTRA window if base=0x1AC: [0x1AC,0x1D6)")
# scan for C7 06 disp imm over the whole image
hits=[]
for i in range(0,len(img)-6):
    if img[i]==0xC7 and img[i+1]==0x06:
        disp=u16(img,i+2); imm=u16(img,i+4)
        if mbase<=disp<mbase+42 and disp%2==0:
            hits.append((disp,imm))
from collections import Counter
c=Counter(disp for disp,_ in hits)
print("distinct disp refs in MONSTRA window:",len(c))
for disp in sorted(c):
    vals=[imm for disp2,imm in hits if disp2==disp]
    name=names[(disp-mbase)//2] if mbase<=disp<mbase+42 else "?"
    print("  %04X %-10s vals=%s"%(disp,name,sorted(set(vals))))

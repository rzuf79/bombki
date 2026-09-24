import os, struct, re
from collections import Counter
EXE=r"E:\Develop\Reverse\bombki\BOMBKI.EXE"
d=open(EXE,"rb").read()
def u16(b,o): return struct.unpack_from("<H",b,o)[0]
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
base=hdr*16; exesz=(cnt-1)*512+pp; img=d[base:base+exesz-base]
# TP7 global-var access encodings: (mnemonic prefix bytes -> operand pos)
pats=(
 (b"\xA1",0,"mov ax,[W]"), (b"\x8B\x06",0,"mov ax,[W]"), (b"\x89\x06",0,"mov [W],ax"),
 (b"\xC7\x06",0,"mov [W],imm"), (b"\x3B\x06",0,"cmp ax,[W]"), (b"\x33\x06",0,"xor ax,[W]"),
 (b"\x2B\x06",0,"sub ax,[W]"), (b"\x03\x06",0,"add ax,[W]"), (b"\x8A\x06",0,"mov al,[W]"),
 (b"\x88\x06",0,"mov [W],al"), (b"\x0F\xB6\x06",0,"movzx ax,byte[W]"), (b"\x0F\xB7\x06",0,"movzx ax,word[W]"),
 (b"\x30\x06",0,"xor [W],al"), (b"\x80\x3E",0,"cmp byte[W],imm"),
 (b"\x8B\x1E",0,"mov bx,[W]"), (b"\x89\x1E",0,"mov [W],bx"), (b"\x8B\x0E",0,"mov cx,[W]"),
 (b"\x89\x0E",0,"mov [W],cx"), (b"\x89\x16",0,"mov [W],dx"), (b"\x8B\x16",0,"mov dx,[W]"),
 (b"\xFF\x06",0,"inc w[W]"), (b"\xFF\x0E",0,"dec w[W]"),
)
refs=Counter()
for i in range(0,len(img)-6):
    for pf,off,kind in pats:
        ln=len(pf)
        if img[i:i+ln]==pf:
            w=u16(img,i+ln)
            if w<0x400:
                refs[w]+=1
                break
print("referenced DGROUP words in code (offset:count):")
for w,n in sorted(refs.items()):
    print("  %04X  x%-3d%s"%(w,n,"" if w not in (0x19C,0x19E,0x1AC,0x1B0,0x1C8,0x1CA,0x1CC,0x1D4,0x1D6,0x22E,0x257,0x25C) else "   <== used in BODY-A/B"))

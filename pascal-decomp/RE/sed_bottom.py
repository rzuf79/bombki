import os, struct, re
EXE=r"E:\Develop\Reverse\bombki\BOMBKI.EXE"
d=open(EXE,"rb").read()
def u16(b,o): return struct.unpack_from("<H",b,o)[0]
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
base=hdr*16; exesz=(cnt-1)*512+pp; img=d[base:base+exesz-base]
# Proven growing: MONSTRA @0x1AC. PRZEDM block := read C7/89-style word writes to find
# contiguous stat writes that precede MONSTRA. Identify lowest touched word of PRZEDM ints.
touched=set()
pats=(b"\xC7\x06",b"\x89\x06",b"\xA1",b"\x8B\x06",b"\x3B\x06",b"\x33\x06",b"\x2B\x06",b"\x03\x06",b"\x0F\xB6\x06",b"\x8A\x06",b"\x88\x06",b"\x89\x0E",b"\x8B\x0E",b"\x89\x16")
for i in range(0,len(img)-6):
    for pf in pats:
        if img[i:i+len(pf)]==pf:
            w=u16(img,i+len(pf))
            if 0x120<=w<0x1AC: touched.add(w)
            break
lo=min(touched); hi=max(touched)
print("PRZEDM-ish word refs in [%04X..%04X]: %d distinct"%(lo,hi,len(touched)))
# PRZEDM interface first ~47 ints; count slots used
slots=set()
for w in touched: slots.add(w)
contig=sum(1 for w in range(lo,hi+1,2) if w in slots)
print("contiguous even-offset slots touched: %d / %d"%(contig,(hi-lo)//2+1))

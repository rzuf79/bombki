import os, struct, sys, re
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
EXE=r"E:\Develop\Reverse\bombki\BOMBKI.EXE"
d=open(EXE,"rb").read()
def u16(b,o): return struct.unpack_from("<H",b,o)[0]
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
img=d[hdr*16:]
def pstr(P):
    if P<0 or P>=len(img): return None
    n=img[P]
    if not (1<=n<=120) or P+1+n>len(img): return None
    try: return bytes(img[P+1:P+1+n]).decode("cp437",errors="replace")
    except Exception: return None
# decode const strings used in this proc (img offsets referenced via mov di,imm;push cs)
for ref in [0x2b75,0x2b78,0x356f,0x359b,0x35ca,0x360c,0x3653,0x3682,0x36a7,0x36eb,
            0x3846,0x384c,0x385f,0x3872,0x3885,0x3898,0x38ab,0x38be,0x38d1,
            0x38dc,0x38f7,0x3903,0x3920,0x3930,0x3951]:
    print("%05X: %r"%(ref,pstr(ref)))
print()
print('=== PLIKI.TPU fields ===')
vals=open(r"E:\Develop\Reverse\bombki\PLIKI.TPU","rb").read().decode("cp437","replace").split()
print('count:',len(vals))

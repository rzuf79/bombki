import os, struct, re, sys
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
EXE=r"E:\Develop\Reverse\bombki\BOMBKI.EXE"
d=open(EXE,"rb").read()
def u16(b,o): return struct.unpack_from("<H",b,o)[0]
(d_mag,d_pp,d_cnt,d_rels,d_hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
base=d_hdr*16; exesz=(d_cnt-1)*512+d_pp; img=d[base:base+exesz-base]
def pstr(P):
    if P<0 or P>=len(img): return None
    n=img[P]
    if not (1<=n<=120) or P+1+n>len(img): return None
    try: return bytes(img[P+1:P+1+n]).decode("cp437",errors="replace")
    except Exception: return None
want=[0x600d,0x601c,0x6023,0x5fc0,0x5fc5,0x5fca,0x679e,0x67b4,0x67fa,0x6832,0x6874,0x663f,0x6791,0x5fbd,0x564,0x6a2]
for o in want:
    best=None
    for m in re.finditer(rb"\xBf"+struct.pack("<H",o)+rb"\x0e\x57",bytes(img)):
        site=m.start(); para=site//16
        P=para*16+o
        s=pstr(P)
        if s: best=(site,P,s); break
    if best:
        print("%04X  @%05X  %s"%(o,best[1],best[2]))
    else:
        alt=pstr(o) or pstr(0x5D0+o)
        print("%04X  ??? %s"%(o,alt))

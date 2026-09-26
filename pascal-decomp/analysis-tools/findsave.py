import os, struct, re, sys
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
EXE=r"E:\Develop\Reverse\bombki\BOMBKI.EXE"
d=open(EXE,"rb").read()
def u16(b,o): return struct.unpack_from("<H",b,o)[0]
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
base=hdr*16; exesz=(cnt-1)*512+pp; img=d[base:base+exesz-base]
def pstr(P):
    if P<0 or P>=len(img): return None
    n=img[P]
    if not (1<=n<=120) or P+1+n>len(img): return None
    try: return bytes(img[P+1:P+1+n]).decode("cp437",errors="replace")
    except Exception: return None
# find "PLIKI" / "PLIKI.TPU" and "TXT"? search all len-prefixed strings
cands=[]
for P in range(len(img)):
    s=pstr(P)
    if s and ("PLIKI" in s.upper() or "PRZEDM.TPU" in s.upper() or "SAVE" in s.upper()):
        cands.append((P,s))
for P,s in cands[:20]:
    print("%05X  %r"%(P,s))

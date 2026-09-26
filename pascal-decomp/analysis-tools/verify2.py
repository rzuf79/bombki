import struct, sys
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
from capstone import *
EXE=r"E:\Develop\Reverse\bombki\BOMBKI.EXE"
d=open(EXE,"rb").read()
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
img=d[hdr*16:]
def pstr(P):
    if P<0 or P>=len(img): return None
    n=img[P]
    if not (1<=n<=120) or P+1+n>len(img): return None
    try: return bytes(img[P+1:P+1+n]).decode("cp437",errors="replace")
    except Exception: return None
# verify the MODE/UNMODE claims & stat labels near these offsets
md=Cs(CS_ARCH_X86,CS_MODE_16)
# find "JESTES OBLADOWANY" (overload) string and surrounding code referencing 0x182 vs 0x62
for q in ["OBLADOWANY","W SUMIE MASZ","CENZURY","DWUNASTY"]:
    hits=[]
    for P in range(len(img)):
        s=pstr(P)
        if s and q.upper() in s.upper(): hits.append((P,s))
    print(q, "->", hits[:4])

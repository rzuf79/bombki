import struct,sys
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
d=open(r"E:\Develop\Reverse\bombki\BOMBKI.EXE","rb").read()
(hdr,)=struct.unpack_from("<H",d,8)
img=d[hdr*16:]
def pstr_at(a):
    if not (0<a<len(img)): return None
    n=img[a]
    if not (1<=n<=250) or a+1+n>=len(img): return None
    b=img[a+1:a+1+n]
    if any(c<32 and c!=9 for c in b): return None
    return b.decode("cp437")
# combat cs-strings assumed base 0x129D => img=0x129D0+imm. list from the file:
imms=[0x3FBA,0x4022,0x4039,0x4064,0x408A,0x40B7,0x40DE,0x40E8,0x40FC,0x4128,0x415F,0x41A4,0x41E0,0x41E9,0x422E,0x4266,0x4286,0x42A0,0x42BE,0x42F0,0x4302,0x432C,0x4363,0x437B,0x439E,0x43D1,0x4401,0x441F,0x4429,0x445C,0x447F]
for imm in imms:
    a=0x129D0+imm
    s=pstr_at(a)
    if s is None and a+1<len(img) and pstr_at(a+1):
        s="+1:"+pstr_at(a+1)
    print("cs:%04X => img %05X: %r"%(imm,a,s))
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
# locate "pliki.tpu" string (lowercase, the Assign target)
P=0x2B79  # offset of 'pliki...'
# the string const is cs-relative in a data const block; find the code that pushes it
# Actually scan backwards for the enclosing lcall 0x1C71:0x9D7 (WriteStr) chains near 0x2Bxx.
# Print raw hex at 0x2B00..0x2BA0 to see the instruction stream before 'ALL RIGHT'
seg=0x2B00
for i in range(seg,0x2B40,2):
    code="".join("%02X"%b for b in img[i:i+2])
    print("img%05X: %s"%(i,code))

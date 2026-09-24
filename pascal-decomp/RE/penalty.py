import struct, sys
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
from capstone import *
EXE=r"E:\Develop\Reverse\bombki\BOMBKI.EXE"
d=open(EXE,"rb").read()
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
img=d[hdr*16:]
md=Cs(CS_ARCH_X86,CS_MODE_16)
def pstr(P):
    if P<0 or P>=len(img): return None
    n=img[P]
    if not (1<=n<=120) or P+1+n>len(img): return None
    try: return bytes(img[P+1:P+1+n]).decode("cp437",errors="replace")
    except: return None
# find the death-penalty string and scan BACKWARD+FORWARD code (img-relative)
target=None
for P in range(len(img)):
    s=pstr(P)
    if s and "KUNSZT ADEKWATNIE" in s: target=P; break
print("string at img",hex(target))
start=max(0,target-0x1200)
end=min(len(img),target+0x400)
code=bytes(img[start:end])
for ins in md.disasm(code,start):
    txt="%04X %s %s %s" % (ins.address, " ".join("%02x"%b for b in ins.bytes), ins.mnemonic, ins.op_str)
    if ins.address<=target+6 and ins.address>=target-0x11f0: print(txt)
    if ins.address>target+0x40: break

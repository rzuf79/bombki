import os, struct, sys
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
from capstone import *
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
savedisp=0x258
# paragraph p = 0x52E0 + addr>>4 ; addr of savedisp use ~0x2B00 => seg 0x5590, start img ofs = (0x5590-0x52E0)<<4 = 0x2B00
seg=0x5590; start=(seg-0x52E0)*16
md=Cs(CS_ARCH_X86,CS_MODE_16); md.detail=True
end=min(start+0x1100,len(img))
code=img[start:end]
out=[]
for ins in md.disasm(code,start):
    t=ins.mnemonic
    if t in("lcall","call"):
        trg=ins.operands[1].imm if t=="lcall" else ins.operands[0].imm
        out.append((ins.address,t,ins.op_str))
    else:
        out.append((ins.address,t,ins.op_str))
# find write str sites: push cs; push di with di=disp of const; then lcall ces... annotate
for a,t,o in out:
    if t=="lcall" and "1c71" in o:
        off=int(o.split(",")[1].replace("0x","16"),16) if "0x" in o else 0
        pass
# print whole
for a,t,o in out:
    print("%05X  %-7s %s"%(a,t,o))

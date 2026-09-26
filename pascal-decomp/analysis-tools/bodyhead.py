import struct, sys
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
from capstone import *
EXE=r"E:\Develop\Reverse\bombki\BOMBKI.EXE"
d=open(EXE,"rb").read()
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
img=d[hdr*16:]
md=Cs(CS_ARCH_X86,CS_MODE_16)
start=0x173BC
end=0x17E77
out=[]
for ins in md.disasm(img[start:end],start):
    out.append("%04X  %-16s %s %s" % (ins.address," ".join("%02x"%b for b in ins.bytes[:8]),ins.mnemonic,ins.op_str))
open(r"E:\Develop\Reverse\bombki\analysis-results\body_head_raw.txt","w",encoding="utf-8").write("\n".join(out))
print("instructions:",len(out))
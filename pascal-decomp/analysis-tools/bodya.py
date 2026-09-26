import struct, sys
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
from capstone import *
EXE=r"E:\Develop\Reverse\bombki\BOMBKI.EXE"
d=open(EXE,"rb").read()
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
img=d[hdr*16:]
md=Cs(CS_ARCH_X86,CS_MODE_16)
# BODY-A at img 0x17E77 (para 0E42:9A57). Find proc end and disasm full body.
start=0x17E77
end=start+0x1200
import capstone
out=[]
for ins in md.disasm(img[start:end],start):
    out.append("%04X  %-16s %s %s" % (ins.address," ".join("%02x"%b for b in ins.bytes[:8]),ins.mnemonic,ins.op_str))
open(r"E:\Develop\Reverse\bombki\analysis-results\body_a_raw.txt","w",encoding="utf-8").write("\n".join(out))
print("instructions:",len(out),"last addr:",out[-1][:6])

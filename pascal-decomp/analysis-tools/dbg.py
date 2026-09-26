import struct, sys
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
from capstone import *
EXE=r"E:\Develop\Reverse\bombki\BOMBKI.EXE"
d=open(EXE,"rb").read()
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
img=d[hdr*16:]
md=Cs(CS_ARCH_X86,CS_MODE_16)
code=img[0x2BA1:0x356E]
for ins in md.disasm(code,0x2BA1):
    a=ins.address
    if a>=0x2C08 and a<=0x2C45:
        print("%05X %-8s %s"%(a,ins.mnemonic,ins.op_str))

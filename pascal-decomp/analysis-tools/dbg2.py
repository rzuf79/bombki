import struct, sys
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
from capstone import *
EXE=r"E:\Develop\Reverse\bombki\BOMBKI.EXE"
d=open(EXE,"rb").read()
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
img=d[hdr*16:]
from capstone import Cs, CS_ARCH_X86, CS_MODE_16
md=Cs(CS_ARCH_X86,CS_MODE_16)
code=img[0x2BA1:0x356E]
allins=list(md.disasm(code,0x2BA1))
# find first 0x789 lcall
for n,ins in enumerate(allins):
    o=" ".join(ins.op_str.split())
    if ins.mnemonic=="lcall" and o=="0x1c71, 0x789":
        print("lcall at %05X idx %d"%(ins.address,n))
        for m in range(max(0,n-12),n):
            x=allins[m]
            print("  %05X %-8s |%s|"%(x.address,x.mnemonic," ".join(x.op_str.split())))
        break

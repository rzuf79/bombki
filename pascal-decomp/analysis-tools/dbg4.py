import os, struct, sys, re
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
from capstone import *
EXE=r"E:\Develop\Reverse\bombki\BOMBKI.EXE"
d=open(EXE,"rb").read()
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
img=d[hdr*16:]
code=img[0x2BA1:0x356E]
md=Cs(CS_ARCH_X86,CS_MODE_16)
allins=list(md.disasm(code,0x2BA1))
for n,ins in enumerate(allins):
    o=" ".join(ins.op_str.split())
    if ins.mnemonic=="lcall" and o=="0x1c71, 0x789":
        for x in reversed(allins[max(0,n-10):n]):
            xo=" ".join(x.op_str.split())
            m=re.match(r"mov (ax|al), (?:word|byte) ptr (?:ds:)?\[0x([0-9a-f]+)\]",xo)
            print("%05X |%-32s| movmatch=%s"%(x.address,xo, bool(m)))
        break

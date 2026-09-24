import struct, sys
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
from capstone import *
EXE=r"E:\Develop\Reverse\bombki\BOMBKI.EXE"
d=open(EXE,"rb").read()
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
img=d[hdr*16:]
md=Cs(CS_ARCH_X86,CS_MODE_16)
# shop/menu proc: from 0x36F5 (push bp; mov bp,sp) to 0x3845 (ret)
code=img[0x36F5:0x3846]
print("=== BAZAR/SKLEP proc 0x36F5-0x3845 (BAZAR menu) ===")
for ins in md.disasm(code,0x36F5):
    o=" ".join(ins.op_str.split())
    a=ins.address
    mark=""
    if ins.mnemonic=="lcall" and "0x1c71" in o: mark="  <- RTL"
    print("%05X  %-8s %s%s"%(a,ins.mnemonic,o,mark))

import struct, sys
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
from capstone import *
EXE=r"E:\Develop\Reverse\bombki\BOMBKI.EXE"
d=open(EXE,"rb").read()
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
img=d[hdr*16:]
md=Cs(CS_ARCH_X86,CS_MODE_16)
md.detail=False
# BAZAR-death proc is right after the save() string table (strings@0x356F..). find "\x93 SMS\x00 HELP..." no;
# proc entry near 0x36F5 per earlier. disassemble 0x35F0..0x37F0
for ins in md.disasm(img[0x35F0:0x37F0],0x35F0):
    print("%04X  %-16s %s %s" % (ins.address," ".join("%02x"%b for b in ins.bytes[:8]),ins.mnemonic,ins.op_str))

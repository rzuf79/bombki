import struct,sys
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
from capstone import *
d=open(r"E:\Develop\Reverse\bombki\BOMBKI.EXE","rb").read()
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
img=d[hdr*16:]
md=Cs(CS_ARCH_X86,CS_MODE_16)
windows=[(0x10960,0x109D0,"w_10960"),(0x12960,0x12A60,"w_12960"),(0x13820,0x13890,"w_13820"),(0x5D90,0x5DE0,"w_5d90"),(0xB3B0,0xB400,"w_b3b0"),(0xD070,0xD100,"w_d070")]
for s,e,name in windows:
    out=[]
    for ins in md.disasm(img[s:e],s):
        out.append("%04X  %-16s %s %s" % (ins.address," ".join("%02x"%b for b in ins.bytes[:8]),ins.mnemonic,ins.op_str))
    open(r"E:\Develop\Reverse\bombki\RE\%s.txt"%name,"w",encoding="utf-8").write("\n".join(out))
    print(name,len(out))
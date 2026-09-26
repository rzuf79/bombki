import struct,sys
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
from capstone import *
d=open(r"E:\Develop\Reverse\bombki\BOMBKI.EXE","rb").read()
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
img=d[hdr*16:]
md=Cs(CS_ARCH_X86,CS_MODE_16)
windows=[(0xB670,0xB720,"w_b670"),(0xB840,0xB8F0,"w_b840")]
for s,e,name in windows:
    out=[]
    for ins in md.disasm(img[s:e],s):
        out.append("%04X  %-16s %s %s" % (ins.address," ".join("%02x"%b for b in ins.bytes[:8]),ins.mnemonic,ins.op_str))
    open(r"E:\Develop\Reverse\bombki\analysis-results\%s.txt"%name,"w",encoding="utf-8").write("\n".join(out))
    print(name,len(out))
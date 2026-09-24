import struct,sys
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
from capstone import *
d=open(r"E:\Develop\Reverse\bombki\BOMBKI.EXE","rb").read()
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
img=d[hdr*16:]
md=Cs(CS_ARCH_X86,CS_MODE_16)
p_in = bytes.fromhex("9a cd 02 71 1c")
starts=[]
i=0
while True:
    i=img.find(p_in,i)
    if i<0: break
    starts.append(i); i+=1
for s0 in starts:
    offs=[]
    for ins in md.disasm(img[s0:s0+0x1200],s0):
        if ins.mnemonic=="lcall":
            tgt=ins.op_str.replace(" ","")
            if "," in tgt:
                seg,off=tgt.split(",")
                try: a=int(off,16)
                except: a=-1
                offs.append(hex(a))
        if ins.mnemonic=="ret":
            break
        if ins.address-s0>0x1200: break
    rtl=[o for o in offs if o[2:4] in ("02","03","07","08","09","0e") and len(o)<=5]
    if "0x369" in rtl or "0x900" in rtl or "0x8c6" in rtl or "0x7bd" in rtl or "0x2e6" in rtl:
        print("%04X %s"%(s0,rtl))
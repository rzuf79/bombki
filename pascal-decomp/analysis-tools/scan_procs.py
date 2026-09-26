import struct,sys
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
from capstone import *
d=open(r"E:\Develop\Reverse\bombki\BOMBKI.EXE","rb").read()
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
img=d[hdr*16:]
md=Cs(CS_ARCH_X86,CS_MODE_16)
p_in = bytes.fromhex("9a cd 02 71 1c")  # lcall 0x2cd procinit
p369 = bytes.fromhex("9a 69 03 71 1c")  # lcall 0x369 assign?
p900 = bytes.fromhex("9a 00 09 71 1c")  # lcall 0x900 read?
starts=[]
i=0
while True:
    i=img.find(p_in,i)
    if i<0: break
    if 0x2cd and i in range(0x200,len(img)):
        pass
    starts.append(i-6 if i>=6 else i); i+=1
print("proc init markers (dedup):",["%04X"%s for s in starts])
# for each start, linear-disasm until first ret and note which RTL file procs are called
for s0 in starts:
    calls=set(); 
    done=False
    for ins in md.disasm(img[s0:s0+0x1200],s0):
        if ins.mnemonic.startswith("lcall"):
            op=ins.op_str
            tgt=op.replace(" ","")
            if "," in tgt:
                seg,off=tgt.split(",")
                try:
                    a=int(off,16)
                    if 0x200<=a<=0x1000: calls.add("%s"%a)
                except: pass
            calls.add(tgt)
        if ins.mnemonic in ("ret",):
            done=True; break
        if ins.address-s0>0x1200: break
    rel={c for c in calls if c in ("0x369","0x7bd","0x900","0x5dd","0x701","0x789","0x291","0x2e6","0x2cd","0x9d7","0x8c6")}
    if rel and not (rel<={"0x701","0x789","0x5dd","0x291","0x2cd"}):
        print("%04X  calls=%s"%(s0,sorted(calls)))
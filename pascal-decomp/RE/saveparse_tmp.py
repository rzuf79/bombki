import os, struct, sys, re
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
from capstone import *
EXE=r"E:\Develop\Reverse\bombki\BOMBKI.EXE"
d=open(EXE,"rb").read()
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
img=d[hdr*16:]
md=Cs(CS_ARCH_X86,CS_MODE_16); md.detail=True
# save() proc: from prologue at img 0x2BA1 to ret at 0x356E
start=0x2BA1; end=0x356E
code=img[start:end]
seq=[]; cur=None; since=0
for ins in md.disasm(code,start):
    a=ins.address; t=ins.mnemonic; o=ins.op_str
    if t=="lcall" and o.startswith("0x1c71"):
        dst=int(o.split(",")[1],16)
        if dst==0x789:   # WriteLongInt on ds:0x7E
            cur=("n",cur[1] if cur else None); seq.append(cur)
        elif dst==0x701: # WriteStr
            cur=("s",cur[1] if cur else None); seq.append(cur)
        elif dst==0x5dd: # WriteLn
            seq.append(("wln",None)); cur=None
        else:
            cur=("?"+hex(dst),cur[1] if cur else None)
    elif t=="mov" and o.startswith("word ptr [0x") or t=="mov" and o.startswith("word ptr ds:[0x"):
        pass
    # track the data source before the 0x789 call: last direct mov [slot] or byte [slot]
    m=re.match(r"(?:mov|lea)\s+(?:ax|al|dx),\s*(?:word|byte)?\s*ptr\s*(?:ds:)?\[0x([0-9a-f]+)\]",o)
    if m and cur is None:
        sl=int(m.group(1),16)
    # expression modifiers
mods=[]
for ins in md.disasm(code,start):
    a=ins.address; t=ins.mnemonic; o=ins.op_str
    if t=="lcall" and o.startswith("0x1c71"):
        dst=int(o.split(",")[1],16)
        if dst==0x789: print("%05X write" % a)

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
vals=open(r"E:\Develop\Reverse\bombki\PLIKI.TPU","rb").read().decode("cp437","replace").split()
def norm(ins): return "%s %s"%(ins.mnemonic," ".join(ins.op_str.split()))
write_idx=[i for i,ins in enumerate(allins) if ins.mnemonic=="lcall" and "0x1c71" in ins.op_str and "0x789" in ins.op_str]
rows=[]
for n in write_idx:
    lcall=allins[n]
    # find the mov ax/al,[disp] within last 12
    sl=None;size=None;mi=None
    for j in range(n-1,max(0,n-12),-1):
        s=norm(allins[j])
        m=re.match(r"mov (ax|al), (?:word|byte) ptr (?:ds:)?\[0x([0-9a-f]+)\]",s)
        if m: sl=int(m.group(2),16); size='b' if m.group(1)=='al' else 'w'; mi=j; break
        if allins[j].mnemonic=="lcall": break
    expr=[]
    if mi is not None:
        for j in range(mi+1,n):
            s=norm(allins[j])
            m=re.match(r"(add|sub) ax, 0x([0-9a-f]+)",s)
            if m: expr.append((m.group(1),m.group(2))); continue
            m=re.match(r"shl ax, ([12])",s)
            if m: expr.append(("shl",m.group(1))); continue
            if allins[j].mnemonic not in("push","xor","cdq","mov"): break
    f=len(rows)
    v=vals[f] if f<len(vals) else '?'
    rows.append([f+1,size,sl,expr,v])
print("fld sz   slot    expr                         saved      raw")
def decode(iv,ex):
    raw=iv
    for op,arg in reversed(ex):
        if op=="shl": raw>>=int(arg)
        elif op=="add": raw-=int(arg)
        elif op=="sub": raw+=int(arg)
    return raw
lines=[]
for r in rows:
    f,size,sl,ex,v=r
    es=",".join("%s %s"%(a,b) for a,b in ex) or "-"
    sls=("0x%03X"%sl) if sl is not None else "----"
    szs=size or "-"
    try: iv=int(v); raw=decode(iv,ex)
    except Exception: iv=None;raw="?"
    print("%3d %2s   %-5s  %-25s %-10s %s"%(f,szs,sls,es,v,raw))
    lines.append("%d\t%s\t%s\t%s\t%s\t%s"%(f,szs,sls,es,v,raw))
open(r"E:\Develop\Reverse\bombki\RECONSTRUCTED\disasm\procs\SAVE-FIELD-MAP.txt","w",encoding="cp437",errors="replace").write("\n".join(lines)+"\n")
print("ok")

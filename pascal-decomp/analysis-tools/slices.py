import os, struct, re
from collections import defaultdict
EXE=r"E:\Develop\Reverse\bombki\BOMBKI.EXE"
OUT=os.path.join(os.path.dirname(os.path.abspath(__file__)),"..","analysis-results","disasm","procs")
def u16(b,o): return struct.unpack_from("<H",b,o)[0]
d=open(EXE,"rb").read()
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
base=hdr*16
exesz=(cnt-1)*512+pp
img=d[base:base+exesz-base]
cells=[]
for i in range(rels):
    s,o=struct.unpack_from("<HH",d,tab+4*i)
    c=s*16+o
    if c+4<=len(img):
        ts,to=struct.unpack_from("<HH",img,c)
        cells.append((ts,to))
SEGS=(0x0E42,0x05DD,0x129D)
seeds=defaultdict(set)
for (ts,to) in cells:
    if ts in SEGS:
        seeds[ts].add(to)
seeds={k:sorted(v) for k,v in seeds.items()}
for s in SEGS:
    print("para %04X  seed cell target ofs: %d"%(s,len(seeds.get(s,[]))))
try:
    from capstone import Cs,CS_ARCH_X86,CS_MODE_16
    md=Cs(CS_ARCH_X86,CS_MODE_16); md.skipdata=True; md.detail=True
except Exception as e:
    print("capstone missing",e); raise SystemExit
# pstr helper for inline comments on const pushes
def pstr_at(P):
    if P<0 or P>=len(img): return None
    n=img[P]
    if not (2<=n<=120) or P+1+n>len(img): return None
    try: s=bytes(img[P+1:P+1+n]).decode("cp437")
    except Exception: return None
    if re.search(r"[{@^\[\]\\\x00-\x1f]",s) or "  " in s: return None
    if not any(c.isalpha() for c in s): return None
    return s
os.makedirs(OUT,exist_ok=True)
total=0
for seg in SEGS:
    ofslist=seeds.get(seg,[])
    # also include 0000 as fallback seed
    starts=sorted(set([0x0000]+ofslist))
    done=set(); out=[]
    def region(P,by):
        if P in done: return
        done.add(P)
        for ins in md.disasm(bytes(img[P:P+0x6000]),P):
            a=ins.address
            cmt=""
            mm=re.match(r"(?:0x)?([0-9A-F]{1,4}), (?:0x)?([0-9A-F]{1,4})$",ins.op_str)
            if ins.mnemonic in ("lcall","ljmp") and mm:
                sg,of=int(mm.group(1),16),int(mm.group(2),16)
                if 0<=sg*16+of<len(img):
                    sm=sorted([x for x in done if x!=P])
                    s=pstr_at(sg*16+of)
                    cmt="  ; -> %s"%(s if s else ("para %04X:ofs %04X"%(sg,of)))
            mm2=re.match(r"0x([0-9A-F]{1,4})$",ins.op_str)  # bare far-const push form
            out.append("  %04X:%04X  %-8s %-26s%s"%(a//16,a%16,ins.mnemonic,ins.op_str,cmt))
            if ins.mnemonic in ("callf","jmpf","lcall","ljmp") and mm:
                sg,of=int(mm.group(1),16),int(mm.group(2),16)
                if sg*16+of<len(img) and sg==seg:  # same-seg near-like far tail
                    region(sg*16+of,"chain")
            if ins.mnemonic in ("retf","iret","ret","jmp") and ins.mnemonic!="ret":
                if ins.mnemonic=="ret":
                    continue
                break
    n=0
    for st in starts:
        P=seg*16+st
        if P>=len(img): continue
        out.append("")
        out.append("; ============ proc@%04X:%04X (entry cell) ============"%(seg,st))
        region(P,"seed"); n+=1
    name="BOMBKI-seg%04X.asm"%seg
    total+=n
    if out:
        hdr=["; BOMBKI.exe segment %04X -- proc slices at loader-fixed far-cell targets"%seg,
             "; %d entry cells seeded."%len(starts),""]
        with open(os.path.join(OUT,name),"wb") as f:
            f.write(("\r\n".join(str(x) for x in ([hdr]+out))+"\r\n").encode("cp437","replace"))
        print("-> %-28s %d proc slices"%(name,n))
print("total slices:",total)

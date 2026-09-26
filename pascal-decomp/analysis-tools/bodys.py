#!/usr/bin/env python3
# -*- coding: cp437 -*-
"""bodys.py - BOMBKI.EXE: recover GAME PROCR BODIES directly from the EXE.

The EXE's far-pointer histogram shows the game lives in TWO paragraphs:
  0E42 (52 loader-fixed cells) = MONSTRA body+main area code segment
  05DD (35 cells)              = PRZEDM body code paragraph
Any cell that stores (seg==0E42 or seg==05DD) is a loader-fixed FAR CALL/JMP
TARGET into that body.  Recursive descent seeded at every such target (and at
the MZ exeip) with capstone x86/16 recovers each proc body head (until retf /
iret / unconditional bleed).  Output RECONSTRUCTED\\disasm\\BOMBKI-body.asm.
"""
import os, sys, struct
from collections import Counter, defaultdict

EXE=r"E:\Develop\Reverse\bombki\BOMBKI.EXE"
OUTD=os.path.join(os.path.dirname(os.path.abspath(__file__)),
                  "..","RECONSTRUCTED","disasm")
BODY_PARA=(0x0E42,0x05DD)
MAXP=700
WINDOW=0x400

def u16(b,o): return struct.unpack_from("<H",b,o)[0]

def mz(d):
    (mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
    return dict(partpag=pp,pagecnt=cnt,reloccnt=rels,hdrsz=hdr,exeip=ip,
                reltab=tab,imgbase=hdr*16)

def image(d,h):
    exesz=(h["pagecnt"]-1)*512+h["partpag"]
    base=h["imgbase"]
    return d[base:base+exesz-base]

def cell_targets(d,h,img):
    tgt=defaultdict(list)
    for i in range(h["reloccnt"]):
        seg,ofs=struct.unpack_from("<HH",d,h["reltab"]+4*i)
        c=seg*16+ofs
        if 0<=c+4<=len(img):
            ts,to=struct.unpack_from("<HH",img,c)
            tgt[ts].append(to)
    return {k:sorted(set(v)) for k,v in tgt.items()}

def main():
    os.makedirs(OUTD,exist_ok=True)
    d=open(EXE,"rb").read()
    h=mz(d); img=image(d,h)
    tgt=cell_targets(d,h,img)
    print("image %d B   hot stored paragraphs:"%len(img))
    hist=Counter((ts for ts in tgt for _v in tgt[ts]))
    for (s,n) in hist.most_common(6):
        print("   para %04X  cells=%d"%(s,n))
    print()
    try:
        from capstone import Cs,CS_ARCH_X86,CS_MODE_16
        HAVE=True
    except Exception:
        HAVE=False
    if not HAVE:
        print("capstone missing - install:  pip install capstone"); return
    md=Cs(CS_ARCH_X86,CS_MODE_16)
    md.detail=True
    md.skipdata=True
    lines=["; ==================== BOMBKI.EXE  game-proc bodies ====================",
           "; loader-fixed far cells that target paragraphs %s are the body entries;"
           % " / ".join("%04X"%p for p in BODY_PARA),
           "; recursive-descent from each (para:ofs); capstone x86/16.",
           "; image %d B  base img%04X"%(len(img),h["imgbase"]),""]
    seeds=[]
    for p in BODY_PARA:
        for of in tgt.get(p,()):
            seeds.append((p,of,"cell"))
    seeds.append((0,h["exeip"],"exeip"))
    seen=set(); nproc=0
    while seeds and nproc<MAXP:
        (p,of,why)=seeds.pop(0)
        if (p,of) in seen: continue
        seen.add((p,of))
        P=p*16+of
        nproc+=1
        lines.append("; ===================== proc %04X:%04X  (from %s) ====================="
                     % (p,of,why))
        cur=[]
        for ins in md.disasm(bytes(img[P:P+WINDOW]),P):
            rel=ins.address-P
            cur.append("  %04X:%04X  %-8s %s"%(ins.address//16,ins.address%16,
                                               ins.mnemonic,ins.op_str))
            # chase far call/jmp whose operand parses seg:ofs
            import re
            mm=re.match(r"0x([0-9A-Fa-f]{1,4}):0x([0-9A-Fa-f]{1,4})",ins.op_str)
            if ins.mnemonic in ("callf","jmpf","lcall") and mm:
                sp_,op_=int(mm.group(1),16),int(mm.group(2),16)
                seeds.append((sp_,op_,"from %04X:%04X"%(p,of)))
            if ins.mnemonic in ("retf","iret") or rel>WINDOW-0x10:
                break
        lines+=cur
        lines.append("")
    asm=os.path.join(OUTD,"BOMBKI-body.asm")
    with open(asm,"wb") as f:
        f.write(("\r\n".join(lines)+"\r\n").encode("cp437","replace"))
    print("-> %s   (%d procs, %d lines)"%(asm,nproc,len(lines)))

if __name__=="__main__":
    main()

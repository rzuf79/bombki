import os, sys, struct
from collections import defaultdict, Counter

EXE=r"E:\Develop\Reverse\bombki\BOMBKI.EXE"
OUT=os.path.join(os.path.dirname(os.path.abspath(__file__)), "..",
                 "RECONSTRUCTED", "disasm", "BOMBKI-body-procs.asm")
CODE_PARAS=(0x0E42, 0x05DD)      # loader histogram: SWIAT body + PRZEDM body

def u16(b,o): return struct.unpack_from("<H",b,o)[0]
def mz(d):
    (mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
    return dict(partpag=pp,pagecnt=cnt,reloccnt=rels,hdrsz=hdr,exeip=ip,
                reltab=tab,imgbase=hdr*16)
def image(d,h):
    exesz=(h["pagecnt"]-1)*512+h["partpag"]
    return d[h["imgbase"]:h["imgbase"]+exesz-h["imgbase"]]

def main():
    d=open(EXE,"rb").read(); h=mz(d); img=image(d,h)
    print("image %d B  hdrsz=%04X  imgbase=%04X  entry IP=%04X" %
          (len(img),h["hdrsz"],h["imgbase"],h["exeip"]))
    # reloc cells fixed into image: cell(img pos) -> stored far target
    tgt=defaultdict(list)
    for i in range(h["reloccnt"]):
        seg,ofs=struct.unpack_from("<HH",d,h["reltab"]+4*i)
        c=seg*16+ofs
        if c+4<=len(img):
            ts,to=struct.unpack_from("<HH",img,c)
            tgt[ts].append(to)
    print("hot loader paragraphs:")
    for s,n in Counter((s for s in tgt for t in tgt[s])).most_common(6):
        print("  %04X x%d  %s" % (s,n,"  <== game body"%("\u21d0" if s in CODE_PARAS else "")))
    seeds=[]
    for ts in CODE_PARAS:
        for to in tgt[ts]:
            seeds.append((ts,to))
    seeds=list(dict.fromkeys([tuple(t) for t in seeds]))
    print()
    print("  %d seed cells into the two game-body paragraphs" % len(seeds))
    try:
        from capstone import Cs, CS_ARCH_X86, CS_MODE_16
        HAVE=True
    except Exception:
        HAVE=False
    if not HAVE:
        print("capstone unavailable"); return
    md=Cs(CS_ARCH_X86,CS_MODE_16); md.skipdata=True
    md.detail=True
    lines=["; BOMBKI.EXE -- game-body procedures (recursive descent, reloc-anchored)",
           "; seeded from every loader-fixed far cell that targets paragraphs",
           "; 0E42 (SWIAT/game body) and 05DD (PRZEDM body).  Far CALL/JMP",
           "; operands resolve because the LOADER already stores absolute far",
           "; targets in those cells.",
           "; NOTE (side-by-side): the TPU unit bodies do NOT byte-slide into",
           "; this EXE (different TPU generation) -- the EXE body IS the truth",
           "; here; TPU reports give the *interface* for the .PAS side.",
           ""]
    todos=[(s,o,"SEED-cell",0) for (s,o) in seeds]
    done=set(); order=0
    while todos and len(lines)<200000:
        (ts,to,why,depth)=todos.pop(0)
        key=(ts,to)
        if key in done: continue
        done.add(key); order+=1
        P=ts*16+to
        lines.append("; ==================== body proc %04X:%04X  (seed %s) ====================" % (ts,to,why))
        blk=img[P:P+0x8000]
        pend=0
        for insn in md.disasm(bytes(blk), P):
            rel=insn.address-P
            a=insn.address
            lines.append("  %04X:%04X  %-8s %-28s  [rel %04X]" %
                         (a//16,a%16,insn.mnemonic,insn.op_str,rel))
            # far call/jmp: operand "0xSEG, 0xOFS" -> chase target
            import re
            mm=re.match(r"(?:0x)?([0-9A-F]{1,4}), (?:0x)?([0-9A-F]{1,4})$",
                        insn.op_str)
            if insn.mnemonic in ("callf","jmpf","lcall","ljmp") and mm:
                sg=int(mm.group(1),16); of=int(mm.group(2),16)
                # capstone16 far op order is seg, ofs? try both:
                for (sg2,of2) in ((int(mm.group(1),16),int(mm.group(2),16)),
                                  (int(mm.group(2),16),int(mm.group(1),16))):
                    if sg2*16+of2 < len(img):
                        todos.append((sg2,of2,"from %04X:%04X %s"%(
                            ts,to,insn.mnemonic),depth+1))
                        break
            if rel>0x7FE0:
                lines.append("  ; ---- window limit ----")
                break
        lines.append("")
    os.makedirs(os.path.dirname(OUT),exist_ok=True)
    open(OUT,"wb").write(("\r\n".join(lines)+"\r\n").encode("cp437","replace"))
    print("-> %s   (%d body procs, %d lines)"%(OUT,len(done),len(lines)))

if __name__=="__main__":
    main()

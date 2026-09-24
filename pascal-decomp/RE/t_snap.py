import os, re, struct
self="E:\\Develop\\Reverse\\bombki\\RE\\t_snap.py"
EXE=r"E:\Develop\Reverse\bombki\BOMBKI.EXE"
OUT=r"E:\Develop\Reverse\bombki\RECONSTRUCTED\disasm\procs\BODIES.PAS"
d=open(EXE,"rb").read()
def u16(b,o): return struct.unpack_from("<H",b,o)[0]
hdr=u16(d,0x18); rels=u16(d,6); tab=u16(d,0x18+4)  # relo tab at ofs 0x18? actually e_lfanew-ish; use MZ fields
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
base=hdr*16; exesz=(cnt-1)*512+pp; img=d[base:base+exesz-base]
def pstr(P):
    if P<0 or P>=len(img): return None
    n=img[P]
    if not (2<=n<=60) or P+1+n>len(img): return None
    try: return bytes(img[P+1:P+1+n]).decode("cp437")
    except Exception: return None
def at(A):  # absolute addr -> image index
    return A
lines=[]
procA=(0x0E42*16+0x9A57)
procB=(0x05DD*16+0x1C71)
try:
    from capstone import Cs,CS_ARCH_X86,CS_MODE_16
    md=Cs(CS_ARCH_X86,CS_MODE_16); md.skipdata=True; md.detail=True
except Exception:
    md=None
def emit(P,title):
    global lines
    lines.append("")
    lines.append("{. %s  (EXE img%05X) }"%(title,P))
    if not md:
        lines.append("  { capstone unavailable }")
        return
    for ins in md.disasm(bytes(img[P:P+0x6000]),P):
        a=ins.address
        com=""
        mm=re.match(r"0x([0-9A-F]{1,4}), 0x([0-9A-F]{1,4})",ins.op_str)
        mm2=re.match(r"^0x([0-9A-F]{1,4})$",ins.op_str)
        const=None
        if ins.mnemonic in ("push","mov","cmp") and mm2:
            o=int(mm2.group(1),16)
            s=pstr(o)
            if s: com="  {'%s' / %04X}"%(s,o)
        if com: line="  {:%04X}  %-7s %-24s%s"%(a//16%0x10000,ins.mnemonic,ins.op_str,com)
        else:   line="  {:%04X}  %-7s %-24s"%(a//16%0x10000,ins.mnemonic,ins.op_str)
        lines.append(line)
    lines.append("")
emit(procA,"BODY-A  proc at para 0E42:9A57 (absolute %05X)"%procA)
emit(procB,"BODY-B  proc at para 05DD:1C71 (absolute %05X)"%procB)
with open(OUT,"wb") as f:
    f.write(("\r\n".join(lines)+"\r\n").encode("cp437","replace"))
print("->",OUT,"lines",len(lines))
print("procA abs=%05X   procB abs=%05X"%(procA,procB))

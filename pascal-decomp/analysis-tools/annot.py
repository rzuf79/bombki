import os, struct, re
EXE=r"E:\Develop\Reverse\bombki\BOMBKI.EXE"
OUT=r"E:\Develop\Reverse\bombki\reconstructed\BOMBKI-body.pas"
d=open(EXE,"rb").read()
def u16(b,o): return struct.unpack_from("<H",b,o)[0]
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
base=hdr*16; exesz=(cnt-1)*512+pp; img=d[base:base+exesz-base]
MON={0x1AC+i*2:n for i,n in enumerate("MAXE JAMNIK OWCZAREK SPANIEL PUDEL PIESEK TAKSOWKARZ SPRZEDAWCA ZAMIATACZ PIJAK ZEBRAK MINIBARMAN GRUBAS DJ PEDAL PARA MACIEK OGOL DRZWI STARUCH SILNY".split())}
prz="MMIECZ MIECHO2 PRZED MTARCZA SERCE DYPLOM FAJKA MAD SIL ZRE MBUTELKA PRA MAXMAD MAXSIL MAXZRE ENERGIA FUKS PACZEK CIASTKO SUCHA CHLEB BULKA WEKA MANA MAXMANA WROGEN TEST1 MINIKUNSZT WROGSIL WROGZRE ON TY SZANSA WPYSK PRO ILOSC PAR KOP KOPM KOPHP ZWIEJ WIMP PASZOL KUNSZT MIECHO ARENA".split()
PRZ={0x17E+2*i:n for i,n in enumerate(reversed(prz))}
def name(w):
    if w in MON: return "MONSTRA."+MON[w]
    if w in PRZ: return "PRZEDM."+PRZ[w]
    return None
from capstone import Cs,CS_ARCH_X86,CS_MODE_16
md=Cs(CS_ARCH_X86,CS_MODE_16); md.skipdata=True; md.detail=True
def emit(P,title):
    out=[""]
    out.append("{ "+title+" }")
    for ins in md.disasm(bytes(img[P:P+0x5000]),P):
        a=ins.address; com=""
        mm=re.match(r"word ptr \[0x([0-9A-F]+)\]",ins.op_str)
        mmb=re.match(r"byte ptr \[0x([0-9A-F]+)\]",ins.op_str)
        g=mm or mmb
        if g:
            w=int(g.group(1),16); nm=name(w)
            if nm: com="   // "+nm
        out.append("  {%05X}  %-8s %-28s%s"%(a,ins.mnemonic,ins.op_str,com))
    return out
procA=0x0E42*16+0x9A57
procB=0x05DD*16+0x1C71
L=["// BOMBKI-body.pas -- reconstructed game proc bodies (EXE image)",
   "// DGROUP anchors: MONSTRA @0x1AC (21 ints), PRZEDM @~0x17E.",
   "// Comments resolve memory operands to interface globals."]
L+=emit(procA,"BODY-A  para 0E42:9A57  (MONSTRA/room logic)   abs=%05X"%procA)
L+=emit(procB,"BODY-B  para 05DD:1C71  (PRZEDM interaction)   abs=%05X"%procB)
with open(OUT,"wb") as f:
    f.write(("\r\n".join(L)+"\r\n").encode("cp437","replace"))
res=[l for l in L if "MONSTRA." in l or "PRZEDM." in l]
print("-> BOMBKI-body.pas (%d lines), name-resolved lines: %d"%(len(L),len(res)))
for s in res[:10]: print("  ",s.strip()[:78])

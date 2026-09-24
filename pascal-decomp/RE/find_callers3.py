import struct,sys,re
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
d=open(r"E:\Develop\Reverse\bombki\BOMBKI.EXE","rb").read()
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
img=d[hdr*16:]
# correct mapping: img_offset = seg*16 + ofs ; 0E42 base = 0x0E420
rout_ofs=0x16E76-0x0E420
print("combat entry = 0E42:%04X" % rout_ofs)
pat=bytes([0x9A,rout_ofs&0xFF,rout_ofs>>8,0x42,0x0E])
pos=0
while True:
    i=img.find(pat,pos)
    if i<0: break
    print("FAR CALL hit img 0x%04X" % i)
    pos=i+1
# also far call with a different instruction just before? find any lcall whose offset==rout_ofs
# near calls/jumps to 0x16E76
for op in (b"\xe8",b"\xe9"):
    for m in re.finditer(op,img):
        a=m.start(); rel=struct.unpack_from("<h",img,a+1)[0]
        if ((a+3+rel)&0xFFFF)==0x16E76:
            print("%s to 0x16E76 at %04X" % ("call" if op==b"\xe8" else "jmp", a))
# stores to the monster stat words: all register forms + c7
def find_stores(word):
    out=[]
    p=0
    pat=struct.pack("<H",word)
    while True:
        p=img.find(pat,p)
        if p<0: break
        if p>=2 and img[p-2] in (0xA3,0x89,0xC7,0x83,0xFF,0x01,0x29,0x8B,0x3B,0x2B,0x03):
            out.append(p-2)
        p+=2
    return out
for w in (0x1b0,0x1b6,0x1b8,0x1b2,0x1ba,0x1bc):
    print("refs 0x%03X:"%w, ["%04X"%x for x in find_stores(w)])
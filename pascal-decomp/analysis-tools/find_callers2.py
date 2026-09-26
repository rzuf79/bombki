import struct,sys,re
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
d=open(r"E:\Develop\Reverse\bombki\BOMBKI.EXE","rb").read()
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
base=hdr*16
img=d[base:]
# find all near call instructions whose target == 0x16E76 inside the whole image
tgt=0x16E76
hits=[]
for m in re.finditer(b"\xe8", img):
    a=m.start()
    rel=struct.unpack_from("<h",img,a+1)[0]
    dest=(a+3+rel)&0xFFFF
    if dest==tgt:
        hits.append(a)
print("near calls to 0x16E76:", ["%04X"%x for x in hits])
# also check near jmp
for m in re.finditer(b"\xe9", img):
    a=m.start()
    rel=struct.unpack_from("<h",img,a+1)[0]
    dest=(a+3+rel)&0xFFFF
    if dest==tgt:
        print("near jmp to 0x16E76: %04X" % a)
# stores to [0x1b6] / [0x1b8] (a3 = mov [imm16],ax ; 89 06 = mov [imm16],ax ; c7 06)
def find_stores(word):
    out=[]
    p=0
    while True:
        p=img.find(struct.pack("<H",word),p)
        if p<0: break
        # look backwards for a store opcode: a3 (mov m16,ax), 89 06 (mov m16,ax), 8b/8d regs, c7 06, 83 06, ff 06
        if p>=2:
            b=img[p-2]
            if b==0xA3 or (b==0x06 and img[p-3]==0x89) or (b==0x06 and img[p-3]==0xC7) or (b==0x06 and img[p-3]==0xFF) or (b==0x06 and img[p-3]==0x83) or (b==0x06 and img[p-3]==0x01):
                out.append(p-2)
        p+=2
    return out
print("stores near 0x1b0:",["%04X"%x for x in find_stores(0x1b0)])
print("stores near 0x1b6:",["%04X"%x for x in find_stores(0x1b6)])
print("stores near 0x1b8:",["%04X"%x for x in find_stores(0x1b8)])
print("stores near 0x1b2:",["%04X"%x for x in find_stores(0x1b2)])
import struct,sys
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
d=open(r"E:\Develop\Reverse\bombki\BOMBKI.EXE","rb").read()
(hdr,)=struct.unpack_from("<H",d,8)
img=d[hdr*16:]
# list interesting transform idioms: sar ax then sub 0x28 ; add 0x17 ; sub 0x18 ; add 0x0c ; shl/shr patterns
pats=[("d1 f8 d1 f8 2d 28 00","Energy load v/4-40"),
      ("83 c0 17 99","lvl v+0x17"),
      ("2d 18 00","sub 0x18 (sila)"),
      ("83 c0 0c","add 0xc (zrec)"),
      ("d1 f8 d1 f8 83 e8","energy v/4-64 alt"),
      ("d1 e0 d1 e0","shl 2 (save mana*4)")]
for hx,name in pats:
    p=bytes.fromhex(hx); r=[]; st=0
    while True:
        i=img.find(p,st)
        if i<0: break
        r.append(i); st=i+1
    print(name,"@",["%04X"%i for i in r][:40],len(r))
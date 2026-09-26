import struct,sys
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
d=open(r"E:\Develop\Reverse\bombki\BOMBKI.EXE","rb").read()
(hdr,)=struct.unpack_from("<H",d,8)
img=d[hdr*16:]
pats=[("d1 f8 d1 f8 83 e8 28","Energy E=(v/4)-40 two-sar"),
      ("d1 f8 d1 f8 83 e8","E two-sar then sub-ish"),
      ("83 e8 28","sub ax,0x28"),
      ("83 e8 17","sub ax,0x17 (lvl)"),
      ("83 e8 0c","sub ax,0x0c (zrec)"),
      ("83 c0 18","add ax,0x18 (sila)"),
      ("b1 02 d3 f8","sar ax,cl(2)"),
      ("6a 00 50 e8","signed div by const via call?")]
for hx,name in pats:
    p=bytes.fromhex(hx); r=[]; st=0
    while True:
        i=img.find(p,st)
        if i<0: break
        r.append(i); st=i+1
    print("%-30s @ %s  n=%d"%(name,",".join("%04X"%i for i in r[:40]),len(r)))
import struct,sys
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
d=open(r"E:\Develop\Reverse\bombki\BOMBKI.EXE","rb").read()
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
img=d[hdr*16:]
# combat routine entry: img 0x16E76 in para 0E42 (seg base img 0x13700) => ofs 0x3776
rout_ofs=0x16E76-0x13700
print("routine seg:ofs = 0E42:%04X" % rout_ofs)
pat=bytes([0x9A, rout_ofs&0xFF, rout_ofs>>8, 0x42, 0x0E])
print("searching for",pat.hex())
pos=0; base_off=hdr*16
while True:
    i=img.find(pat,pos)
    if i<0: break
    print("hit img 0x%04X (file 0x%06X)" % (i, base_off+i))
    pos=i+1
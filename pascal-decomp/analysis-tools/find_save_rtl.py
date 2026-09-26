import struct,sys
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
from capstone import *
d=open(r"E:\Develop\Reverse\bombki\BOMBKI.EXE","rb").read()
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
img=d[hdr*16:]
# find lcall to ReadLn-style-ish RTL used by save: 9a 00 09 71 1c (lcall 0x900)
pat=bytes.fromhex("9a 00 09 71 1c")
idx=[]
start=0
while True:
    i=img.find(pat,start)
    if i<0: break
    idx.append(i); start=i+1
print("lcall 0x900 at:", ["%04X"%i for i in idx] if idx else "none")
# also lcall 0xe6 / 0x369 (file?) and 0x129d:0x9263 (rewrite/reset?) nearest save()
for pat_hex,name in (("9a 63 92 9d 12","lcall129d:0x9263"),
                     ("9a e6 02 71 1c","lcall0x2e6"),
                     ("9a 69 03 71 1c","lcall0x369")):
    p=bytes.fromhex(pat_hex); r=[]; st=0
    while True:
        i=img.find(p,st)
        if i<0: break
        r.append(i); st=i+1
    print(name,[ "%04X"%i for i in r][:40])
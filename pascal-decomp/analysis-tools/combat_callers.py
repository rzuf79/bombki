import struct,sys,re
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
d=open(r"E:\Develop\Reverse\bombki\BOMBKI.EXE","rb").read()
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
img=d[hdr*16:]
# far form: lcall 129D:44A6 => 9A A6 44 9D 12
pat=bytes.fromhex("9aa6449d12")
pos=0; far=[]; 
while True:
    i=img.find(pat,pos)
    if i<0: break
    far.append(i); pos=i+1
print("far lcall 129D:44A6:",["%04X"%x for x in far])
# near thunk: push cs (0E) + E8 rel16 targeting 0x16E76
near=[]; p=0
while True:
    p=img.find(b"\x0e\xe8",p)
    if p<0: break
    a=p+1; rel=struct.unpack_from("<h",img,a+1)[0]
    if ((a+3+rel)&0xFFFF)==0x16E76: near.append(p)
    p+=2
print("push-cs near-call thunks to combat:",["%04X"%x for x in near])
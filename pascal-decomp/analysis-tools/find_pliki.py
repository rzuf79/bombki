import struct,sys
sys.stdout.reconfigure(encoding="utf-8",errors="replace")
d=open(r"E:\Develop\Reverse\bombki\BOMBKI.EXE","rb").read()
(mag,pp,cnt,rels,hdr,m1,m2,ss,sp,ip,tab,ovl)=struct.unpack_from("<12H",d,0)
img=d[hdr*16:]
def pstr(p):
    if p<0 or p>=len(img): return None
    n=img[p]
    if not (1<=n<=160) or p+1+n>len(img): return None
    try: return img[p+1:p+1+n].decode("cp437")
    except: return None
import re
# all pascal strings containing 'pliki','save','wczyt','PLIKI','.tpu','gr'
hits=[]
for m in re.finditer(rb'[\x01-\x7f]',img):
    pass
# simple scan: candidate length byte then letters
i=1
while i<len(img)-4:
    n=img[i]
    if 3<=n<=90:
        try:
            s=bytes(img[i+1:i+1+n]).decode("cp437")
        except: i+=1; continue
        low=s.lower()
        if any(k in low for k in ("pliki",".tpu","zapis","wczytaj","gry/bombki","gry\\bombki")):
            hits.append((i,s))
        i+=n+2
    else: i+=1
for p,s in hits[:80]:
    print("%05X  %r"%(p,s))
print("total",len(hits))
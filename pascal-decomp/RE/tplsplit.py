#!/usr/bin/env python3
"""Split a Turbo Pascal 7 library file (TURBO.TPL) into its component .TPU units."""
import struct, sys, os

def u16(b,o): return struct.unpack_from('<H',b,o)[0]
def pstr(b,o):
    n=b[o]; return b[o+1:o+1+n].decode('cp437','replace'), o+1+n

def rnd(n): return 16*((n+15)//16)

def main():
    if len(sys.argv)<3:
        print('usage: tplsplit.py <lib.tpl> <outdir>'); return
    src=sys.argv[1]; outdir=sys.argv[2]
    os.makedirs(outdir, exist_ok=True)
    d=open(src,'rb').read()
    total=0; idx=0
    while True:
        if total+96>len(d): break
        if d[total:total+4]!=b'TPUQ':
            print('no TPUQ header at %d'%total); break
        otu=u16(d,total+8)  # ofs_this_unit
        name,ne=pstr(d,total+otu+3)
        sym=u16(d,total+30); br=u16(d,total+32); code=u16(d,total+34)
        con=u16(d,total+36); rel=u16(d,total+38); crl=u16(d,total+40)
        data=d[total:total+sym]
        fn=os.path.join(outdir, name.upper()+'.TPU')
        open(fn,'wb').write(data)
        print('%2d %-12s sym=%6d code=%6d const=%6d reloc=%6d'%(idx,name,sym,code,con,rel))
        total+=rnd(sym)+rnd(br)+rnd(code)+rnd(rel)+rnd(con)+rnd(crl)
        idx+=1
    print('total %d / %d'%(total,len(d)))

if __name__=='__main__':
    main()
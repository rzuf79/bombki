import tpuq, struct
t=tpuq.Tpu(r"E:\Develop\Reverse\bombki\MONSTRA.TPU"); t.load()
codeblob=open(r"E:\Develop\Reverse\bombki\analysis-results\tpu_reports\MONSTRA.code.bin",'rb').read()
out=[]
out.append('relocs: (unit_num, my_rtype_byte, word1, word2, word3) | blob[cell:cell+4] | blob[?]')
for r in t.relocs[:60]:
    u,ty,w1,w2,w3=r
    # try: cell = w1? w2? w3?
    cands={}
    for nm,v in (('w1',w1),('w2',w2),('w3',w3)):
        if v<len(codeblob):
            cands[nm]='%s:U+%04X=%s'%(nm,v,codeblob[v:v+4].hex())
    out.append('  unit=%02X ty=%02X w1=%04X w2=%04X w3=%04X  cand: %s'%(u,ty,w1,w2,w3,'; '.join(cands.values()) or 'none<1195'))
open(r"E:\Develop\Reverse\bombki\analysis-results\relocdump\monstra.relocs.txt",'w').write('\n'.join(out))
print('wrote', len(out), 'lines')

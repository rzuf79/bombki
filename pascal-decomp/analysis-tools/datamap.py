import os, csv, glob, re
import stat
rep=r"E:\Develop\Reverse\bombki\analysis-results\tpu_reports"
units=["MONSTRA","SWIAT","PRZEDM"]
allvars=[]
for u in units:
    p=os.path.join(rep,u+".symbols.csv")
    with open(p,encoding="cp1250") as f:
        for row in csv.reader(f):
            if len(row)>=7 and row[3]=="True" and "var" in row[5]:
                # idx,ofs,name,exported,kind,block+offset,type
                pass
    with open(p,encoding="cp1250") as f:
        for row in csv.reader(f):
            if len(row)>=8 and row[4]=="var":
                name=row[2]
                blk=int(row[5].split("=")[1],16) if "block=" in row[5] else 0
                off=row[6]
                # normalise offset hex
                try: offv=int(off.split("=")[1],16)
                except Exception: offv=int(off,16)
                allvars.append((u,blk,offv,name,row[7]))
out=r"E:\Develop\Reverse\bombki\analysis-results\disasm\procs\DATA-MAP.txt"
with open(out,"w",encoding="cp1250") as f:
    f.write("; unit  block  +ofs  name                type\n")
    for u,b,o,n,t in sorted(allvars,key=lambda x:(x[0],x[1],x[2])):
        f.write("%-8s %04X   %04X  %-20s %s\n"%(u,b,o,n,t))
print("vars mapped:",len(allvars)," -> DATA-MAP.txt")
with open(out,encoding="cp1250") as f:
    print(f.read()[:600])

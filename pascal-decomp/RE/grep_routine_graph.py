import io,re,json
p=io.open(r"help-you-need\docs\routine_call_graph.json","r",encoding="utf-8")
data=json.load(p)
for k,v in data.items():
    s=v.get("strings")
    if s and any("pliki" in x or "PLIKI" in x or "suckemall" in x for x in s if isinstance(x,str)):
        print("KEY",k,"size",v.get("size"))
        # print calls_out
        for c in v.get("calls_out",[]):
            print("   call",c)
# find node whose key maps to save(): 0x2BA1 img -> the counterpart seg
# Also print all candidate keys with size>0x200 (big procs)
big=[(k,v.get("size")) for k,v in data.items() if isinstance(v.get("size"),int) and v.get("size",0)>0x200]
print("big procs:",[(k,s) for k,s in sorted(big,key=lambda x:-x[1])][:40])
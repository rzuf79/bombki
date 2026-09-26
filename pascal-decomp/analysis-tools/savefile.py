vals=open(r"E:\Develop\Reverse\bombki\PLIKI.TPU","rb").read().decode("cp437","replace").split()
print("=== PLIKI.TPU numbered (80) ===")
for i,v in enumerate(vals):
    print("%3d: %s"%(i+1,v))

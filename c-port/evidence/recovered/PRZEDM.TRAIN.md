# `PRZEDM.TRAIN`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:166-189`
- TPU code block: `0x0010`
- Procedure bytes: `0x00e3`–`0x02a4`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.MAD`
- `PRZEDM.MAXMAD`
- `PRZEDM.MAXSIL`
- `PRZEDM.MAXZRE`
- `PRZEDM.PRA`
- `PRZEDM.SIL`
- `PRZEDM.ZRE`
- `PRZEDM.wpisz`
- `System.OUTPUT`

## Calls

- `System.CompareString`
- `System.WriteInteger`
- `System.WriteLn`
- `System.WriteString`
- `System.entry_0x0190`
- `System.entry_0x01a0`

## Exact strings

- `"TRENUJ"`
- `"CO CHCESZ TRENOWAC?"`
- `"TRENUJ SILA"`
- `"TRENUJESZ SILE I MASZ "`
- `" SILY I ZOSTALO CI "`
- `" PRAKTYK"`
- `"TRENUJ ZRECZNOSC"`
- `"TRENUJESZ ZRECZNOSC I MASZ "`
- `" ZRECZNOSCI I ZOSTALO CI "`
- `"TRENUJ MADROSC"`
- `"TRENUJESZ MADROSC I MASZ "`
- `" MADROSCI I ZOSTALO CI "`

## Annotated listing

```asm
; PRZEDM.PAS:166
00e3  55                   push bp                           
00e4  89e5                 mov bp, sp                        
00e6  31c0                 xor ax, ax                        
00e8  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:167
00ed  bf0000               mov di, 0                          ; data PRZEDM.wpisz
00f0  1e                   push ds                           
00f1  57                   push di                           
00f2  bf0000               mov di, 0                          ; string "TRENUJ"
00f5  0e                   push cs                           
00f6  57                   push di                           
00f7  9a00000000           lcall 0, 0                         ; call System.CompareString
00fc  751c                 jne 0x11a                         
00fe  bf0000               mov di, 0                          ; data System.OUTPUT
0101  1e                   push ds                           
0102  57                   push di                           
0103  bf0000               mov di, 0                          ; string "CO CHCESZ TRENOWAC?"
0106  0e                   push cs                           
0107  57                   push di                           
0108  31c0                 xor ax, ax                        
010a  50                   push ax                           
010b  9a00000000           lcall 0, 0                         ; call System.WriteString
0110  9a00000000           lcall 0, 0                         ; call System.WriteLn
0115  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:168
011a  bf0000               mov di, 0                          ; data PRZEDM.wpisz
011d  1e                   push ds                           
011e  57                   push di                           
011f  bf0000               mov di, 0                          ; string "TRENUJ SILA"
0122  0e                   push cs                           
0123  57                   push di                           
0124  9a00000000           lcall 0, 0                         ; call System.CompareString
0129  7572                 jne 0x19d                         
; PRZEDM.PAS:169
012b  833e000002           cmp word ptr [0], 2                ; data PRZEDM.PRA
0130  7e6b                 jle 0x19d                         
0132  a10000               mov ax, word ptr [0]               ; data PRZEDM.SIL
0135  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MAXSIL
0139  7d62                 jge 0x19d                         
; PRZEDM.PAS:170
013b  a10000               mov ax, word ptr [0]               ; data PRZEDM.SIL
013e  40                   inc ax                            
013f  a30000               mov word ptr [0], ax               ; data PRZEDM.SIL
; PRZEDM.PAS:171
0142  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRA
0145  2d0300               sub ax, 3                         
0148  a30000               mov word ptr [0], ax               ; data PRZEDM.PRA
; PRZEDM.PAS:172
014b  bf0000               mov di, 0                          ; data System.OUTPUT
014e  1e                   push ds                           
014f  57                   push di                           
0150  bf0000               mov di, 0                          ; string "TRENUJESZ SILE I MASZ "
0153  0e                   push cs                           
0154  57                   push di                           
0155  31c0                 xor ax, ax                        
0157  50                   push ax                           
0158  9a00000000           lcall 0, 0                         ; call System.WriteString
015d  a10000               mov ax, word ptr [0]               ; data PRZEDM.SIL
0160  99                   cwd                               
0161  52                   push dx                           
0162  50                   push ax                           
0163  31c0                 xor ax, ax                        
0165  50                   push ax                           
0166  9a00000000           lcall 0, 0                         ; call System.WriteInteger
016b  bf0000               mov di, 0                          ; string " SILY I ZOSTALO CI "
016e  0e                   push cs                           
016f  57                   push di                           
0170  31c0                 xor ax, ax                        
0172  50                   push ax                           
0173  9a00000000           lcall 0, 0                         ; call System.WriteString
0178  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRA
017b  99                   cwd                               
017c  52                   push dx                           
017d  50                   push ax                           
017e  31c0                 xor ax, ax                        
0180  50                   push ax                           
0181  9a00000000           lcall 0, 0                         ; call System.WriteInteger
0186  bf0000               mov di, 0                          ; string " PRAKTYK"
0189  0e                   push cs                           
018a  57                   push di                           
018b  31c0                 xor ax, ax                        
018d  50                   push ax                           
018e  9a00000000           lcall 0, 0                         ; call System.WriteString
0193  9a00000000           lcall 0, 0                         ; call System.WriteLn
0198  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:175
019d  bf0000               mov di, 0                          ; data PRZEDM.wpisz
01a0  1e                   push ds                           
01a1  57                   push di                           
01a2  bf0000               mov di, 0                          ; string "TRENUJ ZRECZNOSC"
01a5  0e                   push cs                           
01a6  57                   push di                           
01a7  9a00000000           lcall 0, 0                         ; call System.CompareString
01ac  7571                 jne 0x21f                         
; PRZEDM.PAS:176
01ae  833e000001           cmp word ptr [0], 1                ; data PRZEDM.PRA
01b3  7e6a                 jle 0x21f                         
01b5  a10000               mov ax, word ptr [0]               ; data PRZEDM.ZRE
01b8  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MAXZRE
01bc  7d61                 jge 0x21f                         
; PRZEDM.PAS:177
01be  a10000               mov ax, word ptr [0]               ; data PRZEDM.ZRE
01c1  40                   inc ax                            
01c2  a30000               mov word ptr [0], ax               ; data PRZEDM.ZRE
; PRZEDM.PAS:178
01c5  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRA
01c8  48                   dec ax                            
01c9  48                   dec ax                            
01ca  a30000               mov word ptr [0], ax               ; data PRZEDM.PRA
; PRZEDM.PAS:179
01cd  bf0000               mov di, 0                          ; data System.OUTPUT
01d0  1e                   push ds                           
01d1  57                   push di                           
01d2  bf0000               mov di, 0                          ; string "TRENUJESZ ZRECZNOSC I MASZ "
01d5  0e                   push cs                           
01d6  57                   push di                           
01d7  31c0                 xor ax, ax                        
01d9  50                   push ax                           
01da  9a00000000           lcall 0, 0                         ; call System.WriteString
01df  a10000               mov ax, word ptr [0]               ; data PRZEDM.ZRE
01e2  99                   cwd                               
01e3  52                   push dx                           
01e4  50                   push ax                           
01e5  31c0                 xor ax, ax                        
01e7  50                   push ax                           
01e8  9a00000000           lcall 0, 0                         ; call System.WriteInteger
01ed  bf0000               mov di, 0                          ; string " ZRECZNOSCI I ZOSTALO CI "
01f0  0e                   push cs                           
01f1  57                   push di                           
01f2  31c0                 xor ax, ax                        
01f4  50                   push ax                           
01f5  9a00000000           lcall 0, 0                         ; call System.WriteString
01fa  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRA
01fd  99                   cwd                               
01fe  52                   push dx                           
01ff  50                   push ax                           
0200  31c0                 xor ax, ax                        
0202  50                   push ax                           
0203  9a00000000           lcall 0, 0                         ; call System.WriteInteger
0208  bf0000               mov di, 0                          ; string " PRAKTYK"
020b  0e                   push cs                           
020c  57                   push di                           
020d  31c0                 xor ax, ax                        
020f  50                   push ax                           
0210  9a00000000           lcall 0, 0                         ; call System.WriteString
0215  9a00000000           lcall 0, 0                         ; call System.WriteLn
021a  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:182
021f  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0222  1e                   push ds                           
0223  57                   push di                           
0224  bf0000               mov di, 0                          ; string "TRENUJ MADROSC"
0227  0e                   push cs                           
0228  57                   push di                           
0229  9a00000000           lcall 0, 0                         ; call System.CompareString
022e  7572                 jne 0x2a2                         
; PRZEDM.PAS:183
0230  833e000002           cmp word ptr [0], 2                ; data PRZEDM.PRA
0235  7e6b                 jle 0x2a2                         
0237  a10000               mov ax, word ptr [0]               ; data PRZEDM.MAD
023a  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MAXMAD
023e  7d62                 jge 0x2a2                         
; PRZEDM.PAS:184
0240  a10000               mov ax, word ptr [0]               ; data PRZEDM.MAD
0243  40                   inc ax                            
0244  a30000               mov word ptr [0], ax               ; data PRZEDM.MAD
; PRZEDM.PAS:185
0247  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRA
024a  2d0300               sub ax, 3                         
024d  a30000               mov word ptr [0], ax               ; data PRZEDM.PRA
; PRZEDM.PAS:186
0250  bf0000               mov di, 0                          ; data System.OUTPUT
0253  1e                   push ds                           
0254  57                   push di                           
0255  bf0000               mov di, 0                          ; string "TRENUJESZ MADROSC I MASZ "
0258  0e                   push cs                           
0259  57                   push di                           
025a  31c0                 xor ax, ax                        
025c  50                   push ax                           
025d  9a00000000           lcall 0, 0                         ; call System.WriteString
0262  a10000               mov ax, word ptr [0]               ; data PRZEDM.MAD
0265  99                   cwd                               
0266  52                   push dx                           
0267  50                   push ax                           
0268  31c0                 xor ax, ax                        
026a  50                   push ax                           
026b  9a00000000           lcall 0, 0                         ; call System.WriteInteger
0270  bf0000               mov di, 0                          ; string " MADROSCI I ZOSTALO CI "
0273  0e                   push cs                           
0274  57                   push di                           
0275  31c0                 xor ax, ax                        
0277  50                   push ax                           
0278  9a00000000           lcall 0, 0                         ; call System.WriteString
027d  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRA
0280  99                   cwd                               
0281  52                   push dx                           
0282  50                   push ax                           
0283  31c0                 xor ax, ax                        
0285  50                   push ax                           
0286  9a00000000           lcall 0, 0                         ; call System.WriteInteger
028b  bf0000               mov di, 0                          ; string " PRAKTYK"
028e  0e                   push cs                           
028f  57                   push di                           
0290  31c0                 xor ax, ax                        
0292  50                   push ax                           
0293  9a00000000           lcall 0, 0                         ; call System.WriteString
0298  9a00000000           lcall 0, 0                         ; call System.WriteLn
029d  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:189
02a2  5d                   pop bp                            
02a3  cb                   retf                              
```

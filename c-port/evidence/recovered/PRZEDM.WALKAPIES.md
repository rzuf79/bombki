# `PRZEDM.WALKAPIES`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:54-67`
- TPU code block: `0x0000`
- Procedure bytes: `0x0046`–`0x00fa`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.CZY`
- `PRZEDM.FORSA`
- `PRZEDM.FUKS`
- `PRZEDM.MIECHO`
- `PRZEDM.SERCE`
- `PRZEDM.WROGEN`
- `PRZEDM.WROGSIL`
- `PRZEDM.WROGZRE`
- `PRZEDM:0x0038+0x0002`
- `System.OUTPUT`

## Calls

- `PRZEDM.WALKA`
- `System.Random`
- `System.WriteInteger`
- `System.WriteLn`
- `System.WriteString`
- `System.entry_0x0190`
- `System.entry_0x01a0`

## Exact strings

- `"WYCIAGASZ "`
- `" MONET Z CIALA PSA"`
- `"WYCIAGASZ ZAKRWAWIONE SERCE Z CIALA PSA"`

## Annotated listing

```asm
; PRZEDM.PAS:54
0046  55                   push bp                           
0047  89e5                 mov bp, sp                        
0049  31c0                 xor ax, ax                        
004b  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:55
0050  c70600000a00         mov word ptr [0], 0xa              ; data PRZEDM.WROGEN
; PRZEDM.PAS:56
0056  c70600000a00         mov word ptr [0], 0xa              ; data PRZEDM.WROGZRE
; PRZEDM.PAS:57
005c  c70600000500         mov word ptr [0], 5                ; data PRZEDM.WROGSIL
; PRZEDM.PAS:58
0062  0e                   push cs                           
0063  e80000               call 0x66                          ; call PRZEDM.WALKA
; PRZEDM.PAS:59
0066  b80f00               mov ax, 0xf                       
0069  50                   push ax                           
006a  9a00000000           lcall 0, 0                         ; call System.Random
006f  a30000               mov word ptr [0], ax               ; data PRZEDM.CZY
; PRZEDM.PAS:60
0072  bf0000               mov di, 0                          ; data System.OUTPUT
0075  1e                   push ds                           
0076  57                   push di                           
0077  bf0000               mov di, 0                          ; string "WYCIAGASZ "
007a  0e                   push cs                           
007b  57                   push di                           
007c  31c0                 xor ax, ax                        
007e  50                   push ax                           
007f  9a00000000           lcall 0, 0                         ; call System.WriteString
0084  a10000               mov ax, word ptr [0]               ; data PRZEDM.CZY
0087  99                   cwd                               
0088  52                   push dx                           
0089  50                   push ax                           
008a  31c0                 xor ax, ax                        
008c  50                   push ax                           
008d  9a00000000           lcall 0, 0                         ; call System.WriteInteger
0092  bf0000               mov di, 0                          ; string " MONET Z CIALA PSA"
0095  0e                   push cs                           
0096  57                   push di                           
0097  31c0                 xor ax, ax                        
0099  50                   push ax                           
009a  9a00000000           lcall 0, 0                         ; call System.WriteString
009f  9a00000000           lcall 0, 0                         ; call System.WriteLn
00a4  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:61
00a9  a10000               mov ax, word ptr [0]               ; data PRZEDM.CZY
00ac  99                   cwd                               
00ad  03060000             add ax, word ptr [0]               ; data PRZEDM.FORSA
00b1  13160000             adc dx, word ptr [0]               ; data PRZEDM:0x0038+0x0002
00b5  a30000               mov word ptr [0], ax               ; data PRZEDM.FORSA
00b8  89160000             mov word ptr [0], dx               ; data PRZEDM:0x0038+0x0002
; PRZEDM.PAS:62
00bc  833e000000           cmp word ptr [0], 0                ; data PRZEDM.SERCE
00c1  7535                 jne 0xf8                          
; PRZEDM.PAS:63
00c3  b81400               mov ax, 0x14                      
00c6  50                   push ax                           
00c7  9a00000000           lcall 0, 0                         ; call System.Random
00cc  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:64
00cf  833e000005           cmp word ptr [0], 5                ; data PRZEDM.FUKS
00d4  7d22                 jge 0xf8                          
00d6  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
00d9  a30000               mov word ptr [0], ax               ; data PRZEDM.SERCE
00dc  bf0000               mov di, 0                          ; data System.OUTPUT
00df  1e                   push ds                           
00e0  57                   push di                           
00e1  bf0000               mov di, 0                          ; string "WYCIAGASZ ZAKRWAWIONE SERCE Z CIALA PSA"
00e4  0e                   push cs                           
00e5  57                   push di                           
00e6  31c0                 xor ax, ax                        
00e8  50                   push ax                           
00e9  9a00000000           lcall 0, 0                         ; call System.WriteString
00ee  9a00000000           lcall 0, 0                         ; call System.WriteLn
00f3  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:67
00f8  5d                   pop bp                            
00f9  cb                   retf                              
```

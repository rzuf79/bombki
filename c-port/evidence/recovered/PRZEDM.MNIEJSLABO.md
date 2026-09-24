# `PRZEDM.MNIEJSLABO`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:245-263`
- TPU code block: `0x0030`
- Procedure bytes: `0x0038`–`0x0119`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.CZY`
- `PRZEDM.FORSA`
- `PRZEDM.FUKS`
- `PRZEDM.PASZOL`
- `PRZEDM.PRZED`
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
- `" MONET Z CIALA"`
- `"WYCIAGASZ SERCE Z CIALA TRUPA"`

## Annotated listing

```asm
; PRZEDM.PAS:245
0038  55                   push bp                           
0039  89e5                 mov bp, sp                        
003b  31c0                 xor ax, ax                        
003d  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:246
0042  b80300               mov ax, 3                         
0045  50                   push ax                           
0046  9a00000000           lcall 0, 0                         ; call System.Random
004b  052200               add ax, 0x22                      
004e  a30000               mov word ptr [0], ax               ; data PRZEDM.WROGEN
; PRZEDM.PAS:247
0051  b80400               mov ax, 4                         
0054  50                   push ax                           
0055  9a00000000           lcall 0, 0                         ; call System.Random
005a  050800               add ax, 8                         
005d  a30000               mov word ptr [0], ax               ; data PRZEDM.WROGZRE
; PRZEDM.PAS:248
0060  c70600000a00         mov word ptr [0], 0xa              ; data PRZEDM.WROGSIL
; PRZEDM.PAS:249
0066  0e                   push cs                           
0067  e80000               call 0x6a                          ; call PRZEDM.WALKA
; PRZEDM.PAS:250
006a  833e000000           cmp word ptr [0], 0                ; data PRZEDM.PASZOL
006f  7403                 je 0x74                           
0071  e9a300               jmp 0x117                         
; PRZEDM.PAS:251
0074  b81500               mov ax, 0x15                      
0077  50                   push ax                           
0078  9a00000000           lcall 0, 0                         ; call System.Random
007d  050a00               add ax, 0xa                       
0080  a30000               mov word ptr [0], ax               ; data PRZEDM.CZY
; PRZEDM.PAS:252
0083  bf0000               mov di, 0                          ; data System.OUTPUT
0086  1e                   push ds                           
0087  57                   push di                           
0088  bf0000               mov di, 0                          ; string "WYCIAGASZ "
008b  0e                   push cs                           
008c  57                   push di                           
008d  31c0                 xor ax, ax                        
008f  50                   push ax                           
0090  9a00000000           lcall 0, 0                         ; call System.WriteString
0095  a10000               mov ax, word ptr [0]               ; data PRZEDM.CZY
0098  99                   cwd                               
0099  52                   push dx                           
009a  50                   push ax                           
009b  31c0                 xor ax, ax                        
009d  50                   push ax                           
009e  9a00000000           lcall 0, 0                         ; call System.WriteInteger
00a3  bf0000               mov di, 0                          ; string " MONET Z CIALA"
00a6  0e                   push cs                           
00a7  57                   push di                           
00a8  31c0                 xor ax, ax                        
00aa  50                   push ax                           
00ab  9a00000000           lcall 0, 0                         ; call System.WriteString
00b0  9a00000000           lcall 0, 0                         ; call System.WriteLn
00b5  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:253
00ba  a10000               mov ax, word ptr [0]               ; data PRZEDM.CZY
00bd  99                   cwd                               
00be  03060000             add ax, word ptr [0]               ; data PRZEDM.FORSA
00c2  13160000             adc dx, word ptr [0]               ; data PRZEDM:0x0038+0x0002
00c6  a30000               mov word ptr [0], ax               ; data PRZEDM.FORSA
00c9  89160000             mov word ptr [0], dx               ; data PRZEDM:0x0038+0x0002
; PRZEDM.PAS:254
00cd  833e000000           cmp word ptr [0], 0                ; data PRZEDM.SERCE
00d2  7543                 jne 0x117                         
; PRZEDM.PAS:255
00d4  b81400               mov ax, 0x14                      
00d7  50                   push ax                           
00d8  9a00000000           lcall 0, 0                         ; call System.Random
00dd  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:256
00e0  833e000005           cmp word ptr [0], 5                ; data PRZEDM.FUKS
00e5  7d30                 jge 0x117                         
00e7  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.SERCE
00ec  7429                 je 0x117                          
; PRZEDM.PAS:257
00ee  bf0000               mov di, 0                          ; data System.OUTPUT
00f1  1e                   push ds                           
00f2  57                   push di                           
00f3  bf0000               mov di, 0                          ; string "WYCIAGASZ SERCE Z CIALA TRUPA"
00f6  0e                   push cs                           
00f7  57                   push di                           
00f8  31c0                 xor ax, ax                        
00fa  50                   push ax                           
00fb  9a00000000           lcall 0, 0                         ; call System.WriteString
0100  9a00000000           lcall 0, 0                         ; call System.WriteLn
0105  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:258
010a  c7060000f6ff         mov word ptr [0], 0xfff6           ; data PRZEDM.SERCE
; PRZEDM.PAS:259
0110  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
0113  40                   inc ax                            
0114  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:263
0117  5d                   pop bp                            
0118  cb                   retf                              
```

# `PRZEDM.EASY`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:325-343`
- TPU code block: `0x0050`
- Procedure bytes: `0x0038`–`0x0123`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.CZY`
- `PRZEDM.ENERGIA`
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
; PRZEDM.PAS:325
0038  55                   push bp                           
0039  89e5                 mov bp, sp                        
003b  31c0                 xor ax, ax                        
003d  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:326
0042  b81400               mov ax, 0x14                      
0045  50                   push ax                           
0046  9a00000000           lcall 0, 0                         ; call System.Random
004b  056400               add ax, 0x64                      
004e  a30000               mov word ptr [0], ax               ; data PRZEDM.WROGEN
; PRZEDM.PAS:327
0051  c70600001000         mov word ptr [0], 0x10             ; data PRZEDM.WROGZRE
; PRZEDM.PAS:328
0057  b80200               mov ax, 2                         
005a  50                   push ax                           
005b  9a00000000           lcall 0, 0                         ; call System.Random
0060  051200               add ax, 0x12                      
0063  a30000               mov word ptr [0], ax               ; data PRZEDM.WROGSIL
; PRZEDM.PAS:329
0066  0e                   push cs                           
0067  e80000               call 0x6a                          ; call PRZEDM.WALKA
; PRZEDM.PAS:330
006a  833e000000           cmp word ptr [0], 0                ; data PRZEDM.PASZOL
006f  7403                 je 0x74                           
0071  e9ad00               jmp 0x121                         
0074  833e000000           cmp word ptr [0], 0                ; data PRZEDM.ENERGIA
0079  7f03                 jg 0x7e                           
007b  e9a300               jmp 0x121                         
; PRZEDM.PAS:331
007e  b81e00               mov ax, 0x1e                      
0081  50                   push ax                           
0082  9a00000000           lcall 0, 0                         ; call System.Random
0087  051e00               add ax, 0x1e                      
008a  a30000               mov word ptr [0], ax               ; data PRZEDM.CZY
; PRZEDM.PAS:332
008d  bf0000               mov di, 0                          ; data System.OUTPUT
0090  1e                   push ds                           
0091  57                   push di                           
0092  bf0000               mov di, 0                          ; string "WYCIAGASZ "
0095  0e                   push cs                           
0096  57                   push di                           
0097  31c0                 xor ax, ax                        
0099  50                   push ax                           
009a  9a00000000           lcall 0, 0                         ; call System.WriteString
009f  a10000               mov ax, word ptr [0]               ; data PRZEDM.CZY
00a2  99                   cwd                               
00a3  52                   push dx                           
00a4  50                   push ax                           
00a5  31c0                 xor ax, ax                        
00a7  50                   push ax                           
00a8  9a00000000           lcall 0, 0                         ; call System.WriteInteger
00ad  bf0000               mov di, 0                          ; string " MONET Z CIALA"
00b0  0e                   push cs                           
00b1  57                   push di                           
00b2  31c0                 xor ax, ax                        
00b4  50                   push ax                           
00b5  9a00000000           lcall 0, 0                         ; call System.WriteString
00ba  9a00000000           lcall 0, 0                         ; call System.WriteLn
00bf  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:333
00c4  a10000               mov ax, word ptr [0]               ; data PRZEDM.CZY
00c7  99                   cwd                               
00c8  03060000             add ax, word ptr [0]               ; data PRZEDM.FORSA
00cc  13160000             adc dx, word ptr [0]               ; data PRZEDM:0x0038+0x0002
00d0  a30000               mov word ptr [0], ax               ; data PRZEDM.FORSA
00d3  89160000             mov word ptr [0], dx               ; data PRZEDM:0x0038+0x0002
; PRZEDM.PAS:334
00d7  833e000000           cmp word ptr [0], 0                ; data PRZEDM.SERCE
00dc  7543                 jne 0x121                         
; PRZEDM.PAS:335
00de  b81400               mov ax, 0x14                      
00e1  50                   push ax                           
00e2  9a00000000           lcall 0, 0                         ; call System.Random
00e7  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:336
00ea  833e000004           cmp word ptr [0], 4                ; data PRZEDM.FUKS
00ef  7d30                 jge 0x121                         
00f1  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.SERCE
00f6  7429                 je 0x121                          
; PRZEDM.PAS:337
00f8  bf0000               mov di, 0                          ; data System.OUTPUT
00fb  1e                   push ds                           
00fc  57                   push di                           
00fd  bf0000               mov di, 0                          ; string "WYCIAGASZ SERCE Z CIALA TRUPA"
0100  0e                   push cs                           
0101  57                   push di                           
0102  31c0                 xor ax, ax                        
0104  50                   push ax                           
0105  9a00000000           lcall 0, 0                         ; call System.WriteString
010a  9a00000000           lcall 0, 0                         ; call System.WriteLn
010f  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:338
0114  c7060000f6ff         mov word ptr [0], 0xfff6           ; data PRZEDM.SERCE
; PRZEDM.PAS:339
011a  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
011d  40                   inc ax                            
011e  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:343
0121  5d                   pop bp                            
0122  cb                   retf                              
```

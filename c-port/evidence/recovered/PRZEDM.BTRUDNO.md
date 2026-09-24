# `PRZEDM.BTRUDNO`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:365-383`
- TPU code block: `0x0060`
- Procedure bytes: `0x0038`–`0x0122`
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
; PRZEDM.PAS:365
0038  55                   push bp                           
0039  89e5                 mov bp, sp                        
003b  31c0                 xor ax, ax                        
003d  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:366
0042  b80300               mov ax, 3                         
0045  50                   push ax                           
0046  9a00000000           lcall 0, 0                         ; call System.Random
004b  054800               add ax, 0x48                      
004e  a30000               mov word ptr [0], ax               ; data PRZEDM.WROGEN
; PRZEDM.PAS:367
0051  b80200               mov ax, 2                         
0054  50                   push ax                           
0055  9a00000000           lcall 0, 0                         ; call System.Random
005a  050d00               add ax, 0xd                       
005d  a30000               mov word ptr [0], ax               ; data PRZEDM.WROGZRE
; PRZEDM.PAS:368
0060  b80200               mov ax, 2                         
0063  50                   push ax                           
0064  9a00000000           lcall 0, 0                         ; call System.Random
0069  051000               add ax, 0x10                      
006c  a30000               mov word ptr [0], ax               ; data PRZEDM.WROGSIL
; PRZEDM.PAS:369
006f  0e                   push cs                           
0070  e80000               call 0x73                          ; call PRZEDM.WALKA
; PRZEDM.PAS:370
0073  833e000000           cmp word ptr [0], 0                ; data PRZEDM.PASZOL
0078  7403                 je 0x7d                           
007a  e9a300               jmp 0x120                         
; PRZEDM.PAS:371
007d  b83200               mov ax, 0x32                      
0080  50                   push ax                           
0081  9a00000000           lcall 0, 0                         ; call System.Random
0086  050f00               add ax, 0xf                       
0089  a30000               mov word ptr [0], ax               ; data PRZEDM.CZY
; PRZEDM.PAS:372
008c  bf0000               mov di, 0                          ; data System.OUTPUT
008f  1e                   push ds                           
0090  57                   push di                           
0091  bf0000               mov di, 0                          ; string "WYCIAGASZ "
0094  0e                   push cs                           
0095  57                   push di                           
0096  31c0                 xor ax, ax                        
0098  50                   push ax                           
0099  9a00000000           lcall 0, 0                         ; call System.WriteString
009e  a10000               mov ax, word ptr [0]               ; data PRZEDM.CZY
00a1  99                   cwd                               
00a2  52                   push dx                           
00a3  50                   push ax                           
00a4  31c0                 xor ax, ax                        
00a6  50                   push ax                           
00a7  9a00000000           lcall 0, 0                         ; call System.WriteInteger
00ac  bf0000               mov di, 0                          ; string " MONET Z CIALA"
00af  0e                   push cs                           
00b0  57                   push di                           
00b1  31c0                 xor ax, ax                        
00b3  50                   push ax                           
00b4  9a00000000           lcall 0, 0                         ; call System.WriteString
00b9  9a00000000           lcall 0, 0                         ; call System.WriteLn
00be  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:373
00c3  a10000               mov ax, word ptr [0]               ; data PRZEDM.CZY
00c6  99                   cwd                               
00c7  03060000             add ax, word ptr [0]               ; data PRZEDM.FORSA
00cb  13160000             adc dx, word ptr [0]               ; data PRZEDM:0x0038+0x0002
00cf  a30000               mov word ptr [0], ax               ; data PRZEDM.FORSA
00d2  89160000             mov word ptr [0], dx               ; data PRZEDM:0x0038+0x0002
; PRZEDM.PAS:374
00d6  833e000000           cmp word ptr [0], 0                ; data PRZEDM.SERCE
00db  7543                 jne 0x120                         
; PRZEDM.PAS:375
00dd  b81400               mov ax, 0x14                      
00e0  50                   push ax                           
00e1  9a00000000           lcall 0, 0                         ; call System.Random
00e6  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:376
00e9  833e000005           cmp word ptr [0], 5                ; data PRZEDM.FUKS
00ee  7d30                 jge 0x120                         
00f0  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.SERCE
00f5  7429                 je 0x120                          
; PRZEDM.PAS:377
00f7  bf0000               mov di, 0                          ; data System.OUTPUT
00fa  1e                   push ds                           
00fb  57                   push di                           
00fc  bf0000               mov di, 0                          ; string "WYCIAGASZ SERCE Z CIALA TRUPA"
00ff  0e                   push cs                           
0100  57                   push di                           
0101  31c0                 xor ax, ax                        
0103  50                   push ax                           
0104  9a00000000           lcall 0, 0                         ; call System.WriteString
0109  9a00000000           lcall 0, 0                         ; call System.WriteLn
010e  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:378
0113  c7060000f6ff         mov word ptr [0], 0xfff6           ; data PRZEDM.SERCE
; PRZEDM.PAS:379
0119  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
011c  40                   inc ax                            
011d  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:383
0120  5d                   pop bp                            
0121  cb                   retf                              
```

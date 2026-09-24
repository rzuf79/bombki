# `PRZEDM.TARCZA`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:601-608`
- TPU code block: `0x00c0`
- Procedure bytes: `0x0022`–`0x0090`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.FUKS`
- `PRZEDM.ILOSC`
- `PRZEDM.PRO`
- `PRZEDM.WPYSK`
- `System.OUTPUT`

## Calls

- `System.Random`
- `System.WriteInteger`
- `System.WriteLn`
- `System.WriteString`
- `System.entry_0x0190`
- `System.entry_0x01a0`

## Exact strings

- `"OSLONILES SIE ! TRACISZ "`
- `" ENERGII"`

## Annotated listing

```asm
; PRZEDM.PAS:601
0022  55                   push bp                           
0023  89e5                 mov bp, sp                        
0025  31c0                 xor ax, ax                        
0027  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:602
002c  b86400               mov ax, 0x64                      
002f  50                   push ax                           
0030  9a00000000           lcall 0, 0                         ; call System.Random
0035  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:603
0038  a10000               mov ax, word ptr [0]               ; data PRZEDM.FUKS
003b  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.PRO
003f  7f4d                 jg 0x8e                           
; PRZEDM.PAS:604
0041  a10000               mov ax, word ptr [0]               ; data PRZEDM.WPYSK
0044  2b060000             sub ax, word ptr [0]               ; data PRZEDM.ILOSC
0048  a30000               mov word ptr [0], ax               ; data PRZEDM.WPYSK
; PRZEDM.PAS:605
004b  833e000000           cmp word ptr [0], 0                ; data PRZEDM.WPYSK
0050  7d05                 jge 0x57                          
0052  31c0                 xor ax, ax                        
0054  a30000               mov word ptr [0], ax               ; data PRZEDM.WPYSK
; PRZEDM.PAS:606
0057  bf0000               mov di, 0                          ; data System.OUTPUT
005a  1e                   push ds                           
005b  57                   push di                           
005c  bf0000               mov di, 0                          ; string "OSLONILES SIE ! TRACISZ "
005f  0e                   push cs                           
0060  57                   push di                           
0061  31c0                 xor ax, ax                        
0063  50                   push ax                           
0064  9a00000000           lcall 0, 0                         ; call System.WriteString
0069  a10000               mov ax, word ptr [0]               ; data PRZEDM.WPYSK
006c  99                   cwd                               
006d  52                   push dx                           
006e  50                   push ax                           
006f  31c0                 xor ax, ax                        
0071  50                   push ax                           
0072  9a00000000           lcall 0, 0                         ; call System.WriteInteger
0077  bf0000               mov di, 0                          ; string " ENERGII"
007a  0e                   push cs                           
007b  57                   push di                           
007c  31c0                 xor ax, ax                        
007e  50                   push ax                           
007f  9a00000000           lcall 0, 0                         ; call System.WriteString
0084  9a00000000           lcall 0, 0                         ; call System.WriteLn
0089  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:608
008e  5d                   pop bp                            
008f  cb                   retf                              
```

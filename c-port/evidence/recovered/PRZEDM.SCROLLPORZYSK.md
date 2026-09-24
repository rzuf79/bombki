# `PRZEDM.SCROLLPORZYSK`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:533-540`
- TPU code block: `0x0098`
- Procedure bytes: `0x0034`–`0x0087`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.FUKS`
- `PRZEDM.MIECHO`
- `PRZEDM.PRZED`
- `PRZEDM.SCROLLPOR`
- `System.OUTPUT`

## Calls

- `System.Random`
- `System.WriteLn`
- `System.WriteString`
- `System.entry_0x0190`
- `System.entry_0x01a0`

## Exact strings

- `"WYCIAGASZ SCROLL POROWNANIA Z WROGIEJ TOBIE POSTACI"`

## Annotated listing

```asm
; PRZEDM.PAS:533
0034  55                   push bp                           
0035  89e5                 mov bp, sp                        
0037  31c0                 xor ax, ax                        
0039  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:534
003e  b86400               mov ax, 0x64                      
0041  50                   push ax                           
0042  9a00000000           lcall 0, 0                         ; call System.Random
0047  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:535
004a  833e00000a           cmp word ptr [0], 0xa              ; data PRZEDM.FUKS
004f  7d34                 jge 0x85                          
0051  813e00001027         cmp word ptr [0], 0x2710           ; data PRZEDM.MIECHO
0057  742c                 je 0x85                           
; PRZEDM.PAS:536
0059  bf0000               mov di, 0                          ; data System.OUTPUT
005c  1e                   push ds                           
005d  57                   push di                           
005e  bf0000               mov di, 0                          ; string "WYCIAGASZ SCROLL POROWNANIA Z WROGIEJ TOBIE POSTACI"
0061  0e                   push cs                           
0062  57                   push di                           
0063  31c0                 xor ax, ax                        
0065  50                   push ax                           
0066  9a00000000           lcall 0, 0                         ; call System.WriteString
006b  9a00000000           lcall 0, 0                         ; call System.WriteLn
0070  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:537
0075  a10000               mov ax, word ptr [0]               ; data PRZEDM.SCROLLPOR
0078  2d0a00               sub ax, 0xa                       
007b  a30000               mov word ptr [0], ax               ; data PRZEDM.SCROLLPOR
; PRZEDM.PAS:538
007e  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
0081  40                   inc ax                            
0082  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:540
0085  5d                   pop bp                            
0086  cb                   retf                              
```

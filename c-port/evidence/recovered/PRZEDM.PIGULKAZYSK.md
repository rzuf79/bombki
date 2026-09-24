# `PRZEDM.PIGULKAZYSK`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:500-507`
- TPU code block: `0x0080`
- Procedure bytes: `0x004e`–`0x009a`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.FUKS`
- `PRZEDM.PIGULKA`
- `PRZEDM.PRZED`
- `System.OUTPUT`

## Calls

- `System.Random`
- `System.WriteLn`
- `System.WriteString`
- `System.entry_0x0190`
- `System.entry_0x01a0`

## Exact strings

- `"HMMM , A TO CO ? , TOZ TO !!! PIGULKA TRANSPORTUJACA !!! PROSTO Z CIALA WROGA"`

## Annotated listing

```asm
; PRZEDM.PAS:500
004e  55                   push bp                           
004f  89e5                 mov bp, sp                        
0051  31c0                 xor ax, ax                        
0053  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:501
0058  b8e803               mov ax, 0x3e8                     
005b  50                   push ax                           
005c  9a00000000           lcall 0, 0                         ; call System.Random
0061  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:502
0064  833e00002a           cmp word ptr [0], 0x2a             ; data PRZEDM.FUKS
0069  7f2d                 jg 0x98                           
; PRZEDM.PAS:503
006b  bf0000               mov di, 0                          ; data System.OUTPUT
006e  1e                   push ds                           
006f  57                   push di                           
0070  bf0000               mov di, 0                          ; string "HMMM , A TO CO ? , TOZ TO !!! PIGULKA TRANSPORTUJACA !!! PROSTO Z CIALA WROGA"
0073  0e                   push cs                           
0074  57                   push di                           
0075  31c0                 xor ax, ax                        
0077  50                   push ax                           
0078  9a00000000           lcall 0, 0                         ; call System.WriteString
007d  9a00000000           lcall 0, 0                         ; call System.WriteLn
0082  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:504
0087  a00000               mov al, byte ptr [0]               ; data PRZEDM.PIGULKA
008a  98                   cbw                               
008b  2d0a00               sub ax, 0xa                       
008e  a20000               mov byte ptr [0], al               ; data PRZEDM.PIGULKA
; PRZEDM.PAS:505
0091  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
0094  40                   inc ax                            
0095  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:507
0098  5d                   pop bp                            
0099  cb                   retf                              
```

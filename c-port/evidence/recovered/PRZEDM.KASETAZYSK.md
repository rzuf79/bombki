# `PRZEDM.KASETAZYSK`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:509-520`
- TPU code block: `0x0088`
- Procedure bytes: `0x004e`–`0x00d6`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `MONSTRA.MAXE`
- `PRZEDM.FUKS`
- `PRZEDM.MIECHO`
- `PRZEDM.PRO`
- `PRZEDM.PRZED`
- `PRZEDM.ZRE`
- `PRZEDM.kaseta`
- `System.OUTPUT`

## Calls

- `System.Random`
- `System.WriteLn`
- `System.WriteString`
- `System.entry_0x0190`
- `System.entry_0x01a0`

## Exact strings

- `"WYCIAGASZ KASETE LIROYA Z CIALA BIEDNEGO CZLOWIEKA"`
- `"!!! PRZEDMIOT UNIQE 2% !!!"`

## Annotated listing

```asm
; PRZEDM.PAS:509
004e  55                   push bp                           
004f  89e5                 mov bp, sp                        
0051  31c0                 xor ax, ax                        
0053  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:510
0058  b86400               mov ax, 0x64                      
005b  50                   push ax                           
005c  9a00000000           lcall 0, 0                         ; call System.Random
0061  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:511
0064  833e000002           cmp word ptr [0], 2                ; data PRZEDM.FUKS
0069  7d69                 jge 0xd4                          
006b  813e00001027         cmp word ptr [0], 0x2710           ; data PRZEDM.MIECHO
0071  7461                 je 0xd4                           
; PRZEDM.PAS:512
0073  bf0000               mov di, 0                          ; data System.OUTPUT
0076  1e                   push ds                           
0077  57                   push di                           
0078  bf0000               mov di, 0                          ; string "WYCIAGASZ KASETE LIROYA Z CIALA BIEDNEGO CZLOWIEKA"
007b  0e                   push cs                           
007c  57                   push di                           
007d  31c0                 xor ax, ax                        
007f  50                   push ax                           
0080  9a00000000           lcall 0, 0                         ; call System.WriteString
0085  9a00000000           lcall 0, 0                         ; call System.WriteLn
008a  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:513
008f  bf0000               mov di, 0                          ; data System.OUTPUT
0092  1e                   push ds                           
0093  57                   push di                           
0094  bf0000               mov di, 0                          ; string "!!! PRZEDMIOT UNIQE 2% !!!"
0097  0e                   push cs                           
0098  57                   push di                           
0099  31c0                 xor ax, ax                        
009b  50                   push ax                           
009c  9a00000000           lcall 0, 0                         ; call System.WriteString
00a1  9a00000000           lcall 0, 0                         ; call System.WriteLn
00a6  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:514
00ab  a10000               mov ax, word ptr [0]               ; data PRZEDM.kaseta
00ae  2d0a00               sub ax, 0xa                       
00b1  a30000               mov word ptr [0], ax               ; data PRZEDM.kaseta
; PRZEDM.PAS:515
00b4  a10000               mov ax, word ptr [0]               ; data MONSTRA.MAXE
00b7  050500               add ax, 5                         
00ba  a30000               mov word ptr [0], ax               ; data MONSTRA.MAXE
; PRZEDM.PAS:516
00bd  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRO
00c0  2d0800               sub ax, 8                         
00c3  a30000               mov word ptr [0], ax               ; data PRZEDM.PRO
; PRZEDM.PAS:517
00c6  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
00c9  40                   inc ax                            
00ca  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:518
00cd  a10000               mov ax, word ptr [0]               ; data PRZEDM.ZRE
00d0  40                   inc ax                            
00d1  a30000               mov word ptr [0], ax               ; data PRZEDM.ZRE
; PRZEDM.PAS:520
00d4  5d                   pop bp                            
00d5  cb                   retf                              
```

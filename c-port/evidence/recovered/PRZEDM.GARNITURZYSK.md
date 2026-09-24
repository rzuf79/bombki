# `PRZEDM.GARNITURZYSK`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:490-498`
- TPU code block: `0x0078`
- Procedure bytes: `0x0049`–`0x00b0`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.FUKS`
- `PRZEDM.GARNITUR`
- `PRZEDM.PRZED`
- `System.OUTPUT`

## Calls

- `System.Random`
- `System.WriteLn`
- `System.WriteString`
- `System.entry_0x0190`
- `System.entry_0x01a0`

## Exact strings

- `"ZYSKUJESZ GARNITUR !!!! Z CIALA WROGA !!!!"`
- `"PRZEDMIOT UNIQE !!! 2.5% !!! "`

## Annotated listing

```asm
; PRZEDM.PAS:490
0049  55                   push bp                           
004a  89e5                 mov bp, sp                        
004c  31c0                 xor ax, ax                        
004e  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:491
0053  b8e803               mov ax, 0x3e8                     
0056  50                   push ax                           
0057  9a00000000           lcall 0, 0                         ; call System.Random
005c  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:492
005f  833e000019           cmp word ptr [0], 0x19             ; data PRZEDM.FUKS
0064  7f48                 jg 0xae                           
; PRZEDM.PAS:493
0066  bf0000               mov di, 0                          ; data System.OUTPUT
0069  1e                   push ds                           
006a  57                   push di                           
006b  bf0000               mov di, 0                          ; string "ZYSKUJESZ GARNITUR !!!! Z CIALA WROGA !!!!"
006e  0e                   push cs                           
006f  57                   push di                           
0070  31c0                 xor ax, ax                        
0072  50                   push ax                           
0073  9a00000000           lcall 0, 0                         ; call System.WriteString
0078  9a00000000           lcall 0, 0                         ; call System.WriteLn
007d  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:494
0082  bf0000               mov di, 0                          ; data System.OUTPUT
0085  1e                   push ds                           
0086  57                   push di                           
0087  bf0000               mov di, 0                          ; string "PRZEDMIOT UNIQE !!! 2.5% !!! "
008a  0e                   push cs                           
008b  57                   push di                           
008c  31c0                 xor ax, ax                        
008e  50                   push ax                           
008f  9a00000000           lcall 0, 0                         ; call System.WriteString
0094  9a00000000           lcall 0, 0                         ; call System.WriteLn
0099  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:495
009e  a10000               mov ax, word ptr [0]               ; data PRZEDM.GARNITUR
00a1  2d0a00               sub ax, 0xa                       
00a4  a30000               mov word ptr [0], ax               ; data PRZEDM.GARNITUR
; PRZEDM.PAS:496
00a7  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
00aa  40                   inc ax                            
00ab  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:498
00ae  5d                   pop bp                            
00af  cb                   retf                              
```

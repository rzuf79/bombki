# `PRZEDM.SCENA`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:548-553`
- TPU code block: `0x00a8`
- Procedure bytes: `0x00d3`–`0x0173`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.GITARZYSTA`
- `PRZEDM.LIROY`
- `PRZEDM.MIECHO`
- `PRZEDM.ORGANISTA`
- `PRZEDM.PERKUSISTA`
- `System.OUTPUT`

## Calls

- `System.WriteLn`
- `System.WriteString`
- `System.entry_0x0190`
- `System.entry_0x01a0`

## Exact strings

- `"GITARZYSTA GRA TU NA WYSOKIM CE-DUR"`
- `"PERKUSISTA TLUCZE TU NIEMILOSIERNIE (W) TALEZE I BEBNY"`
- `"ORGANISTA KORZYSTA Z 8 CIASIO NARAZ PODLĄCZONYCH DO SIECI"`
- `"MAGA BOSS TEJ PLANSZY - LIROY SPIEWA JEDEN ZE SWOICH KAWALKOW"`

## Annotated listing

```asm
; PRZEDM.PAS:548
00d3  55                   push bp                           
00d4  89e5                 mov bp, sp                        
00d6  31c0                 xor ax, ax                        
00d8  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:549
00dd  a10000               mov ax, word ptr [0]               ; data PRZEDM.GITARZYSTA
00e0  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
00e4  751c                 jne 0x102                         
00e6  bf0000               mov di, 0                          ; data System.OUTPUT
00e9  1e                   push ds                           
00ea  57                   push di                           
00eb  bf0000               mov di, 0                          ; string "GITARZYSTA GRA TU NA WYSOKIM CE-DUR"
00ee  0e                   push cs                           
00ef  57                   push di                           
00f0  31c0                 xor ax, ax                        
00f2  50                   push ax                           
00f3  9a00000000           lcall 0, 0                         ; call System.WriteString
00f8  9a00000000           lcall 0, 0                         ; call System.WriteLn
00fd  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:550
0102  a10000               mov ax, word ptr [0]               ; data PRZEDM.PERKUSISTA
0105  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0109  751c                 jne 0x127                         
010b  bf0000               mov di, 0                          ; data System.OUTPUT
010e  1e                   push ds                           
010f  57                   push di                           
0110  bf0000               mov di, 0                          ; string "PERKUSISTA TLUCZE TU NIEMILOSIERNIE (W) TALEZE I BEBNY"
0113  0e                   push cs                           
0114  57                   push di                           
0115  31c0                 xor ax, ax                        
0117  50                   push ax                           
0118  9a00000000           lcall 0, 0                         ; call System.WriteString
011d  9a00000000           lcall 0, 0                         ; call System.WriteLn
0122  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:551
0127  a10000               mov ax, word ptr [0]               ; data PRZEDM.ORGANISTA
012a  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
012e  751c                 jne 0x14c                         
0130  bf0000               mov di, 0                          ; data System.OUTPUT
0133  1e                   push ds                           
0134  57                   push di                           
0135  bf0000               mov di, 0                          ; string "ORGANISTA KORZYSTA Z 8 CIASIO NARAZ PODLĄCZONYCH DO SIECI"
0138  0e                   push cs                           
0139  57                   push di                           
013a  31c0                 xor ax, ax                        
013c  50                   push ax                           
013d  9a00000000           lcall 0, 0                         ; call System.WriteString
0142  9a00000000           lcall 0, 0                         ; call System.WriteLn
0147  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:552
014c  a10000               mov ax, word ptr [0]               ; data PRZEDM.LIROY
014f  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0153  751c                 jne 0x171                         
0155  bf0000               mov di, 0                          ; data System.OUTPUT
0158  1e                   push ds                           
0159  57                   push di                           
015a  bf0000               mov di, 0                          ; string "MAGA BOSS TEJ PLANSZY - LIROY SPIEWA JEDEN ZE SWOICH KAWALKOW"
015d  0e                   push cs                           
015e  57                   push di                           
015f  31c0                 xor ax, ax                        
0161  50                   push ax                           
0162  9a00000000           lcall 0, 0                         ; call System.WriteString
0167  9a00000000           lcall 0, 0                         ; call System.WriteLn
016c  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:553
0171  5d                   pop bp                            
0172  cb                   retf                              
```

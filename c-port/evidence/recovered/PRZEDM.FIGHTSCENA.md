# `PRZEDM.FIGHTSCENA`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:1435-1461`
- TPU code block: `0x00f0`
- Procedure bytes: `0x0077`–`0x0175`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.ENERGIA`
- `PRZEDM.FORSA`
- `PRZEDM.GITARZYSTA`
- `PRZEDM.LIROY`
- `PRZEDM.MIECHO`
- `PRZEDM.ORGANISTA`
- `PRZEDM.PASZOL`
- `PRZEDM.PERKUSISTA`
- `PRZEDM.QUEST`
- `PRZEDM.QUESTWYK`
- `PRZEDM.wpisz`
- `PRZEDM:0x0038+0x0002`
- `System.OUTPUT`

## Calls

- `PRZEDM.KASETAZYSK`
- `PRZEDM.NEASY`
- `PRZEDM.VEASY`
- `System.CompareString`
- `System.WriteLn`
- `System.WriteString`
- `System.entry_0x0190`
- `System.entry_0x01a0`

## Exact strings

- `"ZABIJ PERKUSISTA"`
- `"ZABIJ GITARZYSTA"`
- `"ZABIJ LIROY"`
- `"GRATULACJE !!! ZABILES LIROYA DOSTAJESZ ZA DARMO 30 KASY"`
- `"ZABIJ ORGANISTA"`

## Annotated listing

```asm
; PRZEDM.PAS:1435
0077  55                   push bp                           
0078  89e5                 mov bp, sp                        
007a  31c0                 xor ax, ax                        
007c  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:1436
0081  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0084  1e                   push ds                           
0085  57                   push di                           
0086  bf0000               mov di, 0                          ; string "ZABIJ PERKUSISTA"
0089  0e                   push cs                           
008a  57                   push di                           
008b  9a00000000           lcall 0, 0                         ; call System.CompareString
0090  7516                 jne 0xa8                          
0092  a10000               mov ax, word ptr [0]               ; data PRZEDM.PERKUSISTA
0095  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0099  750d                 jne 0xa8                          
; PRZEDM.PAS:1437
009b  0e                   push cs                           
009c  e80000               call 0x9f                          ; call PRZEDM.VEASY
; PRZEDM.PAS:1438
009f  31c0                 xor ax, ax                        
00a1  a30000               mov word ptr [0], ax               ; data PRZEDM.PERKUSISTA
; PRZEDM.PAS:1439
00a4  0e                   push cs                           
00a5  e80000               call 0xa8                          ; call PRZEDM.KASETAZYSK
; PRZEDM.PAS:1441
00a8  bf0000               mov di, 0                          ; data PRZEDM.wpisz
00ab  1e                   push ds                           
00ac  57                   push di                           
00ad  bf0000               mov di, 0                          ; string "ZABIJ GITARZYSTA"
00b0  0e                   push cs                           
00b1  57                   push di                           
00b2  9a00000000           lcall 0, 0                         ; call System.CompareString
00b7  7516                 jne 0xcf                          
00b9  a10000               mov ax, word ptr [0]               ; data PRZEDM.GITARZYSTA
00bc  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
00c0  750d                 jne 0xcf                          
; PRZEDM.PAS:1442
00c2  0e                   push cs                           
00c3  e80000               call 0xc6                          ; call PRZEDM.VEASY
; PRZEDM.PAS:1443
00c6  31c0                 xor ax, ax                        
00c8  a30000               mov word ptr [0], ax               ; data PRZEDM.GITARZYSTA
; PRZEDM.PAS:1444
00cb  0e                   push cs                           
00cc  e80000               call 0xcf                          ; call PRZEDM.KASETAZYSK
; PRZEDM.PAS:1446
00cf  bf0000               mov di, 0                          ; data PRZEDM.wpisz
00d2  1e                   push ds                           
00d3  57                   push di                           
00d4  bf0000               mov di, 0                          ; string "ZABIJ LIROY"
00d7  0e                   push cs                           
00d8  57                   push di                           
00d9  9a00000000           lcall 0, 0                         ; call System.CompareString
00de  756c                 jne 0x14c                         
00e0  a10000               mov ax, word ptr [0]               ; data PRZEDM.LIROY
00e3  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
00e7  7563                 jne 0x14c                         
; PRZEDM.PAS:1447
00e9  0e                   push cs                           
00ea  e80000               call 0xed                          ; call PRZEDM.NEASY
; PRZEDM.PAS:1448
00ed  813e00001027         cmp word ptr [0], 0x2710           ; data PRZEDM.MIECHO
00f3  7457                 je 0x14c                          
00f5  833e000000           cmp word ptr [0], 0                ; data PRZEDM.ENERGIA
00fa  7e50                 jle 0x14c                         
00fc  833e000000           cmp word ptr [0], 0                ; data PRZEDM.PASZOL
0101  7549                 jne 0x14c                         
; PRZEDM.PAS:1449
0103  bf0000               mov di, 0                          ; data System.OUTPUT
0106  1e                   push ds                           
0107  57                   push di                           
0108  bf0000               mov di, 0                          ; string "GRATULACJE !!! ZABILES LIROYA DOSTAJESZ ZA DARMO 30 KASY"
010b  0e                   push cs                           
010c  57                   push di                           
010d  31c0                 xor ax, ax                        
010f  50                   push ax                           
0110  9a00000000           lcall 0, 0                         ; call System.WriteString
0115  9a00000000           lcall 0, 0                         ; call System.WriteLn
011a  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1450
011f  a10000               mov ax, word ptr [0]               ; data PRZEDM.FORSA
0122  8b160000             mov dx, word ptr [0]               ; data PRZEDM:0x0038+0x0002
0126  051e00               add ax, 0x1e                      
0129  83d200               adc dx, 0                         
012c  a30000               mov word ptr [0], ax               ; data PRZEDM.FORSA
012f  89160000             mov word ptr [0], dx               ; data PRZEDM:0x0038+0x0002
; PRZEDM.PAS:1451
0133  0e                   push cs                           
0134  e80000               call 0x137                         ; call PRZEDM.KASETAZYSK
; PRZEDM.PAS:1452
0137  833e000001           cmp word ptr [0], 1                ; data PRZEDM.QUEST
013c  7e09                 jle 0x147                         
013e  a10000               mov ax, word ptr [0]               ; data PRZEDM.QUESTWYK
0141  2d9600               sub ax, 0x96                      
0144  a30000               mov word ptr [0], ax               ; data PRZEDM.QUESTWYK
; PRZEDM.PAS:1453
0147  31c0                 xor ax, ax                        
0149  a30000               mov word ptr [0], ax               ; data PRZEDM.LIROY
; PRZEDM.PAS:1456
014c  bf0000               mov di, 0                          ; data PRZEDM.wpisz
014f  1e                   push ds                           
0150  57                   push di                           
0151  bf0000               mov di, 0                          ; string "ZABIJ ORGANISTA"
0154  0e                   push cs                           
0155  57                   push di                           
0156  9a00000000           lcall 0, 0                         ; call System.CompareString
015b  7516                 jne 0x173                         
015d  a10000               mov ax, word ptr [0]               ; data PRZEDM.ORGANISTA
0160  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0164  750d                 jne 0x173                         
; PRZEDM.PAS:1457
0166  0e                   push cs                           
0167  e80000               call 0x16a                         ; call PRZEDM.VEASY
; PRZEDM.PAS:1458
016a  31c0                 xor ax, ax                        
016c  a30000               mov word ptr [0], ax               ; data PRZEDM.ORGANISTA
; PRZEDM.PAS:1459
016f  0e                   push cs                           
0170  e80000               call 0x173                         ; call PRZEDM.KASETAZYSK
; PRZEDM.PAS:1461
0173  5d                   pop bp                            
0174  cb                   retf                              
```

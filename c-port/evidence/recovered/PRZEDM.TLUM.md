# `PRZEDM.TLUM`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:555-566`
- TPU code block: `0x00b0`
- Procedure bytes: `0x01c8`–`0x0350`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.CZLOWIEK`
- `PRZEDM.DZIADEK`
- `PRZEDM.DZIECKO`
- `PRZEDM.FAN`
- `PRZEDM.GORYL`
- `PRZEDM.MIECHO`
- `PRZEDM.OCHRONIARZ`
- `PRZEDM.POLICJANT`
- `PRZEDM.REPORTER`
- `PRZEDM.SLUCHACZ`
- `PRZEDM.WARIAT`
- `System.OUTPUT`

## Calls

- `System.WriteLn`
- `System.WriteString`
- `System.entry_0x0190`
- `System.entry_0x01a0`

## Exact strings

- `"MILE DZIECKO POWTARZA NAJLEPSZE KAWALKI LIROYA"`
- `"WARIAT SIE CIESZY ZE NIE TYLKO ON JEST WARIATEM"`
- `"SLUCHACZ SLUCHA"`
- `"FAN LIROYA ZAPUSCIL SOBIE BRODKE JAK LIROY I MA PODJAR"`
- `"NORMALNY CZLOWIEK PRZYSZEDL POSLUCHAC LIROYA(DZIWNE NIE)?"`
- `"ZALANY POLICJANT STARA SIE PELNIC SWA SLUZBE"`
- `"OCHRONIARZ ZABIJA KAZDEGO KTO PRZEJDZIE PRZEZ BALUSTRADKI"`
- `"PRYWATNY GORYL LIROYA JE BANANA "`
- `"DZIADEK NIESTESTY NIE SKACZE DO GORY JAK KANGURY"`
- `"REPORTER UWAZNIE ZAPISUJE WSZYSTKIE WULGARYZMY"`

## Annotated listing

```asm
; PRZEDM.PAS:555
01c8  55                   push bp                           
01c9  89e5                 mov bp, sp                        
01cb  31c0                 xor ax, ax                        
01cd  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:556
01d2  a00000               mov al, byte ptr [0]               ; data PRZEDM.DZIECKO
01d5  98                   cbw                               
01d6  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
01da  751c                 jne 0x1f8                         
01dc  bf0000               mov di, 0                          ; data System.OUTPUT
01df  1e                   push ds                           
01e0  57                   push di                           
01e1  bf0000               mov di, 0                          ; string "MILE DZIECKO POWTARZA NAJLEPSZE KAWALKI LIROYA"
01e4  0e                   push cs                           
01e5  57                   push di                           
01e6  31c0                 xor ax, ax                        
01e8  50                   push ax                           
01e9  9a00000000           lcall 0, 0                         ; call System.WriteString
01ee  9a00000000           lcall 0, 0                         ; call System.WriteLn
01f3  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:557
01f8  a00000               mov al, byte ptr [0]               ; data PRZEDM.WARIAT
01fb  98                   cbw                               
01fc  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0200  751c                 jne 0x21e                         
0202  bf0000               mov di, 0                          ; data System.OUTPUT
0205  1e                   push ds                           
0206  57                   push di                           
0207  bf0000               mov di, 0                          ; string "WARIAT SIE CIESZY ZE NIE TYLKO ON JEST WARIATEM"
020a  0e                   push cs                           
020b  57                   push di                           
020c  31c0                 xor ax, ax                        
020e  50                   push ax                           
020f  9a00000000           lcall 0, 0                         ; call System.WriteString
0214  9a00000000           lcall 0, 0                         ; call System.WriteLn
0219  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:558
021e  a00000               mov al, byte ptr [0]               ; data PRZEDM.SLUCHACZ
0221  98                   cbw                               
0222  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0226  751c                 jne 0x244                         
0228  bf0000               mov di, 0                          ; data System.OUTPUT
022b  1e                   push ds                           
022c  57                   push di                           
022d  bf0000               mov di, 0                          ; string "SLUCHACZ SLUCHA"
0230  0e                   push cs                           
0231  57                   push di                           
0232  31c0                 xor ax, ax                        
0234  50                   push ax                           
0235  9a00000000           lcall 0, 0                         ; call System.WriteString
023a  9a00000000           lcall 0, 0                         ; call System.WriteLn
023f  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:559
0244  a00000               mov al, byte ptr [0]               ; data PRZEDM.FAN
0247  98                   cbw                               
0248  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
024c  751c                 jne 0x26a                         
024e  bf0000               mov di, 0                          ; data System.OUTPUT
0251  1e                   push ds                           
0252  57                   push di                           
0253  bf0000               mov di, 0                          ; string "FAN LIROYA ZAPUSCIL SOBIE BRODKE JAK LIROY I MA PODJAR"
0256  0e                   push cs                           
0257  57                   push di                           
0258  31c0                 xor ax, ax                        
025a  50                   push ax                           
025b  9a00000000           lcall 0, 0                         ; call System.WriteString
0260  9a00000000           lcall 0, 0                         ; call System.WriteLn
0265  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:560
026a  a00000               mov al, byte ptr [0]               ; data PRZEDM.CZLOWIEK
026d  98                   cbw                               
026e  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0272  751c                 jne 0x290                         
0274  bf0000               mov di, 0                          ; data System.OUTPUT
0277  1e                   push ds                           
0278  57                   push di                           
0279  bf0000               mov di, 0                          ; string "NORMALNY CZLOWIEK PRZYSZEDL POSLUCHAC LIROYA(DZIWNE NIE)?"
027c  0e                   push cs                           
027d  57                   push di                           
027e  31c0                 xor ax, ax                        
0280  50                   push ax                           
0281  9a00000000           lcall 0, 0                         ; call System.WriteString
0286  9a00000000           lcall 0, 0                         ; call System.WriteLn
028b  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:561
0290  a00000               mov al, byte ptr [0]               ; data PRZEDM.POLICJANT
0293  98                   cbw                               
0294  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0298  751c                 jne 0x2b6                         
029a  bf0000               mov di, 0                          ; data System.OUTPUT
029d  1e                   push ds                           
029e  57                   push di                           
029f  bf0000               mov di, 0                          ; string "ZALANY POLICJANT STARA SIE PELNIC SWA SLUZBE"
02a2  0e                   push cs                           
02a3  57                   push di                           
02a4  31c0                 xor ax, ax                        
02a6  50                   push ax                           
02a7  9a00000000           lcall 0, 0                         ; call System.WriteString
02ac  9a00000000           lcall 0, 0                         ; call System.WriteLn
02b1  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:562
02b6  a00000               mov al, byte ptr [0]               ; data PRZEDM.OCHRONIARZ
02b9  98                   cbw                               
02ba  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
02be  751c                 jne 0x2dc                         
02c0  bf0000               mov di, 0                          ; data System.OUTPUT
02c3  1e                   push ds                           
02c4  57                   push di                           
02c5  bf0000               mov di, 0                          ; string "OCHRONIARZ ZABIJA KAZDEGO KTO PRZEJDZIE PRZEZ BALUSTRADKI"
02c8  0e                   push cs                           
02c9  57                   push di                           
02ca  31c0                 xor ax, ax                        
02cc  50                   push ax                           
02cd  9a00000000           lcall 0, 0                         ; call System.WriteString
02d2  9a00000000           lcall 0, 0                         ; call System.WriteLn
02d7  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:563
02dc  a00000               mov al, byte ptr [0]               ; data PRZEDM.GORYL
02df  98                   cbw                               
02e0  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
02e4  751c                 jne 0x302                         
02e6  bf0000               mov di, 0                          ; data System.OUTPUT
02e9  1e                   push ds                           
02ea  57                   push di                           
02eb  bf0000               mov di, 0                          ; string "PRYWATNY GORYL LIROYA JE BANANA "
02ee  0e                   push cs                           
02ef  57                   push di                           
02f0  31c0                 xor ax, ax                        
02f2  50                   push ax                           
02f3  9a00000000           lcall 0, 0                         ; call System.WriteString
02f8  9a00000000           lcall 0, 0                         ; call System.WriteLn
02fd  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:564
0302  a00000               mov al, byte ptr [0]               ; data PRZEDM.DZIADEK
0305  98                   cbw                               
0306  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
030a  751c                 jne 0x328                         
030c  bf0000               mov di, 0                          ; data System.OUTPUT
030f  1e                   push ds                           
0310  57                   push di                           
0311  bf0000               mov di, 0                          ; string "DZIADEK NIESTESTY NIE SKACZE DO GORY JAK KANGURY"
0314  0e                   push cs                           
0315  57                   push di                           
0316  31c0                 xor ax, ax                        
0318  50                   push ax                           
0319  9a00000000           lcall 0, 0                         ; call System.WriteString
031e  9a00000000           lcall 0, 0                         ; call System.WriteLn
0323  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:565
0328  a00000               mov al, byte ptr [0]               ; data PRZEDM.REPORTER
032b  98                   cbw                               
032c  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0330  751c                 jne 0x34e                         
0332  bf0000               mov di, 0                          ; data System.OUTPUT
0335  1e                   push ds                           
0336  57                   push di                           
0337  bf0000               mov di, 0                          ; string "REPORTER UWAZNIE ZAPISUJE WSZYSTKIE WULGARYZMY"
033a  0e                   push cs                           
033b  57                   push di                           
033c  31c0                 xor ax, ax                        
033e  50                   push ax                           
033f  9a00000000           lcall 0, 0                         ; call System.WriteString
0344  9a00000000           lcall 0, 0                         ; call System.WriteLn
0349  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:566
034e  5d                   pop bp                            
034f  cb                   retf                              
```

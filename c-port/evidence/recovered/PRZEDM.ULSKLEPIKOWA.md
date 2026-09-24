# `PRZEDM.ULSKLEPIKOWA`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:475-487`
- TPU code block: `0x0070`
- Procedure bytes: `0x0209`–`0x0387`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `MONSTRA.JAMNIK`
- `MONSTRA.OWCZAREK`
- `MONSTRA.PIESEK`
- `MONSTRA.PIJAK`
- `MONSTRA.PUDEL`
- `MONSTRA.SPANIEL`
- `MONSTRA.SPRZEDAWCA`
- `MONSTRA.TAKSOWKARZ`
- `MONSTRA.ZAMIATACZ`
- `MONSTRA.ZEBRAK`
- `PRZEDM.MIECHO`
- `System.OUTPUT`

## Calls

- `System.WriteLn`
- `System.WriteString`
- `System.entry_0x0190`
- `System.entry_0x01a0`

## Exact strings

- `"DLUGI JAMNIK GRYZIE CI PODESZWY"`
- `"PUCHATY OWCZAREK WYLEGUJE SIE W SLONCU"`
- `"PIESEK SZUKA DRZEWKA ABY ULZYC SOBIE"`
- `"SPANIEL SLINI SIE AZ MILO"`
- `"PUDEL JE KITIKET WIEC CHYBA MU NIE PRZERWIESZ.....?"`
- `"TAKSOWKARZ WTARGNA TU ZE SWOJA BRYKA , I CZEKA NA KLIENTOW"`
- `"SPRZEDAWCA PRECELKOW WLASNIE SPRZEDAL OSTATNIEGO , CZYM DOPROWADZA DO SZALENSTWA LATAJACE WOKOLO NIEGO KRUKI"`
- `"ZAMIATACZ ULIC SPRAWIA ZE JEST TU CZYSTO JAK W CHLEWIE"`
- `"PIJAK TU STOI(DOBRE SOBIE) I SMIERDZI MU Z GEBY"`
- `"ZEBRAK UDOWADNIA PRZECHODNIOM ZE ON NAPRAWDE JEST CHORY NA AIDS"`

## Annotated listing

```asm
; PRZEDM.PAS:475
0209  55                   push bp                           
020a  89e5                 mov bp, sp                        
020c  31c0                 xor ax, ax                        
020e  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:476
0213  a10000               mov ax, word ptr [0]               ; data MONSTRA.JAMNIK
0216  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
021a  751c                 jne 0x238                         
021c  bf0000               mov di, 0                          ; data System.OUTPUT
021f  1e                   push ds                           
0220  57                   push di                           
0221  bf0000               mov di, 0                          ; string "DLUGI JAMNIK GRYZIE CI PODESZWY"
0224  0e                   push cs                           
0225  57                   push di                           
0226  31c0                 xor ax, ax                        
0228  50                   push ax                           
0229  9a00000000           lcall 0, 0                         ; call System.WriteString
022e  9a00000000           lcall 0, 0                         ; call System.WriteLn
0233  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:477
0238  a10000               mov ax, word ptr [0]               ; data MONSTRA.OWCZAREK
023b  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
023f  751c                 jne 0x25d                         
0241  bf0000               mov di, 0                          ; data System.OUTPUT
0244  1e                   push ds                           
0245  57                   push di                           
0246  bf0000               mov di, 0                          ; string "PUCHATY OWCZAREK WYLEGUJE SIE W SLONCU"
0249  0e                   push cs                           
024a  57                   push di                           
024b  31c0                 xor ax, ax                        
024d  50                   push ax                           
024e  9a00000000           lcall 0, 0                         ; call System.WriteString
0253  9a00000000           lcall 0, 0                         ; call System.WriteLn
0258  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:478
025d  a10000               mov ax, word ptr [0]               ; data MONSTRA.PIESEK
0260  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0264  751c                 jne 0x282                         
0266  bf0000               mov di, 0                          ; data System.OUTPUT
0269  1e                   push ds                           
026a  57                   push di                           
026b  bf0000               mov di, 0                          ; string "PIESEK SZUKA DRZEWKA ABY ULZYC SOBIE"
026e  0e                   push cs                           
026f  57                   push di                           
0270  31c0                 xor ax, ax                        
0272  50                   push ax                           
0273  9a00000000           lcall 0, 0                         ; call System.WriteString
0278  9a00000000           lcall 0, 0                         ; call System.WriteLn
027d  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:479
0282  a10000               mov ax, word ptr [0]               ; data MONSTRA.SPANIEL
0285  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0289  751c                 jne 0x2a7                         
028b  bf0000               mov di, 0                          ; data System.OUTPUT
028e  1e                   push ds                           
028f  57                   push di                           
0290  bf0000               mov di, 0                          ; string "SPANIEL SLINI SIE AZ MILO"
0293  0e                   push cs                           
0294  57                   push di                           
0295  31c0                 xor ax, ax                        
0297  50                   push ax                           
0298  9a00000000           lcall 0, 0                         ; call System.WriteString
029d  9a00000000           lcall 0, 0                         ; call System.WriteLn
02a2  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:480
02a7  a10000               mov ax, word ptr [0]               ; data MONSTRA.PUDEL
02aa  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
02ae  751c                 jne 0x2cc                         
02b0  bf0000               mov di, 0                          ; data System.OUTPUT
02b3  1e                   push ds                           
02b4  57                   push di                           
02b5  bf0000               mov di, 0                          ; string "PUDEL JE KITIKET WIEC CHYBA MU NIE PRZERWIESZ.....?"
02b8  0e                   push cs                           
02b9  57                   push di                           
02ba  31c0                 xor ax, ax                        
02bc  50                   push ax                           
02bd  9a00000000           lcall 0, 0                         ; call System.WriteString
02c2  9a00000000           lcall 0, 0                         ; call System.WriteLn
02c7  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:481
02cc  a10000               mov ax, word ptr [0]               ; data MONSTRA.TAKSOWKARZ
02cf  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
02d3  751c                 jne 0x2f1                         
02d5  bf0000               mov di, 0                          ; data System.OUTPUT
02d8  1e                   push ds                           
02d9  57                   push di                           
02da  bf0000               mov di, 0                          ; string "TAKSOWKARZ WTARGNA TU ZE SWOJA BRYKA , I CZEKA NA KLIENTOW"
02dd  0e                   push cs                           
02de  57                   push di                           
02df  31c0                 xor ax, ax                        
02e1  50                   push ax                           
02e2  9a00000000           lcall 0, 0                         ; call System.WriteString
02e7  9a00000000           lcall 0, 0                         ; call System.WriteLn
02ec  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:482
02f1  a10000               mov ax, word ptr [0]               ; data MONSTRA.SPRZEDAWCA
02f4  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
02f8  751c                 jne 0x316                         
; PRZEDM.PAS:483
02fa  bf0000               mov di, 0                          ; data System.OUTPUT
02fd  1e                   push ds                           
02fe  57                   push di                           
02ff  bf0000               mov di, 0                          ; string "SPRZEDAWCA PRECELKOW WLASNIE SPRZEDAL OSTATNIEGO , CZYM DOPROWADZA DO SZALENSTWA LATAJACE WOKOLO NIEGO KRUKI"
0302  0e                   push cs                           
0303  57                   push di                           
0304  31c0                 xor ax, ax                        
0306  50                   push ax                           
0307  9a00000000           lcall 0, 0                         ; call System.WriteString
030c  9a00000000           lcall 0, 0                         ; call System.WriteLn
0311  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:484
0316  a10000               mov ax, word ptr [0]               ; data MONSTRA.ZAMIATACZ
0319  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
031d  751c                 jne 0x33b                         
031f  bf0000               mov di, 0                          ; data System.OUTPUT
0322  1e                   push ds                           
0323  57                   push di                           
0324  bf0000               mov di, 0                          ; string "ZAMIATACZ ULIC SPRAWIA ZE JEST TU CZYSTO JAK W CHLEWIE"
0327  0e                   push cs                           
0328  57                   push di                           
0329  31c0                 xor ax, ax                        
032b  50                   push ax                           
032c  9a00000000           lcall 0, 0                         ; call System.WriteString
0331  9a00000000           lcall 0, 0                         ; call System.WriteLn
0336  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:485
033b  a10000               mov ax, word ptr [0]               ; data MONSTRA.PIJAK
033e  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0342  751c                 jne 0x360                         
0344  bf0000               mov di, 0                          ; data System.OUTPUT
0347  1e                   push ds                           
0348  57                   push di                           
0349  bf0000               mov di, 0                          ; string "PIJAK TU STOI(DOBRE SOBIE) I SMIERDZI MU Z GEBY"
034c  0e                   push cs                           
034d  57                   push di                           
034e  31c0                 xor ax, ax                        
0350  50                   push ax                           
0351  9a00000000           lcall 0, 0                         ; call System.WriteString
0356  9a00000000           lcall 0, 0                         ; call System.WriteLn
035b  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:486
0360  a10000               mov ax, word ptr [0]               ; data MONSTRA.ZEBRAK
0363  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0367  751c                 jne 0x385                         
0369  bf0000               mov di, 0                          ; data System.OUTPUT
036c  1e                   push ds                           
036d  57                   push di                           
036e  bf0000               mov di, 0                          ; string "ZEBRAK UDOWADNIA PRZECHODNIOM ZE ON NAPRAWDE JEST CHORY NA AIDS"
0371  0e                   push cs                           
0372  57                   push di                           
0373  31c0                 xor ax, ax                        
0375  50                   push ax                           
0376  9a00000000           lcall 0, 0                         ; call System.WriteString
037b  9a00000000           lcall 0, 0                         ; call System.WriteLn
0380  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:487
0385  5d                   pop bp                            
0386  cb                   retf                              
```

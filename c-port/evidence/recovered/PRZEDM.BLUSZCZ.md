# `PRZEDM.BLUSZCZ`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:210-223`
- TPU code block: `0x0020`
- Procedure bytes: `0x02e3`–`0x04ac`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.AGREST`
- `PRZEDM.DMUCHAWIEC`
- `PRZEDM.DUNCAN`
- `PRZEDM.JEZYNA`
- `PRZEDM.KONICZYNKA`
- `PRZEDM.MALINA`
- `PRZEDM.MIECHO`
- `PRZEDM.MLECZ`
- `PRZEDM.OSET`
- `PRZEDM.ROZA`
- `PRZEDM.STOKROTKA`
- `PRZEDM.SZCZAW`
- `PRZEDM.TRAWA`
- `System.OUTPUT`

## Calls

- `System.WriteLn`
- `System.WriteString`
- `System.entry_0x0190`
- `System.entry_0x01a0`

## Exact strings

- `"PONURY SZCZAW PLANUJE ZEMSCIC SIE NA SWOJEJ TESCIOWEJ-LISCIU KLONOWYM"`
- `"STOKROTKA TUTAJ ROSNIE POLNA ( A NAD NIA SZUMI GEJ) "`
- `"KONICZYNKA KTORA TUTAJ JEST NIE PRZENIESIE CI SZCZESCIA"`
- `"MLECZ WLASNIE DOWIODL ZE EINSTEIN SIE MYLIL"`
- `"DMUCHAWIEC WLASNIE DOJRZAL DO TEGO ABY GO ZDMUCHNAC"`
- `"PRZEROSNIETA ROZA POKAZUJE KOLCE NA ZNAK IZ NIE WARTO JEJ ATAKOWAC"`
- `"KIEDYS MYSLALES ZE OSET TO LATWY DO WYRWANIA CHWAST ... MYLILES SIE"`
- `"TA JEZYNA W CIEMNOSCIACH WYGLADA JAK JAKIS NIEBYWALY SMOK ... "`
- `"AGREST JEST TU , CHCESZ SPROBOWAC JAK SMAKUJE ?"`
- `"MALINA JAK DZIEWCZYNA , CHOC DZIEWCZYNY NIE SA CHYBA AZ TAKIMI MUTANTAMI"`
- `"TRAWA NIE WYDAJE SIE TRUDNYM PRZECIWNIKIEM , LECZ NIE DAJ SIE ZWIESC"`
- `"ROLNIK DUNCAN PROBOJE ZAPANOWAC NAD TYM ZYWIOLEM I UPRAWIAC SWOJE MARCHEWKI"`

## Annotated listing

```asm
; PRZEDM.PAS:210
02e3  55                   push bp                           
02e4  89e5                 mov bp, sp                        
02e6  31c0                 xor ax, ax                        
02e8  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:211
02ed  a10000               mov ax, word ptr [0]               ; data PRZEDM.SZCZAW
02f0  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
02f4  751c                 jne 0x312                         
02f6  bf0000               mov di, 0                          ; data System.OUTPUT
02f9  1e                   push ds                           
02fa  57                   push di                           
02fb  bf0000               mov di, 0                          ; string "PONURY SZCZAW PLANUJE ZEMSCIC SIE NA SWOJEJ TESCIOWEJ-LISCIU KLONOWYM"
02fe  0e                   push cs                           
02ff  57                   push di                           
0300  31c0                 xor ax, ax                        
0302  50                   push ax                           
0303  9a00000000           lcall 0, 0                         ; call System.WriteString
0308  9a00000000           lcall 0, 0                         ; call System.WriteLn
030d  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:212
0312  a10000               mov ax, word ptr [0]               ; data PRZEDM.STOKROTKA
0315  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0319  751c                 jne 0x337                         
031b  bf0000               mov di, 0                          ; data System.OUTPUT
031e  1e                   push ds                           
031f  57                   push di                           
0320  bf0000               mov di, 0                          ; string "STOKROTKA TUTAJ ROSNIE POLNA ( A NAD NIA SZUMI GEJ) "
0323  0e                   push cs                           
0324  57                   push di                           
0325  31c0                 xor ax, ax                        
0327  50                   push ax                           
0328  9a00000000           lcall 0, 0                         ; call System.WriteString
032d  9a00000000           lcall 0, 0                         ; call System.WriteLn
0332  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:213
0337  a10000               mov ax, word ptr [0]               ; data PRZEDM.KONICZYNKA
033a  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
033e  751c                 jne 0x35c                         
0340  bf0000               mov di, 0                          ; data System.OUTPUT
0343  1e                   push ds                           
0344  57                   push di                           
0345  bf0000               mov di, 0                          ; string "KONICZYNKA KTORA TUTAJ JEST NIE PRZENIESIE CI SZCZESCIA"
0348  0e                   push cs                           
0349  57                   push di                           
034a  31c0                 xor ax, ax                        
034c  50                   push ax                           
034d  9a00000000           lcall 0, 0                         ; call System.WriteString
0352  9a00000000           lcall 0, 0                         ; call System.WriteLn
0357  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:214
035c  a10000               mov ax, word ptr [0]               ; data PRZEDM.MLECZ
035f  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0363  751c                 jne 0x381                         
0365  bf0000               mov di, 0                          ; data System.OUTPUT
0368  1e                   push ds                           
0369  57                   push di                           
036a  bf0000               mov di, 0                          ; string "MLECZ WLASNIE DOWIODL ZE EINSTEIN SIE MYLIL"
036d  0e                   push cs                           
036e  57                   push di                           
036f  31c0                 xor ax, ax                        
0371  50                   push ax                           
0372  9a00000000           lcall 0, 0                         ; call System.WriteString
0377  9a00000000           lcall 0, 0                         ; call System.WriteLn
037c  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:215
0381  a10000               mov ax, word ptr [0]               ; data PRZEDM.DMUCHAWIEC
0384  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0388  751c                 jne 0x3a6                         
038a  bf0000               mov di, 0                          ; data System.OUTPUT
038d  1e                   push ds                           
038e  57                   push di                           
038f  bf0000               mov di, 0                          ; string "DMUCHAWIEC WLASNIE DOJRZAL DO TEGO ABY GO ZDMUCHNAC"
0392  0e                   push cs                           
0393  57                   push di                           
0394  31c0                 xor ax, ax                        
0396  50                   push ax                           
0397  9a00000000           lcall 0, 0                         ; call System.WriteString
039c  9a00000000           lcall 0, 0                         ; call System.WriteLn
03a1  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:216
03a6  a10000               mov ax, word ptr [0]               ; data PRZEDM.ROZA
03a9  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
03ad  751c                 jne 0x3cb                         
03af  bf0000               mov di, 0                          ; data System.OUTPUT
03b2  1e                   push ds                           
03b3  57                   push di                           
03b4  bf0000               mov di, 0                          ; string "PRZEROSNIETA ROZA POKAZUJE KOLCE NA ZNAK IZ NIE WARTO JEJ ATAKOWAC"
03b7  0e                   push cs                           
03b8  57                   push di                           
03b9  31c0                 xor ax, ax                        
03bb  50                   push ax                           
03bc  9a00000000           lcall 0, 0                         ; call System.WriteString
03c1  9a00000000           lcall 0, 0                         ; call System.WriteLn
03c6  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:217
03cb  a10000               mov ax, word ptr [0]               ; data PRZEDM.OSET
03ce  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
03d2  751c                 jne 0x3f0                         
03d4  bf0000               mov di, 0                          ; data System.OUTPUT
03d7  1e                   push ds                           
03d8  57                   push di                           
03d9  bf0000               mov di, 0                          ; string "KIEDYS MYSLALES ZE OSET TO LATWY DO WYRWANIA CHWAST ... MYLILES SIE"
03dc  0e                   push cs                           
03dd  57                   push di                           
03de  31c0                 xor ax, ax                        
03e0  50                   push ax                           
03e1  9a00000000           lcall 0, 0                         ; call System.WriteString
03e6  9a00000000           lcall 0, 0                         ; call System.WriteLn
03eb  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:218
03f0  a10000               mov ax, word ptr [0]               ; data PRZEDM.JEZYNA
03f3  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
03f7  751c                 jne 0x415                         
03f9  bf0000               mov di, 0                          ; data System.OUTPUT
03fc  1e                   push ds                           
03fd  57                   push di                           
03fe  bf0000               mov di, 0                          ; string "TA JEZYNA W CIEMNOSCIACH WYGLADA JAK JAKIS NIEBYWALY SMOK ... "
0401  0e                   push cs                           
0402  57                   push di                           
0403  31c0                 xor ax, ax                        
0405  50                   push ax                           
0406  9a00000000           lcall 0, 0                         ; call System.WriteString
040b  9a00000000           lcall 0, 0                         ; call System.WriteLn
0410  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:219
0415  a10000               mov ax, word ptr [0]               ; data PRZEDM.AGREST
0418  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
041c  751c                 jne 0x43a                         
041e  bf0000               mov di, 0                          ; data System.OUTPUT
0421  1e                   push ds                           
0422  57                   push di                           
0423  bf0000               mov di, 0                          ; string "AGREST JEST TU , CHCESZ SPROBOWAC JAK SMAKUJE ?"
0426  0e                   push cs                           
0427  57                   push di                           
0428  31c0                 xor ax, ax                        
042a  50                   push ax                           
042b  9a00000000           lcall 0, 0                         ; call System.WriteString
0430  9a00000000           lcall 0, 0                         ; call System.WriteLn
0435  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:220
043a  a10000               mov ax, word ptr [0]               ; data PRZEDM.MALINA
043d  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0441  751c                 jne 0x45f                         
0443  bf0000               mov di, 0                          ; data System.OUTPUT
0446  1e                   push ds                           
0447  57                   push di                           
0448  bf0000               mov di, 0                          ; string "MALINA JAK DZIEWCZYNA , CHOC DZIEWCZYNY NIE SA CHYBA AZ TAKIMI MUTANTAMI"
044b  0e                   push cs                           
044c  57                   push di                           
044d  31c0                 xor ax, ax                        
044f  50                   push ax                           
0450  9a00000000           lcall 0, 0                         ; call System.WriteString
0455  9a00000000           lcall 0, 0                         ; call System.WriteLn
045a  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:221
045f  a10000               mov ax, word ptr [0]               ; data PRZEDM.TRAWA
0462  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0466  751c                 jne 0x484                         
0468  bf0000               mov di, 0                          ; data System.OUTPUT
046b  1e                   push ds                           
046c  57                   push di                           
046d  bf0000               mov di, 0                          ; string "TRAWA NIE WYDAJE SIE TRUDNYM PRZECIWNIKIEM , LECZ NIE DAJ SIE ZWIESC"
0470  0e                   push cs                           
0471  57                   push di                           
0472  31c0                 xor ax, ax                        
0474  50                   push ax                           
0475  9a00000000           lcall 0, 0                         ; call System.WriteString
047a  9a00000000           lcall 0, 0                         ; call System.WriteLn
047f  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:222
0484  a00000               mov al, byte ptr [0]               ; data PRZEDM.DUNCAN
0487  98                   cbw                               
0488  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
048c  751c                 jne 0x4aa                         
048e  bf0000               mov di, 0                          ; data System.OUTPUT
0491  1e                   push ds                           
0492  57                   push di                           
0493  bf0000               mov di, 0                          ; string "ROLNIK DUNCAN PROBOJE ZAPANOWAC NAD TYM ZYWIOLEM I UPRAWIAC SWOJE MARCHEWKI"
0496  0e                   push cs                           
0497  57                   push di                           
0498  31c0                 xor ax, ax                        
049a  50                   push ax                           
049b  9a00000000           lcall 0, 0                         ; call System.WriteString
04a0  9a00000000           lcall 0, 0                         ; call System.WriteLn
04a5  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:223
04aa  5d                   pop bp                            
04ab  cb                   retf                              
```

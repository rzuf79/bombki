# `PRZEDM.BRANIE`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:908-963`
- TPU code block: `0x00d0`
- Procedure bytes: `0x023f`–`0x0508`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `MONSTRA.MAXE`
- `PRZEDM.DYPLOM`
- `PRZEDM.FAJKA`
- `PRZEDM.MAD`
- `PRZEDM.MAXMAD`
- `PRZEDM.MIECHO2`
- `PRZEDM.MMIECZ`
- `PRZEDM.MTARCZA`
- `PRZEDM.PRZED`
- `PRZEDM.SERCE`
- `PRZEDM.wpisz`
- `System.OUTPUT`

## Calls

- `System.CompareString`
- `System.WriteLn`
- `System.WriteString`
- `System.entry_0x0190`
- `System.entry_0x01a0`

## Exact strings

- `"BIERZ STARY"`
- `"PODNOSISZ STARY ZARDZEWIALY MIECZ I MASZ JAROWE ZE GO POSIADASZ"`
- `"BIERZ MALA"`
- `"PODNOSISZ MALA TARCZA (JEST OKRAGLA)"`
- `"BIERZ SERCE"`
- `"PODNOSISZ ZAKRWAWIONE SERCE (BLEEEE)"`
- `"BIERZ DYPLOM"`
- `"PODNOSISZ DYPLOM MUD SZKOLY , I CZUJESZ PRZEPLYWAJACA PRZEZ CIEBIE MOC"`
- `"BIERZ FAJKA"`
- `"PODNOSISZ FAJKE "`
- `"ODRZUC STARY"`
- `"ODRZUCASZ STARY ZARDZEWIALY MIECZ I MASZ JAROWE ZE GO NIE POSIADASZ"`
- `"ODRZUC FAJKA"`
- `"WYRZUCASZ FAJKE "`
- `"ODRZUC MALA"`
- `"ODRZUCASZ MALA ZWYKLA TARCZE "`
- `"ODRZUC SERCE"`
- `"ODRZUCASZ ZAKRWAWIONE SERCE "`
- `"ODRZUC DYPLOM"`
- `"ODRZUCASZ DYPLOM MUD SZKOLY , I PRZESTAJESZ CZUC PRZEPLYWAJACA PRZEZ CIEBIE MOC"`

## Annotated listing

```asm
; PRZEDM.PAS:908
023f  55                   push bp                           
0240  89e5                 mov bp, sp                        
0242  31c0                 xor ax, ax                        
0244  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:909
0249  bf0000               mov di, 0                          ; data PRZEDM.wpisz
024c  1e                   push ds                           
024d  57                   push di                           
024e  bf0000               mov di, 0                          ; string "BIERZ STARY"
0251  0e                   push cs                           
0252  57                   push di                           
0253  9a00000000           lcall 0, 0                         ; call System.CompareString
0258  7532                 jne 0x28c                         
025a  a10000               mov ax, word ptr [0]               ; data PRZEDM.MMIECZ
025d  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO2
0261  7529                 jne 0x28c                         
; PRZEDM.PAS:910
0263  bf0000               mov di, 0                          ; data System.OUTPUT
0266  1e                   push ds                           
0267  57                   push di                           
0268  bf0000               mov di, 0                          ; string "PODNOSISZ STARY ZARDZEWIALY MIECZ I MASZ JAROWE ZE GO POSIADASZ"
026b  0e                   push cs                           
026c  57                   push di                           
026d  31c0                 xor ax, ax                        
026f  50                   push ax                           
0270  9a00000000           lcall 0, 0                         ; call System.WriteString
0275  9a00000000           lcall 0, 0                         ; call System.WriteLn
027a  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:911
027f  c7060000f6ff         mov word ptr [0], 0xfff6           ; data PRZEDM.MMIECZ
; PRZEDM.PAS:912
0285  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
0288  40                   inc ax                            
0289  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:914
028c  bf0000               mov di, 0                          ; data PRZEDM.wpisz
028f  1e                   push ds                           
0290  57                   push di                           
0291  bf0000               mov di, 0                          ; string "BIERZ MALA"
0294  0e                   push cs                           
0295  57                   push di                           
0296  9a00000000           lcall 0, 0                         ; call System.CompareString
029b  7532                 jne 0x2cf                         
029d  a10000               mov ax, word ptr [0]               ; data PRZEDM.MTARCZA
02a0  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO2
02a4  7529                 jne 0x2cf                         
; PRZEDM.PAS:915
02a6  bf0000               mov di, 0                          ; data System.OUTPUT
02a9  1e                   push ds                           
02aa  57                   push di                           
02ab  bf0000               mov di, 0                          ; string "PODNOSISZ MALA TARCZA (JEST OKRAGLA)"
02ae  0e                   push cs                           
02af  57                   push di                           
02b0  31c0                 xor ax, ax                        
02b2  50                   push ax                           
02b3  9a00000000           lcall 0, 0                         ; call System.WriteString
02b8  9a00000000           lcall 0, 0                         ; call System.WriteLn
02bd  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:916
02c2  c7060000f6ff         mov word ptr [0], 0xfff6           ; data PRZEDM.MTARCZA
; PRZEDM.PAS:917
02c8  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
02cb  40                   inc ax                            
02cc  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:919
02cf  bf0000               mov di, 0                          ; data PRZEDM.wpisz
02d2  1e                   push ds                           
02d3  57                   push di                           
02d4  bf0000               mov di, 0                          ; string "BIERZ SERCE"
02d7  0e                   push cs                           
02d8  57                   push di                           
02d9  9a00000000           lcall 0, 0                         ; call System.CompareString
02de  7532                 jne 0x312                         
02e0  a10000               mov ax, word ptr [0]               ; data PRZEDM.SERCE
02e3  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO2
02e7  7529                 jne 0x312                         
; PRZEDM.PAS:920
02e9  bf0000               mov di, 0                          ; data System.OUTPUT
02ec  1e                   push ds                           
02ed  57                   push di                           
02ee  bf0000               mov di, 0                          ; string "PODNOSISZ ZAKRWAWIONE SERCE (BLEEEE)"
02f1  0e                   push cs                           
02f2  57                   push di                           
02f3  31c0                 xor ax, ax                        
02f5  50                   push ax                           
02f6  9a00000000           lcall 0, 0                         ; call System.WriteString
02fb  9a00000000           lcall 0, 0                         ; call System.WriteLn
0300  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:921
0305  c7060000f6ff         mov word ptr [0], 0xfff6           ; data PRZEDM.SERCE
; PRZEDM.PAS:922
030b  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
030e  40                   inc ax                            
030f  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:924
0312  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0315  1e                   push ds                           
0316  57                   push di                           
0317  bf0000               mov di, 0                          ; string "BIERZ DYPLOM"
031a  0e                   push cs                           
031b  57                   push di                           
031c  9a00000000           lcall 0, 0                         ; call System.CompareString
0321  753b                 jne 0x35e                         
0323  a10000               mov ax, word ptr [0]               ; data PRZEDM.DYPLOM
0326  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO2
032a  7532                 jne 0x35e                         
; PRZEDM.PAS:925
032c  bf0000               mov di, 0                          ; data System.OUTPUT
032f  1e                   push ds                           
0330  57                   push di                           
0331  bf0000               mov di, 0                          ; string "PODNOSISZ DYPLOM MUD SZKOLY , I CZUJESZ PRZEPLYWAJACA PRZEZ CIEBIE MOC"
0334  0e                   push cs                           
0335  57                   push di                           
0336  31c0                 xor ax, ax                        
0338  50                   push ax                           
0339  9a00000000           lcall 0, 0                         ; call System.WriteString
033e  9a00000000           lcall 0, 0                         ; call System.WriteLn
0343  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:926
0348  c7060000f6ff         mov word ptr [0], 0xfff6           ; data PRZEDM.DYPLOM
; PRZEDM.PAS:927
034e  a10000               mov ax, word ptr [0]               ; data MONSTRA.MAXE
0351  050500               add ax, 5                         
0354  a30000               mov word ptr [0], ax               ; data MONSTRA.MAXE
; PRZEDM.PAS:928
0357  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
035a  40                   inc ax                            
035b  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:930
035e  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0361  1e                   push ds                           
0362  57                   push di                           
0363  bf0000               mov di, 0                          ; string "BIERZ FAJKA"
0366  0e                   push cs                           
0367  57                   push di                           
0368  9a00000000           lcall 0, 0                         ; call System.CompareString
036d  7542                 jne 0x3b1                         
036f  a10000               mov ax, word ptr [0]               ; data PRZEDM.FAJKA
0372  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO2
0376  7539                 jne 0x3b1                         
; PRZEDM.PAS:931
0378  bf0000               mov di, 0                          ; data System.OUTPUT
037b  1e                   push ds                           
037c  57                   push di                           
037d  bf0000               mov di, 0                          ; string "PODNOSISZ FAJKE "
0380  0e                   push cs                           
0381  57                   push di                           
0382  31c0                 xor ax, ax                        
0384  50                   push ax                           
0385  9a00000000           lcall 0, 0                         ; call System.WriteString
038a  9a00000000           lcall 0, 0                         ; call System.WriteLn
038f  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:932
0394  c7060000f6ff         mov word ptr [0], 0xfff6           ; data PRZEDM.FAJKA
; PRZEDM.PAS:933
039a  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
039d  40                   inc ax                            
039e  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:934
03a1  a10000               mov ax, word ptr [0]               ; data PRZEDM.MAD
03a4  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MAXMAD
03a8  7d07                 jge 0x3b1                         
03aa  a10000               mov ax, word ptr [0]               ; data PRZEDM.MAD
03ad  40                   inc ax                            
03ae  a30000               mov word ptr [0], ax               ; data PRZEDM.MAD
; PRZEDM.PAS:936
03b1  bf0000               mov di, 0                          ; data PRZEDM.wpisz
03b4  1e                   push ds                           
03b5  57                   push di                           
03b6  bf0000               mov di, 0                          ; string "ODRZUC STARY"
03b9  0e                   push cs                           
03ba  57                   push di                           
03bb  9a00000000           lcall 0, 0                         ; call System.CompareString
03c0  7530                 jne 0x3f2                         
03c2  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.MMIECZ
03c7  7529                 jne 0x3f2                         
; PRZEDM.PAS:937
03c9  bf0000               mov di, 0                          ; data System.OUTPUT
03cc  1e                   push ds                           
03cd  57                   push di                           
03ce  bf0000               mov di, 0                          ; string "ODRZUCASZ STARY ZARDZEWIALY MIECZ I MASZ JAROWE ZE GO NIE POSIADASZ"
03d1  0e                   push cs                           
03d2  57                   push di                           
03d3  31c0                 xor ax, ax                        
03d5  50                   push ax                           
03d6  9a00000000           lcall 0, 0                         ; call System.WriteString
03db  9a00000000           lcall 0, 0                         ; call System.WriteLn
03e0  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:938
03e5  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO2
03e8  a30000               mov word ptr [0], ax               ; data PRZEDM.MMIECZ
; PRZEDM.PAS:939
03eb  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
03ee  48                   dec ax                            
03ef  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:941
03f2  bf0000               mov di, 0                          ; data PRZEDM.wpisz
03f5  1e                   push ds                           
03f6  57                   push di                           
03f7  bf0000               mov di, 0                          ; string "ODRZUC FAJKA"
03fa  0e                   push cs                           
03fb  57                   push di                           
03fc  9a00000000           lcall 0, 0                         ; call System.CompareString
0401  7537                 jne 0x43a                         
0403  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.FAJKA
0408  7530                 jne 0x43a                         
; PRZEDM.PAS:942
040a  bf0000               mov di, 0                          ; data System.OUTPUT
040d  1e                   push ds                           
040e  57                   push di                           
040f  bf0000               mov di, 0                          ; string "WYRZUCASZ FAJKE "
0412  0e                   push cs                           
0413  57                   push di                           
0414  31c0                 xor ax, ax                        
0416  50                   push ax                           
0417  9a00000000           lcall 0, 0                         ; call System.WriteString
041c  9a00000000           lcall 0, 0                         ; call System.WriteLn
0421  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:943
0426  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO2
0429  a30000               mov word ptr [0], ax               ; data PRZEDM.FAJKA
; PRZEDM.PAS:944
042c  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
042f  48                   dec ax                            
0430  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:945
0433  a10000               mov ax, word ptr [0]               ; data PRZEDM.MAD
0436  48                   dec ax                            
0437  a30000               mov word ptr [0], ax               ; data PRZEDM.MAD
; PRZEDM.PAS:947
043a  bf0000               mov di, 0                          ; data PRZEDM.wpisz
043d  1e                   push ds                           
043e  57                   push di                           
043f  bf0000               mov di, 0                          ; string "ODRZUC MALA"
0442  0e                   push cs                           
0443  57                   push di                           
0444  9a00000000           lcall 0, 0                         ; call System.CompareString
0449  7530                 jne 0x47b                         
044b  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.MTARCZA
0450  7529                 jne 0x47b                         
; PRZEDM.PAS:948
0452  bf0000               mov di, 0                          ; data System.OUTPUT
0455  1e                   push ds                           
0456  57                   push di                           
0457  bf0000               mov di, 0                          ; string "ODRZUCASZ MALA ZWYKLA TARCZE "
045a  0e                   push cs                           
045b  57                   push di                           
045c  31c0                 xor ax, ax                        
045e  50                   push ax                           
045f  9a00000000           lcall 0, 0                         ; call System.WriteString
0464  9a00000000           lcall 0, 0                         ; call System.WriteLn
0469  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:949
046e  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO2
0471  a30000               mov word ptr [0], ax               ; data PRZEDM.MTARCZA
; PRZEDM.PAS:950
0474  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
0477  48                   dec ax                            
0478  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:952
047b  bf0000               mov di, 0                          ; data PRZEDM.wpisz
047e  1e                   push ds                           
047f  57                   push di                           
0480  bf0000               mov di, 0                          ; string "ODRZUC SERCE"
0483  0e                   push cs                           
0484  57                   push di                           
0485  9a00000000           lcall 0, 0                         ; call System.CompareString
048a  7530                 jne 0x4bc                         
048c  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.SERCE
0491  7529                 jne 0x4bc                         
; PRZEDM.PAS:953
0493  bf0000               mov di, 0                          ; data System.OUTPUT
0496  1e                   push ds                           
0497  57                   push di                           
0498  bf0000               mov di, 0                          ; string "ODRZUCASZ ZAKRWAWIONE SERCE "
049b  0e                   push cs                           
049c  57                   push di                           
049d  31c0                 xor ax, ax                        
049f  50                   push ax                           
04a0  9a00000000           lcall 0, 0                         ; call System.WriteString
04a5  9a00000000           lcall 0, 0                         ; call System.WriteLn
04aa  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:954
04af  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO2
04b2  a30000               mov word ptr [0], ax               ; data PRZEDM.SERCE
; PRZEDM.PAS:955
04b5  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
04b8  48                   dec ax                            
04b9  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:957
04bc  bf0000               mov di, 0                          ; data PRZEDM.wpisz
04bf  1e                   push ds                           
04c0  57                   push di                           
04c1  bf0000               mov di, 0                          ; string "ODRZUC DYPLOM"
04c4  0e                   push cs                           
04c5  57                   push di                           
04c6  9a00000000           lcall 0, 0                         ; call System.CompareString
04cb  7539                 jne 0x506                         
04cd  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.DYPLOM
04d2  7532                 jne 0x506                         
; PRZEDM.PAS:958
04d4  bf0000               mov di, 0                          ; data System.OUTPUT
04d7  1e                   push ds                           
04d8  57                   push di                           
04d9  bf0000               mov di, 0                          ; string "ODRZUCASZ DYPLOM MUD SZKOLY , I PRZESTAJESZ CZUC PRZEPLYWAJACA PRZEZ CIEBIE MOC"
04dc  0e                   push cs                           
04dd  57                   push di                           
04de  31c0                 xor ax, ax                        
04e0  50                   push ax                           
04e1  9a00000000           lcall 0, 0                         ; call System.WriteString
04e6  9a00000000           lcall 0, 0                         ; call System.WriteLn
04eb  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:959
04f0  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO2
04f3  a30000               mov word ptr [0], ax               ; data PRZEDM.DYPLOM
; PRZEDM.PAS:960
04f6  a10000               mov ax, word ptr [0]               ; data MONSTRA.MAXE
04f9  2d0500               sub ax, 5                         
04fc  a30000               mov word ptr [0], ax               ; data MONSTRA.MAXE
; PRZEDM.PAS:961
04ff  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
0502  48                   dec ax                            
0503  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:963
0506  5d                   pop bp                            
0507  cb                   retf                              
```

# `PRZEDM.UZYWANIE`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:965-1108`
- TPU code block: `0x00d8`
- Procedure bytes: `0x07c6`–`0x10e7`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `MONSTRA.MAXE`
- `PRZEDM.BIGOS`
- `PRZEDM.BULKA`
- `PRZEDM.CHLEB`
- `PRZEDM.CIALO`
- `PRZEDM.CIASTKO`
- `PRZEDM.DYPLOM`
- `PRZEDM.ENERGIA`
- `PRZEDM.FAJKA`
- `PRZEDM.FUKSROLL`
- `PRZEDM.GARNITUR`
- `PRZEDM.ILOSC`
- `PRZEDM.JAKIEUB`
- `PRZEDM.KOMPLET`
- `PRZEDM.KUNSZT`
- `PRZEDM.LISTEK`
- `PRZEDM.MAD`
- `PRZEDM.MANA`
- `PRZEDM.MAXMANA`
- `PRZEDM.MBUTELKA`
- `PRZEDM.PACZEK`
- `PRZEDM.PIGULKA`
- `PRZEDM.PRO`
- `PRZEDM.PRZED`
- `PRZEDM.PRZEPUSTKA`
- `PRZEDM.SERCE`
- `PRZEDM.SUCHA`
- `PRZEDM.WEKA`
- `PRZEDM.wpisz`
- `PRZEDM:0x0038+0x0006`
- `System.OUTPUT`

## Calls

- `PRZEDM.POTWORY`
- `System.CompareString`
- `System.WriteLn`
- `System.WriteString`
- `System.entry_0x0060`
- `System.entry_0x0190`
- `System.entry_0x01a0`

## Exact strings

- `"UZYJ FAJKA"`
- `"ZAPALASZ FAJECZKE I PYKASZ Z ZADOWOLENIEM"`
- `"UZYJ SERCE"`
- `"ZJADASZ ZAKRWAWIONE SERCE I ODZYSKUJESZ 5% ENERGII"`
- `"UZYJ DYPLOM"`
- `"PATRZYSZ SIE NA DYPLOM:"`
- `"--------------------------------------"`
- `"|         DYPLOM MUD SZKOLY          |"`
- `"|                                    |"`
- `"|  BRAWO! BEZ WIEKSZYCH PROBLEMOW    |"`
- `"|  PRZEBRNALES PRZEZ MUD SZKOLE      |"`
- `"|  W NAGRODE ZA DUZA AKTYWNOSC       |"`
- `"|  DAJE CI OTO TEN DYPLOM MUD SZKOLY |"`
- `"|____________________________________|"`
- `"UZYJ PACZEK"`
- `"ZJADASZ PACZKA I TYJESZ 1 KILO (DOSTAJESZ 8%ENERGII)"`
- `"UZYJ CIASTKO"`
- `"ZJADASZ CIASTKO I TYJESZ 2 KILO (DOSTAJESZ 12% ENERGII)"`
- `"UZYJ SUCHA RACJA"`
- `"ZJADASZ SUCHA RACJE I CHUDNIESZ 3 KILO (DOSTAJESZ 16% ENERGII)"`
- `"UZYJ BULKA"`
- `"ZJADASZ BULKE I STWIERDZASZ ZE ZYSKALES 20%"`
- `"ZNISZCZ PRZEPUSTKA"`
- `"GRRRRRRRRR .... GLUPIA PRZEPUSTKA"`
- `"PATRZ PRZEPUSTKA"`
- `"|========================|"`
- `"| Niniejszym zaswiadczam |"`
- `"|  Iz osoba posiadajaca  |"`
- `"|      Ten dokument      |"`
- `"|   Ukonczyla pozytywnie |"`
- `"| Jeden z moich questów  |"`
- `"UZYJ CHLEB"`
- `"ZJADASZ DUZY CIEPLY CHLEB I JESTES PELEN (ZYSKUJESZ 26%)"`
- `"UZYJ KASETA"`
- `"TEN PRZEMIOT JEST TYPU : SMIEC . S.Z -8 MAXE +5 ZRE +1 "`
- `"UZYJ WEKA"`
- `"ZJADASZ DLUGASNA WEKE I TYJAC 15 KILO ZYSKUJESZ 34%"`
- `"UZYJ MALA BUTELKA MANY"`
- `"WYPIJASZ MALA BUTELKE MANY I ODZYSKUJESZ 30 MANY"`
- `"UZYJ BIGOS"`
- `"ZJADASZ BIGOS Z WROGA I ODZYSKUJESZ 20% ENERGI"`
- `"UZYJ KOMPLET"`
- `"NAKLADASZ KOMPLET UBRAN FIRMY \"SYF\""`
- `"SYF"`
- `"ODLORZ KOMPLET"`
- `"ZDEJMUJESZ KOMPLET UBRAN FIRMY \"SYF\""`
- `"UZYJ LISTEK"`
- `"LISTEK JEST TYPU SMIEC MAX PRZEDMIOTOW + 3 "`
- `"UZYJ GARNITUR"`
- `"NAKLADASZ GARNITUR Z KOLCAMI NA SWE (NIE)WYSPORTOWANE CIALO"`
- `"GARNITUR"`
- `"UZYJ PIGULKA"`
- `"WSZYSTKO ZACZYNA WIROWAC , POTEM NAGLY BLYSK I ZNAJDUJESZ SIE W PRZESZLOSCI"`
- `"BRAK OBYCIA W POSLUGIWANIU SIE MAGICZNYMI PRZEDMIOTAMI SPRAWIL ZE "`
- `"ZNACZNIE OPADLES Z SIL I STALES SIE BARDZO ZMECZONY"`
- `"MASZ PEWNE OBYCIE W MAGICZNYCH PRZEDMIOTACH ALE MIMO WSZYSTKO"`
- `"OPADLES Z SIL I STALES SIE ZMECZONY"`
- `"ZNASZ SIE NA TEGO TYPU PRZEDMIOTACH , WYSZEDLES Z TEGO BEZ SZWANKU"`
- `"ODLORZ GARNITUR"`
- `"ZDEJMUJESZ GARNITUR Z KOLCAMI ZE SWEGO (NIE)WYSPORTOWANEGO CIALA"`

## Annotated listing

```asm
; PRZEDM.PAS:965
07c6  55                   push bp                           
07c7  89e5                 mov bp, sp                        
07c9  31c0                 xor ax, ax                        
07cb  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:966
07d0  bf0000               mov di, 0                          ; data PRZEDM.wpisz
07d3  1e                   push ds                           
07d4  57                   push di                           
07d5  bf0000               mov di, 0                          ; string "UZYJ FAJKA"
07d8  0e                   push cs                           
07d9  57                   push di                           
07da  9a00000000           lcall 0, 0                         ; call System.CompareString
07df  7523                 jne 0x804                         
07e1  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.FAJKA
07e6  751c                 jne 0x804                         
07e8  bf0000               mov di, 0                          ; data System.OUTPUT
07eb  1e                   push ds                           
07ec  57                   push di                           
07ed  bf0000               mov di, 0                          ; string "ZAPALASZ FAJECZKE I PYKASZ Z ZADOWOLENIEM"
07f0  0e                   push cs                           
07f1  57                   push di                           
07f2  31c0                 xor ax, ax                        
07f4  50                   push ax                           
07f5  9a00000000           lcall 0, 0                         ; call System.WriteString
07fa  9a00000000           lcall 0, 0                         ; call System.WriteLn
07ff  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:967
0804  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0807  1e                   push ds                           
0808  57                   push di                           
0809  bf0000               mov di, 0                          ; string "UZYJ SERCE"
080c  0e                   push cs                           
080d  57                   push di                           
080e  9a00000000           lcall 0, 0                         ; call System.CompareString
0813  7547                 jne 0x85c                         
0815  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.SERCE
081a  7540                 jne 0x85c                         
; PRZEDM.PAS:968
081c  31c0                 xor ax, ax                        
081e  a30000               mov word ptr [0], ax               ; data PRZEDM.SERCE
; PRZEDM.PAS:969
0821  bf0000               mov di, 0                          ; data System.OUTPUT
0824  1e                   push ds                           
0825  57                   push di                           
0826  bf0000               mov di, 0                          ; string "ZJADASZ ZAKRWAWIONE SERCE I ODZYSKUJESZ 5% ENERGII"
0829  0e                   push cs                           
082a  57                   push di                           
082b  31c0                 xor ax, ax                        
082d  50                   push ax                           
082e  9a00000000           lcall 0, 0                         ; call System.WriteString
0833  9a00000000           lcall 0, 0                         ; call System.WriteLn
0838  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:970
083d  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
0840  050500               add ax, 5                         
0843  a30000               mov word ptr [0], ax               ; data PRZEDM.ENERGIA
; PRZEDM.PAS:971
0846  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
0849  3b060000             cmp ax, word ptr [0]               ; data MONSTRA.MAXE
084d  7e06                 jle 0x855                         
084f  a10000               mov ax, word ptr [0]               ; data MONSTRA.MAXE
0852  a30000               mov word ptr [0], ax               ; data PRZEDM.ENERGIA
; PRZEDM.PAS:972
0855  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
0858  48                   dec ax                            
0859  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:974
085c  bf0000               mov di, 0                          ; data PRZEDM.wpisz
085f  1e                   push ds                           
0860  57                   push di                           
0861  bf0000               mov di, 0                          ; string "UZYJ DYPLOM"
0864  0e                   push cs                           
0865  57                   push di                           
0866  9a00000000           lcall 0, 0                         ; call System.CompareString
086b  7403                 je 0x870                          
086d  e93e01               jmp 0x9ae                         
0870  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.DYPLOM
0875  7403                 je 0x87a                          
0877  e93401               jmp 0x9ae                         
; PRZEDM.PAS:975
087a  bf0000               mov di, 0                          ; data System.OUTPUT
087d  1e                   push ds                           
087e  57                   push di                           
087f  bf0000               mov di, 0                          ; string "PATRZYSZ SIE NA DYPLOM:"
0882  0e                   push cs                           
0883  57                   push di                           
0884  31c0                 xor ax, ax                        
0886  50                   push ax                           
0887  9a00000000           lcall 0, 0                         ; call System.WriteString
088c  9a00000000           lcall 0, 0                         ; call System.WriteLn
0891  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:976
0896  bf0000               mov di, 0                          ; data System.OUTPUT
0899  1e                   push ds                           
089a  57                   push di                           
089b  bf0000               mov di, 0                          ; string "--------------------------------------"
089e  0e                   push cs                           
089f  57                   push di                           
08a0  31c0                 xor ax, ax                        
08a2  50                   push ax                           
08a3  9a00000000           lcall 0, 0                         ; call System.WriteString
08a8  9a00000000           lcall 0, 0                         ; call System.WriteLn
08ad  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:977
08b2  bf0000               mov di, 0                          ; data System.OUTPUT
08b5  1e                   push ds                           
08b6  57                   push di                           
08b7  bf0000               mov di, 0                          ; string "|         DYPLOM MUD SZKOLY          |"
08ba  0e                   push cs                           
08bb  57                   push di                           
08bc  31c0                 xor ax, ax                        
08be  50                   push ax                           
08bf  9a00000000           lcall 0, 0                         ; call System.WriteString
08c4  9a00000000           lcall 0, 0                         ; call System.WriteLn
08c9  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:978
08ce  bf0000               mov di, 0                          ; data System.OUTPUT
08d1  1e                   push ds                           
08d2  57                   push di                           
08d3  bf0000               mov di, 0                          ; string "|                                    |"
08d6  0e                   push cs                           
08d7  57                   push di                           
08d8  31c0                 xor ax, ax                        
08da  50                   push ax                           
08db  9a00000000           lcall 0, 0                         ; call System.WriteString
08e0  9a00000000           lcall 0, 0                         ; call System.WriteLn
08e5  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:979
08ea  bf0000               mov di, 0                          ; data System.OUTPUT
08ed  1e                   push ds                           
08ee  57                   push di                           
08ef  bf0000               mov di, 0                          ; string "|                                    |"
08f2  0e                   push cs                           
08f3  57                   push di                           
08f4  31c0                 xor ax, ax                        
08f6  50                   push ax                           
08f7  9a00000000           lcall 0, 0                         ; call System.WriteString
08fc  9a00000000           lcall 0, 0                         ; call System.WriteLn
0901  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:980
0906  bf0000               mov di, 0                          ; data System.OUTPUT
0909  1e                   push ds                           
090a  57                   push di                           
090b  bf0000               mov di, 0                          ; string "|                                    |"
090e  0e                   push cs                           
090f  57                   push di                           
0910  31c0                 xor ax, ax                        
0912  50                   push ax                           
0913  9a00000000           lcall 0, 0                         ; call System.WriteString
0918  9a00000000           lcall 0, 0                         ; call System.WriteLn
091d  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:981
0922  bf0000               mov di, 0                          ; data System.OUTPUT
0925  1e                   push ds                           
0926  57                   push di                           
0927  bf0000               mov di, 0                          ; string "|  BRAWO! BEZ WIEKSZYCH PROBLEMOW    |"
092a  0e                   push cs                           
092b  57                   push di                           
092c  31c0                 xor ax, ax                        
092e  50                   push ax                           
092f  9a00000000           lcall 0, 0                         ; call System.WriteString
0934  9a00000000           lcall 0, 0                         ; call System.WriteLn
0939  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:982
093e  bf0000               mov di, 0                          ; data System.OUTPUT
0941  1e                   push ds                           
0942  57                   push di                           
0943  bf0000               mov di, 0                          ; string "|  PRZEBRNALES PRZEZ MUD SZKOLE      |"
0946  0e                   push cs                           
0947  57                   push di                           
0948  31c0                 xor ax, ax                        
094a  50                   push ax                           
094b  9a00000000           lcall 0, 0                         ; call System.WriteString
0950  9a00000000           lcall 0, 0                         ; call System.WriteLn
0955  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:983
095a  bf0000               mov di, 0                          ; data System.OUTPUT
095d  1e                   push ds                           
095e  57                   push di                           
095f  bf0000               mov di, 0                          ; string "|  W NAGRODE ZA DUZA AKTYWNOSC       |"
0962  0e                   push cs                           
0963  57                   push di                           
0964  31c0                 xor ax, ax                        
0966  50                   push ax                           
0967  9a00000000           lcall 0, 0                         ; call System.WriteString
096c  9a00000000           lcall 0, 0                         ; call System.WriteLn
0971  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:984
0976  bf0000               mov di, 0                          ; data System.OUTPUT
0979  1e                   push ds                           
097a  57                   push di                           
097b  bf0000               mov di, 0                          ; string "|  DAJE CI OTO TEN DYPLOM MUD SZKOLY |"
097e  0e                   push cs                           
097f  57                   push di                           
0980  31c0                 xor ax, ax                        
0982  50                   push ax                           
0983  9a00000000           lcall 0, 0                         ; call System.WriteString
0988  9a00000000           lcall 0, 0                         ; call System.WriteLn
098d  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:985
0992  bf0000               mov di, 0                          ; data System.OUTPUT
0995  1e                   push ds                           
0996  57                   push di                           
0997  bf0000               mov di, 0                          ; string "|____________________________________|"
099a  0e                   push cs                           
099b  57                   push di                           
099c  31c0                 xor ax, ax                        
099e  50                   push ax                           
099f  9a00000000           lcall 0, 0                         ; call System.WriteString
09a4  9a00000000           lcall 0, 0                         ; call System.WriteLn
09a9  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:987
09ae  bf0000               mov di, 0                          ; data PRZEDM.wpisz
09b1  1e                   push ds                           
09b2  57                   push di                           
09b3  bf0000               mov di, 0                          ; string "UZYJ PACZEK"
09b6  0e                   push cs                           
09b7  57                   push di                           
09b8  9a00000000           lcall 0, 0                         ; call System.CompareString
09bd  754b                 jne 0xa0a                         
09bf  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.PACZEK
09c4  7f44                 jg 0xa0a                          
; PRZEDM.PAS:988
09c6  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
09c9  48                   dec ax                            
09ca  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:989
09cd  a10000               mov ax, word ptr [0]               ; data PRZEDM.PACZEK
09d0  050a00               add ax, 0xa                       
09d3  a30000               mov word ptr [0], ax               ; data PRZEDM.PACZEK
; PRZEDM.PAS:990
09d6  bf0000               mov di, 0                          ; data System.OUTPUT
09d9  1e                   push ds                           
09da  57                   push di                           
09db  bf0000               mov di, 0                          ; string "ZJADASZ PACZKA I TYJESZ 1 KILO (DOSTAJESZ 8%ENERGII)"
09de  0e                   push cs                           
09df  57                   push di                           
09e0  31c0                 xor ax, ax                        
09e2  50                   push ax                           
09e3  9a00000000           lcall 0, 0                         ; call System.WriteString
09e8  9a00000000           lcall 0, 0                         ; call System.WriteLn
09ed  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:991
09f2  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
09f5  050800               add ax, 8                         
09f8  a30000               mov word ptr [0], ax               ; data PRZEDM.ENERGIA
; PRZEDM.PAS:992
09fb  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
09fe  3b060000             cmp ax, word ptr [0]               ; data MONSTRA.MAXE
0a02  7e06                 jle 0xa0a                         
0a04  a10000               mov ax, word ptr [0]               ; data MONSTRA.MAXE
0a07  a30000               mov word ptr [0], ax               ; data PRZEDM.ENERGIA
; PRZEDM.PAS:994
0a0a  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0a0d  1e                   push ds                           
0a0e  57                   push di                           
0a0f  bf0000               mov di, 0                          ; string "UZYJ CIASTKO"
0a12  0e                   push cs                           
0a13  57                   push di                           
0a14  9a00000000           lcall 0, 0                         ; call System.CompareString
0a19  754b                 jne 0xa66                         
0a1b  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.CIASTKO
0a20  7f44                 jg 0xa66                          
; PRZEDM.PAS:995
0a22  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
0a25  48                   dec ax                            
0a26  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:996
0a29  a10000               mov ax, word ptr [0]               ; data PRZEDM.CIASTKO
0a2c  050a00               add ax, 0xa                       
0a2f  a30000               mov word ptr [0], ax               ; data PRZEDM.CIASTKO
; PRZEDM.PAS:997
0a32  bf0000               mov di, 0                          ; data System.OUTPUT
0a35  1e                   push ds                           
0a36  57                   push di                           
0a37  bf0000               mov di, 0                          ; string "ZJADASZ CIASTKO I TYJESZ 2 KILO (DOSTAJESZ 12% ENERGII)"
0a3a  0e                   push cs                           
0a3b  57                   push di                           
0a3c  31c0                 xor ax, ax                        
0a3e  50                   push ax                           
0a3f  9a00000000           lcall 0, 0                         ; call System.WriteString
0a44  9a00000000           lcall 0, 0                         ; call System.WriteLn
0a49  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:998
0a4e  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
0a51  050c00               add ax, 0xc                       
0a54  a30000               mov word ptr [0], ax               ; data PRZEDM.ENERGIA
; PRZEDM.PAS:999
0a57  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
0a5a  3b060000             cmp ax, word ptr [0]               ; data MONSTRA.MAXE
0a5e  7e06                 jle 0xa66                         
0a60  a10000               mov ax, word ptr [0]               ; data MONSTRA.MAXE
0a63  a30000               mov word ptr [0], ax               ; data PRZEDM.ENERGIA
; PRZEDM.PAS:1001
0a66  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0a69  1e                   push ds                           
0a6a  57                   push di                           
0a6b  bf0000               mov di, 0                          ; string "UZYJ SUCHA RACJA"
0a6e  0e                   push cs                           
0a6f  57                   push di                           
0a70  9a00000000           lcall 0, 0                         ; call System.CompareString
0a75  754b                 jne 0xac2                         
0a77  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.SUCHA
0a7c  7f44                 jg 0xac2                          
; PRZEDM.PAS:1002
0a7e  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
0a81  48                   dec ax                            
0a82  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:1003
0a85  a10000               mov ax, word ptr [0]               ; data PRZEDM.SUCHA
0a88  050a00               add ax, 0xa                       
0a8b  a30000               mov word ptr [0], ax               ; data PRZEDM.SUCHA
; PRZEDM.PAS:1004
0a8e  bf0000               mov di, 0                          ; data System.OUTPUT
0a91  1e                   push ds                           
0a92  57                   push di                           
0a93  bf0000               mov di, 0                          ; string "ZJADASZ SUCHA RACJE I CHUDNIESZ 3 KILO (DOSTAJESZ 16% ENERGII)"
0a96  0e                   push cs                           
0a97  57                   push di                           
0a98  31c0                 xor ax, ax                        
0a9a  50                   push ax                           
0a9b  9a00000000           lcall 0, 0                         ; call System.WriteString
0aa0  9a00000000           lcall 0, 0                         ; call System.WriteLn
0aa5  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1005
0aaa  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
0aad  051000               add ax, 0x10                      
0ab0  a30000               mov word ptr [0], ax               ; data PRZEDM.ENERGIA
; PRZEDM.PAS:1006
0ab3  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
0ab6  3b060000             cmp ax, word ptr [0]               ; data MONSTRA.MAXE
0aba  7e06                 jle 0xac2                         
0abc  a10000               mov ax, word ptr [0]               ; data MONSTRA.MAXE
0abf  a30000               mov word ptr [0], ax               ; data PRZEDM.ENERGIA
; PRZEDM.PAS:1008
0ac2  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0ac5  1e                   push ds                           
0ac6  57                   push di                           
0ac7  bf0000               mov di, 0                          ; string "UZYJ BULKA"
0aca  0e                   push cs                           
0acb  57                   push di                           
0acc  9a00000000           lcall 0, 0                         ; call System.CompareString
0ad1  754b                 jne 0xb1e                         
0ad3  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.BULKA
0ad8  7f44                 jg 0xb1e                          
; PRZEDM.PAS:1009
0ada  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
0add  48                   dec ax                            
0ade  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:1010
0ae1  a10000               mov ax, word ptr [0]               ; data PRZEDM.BULKA
0ae4  050a00               add ax, 0xa                       
0ae7  a30000               mov word ptr [0], ax               ; data PRZEDM.BULKA
; PRZEDM.PAS:1011
0aea  bf0000               mov di, 0                          ; data System.OUTPUT
0aed  1e                   push ds                           
0aee  57                   push di                           
0aef  bf0000               mov di, 0                          ; string "ZJADASZ BULKE I STWIERDZASZ ZE ZYSKALES 20%"
0af2  0e                   push cs                           
0af3  57                   push di                           
0af4  31c0                 xor ax, ax                        
0af6  50                   push ax                           
0af7  9a00000000           lcall 0, 0                         ; call System.WriteString
0afc  9a00000000           lcall 0, 0                         ; call System.WriteLn
0b01  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1012
0b06  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
0b09  051400               add ax, 0x14                      
0b0c  a30000               mov word ptr [0], ax               ; data PRZEDM.ENERGIA
; PRZEDM.PAS:1013
0b0f  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
0b12  3b060000             cmp ax, word ptr [0]               ; data MONSTRA.MAXE
0b16  7e06                 jle 0xb1e                         
0b18  a10000               mov ax, word ptr [0]               ; data MONSTRA.MAXE
0b1b  a30000               mov word ptr [0], ax               ; data PRZEDM.ENERGIA
; PRZEDM.PAS:1015
0b1e  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0b21  1e                   push ds                           
0b22  57                   push di                           
0b23  bf0000               mov di, 0                          ; string "ZNISZCZ PRZEPUSTKA"
0b26  0e                   push cs                           
0b27  57                   push di                           
0b28  9a00000000           lcall 0, 0                         ; call System.CompareString
0b2d  7547                 jne 0xb76                         
0b2f  833e0000ff           cmp word ptr [0], -1               ; data PRZEDM:0x0038+0x0006
0b34  7c09                 jl 0xb3f                          
0b36  7f3e                 jg 0xb76                          
0b38  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.PRZEPUSTKA
0b3d  7737                 ja 0xb76                          
; PRZEDM.PAS:1016
0b3f  bf0000               mov di, 0                          ; data System.OUTPUT
0b42  1e                   push ds                           
0b43  57                   push di                           
0b44  bf0000               mov di, 0                          ; string "GRRRRRRRRR .... GLUPIA PRZEPUSTKA"
0b47  0e                   push cs                           
0b48  57                   push di                           
0b49  31c0                 xor ax, ax                        
0b4b  50                   push ax                           
0b4c  9a00000000           lcall 0, 0                         ; call System.WriteString
0b51  9a00000000           lcall 0, 0                         ; call System.WriteLn
0b56  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1017
0b5b  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZEPUSTKA
0b5e  8b160000             mov dx, word ptr [0]               ; data PRZEDM:0x0038+0x0006
0b62  050a00               add ax, 0xa                       
0b65  83d200               adc dx, 0                         
0b68  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZEPUSTKA
0b6b  89160000             mov word ptr [0], dx               ; data PRZEDM:0x0038+0x0006
; PRZEDM.PAS:1018
0b6f  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
0b72  40                   inc ax                            
0b73  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:1020
0b76  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0b79  1e                   push ds                           
0b7a  57                   push di                           
0b7b  bf0000               mov di, 0                          ; string "PATRZ PRZEPUSTKA"
0b7e  0e                   push cs                           
0b7f  57                   push di                           
0b80  9a00000000           lcall 0, 0                         ; call System.CompareString
0b85  7403                 je 0xb8a                          
0b87  e9da00               jmp 0xc64                         
0b8a  833e0000ff           cmp word ptr [0], -1               ; data PRZEDM:0x0038+0x0006
0b8f  7c0f                 jl 0xba0                          
0b91  7e03                 jle 0xb96                         
0b93  e9ce00               jmp 0xc64                         
0b96  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.PRZEPUSTKA
0b9b  7603                 jbe 0xba0                         
0b9d  e9c400               jmp 0xc64                         
; PRZEDM.PAS:1021
0ba0  bf0000               mov di, 0                          ; data System.OUTPUT
0ba3  1e                   push ds                           
0ba4  57                   push di                           
0ba5  bf0000               mov di, 0                          ; string "|========================|"
0ba8  0e                   push cs                           
0ba9  57                   push di                           
0baa  31c0                 xor ax, ax                        
0bac  50                   push ax                           
0bad  9a00000000           lcall 0, 0                         ; call System.WriteString
0bb2  9a00000000           lcall 0, 0                         ; call System.WriteLn
0bb7  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1022
0bbc  bf0000               mov di, 0                          ; data System.OUTPUT
0bbf  1e                   push ds                           
0bc0  57                   push di                           
0bc1  bf0000               mov di, 0                          ; string "| Niniejszym zaswiadczam |"
0bc4  0e                   push cs                           
0bc5  57                   push di                           
0bc6  31c0                 xor ax, ax                        
0bc8  50                   push ax                           
0bc9  9a00000000           lcall 0, 0                         ; call System.WriteString
0bce  9a00000000           lcall 0, 0                         ; call System.WriteLn
0bd3  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1023
0bd8  bf0000               mov di, 0                          ; data System.OUTPUT
0bdb  1e                   push ds                           
0bdc  57                   push di                           
0bdd  bf0000               mov di, 0                          ; string "|  Iz osoba posiadajaca  |"
0be0  0e                   push cs                           
0be1  57                   push di                           
0be2  31c0                 xor ax, ax                        
0be4  50                   push ax                           
0be5  9a00000000           lcall 0, 0                         ; call System.WriteString
0bea  9a00000000           lcall 0, 0                         ; call System.WriteLn
0bef  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1024
0bf4  bf0000               mov di, 0                          ; data System.OUTPUT
0bf7  1e                   push ds                           
0bf8  57                   push di                           
0bf9  bf0000               mov di, 0                          ; string "|      Ten dokument      |"
0bfc  0e                   push cs                           
0bfd  57                   push di                           
0bfe  31c0                 xor ax, ax                        
0c00  50                   push ax                           
0c01  9a00000000           lcall 0, 0                         ; call System.WriteString
0c06  9a00000000           lcall 0, 0                         ; call System.WriteLn
0c0b  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1025
0c10  bf0000               mov di, 0                          ; data System.OUTPUT
0c13  1e                   push ds                           
0c14  57                   push di                           
0c15  bf0000               mov di, 0                          ; string "|   Ukonczyla pozytywnie |"
0c18  0e                   push cs                           
0c19  57                   push di                           
0c1a  31c0                 xor ax, ax                        
0c1c  50                   push ax                           
0c1d  9a00000000           lcall 0, 0                         ; call System.WriteString
0c22  9a00000000           lcall 0, 0                         ; call System.WriteLn
0c27  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1026
0c2c  bf0000               mov di, 0                          ; data System.OUTPUT
0c2f  1e                   push ds                           
0c30  57                   push di                           
0c31  bf0000               mov di, 0                          ; string "| Jeden z moich questów  |"
0c34  0e                   push cs                           
0c35  57                   push di                           
0c36  31c0                 xor ax, ax                        
0c38  50                   push ax                           
0c39  9a00000000           lcall 0, 0                         ; call System.WriteString
0c3e  9a00000000           lcall 0, 0                         ; call System.WriteLn
0c43  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1027
0c48  bf0000               mov di, 0                          ; data System.OUTPUT
0c4b  1e                   push ds                           
0c4c  57                   push di                           
0c4d  bf0000               mov di, 0                          ; string "|========================|"
0c50  0e                   push cs                           
0c51  57                   push di                           
0c52  31c0                 xor ax, ax                        
0c54  50                   push ax                           
0c55  9a00000000           lcall 0, 0                         ; call System.WriteString
0c5a  9a00000000           lcall 0, 0                         ; call System.WriteLn
0c5f  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1029
0c64  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0c67  1e                   push ds                           
0c68  57                   push di                           
0c69  bf0000               mov di, 0                          ; string "UZYJ CHLEB"
0c6c  0e                   push cs                           
0c6d  57                   push di                           
0c6e  9a00000000           lcall 0, 0                         ; call System.CompareString
0c73  754b                 jne 0xcc0                         
0c75  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.CHLEB
0c7a  7f44                 jg 0xcc0                          
; PRZEDM.PAS:1030
0c7c  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
0c7f  48                   dec ax                            
0c80  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:1031
0c83  a10000               mov ax, word ptr [0]               ; data PRZEDM.CHLEB
0c86  050a00               add ax, 0xa                       
0c89  a30000               mov word ptr [0], ax               ; data PRZEDM.CHLEB
; PRZEDM.PAS:1032
0c8c  bf0000               mov di, 0                          ; data System.OUTPUT
0c8f  1e                   push ds                           
0c90  57                   push di                           
0c91  bf0000               mov di, 0                          ; string "ZJADASZ DUZY CIEPLY CHLEB I JESTES PELEN (ZYSKUJESZ 26%)"
0c94  0e                   push cs                           
0c95  57                   push di                           
0c96  31c0                 xor ax, ax                        
0c98  50                   push ax                           
0c99  9a00000000           lcall 0, 0                         ; call System.WriteString
0c9e  9a00000000           lcall 0, 0                         ; call System.WriteLn
0ca3  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1033
0ca8  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
0cab  051a00               add ax, 0x1a                      
0cae  a30000               mov word ptr [0], ax               ; data PRZEDM.ENERGIA
; PRZEDM.PAS:1034
0cb1  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
0cb4  3b060000             cmp ax, word ptr [0]               ; data MONSTRA.MAXE
0cb8  7e06                 jle 0xcc0                         
0cba  a10000               mov ax, word ptr [0]               ; data MONSTRA.MAXE
0cbd  a30000               mov word ptr [0], ax               ; data PRZEDM.ENERGIA
; PRZEDM.PAS:1036
0cc0  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0cc3  1e                   push ds                           
0cc4  57                   push di                           
0cc5  bf0000               mov di, 0                          ; string "UZYJ KASETA"
0cc8  0e                   push cs                           
0cc9  57                   push di                           
0cca  9a00000000           lcall 0, 0                         ; call System.CompareString
0ccf  751c                 jne 0xced                         
0cd1  bf0000               mov di, 0                          ; data System.OUTPUT
0cd4  1e                   push ds                           
0cd5  57                   push di                           
0cd6  bf0000               mov di, 0                          ; string "TEN PRZEMIOT JEST TYPU : SMIEC . S.Z -8 MAXE +5 ZRE +1 "
0cd9  0e                   push cs                           
0cda  57                   push di                           
0cdb  31c0                 xor ax, ax                        
0cdd  50                   push ax                           
0cde  9a00000000           lcall 0, 0                         ; call System.WriteString
0ce3  9a00000000           lcall 0, 0                         ; call System.WriteLn
0ce8  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1037
0ced  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0cf0  1e                   push ds                           
0cf1  57                   push di                           
0cf2  bf0000               mov di, 0                          ; string "UZYJ WEKA"
0cf5  0e                   push cs                           
0cf6  57                   push di                           
0cf7  9a00000000           lcall 0, 0                         ; call System.CompareString
0cfc  754b                 jne 0xd49                         
0cfe  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.WEKA
0d03  7f44                 jg 0xd49                          
; PRZEDM.PAS:1038
0d05  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
0d08  48                   dec ax                            
0d09  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:1039
0d0c  a10000               mov ax, word ptr [0]               ; data PRZEDM.WEKA
0d0f  050a00               add ax, 0xa                       
0d12  a30000               mov word ptr [0], ax               ; data PRZEDM.WEKA
; PRZEDM.PAS:1040
0d15  bf0000               mov di, 0                          ; data System.OUTPUT
0d18  1e                   push ds                           
0d19  57                   push di                           
0d1a  bf0000               mov di, 0                          ; string "ZJADASZ DLUGASNA WEKE I TYJAC 15 KILO ZYSKUJESZ 34%"
0d1d  0e                   push cs                           
0d1e  57                   push di                           
0d1f  31c0                 xor ax, ax                        
0d21  50                   push ax                           
0d22  9a00000000           lcall 0, 0                         ; call System.WriteString
0d27  9a00000000           lcall 0, 0                         ; call System.WriteLn
0d2c  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1041
0d31  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
0d34  052200               add ax, 0x22                      
0d37  a30000               mov word ptr [0], ax               ; data PRZEDM.ENERGIA
; PRZEDM.PAS:1042
0d3a  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
0d3d  3b060000             cmp ax, word ptr [0]               ; data MONSTRA.MAXE
0d41  7e06                 jle 0xd49                         
0d43  a10000               mov ax, word ptr [0]               ; data MONSTRA.MAXE
0d46  a30000               mov word ptr [0], ax               ; data PRZEDM.ENERGIA
; PRZEDM.PAS:1044
0d49  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0d4c  1e                   push ds                           
0d4d  57                   push di                           
0d4e  bf0000               mov di, 0                          ; string "UZYJ MALA BUTELKA MANY"
0d51  0e                   push cs                           
0d52  57                   push di                           
0d53  9a00000000           lcall 0, 0                         ; call System.CompareString
0d58  754b                 jne 0xda5                         
0d5a  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.MBUTELKA
0d5f  7f44                 jg 0xda5                          
; PRZEDM.PAS:1045
0d61  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
0d64  48                   dec ax                            
0d65  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:1046
0d68  a10000               mov ax, word ptr [0]               ; data PRZEDM.MBUTELKA
0d6b  050a00               add ax, 0xa                       
0d6e  a30000               mov word ptr [0], ax               ; data PRZEDM.MBUTELKA
; PRZEDM.PAS:1047
0d71  bf0000               mov di, 0                          ; data System.OUTPUT
0d74  1e                   push ds                           
0d75  57                   push di                           
0d76  bf0000               mov di, 0                          ; string "WYPIJASZ MALA BUTELKE MANY I ODZYSKUJESZ 30 MANY"
0d79  0e                   push cs                           
0d7a  57                   push di                           
0d7b  31c0                 xor ax, ax                        
0d7d  50                   push ax                           
0d7e  9a00000000           lcall 0, 0                         ; call System.WriteString
0d83  9a00000000           lcall 0, 0                         ; call System.WriteLn
0d88  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1048
0d8d  a10000               mov ax, word ptr [0]               ; data PRZEDM.MANA
0d90  051e00               add ax, 0x1e                      
0d93  a30000               mov word ptr [0], ax               ; data PRZEDM.MANA
; PRZEDM.PAS:1049
0d96  a10000               mov ax, word ptr [0]               ; data PRZEDM.MANA
0d99  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MAXMANA
0d9d  7e06                 jle 0xda5                         
0d9f  a10000               mov ax, word ptr [0]               ; data PRZEDM.MAXMANA
0da2  a30000               mov word ptr [0], ax               ; data PRZEDM.MANA
; PRZEDM.PAS:1051
0da5  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0da8  1e                   push ds                           
0da9  57                   push di                           
0daa  bf0000               mov di, 0                          ; string "UZYJ BIGOS"
0dad  0e                   push cs                           
0dae  57                   push di                           
0daf  9a00000000           lcall 0, 0                         ; call System.CompareString
0db4  754c                 jne 0xe02                         
0db6  803e0000f6           cmp byte ptr [0], 0xf6             ; data PRZEDM.BIGOS
0dbb  7f45                 jg 0xe02                          
; PRZEDM.PAS:1052
0dbd  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
0dc0  48                   dec ax                            
0dc1  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:1053
0dc4  a00000               mov al, byte ptr [0]               ; data PRZEDM.BIGOS
0dc7  98                   cbw                               
0dc8  050a00               add ax, 0xa                       
0dcb  a20000               mov byte ptr [0], al               ; data PRZEDM.BIGOS
; PRZEDM.PAS:1054
0dce  bf0000               mov di, 0                          ; data System.OUTPUT
0dd1  1e                   push ds                           
0dd2  57                   push di                           
0dd3  bf0000               mov di, 0                          ; string "ZJADASZ BIGOS Z WROGA I ODZYSKUJESZ 20% ENERGI"
0dd6  0e                   push cs                           
0dd7  57                   push di                           
0dd8  31c0                 xor ax, ax                        
0dda  50                   push ax                           
0ddb  9a00000000           lcall 0, 0                         ; call System.WriteString
0de0  9a00000000           lcall 0, 0                         ; call System.WriteLn
0de5  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1055
0dea  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
0ded  051400               add ax, 0x14                      
0df0  a30000               mov word ptr [0], ax               ; data PRZEDM.ENERGIA
; PRZEDM.PAS:1056
0df3  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
0df6  3b060000             cmp ax, word ptr [0]               ; data MONSTRA.MAXE
0dfa  7e06                 jle 0xe02                         
0dfc  a10000               mov ax, word ptr [0]               ; data MONSTRA.MAXE
0dff  a30000               mov word ptr [0], ax               ; data PRZEDM.ENERGIA
; PRZEDM.PAS:1059
0e02  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0e05  1e                   push ds                           
0e06  57                   push di                           
0e07  bf0000               mov di, 0                          ; string "UZYJ KOMPLET"
0e0a  0e                   push cs                           
0e0b  57                   push di                           
0e0c  9a00000000           lcall 0, 0                         ; call System.CompareString
0e11  754c                 jne 0xe5f                         
0e13  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.KOMPLET
0e18  7f45                 jg 0xe5f                          
0e1a  803e000000           cmp byte ptr [0], 0                ; data PRZEDM.JAKIEUB
0e1f  753e                 jne 0xe5f                         
; PRZEDM.PAS:1060
0e21  bf0000               mov di, 0                          ; data System.OUTPUT
0e24  1e                   push ds                           
0e25  57                   push di                           
0e26  bf0000               mov di, 0                          ; string "NAKLADASZ KOMPLET UBRAN FIRMY \"SYF\""
0e29  0e                   push cs                           
0e2a  57                   push di                           
0e2b  31c0                 xor ax, ax                        
0e2d  50                   push ax                           
0e2e  9a00000000           lcall 0, 0                         ; call System.WriteString
0e33  9a00000000           lcall 0, 0                         ; call System.WriteLn
0e38  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1061
0e3d  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRO
0e40  050700               add ax, 7                         
0e43  a30000               mov word ptr [0], ax               ; data PRZEDM.PRO
; PRZEDM.PAS:1062
0e46  c70600000100         mov word ptr [0], 1                ; data PRZEDM.CIALO
; PRZEDM.PAS:1063
0e4c  bf0000               mov di, 0                          ; string "SYF"
0e4f  0e                   push cs                           
0e50  57                   push di                           
0e51  bf0000               mov di, 0                          ; data PRZEDM.JAKIEUB
0e54  1e                   push ds                           
0e55  57                   push di                           
0e56  b8ff00               mov ax, 0xff                      
0e59  50                   push ax                           
0e5a  9a00000000           lcall 0, 0                         ; call System.entry_0x0060
; PRZEDM.PAS:1065
0e5f  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0e62  1e                   push ds                           
0e63  57                   push di                           
0e64  bf0000               mov di, 0                          ; string "ODLORZ KOMPLET"
0e67  0e                   push cs                           
0e68  57                   push di                           
0e69  9a00000000           lcall 0, 0                         ; call System.CompareString
0e6e  7547                 jne 0xeb7                         
0e70  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.KOMPLET
0e75  7f40                 jg 0xeb7                          
0e77  bf0000               mov di, 0                          ; data PRZEDM.JAKIEUB
0e7a  1e                   push ds                           
0e7b  57                   push di                           
0e7c  bf0000               mov di, 0                          ; string "SYF"
0e7f  0e                   push cs                           
0e80  57                   push di                           
0e81  9a00000000           lcall 0, 0                         ; call System.CompareString
0e86  752f                 jne 0xeb7                         
; PRZEDM.PAS:1066
0e88  bf0000               mov di, 0                          ; data System.OUTPUT
0e8b  1e                   push ds                           
0e8c  57                   push di                           
0e8d  bf0000               mov di, 0                          ; string "ZDEJMUJESZ KOMPLET UBRAN FIRMY \"SYF\""
0e90  0e                   push cs                           
0e91  57                   push di                           
0e92  31c0                 xor ax, ax                        
0e94  50                   push ax                           
0e95  9a00000000           lcall 0, 0                         ; call System.WriteString
0e9a  9a00000000           lcall 0, 0                         ; call System.WriteLn
0e9f  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1067
0ea4  31c0                 xor ax, ax                        
0ea6  a30000               mov word ptr [0], ax               ; data PRZEDM.CIALO
; PRZEDM.PAS:1068
0ea9  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRO
0eac  2d0700               sub ax, 7                         
0eaf  a30000               mov word ptr [0], ax               ; data PRZEDM.PRO
; PRZEDM.PAS:1069
0eb2  c606000000           mov byte ptr [0], 0                ; data PRZEDM.JAKIEUB
; PRZEDM.PAS:1071
0eb7  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0eba  1e                   push ds                           
0ebb  57                   push di                           
0ebc  bf0000               mov di, 0                          ; string "UZYJ LISTEK"
0ebf  0e                   push cs                           
0ec0  57                   push di                           
0ec1  9a00000000           lcall 0, 0                         ; call System.CompareString
0ec6  7523                 jne 0xeeb                         
0ec8  803e0000f6           cmp byte ptr [0], 0xf6             ; data PRZEDM.LISTEK
0ecd  7f1c                 jg 0xeeb                          
0ecf  bf0000               mov di, 0                          ; data System.OUTPUT
0ed2  1e                   push ds                           
0ed3  57                   push di                           
0ed4  bf0000               mov di, 0                          ; string "LISTEK JEST TYPU SMIEC MAX PRZEDMIOTOW + 3 "
0ed7  0e                   push cs                           
0ed8  57                   push di                           
0ed9  31c0                 xor ax, ax                        
0edb  50                   push ax                           
0edc  9a00000000           lcall 0, 0                         ; call System.WriteString
0ee1  9a00000000           lcall 0, 0                         ; call System.WriteLn
0ee6  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1072
0eeb  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0eee  1e                   push ds                           
0eef  57                   push di                           
0ef0  bf0000               mov di, 0                          ; string "UZYJ GARNITUR"
0ef3  0e                   push cs                           
0ef4  57                   push di                           
0ef5  9a00000000           lcall 0, 0                         ; call System.CompareString
0efa  755c                 jne 0xf58                         
0efc  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.GARNITUR
0f01  7f55                 jg 0xf58                          
0f03  803e000000           cmp byte ptr [0], 0                ; data PRZEDM.JAKIEUB
0f08  754e                 jne 0xf58                         
; PRZEDM.PAS:1073
0f0a  bf0000               mov di, 0                          ; data System.OUTPUT
0f0d  1e                   push ds                           
0f0e  57                   push di                           
0f0f  bf0000               mov di, 0                          ; string "NAKLADASZ GARNITUR Z KOLCAMI NA SWE (NIE)WYSPORTOWANE CIALO"
0f12  0e                   push cs                           
0f13  57                   push di                           
0f14  31c0                 xor ax, ax                        
0f16  50                   push ax                           
0f17  9a00000000           lcall 0, 0                         ; call System.WriteString
0f1c  9a00000000           lcall 0, 0                         ; call System.WriteLn
0f21  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1074
0f26  c70600000100         mov word ptr [0], 1                ; data PRZEDM.CIALO
; PRZEDM.PAS:1075
0f2c  a10000               mov ax, word ptr [0]               ; data PRZEDM.ILOSC
0f2f  40                   inc ax                            
0f30  a30000               mov word ptr [0], ax               ; data PRZEDM.ILOSC
; PRZEDM.PAS:1076
0f33  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRO
0f36  050a00               add ax, 0xa                       
0f39  a30000               mov word ptr [0], ax               ; data PRZEDM.PRO
; PRZEDM.PAS:1077
0f3c  a10000               mov ax, word ptr [0]               ; data PRZEDM.FUKSROLL
0f3f  050f00               add ax, 0xf                       
0f42  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKSROLL
; PRZEDM.PAS:1078
0f45  bf0000               mov di, 0                          ; string "GARNITUR"
0f48  0e                   push cs                           
0f49  57                   push di                           
0f4a  bf0000               mov di, 0                          ; data PRZEDM.JAKIEUB
0f4d  1e                   push ds                           
0f4e  57                   push di                           
0f4f  b8ff00               mov ax, 0xff                      
0f52  50                   push ax                           
0f53  9a00000000           lcall 0, 0                         ; call System.entry_0x0060
; PRZEDM.PAS:1080
0f58  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0f5b  1e                   push ds                           
0f5c  57                   push di                           
0f5d  bf0000               mov di, 0                          ; string "UZYJ PIGULKA"
0f60  0e                   push cs                           
0f61  57                   push di                           
0f62  9a00000000           lcall 0, 0                         ; call System.CompareString
0f67  7403                 je 0xf6c                          
0f69  e91101               jmp 0x107d                        
0f6c  803e0000f6           cmp byte ptr [0], 0xf6             ; data PRZEDM.PIGULKA
0f71  7e03                 jle 0xf76                         
0f73  e90701               jmp 0x107d                        
; PRZEDM.PAS:1081
0f76  bf0000               mov di, 0                          ; data System.OUTPUT
0f79  1e                   push ds                           
0f7a  57                   push di                           
0f7b  bf0000               mov di, 0                          ; string "WSZYSTKO ZACZYNA WIROWAC , POTEM NAGLY BLYSK I ZNAJDUJESZ SIE W PRZESZLOSCI"
0f7e  0e                   push cs                           
0f7f  57                   push di                           
0f80  31c0                 xor ax, ax                        
0f82  50                   push ax                           
0f83  9a00000000           lcall 0, 0                         ; call System.WriteString
0f88  9a00000000           lcall 0, 0                         ; call System.WriteLn
0f8d  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1082
0f92  a00000               mov al, byte ptr [0]               ; data PRZEDM.PIGULKA
0f95  98                   cbw                               
0f96  050a00               add ax, 0xa                       
0f99  a20000               mov byte ptr [0], al               ; data PRZEDM.PIGULKA
; PRZEDM.PAS:1083
0f9c  0e                   push cs                           
0f9d  e80000               call 0xfa0                         ; call PRZEDM.POTWORY
; PRZEDM.PAS:1084
0fa0  833e00000a           cmp word ptr [0], 0xa              ; data PRZEDM.MAD
0fa5  7d4e                 jge 0xff5                         
; PRZEDM.PAS:1085
0fa7  bf0000               mov di, 0                          ; data System.OUTPUT
0faa  1e                   push ds                           
0fab  57                   push di                           
0fac  bf0000               mov di, 0                          ; string "BRAK OBYCIA W POSLUGIWANIU SIE MAGICZNYMI PRZEDMIOTAMI SPRAWIL ZE "
0faf  0e                   push cs                           
0fb0  57                   push di                           
0fb1  31c0                 xor ax, ax                        
0fb3  50                   push ax                           
0fb4  9a00000000           lcall 0, 0                         ; call System.WriteString
0fb9  9a00000000           lcall 0, 0                         ; call System.WriteLn
0fbe  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1086
0fc3  bf0000               mov di, 0                          ; data System.OUTPUT
0fc6  1e                   push ds                           
0fc7  57                   push di                           
0fc8  bf0000               mov di, 0                          ; string "ZNACZNIE OPADLES Z SIL I STALES SIE BARDZO ZMECZONY"
0fcb  0e                   push cs                           
0fcc  57                   push di                           
0fcd  31c0                 xor ax, ax                        
0fcf  50                   push ax                           
0fd0  9a00000000           lcall 0, 0                         ; call System.WriteString
0fd5  9a00000000           lcall 0, 0                         ; call System.WriteLn
0fda  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1087
0fdf  a10000               mov ax, word ptr [0]               ; data MONSTRA.MAXE
0fe2  48                   dec ax                            
0fe3  a30000               mov word ptr [0], ax               ; data MONSTRA.MAXE
; PRZEDM.PAS:1088
0fe6  c70600000100         mov word ptr [0], 1                ; data PRZEDM.ENERGIA
; PRZEDM.PAS:1089
0fec  a10000               mov ax, word ptr [0]               ; data PRZEDM.KUNSZT
0fef  2d3200               sub ax, 0x32                      
0ff2  a30000               mov word ptr [0], ax               ; data PRZEDM.KUNSZT
; PRZEDM.PAS:1091
0ff5  833e000009           cmp word ptr [0], 9                ; data PRZEDM.MAD
0ffa  7e5e                 jle 0x105a                        
0ffc  833e000010           cmp word ptr [0], 0x10             ; data PRZEDM.MAD
1001  7d57                 jge 0x105a                        
; PRZEDM.PAS:1092
1003  bf0000               mov di, 0                          ; data System.OUTPUT
1006  1e                   push ds                           
1007  57                   push di                           
1008  bf0000               mov di, 0                          ; string "MASZ PEWNE OBYCIE W MAGICZNYCH PRZEDMIOTACH ALE MIMO WSZYSTKO"
100b  0e                   push cs                           
100c  57                   push di                           
100d  31c0                 xor ax, ax                        
100f  50                   push ax                           
1010  9a00000000           lcall 0, 0                         ; call System.WriteString
1015  9a00000000           lcall 0, 0                         ; call System.WriteLn
101a  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1093
101f  bf0000               mov di, 0                          ; data System.OUTPUT
1022  1e                   push ds                           
1023  57                   push di                           
1024  bf0000               mov di, 0                          ; string "OPADLES Z SIL I STALES SIE ZMECZONY"
1027  0e                   push cs                           
1028  57                   push di                           
1029  31c0                 xor ax, ax                        
102b  50                   push ax                           
102c  9a00000000           lcall 0, 0                         ; call System.WriteString
1031  9a00000000           lcall 0, 0                         ; call System.WriteLn
1036  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1094
103b  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
103e  2d2800               sub ax, 0x28                      
1041  a30000               mov word ptr [0], ax               ; data PRZEDM.ENERGIA
; PRZEDM.PAS:1095
1044  833e000001           cmp word ptr [0], 1                ; data PRZEDM.ENERGIA
1049  7d06                 jge 0x1051                        
104b  c70600000100         mov word ptr [0], 1                ; data PRZEDM.ENERGIA
; PRZEDM.PAS:1096
1051  a10000               mov ax, word ptr [0]               ; data PRZEDM.KUNSZT
1054  2d1e00               sub ax, 0x1e                      
1057  a30000               mov word ptr [0], ax               ; data PRZEDM.KUNSZT
; PRZEDM.PAS:1098
105a  833e00000f           cmp word ptr [0], 0xf              ; data PRZEDM.MAD
105f  7e1c                 jle 0x107d                        
1061  bf0000               mov di, 0                          ; data System.OUTPUT
1064  1e                   push ds                           
1065  57                   push di                           
1066  bf0000               mov di, 0                          ; string "ZNASZ SIE NA TEGO TYPU PRZEDMIOTACH , WYSZEDLES Z TEGO BEZ SZWANKU"
1069  0e                   push cs                           
106a  57                   push di                           
106b  31c0                 xor ax, ax                        
106d  50                   push ax                           
106e  9a00000000           lcall 0, 0                         ; call System.WriteString
1073  9a00000000           lcall 0, 0                         ; call System.WriteLn
1078  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1100
107d  bf0000               mov di, 0                          ; data PRZEDM.wpisz
1080  1e                   push ds                           
1081  57                   push di                           
1082  bf0000               mov di, 0                          ; string "ODLORZ GARNITUR"
1085  0e                   push cs                           
1086  57                   push di                           
1087  9a00000000           lcall 0, 0                         ; call System.CompareString
108c  7557                 jne 0x10e5                        
108e  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.GARNITUR
1093  7f50                 jg 0x10e5                         
1095  bf0000               mov di, 0                          ; data PRZEDM.JAKIEUB
1098  1e                   push ds                           
1099  57                   push di                           
109a  bf0000               mov di, 0                          ; string "GARNITUR"
109d  0e                   push cs                           
109e  57                   push di                           
109f  9a00000000           lcall 0, 0                         ; call System.CompareString
10a4  753f                 jne 0x10e5                        
; PRZEDM.PAS:1101
10a6  bf0000               mov di, 0                          ; data System.OUTPUT
10a9  1e                   push ds                           
10aa  57                   push di                           
10ab  bf0000               mov di, 0                          ; string "ZDEJMUJESZ GARNITUR Z KOLCAMI ZE SWEGO (NIE)WYSPORTOWANEGO CIALA"
10ae  0e                   push cs                           
10af  57                   push di                           
10b0  31c0                 xor ax, ax                        
10b2  50                   push ax                           
10b3  9a00000000           lcall 0, 0                         ; call System.WriteString
10b8  9a00000000           lcall 0, 0                         ; call System.WriteLn
10bd  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1102
10c2  31c0                 xor ax, ax                        
10c4  a30000               mov word ptr [0], ax               ; data PRZEDM.CIALO
; PRZEDM.PAS:1103
10c7  a10000               mov ax, word ptr [0]               ; data PRZEDM.ILOSC
10ca  48                   dec ax                            
10cb  a30000               mov word ptr [0], ax               ; data PRZEDM.ILOSC
; PRZEDM.PAS:1104
10ce  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRO
10d1  2d0a00               sub ax, 0xa                       
10d4  a30000               mov word ptr [0], ax               ; data PRZEDM.PRO
; PRZEDM.PAS:1105
10d7  a10000               mov ax, word ptr [0]               ; data PRZEDM.FUKSROLL
10da  2d0f00               sub ax, 0xf                       
10dd  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKSROLL
; PRZEDM.PAS:1106
10e0  c606000000           mov byte ptr [0], 0                ; data PRZEDM.JAKIEUB
; PRZEDM.PAS:1108
10e5  5d                   pop bp                            
10e6  cb                   retf                              
```

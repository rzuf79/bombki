# `PRZEDM.POROWNANIE`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:385-472`
- TPU code block: `0x0068`
- Procedure bytes: `0x0816`–`0x12e9`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `MONSTRA.OGOL`
- `PRZEDM.FUKS`
- `PRZEDM.KOP`
- `PRZEDM.KUNSZT`
- `PRZEDM.MANA`
- `PRZEDM.PAR`
- `PRZEDM.POR`
- `PRZEDM.POZIOM`
- `PRZEDM.SIL`
- `PRZEDM.ZRE`
- `PRZEDM.wpisz`
- `System.INPUT`
- `System.OUTPUT`

## Calls

- `System.CompareString`
- `System.Random`
- `System.ReadLn`
- `System.ReadString`
- `System.WriteLn`
- `System.WriteString`
- `System.entry_0x0190`
- `System.entry_0x01a0`

## Exact strings

- `"KOGO CHCESZ ZE SOBA POROWNAC?"`
- `"DZIK"`
- `"SZCZUR"`
- `"LIS"`
- `"KUROPATWA"`
- `"ZAJAC"`
- `"WILCZUR"`
- `"ORZEL"`
- `"SARNA"`
- `"DZIECKO"`
- `"DZIADEK"`
- `"NICZEGO NIE MOGE ZAGWARANTOWAC ..... MACIE PODOBNE PARAMETRY"`
- `"PRZECIWNIK GODNY TWEJ DUMY , RACZEJ NIE POGRASZ"`
- `"WSTYD MI ZA CIEBIE ... JESZCZE TU JESTES ! NA CO CZEKASZ ? KILLUJ"`
- `"SLON"`
- `"LEW"`
- `"ZYRAFA"`
- `"WIELBLAD"`
- `"STRUS"`
- `"BOA"`
- `"WILK"`
- `"BIZON"`
- `"PANTERA"`
- `"WARIAT"`
- `"SLUCHACZ"`
- `"FAN"`
- `"CZLOWIEK"`
- `"REPORTER"`
- `"TAK  TAK MAMA KUPI BERECIK GLOWKA W PORZADKU ? "`
- `" NA TWOIM MIEJSCU BYM SIE NIE ZAPUSZCZAL "`
- `" RYZYK FIZYK - TAK NA 50% - WALKA NA SMIERC I ZYCIE"`
- `"SPOX KILLUJ BEZ UPRZEDZEN"`
- `"GLADIATOR"`
- `"WOJOWNIK"`
- `"TRENER"`
- `"POLICJANT"`
- `"GORYL"`
- `"OCHRONIARZ"`
- `"HA HA NIE NA SERJO . DAJ SE W ZYLE OKI? TO DOWCIP? HA HA HA"`
- `"POMARZ SOBIE WARIACIE . MOZE CI SIE PRZYSNI"`
- `"POWIEM  BEZ OGRODEK-TO GLUPI POMYSL"`
- `"TO DOSC RYZYKOWNE ZE TAK POWIEM"`
- `"TO BEDZIE TAK PROSTE JAK ZABICIE DZIECKA TOPOREM !!!"`
- `"MINI-BARMAN"`
- `"GRUBAS"`
- `"D.J"`
- `"SMIERC PODZIEKUJE CI ZA TWOJ DAR (ALE ZGAPIAM)"`
- `"NIE UDAWAJ BISTY-BOYS PRZEGRASZ NA 99%"`
- `"PERFEKCYJNY MECZ NA SMIERC I ZYCIE !!!"`
- `"JESTES ZNACZNIE SILNIEJSZY !!!(ALE GLUPSZY)"`
- `"UWAZAJ DOSTANIESZ MALO KUNSZTU !!!"`
- `"TAKSOWKARZ"`
- `"SPRZEDAWCA"`
- `"GITARZYSTA"`
- `"PERKUSISTA"`
- `"ORGANISTA"`
- `"ZEBRAK"`
- `"PIJAK"`
- `"ZAMIATACZ"`
- `"SZCZAW"`
- `"STOKROTKA"`
- `"KONICZYNKA"`
- `"MLECZ"`
- `"DMUCHAWIEC"`
- `"NIE"`
- `"RACZEJ NIE , CHOC MOZNA ZARYZYKOWAC(NIE POLECAM)"`
- `"TAK"`
- `"PEDAL"`
- `"PARA"`
- `"MACIEK"`
- `"ROZA"`
- `"MALINA"`
- `"TRAWA"`
- `"AGREST"`
- `"JEZYNA"`
- `"WIERZ MI ALE TO NAPRAWDE WIERZ MI ZE NIE MASZ SZANS"`
- `"RACZEJ NIE WYGRASZ WIEC LEPIEJ NIE ATAKUJ"`
- `"JESTESCIE SOBIE ROWNI (NAPRAWDE !!!) - WIEC 50% SZANS"`
- `"JESTES SILNIEJSZY STAD WNIOSEK ZE SOBIE PORADZISZ"`
- `"P.S - JESTES DUZO DUZO SILNIEJSZY ZABIJ BEZ OGRODEK!!!"`
- `"LIROY"`
- `"HAHAHAHAHAHAHAHAHAHHAHOHOHOHHOHOHOHOHOHOHOHOAHAHAHAHAHAHAH"`
- `"HIHIHIHIHIHIHIHHEHEHEHE :))))))"`
- `"SPROOBÓJ A MOŻE WYGRAC SIE UDA......"`
- `"NIE PRZEJMUJ SIE JEGO MORDĄ JESTES SILNIEJSZY I BASTA"`
- `"UWAZAJ ... NA CHLAPIACE MOZGI FLAKI PRZECIWNIKA"`
- `"POKRZYWA"`
- `"NIE MASZ NAJMNIEJSZYCH SZANS"`
- `"JEST PEWNE PRAWDOPODOBIENSTWO WYGRANIA TEGO STARCIA"`
- `"SPANIEL"`
- `"OWCZAREK"`
- `"PIESEK"`
- `"JAMNIK"`
- `"PUDEL"`
- `"JASNE ZE MOZESZ GO ZABIC ZABIJ !!! ZABIJ . TEN PARSZYWY PIES NIE MA RACJI BYTU"`
- `"***************** UCZYSZ SIE ZDOLNOSCI POROWNYWANIE *****************"`
- `"BAKTERIA"`
- `"BAKTERIA MA MAGIC RESISTANCE"`

## Annotated listing

```asm
; PRZEDM.PAS:385
0816  55                   push bp                           
0817  89e5                 mov bp, sp                        
0819  31c0                 xor ax, ax                        
081b  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:386
0820  833e000009           cmp word ptr [0], 9                ; data PRZEDM.MANA
0825  7f03                 jg 0x82a                          
0827  e9bd0a               jmp 0x12e7                        
; PRZEDM.PAS:387
082a  b86400               mov ax, 0x64                      
082d  50                   push ax                           
082e  9a00000000           lcall 0, 0                         ; call System.Random
0833  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:388
0836  bf0000               mov di, 0                          ; data System.OUTPUT
0839  1e                   push ds                           
083a  57                   push di                           
083b  bf0000               mov di, 0                          ; string "KOGO CHCESZ ZE SOBA POROWNAC?"
083e  0e                   push cs                           
083f  57                   push di                           
0840  31c0                 xor ax, ax                        
0842  50                   push ax                           
0843  9a00000000           lcall 0, 0                         ; call System.WriteString
0848  9a00000000           lcall 0, 0                         ; call System.WriteLn
084d  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:389
0852  bf0000               mov di, 0                          ; data System.INPUT
0855  1e                   push ds                           
0856  57                   push di                           
0857  bf0000               mov di, 0                          ; data PRZEDM.wpisz
085a  1e                   push ds                           
085b  57                   push di                           
085c  b8ff00               mov ax, 0xff                      
085f  50                   push ax                           
0860  9a00000000           lcall 0, 0                         ; call System.ReadString
0865  9a00000000           lcall 0, 0                         ; call System.ReadLn
086a  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:390
086f  a00000               mov al, byte ptr [0]               ; data PRZEDM.POZIOM
0872  98                   cbw                               
0873  03060000             add ax, word ptr [0]               ; data PRZEDM.SIL
0877  a30000               mov word ptr [0], ax               ; data MONSTRA.OGOL
; PRZEDM.PAS:391
087a  833e000008           cmp word ptr [0], 8                ; data PRZEDM.ZRE
087f  7407                 je 0x888                          
0881  833e000009           cmp word ptr [0], 9                ; data PRZEDM.ZRE
0886  7509                 jne 0x891                         
0888  a10000               mov ax, word ptr [0]               ; data MONSTRA.OGOL
088b  050400               add ax, 4                         
088e  a30000               mov word ptr [0], ax               ; data MONSTRA.OGOL
; PRZEDM.PAS:392
0891  833e00000a           cmp word ptr [0], 0xa              ; data PRZEDM.ZRE
0896  7407                 je 0x89f                          
0898  833e00000b           cmp word ptr [0], 0xb              ; data PRZEDM.ZRE
089d  7509                 jne 0x8a8                         
089f  a10000               mov ax, word ptr [0]               ; data MONSTRA.OGOL
08a2  050500               add ax, 5                         
08a5  a30000               mov word ptr [0], ax               ; data MONSTRA.OGOL
; PRZEDM.PAS:393
08a8  833e00000c           cmp word ptr [0], 0xc              ; data PRZEDM.ZRE
08ad  7407                 je 0x8b6                          
08af  833e00000d           cmp word ptr [0], 0xd              ; data PRZEDM.ZRE
08b4  7509                 jne 0x8bf                         
08b6  a10000               mov ax, word ptr [0]               ; data MONSTRA.OGOL
08b9  050600               add ax, 6                         
08bc  a30000               mov word ptr [0], ax               ; data MONSTRA.OGOL
; PRZEDM.PAS:394
08bf  833e00000e           cmp word ptr [0], 0xe              ; data PRZEDM.ZRE
08c4  7407                 je 0x8cd                          
08c6  833e00000f           cmp word ptr [0], 0xf              ; data PRZEDM.ZRE
08cb  7509                 jne 0x8d6                         
08cd  a10000               mov ax, word ptr [0]               ; data MONSTRA.OGOL
08d0  050700               add ax, 7                         
08d3  a30000               mov word ptr [0], ax               ; data MONSTRA.OGOL
; PRZEDM.PAS:395
08d6  833e000010           cmp word ptr [0], 0x10             ; data PRZEDM.ZRE
08db  7407                 je 0x8e4                          
08dd  833e000011           cmp word ptr [0], 0x11             ; data PRZEDM.ZRE
08e2  7509                 jne 0x8ed                         
08e4  a10000               mov ax, word ptr [0]               ; data MONSTRA.OGOL
08e7  050800               add ax, 8                         
08ea  a30000               mov word ptr [0], ax               ; data MONSTRA.OGOL
; PRZEDM.PAS:396
08ed  833e000012           cmp word ptr [0], 0x12             ; data PRZEDM.ZRE
08f2  7407                 je 0x8fb                          
08f4  833e000013           cmp word ptr [0], 0x13             ; data PRZEDM.ZRE
08f9  7509                 jne 0x904                         
08fb  a10000               mov ax, word ptr [0]               ; data MONSTRA.OGOL
08fe  050900               add ax, 9                         
0901  a30000               mov word ptr [0], ax               ; data MONSTRA.OGOL
; PRZEDM.PAS:397
0904  833e000014           cmp word ptr [0], 0x14             ; data PRZEDM.ZRE
0909  7407                 je 0x912                          
090b  833e000015           cmp word ptr [0], 0x15             ; data PRZEDM.ZRE
0910  7509                 jne 0x91b                         
0912  a10000               mov ax, word ptr [0]               ; data MONSTRA.OGOL
0915  050a00               add ax, 0xa                       
0918  a30000               mov word ptr [0], ax               ; data MONSTRA.OGOL
; PRZEDM.PAS:398
091b  833e00004b           cmp word ptr [0], 0x4b             ; data PRZEDM.PAR
0920  7e07                 jle 0x929                         
0922  a10000               mov ax, word ptr [0]               ; data MONSTRA.OGOL
0925  40                   inc ax                            
0926  a30000               mov word ptr [0], ax               ; data MONSTRA.OGOL
; PRZEDM.PAS:399
0929  833e000032           cmp word ptr [0], 0x32             ; data PRZEDM.PAR
092e  7e07                 jle 0x937                         
0930  a10000               mov ax, word ptr [0]               ; data MONSTRA.OGOL
0933  40                   inc ax                            
0934  a30000               mov word ptr [0], ax               ; data MONSTRA.OGOL
; PRZEDM.PAS:400
0937  833e00000a           cmp word ptr [0], 0xa              ; data PRZEDM.KOP
093c  7e08                 jle 0x946                         
093e  a10000               mov ax, word ptr [0]               ; data MONSTRA.OGOL
0941  40                   inc ax                            
0942  40                   inc ax                            
0943  a30000               mov word ptr [0], ax               ; data MONSTRA.OGOL
; PRZEDM.PAS:401
0946  833e000046           cmp word ptr [0], 0x46             ; data PRZEDM.KOP
094b  7e08                 jle 0x955                         
094d  a10000               mov ax, word ptr [0]               ; data MONSTRA.OGOL
0950  40                   inc ax                            
0951  40                   inc ax                            
0952  a30000               mov word ptr [0], ax               ; data MONSTRA.OGOL
; PRZEDM.PAS:402
0955  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0958  1e                   push ds                           
0959  57                   push di                           
095a  bf0000               mov di, 0                          ; string "DZIK"
095d  0e                   push cs                           
095e  57                   push di                           
095f  9a00000000           lcall 0, 0                         ; call System.CompareString
0964  7503                 jne 0x969                         
0966  e99c00               jmp 0xa05                         
0969  bf0000               mov di, 0                          ; data PRZEDM.wpisz
096c  1e                   push ds                           
096d  57                   push di                           
096e  bf0000               mov di, 0                          ; string "SZCZUR"
0971  0e                   push cs                           
0972  57                   push di                           
0973  9a00000000           lcall 0, 0                         ; call System.CompareString
0978  7503                 jne 0x97d                         
097a  e98800               jmp 0xa05                         
097d  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0980  1e                   push ds                           
0981  57                   push di                           
0982  bf0000               mov di, 0                          ; string "LIS"
0985  0e                   push cs                           
0986  57                   push di                           
0987  9a00000000           lcall 0, 0                         ; call System.CompareString
098c  7477                 je 0xa05                          
098e  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0991  1e                   push ds                           
0992  57                   push di                           
0993  bf0000               mov di, 0                          ; string "KUROPATWA"
0996  0e                   push cs                           
0997  57                   push di                           
0998  9a00000000           lcall 0, 0                         ; call System.CompareString
099d  7466                 je 0xa05                          
099f  bf0000               mov di, 0                          ; data PRZEDM.wpisz
09a2  1e                   push ds                           
09a3  57                   push di                           
09a4  bf0000               mov di, 0                          ; string "ZAJAC"
09a7  0e                   push cs                           
09a8  57                   push di                           
09a9  9a00000000           lcall 0, 0                         ; call System.CompareString
09ae  7455                 je 0xa05                          
09b0  bf0000               mov di, 0                          ; data PRZEDM.wpisz
09b3  1e                   push ds                           
09b4  57                   push di                           
09b5  bf0000               mov di, 0                          ; string "WILCZUR"
09b8  0e                   push cs                           
09b9  57                   push di                           
09ba  9a00000000           lcall 0, 0                         ; call System.CompareString
09bf  7444                 je 0xa05                          
09c1  bf0000               mov di, 0                          ; data PRZEDM.wpisz
09c4  1e                   push ds                           
09c5  57                   push di                           
09c6  bf0000               mov di, 0                          ; string "ORZEL"
09c9  0e                   push cs                           
09ca  57                   push di                           
09cb  9a00000000           lcall 0, 0                         ; call System.CompareString
09d0  7433                 je 0xa05                          
09d2  bf0000               mov di, 0                          ; data PRZEDM.wpisz
09d5  1e                   push ds                           
09d6  57                   push di                           
09d7  bf0000               mov di, 0                          ; string "SARNA"
09da  0e                   push cs                           
09db  57                   push di                           
09dc  9a00000000           lcall 0, 0                         ; call System.CompareString
09e1  7422                 je 0xa05                          
09e3  bf0000               mov di, 0                          ; data PRZEDM.wpisz
09e6  1e                   push ds                           
09e7  57                   push di                           
09e8  bf0000               mov di, 0                          ; string "DZIECKO"
09eb  0e                   push cs                           
09ec  57                   push di                           
09ed  9a00000000           lcall 0, 0                         ; call System.CompareString
09f2  7411                 je 0xa05                          
09f4  bf0000               mov di, 0                          ; data PRZEDM.wpisz
09f7  1e                   push ds                           
09f8  57                   push di                           
09f9  bf0000               mov di, 0                          ; string "DZIADEK"
09fc  0e                   push cs                           
09fd  57                   push di                           
09fe  9a00000000           lcall 0, 0                         ; call System.CompareString
0a03  7570                 jne 0xa75                         
; PRZEDM.PAS:405
0a05  833e000010           cmp word ptr [0], 0x10             ; data MONSTRA.OGOL
0a0a  7d1c                 jge 0xa28                         
0a0c  bf0000               mov di, 0                          ; data System.OUTPUT
0a0f  1e                   push ds                           
0a10  57                   push di                           
0a11  bf0000               mov di, 0                          ; string "NICZEGO NIE MOGE ZAGWARANTOWAC ..... MACIE PODOBNE PARAMETRY"
0a14  0e                   push cs                           
0a15  57                   push di                           
0a16  31c0                 xor ax, ax                        
0a18  50                   push ax                           
0a19  9a00000000           lcall 0, 0                         ; call System.WriteString
0a1e  9a00000000           lcall 0, 0                         ; call System.WriteLn
0a23  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:406
0a28  833e00000f           cmp word ptr [0], 0xf              ; data PRZEDM.SIL
0a2d  7e23                 jle 0xa52                         
0a2f  833e000013           cmp word ptr [0], 0x13             ; data PRZEDM.SIL
0a34  7d1c                 jge 0xa52                         
0a36  bf0000               mov di, 0                          ; data System.OUTPUT
0a39  1e                   push ds                           
0a3a  57                   push di                           
0a3b  bf0000               mov di, 0                          ; string "PRZECIWNIK GODNY TWEJ DUMY , RACZEJ NIE POGRASZ"
0a3e  0e                   push cs                           
0a3f  57                   push di                           
0a40  31c0                 xor ax, ax                        
0a42  50                   push ax                           
0a43  9a00000000           lcall 0, 0                         ; call System.WriteString
0a48  9a00000000           lcall 0, 0                         ; call System.WriteLn
0a4d  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:407
0a52  833e000012           cmp word ptr [0], 0x12             ; data PRZEDM.SIL
0a57  7e1c                 jle 0xa75                         
0a59  bf0000               mov di, 0                          ; data System.OUTPUT
0a5c  1e                   push ds                           
0a5d  57                   push di                           
0a5e  bf0000               mov di, 0                          ; string "WSTYD MI ZA CIEBIE ... JESZCZE TU JESTES ! NA CO CZEKASZ ? KILLUJ"
0a61  0e                   push cs                           
0a62  57                   push di                           
0a63  31c0                 xor ax, ax                        
0a65  50                   push ax                           
0a66  9a00000000           lcall 0, 0                         ; call System.WriteString
0a6b  9a00000000           lcall 0, 0                         ; call System.WriteLn
0a70  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:409
0a75  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0a78  1e                   push ds                           
0a79  57                   push di                           
0a7a  bf0000               mov di, 0                          ; string "SLON"
0a7d  0e                   push cs                           
0a7e  57                   push di                           
0a7f  9a00000000           lcall 0, 0                         ; call System.CompareString
0a84  7503                 jne 0xa89                         
0a86  e9ef00               jmp 0xb78                         
0a89  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0a8c  1e                   push ds                           
0a8d  57                   push di                           
0a8e  bf0000               mov di, 0                          ; string "LEW"
0a91  0e                   push cs                           
0a92  57                   push di                           
0a93  9a00000000           lcall 0, 0                         ; call System.CompareString
0a98  7503                 jne 0xa9d                         
0a9a  e9db00               jmp 0xb78                         
0a9d  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0aa0  1e                   push ds                           
0aa1  57                   push di                           
0aa2  bf0000               mov di, 0                          ; string "ZYRAFA"
0aa5  0e                   push cs                           
0aa6  57                   push di                           
0aa7  9a00000000           lcall 0, 0                         ; call System.CompareString
0aac  7503                 jne 0xab1                         
0aae  e9c700               jmp 0xb78                         
0ab1  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0ab4  1e                   push ds                           
0ab5  57                   push di                           
0ab6  bf0000               mov di, 0                          ; string "WIELBLAD"
0ab9  0e                   push cs                           
0aba  57                   push di                           
0abb  9a00000000           lcall 0, 0                         ; call System.CompareString
0ac0  7503                 jne 0xac5                         
0ac2  e9b300               jmp 0xb78                         
0ac5  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0ac8  1e                   push ds                           
0ac9  57                   push di                           
0aca  bf0000               mov di, 0                          ; string "STRUS"
0acd  0e                   push cs                           
0ace  57                   push di                           
0acf  9a00000000           lcall 0, 0                         ; call System.CompareString
0ad4  7503                 jne 0xad9                         
0ad6  e99f00               jmp 0xb78                         
0ad9  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0adc  1e                   push ds                           
0add  57                   push di                           
0ade  bf0000               mov di, 0                          ; string "BOA"
0ae1  0e                   push cs                           
0ae2  57                   push di                           
0ae3  9a00000000           lcall 0, 0                         ; call System.CompareString
0ae8  7503                 jne 0xaed                         
0aea  e98b00               jmp 0xb78                         
0aed  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0af0  1e                   push ds                           
0af1  57                   push di                           
0af2  bf0000               mov di, 0                          ; string "WILK"
0af5  0e                   push cs                           
0af6  57                   push di                           
0af7  9a00000000           lcall 0, 0                         ; call System.CompareString
0afc  747a                 je 0xb78                          
0afe  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0b01  1e                   push ds                           
0b02  57                   push di                           
0b03  bf0000               mov di, 0                          ; string "BIZON"
0b06  0e                   push cs                           
0b07  57                   push di                           
0b08  9a00000000           lcall 0, 0                         ; call System.CompareString
0b0d  7469                 je 0xb78                          
0b0f  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0b12  1e                   push ds                           
0b13  57                   push di                           
0b14  bf0000               mov di, 0                          ; string "PANTERA"
0b17  0e                   push cs                           
0b18  57                   push di                           
0b19  9a00000000           lcall 0, 0                         ; call System.CompareString
0b1e  7458                 je 0xb78                          
0b20  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0b23  1e                   push ds                           
0b24  57                   push di                           
0b25  bf0000               mov di, 0                          ; string "WARIAT"
0b28  0e                   push cs                           
0b29  57                   push di                           
0b2a  9a00000000           lcall 0, 0                         ; call System.CompareString
0b2f  7447                 je 0xb78                          
0b31  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0b34  1e                   push ds                           
0b35  57                   push di                           
0b36  bf0000               mov di, 0                          ; string "SLUCHACZ"
0b39  0e                   push cs                           
0b3a  57                   push di                           
0b3b  9a00000000           lcall 0, 0                         ; call System.CompareString
0b40  7436                 je 0xb78                          
0b42  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0b45  1e                   push ds                           
0b46  57                   push di                           
0b47  bf0000               mov di, 0                          ; string "FAN"
0b4a  0e                   push cs                           
0b4b  57                   push di                           
0b4c  9a00000000           lcall 0, 0                         ; call System.CompareString
0b51  7425                 je 0xb78                          
0b53  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0b56  1e                   push ds                           
0b57  57                   push di                           
0b58  bf0000               mov di, 0                          ; string "CZLOWIEK"
0b5b  0e                   push cs                           
0b5c  57                   push di                           
0b5d  9a00000000           lcall 0, 0                         ; call System.CompareString
0b62  7414                 je 0xb78                          
0b64  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0b67  1e                   push ds                           
0b68  57                   push di                           
0b69  bf0000               mov di, 0                          ; string "REPORTER"
0b6c  0e                   push cs                           
0b6d  57                   push di                           
0b6e  9a00000000           lcall 0, 0                         ; call System.CompareString
0b73  7403                 je 0xb78                          
0b75  e99a00               jmp 0xc12                         
; PRZEDM.PAS:413
0b78  833e000010           cmp word ptr [0], 0x10             ; data MONSTRA.OGOL
0b7d  7d1c                 jge 0xb9b                         
0b7f  bf0000               mov di, 0                          ; data System.OUTPUT
0b82  1e                   push ds                           
0b83  57                   push di                           
0b84  bf0000               mov di, 0                          ; string "TAK  TAK MAMA KUPI BERECIK GLOWKA W PORZADKU ? "
0b87  0e                   push cs                           
0b88  57                   push di                           
0b89  31c0                 xor ax, ax                        
0b8b  50                   push ax                           
0b8c  9a00000000           lcall 0, 0                         ; call System.WriteString
0b91  9a00000000           lcall 0, 0                         ; call System.WriteLn
0b96  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:414
0b9b  833e00000f           cmp word ptr [0], 0xf              ; data PRZEDM.SIL
0ba0  7e23                 jle 0xbc5                         
0ba2  833e000015           cmp word ptr [0], 0x15             ; data PRZEDM.SIL
0ba7  7d1c                 jge 0xbc5                         
0ba9  bf0000               mov di, 0                          ; data System.OUTPUT
0bac  1e                   push ds                           
0bad  57                   push di                           
0bae  bf0000               mov di, 0                          ; string " NA TWOIM MIEJSCU BYM SIE NIE ZAPUSZCZAL "
0bb1  0e                   push cs                           
0bb2  57                   push di                           
0bb3  31c0                 xor ax, ax                        
0bb5  50                   push ax                           
0bb6  9a00000000           lcall 0, 0                         ; call System.WriteString
0bbb  9a00000000           lcall 0, 0                         ; call System.WriteLn
0bc0  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:415
0bc5  833e000014           cmp word ptr [0], 0x14             ; data PRZEDM.SIL
0bca  7e23                 jle 0xbef                         
0bcc  833e000017           cmp word ptr [0], 0x17             ; data PRZEDM.SIL
0bd1  7d1c                 jge 0xbef                         
0bd3  bf0000               mov di, 0                          ; data System.OUTPUT
0bd6  1e                   push ds                           
0bd7  57                   push di                           
0bd8  bf0000               mov di, 0                          ; string " RYZYK FIZYK - TAK NA 50% - WALKA NA SMIERC I ZYCIE"
0bdb  0e                   push cs                           
0bdc  57                   push di                           
0bdd  31c0                 xor ax, ax                        
0bdf  50                   push ax                           
0be0  9a00000000           lcall 0, 0                         ; call System.WriteString
0be5  9a00000000           lcall 0, 0                         ; call System.WriteLn
0bea  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:416
0bef  833e000016           cmp word ptr [0], 0x16             ; data PRZEDM.SIL
0bf4  7e1c                 jle 0xc12                         
0bf6  bf0000               mov di, 0                          ; data System.OUTPUT
0bf9  1e                   push ds                           
0bfa  57                   push di                           
0bfb  bf0000               mov di, 0                          ; string "SPOX KILLUJ BEZ UPRZEDZEN"
0bfe  0e                   push cs                           
0bff  57                   push di                           
0c00  31c0                 xor ax, ax                        
0c02  50                   push ax                           
0c03  9a00000000           lcall 0, 0                         ; call System.WriteString
0c08  9a00000000           lcall 0, 0                         ; call System.WriteLn
0c0d  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:418
0c12  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0c15  1e                   push ds                           
0c16  57                   push di                           
0c17  bf0000               mov di, 0                          ; string "GLADIATOR"
0c1a  0e                   push cs                           
0c1b  57                   push di                           
0c1c  9a00000000           lcall 0, 0                         ; call System.CompareString
0c21  7458                 je 0xc7b                          
0c23  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0c26  1e                   push ds                           
0c27  57                   push di                           
0c28  bf0000               mov di, 0                          ; string "WOJOWNIK"
0c2b  0e                   push cs                           
0c2c  57                   push di                           
0c2d  9a00000000           lcall 0, 0                         ; call System.CompareString
0c32  7447                 je 0xc7b                          
0c34  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0c37  1e                   push ds                           
0c38  57                   push di                           
0c39  bf0000               mov di, 0                          ; string "TRENER"
0c3c  0e                   push cs                           
0c3d  57                   push di                           
0c3e  9a00000000           lcall 0, 0                         ; call System.CompareString
0c43  7436                 je 0xc7b                          
0c45  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0c48  1e                   push ds                           
0c49  57                   push di                           
0c4a  bf0000               mov di, 0                          ; string "POLICJANT"
0c4d  0e                   push cs                           
0c4e  57                   push di                           
0c4f  9a00000000           lcall 0, 0                         ; call System.CompareString
0c54  7425                 je 0xc7b                          
0c56  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0c59  1e                   push ds                           
0c5a  57                   push di                           
0c5b  bf0000               mov di, 0                          ; string "GORYL"
0c5e  0e                   push cs                           
0c5f  57                   push di                           
0c60  9a00000000           lcall 0, 0                         ; call System.CompareString
0c65  7414                 je 0xc7b                          
0c67  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0c6a  1e                   push ds                           
0c6b  57                   push di                           
0c6c  bf0000               mov di, 0                          ; string "OCHRONIARZ"
0c6f  0e                   push cs                           
0c70  57                   push di                           
0c71  9a00000000           lcall 0, 0                         ; call System.CompareString
0c76  7403                 je 0xc7b                          
0c78  e9c400               jmp 0xd3f                         
; PRZEDM.PAS:420
0c7b  833e00000f           cmp word ptr [0], 0xf              ; data MONSTRA.OGOL
0c80  7d1c                 jge 0xc9e                         
0c82  bf0000               mov di, 0                          ; data System.OUTPUT
0c85  1e                   push ds                           
0c86  57                   push di                           
0c87  bf0000               mov di, 0                          ; string "HA HA NIE NA SERJO . DAJ SE W ZYLE OKI? TO DOWCIP? HA HA HA"
0c8a  0e                   push cs                           
0c8b  57                   push di                           
0c8c  31c0                 xor ax, ax                        
0c8e  50                   push ax                           
0c8f  9a00000000           lcall 0, 0                         ; call System.WriteString
0c94  9a00000000           lcall 0, 0                         ; call System.WriteLn
0c99  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:421
0c9e  833e00000e           cmp word ptr [0], 0xe              ; data MONSTRA.OGOL
0ca3  7e23                 jle 0xcc8                         
0ca5  833e000012           cmp word ptr [0], 0x12             ; data MONSTRA.OGOL
0caa  7d1c                 jge 0xcc8                         
0cac  bf0000               mov di, 0                          ; data System.OUTPUT
0caf  1e                   push ds                           
0cb0  57                   push di                           
0cb1  bf0000               mov di, 0                          ; string "POMARZ SOBIE WARIACIE . MOZE CI SIE PRZYSNI"
0cb4  0e                   push cs                           
0cb5  57                   push di                           
0cb6  31c0                 xor ax, ax                        
0cb8  50                   push ax                           
0cb9  9a00000000           lcall 0, 0                         ; call System.WriteString
0cbe  9a00000000           lcall 0, 0                         ; call System.WriteLn
0cc3  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:422
0cc8  833e000011           cmp word ptr [0], 0x11             ; data MONSTRA.OGOL
0ccd  7e23                 jle 0xcf2                         
0ccf  833e000017           cmp word ptr [0], 0x17             ; data MONSTRA.OGOL
0cd4  7d1c                 jge 0xcf2                         
0cd6  bf0000               mov di, 0                          ; data System.OUTPUT
0cd9  1e                   push ds                           
0cda  57                   push di                           
0cdb  bf0000               mov di, 0                          ; string "POWIEM  BEZ OGRODEK-TO GLUPI POMYSL"
0cde  0e                   push cs                           
0cdf  57                   push di                           
0ce0  31c0                 xor ax, ax                        
0ce2  50                   push ax                           
0ce3  9a00000000           lcall 0, 0                         ; call System.WriteString
0ce8  9a00000000           lcall 0, 0                         ; call System.WriteLn
0ced  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:423
0cf2  833e000016           cmp word ptr [0], 0x16             ; data MONSTRA.OGOL
0cf7  7e23                 jle 0xd1c                         
0cf9  833e00001a           cmp word ptr [0], 0x1a             ; data MONSTRA.OGOL
0cfe  7d1c                 jge 0xd1c                         
0d00  bf0000               mov di, 0                          ; data System.OUTPUT
0d03  1e                   push ds                           
0d04  57                   push di                           
0d05  bf0000               mov di, 0                          ; string "TO DOSC RYZYKOWNE ZE TAK POWIEM"
0d08  0e                   push cs                           
0d09  57                   push di                           
0d0a  31c0                 xor ax, ax                        
0d0c  50                   push ax                           
0d0d  9a00000000           lcall 0, 0                         ; call System.WriteString
0d12  9a00000000           lcall 0, 0                         ; call System.WriteLn
0d17  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:424
0d1c  833e000019           cmp word ptr [0], 0x19             ; data MONSTRA.OGOL
0d21  7e1c                 jle 0xd3f                         
0d23  bf0000               mov di, 0                          ; data System.OUTPUT
0d26  1e                   push ds                           
0d27  57                   push di                           
0d28  bf0000               mov di, 0                          ; string "TO BEDZIE TAK PROSTE JAK ZABICIE DZIECKA TOPOREM !!!"
0d2b  0e                   push cs                           
0d2c  57                   push di                           
0d2d  31c0                 xor ax, ax                        
0d2f  50                   push ax                           
0d30  9a00000000           lcall 0, 0                         ; call System.WriteString
0d35  9a00000000           lcall 0, 0                         ; call System.WriteLn
0d3a  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:426
0d3f  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0d42  1e                   push ds                           
0d43  57                   push di                           
0d44  bf0000               mov di, 0                          ; string "MINI-BARMAN"
0d47  0e                   push cs                           
0d48  57                   push di                           
0d49  9a00000000           lcall 0, 0                         ; call System.CompareString
0d4e  7425                 je 0xd75                          
0d50  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0d53  1e                   push ds                           
0d54  57                   push di                           
0d55  bf0000               mov di, 0                          ; string "GRUBAS"
0d58  0e                   push cs                           
0d59  57                   push di                           
0d5a  9a00000000           lcall 0, 0                         ; call System.CompareString
0d5f  7414                 je 0xd75                          
0d61  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0d64  1e                   push ds                           
0d65  57                   push di                           
0d66  bf0000               mov di, 0                          ; string "D.J"
0d69  0e                   push cs                           
0d6a  57                   push di                           
0d6b  9a00000000           lcall 0, 0                         ; call System.CompareString
0d70  7403                 je 0xd75                          
0d72  e9bd00               jmp 0xe32                         
; PRZEDM.PAS:427
0d75  833e000018           cmp word ptr [0], 0x18             ; data MONSTRA.OGOL
0d7a  7d1c                 jge 0xd98                         
0d7c  bf0000               mov di, 0                          ; data System.OUTPUT
0d7f  1e                   push ds                           
0d80  57                   push di                           
0d81  bf0000               mov di, 0                          ; string "SMIERC PODZIEKUJE CI ZA TWOJ DAR (ALE ZGAPIAM)"
0d84  0e                   push cs                           
0d85  57                   push di                           
0d86  31c0                 xor ax, ax                        
0d88  50                   push ax                           
0d89  9a00000000           lcall 0, 0                         ; call System.WriteString
0d8e  9a00000000           lcall 0, 0                         ; call System.WriteLn
0d93  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:428
0d98  833e000017           cmp word ptr [0], 0x17             ; data MONSTRA.OGOL
0d9d  7e23                 jle 0xdc2                         
0d9f  833e00001a           cmp word ptr [0], 0x1a             ; data MONSTRA.OGOL
0da4  7d1c                 jge 0xdc2                         
0da6  bf0000               mov di, 0                          ; data System.OUTPUT
0da9  1e                   push ds                           
0daa  57                   push di                           
0dab  bf0000               mov di, 0                          ; string "NIE UDAWAJ BISTY-BOYS PRZEGRASZ NA 99%"
0dae  0e                   push cs                           
0daf  57                   push di                           
0db0  31c0                 xor ax, ax                        
0db2  50                   push ax                           
0db3  9a00000000           lcall 0, 0                         ; call System.WriteString
0db8  9a00000000           lcall 0, 0                         ; call System.WriteLn
0dbd  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:429
0dc2  833e000019           cmp word ptr [0], 0x19             ; data MONSTRA.OGOL
0dc7  7e23                 jle 0xdec                         
0dc9  833e00001d           cmp word ptr [0], 0x1d             ; data MONSTRA.OGOL
0dce  7d1c                 jge 0xdec                         
0dd0  bf0000               mov di, 0                          ; data System.OUTPUT
0dd3  1e                   push ds                           
0dd4  57                   push di                           
0dd5  bf0000               mov di, 0                          ; string "PERFEKCYJNY MECZ NA SMIERC I ZYCIE !!!"
0dd8  0e                   push cs                           
0dd9  57                   push di                           
0dda  31c0                 xor ax, ax                        
0ddc  50                   push ax                           
0ddd  9a00000000           lcall 0, 0                         ; call System.WriteString
0de2  9a00000000           lcall 0, 0                         ; call System.WriteLn
0de7  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:430
0dec  833e00001c           cmp word ptr [0], 0x1c             ; data MONSTRA.OGOL
0df1  7e1c                 jle 0xe0f                         
0df3  bf0000               mov di, 0                          ; data System.OUTPUT
0df6  1e                   push ds                           
0df7  57                   push di                           
0df8  bf0000               mov di, 0                          ; string "JESTES ZNACZNIE SILNIEJSZY !!!(ALE GLUPSZY)"
0dfb  0e                   push cs                           
0dfc  57                   push di                           
0dfd  31c0                 xor ax, ax                        
0dff  50                   push ax                           
0e00  9a00000000           lcall 0, 0                         ; call System.WriteString
0e05  9a00000000           lcall 0, 0                         ; call System.WriteLn
0e0a  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:431
0e0f  833e000022           cmp word ptr [0], 0x22             ; data MONSTRA.OGOL
0e14  7e1c                 jle 0xe32                         
0e16  bf0000               mov di, 0                          ; data System.OUTPUT
0e19  1e                   push ds                           
0e1a  57                   push di                           
0e1b  bf0000               mov di, 0                          ; string "UWAZAJ DOSTANIESZ MALO KUNSZTU !!!"
0e1e  0e                   push cs                           
0e1f  57                   push di                           
0e20  31c0                 xor ax, ax                        
0e22  50                   push ax                           
0e23  9a00000000           lcall 0, 0                         ; call System.WriteString
0e28  9a00000000           lcall 0, 0                         ; call System.WriteLn
0e2d  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:433
0e32  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0e35  1e                   push ds                           
0e36  57                   push di                           
0e37  bf0000               mov di, 0                          ; string "TAKSOWKARZ"
0e3a  0e                   push cs                           
0e3b  57                   push di                           
0e3c  9a00000000           lcall 0, 0                         ; call System.CompareString
0e41  7503                 jne 0xe46                         
0e43  e9d800               jmp 0xf1e                         
0e46  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0e49  1e                   push ds                           
0e4a  57                   push di                           
0e4b  bf0000               mov di, 0                          ; string "SPRZEDAWCA"
0e4e  0e                   push cs                           
0e4f  57                   push di                           
0e50  9a00000000           lcall 0, 0                         ; call System.CompareString
0e55  7503                 jne 0xe5a                         
0e57  e9c400               jmp 0xf1e                         
0e5a  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0e5d  1e                   push ds                           
0e5e  57                   push di                           
0e5f  bf0000               mov di, 0                          ; string "GITARZYSTA"
0e62  0e                   push cs                           
0e63  57                   push di                           
0e64  9a00000000           lcall 0, 0                         ; call System.CompareString
0e69  7503                 jne 0xe6e                         
0e6b  e9b000               jmp 0xf1e                         
0e6e  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0e71  1e                   push ds                           
0e72  57                   push di                           
0e73  bf0000               mov di, 0                          ; string "PERKUSISTA"
0e76  0e                   push cs                           
0e77  57                   push di                           
0e78  9a00000000           lcall 0, 0                         ; call System.CompareString
0e7d  7503                 jne 0xe82                         
0e7f  e99c00               jmp 0xf1e                         
0e82  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0e85  1e                   push ds                           
0e86  57                   push di                           
0e87  bf0000               mov di, 0                          ; string "ORGANISTA"
0e8a  0e                   push cs                           
0e8b  57                   push di                           
0e8c  9a00000000           lcall 0, 0                         ; call System.CompareString
0e91  7503                 jne 0xe96                         
0e93  e98800               jmp 0xf1e                         
0e96  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0e99  1e                   push ds                           
0e9a  57                   push di                           
0e9b  bf0000               mov di, 0                          ; string "ZEBRAK"
0e9e  0e                   push cs                           
0e9f  57                   push di                           
0ea0  9a00000000           lcall 0, 0                         ; call System.CompareString
0ea5  7477                 je 0xf1e                          
0ea7  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0eaa  1e                   push ds                           
0eab  57                   push di                           
0eac  bf0000               mov di, 0                          ; string "PIJAK"
0eaf  0e                   push cs                           
0eb0  57                   push di                           
0eb1  9a00000000           lcall 0, 0                         ; call System.CompareString
0eb6  7466                 je 0xf1e                          
0eb8  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0ebb  1e                   push ds                           
0ebc  57                   push di                           
0ebd  bf0000               mov di, 0                          ; string "ZAMIATACZ"
0ec0  0e                   push cs                           
0ec1  57                   push di                           
0ec2  9a00000000           lcall 0, 0                         ; call System.CompareString
0ec7  7455                 je 0xf1e                          
0ec9  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0ecc  1e                   push ds                           
0ecd  57                   push di                           
0ece  bf0000               mov di, 0                          ; string "SZCZAW"
0ed1  0e                   push cs                           
0ed2  57                   push di                           
0ed3  9a00000000           lcall 0, 0                         ; call System.CompareString
0ed8  7444                 je 0xf1e                          
0eda  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0edd  1e                   push ds                           
0ede  57                   push di                           
0edf  bf0000               mov di, 0                          ; string "STOKROTKA"
0ee2  0e                   push cs                           
0ee3  57                   push di                           
0ee4  9a00000000           lcall 0, 0                         ; call System.CompareString
0ee9  7433                 je 0xf1e                          
0eeb  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0eee  1e                   push ds                           
0eef  57                   push di                           
0ef0  bf0000               mov di, 0                          ; string "KONICZYNKA"
0ef3  0e                   push cs                           
0ef4  57                   push di                           
0ef5  9a00000000           lcall 0, 0                         ; call System.CompareString
0efa  7422                 je 0xf1e                          
0efc  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0eff  1e                   push ds                           
0f00  57                   push di                           
0f01  bf0000               mov di, 0                          ; string "MLECZ"
0f04  0e                   push cs                           
0f05  57                   push di                           
0f06  9a00000000           lcall 0, 0                         ; call System.CompareString
0f0b  7411                 je 0xf1e                          
0f0d  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0f10  1e                   push ds                           
0f11  57                   push di                           
0f12  bf0000               mov di, 0                          ; string "DMUCHAWIEC"
0f15  0e                   push cs                           
0f16  57                   push di                           
0f17  9a00000000           lcall 0, 0                         ; call System.CompareString
0f1c  7570                 jne 0xf8e                         
; PRZEDM.PAS:436
0f1e  833e000015           cmp word ptr [0], 0x15             ; data MONSTRA.OGOL
0f23  7d1c                 jge 0xf41                         
0f25  bf0000               mov di, 0                          ; data System.OUTPUT
0f28  1e                   push ds                           
0f29  57                   push di                           
0f2a  bf0000               mov di, 0                          ; string "NIE"
0f2d  0e                   push cs                           
0f2e  57                   push di                           
0f2f  31c0                 xor ax, ax                        
0f31  50                   push ax                           
0f32  9a00000000           lcall 0, 0                         ; call System.WriteString
0f37  9a00000000           lcall 0, 0                         ; call System.WriteLn
0f3c  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:437
0f41  833e000016           cmp word ptr [0], 0x16             ; data MONSTRA.OGOL
0f46  7e23                 jle 0xf6b                         
0f48  833e00001c           cmp word ptr [0], 0x1c             ; data MONSTRA.OGOL
0f4d  7d1c                 jge 0xf6b                         
0f4f  bf0000               mov di, 0                          ; data System.OUTPUT
0f52  1e                   push ds                           
0f53  57                   push di                           
0f54  bf0000               mov di, 0                          ; string "RACZEJ NIE , CHOC MOZNA ZARYZYKOWAC(NIE POLECAM)"
0f57  0e                   push cs                           
0f58  57                   push di                           
0f59  31c0                 xor ax, ax                        
0f5b  50                   push ax                           
0f5c  9a00000000           lcall 0, 0                         ; call System.WriteString
0f61  9a00000000           lcall 0, 0                         ; call System.WriteLn
0f66  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:438
0f6b  833e00001b           cmp word ptr [0], 0x1b             ; data MONSTRA.OGOL
0f70  7e1c                 jle 0xf8e                         
0f72  bf0000               mov di, 0                          ; data System.OUTPUT
0f75  1e                   push ds                           
0f76  57                   push di                           
0f77  bf0000               mov di, 0                          ; string "TAK"
0f7a  0e                   push cs                           
0f7b  57                   push di                           
0f7c  31c0                 xor ax, ax                        
0f7e  50                   push ax                           
0f7f  9a00000000           lcall 0, 0                         ; call System.WriteString
0f84  9a00000000           lcall 0, 0                         ; call System.WriteLn
0f89  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:440
0f8e  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0f91  1e                   push ds                           
0f92  57                   push di                           
0f93  bf0000               mov di, 0                          ; string "PEDAL"
0f96  0e                   push cs                           
0f97  57                   push di                           
0f98  9a00000000           lcall 0, 0                         ; call System.CompareString
0f9d  747a                 je 0x1019                         
0f9f  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0fa2  1e                   push ds                           
0fa3  57                   push di                           
0fa4  bf0000               mov di, 0                          ; string "PARA"
0fa7  0e                   push cs                           
0fa8  57                   push di                           
0fa9  9a00000000           lcall 0, 0                         ; call System.CompareString
0fae  7469                 je 0x1019                         
0fb0  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0fb3  1e                   push ds                           
0fb4  57                   push di                           
0fb5  bf0000               mov di, 0                          ; string "MACIEK"
0fb8  0e                   push cs                           
0fb9  57                   push di                           
0fba  9a00000000           lcall 0, 0                         ; call System.CompareString
0fbf  7458                 je 0x1019                         
0fc1  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0fc4  1e                   push ds                           
0fc5  57                   push di                           
0fc6  bf0000               mov di, 0                          ; string "ROZA"
0fc9  0e                   push cs                           
0fca  57                   push di                           
0fcb  9a00000000           lcall 0, 0                         ; call System.CompareString
0fd0  7447                 je 0x1019                         
0fd2  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0fd5  1e                   push ds                           
0fd6  57                   push di                           
0fd7  bf0000               mov di, 0                          ; string "MALINA"
0fda  0e                   push cs                           
0fdb  57                   push di                           
0fdc  9a00000000           lcall 0, 0                         ; call System.CompareString
0fe1  7436                 je 0x1019                         
0fe3  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0fe6  1e                   push ds                           
0fe7  57                   push di                           
0fe8  bf0000               mov di, 0                          ; string "TRAWA"
0feb  0e                   push cs                           
0fec  57                   push di                           
0fed  9a00000000           lcall 0, 0                         ; call System.CompareString
0ff2  7425                 je 0x1019                         
0ff4  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0ff7  1e                   push ds                           
0ff8  57                   push di                           
0ff9  bf0000               mov di, 0                          ; string "AGREST"
0ffc  0e                   push cs                           
0ffd  57                   push di                           
0ffe  9a00000000           lcall 0, 0                         ; call System.CompareString
1003  7414                 je 0x1019                         
1005  bf0000               mov di, 0                          ; data PRZEDM.wpisz
1008  1e                   push ds                           
1009  57                   push di                           
100a  bf0000               mov di, 0                          ; string "JEZYNA"
100d  0e                   push cs                           
100e  57                   push di                           
100f  9a00000000           lcall 0, 0                         ; call System.CompareString
1014  7403                 je 0x1019                         
1016  e9bd00               jmp 0x10d6                        
; PRZEDM.PAS:442
1019  833e000014           cmp word ptr [0], 0x14             ; data MONSTRA.OGOL
101e  7d1c                 jge 0x103c                        
1020  bf0000               mov di, 0                          ; data System.OUTPUT
1023  1e                   push ds                           
1024  57                   push di                           
1025  bf0000               mov di, 0                          ; string "WIERZ MI ALE TO NAPRAWDE WIERZ MI ZE NIE MASZ SZANS"
1028  0e                   push cs                           
1029  57                   push di                           
102a  31c0                 xor ax, ax                        
102c  50                   push ax                           
102d  9a00000000           lcall 0, 0                         ; call System.WriteString
1032  9a00000000           lcall 0, 0                         ; call System.WriteLn
1037  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:443
103c  833e000013           cmp word ptr [0], 0x13             ; data MONSTRA.OGOL
1041  7e23                 jle 0x1066                        
1043  833e00001a           cmp word ptr [0], 0x1a             ; data MONSTRA.OGOL
1048  7d1c                 jge 0x1066                        
104a  bf0000               mov di, 0                          ; data System.OUTPUT
104d  1e                   push ds                           
104e  57                   push di                           
104f  bf0000               mov di, 0                          ; string "RACZEJ NIE WYGRASZ WIEC LEPIEJ NIE ATAKUJ"
1052  0e                   push cs                           
1053  57                   push di                           
1054  31c0                 xor ax, ax                        
1056  50                   push ax                           
1057  9a00000000           lcall 0, 0                         ; call System.WriteString
105c  9a00000000           lcall 0, 0                         ; call System.WriteLn
1061  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:444
1066  833e000019           cmp word ptr [0], 0x19             ; data MONSTRA.OGOL
106b  7e23                 jle 0x1090                        
106d  833e00001e           cmp word ptr [0], 0x1e             ; data MONSTRA.OGOL
1072  7d1c                 jge 0x1090                        
1074  bf0000               mov di, 0                          ; data System.OUTPUT
1077  1e                   push ds                           
1078  57                   push di                           
1079  bf0000               mov di, 0                          ; string "JESTESCIE SOBIE ROWNI (NAPRAWDE !!!) - WIEC 50% SZANS"
107c  0e                   push cs                           
107d  57                   push di                           
107e  31c0                 xor ax, ax                        
1080  50                   push ax                           
1081  9a00000000           lcall 0, 0                         ; call System.WriteString
1086  9a00000000           lcall 0, 0                         ; call System.WriteLn
108b  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:445
1090  833e00001d           cmp word ptr [0], 0x1d             ; data MONSTRA.OGOL
1095  7e1c                 jle 0x10b3                        
1097  bf0000               mov di, 0                          ; data System.OUTPUT
109a  1e                   push ds                           
109b  57                   push di                           
109c  bf0000               mov di, 0                          ; string "JESTES SILNIEJSZY STAD WNIOSEK ZE SOBIE PORADZISZ"
109f  0e                   push cs                           
10a0  57                   push di                           
10a1  31c0                 xor ax, ax                        
10a3  50                   push ax                           
10a4  9a00000000           lcall 0, 0                         ; call System.WriteString
10a9  9a00000000           lcall 0, 0                         ; call System.WriteLn
10ae  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:446
10b3  833e000023           cmp word ptr [0], 0x23             ; data MONSTRA.OGOL
10b8  7e1c                 jle 0x10d6                        
10ba  bf0000               mov di, 0                          ; data System.OUTPUT
10bd  1e                   push ds                           
10be  57                   push di                           
10bf  bf0000               mov di, 0                          ; string "P.S - JESTES DUZO DUZO SILNIEJSZY ZABIJ BEZ OGRODEK!!!"
10c2  0e                   push cs                           
10c3  57                   push di                           
10c4  31c0                 xor ax, ax                        
10c6  50                   push ax                           
10c7  9a00000000           lcall 0, 0                         ; call System.WriteString
10cc  9a00000000           lcall 0, 0                         ; call System.WriteLn
10d1  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:448
10d6  bf0000               mov di, 0                          ; data PRZEDM.wpisz
10d9  1e                   push ds                           
10da  57                   push di                           
10db  bf0000               mov di, 0                          ; string "LIROY"
10de  0e                   push cs                           
10df  57                   push di                           
10e0  9a00000000           lcall 0, 0                         ; call System.CompareString
10e5  7403                 je 0x10ea                         
10e7  e9c400               jmp 0x11ae                        
; PRZEDM.PAS:449
10ea  833e00001c           cmp word ptr [0], 0x1c             ; data MONSTRA.OGOL
10ef  7d1c                 jge 0x110d                        
10f1  bf0000               mov di, 0                          ; data System.OUTPUT
10f4  1e                   push ds                           
10f5  57                   push di                           
10f6  bf0000               mov di, 0                          ; string "HAHAHAHAHAHAHAHAHAHHAHOHOHOHHOHOHOHOHOHOHOHOAHAHAHAHAHAHAH"
10f9  0e                   push cs                           
10fa  57                   push di                           
10fb  31c0                 xor ax, ax                        
10fd  50                   push ax                           
10fe  9a00000000           lcall 0, 0                         ; call System.WriteString
1103  9a00000000           lcall 0, 0                         ; call System.WriteLn
1108  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:450
110d  833e00001b           cmp word ptr [0], 0x1b             ; data MONSTRA.OGOL
1112  7e23                 jle 0x1137                        
1114  833e000021           cmp word ptr [0], 0x21             ; data MONSTRA.OGOL
1119  7d1c                 jge 0x1137                        
111b  bf0000               mov di, 0                          ; data System.OUTPUT
111e  1e                   push ds                           
111f  57                   push di                           
1120  bf0000               mov di, 0                          ; string "HIHIHIHIHIHIHIHHEHEHEHE :))))))"
1123  0e                   push cs                           
1124  57                   push di                           
1125  31c0                 xor ax, ax                        
1127  50                   push ax                           
1128  9a00000000           lcall 0, 0                         ; call System.WriteString
112d  9a00000000           lcall 0, 0                         ; call System.WriteLn
1132  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:451
1137  833e000020           cmp word ptr [0], 0x20             ; data MONSTRA.OGOL
113c  7e23                 jle 0x1161                        
113e  833e00002c           cmp word ptr [0], 0x2c             ; data MONSTRA.OGOL
1143  7d1c                 jge 0x1161                        
1145  bf0000               mov di, 0                          ; data System.OUTPUT
1148  1e                   push ds                           
1149  57                   push di                           
114a  bf0000               mov di, 0                          ; string "SPROOBÓJ A MOŻE WYGRAC SIE UDA......"
114d  0e                   push cs                           
114e  57                   push di                           
114f  31c0                 xor ax, ax                        
1151  50                   push ax                           
1152  9a00000000           lcall 0, 0                         ; call System.WriteString
1157  9a00000000           lcall 0, 0                         ; call System.WriteLn
115c  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:452
1161  833e00002b           cmp word ptr [0], 0x2b             ; data MONSTRA.OGOL
1166  7e23                 jle 0x118b                        
1168  833e000030           cmp word ptr [0], 0x30             ; data MONSTRA.OGOL
116d  7d1c                 jge 0x118b                        
116f  bf0000               mov di, 0                          ; data System.OUTPUT
1172  1e                   push ds                           
1173  57                   push di                           
1174  bf0000               mov di, 0                          ; string "NIE PRZEJMUJ SIE JEGO MORDĄ JESTES SILNIEJSZY I BASTA"
1177  0e                   push cs                           
1178  57                   push di                           
1179  31c0                 xor ax, ax                        
117b  50                   push ax                           
117c  9a00000000           lcall 0, 0                         ; call System.WriteString
1181  9a00000000           lcall 0, 0                         ; call System.WriteLn
1186  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:453
118b  833e00002f           cmp word ptr [0], 0x2f             ; data MONSTRA.OGOL
1190  7e1c                 jle 0x11ae                        
1192  bf0000               mov di, 0                          ; data System.OUTPUT
1195  1e                   push ds                           
1196  57                   push di                           
1197  bf0000               mov di, 0                          ; string "UWAZAJ ... NA CHLAPIACE MOZGI FLAKI PRZECIWNIKA"
119a  0e                   push cs                           
119b  57                   push di                           
119c  31c0                 xor ax, ax                        
119e  50                   push ax                           
119f  9a00000000           lcall 0, 0                         ; call System.WriteString
11a4  9a00000000           lcall 0, 0                         ; call System.WriteLn
11a9  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:455
11ae  bf0000               mov di, 0                          ; data PRZEDM.wpisz
11b1  1e                   push ds                           
11b2  57                   push di                           
11b3  bf0000               mov di, 0                          ; string "POKRZYWA"
11b6  0e                   push cs                           
11b7  57                   push di                           
11b8  9a00000000           lcall 0, 0                         ; call System.CompareString
11bd  7546                 jne 0x1205                        
; PRZEDM.PAS:456
11bf  833e000028           cmp word ptr [0], 0x28             ; data MONSTRA.OGOL
11c4  7d1c                 jge 0x11e2                        
11c6  bf0000               mov di, 0                          ; data System.OUTPUT
11c9  1e                   push ds                           
11ca  57                   push di                           
11cb  bf0000               mov di, 0                          ; string "NIE MASZ NAJMNIEJSZYCH SZANS"
11ce  0e                   push cs                           
11cf  57                   push di                           
11d0  31c0                 xor ax, ax                        
11d2  50                   push ax                           
11d3  9a00000000           lcall 0, 0                         ; call System.WriteString
11d8  9a00000000           lcall 0, 0                         ; call System.WriteLn
11dd  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:457
11e2  833e000027           cmp word ptr [0], 0x27             ; data MONSTRA.OGOL
11e7  7e1c                 jle 0x1205                        
11e9  bf0000               mov di, 0                          ; data System.OUTPUT
11ec  1e                   push ds                           
11ed  57                   push di                           
11ee  bf0000               mov di, 0                          ; string "JEST PEWNE PRAWDOPODOBIENSTWO WYGRANIA TEGO STARCIA"
11f1  0e                   push cs                           
11f2  57                   push di                           
11f3  31c0                 xor ax, ax                        
11f5  50                   push ax                           
11f6  9a00000000           lcall 0, 0                         ; call System.WriteString
11fb  9a00000000           lcall 0, 0                         ; call System.WriteLn
1200  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:460
1205  bf0000               mov di, 0                          ; data PRZEDM.wpisz
1208  1e                   push ds                           
1209  57                   push di                           
120a  bf0000               mov di, 0                          ; string "SPANIEL"
120d  0e                   push cs                           
120e  57                   push di                           
120f  9a00000000           lcall 0, 0                         ; call System.CompareString
1214  7444                 je 0x125a                         
1216  bf0000               mov di, 0                          ; data PRZEDM.wpisz
1219  1e                   push ds                           
121a  57                   push di                           
121b  bf0000               mov di, 0                          ; string "OWCZAREK"
121e  0e                   push cs                           
121f  57                   push di                           
1220  9a00000000           lcall 0, 0                         ; call System.CompareString
1225  7433                 je 0x125a                         
1227  bf0000               mov di, 0                          ; data PRZEDM.wpisz
122a  1e                   push ds                           
122b  57                   push di                           
122c  bf0000               mov di, 0                          ; string "PIESEK"
122f  0e                   push cs                           
1230  57                   push di                           
1231  9a00000000           lcall 0, 0                         ; call System.CompareString
1236  7422                 je 0x125a                         
1238  bf0000               mov di, 0                          ; data PRZEDM.wpisz
123b  1e                   push ds                           
123c  57                   push di                           
123d  bf0000               mov di, 0                          ; string "JAMNIK"
1240  0e                   push cs                           
1241  57                   push di                           
1242  9a00000000           lcall 0, 0                         ; call System.CompareString
1247  7411                 je 0x125a                         
1249  bf0000               mov di, 0                          ; data PRZEDM.wpisz
124c  1e                   push ds                           
124d  57                   push di                           
124e  bf0000               mov di, 0                          ; string "PUDEL"
1251  0e                   push cs                           
1252  57                   push di                           
1253  9a00000000           lcall 0, 0                         ; call System.CompareString
1258  751c                 jne 0x1276                        
; PRZEDM.PAS:461
125a  bf0000               mov di, 0                          ; data System.OUTPUT
125d  1e                   push ds                           
125e  57                   push di                           
125f  bf0000               mov di, 0                          ; string "JASNE ZE MOZESZ GO ZABIC ZABIJ !!! ZABIJ . TEN PARSZYWY PIES NIE MA RACJI BYTU"
1262  0e                   push cs                           
1263  57                   push di                           
1264  31c0                 xor ax, ax                        
1266  50                   push ax                           
1267  9a00000000           lcall 0, 0                         ; call System.WriteString
126c  9a00000000           lcall 0, 0                         ; call System.WriteLn
1271  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:462
1276  833e000003           cmp word ptr [0], 3                ; data PRZEDM.FUKS
127b  7d34                 jge 0x12b1                        
127d  803e000064           cmp byte ptr [0], 0x64             ; data PRZEDM.POR
1282  7d2d                 jge 0x12b1                        
; PRZEDM.PAS:463
1284  bf0000               mov di, 0                          ; data System.OUTPUT
1287  1e                   push ds                           
1288  57                   push di                           
1289  bf0000               mov di, 0                          ; string "***************** UCZYSZ SIE ZDOLNOSCI POROWNYWANIE *****************"
128c  0e                   push cs                           
128d  57                   push di                           
128e  31c0                 xor ax, ax                        
1290  50                   push ax                           
1291  9a00000000           lcall 0, 0                         ; call System.WriteString
1296  9a00000000           lcall 0, 0                         ; call System.WriteLn
129b  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:464
12a0  a00000               mov al, byte ptr [0]               ; data PRZEDM.POR
12a3  98                   cbw                               
12a4  40                   inc ax                            
12a5  a20000               mov byte ptr [0], al               ; data PRZEDM.POR
; PRZEDM.PAS:465
12a8  a10000               mov ax, word ptr [0]               ; data PRZEDM.KUNSZT
12ab  050500               add ax, 5                         
12ae  a30000               mov word ptr [0], ax               ; data PRZEDM.KUNSZT
; PRZEDM.PAS:467
12b1  bf0000               mov di, 0                          ; data PRZEDM.wpisz
12b4  1e                   push ds                           
12b5  57                   push di                           
12b6  bf0000               mov di, 0                          ; string "BAKTERIA"
12b9  0e                   push cs                           
12ba  57                   push di                           
12bb  9a00000000           lcall 0, 0                         ; call System.CompareString
12c0  7525                 jne 0x12e7                        
; PRZEDM.PAS:468
12c2  bf0000               mov di, 0                          ; data System.OUTPUT
12c5  1e                   push ds                           
12c6  57                   push di                           
12c7  bf0000               mov di, 0                          ; string "BAKTERIA MA MAGIC RESISTANCE"
12ca  0e                   push cs                           
12cb  57                   push di                           
12cc  31c0                 xor ax, ax                        
12ce  50                   push ax                           
12cf  9a00000000           lcall 0, 0                         ; call System.WriteString
12d4  9a00000000           lcall 0, 0                         ; call System.WriteLn
12d9  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:469
12de  a10000               mov ax, word ptr [0]               ; data PRZEDM.MANA
12e1  050500               add ax, 5                         
12e4  a30000               mov word ptr [0], ax               ; data PRZEDM.MANA
; PRZEDM.PAS:472
12e7  5d                   pop bp                            
12e8  cb                   retf                              
```

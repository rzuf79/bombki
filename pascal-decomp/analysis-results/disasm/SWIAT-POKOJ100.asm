; ===== PROC POKOJ100 @ img 12414 (block 12069..129C6) =====
;   str@img12069: 'ZNALAZLES SIE NA ROZJEZDZIE DROG , DROGI PILNUJE QUEST-MASTER '
;   str@img120A8: 'QUEST-MASTER NIE POSCI CIE DALEJ DOPOKI NIE KUPISZ I ROZWIAZESZ QUESTA'
;   str@img120EF: '%.'
;   str@img120F2: 'MODE'
;   str@img120F7: 'EXIT'
;   str@img120FC: 'DOSTEPNE WYJSCIA:'
;   str@img1210E: 'POLODNIE-UL.SKLEPIKOWA'
;   str@img12125: 'WSCHOD-DROGA O KTOREJ MOZESZ POMAZYC ( BO JEST W PRODUKCJI !!! )'
;   str@img12166: 'ZACHOD-DROGA ( ZABLOKOWANA PRZEZ QUEST-MASTERA)'
;   str@img12196: 'ZACHOD-DROGA'
;   str@img121A3: 'LISTA'
;   str@img121A9: 'LATWY QUEST      - 200'
;   str@img121C0: 'PRZECIETNY QUEST - 100'
;   str@img121D7: 'TRUDNY QUEST     - 50'
;   str@img121ED: 'KOMEDA - SPRZEDAJ QUEST - OZNACZA IZ QUEST ZOSTAL WYKONANY'
;   str@img12228: 'KUP LATWY QUEST'
;   str@img12238: 'ZABIJ 75 POTWOROW'
;   str@img1224A: 'KUP PRZECIETNY QUEST'
;   str@img1225F: 'ZABIJ 50 POTWOROW W TYM LIROYA I DAJ MI DYPLOM MUD SZKOLY'
;   str@img12299: 'KUP TRUDNY QUEST'
;   str@img122AA: 'ZABIJ 50 POTWOROW W TYM LIROYA I DAJ MI FAJKE I POSWIEC 1 PRAKTYKE'
;   str@img122ED: 'SPRZEDAJ QUEST'
;   str@img122FC: 'AAAAA BARDZO MI MILO ZE UDALO CI SIE WYKONAC TEN QUEST'
;   str@img12333: ' ------ OTRZYMUJESZ 100 KUNSZTU -----'
;   str@img12359: ' ------ OTRZYMUJESZ 250 KUNSZTU -----'
;   str@img1237F: ' ------ OTRZYMUJESZ 425 KUNSZTU -----'
;   str@img123A5: 'WYJSCIE'
;   str@img123AD: 'POLODNIE'
;   str@img123B6: 'ZACHOD'
;   str@img123BD: 'QUEST-MASTER MOWI CI : BARDZO MI PRZYKRO ALE MUSISZ MIEC PRZEPUSTKE'
;   str@img12401: 'ZABIJ QUEST-MASTER'
;   str@img12421: 'd'
;   str@img1246C: 'Ö'
;   str@img12487: 'Ö'
;   str@img12665: '-╚'
;   str@img12672: '┐d'
;   str@img12690: 'cv'
;   str@img126C2: '-d'
;   str@img126CF: '┐d'
;   str@img126ED: '1v'
;   str@img1271F: '-2'
;   str@img1272C: '┐d'
;   str@img12740: 'â'
;   str@img1274A: 'â'
;   str@img1274F: 'u'
;   str@img12756: '}'
;   str@img12799: '1'
;   str@img1279E: '1└'
;   str@img127B7: 'íé'
;   str@img127BA: '@'
;   str@img127BE: 'â'
;   str@img127C3: 'u{'
;   str@img127CA: '}'
;   str@img127D0: '÷'
;   str@img12814: '1'
;   str@img12819: '1└'
;   str@img1281E: '1└'
;   str@img12823: 'í'
;   str@img12840: 'â>'
;   str@img1284F: '|'
;   str@img12858: '÷'
;   str@img128A6: 'ú'
;   str@img128A9: 'í'
;   str@img128AC: 'H'
;   str@img128B0: 'í'
;   str@img128B3: 'H'
;   str@img128B7: '1'
;   str@img128BC: '1└'
;   str@img128C1: 'íè'
;   str@img128CA: 'í'
;   str@img128CD: 'H'
;   str@img128D1: 'í'
;   str@img128E5: '┐d'
;   str@img12925: ' |'
;   str@img1292E: '÷w'
;   str@img12935: 'e'
;   str@img12998: '╝'
;   str@img129A4: '}'
;   str@img129BA: 'â>'
;   str@img129BE: 'd'
;   str@img129C1: 'Θá·'

12414: 5589  push    bp
12415: 89E5  mov     bp, sp
12417: 31C0  xor     ax, ax
12419: 9ACD  lcall   0x1c71, 0x2cd ; ->para1C71:02CD
1241E: 833E  cmp     word ptr [0x1d6], 0x64 ; data:context
12423: 7403  je      0x12428
12425: E99D  jmp     0x129c5 ;
12428: BFA2  mov     di, 0x7a2
1242B: 1E57  push    ds
1242C: 57BF  push    di
1242D: BF99  mov     di, 0x2a99 ; str:"ZNALAZLES SIE NA ROZJEZDZIE DROG , DROGI PILNUJE QUEST-MASTER "
12430: 0E57  push    cs
12431: 5731  push    di
12432: 31C0  xor     ax, ax
12434: 509A  push    ax
12435: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
1243A: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
1243F: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
12444: BFA2  mov     di, 0x7a2
12447: 1E57  push    ds
12448: 57BF  push    di
12449: BFD8  mov     di, 0x2ad8 ; str:"QUEST-MASTER NIE POSCI CIE DALEJ DOPOKI NIE KUPISZ I ROZWIAZESZ QUESTA"
1244C: 0E57  push    cs
1244D: 5731  push    di
1244E: 31C0  xor     ax, ax
12450: 509A  push    ax
12451: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
12456: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
1245B: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
12460: 9A22  lcall   0x129d, 0x2c22 ; ->para129D:2C22
12465: BFA2  mov     di, 0x7a2
12468: 1E57  push    ds
12469: 57A1  push    di
1246A: A19C  mov     ax, word ptr [0x19c] ; data:Energy
1246D: 9952  cdq
1246E: 5250  push    dx
1246F: 5031  push    ax
12470: 31C0  xor     ax, ax
12472: 509A  push    ax
12473: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
12478: BF1F  mov     di, 0x2b1f ; str:"%."
1247B: 0E57  push    cs
1247C: 5731  push    di
1247D: 31C0  xor     ax, ax
1247F: 509A  push    ax
12480: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
12485: A1D4  mov     ax, word ptr [0x1d4] ; data:KUNSZT
12488: 9952  cdq
12489: 5250  push    dx
1248A: 5031  push    ax
1248B: 31C0  xor     ax, ax
1248D: 509A  push    ax
1248E: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
12493: B03E  mov     al, 0x3e
12495: 5031  push    ax
12496: 31C0  xor     ax, ax
12498: 509A  push    ax
12499: 9A7B  lcall   0x1c71, 0x67b ; ->para1C71:067B
1249E: 9AFE  lcall   0x1c71, 0x5fe ; ->para1C71:05FE
124A3: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
124A8: BFA2  mov     di, 0x6a2
124AB: 1E57  push    ds
124AC: 57BF  push    di
124AD: BF64  mov     di, 0x564
124B0: 1E57  push    ds
124B1: 57B8  push    di
124B2: B8FF  mov     ax, 0xff
124B5: 509A  push    ax
124B6: 9AC6  lcall   0x1c71, 0x6c6 ; ->para1C71:06C6
124BB: 9A9D  lcall   0x1c71, 0x59d ; ->para1C71:059D
124C0: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
124C5: BF64  mov     di, 0x564
124C8: 1E57  push    ds
124C9: 57BF  push    di
124CA: BF22  mov     di, 0x2b22 ; str:"MODE"
124CD: 0E57  push    cs
124CE: 579A  push    di
124CF: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
124D4: 7505  jne     0x124db
124D6: 9A14  lcall   0x129d, 0x3114 ; ->PRZEDM_MODE
124DB: BF64  mov     di, 0x564
124DE: 1E57  push    ds
124DF: 57BF  push    di
124E0: BF27  mov     di, 0x2b27 ; str:"EXIT"
124E3: 0E57  push    cs
124E4: 579A  push    di
124E5: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
124EA: 7403  je      0x124ef
124EC: E9A5  jmp     0x12594 ;
124EF: BFA2  mov     di, 0x7a2
124F2: 1E57  push    ds
124F3: 57BF  push    di
124F4: BF2C  mov     di, 0x2b2c ; str:"DOSTEPNE WYJSCIA:"
124F7: 0E57  push    cs
124F8: 5731  push    di
124F9: 31C0  xor     ax, ax
124FB: 509A  push    ax
124FC: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
12501: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
12506: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
1250B: BFA2  mov     di, 0x7a2
1250E: 1E57  push    ds
1250F: 57BF  push    di
12510: BF3E  mov     di, 0x2b3e ; str:"POLODNIE-UL.SKLEPIKOWA"
12513: 0E57  push    cs
12514: 5731  push    di
12515: 31C0  xor     ax, ax
12517: 509A  push    ax
12518: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
1251D: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
12522: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
12527: BFA2  mov     di, 0x7a2
1252A: 1E57  push    ds
1252B: 57BF  push    di
1252C: BF55  mov     di, 0x2b55 ; str:"WSCHOD-DROGA O KTOREJ MOZESZ POMAZYC ( BO JEST W PRODUKCJI !!! )"
1252F: 0E57  push    cs
12530: 5731  push    di
12531: 31C0  xor     ax, ax
12533: 509A  push    ax
12534: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
12539: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
1253E: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
12543: A11E  mov     ax, word ptr [0x21e]
12546: 0B06  or      ax, word ptr [0x220]
1254A: 751C  jne     0x12568
1254C: BFA2  mov     di, 0x7a2
1254F: 1E57  push    ds
12550: 57BF  push    di
12551: BF96  mov     di, 0x2b96 ; str:"ZACHOD-DROGA ( ZABLOKOWANA PRZEZ QUEST-MASTERA)"
12554: 0E57  push    cs
12555: 5731  push    di
12556: 31C0  xor     ax, ax
12558: 509A  push    ax
12559: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
1255E: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
12563: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
12568: 833E  cmp     word ptr [0x220], 0
1256D: 7C09  jl      0x12578
1256F: 7F23  jg      0x12594
12571: 833E  cmp     word ptr [0x21e], 0
12576: 731C  jae     0x12594
12578: BFA2  mov     di, 0x7a2
1257B: 1E57  push    ds
1257C: 57BF  push    di
1257D: BFC6  mov     di, 0x2bc6 ; str:"ZACHOD-DROGA"
12580: 0E57  push    cs
12581: 5731  push    di
12582: 31C0  xor     ax, ax
12584: 509A  push    ax
12585: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
1258A: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
1258F: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
12594: BF64  mov     di, 0x564
12597: 1E57  push    ds
12598: 57BF  push    di
12599: BFD3  mov     di, 0x2bd3 ; str:"LISTA"
1259C: 0E57  push    cs
1259D: 579A  push    di
1259E: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
125A3: 7570  jne     0x12615
125A5: BFA2  mov     di, 0x7a2
125A8: 1E57  push    ds
125A9: 57BF  push    di
125AA: BFD9  mov     di, 0x2bd9 ; str:"LATWY QUEST      - 200"
125AD: 0E57  push    cs
125AE: 5731  push    di
125AF: 31C0  xor     ax, ax
125B1: 509A  push    ax
125B2: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
125B7: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
125BC: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
125C1: BFA2  mov     di, 0x7a2
125C4: 1E57  push    ds
125C5: 57BF  push    di
125C6: BFF0  mov     di, 0x2bf0 ; str:"PRZECIETNY QUEST - 100"
125C9: 0E57  push    cs
125CA: 5731  push    di
125CB: 31C0  xor     ax, ax
125CD: 509A  push    ax
125CE: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
125D3: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
125D8: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
125DD: BFA2  mov     di, 0x7a2
125E0: 1E57  push    ds
125E1: 57BF  push    di
125E2: BF07  mov     di, 0x2c07 ; str:"TRUDNY QUEST     - 50"
125E5: 0E57  push    cs
125E6: 5731  push    di
125E7: 31C0  xor     ax, ax
125E9: 509A  push    ax
125EA: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
125EF: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
125F4: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
125F9: BFA2  mov     di, 0x7a2
125FC: 1E57  push    ds
125FD: 57BF  push    di
125FE: BF1D  mov     di, 0x2c1d ; str:"KOMEDA - SPRZEDAJ QUEST - OZNACZA IZ QUEST ZOSTAL WYKONANY"
12601: 0E57  push    cs
12602: 5731  push    di
12603: 31C0  xor     ax, ax
12605: 509A  push    ax
12606: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
1260B: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
12610: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
12615: BF64  mov     di, 0x564
12618: 1E57  push    ds
12619: 57BF  push    di
1261A: BF58  mov     di, 0x2c58 ; str:"KUP LATWY QUEST"
1261D: 0E57  push    cs
1261E: 579A  push    di
1261F: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
12624: 754D  jne     0x12673
12626: 833E  cmp     word ptr [0x21c], 0 ; data:ForsaHi
1262B: 7F0A  jg      0x12637
1262D: 7C44  jl      0x12673
1262F: 813E  cmp     word ptr [0x21a], 0xc7 ; data:ForsaLo
12635: 763C  jbe     0x12673
12637: BFA2  mov     di, 0x7a2
1263A: 1E57  push    ds
1263B: 57BF  push    di
1263C: BF68  mov     di, 0x2c68 ; str:"ZABIJ 75 POTWOROW"
1263F: 0E57  push    cs
12640: 5731  push    di
12641: 31C0  xor     ax, ax
12643: 509A  push    ax
12644: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
12649: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
1264E: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
12653: C706  mov     word ptr [0x248], 1 ; data:QuestType
12659: C706  mov     word ptr [0x24a], 0x4b ; data:QuestCount
1265F: A11A  mov     ax, word ptr [0x21a] ; data:ForsaLo
12662: 8B16  mov     dx, word ptr [0x21c] ; data:ForsaHi
12666: 2DC8  sub     ax, 0xc8
12669: 83DA  sbb     dx, 0
1266C: A31A  mov     word ptr [0x21a], ax ; data:ForsaLo
1266F: 8916  mov     word ptr [0x21c], dx ; data:ForsaHi
12673: BF64  mov     di, 0x564
12676: 1E57  push    ds
12677: 57BF  push    di
12678: BF7A  mov     di, 0x2c7a ; str:"KUP PRZECIETNY QUEST"
1267B: 0E57  push    cs
1267C: 579A  push    di
1267D: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
12682: 754C  jne     0x126d0
12684: 833E  cmp     word ptr [0x21c], 0 ; data:ForsaHi
12689: 7F09  jg      0x12694
1268B: 7C43  jl      0x126d0
1268D: 833E  cmp     word ptr [0x21a], 0x63 ; data:ForsaLo
12692: 763C  jbe     0x126d0
12694: BFA2  mov     di, 0x7a2
12697: 1E57  push    ds
12698: 57BF  push    di
12699: BF8F  mov     di, 0x2c8f ; str:"ZABIJ 50 POTWOROW W TYM LIROYA I DAJ MI DYPLOM MUD SZKOLY"
1269C: 0E57  push    cs
1269D: 5731  push    di
1269E: 31C0  xor     ax, ax
126A0: 509A  push    ax
126A1: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
126A6: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
126AB: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
126B0: C706  mov     word ptr [0x248], 2 ; data:QuestType
126B6: C706  mov     word ptr [0x24a], 0xc8 ; data:QuestCount
126BC: A11A  mov     ax, word ptr [0x21a] ; data:ForsaLo
126BF: 8B16  mov     dx, word ptr [0x21c] ; data:ForsaHi
126C3: 2D64  sub     ax, 0x64
126C6: 83DA  sbb     dx, 0
126C9: A31A  mov     word ptr [0x21a], ax ; data:ForsaLo
126CC: 8916  mov     word ptr [0x21c], dx ; data:ForsaHi
126D0: BF64  mov     di, 0x564
126D3: 1E57  push    ds
126D4: 57BF  push    di
126D5: BFC9  mov     di, 0x2cc9 ; str:"KUP TRUDNY QUEST"
126D8: 0E57  push    cs
126D9: 579A  push    di
126DA: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
126DF: 754C  jne     0x1272d
126E1: 833E  cmp     word ptr [0x21c], 0 ; data:ForsaHi
126E6: 7F09  jg      0x126f1
126E8: 7C43  jl      0x1272d
126EA: 833E  cmp     word ptr [0x21a], 0x31 ; data:ForsaLo
126EF: 763C  jbe     0x1272d
126F1: BFA2  mov     di, 0x7a2
126F4: 1E57  push    ds
126F5: 57BF  push    di
126F6: BFDA  mov     di, 0x2cda ; str:"ZABIJ 50 POTWOROW W TYM LIROYA I DAJ MI FAJKE I POSWIEC 1 PRAKTYKE"
126F9: 0E57  push    cs
126FA: 5731  push    di
126FB: 31C0  xor     ax, ax
126FD: 509A  push    ax
126FE: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
12703: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
12708: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
1270D: C706  mov     word ptr [0x248], 3 ; data:QuestType
12713: C706  mov     word ptr [0x24a], 0xc8 ; data:QuestCount
12719: A11A  mov     ax, word ptr [0x21a] ; data:ForsaLo
1271C: 8B16  mov     dx, word ptr [0x21c] ; data:ForsaHi
12720: 2D32  sub     ax, 0x32
12723: 83DA  sbb     dx, 0
12726: A31A  mov     word ptr [0x21a], ax ; data:ForsaLo
12729: 8916  mov     word ptr [0x21c], dx ; data:ForsaHi
1272D: BF64  mov     di, 0x564
12730: 1E57  push    ds
12731: 57BF  push    di
12732: BF1D  mov     di, 0x2d1d ; str:"SPRZEDAJ QUEST"
12735: 0E57  push    cs
12736: 579A  push    di
12737: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
1273C: 7403  je      0x12741
1273E: E9A5  jmp     0x128e6 ;
12741: 833E  cmp     word ptr [0x248], 0 ; data:QuestType
12746: 7F03  jg      0x1274b
12748: E99B  jmp     0x128e6 ;
1274B: 833E  cmp     word ptr [0x248], 1 ; data:QuestType
12750: 756D  jne     0x127bf
12752: 833E  cmp     word ptr [0x24a], 1 ; data:QuestCount
12757: 7D66  jge     0x127bf
12759: BFA2  mov     di, 0x7a2
1275C: 1E57  push    ds
1275D: 57BF  push    di
1275E: BF2C  mov     di, 0x2d2c ; str:"AAAAA BARDZO MI MILO ZE UDALO CI SIE WYKONAC TEN QUEST"
12761: 0E57  push    cs
12762: 5731  push    di
12763: 31C0  xor     ax, ax
12765: 509A  push    ax
12766: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
1276B: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
12770: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
12775: BFA2  mov     di, 0x7a2
12778: 1E57  push    ds
12779: 57BF  push    di
1277A: BF63  mov     di, 0x2d63 ; str:" ------ OTRZYMUJESZ 100 KUNSZTU -----"
1277D: 0E57  push    cs
1277E: 5731  push    di
1277F: 31C0  xor     ax, ax
12781: 509A  push    ax
12782: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
12787: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
1278C: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
12791: A1D4  mov     ax, word ptr [0x1d4] ; data:KUNSZT
12794: 0564  add     ax, 0x64
12797: A3D4  mov     word ptr [0x1d4], ax ; data:KUNSZT
1279A: 31C0  xor     ax, ax
1279C: A348  mov     word ptr [0x248], ax ; data:QuestType
1279F: 31C0  xor     ax, ax
127A1: A34A  mov     word ptr [0x24a], ax ; data:QuestCount
127A4: A11E  mov     ax, word ptr [0x21e]
127A7: 8B16  mov     dx, word ptr [0x220]
127AB: 2D0A  sub     ax, 0xa
127AE: 83DA  sbb     dx, 0
127B1: A31E  mov     word ptr [0x21e], ax
127B4: 8916  mov     word ptr [0x220], dx
127B8: A182  mov     ax, word ptr [0x182] ; data:PRZED
127BB: 40A3  inc     ax
127BC: A382  mov     word ptr [0x182], ax ; data:PRZED
127BF: 833E  cmp     word ptr [0x248], 2 ; data:QuestType
127C4: 757B  jne     0x12841
127C6: 833E  cmp     word ptr [0x24a], 1 ; data:QuestCount
127CB: 7D74  jge     0x12841
127CD: 833E  cmp     word ptr [0x188], -0xa
127D2: 7F6D  jg      0x12841
127D4: BFA2  mov     di, 0x7a2
127D7: 1E57  push    ds
127D8: 57BF  push    di
127D9: BF2C  mov     di, 0x2d2c ; str:"AAAAA BARDZO MI MILO ZE UDALO CI SIE WYKONAC TEN QUEST"
127DC: 0E57  push    cs
127DD: 5731  push    di
127DE: 31C0  xor     ax, ax
127E0: 509A  push    ax
127E1: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
127E6: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
127EB: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
127F0: BFA2  mov     di, 0x7a2
127F3: 1E57  push    ds
127F4: 57BF  push    di
127F5: BF89  mov     di, 0x2d89 ; str:" ------ OTRZYMUJESZ 250 KUNSZTU -----"
127F8: 0E57  push    cs
127F9: 5731  push    di
127FA: 31C0  xor     ax, ax
127FC: 509A  push    ax
127FD: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
12802: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
12807: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
1280C: A1D4  mov     ax, word ptr [0x1d4] ; data:KUNSZT
1280F: 05FA  add     ax, 0xfa
12812: A3D4  mov     word ptr [0x1d4], ax ; data:KUNSZT
12815: 31C0  xor     ax, ax
12817: A348  mov     word ptr [0x248], ax ; data:QuestType
1281A: 31C0  xor     ax, ax
1281C: A34A  mov     word ptr [0x24a], ax ; data:QuestCount
1281F: 31C0  xor     ax, ax
12821: A388  mov     word ptr [0x188], ax
12824: A164  mov     ax, word ptr [0x664] ; data:EnergyMax
12827: 2D05  sub     ax, 5
1282A: A364  mov     word ptr [0x664], ax ; data:EnergyMax
1282D: A11E  mov     ax, word ptr [0x21e]
12830: 8B16  mov     dx, word ptr [0x220]
12834: 2D0A  sub     ax, 0xa
12837: 83DA  sbb     dx, 0
1283A: A31E  mov     word ptr [0x21e], ax
1283D: 8916  mov     word ptr [0x220], dx
12841: 833E  cmp     word ptr [0x248], 3 ; data:QuestType
12846: 7403  je      0x1284b
12848: E99B  jmp     0x128e6 ;
1284B: 833E  cmp     word ptr [0x24a], 1 ; data:QuestCount
12850: 7C03  jl      0x12855
12852: E991  jmp     0x128e6 ;
12855: 833E  cmp     word ptr [0x18a], -0xa
1285A: 7E03  jle     0x1285f
1285C: E987  jmp     0x128e6 ;
1285F: 833E  cmp     word ptr [0x194], 0 ; data:PRAKTYK
12864: 7F03  jg      0x12869
12866: E97D  jmp     0x128e6 ;
12869: BFA2  mov     di, 0x7a2
1286C: 1E57  push    ds
1286D: 57BF  push    di
1286E: BF2C  mov     di, 0x2d2c ; str:"AAAAA BARDZO MI MILO ZE UDALO CI SIE WYKONAC TEN QUEST"
12871: 0E57  push    cs
12872: 5731  push    di
12873: 31C0  xor     ax, ax
12875: 509A  push    ax
12876: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
1287B: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
12880: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
12885: BFA2  mov     di, 0x7a2
12888: 1E57  push    ds
12889: 57BF  push    di
1288A: BFAF  mov     di, 0x2daf ; str:" ------ OTRZYMUJESZ 425 KUNSZTU -----"
1288D: 0E57  push    cs
1288E: 5731  push    di
1288F: 31C0  xor     ax, ax
12891: 509A  push    ax
12892: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
12897: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
1289C: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
128A1: A1D4  mov     ax, word ptr [0x1d4] ; data:KUNSZT
128A4: 05A9  add     ax, 0x1a9
128A7: A3D4  mov     word ptr [0x1d4], ax ; data:KUNSZT
128AA: A182  mov     ax, word ptr [0x182] ; data:PRZED
128AD: 48A3  dec     ax
128AE: A382  mov     word ptr [0x182], ax ; data:PRZED
128B1: A18C  mov     ax, word ptr [0x18c]
128B4: 48A3  dec     ax
128B5: A38C  mov     word ptr [0x18c], ax
128B8: 31C0  xor     ax, ax
128BA: A348  mov     word ptr [0x248], ax ; data:QuestType
128BD: 31C0  xor     ax, ax
128BF: A34A  mov     word ptr [0x24a], ax ; data:QuestCount
128C2: A18A  mov     ax, word ptr [0x18a]
128C5: 050A  add     ax, 0xa
128C8: A38A  mov     word ptr [0x18a], ax
128CB: A194  mov     ax, word ptr [0x194] ; data:PRAKTYK
128CE: 48A3  dec     ax
128CF: A394  mov     word ptr [0x194], ax ; data:PRAKTYK
128D2: A11E  mov     ax, word ptr [0x21e]
128D5: 8B16  mov     dx, word ptr [0x220]
128D9: 2D0A  sub     ax, 0xa
128DC: 83DA  sbb     dx, 0
128DF: A31E  mov     word ptr [0x21e], ax
128E2: 8916  mov     word ptr [0x220], dx
128E6: BF64  mov     di, 0x564
128E9: 1E57  push    ds
128EA: 57BF  push    di
128EB: BFD5  mov     di, 0x2dd5 ; str:"WYJSCIE"
128EE: 0E57  push    cs
128EF: 579A  push    di
128F0: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
128F5: 7503  jne     0x128fa
128F7: E9CB  jmp     0x129c5 ;
128FA: BF64  mov     di, 0x564
128FD: 1E57  push    ds
128FE: 57BF  push    di
128FF: BFDD  mov     di, 0x2ddd ; str:"POLODNIE"
12902: 0E57  push    cs
12903: 579A  push    di
12904: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
12909: 7506  jne     0x12911
1290B: C706  mov     word ptr [0x1d6], 0x16 ; data:context
12911: BF64  mov     di, 0x564
12914: 1E57  push    ds
12915: 57BF  push    di
12916: BFE6  mov     di, 0x2de6 ; str:"ZACHOD"
12919: 0E57  push    cs
1291A: 579A  push    di
1291B: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
12920: 7516  jne     0x12938
12922: 833E  cmp     word ptr [0x220], -1
12927: 7C09  jl      0x12932
12929: 7F0D  jg      0x12938
1292B: 833E  cmp     word ptr [0x21e], -0xa
12930: 7706  ja      0x12938
12932: C706  mov     word ptr [0x1d6], 0x65 ; data:context
12938: BF64  mov     di, 0x564
1293B: 1E57  push    ds
1293C: 57BF  push    di
1293D: BFE6  mov     di, 0x2de6 ; str:"ZACHOD"
12940: 0E57  push    cs
12941: 579A  push    di
12942: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
12947: 7525  jne     0x1296e
12949: A11E  mov     ax, word ptr [0x21e]
1294C: 0B06  or      ax, word ptr [0x220]
12950: 751C  jne     0x1296e
12952: BFA2  mov     di, 0x7a2
12955: 1E57  push    ds
12956: 57BF  push    di
12957: BFED  mov     di, 0x2ded ; str:"QUEST-MASTER MOWI CI : BARDZO MI PRZYKRO ALE MUSISZ MIEC PRZEPUSTKE"
1295A: 0E57  push    cs
1295B: 5731  push    di
1295C: 31C0  xor     ax, ax
1295E: 509A  push    ax
1295F: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
12964: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
12969: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
1296E: BF64  mov     di, 0x564
12971: 1E57  push    ds
12972: 57BF  push    di
12973: BF31  mov     di, 0x2e31 ; str:"ZABIJ QUEST-MASTER"
12976: 0E57  push    cs
12977: 579A  push    di
12978: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
1297D: 753C  jne     0x129bb
1297F: C606  mov     byte ptr [0x25f], 0xa
12984: C606  mov     byte ptr [0x25e], 0x14
12989: C706  mov     word ptr [0x1b6], 0xa
1298F: C706  mov     word ptr [0x1b8], 0x1a
12995: C706  mov     word ptr [0x1b0], 0xbc ; data:MonsterHP
1299B: 9AA6  lcall   0x129d, 0x44a6 ; ->PRZEDM_WALKA
129A0: 833E  cmp     word ptr [0x1b0], 1 ; data:MonsterHP
129A5: 7D14  jge     0x129bb
129A7: A11E  mov     ax, word ptr [0x21e]
129AA: 8B16  mov     dx, word ptr [0x220]
129AE: 2D0A  sub     ax, 0xa
129B1: 83DA  sbb     dx, 0
129B4: A31E  mov     word ptr [0x21e], ax
129B7: 8916  mov     word ptr [0x220], dx
129BB: 833E  cmp     word ptr [0x1d6], 0x64 ; data:context
129C0: 7503  jne     0x129c5
129C2: E9A0  jmp     0x12465 ;
129C5: 5DCB  pop     bp
129C6: CB00  retf

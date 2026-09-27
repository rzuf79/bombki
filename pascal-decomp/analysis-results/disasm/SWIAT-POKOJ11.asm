; ===== PROC POKOJ11 @ img 11261 (block 11000..11546) =====
;   str@img11000: 'JESTES W POKOJU PROWADZACYM DO KLATEK'
;   str@img11026: 'DRZWI POD TOBA SIE ZATRZASNELY I NIE MASZ ODWROTU'
;   str@img11058: 'WE WSZYSTKICH KIERUNKACH SA KLATKI I UJADAJACE SIE W NICH POTWORY'
;   str@img1109A: 'NO A POZA TYM NA SCIANIE JEST!!! PLAKAT!!!!'
;   str@img110C6: '%.'
;   str@img110C9: 'MODE'
;   str@img110CE: 'EXIT'
;   str@img110D3: 'DOSTEPNE WYJSCIA:'
;   str@img110E5: 'WSCHOD-KLATKA CIENIASA'
;   str@img110FC: 'ZACHOD-KLATKA SILNEGO'
;   str@img11112: 'POLNOC-KLATKA ZRECZNEGO'
;   str@img1112A: 'POLODNIE-KLATKA ODPORNEGO'
;   str@img11144: 'GORA-KLATKA SILNEGO,ODPORNEGO I ZRECZNEGO '
;   str@img1116F: 'DOL-JEDYNA DROGA NIE PROWADZACA DO KLATEK'
;   str@img11199: 'WYJSCIE'
;   str@img111A1: 'WSCHOD'
;   str@img111A8: 'ZACHOD'
;   str@img111AF: 'POLNOC'
;   str@img111B6: 'POLODNIE'
;   str@img111BF: 'GORA'
;   str@img111C4: 'DOL'
;   str@img111C8: 'PATRZ PLAKAT'
;   str@img111D5: 'NA PLAKACIE PISZE:'
;   str@img111E8: 'W KLATKACH SA POTWORKI - ZABIJ JE! KOMEDA : ZABIJ [COS] - ZABIJA '
;   str@img1122A: 'CZASAMI COS WYPADNIE Z POTWORKA MOZE CI SIE TO PRZYDAC'
;   str@img11274: '┐ó'
;   str@img112EC: 'Ö'
;   str@img11307: 'Ö'
;   str@img11541: 'Θá²'

11261: 5589  push    bp
11262: 89E5  mov     bp, sp
11264: 31C0  xor     ax, ax
11266: 9ACD  lcall   0x1c71, 0x2cd ; ->para1C71:02CD
1126B: 833E  cmp     word ptr [0x1d6], 0xb ; data:context
11270: 7403  je      0x11275
11272: E9D0  jmp     0x11545 ;
11275: BFA2  mov     di, 0x7a2
11278: 1E57  push    ds
11279: 57BF  push    di
1127A: BF30  mov     di, 0x1a30 ; str:"JESTES W POKOJU PROWADZACYM DO KLATEK"
1127D: 0E57  push    cs
1127E: 5731  push    di
1127F: 31C0  xor     ax, ax
11281: 509A  push    ax
11282: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
11287: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
1128C: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11291: BFA2  mov     di, 0x7a2
11294: 1E57  push    ds
11295: 57BF  push    di
11296: BF56  mov     di, 0x1a56 ; str:"DRZWI POD TOBA SIE ZATRZASNELY I NIE MASZ ODWROTU"
11299: 0E57  push    cs
1129A: 5731  push    di
1129B: 31C0  xor     ax, ax
1129D: 509A  push    ax
1129E: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
112A3: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
112A8: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
112AD: BFA2  mov     di, 0x7a2
112B0: 1E57  push    ds
112B1: 57BF  push    di
112B2: BF88  mov     di, 0x1a88 ; str:"WE WSZYSTKICH KIERUNKACH SA KLATKI I UJADAJACE SIE W NICH POTWORY"
112B5: 0E57  push    cs
112B6: 5731  push    di
112B7: 31C0  xor     ax, ax
112B9: 509A  push    ax
112BA: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
112BF: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
112C4: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
112C9: BFA2  mov     di, 0x7a2
112CC: 1E57  push    ds
112CD: 57BF  push    di
112CE: BFCA  mov     di, 0x1aca ; str:"NO A POZA TYM NA SCIANIE JEST!!! PLAKAT!!!!"
112D1: 0E57  push    cs
112D2: 5731  push    di
112D3: 31C0  xor     ax, ax
112D5: 509A  push    ax
112D6: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
112DB: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
112E0: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
112E5: BFA2  mov     di, 0x7a2
112E8: 1E57  push    ds
112E9: 57A1  push    di
112EA: A19C  mov     ax, word ptr [0x19c] ; data:Energy
112ED: 9952  cdq
112EE: 5250  push    dx
112EF: 5031  push    ax
112F0: 31C0  xor     ax, ax
112F2: 509A  push    ax
112F3: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
112F8: BFF6  mov     di, 0x1af6 ; str:"%."
112FB: 0E57  push    cs
112FC: 5731  push    di
112FD: 31C0  xor     ax, ax
112FF: 509A  push    ax
11300: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
11305: A1D4  mov     ax, word ptr [0x1d4] ; data:KUNSZT
11308: 9952  cdq
11309: 5250  push    dx
1130A: 5031  push    ax
1130B: 31C0  xor     ax, ax
1130D: 509A  push    ax
1130E: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
11313: B03E  mov     al, 0x3e
11315: 5031  push    ax
11316: 31C0  xor     ax, ax
11318: 509A  push    ax
11319: 9A7B  lcall   0x1c71, 0x67b ; ->para1C71:067B
1131E: 9AFE  lcall   0x1c71, 0x5fe ; ->para1C71:05FE
11323: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11328: BFA2  mov     di, 0x6a2
1132B: 1E57  push    ds
1132C: 57BF  push    di
1132D: BF64  mov     di, 0x564
11330: 1E57  push    ds
11331: 57B8  push    di
11332: B8FF  mov     ax, 0xff
11335: 509A  push    ax
11336: 9AC6  lcall   0x1c71, 0x6c6 ; ->para1C71:06C6
1133B: 9A9D  lcall   0x1c71, 0x59d ; ->para1C71:059D
11340: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11345: 9A37  lcall   0x129d, 0x9137 ; ->para129D:9137
1134A: BF64  mov     di, 0x564
1134D: 1E57  push    ds
1134E: 57BF  push    di
1134F: BFF9  mov     di, 0x1af9 ; str:"MODE"
11352: 0E57  push    cs
11353: 579A  push    di
11354: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
11359: 7505  jne     0x11360
1135B: 9A14  lcall   0x129d, 0x3114 ; ->PRZEDM_MODE
11360: BF64  mov     di, 0x564
11363: 1E57  push    ds
11364: 57BF  push    di
11365: BFFE  mov     di, 0x1afe ; str:"EXIT"
11368: 0E57  push    cs
11369: 579A  push    di
1136A: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
1136F: 7403  je      0x11374
11371: E9C4  jmp     0x11438 ;
11374: BFA2  mov     di, 0x7a2
11377: 1E57  push    ds
11378: 57BF  push    di
11379: BF03  mov     di, 0x1b03 ; str:"DOSTEPNE WYJSCIA:"
1137C: 0E57  push    cs
1137D: 5731  push    di
1137E: 31C0  xor     ax, ax
11380: 509A  push    ax
11381: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
11386: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
1138B: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11390: BFA2  mov     di, 0x7a2
11393: 1E57  push    ds
11394: 57BF  push    di
11395: BF15  mov     di, 0x1b15 ; str:"WSCHOD-KLATKA CIENIASA"
11398: 0E57  push    cs
11399: 5731  push    di
1139A: 31C0  xor     ax, ax
1139C: 509A  push    ax
1139D: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
113A2: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
113A7: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
113AC: BFA2  mov     di, 0x7a2
113AF: 1E57  push    ds
113B0: 57BF  push    di
113B1: BF2C  mov     di, 0x1b2c ; str:"ZACHOD-KLATKA SILNEGO"
113B4: 0E57  push    cs
113B5: 5731  push    di
113B6: 31C0  xor     ax, ax
113B8: 509A  push    ax
113B9: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
113BE: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
113C3: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
113C8: BFA2  mov     di, 0x7a2
113CB: 1E57  push    ds
113CC: 57BF  push    di
113CD: BF42  mov     di, 0x1b42 ; str:"POLNOC-KLATKA ZRECZNEGO"
113D0: 0E57  push    cs
113D1: 5731  push    di
113D2: 31C0  xor     ax, ax
113D4: 509A  push    ax
113D5: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
113DA: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
113DF: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
113E4: BFA2  mov     di, 0x7a2
113E7: 1E57  push    ds
113E8: 57BF  push    di
113E9: BF5A  mov     di, 0x1b5a ; str:"POLODNIE-KLATKA ODPORNEGO"
113EC: 0E57  push    cs
113ED: 5731  push    di
113EE: 31C0  xor     ax, ax
113F0: 509A  push    ax
113F1: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
113F6: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
113FB: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11400: BFA2  mov     di, 0x7a2
11403: 1E57  push    ds
11404: 57BF  push    di
11405: BF74  mov     di, 0x1b74 ; str:"GORA-KLATKA SILNEGO,ODPORNEGO I ZRECZNEGO "
11408: 0E57  push    cs
11409: 5731  push    di
1140A: 31C0  xor     ax, ax
1140C: 509A  push    ax
1140D: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
11412: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
11417: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
1141C: BFA2  mov     di, 0x7a2
1141F: 1E57  push    ds
11420: 57BF  push    di
11421: BF9F  mov     di, 0x1b9f ; str:"DOL-JEDYNA DROGA NIE PROWADZACA DO KLATEK"
11424: 0E57  push    cs
11425: 5731  push    di
11426: 31C0  xor     ax, ax
11428: 509A  push    ax
11429: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
1142E: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
11433: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11438: BF64  mov     di, 0x564
1143B: 1E57  push    ds
1143C: 57BF  push    di
1143D: BFC9  mov     di, 0x1bc9 ; str:"WYJSCIE"
11440: 0E57  push    cs
11441: 579A  push    di
11442: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
11447: 7503  jne     0x1144c
11449: E9F9  jmp     0x11545 ;
1144C: BF64  mov     di, 0x564
1144F: 1E57  push    ds
11450: 57BF  push    di
11451: BFD1  mov     di, 0x1bd1 ; str:"WSCHOD"
11454: 0E57  push    cs
11455: 579A  push    di
11456: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
1145B: 7506  jne     0x11463
1145D: C706  mov     word ptr [0x1d6], 0xc ; data:context
11463: BF64  mov     di, 0x564
11466: 1E57  push    ds
11467: 57BF  push    di
11468: BFD8  mov     di, 0x1bd8 ; str:"ZACHOD"
1146B: 0E57  push    cs
1146C: 579A  push    di
1146D: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
11472: 7506  jne     0x1147a
11474: C706  mov     word ptr [0x1d6], 0xd ; data:context
1147A: BF64  mov     di, 0x564
1147D: 1E57  push    ds
1147E: 57BF  push    di
1147F: BFDF  mov     di, 0x1bdf ; str:"POLNOC"
11482: 0E57  push    cs
11483: 579A  push    di
11484: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
11489: 7506  jne     0x11491
1148B: C706  mov     word ptr [0x1d6], 0xe ; data:context
11491: BF64  mov     di, 0x564
11494: 1E57  push    ds
11495: 57BF  push    di
11496: BFE6  mov     di, 0x1be6 ; str:"POLODNIE"
11499: 0E57  push    cs
1149A: 579A  push    di
1149B: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
114A0: 7506  jne     0x114a8
114A2: C706  mov     word ptr [0x1d6], 0xf ; data:context
114A8: BF64  mov     di, 0x564
114AB: 1E57  push    ds
114AC: 57BF  push    di
114AD: BFEF  mov     di, 0x1bef ; str:"GORA"
114B0: 0E57  push    cs
114B1: 579A  push    di
114B2: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
114B7: 7506  jne     0x114bf
114B9: C706  mov     word ptr [0x1d6], 0x10 ; data:context
114BF: BF64  mov     di, 0x564
114C2: 1E57  push    ds
114C3: 57BF  push    di
114C4: BFF4  mov     di, 0x1bf4 ; str:"DOL"
114C7: 0E57  push    cs
114C8: 579A  push    di
114C9: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
114CE: 7506  jne     0x114d6
114D0: C706  mov     word ptr [0x1d6], 0x11 ; data:context
114D6: BF64  mov     di, 0x564
114D9: 1E57  push    ds
114DA: 57BF  push    di
114DB: BFF8  mov     di, 0x1bf8 ; str:"PATRZ PLAKAT"
114DE: 0E57  push    cs
114DF: 579A  push    di
114E0: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
114E5: 7554  jne     0x1153b
114E7: BFA2  mov     di, 0x7a2
114EA: 1E57  push    ds
114EB: 57BF  push    di
114EC: BF05  mov     di, 0x1c05 ; str:"NA PLAKACIE PISZE:"
114EF: 0E57  push    cs
114F0: 5731  push    di
114F1: 31C0  xor     ax, ax
114F3: 509A  push    ax
114F4: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
114F9: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
114FE: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11503: BFA2  mov     di, 0x7a2
11506: 1E57  push    ds
11507: 57BF  push    di
11508: BF18  mov     di, 0x1c18 ; str:"W KLATKACH SA POTWORKI - ZABIJ JE! KOMEDA : ZABIJ [COS] - ZABIJA "
1150B: 0E57  push    cs
1150C: 5731  push    di
1150D: 31C0  xor     ax, ax
1150F: 509A  push    ax
11510: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
11515: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
1151A: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
1151F: BFA2  mov     di, 0x7a2
11522: 1E57  push    ds
11523: 57BF  push    di
11524: BF5A  mov     di, 0x1c5a ; str:"CZASAMI COS WYPADNIE Z POTWORKA MOZE CI SIE TO PRZYDAC"
11527: 0E57  push    cs
11528: 5731  push    di
11529: 31C0  xor     ax, ax
1152B: 509A  push    ax
1152C: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
11531: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
11536: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
1153B: 833E  cmp     word ptr [0x1d6], 0xb ; data:context
11540: 7503  jne     0x11545
11542: E9A0  jmp     0x112e5 ;
11545: 5DCB  pop     bp
11546: CB2E  retf

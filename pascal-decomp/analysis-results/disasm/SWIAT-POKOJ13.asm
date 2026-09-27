; ===== PROC POKOJ13 @ img 10803 (block 1065C..10AC3) =====
;   str@img1065C: 'TEN POKOJ JEST CALY OBRYZGANY KRWIA NA SCIANACH FLAKI I MOZGI LODZKIE '
;   str@img106A3: 'SILNY , NAPAKOWANY POTWOR STOI POD SCIANA'
;   str@img106CD: 'PAROJACE WNETRZNOSCI POTWORA SA ROZWLECZONE DOOKOLA'
;   str@img10701: '%.'
;   str@img10704: 'EXIT'
;   str@img10709: 'DOSTEPNE WYJSCIA:'
;   str@img1071B: 'WSCHOD-KLATKI PELNE GAJDY'
;   str@img10735: 'MODE'
;   str@img1073A: 'WYJSCIE'
;   str@img10742: 'WSCHOD'
;   str@img10749: 'ZABIJ POTWOR'
;   str@img10756: 'WYCIAGASZ '
;   str@img10761: ' MONET Z CIALA POTWORA'
;   str@img10778: 'WYCIAGASZ STARY ZARDZEWIALY MIECZ Z CIALA POTWORA'
;   str@img107AA: 'WYCIAGASZ ZWYKLA MALA TARCZA Z CIALA POTWORA'
;   str@img107D7: 'WYCIAGASZ ZAKRWAWIONE SERCE Z CIALA POTWORA'
;   str@img10816: '┐ó'
;   str@img10880: 'Ö'
;   str@img1089B: 'Ö'
;   str@img1094B: '┐'
;   str@img10976: 'â'
;   str@img10980: '╟'
;   str@img109A1: '1'
;   str@img109B2: '┐ó'
;   str@img109C7: 'ÖR'
;   str@img109FC: 'â>'
;   str@img10A0F: 'â'
;   str@img10A19: 'ú'
;   str@img10A1C: '┐'
;   str@img10A4B: 'â'
;   str@img10A55: 'ú'
;   str@img10A58: '┐'
;   str@img10A87: 'â'
;   str@img10A91: 'ú'
;   str@img10A94: '┐'
;   str@img10AB7: 'â'
;   str@img10ABE: 'Θ╖²'

10803: 5589  push    bp
10804: 89E5  mov     bp, sp
10806: 31C0  xor     ax, ax
10808: 9ACD  lcall   0x1c71, 0x2cd ; ->para1C71:02CD
1080D: 833E  cmp     word ptr [0x1d6], 0xd ; data:context
10812: 7403  je      0x10817
10814: E9AB  jmp     0x10ac2 ;
10817: BFA2  mov     di, 0x7a2
1081A: 1E57  push    ds
1081B: 57BF  push    di
1081C: BF8C  mov     di, 0x108c ; str:"TEN POKOJ JEST CALY OBRYZGANY KRWIA NA SCIANACH FLAKI I MOZGI LODZKIE "
1081F: 0E57  push    cs
10820: 5731  push    di
10821: 31C0  xor     ax, ax
10823: 509A  push    ax
10824: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10829: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
1082E: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10833: 833E  cmp     word ptr [0x68c], 0xd
10838: 751C  jne     0x10856
1083A: BFA2  mov     di, 0x7a2
1083D: 1E57  push    ds
1083E: 57BF  push    di
1083F: BFD3  mov     di, 0x10d3 ; str:"SILNY , NAPAKOWANY POTWOR STOI POD SCIANA"
10842: 0E57  push    cs
10843: 5731  push    di
10844: 31C0  xor     ax, ax
10846: 509A  push    ax
10847: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
1084C: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10851: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10856: 833E  cmp     word ptr [0x68c], 0
1085B: 751C  jne     0x10879
1085D: BFA2  mov     di, 0x7a2
10860: 1E57  push    ds
10861: 57BF  push    di
10862: BFFD  mov     di, 0x10fd ; str:"PAROJACE WNETRZNOSCI POTWORA SA ROZWLECZONE DOOKOLA"
10865: 0E57  push    cs
10866: 5731  push    di
10867: 31C0  xor     ax, ax
10869: 509A  push    ax
1086A: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
1086F: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10874: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10879: BFA2  mov     di, 0x7a2
1087C: 1E57  push    ds
1087D: 57A1  push    di
1087E: A19C  mov     ax, word ptr [0x19c] ; data:Energy
10881: 9952  cdq
10882: 5250  push    dx
10883: 5031  push    ax
10884: 31C0  xor     ax, ax
10886: 509A  push    ax
10887: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
1088C: BF31  mov     di, 0x1131 ; str:"%."
1088F: 0E57  push    cs
10890: 5731  push    di
10891: 31C0  xor     ax, ax
10893: 509A  push    ax
10894: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10899: A1D4  mov     ax, word ptr [0x1d4] ; data:KUNSZT
1089C: 9952  cdq
1089D: 5250  push    dx
1089E: 5031  push    ax
1089F: 31C0  xor     ax, ax
108A1: 509A  push    ax
108A2: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
108A7: B03E  mov     al, 0x3e
108A9: 5031  push    ax
108AA: 31C0  xor     ax, ax
108AC: 509A  push    ax
108AD: 9A7B  lcall   0x1c71, 0x67b ; ->para1C71:067B
108B2: 9AFE  lcall   0x1c71, 0x5fe ; ->para1C71:05FE
108B7: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
108BC: BFA2  mov     di, 0x6a2
108BF: 1E57  push    ds
108C0: 57BF  push    di
108C1: BF64  mov     di, 0x564
108C4: 1E57  push    ds
108C5: 57B8  push    di
108C6: B8FF  mov     ax, 0xff
108C9: 509A  push    ax
108CA: 9AC6  lcall   0x1c71, 0x6c6 ; ->para1C71:06C6
108CF: 9A9D  lcall   0x1c71, 0x59d ; ->para1C71:059D
108D4: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
108D9: BF64  mov     di, 0x564
108DC: 1E57  push    ds
108DD: 57BF  push    di
108DE: BF34  mov     di, 0x1134 ; str:"EXIT"
108E1: 0E57  push    cs
108E2: 579A  push    di
108E3: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
108E8: 7538  jne     0x10922
108EA: BFA2  mov     di, 0x7a2
108ED: 1E57  push    ds
108EE: 57BF  push    di
108EF: BF39  mov     di, 0x1139 ; str:"DOSTEPNE WYJSCIA:"
108F2: 0E57  push    cs
108F3: 5731  push    di
108F4: 31C0  xor     ax, ax
108F6: 509A  push    ax
108F7: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
108FC: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10901: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10906: BFA2  mov     di, 0x7a2
10909: 1E57  push    ds
1090A: 57BF  push    di
1090B: BF4B  mov     di, 0x114b ; str:"WSCHOD-KLATKI PELNE GAJDY"
1090E: 0E57  push    cs
1090F: 5731  push    di
10910: 31C0  xor     ax, ax
10912: 509A  push    ax
10913: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10918: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
1091D: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10922: BF64  mov     di, 0x564
10925: 1E57  push    ds
10926: 57BF  push    di
10927: BF65  mov     di, 0x1165 ; str:"MODE"
1092A: 0E57  push    cs
1092B: 579A  push    di
1092C: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
10931: 7505  jne     0x10938
10933: 9A14  lcall   0x129d, 0x3114 ; ->PRZEDM_MODE
10938: BF64  mov     di, 0x564
1093B: 1E57  push    ds
1093C: 57BF  push    di
1093D: BF6A  mov     di, 0x116a ; str:"WYJSCIE"
10940: 0E57  push    cs
10941: 579A  push    di
10942: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
10947: 7503  jne     0x1094c
10949: E976  jmp     0x10ac2 ;
1094C: BF64  mov     di, 0x564
1094F: 1E57  push    ds
10950: 57BF  push    di
10951: BF72  mov     di, 0x1172 ; str:"WSCHOD"
10954: 0E57  push    cs
10955: 579A  push    di
10956: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
1095B: 7506  jne     0x10963
1095D: C706  mov     word ptr [0x1d6], 0xb ; data:context
10963: BF64  mov     di, 0x564
10966: 1E57  push    ds
10967: 57BF  push    di
10968: BF79  mov     di, 0x1179 ; str:"ZABIJ POTWOR"
1096B: 0E57  push    cs
1096C: 579A  push    di
1096D: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
10972: 7403  je      0x10977
10974: E941  jmp     0x10ab8 ;
10977: 833E  cmp     word ptr [0x68c], 0xd
1097C: 7403  je      0x10981
1097E: E937  jmp     0x10ab8 ;
10981: C706  mov     word ptr [0x1b0], 0x14 ; data:MonsterHP
10987: C706  mov     word ptr [0x1b8], 3
1098D: C706  mov     word ptr [0x1b6], 0xa
10993: 9AA6  lcall   0x129d, 0x44a6 ; ->PRZEDM_WALKA
10998: 833E  cmp     word ptr [0x1d2], 0 ; data:fleeFlag
1099D: 7403  je      0x109a2
1099F: E911  jmp     0x10ab3 ;
109A2: 31C0  xor     ax, ax
109A4: A38C  mov     word ptr [0x68c], ax
109A7: B80F  mov     ax, 0xf
109AA: 509A  push    ax
109AB: 9AE4  lcall   0x1c71, 0xbe4 ; ->para1C71:0BE4
109B0: A312  mov     word ptr [0x212], ax ; data:LootMoney
109B3: BFA2  mov     di, 0x7a2
109B6: 1E57  push    ds
109B7: 57BF  push    di
109B8: BF86  mov     di, 0x1186 ; str:"WYCIAGASZ "
109BB: 0E57  push    cs
109BC: 5731  push    di
109BD: 31C0  xor     ax, ax
109BF: 509A  push    ax
109C0: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
109C5: A112  mov     ax, word ptr [0x212] ; data:LootMoney
109C8: 9952  cdq
109C9: 5250  push    dx
109CA: 5031  push    ax
109CB: 31C0  xor     ax, ax
109CD: 509A  push    ax
109CE: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
109D3: BF91  mov     di, 0x1191 ; str:" MONET Z CIALA POTWORA"
109D6: 0E57  push    cs
109D7: 5731  push    di
109D8: 31C0  xor     ax, ax
109DA: 509A  push    ax
109DB: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
109E0: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
109E5: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
109EA: A112  mov     ax, word ptr [0x212] ; data:LootMoney
109ED: 9903  cdq
109EE: 0306  add     ax, word ptr [0x21a] ; data:ForsaLo
109F2: 1316  adc     dx, word ptr [0x21c] ; data:ForsaHi
109F6: A31A  mov     word ptr [0x21a], ax ; data:ForsaLo
109F9: 8916  mov     word ptr [0x21c], dx ; data:ForsaHi
109FD: 833E  cmp     word ptr [0x17e], 0
10A02: 7535  jne     0x10a39
10A04: B814  mov     ax, 0x14
10A07: 509A  push    ax
10A08: 9AE4  lcall   0x1c71, 0xbe4 ; ->para1C71:0BE4
10A0D: A39E  mov     word ptr [0x19e], ax
10A10: 833E  cmp     word ptr [0x19e], 7
10A15: 7D22  jge     0x10a39
10A17: A1D6  mov     ax, word ptr [0x1d6] ; data:context
10A1A: A37E  mov     word ptr [0x17e], ax
10A1D: BFA2  mov     di, 0x7a2
10A20: 1E57  push    ds
10A21: 57BF  push    di
10A22: BFA8  mov     di, 0x11a8 ; str:"WYCIAGASZ STARY ZARDZEWIALY MIECZ Z CIALA POTWORA"
10A25: 0E57  push    cs
10A26: 5731  push    di
10A27: 31C0  xor     ax, ax
10A29: 509A  push    ax
10A2A: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10A2F: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10A34: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10A39: 833E  cmp     word ptr [0x184], 0
10A3E: 7535  jne     0x10a75
10A40: B814  mov     ax, 0x14
10A43: 509A  push    ax
10A44: 9AE4  lcall   0x1c71, 0xbe4 ; ->para1C71:0BE4
10A49: A39E  mov     word ptr [0x19e], ax
10A4C: 833E  cmp     word ptr [0x19e], 7
10A51: 7D22  jge     0x10a75
10A53: A1D6  mov     ax, word ptr [0x1d6] ; data:context
10A56: A384  mov     word ptr [0x184], ax
10A59: BFA2  mov     di, 0x7a2
10A5C: 1E57  push    ds
10A5D: 57BF  push    di
10A5E: BFDA  mov     di, 0x11da ; str:"WYCIAGASZ ZWYKLA MALA TARCZA Z CIALA POTWORA"
10A61: 0E57  push    cs
10A62: 5731  push    di
10A63: 31C0  xor     ax, ax
10A65: 509A  push    ax
10A66: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10A6B: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10A70: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10A75: 833E  cmp     word ptr [0x186], 0 ; data:Item_Serce
10A7A: 7535  jne     0x10ab1
10A7C: B814  mov     ax, 0x14
10A7F: 509A  push    ax
10A80: 9AE4  lcall   0x1c71, 0xbe4 ; ->para1C71:0BE4
10A85: A39E  mov     word ptr [0x19e], ax
10A88: 833E  cmp     word ptr [0x19e], 6
10A8D: 7D22  jge     0x10ab1
10A8F: A1D6  mov     ax, word ptr [0x1d6] ; data:context
10A92: A386  mov     word ptr [0x186], ax ; data:Item_Serce
10A95: BFA2  mov     di, 0x7a2
10A98: 1E57  push    ds
10A99: 57BF  push    di
10A9A: BF07  mov     di, 0x1207 ; str:"WYCIAGASZ ZAKRWAWIONE SERCE Z CIALA POTWORA"
10A9D: 0E57  push    cs
10A9E: 5731  push    di
10A9F: 31C0  xor     ax, ax
10AA1: 509A  push    ax
10AA2: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10AA7: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10AAC: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10AB1: EB05  jmp     0x10ab8 ;
10AB3: 31C0  xor     ax, ax
10AB5: A3D2  mov     word ptr [0x1d2], ax ; data:fleeFlag
10AB8: 833E  cmp     word ptr [0x1d6], 0xd ; data:context
10ABD: 7503  jne     0x10ac2
10ABF: E9B7  jmp     0x10879 ;
10AC2: 5DCB  pop     bp
10AC3: CB31  retf

; ===== PROC POKOJ1 @ img 0FEDF (block FB48..10264) =====
;   str@img0FB48: 'JESTES W OKROGLYM SALONIE WYPELNIONYM WITRAZAMI '
;   str@img0FB79: 'W POWIETRZU UNOSZA SIE ZAPACHY I SO TO ZAPACHY OK'
;   str@img0FBAB: 'NO A POZA TYM NA SCIANIE JEST!!! PLAKAT!!!!'
;   str@img0FBD7: 'NAPISZ PATRZ PLAKAT ABY GO ODCZYTAÅ '
;   str@img0FBFC: '%.'
;   str@img0FBFF: 'MODE'
;   str@img0FC04: 'EXIT'
;   str@img0FC09: 'DOSTEPNE WYJSCIA:'
;   str@img0FC1B: 'POLODNIE-TAM GDZIE ZACZYNASZ GRE'
;   str@img0FC3C: 'POLNOC-MIASTO'
;   str@img0FC4A: 'WSCHOD-POKOJ TRENINGOWY 1'
;   str@img0FC64: 'ZACHOD-MUD SZKOLA'
;   str@img0FC76: 'DOL-PODDZIEMNY POKOJ TRENINGOWY(2)'
;   str@img0FC99: 'WYJSCIE'
;   str@img0FCA1: 'POLODNIE'
;   str@img0FCAA: 'WSCHOD'
;   str@img0FCB1: 'DOL'
;   str@img0FCB5: 'ZACHOD'
;   str@img0FCBC: 'POLNOC'
;   str@img0FCC3: 'PATRZ PLAKAT'
;   str@img0FCD0: '⌐ NA PLAKACIE PISZE:'
;   str@img0FCE5: 'JE╜ELI CHCESZ TRENOWAC UDAJ SIE DO POKOJU TRENINGOWEGO'
;   str@img0FD1C: 'JE╜ELI CHCESZ NAUCZYC SIE NOWYCH KOMEND IDZ DO MUD SZKOLY'
;   str@img0FD56: 'DOPIERO POTEM IDZ DO MIASTA '
;   str@img0FD73: 'A OTO TAJNE KOMENDY :'
;   str@img0FD89: ' MODE - WPROWADZENIE W STAN PODSWIADOMOSCI'
;   str@img0FDB4: ' UNMODE - POWROT DO POPRZEDNIEGO STANU'
;   str@img0FDDB: 'W CZASIE POBYTU W STANIE PODSWIADOMOSCI DZIALA WIELE KOMEND MIN:'
;   str@img0FE1C: ' JA - WSZYSTKO O TOBIE , BIERZ , UZYJ , ZDEJMIJ , ODRZUC I INNE '
;   str@img0FE5D: ' PONADTO WIELE KOMEND TRZEBA ODKRYC NP:ZMIEN KOLOR , ZMIEN TLO '
;   str@img0FE9D: ' UWAGA Z OSTATNIEJ CHWILI : KOMENDA SPIJ W STANIE PODSWIADOMOSCI!'
;   str@img0FF60: 'Ö'
;   str@img0FF7B: 'Ö'
;   str@img1009E: '┐'
;   str@img100B4: '┐'
;   str@img10124: '┐'
;   str@img1025D: 'u'
;   str@img1025F: 'Θ÷ⁿ'

0FEDF: 5589  push    bp
0FEE0: 89E5  mov     bp, sp
0FEE2: 31C0  xor     ax, ax
0FEE4: 9ACD  lcall   0x1c71, 0x2cd ; ->para1C71:02CD
0FEE9: BFA2  mov     di, 0x7a2
0FEEC: 1E57  push    ds
0FEED: 57BF  push    di
0FEEE: BF78  mov     di, 0x578 ; str:"JESTES W OKROGLYM SALONIE WYPELNIONYM WITRAZAMI "
0FEF1: 0E57  push    cs
0FEF2: 5731  push    di
0FEF3: 31C0  xor     ax, ax
0FEF5: 509A  push    ax
0FEF6: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
0FEFB: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
0FF00: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
0FF05: BFA2  mov     di, 0x7a2
0FF08: 1E57  push    ds
0FF09: 57BF  push    di
0FF0A: BFA9  mov     di, 0x5a9 ; str:"W POWIETRZU UNOSZA SIE ZAPACHY I SO TO ZAPACHY OK"
0FF0D: 0E57  push    cs
0FF0E: 5731  push    di
0FF0F: 31C0  xor     ax, ax
0FF11: 509A  push    ax
0FF12: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
0FF17: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
0FF1C: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
0FF21: BFA2  mov     di, 0x7a2
0FF24: 1E57  push    ds
0FF25: 57BF  push    di
0FF26: BFDB  mov     di, 0x5db ; str:"NO A POZA TYM NA SCIANIE JEST!!! PLAKAT!!!!"
0FF29: 0E57  push    cs
0FF2A: 5731  push    di
0FF2B: 31C0  xor     ax, ax
0FF2D: 509A  push    ax
0FF2E: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
0FF33: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
0FF38: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
0FF3D: BFA2  mov     di, 0x7a2
0FF40: 1E57  push    ds
0FF41: 57BF  push    di
0FF42: BF07  mov     di, 0x607 ; str:"NAPISZ PATRZ PLAKAT ABY GO ODCZYTAÅ "
0FF45: 0E57  push    cs
0FF46: 5731  push    di
0FF47: 31C0  xor     ax, ax
0FF49: 509A  push    ax
0FF4A: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
0FF4F: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
0FF54: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
0FF59: BFA2  mov     di, 0x7a2
0FF5C: 1E57  push    ds
0FF5D: 57A1  push    di
0FF5E: A19C  mov     ax, word ptr [0x19c] ; data:Energy
0FF61: 9952  cdq
0FF62: 5250  push    dx
0FF63: 5031  push    ax
0FF64: 31C0  xor     ax, ax
0FF66: 509A  push    ax
0FF67: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
0FF6C: BF2C  mov     di, 0x62c ; str:"%."
0FF6F: 0E57  push    cs
0FF70: 5731  push    di
0FF71: 31C0  xor     ax, ax
0FF73: 509A  push    ax
0FF74: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
0FF79: A1D4  mov     ax, word ptr [0x1d4] ; data:KUNSZT
0FF7C: 9952  cdq
0FF7D: 5250  push    dx
0FF7E: 5031  push    ax
0FF7F: 31C0  xor     ax, ax
0FF81: 509A  push    ax
0FF82: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
0FF87: B03E  mov     al, 0x3e
0FF89: 5031  push    ax
0FF8A: 31C0  xor     ax, ax
0FF8C: 509A  push    ax
0FF8D: 9A7B  lcall   0x1c71, 0x67b ; ->para1C71:067B
0FF92: 9AFE  lcall   0x1c71, 0x5fe ; ->para1C71:05FE
0FF97: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
0FF9C: BFA2  mov     di, 0x6a2
0FF9F: 1E57  push    ds
0FFA0: 57BF  push    di
0FFA1: BF64  mov     di, 0x564
0FFA4: 1E57  push    ds
0FFA5: 57B8  push    di
0FFA6: B8FF  mov     ax, 0xff
0FFA9: 509A  push    ax
0FFAA: 9AC6  lcall   0x1c71, 0x6c6 ; ->para1C71:06C6
0FFAF: 9A9D  lcall   0x1c71, 0x59d ; ->para1C71:059D
0FFB4: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
0FFB9: BF64  mov     di, 0x564
0FFBC: 1E57  push    ds
0FFBD: 57BF  push    di
0FFBE: BF2F  mov     di, 0x62f ; str:"MODE"
0FFC1: 0E57  push    cs
0FFC2: 579A  push    di
0FFC3: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
0FFC8: 7505  jne     0xffcf
0FFCA: 9A14  lcall   0x129d, 0x3114 ; ->PRZEDM_MODE
0FFCF: BF64  mov     di, 0x564
0FFD2: 1E57  push    ds
0FFD3: 57BF  push    di
0FFD4: BF34  mov     di, 0x634 ; str:"EXIT"
0FFD7: 0E57  push    cs
0FFD8: 579A  push    di
0FFD9: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
0FFDE: 7403  je      0xffe3
0FFE0: E9A8  jmp     0x1008b ;
0FFE3: BFA2  mov     di, 0x7a2
0FFE6: 1E57  push    ds
0FFE7: 57BF  push    di
0FFE8: BF39  mov     di, 0x639 ; str:"DOSTEPNE WYJSCIA:"
0FFEB: 0E57  push    cs
0FFEC: 5731  push    di
0FFED: 31C0  xor     ax, ax
0FFEF: 509A  push    ax
0FFF0: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
0FFF5: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
0FFFA: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
0FFFF: BFA2  mov     di, 0x7a2
10002: 1E57  push    ds
10003: 57BF  push    di
10004: BF4B  mov     di, 0x64b ; str:"POLODNIE-TAM GDZIE ZACZYNASZ GRE"
10007: 0E57  push    cs
10008: 5731  push    di
10009: 31C0  xor     ax, ax
1000B: 509A  push    ax
1000C: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10011: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10016: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
1001B: BFA2  mov     di, 0x7a2
1001E: 1E57  push    ds
1001F: 57BF  push    di
10020: BF6C  mov     di, 0x66c ; str:"POLNOC-MIASTO"
10023: 0E57  push    cs
10024: 5731  push    di
10025: 31C0  xor     ax, ax
10027: 509A  push    ax
10028: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
1002D: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10032: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10037: BFA2  mov     di, 0x7a2
1003A: 1E57  push    ds
1003B: 57BF  push    di
1003C: BF7A  mov     di, 0x67a ; str:"WSCHOD-POKOJ TRENINGOWY 1"
1003F: 0E57  push    cs
10040: 5731  push    di
10041: 31C0  xor     ax, ax
10043: 509A  push    ax
10044: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10049: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
1004E: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10053: BFA2  mov     di, 0x7a2
10056: 1E57  push    ds
10057: 57BF  push    di
10058: BF94  mov     di, 0x694 ; str:"ZACHOD-MUD SZKOLA"
1005B: 0E57  push    cs
1005C: 5731  push    di
1005D: 31C0  xor     ax, ax
1005F: 509A  push    ax
10060: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10065: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
1006A: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
1006F: BFA2  mov     di, 0x7a2
10072: 1E57  push    ds
10073: 57BF  push    di
10074: BFA6  mov     di, 0x6a6 ; str:"DOL-PODDZIEMNY POKOJ TRENINGOWY(2)"
10077: 0E57  push    cs
10078: 5731  push    di
10079: 31C0  xor     ax, ax
1007B: 509A  push    ax
1007C: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10081: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10086: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
1008B: BF64  mov     di, 0x564
1008E: 1E57  push    ds
1008F: 57BF  push    di
10090: BFC9  mov     di, 0x6c9 ; str:"WYJSCIE"
10093: 0E57  push    cs
10094: 579A  push    di
10095: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
1009A: 7503  jne     0x1009f
1009C: E9C4  jmp     0x10263 ;
1009F: BF64  mov     di, 0x564
100A2: 1E57  push    ds
100A3: 57BF  push    di
100A4: BFD1  mov     di, 0x6d1 ; str:"POLODNIE"
100A7: 0E57  push    cs
100A8: 579A  push    di
100A9: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
100AE: 7505  jne     0x100b5
100B0: 31C0  xor     ax, ax
100B2: A3D6  mov     word ptr [0x1d6], ax ; data:context
100B5: BF64  mov     di, 0x564
100B8: 1E57  push    ds
100B9: 57BF  push    di
100BA: BFDA  mov     di, 0x6da ; str:"WSCHOD"
100BD: 0E57  push    cs
100BE: 579A  push    di
100BF: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
100C4: 7506  jne     0x100cc
100C6: C706  mov     word ptr [0x1d6], 2 ; data:context
100CC: BF64  mov     di, 0x564
100CF: 1E57  push    ds
100D0: 57BF  push    di
100D1: BFE1  mov     di, 0x6e1 ; str:"DOL"
100D4: 0E57  push    cs
100D5: 579A  push    di
100D6: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
100DB: 7506  jne     0x100e3
100DD: C706  mov     word ptr [0x1d6], 3 ; data:context
100E3: BF64  mov     di, 0x564
100E6: 1E57  push    ds
100E7: 57BF  push    di
100E8: BFE5  mov     di, 0x6e5 ; str:"ZACHOD"
100EB: 0E57  push    cs
100EC: 579A  push    di
100ED: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
100F2: 7506  jne     0x100fa
100F4: C706  mov     word ptr [0x1d6], 4 ; data:context
100FA: BF64  mov     di, 0x564
100FD: 1E57  push    ds
100FE: 57BF  push    di
100FF: BFEC  mov     di, 0x6ec ; str:"POLNOC"
10102: 0E57  push    cs
10103: 579A  push    di
10104: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
10109: 7506  jne     0x10111
1010B: C706  mov     word ptr [0x1d6], 0x14 ; data:context
10111: BF64  mov     di, 0x564
10114: 1E57  push    ds
10115: 57BF  push    di
10116: BFF3  mov     di, 0x6f3 ; str:"PATRZ PLAKAT"
10119: 0E57  push    cs
1011A: 579A  push    di
1011B: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
10120: 7403  je      0x10125
10122: E934  jmp     0x10259 ;
10125: BFA2  mov     di, 0x7a2
10128: 1E57  push    ds
10129: 57BF  push    di
1012A: BF00  mov     di, 0x700 ; str:"⌐ NA PLAKACIE PISZE:"
1012D: 0E57  push    cs
1012E: 5731  push    di
1012F: 31C0  xor     ax, ax
10131: 509A  push    ax
10132: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10137: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
1013C: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10141: BFA2  mov     di, 0x7a2
10144: 1E57  push    ds
10145: 57BF  push    di
10146: BF15  mov     di, 0x715 ; str:"JE╜ELI CHCESZ TRENOWAC UDAJ SIE DO POKOJU TRENINGOWEGO"
10149: 0E57  push    cs
1014A: 5731  push    di
1014B: 31C0  xor     ax, ax
1014D: 509A  push    ax
1014E: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10153: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10158: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
1015D: BFA2  mov     di, 0x7a2
10160: 1E57  push    ds
10161: 57BF  push    di
10162: BF4C  mov     di, 0x74c ; str:"JE╜ELI CHCESZ NAUCZYC SIE NOWYCH KOMEND IDZ DO MUD SZKOLY"
10165: 0E57  push    cs
10166: 5731  push    di
10167: 31C0  xor     ax, ax
10169: 509A  push    ax
1016A: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
1016F: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10174: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10179: BFA2  mov     di, 0x7a2
1017C: 1E57  push    ds
1017D: 57BF  push    di
1017E: BF86  mov     di, 0x786 ; str:"DOPIERO POTEM IDZ DO MIASTA "
10181: 0E57  push    cs
10182: 5731  push    di
10183: 31C0  xor     ax, ax
10185: 509A  push    ax
10186: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
1018B: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10190: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10195: BFA2  mov     di, 0x7a2
10198: 1E57  push    ds
10199: 57BF  push    di
1019A: BFA3  mov     di, 0x7a3 ; str:"A OTO TAJNE KOMENDY :"
1019D: 0E57  push    cs
1019E: 5731  push    di
1019F: 31C0  xor     ax, ax
101A1: 509A  push    ax
101A2: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
101A7: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
101AC: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
101B1: BFA2  mov     di, 0x7a2
101B4: 1E57  push    ds
101B5: 57BF  push    di
101B6: BFB9  mov     di, 0x7b9 ; str:" MODE - WPROWADZENIE W STAN PODSWIADOMOSCI"
101B9: 0E57  push    cs
101BA: 5731  push    di
101BB: 31C0  xor     ax, ax
101BD: 509A  push    ax
101BE: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
101C3: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
101C8: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
101CD: BFA2  mov     di, 0x7a2
101D0: 1E57  push    ds
101D1: 57BF  push    di
101D2: BFE4  mov     di, 0x7e4 ; str:" UNMODE - POWROT DO POPRZEDNIEGO STANU"
101D5: 0E57  push    cs
101D6: 5731  push    di
101D7: 31C0  xor     ax, ax
101D9: 509A  push    ax
101DA: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
101DF: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
101E4: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
101E9: BFA2  mov     di, 0x7a2
101EC: 1E57  push    ds
101ED: 57BF  push    di
101EE: BF0B  mov     di, 0x80b ; str:"W CZASIE POBYTU W STANIE PODSWIADOMOSCI DZIALA WIELE KOMEND MIN:"
101F1: 0E57  push    cs
101F2: 5731  push    di
101F3: 31C0  xor     ax, ax
101F5: 509A  push    ax
101F6: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
101FB: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10200: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10205: BFA2  mov     di, 0x7a2
10208: 1E57  push    ds
10209: 57BF  push    di
1020A: BF4C  mov     di, 0x84c ; str:" JA - WSZYSTKO O TOBIE , BIERZ , UZYJ , ZDEJMIJ , ODRZUC I INNE "
1020D: 0E57  push    cs
1020E: 5731  push    di
1020F: 31C0  xor     ax, ax
10211: 509A  push    ax
10212: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10217: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
1021C: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10221: BFA2  mov     di, 0x7a2
10224: 1E57  push    ds
10225: 57BF  push    di
10226: BF8D  mov     di, 0x88d ; str:" PONADTO WIELE KOMEND TRZEBA ODKRYC NP:ZMIEN KOLOR , ZMIEN TLO "
10229: 0E57  push    cs
1022A: 5731  push    di
1022B: 31C0  xor     ax, ax
1022D: 509A  push    ax
1022E: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10233: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10238: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
1023D: BFA2  mov     di, 0x7a2
10240: 1E57  push    ds
10241: 57BF  push    di
10242: BFCD  mov     di, 0x8cd ; str:" UWAGA Z OSTATNIEJ CHWILI : KOMENDA SPIJ W STANIE PODSWIADOMOSCI!"
10245: 0E57  push    cs
10246: 5731  push    di
10247: 31C0  xor     ax, ax
10249: 509A  push    ax
1024A: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
1024F: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10254: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10259: 833E  cmp     word ptr [0x1d6], 1 ; data:context
1025E: 7503  jne     0x10263
10260: E9F6  jmp     0xff59 ;
10263: 5DCB  pop     bp
10264: CB30  retf

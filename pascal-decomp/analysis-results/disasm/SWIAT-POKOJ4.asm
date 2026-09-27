; ===== PROC POKOJ4 @ img 10447 (block 10265..1065B) =====
;   str@img10265: 'JESTES W HALLU MUD SZKOLY- OGARNIA CIE CYKORIA  '
;   str@img10296: 'NO A POZA TYM NA SCIANIE JEST!!! AFISZ!!!'
;   str@img102C0: '%.'
;   str@img102C3: 'MODE'
;   str@img102C8: 'EXIT'
;   str@img102CD: 'DOSTEPNE WYJSCIA:'
;   str@img102DF: 'WSCHOD-POKOJ CENTRALNY'
;   str@img102F6: 'ZACHOD-MUD SZKOLA (2)'
;   str@img1030C: 'WYJSCIE'
;   str@img10314: 'WSCHOD'
;   str@img1031B: 'ZACHOD'
;   str@img10322: 'PATRZ AFISZ'
;   str@img1032E: '⌐ NA AFISZU BYNAJMNIEJ PISZE'
;   str@img1034B: 'TO JEST MUD SZKOLA KUJ KOMEDY ALBO ZGINIESZ!!!!!!!!'
;   str@img1037F: 'JESLI CHODZI O EKWIPUNEK TO BIERZ (PRZEDMIOT)=BIERZESZ PRZEDMIOT'
;   str@img103C0: 'UZYJ (PRZEDMIOT) = UZYWASZ PRZEDMIOTU ODRZUC (PRZEDMIOT) = ODRZUCASZ'
;   str@img10405: 'BRONIE I TARCZE I UBRONIA MOZNA ZDJAC KOMENDA ODLORZ (PRZEDMIOT) '
;   str@img1045A: '┐'
;   str@img1049A: 'Ö'
;   str@img104B5: 'Ö'
;   str@img10656: 'Θ9■'

10447: 5589  push    bp
10448: 89E5  mov     bp, sp
1044A: 31C0  xor     ax, ax
1044C: 9ACD  lcall   0x1c71, 0x2cd ; ->para1C71:02CD
10451: 833E  cmp     word ptr [0x1d6], 4 ; data:context
10456: 7403  je      0x1045b
10458: E9FF  jmp     0x1065a ;
1045B: BFA2  mov     di, 0x7a2
1045E: 1E57  push    ds
1045F: 57BF  push    di
10460: BF95  mov     di, 0xc95 ; str:"JESTES W HALLU MUD SZKOLY- OGARNIA CIE CYKORIA  "
10463: 0E57  push    cs
10464: 5731  push    di
10465: 31C0  xor     ax, ax
10467: 509A  push    ax
10468: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
1046D: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10472: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10477: BFA2  mov     di, 0x7a2
1047A: 1E57  push    ds
1047B: 57BF  push    di
1047C: BFC6  mov     di, 0xcc6 ; str:"NO A POZA TYM NA SCIANIE JEST!!! AFISZ!!!"
1047F: 0E57  push    cs
10480: 5731  push    di
10481: 31C0  xor     ax, ax
10483: 509A  push    ax
10484: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10489: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
1048E: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10493: BFA2  mov     di, 0x7a2
10496: 1E57  push    ds
10497: 57A1  push    di
10498: A19C  mov     ax, word ptr [0x19c] ; data:Energy
1049B: 9952  cdq
1049C: 5250  push    dx
1049D: 5031  push    ax
1049E: 31C0  xor     ax, ax
104A0: 509A  push    ax
104A1: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
104A6: BFF0  mov     di, 0xcf0 ; str:"%."
104A9: 0E57  push    cs
104AA: 5731  push    di
104AB: 31C0  xor     ax, ax
104AD: 509A  push    ax
104AE: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
104B3: A1D4  mov     ax, word ptr [0x1d4] ; data:KUNSZT
104B6: 9952  cdq
104B7: 5250  push    dx
104B8: 5031  push    ax
104B9: 31C0  xor     ax, ax
104BB: 509A  push    ax
104BC: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
104C1: B03E  mov     al, 0x3e
104C3: 5031  push    ax
104C4: 31C0  xor     ax, ax
104C6: 509A  push    ax
104C7: 9A7B  lcall   0x1c71, 0x67b ; ->para1C71:067B
104CC: 9AFE  lcall   0x1c71, 0x5fe ; ->para1C71:05FE
104D1: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
104D6: BFA2  mov     di, 0x6a2
104D9: 1E57  push    ds
104DA: 57BF  push    di
104DB: BF64  mov     di, 0x564
104DE: 1E57  push    ds
104DF: 57B8  push    di
104E0: B8FF  mov     ax, 0xff
104E3: 509A  push    ax
104E4: 9AC6  lcall   0x1c71, 0x6c6 ; ->para1C71:06C6
104E9: 9A9D  lcall   0x1c71, 0x59d ; ->para1C71:059D
104EE: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
104F3: BF64  mov     di, 0x564
104F6: 1E57  push    ds
104F7: 57BF  push    di
104F8: BFF3  mov     di, 0xcf3 ; str:"MODE"
104FB: 0E57  push    cs
104FC: 579A  push    di
104FD: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
10502: 7505  jne     0x10509
10504: 9A14  lcall   0x129d, 0x3114 ; ->PRZEDM_MODE
10509: BF64  mov     di, 0x564
1050C: 1E57  push    ds
1050D: 57BF  push    di
1050E: BFF8  mov     di, 0xcf8 ; str:"EXIT"
10511: 0E57  push    cs
10512: 579A  push    di
10513: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
10518: 7554  jne     0x1056e
1051A: BFA2  mov     di, 0x7a2
1051D: 1E57  push    ds
1051E: 57BF  push    di
1051F: BFFD  mov     di, 0xcfd ; str:"DOSTEPNE WYJSCIA:"
10522: 0E57  push    cs
10523: 5731  push    di
10524: 31C0  xor     ax, ax
10526: 509A  push    ax
10527: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
1052C: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10531: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10536: BFA2  mov     di, 0x7a2
10539: 1E57  push    ds
1053A: 57BF  push    di
1053B: BF0F  mov     di, 0xd0f ; str:"WSCHOD-POKOJ CENTRALNY"
1053E: 0E57  push    cs
1053F: 5731  push    di
10540: 31C0  xor     ax, ax
10542: 509A  push    ax
10543: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10548: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
1054D: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10552: BFA2  mov     di, 0x7a2
10555: 1E57  push    ds
10556: 57BF  push    di
10557: BF26  mov     di, 0xd26 ; str:"ZACHOD-MUD SZKOLA (2)"
1055A: 0E57  push    cs
1055B: 5731  push    di
1055C: 31C0  xor     ax, ax
1055E: 509A  push    ax
1055F: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10564: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10569: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
1056E: BF64  mov     di, 0x564
10571: 1E57  push    ds
10572: 57BF  push    di
10573: BF3C  mov     di, 0xd3c ; str:"WYJSCIE"
10576: 0E57  push    cs
10577: 579A  push    di
10578: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
1057D: 7503  jne     0x10582
1057F: E9D8  jmp     0x1065a ;
10582: BF64  mov     di, 0x564
10585: 1E57  push    ds
10586: 57BF  push    di
10587: BF44  mov     di, 0xd44 ; str:"WSCHOD"
1058A: 0E57  push    cs
1058B: 579A  push    di
1058C: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
10591: 7506  jne     0x10599
10593: C706  mov     word ptr [0x1d6], 1 ; data:context
10599: BF64  mov     di, 0x564
1059C: 1E57  push    ds
1059D: 57BF  push    di
1059E: BF4B  mov     di, 0xd4b ; str:"ZACHOD"
105A1: 0E57  push    cs
105A2: 579A  push    di
105A3: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
105A8: 7506  jne     0x105b0
105AA: C706  mov     word ptr [0x1d6], 5 ; data:context
105B0: BF64  mov     di, 0x564
105B3: 1E57  push    ds
105B4: 57BF  push    di
105B5: BF52  mov     di, 0xd52 ; str:"PATRZ AFISZ"
105B8: 0E57  push    cs
105B9: 579A  push    di
105BA: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
105BF: 7403  je      0x105c4
105C1: E98C  jmp     0x10650 ;
105C4: BFA2  mov     di, 0x7a2
105C7: 1E57  push    ds
105C8: 57BF  push    di
105C9: BF5E  mov     di, 0xd5e ; str:"⌐ NA AFISZU BYNAJMNIEJ PISZE"
105CC: 0E57  push    cs
105CD: 5731  push    di
105CE: 31C0  xor     ax, ax
105D0: 509A  push    ax
105D1: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
105D6: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
105DB: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
105E0: BFA2  mov     di, 0x7a2
105E3: 1E57  push    ds
105E4: 57BF  push    di
105E5: BF7B  mov     di, 0xd7b ; str:"TO JEST MUD SZKOLA KUJ KOMEDY ALBO ZGINIESZ!!!!!!!!"
105E8: 0E57  push    cs
105E9: 5731  push    di
105EA: 31C0  xor     ax, ax
105EC: 509A  push    ax
105ED: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
105F2: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
105F7: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
105FC: BFA2  mov     di, 0x7a2
105FF: 1E57  push    ds
10600: 57BF  push    di
10601: BFAF  mov     di, 0xdaf ; str:"JESLI CHODZI O EKWIPUNEK TO BIERZ (PRZEDMIOT)=BIERZESZ PRZEDMIOT"
10604: 0E57  push    cs
10605: 5731  push    di
10606: 31C0  xor     ax, ax
10608: 509A  push    ax
10609: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
1060E: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10613: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10618: BFA2  mov     di, 0x7a2
1061B: 1E57  push    ds
1061C: 57BF  push    di
1061D: BFF0  mov     di, 0xdf0 ; str:"UZYJ (PRZEDMIOT) = UZYWASZ PRZEDMIOTU ODRZUC (PRZEDMIOT) = ODRZUCASZ"
10620: 0E57  push    cs
10621: 5731  push    di
10622: 31C0  xor     ax, ax
10624: 509A  push    ax
10625: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
1062A: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
1062F: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10634: BFA2  mov     di, 0x7a2
10637: 1E57  push    ds
10638: 57BF  push    di
10639: BF35  mov     di, 0xe35 ; str:"BRONIE I TARCZE I UBRONIA MOZNA ZDJAC KOMENDA ODLORZ (PRZEDMIOT) "
1063C: 0E57  push    cs
1063D: 5731  push    di
1063E: 31C0  xor     ax, ax
10640: 509A  push    ax
10641: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10646: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
1064B: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10650: 833E  cmp     word ptr [0x1d6], 4 ; data:context
10655: 7503  jne     0x1065a
10657: E939  jmp     0x10493 ;
1065A: 5DCB  pop     bp
1065B: CB46  retf

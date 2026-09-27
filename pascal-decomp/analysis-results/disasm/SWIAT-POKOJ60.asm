; ===== PROC POKOJ60 @ img 118FE (block 117DF..11A8D) =====
;   str@img117DF: 'JESTES W DOLINIE ROZRYWEK DOLINA CIAGNIE SIE NA POLNOC, NA WSCHODZIE'
;   str@img11824: 'JEST SLYSZALNY JAKIS DZIWNY  HALAS , NA ZACHODZIE ZAS "LA LA LA LA" '
;   str@img11869: 'ZAWSZE MOZESZ WROCIC SIE IDAC NA POLODNIE ;)'
;   str@img11896: '%.'
;   str@img11899: 'MODE'
;   str@img1189E: 'EXIT'
;   str@img118A3: 'DOSTEPNE WYJSCIA:'
;   str@img118B5: 'POLODNIE-ULICA DLUGA'
;   str@img118CA: 'WSCHOD-BUDOWLA PELNA HALASU'
;   str@img118E6: 'WYJSCIE'
;   str@img118EE: 'POLODNIE'
;   str@img118F7: 'WSCHOD'
;   str@img1190B: '<'
;   str@img11911: '┐'
;   str@img1196D: 'Ö'
;   str@img11988: 'Ö'
;   str@img11A51: 'δ8'
;   str@img11A7F: '='
;   str@img11A85: '<'
;   str@img11A88: 'Θ┌■'

118FE: 5589  push    bp
118FF: 89E5  mov     bp, sp
11901: 31C0  xor     ax, ax
11903: 9ACD  lcall   0x1c71, 0x2cd ; ->para1C71:02CD
11908: 833E  cmp     word ptr [0x1d6], 0x3c ; data:context
1190D: 7403  je      0x11912
1190F: E97A  jmp     0x11a8c ;
11912: BFA2  mov     di, 0x7a2
11915: 1E57  push    ds
11916: 57BF  push    di
11917: BF0F  mov     di, 0x220f ; str:"JESTES W DOLINIE ROZRYWEK DOLINA CIAGNIE SIE NA POLNOC, NA WSCHODZIE"
1191A: 0E57  push    cs
1191B: 5731  push    di
1191C: 31C0  xor     ax, ax
1191E: 509A  push    ax
1191F: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
11924: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
11929: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
1192E: BFA2  mov     di, 0x7a2
11931: 1E57  push    ds
11932: 57BF  push    di
11933: BF54  mov     di, 0x2254 ; str:"JEST SLYSZALNY JAKIS DZIWNY  HALAS , NA ZACHODZIE ZAS "LA LA LA LA" "
11936: 0E57  push    cs
11937: 5731  push    di
11938: 31C0  xor     ax, ax
1193A: 509A  push    ax
1193B: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
11940: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
11945: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
1194A: BFA2  mov     di, 0x7a2
1194D: 1E57  push    ds
1194E: 57BF  push    di
1194F: BF99  mov     di, 0x2299 ; str:"ZAWSZE MOZESZ WROCIC SIE IDAC NA POLODNIE ;)"
11952: 0E57  push    cs
11953: 5731  push    di
11954: 31C0  xor     ax, ax
11956: 509A  push    ax
11957: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
1195C: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
11961: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11966: BFA2  mov     di, 0x7a2
11969: 1E57  push    ds
1196A: 57A1  push    di
1196B: A19C  mov     ax, word ptr [0x19c] ; data:Energy
1196E: 9952  cdq
1196F: 5250  push    dx
11970: 5031  push    ax
11971: 31C0  xor     ax, ax
11973: 509A  push    ax
11974: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
11979: BFC6  mov     di, 0x22c6 ; str:"%."
1197C: 0E57  push    cs
1197D: 5731  push    di
1197E: 31C0  xor     ax, ax
11980: 509A  push    ax
11981: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
11986: A1D4  mov     ax, word ptr [0x1d4] ; data:KUNSZT
11989: 9952  cdq
1198A: 5250  push    dx
1198B: 5031  push    ax
1198C: 31C0  xor     ax, ax
1198E: 509A  push    ax
1198F: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
11994: B03E  mov     al, 0x3e
11996: 5031  push    ax
11997: 31C0  xor     ax, ax
11999: 509A  push    ax
1199A: 9A7B  lcall   0x1c71, 0x67b ; ->para1C71:067B
1199F: 9AFE  lcall   0x1c71, 0x5fe ; ->para1C71:05FE
119A4: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
119A9: BFA2  mov     di, 0x6a2
119AC: 1E57  push    ds
119AD: 57BF  push    di
119AE: BF64  mov     di, 0x564
119B1: 1E57  push    ds
119B2: 57B8  push    di
119B3: B8FF  mov     ax, 0xff
119B6: 509A  push    ax
119B7: 9AC6  lcall   0x1c71, 0x6c6 ; ->para1C71:06C6
119BC: 9A9D  lcall   0x1c71, 0x59d ; ->para1C71:059D
119C1: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
119C6: BF64  mov     di, 0x564
119C9: 1E57  push    ds
119CA: 57BF  push    di
119CB: BFC9  mov     di, 0x22c9 ; str:"MODE"
119CE: 0E57  push    cs
119CF: 579A  push    di
119D0: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
119D5: 7505  jne     0x119dc
119D7: 9A14  lcall   0x129d, 0x3114 ; ->PRZEDM_MODE
119DC: BF64  mov     di, 0x564
119DF: 1E57  push    ds
119E0: 57BF  push    di
119E1: BFCE  mov     di, 0x22ce ; str:"EXIT"
119E4: 0E57  push    cs
119E5: 579A  push    di
119E6: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
119EB: 7554  jne     0x11a41
119ED: BFA2  mov     di, 0x7a2
119F0: 1E57  push    ds
119F1: 57BF  push    di
119F2: BFD3  mov     di, 0x22d3 ; str:"DOSTEPNE WYJSCIA:"
119F5: 0E57  push    cs
119F6: 5731  push    di
119F7: 31C0  xor     ax, ax
119F9: 509A  push    ax
119FA: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
119FF: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
11A04: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11A09: BFA2  mov     di, 0x7a2
11A0C: 1E57  push    ds
11A0D: 57BF  push    di
11A0E: BFE5  mov     di, 0x22e5 ; str:"POLODNIE-ULICA DLUGA"
11A11: 0E57  push    cs
11A12: 5731  push    di
11A13: 31C0  xor     ax, ax
11A15: 509A  push    ax
11A16: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
11A1B: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
11A20: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11A25: BFA2  mov     di, 0x7a2
11A28: 1E57  push    ds
11A29: 57BF  push    di
11A2A: BFFA  mov     di, 0x22fa ; str:"WSCHOD-BUDOWLA PELNA HALASU"
11A2D: 0E57  push    cs
11A2E: 5731  push    di
11A2F: 31C0  xor     ax, ax
11A31: 509A  push    ax
11A32: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
11A37: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
11A3C: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11A41: BF64  mov     di, 0x564
11A44: 1E57  push    ds
11A45: 57BF  push    di
11A46: BF16  mov     di, 0x2316 ; str:"WYJSCIE"
11A49: 0E57  push    cs
11A4A: 579A  push    di
11A4B: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
11A50: 7502  jne     0x11a54
11A52: EB38  jmp     0x11a8c ;
11A54: BF64  mov     di, 0x564
11A57: 1E57  push    ds
11A58: 57BF  push    di
11A59: BF1E  mov     di, 0x231e ; str:"POLODNIE"
11A5C: 0E57  push    cs
11A5D: 579A  push    di
11A5E: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
11A63: 7506  jne     0x11a6b
11A65: C706  mov     word ptr [0x1d6], 0x1f ; data:context
11A6B: BF64  mov     di, 0x564
11A6E: 1E57  push    ds
11A6F: 57BF  push    di
11A70: BF27  mov     di, 0x2327 ; str:"WSCHOD"
11A73: 0E57  push    cs
11A74: 579A  push    di
11A75: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
11A7A: 7506  jne     0x11a82
11A7C: C706  mov     word ptr [0x1d6], 0x3d ; data:context
11A82: 833E  cmp     word ptr [0x1d6], 0x3c ; data:context
11A87: 7503  jne     0x11a8c
11A89: E9DA  jmp     0x11966 ;
11A8C: 5DCB  pop     bp
11A8D: CB4B  retf

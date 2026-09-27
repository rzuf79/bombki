; ===== PROC POKOJ5 @ img 0F766 (block F5D0..FA04) =====
;   str@img0F5D0: 'SZOK!! AAA UPSI  O NIE FUJ ACH AJ OCH NEIN EEE UGH   '
;   str@img0F606: 'STWIERDZASZ ZE W TYM POKOJU JEST X POKOI O NIE !! JAK SIE WYDOSTAC?'
;   str@img0F64A: 'AHA (NA SCIANIE JEST PLAKAT)'
;   str@img0F667: '%.'
;   str@img0F66A: 'MODE'
;   str@img0F66F: 'EXIT'
;   str@img0F674: 'DOSTEPNE WYJSCIA:'
;   str@img0F686: 'WSCHOD-MUD SZKOLA'
;   str@img0F698: 'ZACHOD-POKOJ'
;   str@img0F6A5: 'POLNOC-POKOJ'
;   str@img0F6B2: 'POLODNIE-POKOJ'
;   str@img0F6C1: 'GORA-POKOJ'
;   str@img0F6CC: 'DOL-POKOJ'
;   str@img0F6D6: 'WYJSCIE'
;   str@img0F6DE: 'WSCHOD'
;   str@img0F6E5: 'ZACHOD'
;   str@img0F6EC: 'POLNOC'
;   str@img0F6F3: 'POLODNIE'
;   str@img0F6FC: 'GORA'
;   str@img0F701: 'DOL'
;   str@img0F705: 'PATRZ PLAKAT'
;   str@img0F712: 'NA PLAKACIE BYNAJMNIEJ PISZE'
;   str@img0F72F: 'TO JEST POKOJ DO ORIETACJI W TERENIE ORAZ W KIERUNKACH'
;   str@img0F7CB: 'Ö'
;   str@img0F7E6: 'Ö'
;   str@img0F9FF: 'Θ┴²'

0F766: 5589  push    bp
0F767: 89E5  mov     bp, sp
0F769: 31C0  xor     ax, ax
0F76B: 9ACD  lcall   0x1c71, 0x2cd ; ->para1C71:02CD
0F770: BFA2  mov     di, 0x7a2
0F773: 1E57  push    ds
0F774: 57BF  push    di
0F775: BF00  mov     di, 0 ; str:"SZOK!! AAA UPSI  O NIE FUJ ACH AJ OCH NEIN EEE UGH   "
0F778: 0E57  push    cs
0F779: 5731  push    di
0F77A: 31C0  xor     ax, ax
0F77C: 509A  push    ax
0F77D: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
0F782: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
0F787: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
0F78C: BFA2  mov     di, 0x7a2
0F78F: 1E57  push    ds
0F790: 57BF  push    di
0F791: BF36  mov     di, 0x36 ; str:"STWIERDZASZ ZE W TYM POKOJU JEST X POKOI O NIE !! JAK SIE WYDOSTAC?"
0F794: 0E57  push    cs
0F795: 5731  push    di
0F796: 31C0  xor     ax, ax
0F798: 509A  push    ax
0F799: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
0F79E: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
0F7A3: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
0F7A8: BFA2  mov     di, 0x7a2
0F7AB: 1E57  push    ds
0F7AC: 57BF  push    di
0F7AD: BF7A  mov     di, 0x7a ; str:"AHA (NA SCIANIE JEST PLAKAT)"
0F7B0: 0E57  push    cs
0F7B1: 5731  push    di
0F7B2: 31C0  xor     ax, ax
0F7B4: 509A  push    ax
0F7B5: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
0F7BA: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
0F7BF: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
0F7C4: BFA2  mov     di, 0x7a2
0F7C7: 1E57  push    ds
0F7C8: 57A1  push    di
0F7C9: A19C  mov     ax, word ptr [0x19c] ; data:Energy
0F7CC: 9952  cdq
0F7CD: 5250  push    dx
0F7CE: 5031  push    ax
0F7CF: 31C0  xor     ax, ax
0F7D1: 509A  push    ax
0F7D2: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
0F7D7: BF97  mov     di, 0x97 ; str:"%."
0F7DA: 0E57  push    cs
0F7DB: 5731  push    di
0F7DC: 31C0  xor     ax, ax
0F7DE: 509A  push    ax
0F7DF: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
0F7E4: A1D4  mov     ax, word ptr [0x1d4] ; data:KUNSZT
0F7E7: 9952  cdq
0F7E8: 5250  push    dx
0F7E9: 5031  push    ax
0F7EA: 31C0  xor     ax, ax
0F7EC: 509A  push    ax
0F7ED: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
0F7F2: B03E  mov     al, 0x3e
0F7F4: 5031  push    ax
0F7F5: 31C0  xor     ax, ax
0F7F7: 509A  push    ax
0F7F8: 9A7B  lcall   0x1c71, 0x67b ; ->para1C71:067B
0F7FD: 9AFE  lcall   0x1c71, 0x5fe ; ->para1C71:05FE
0F802: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
0F807: BFA2  mov     di, 0x6a2
0F80A: 1E57  push    ds
0F80B: 57BF  push    di
0F80C: BF64  mov     di, 0x564
0F80F: 1E57  push    ds
0F810: 57B8  push    di
0F811: B8FF  mov     ax, 0xff
0F814: 509A  push    ax
0F815: 9AC6  lcall   0x1c71, 0x6c6 ; ->para1C71:06C6
0F81A: 9A9D  lcall   0x1c71, 0x59d ; ->para1C71:059D
0F81F: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
0F824: BF64  mov     di, 0x564
0F827: 1E57  push    ds
0F828: 57BF  push    di
0F829: BF9A  mov     di, 0x9a ; str:"MODE"
0F82C: 0E57  push    cs
0F82D: 579A  push    di
0F82E: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
0F833: 7505  jne     0xf83a
0F835: 9A14  lcall   0x129d, 0x3114 ; ->PRZEDM_MODE
0F83A: BF64  mov     di, 0x564
0F83D: 1E57  push    ds
0F83E: 57BF  push    di
0F83F: BF9F  mov     di, 0x9f ; str:"EXIT"
0F842: 0E57  push    cs
0F843: 579A  push    di
0F844: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
0F849: 7403  je      0xf84e
0F84B: E9C4  jmp     0xf912 ;
0F84E: BFA2  mov     di, 0x7a2
0F851: 1E57  push    ds
0F852: 57BF  push    di
0F853: BFA4  mov     di, 0xa4 ; str:"DOSTEPNE WYJSCIA:"
0F856: 0E57  push    cs
0F857: 5731  push    di
0F858: 31C0  xor     ax, ax
0F85A: 509A  push    ax
0F85B: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
0F860: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
0F865: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
0F86A: BFA2  mov     di, 0x7a2
0F86D: 1E57  push    ds
0F86E: 57BF  push    di
0F86F: BFB6  mov     di, 0xb6 ; str:"WSCHOD-MUD SZKOLA"
0F872: 0E57  push    cs
0F873: 5731  push    di
0F874: 31C0  xor     ax, ax
0F876: 509A  push    ax
0F877: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
0F87C: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
0F881: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
0F886: BFA2  mov     di, 0x7a2
0F889: 1E57  push    ds
0F88A: 57BF  push    di
0F88B: BFC8  mov     di, 0xc8 ; str:"ZACHOD-POKOJ"
0F88E: 0E57  push    cs
0F88F: 5731  push    di
0F890: 31C0  xor     ax, ax
0F892: 509A  push    ax
0F893: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
0F898: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
0F89D: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
0F8A2: BFA2  mov     di, 0x7a2
0F8A5: 1E57  push    ds
0F8A6: 57BF  push    di
0F8A7: BFD5  mov     di, 0xd5 ; str:"POLNOC-POKOJ"
0F8AA: 0E57  push    cs
0F8AB: 5731  push    di
0F8AC: 31C0  xor     ax, ax
0F8AE: 509A  push    ax
0F8AF: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
0F8B4: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
0F8B9: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
0F8BE: BFA2  mov     di, 0x7a2
0F8C1: 1E57  push    ds
0F8C2: 57BF  push    di
0F8C3: BFE2  mov     di, 0xe2 ; str:"POLODNIE-POKOJ"
0F8C6: 0E57  push    cs
0F8C7: 5731  push    di
0F8C8: 31C0  xor     ax, ax
0F8CA: 509A  push    ax
0F8CB: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
0F8D0: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
0F8D5: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
0F8DA: BFA2  mov     di, 0x7a2
0F8DD: 1E57  push    ds
0F8DE: 57BF  push    di
0F8DF: BFF1  mov     di, 0xf1 ; str:"GORA-POKOJ"
0F8E2: 0E57  push    cs
0F8E3: 5731  push    di
0F8E4: 31C0  xor     ax, ax
0F8E6: 509A  push    ax
0F8E7: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
0F8EC: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
0F8F1: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
0F8F6: BFA2  mov     di, 0x7a2
0F8F9: 1E57  push    ds
0F8FA: 57BF  push    di
0F8FB: BFFC  mov     di, 0xfc ; str:"DOL-POKOJ"
0F8FE: 0E57  push    cs
0F8FF: 5731  push    di
0F900: 31C0  xor     ax, ax
0F902: 509A  push    ax
0F903: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
0F908: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
0F90D: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
0F912: BF64  mov     di, 0x564
0F915: 1E57  push    ds
0F916: 57BF  push    di
0F917: BF06  mov     di, 0x106 ; str:"WYJSCIE"
0F91A: 0E57  push    cs
0F91B: 579A  push    di
0F91C: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
0F921: 7503  jne     0xf926
0F923: E9DD  jmp     0xfa03 ;
0F926: BF64  mov     di, 0x564
0F929: 1E57  push    ds
0F92A: 57BF  push    di
0F92B: BF0E  mov     di, 0x10e ; str:"WSCHOD"
0F92E: 0E57  push    cs
0F92F: 579A  push    di
0F930: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
0F935: 7506  jne     0xf93d
0F937: C706  mov     word ptr [0x1d6], 4 ; data:context
0F93D: BF64  mov     di, 0x564
0F940: 1E57  push    ds
0F941: 57BF  push    di
0F942: BF15  mov     di, 0x115 ; str:"ZACHOD"
0F945: 0E57  push    cs
0F946: 579A  push    di
0F947: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
0F94C: 7506  jne     0xf954
0F94E: C706  mov     word ptr [0x1d6], 6 ; data:context
0F954: BF64  mov     di, 0x564
0F957: 1E57  push    ds
0F958: 57BF  push    di
0F959: BF1C  mov     di, 0x11c ; str:"POLNOC"
0F95C: 0E57  push    cs
0F95D: 579A  push    di
0F95E: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
0F963: 7506  jne     0xf96b
0F965: C706  mov     word ptr [0x1d6], 7 ; data:context
0F96B: BF64  mov     di, 0x564
0F96E: 1E57  push    ds
0F96F: 57BF  push    di
0F970: BF23  mov     di, 0x123 ; str:"POLODNIE"
0F973: 0E57  push    cs
0F974: 579A  push    di
0F975: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
0F97A: 7506  jne     0xf982
0F97C: C706  mov     word ptr [0x1d6], 8 ; data:context
0F982: BF64  mov     di, 0x564
0F985: 1E57  push    ds
0F986: 57BF  push    di
0F987: BF2C  mov     di, 0x12c ; str:"GORA"
0F98A: 0E57  push    cs
0F98B: 579A  push    di
0F98C: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
0F991: 7506  jne     0xf999
0F993: C706  mov     word ptr [0x1d6], 9 ; data:context
0F999: BF64  mov     di, 0x564
0F99C: 1E57  push    ds
0F99D: 57BF  push    di
0F99E: BF31  mov     di, 0x131 ; str:"DOL"
0F9A1: 0E57  push    cs
0F9A2: 579A  push    di
0F9A3: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
0F9A8: 7506  jne     0xf9b0
0F9AA: C706  mov     word ptr [0x1d6], 0xa ; data:context
0F9B0: BF64  mov     di, 0x564
0F9B3: 1E57  push    ds
0F9B4: 57BF  push    di
0F9B5: BF35  mov     di, 0x135 ; str:"PATRZ PLAKAT"
0F9B8: 0E57  push    cs
0F9B9: 579A  push    di
0F9BA: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
0F9BF: 7538  jne     0xf9f9
0F9C1: BFA2  mov     di, 0x7a2
0F9C4: 1E57  push    ds
0F9C5: 57BF  push    di
0F9C6: BF42  mov     di, 0x142 ; str:"NA PLAKACIE BYNAJMNIEJ PISZE"
0F9C9: 0E57  push    cs
0F9CA: 5731  push    di
0F9CB: 31C0  xor     ax, ax
0F9CD: 509A  push    ax
0F9CE: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
0F9D3: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
0F9D8: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
0F9DD: BFA2  mov     di, 0x7a2
0F9E0: 1E57  push    ds
0F9E1: 57BF  push    di
0F9E2: BF5F  mov     di, 0x15f ; str:"TO JEST POKOJ DO ORIETACJI W TERENIE ORAZ W KIERUNKACH"
0F9E5: 0E57  push    cs
0F9E6: 5731  push    di
0F9E7: 31C0  xor     ax, ax
0F9E9: 509A  push    ax
0F9EA: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
0F9EF: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
0F9F4: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
0F9F9: 833E  cmp     word ptr [0x1d6], 5 ; data:context
0F9FE: 7503  jne     0xfa03
0FA00: E9C1  jmp     0xf7c4 ;
0FA03: 5DCB  pop     bp
0FA04: CB12  retf

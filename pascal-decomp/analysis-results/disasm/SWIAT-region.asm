; SWIAT unit code region decode — EXE img 0x0F5D0..0x129C6
; source: BOMBKI.EXE final build; TPU matches through img 0x129B8 (mod reloc slots)

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

; ===== PROC POKOJ0 @ img 0FA5F (block FA05..FB47) =====
;   str@img0FA05: 'TU ZACZYNA SIE GRE'
;   str@img0FA18: '%.'
;   str@img0FA1B: 'EXIT'
;   str@img0FA20: 'DOSTEPNE WYJSCIE-POLNOC-HALA GLOWNA MUD SZKOLE '
;   str@img0FA50: 'WYJSCIE'
;   str@img0FA58: 'POLNOC'
;   str@img0FA8C: 'Ö'
;   str@img0FAA7: 'Ö'
;   str@img0FB22: 'δ!'
;   str@img0FB42: 'Θ? '

0FA5F: 5589  push    bp
0FA60: 89E5  mov     bp, sp
0FA62: 31C0  xor     ax, ax
0FA64: 9ACD  lcall   0x1c71, 0x2cd ; ->para1C71:02CD
0FA69: BFA2  mov     di, 0x7a2
0FA6C: 1E57  push    ds
0FA6D: 57BF  push    di
0FA6E: BF35  mov     di, 0x435 ; str:"TU ZACZYNA SIE GRE"
0FA71: 0E57  push    cs
0FA72: 5731  push    di
0FA73: 31C0  xor     ax, ax
0FA75: 509A  push    ax
0FA76: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
0FA7B: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
0FA80: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
0FA85: BFA2  mov     di, 0x7a2
0FA88: 1E57  push    ds
0FA89: 57A1  push    di
0FA8A: A19C  mov     ax, word ptr [0x19c] ; data:Energy
0FA8D: 9952  cdq
0FA8E: 5250  push    dx
0FA8F: 5031  push    ax
0FA90: 31C0  xor     ax, ax
0FA92: 509A  push    ax
0FA93: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
0FA98: BF48  mov     di, 0x448 ; str:"%."
0FA9B: 0E57  push    cs
0FA9C: 5731  push    di
0FA9D: 31C0  xor     ax, ax
0FA9F: 509A  push    ax
0FAA0: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
0FAA5: A1D4  mov     ax, word ptr [0x1d4] ; data:KUNSZT
0FAA8: 9952  cdq
0FAA9: 5250  push    dx
0FAAA: 5031  push    ax
0FAAB: 31C0  xor     ax, ax
0FAAD: 509A  push    ax
0FAAE: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
0FAB3: B03E  mov     al, 0x3e
0FAB5: 5031  push    ax
0FAB6: 31C0  xor     ax, ax
0FAB8: 509A  push    ax
0FAB9: 9A7B  lcall   0x1c71, 0x67b ; ->para1C71:067B
0FABE: 9AFE  lcall   0x1c71, 0x5fe ; ->para1C71:05FE
0FAC3: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
0FAC8: BFA2  mov     di, 0x6a2
0FACB: 1E57  push    ds
0FACC: 57BF  push    di
0FACD: BF64  mov     di, 0x564
0FAD0: 1E57  push    ds
0FAD1: 57B8  push    di
0FAD2: B8FF  mov     ax, 0xff
0FAD5: 509A  push    ax
0FAD6: 9AC6  lcall   0x1c71, 0x6c6 ; ->para1C71:06C6
0FADB: 9A9D  lcall   0x1c71, 0x59d ; ->para1C71:059D
0FAE0: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
0FAE5: BF64  mov     di, 0x564
0FAE8: 1E57  push    ds
0FAE9: 57BF  push    di
0FAEA: BF4B  mov     di, 0x44b ; str:"EXIT"
0FAED: 0E57  push    cs
0FAEE: 579A  push    di
0FAEF: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
0FAF4: 751C  jne     0xfb12
0FAF6: BFA2  mov     di, 0x7a2
0FAF9: 1E57  push    ds
0FAFA: 57BF  push    di
0FAFB: BF50  mov     di, 0x450 ; str:"DOSTEPNE WYJSCIE-POLNOC-HALA GLOWNA MUD SZKOLE "
0FAFE: 0E57  push    cs
0FAFF: 5731  push    di
0FB00: 31C0  xor     ax, ax
0FB02: 509A  push    ax
0FB03: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
0FB08: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
0FB0D: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
0FB12: BF64  mov     di, 0x564
0FB15: 1E57  push    ds
0FB16: 57BF  push    di
0FB17: BF80  mov     di, 0x480 ; str:"WYJSCIE"
0FB1A: 0E57  push    cs
0FB1B: 579A  push    di
0FB1C: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
0FB21: 7502  jne     0xfb25
0FB23: EB21  jmp     0xfb46 ;
0FB25: BF64  mov     di, 0x564
0FB28: 1E57  push    ds
0FB29: 57BF  push    di
0FB2A: BF88  mov     di, 0x488 ; str:"POLNOC"
0FB2D: 0E57  push    cs
0FB2E: 579A  push    di
0FB2F: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
0FB34: 7506  jne     0xfb3c
0FB36: C706  mov     word ptr [0x1d6], 1 ; data:context
0FB3C: 833E  cmp     word ptr [0x1d6], 0 ; data:context
0FB41: 7503  jne     0xfb46
0FB43: E93F  jmp     0xfa85 ;
0FB46: 5DCB  pop     bp
0FB47: CB30  retf

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

; ===== PROC POKOJE @ img 10B8D (block 10AC4..10FFF) =====
;   str@img10AC4: 'JESTES W DOSYC CIASNYM POKOJU I NICZEGO TU NIEMA '
;   str@img10AF6: '%.'
;   str@img10AF9: 'MODE'
;   str@img10AFE: 'EXIT'
;   str@img10B03: 'DOSTEPNE WYJSCIA:'
;   str@img10B15: 'WSCHOD-MUD SZKOLA(2)'
;   str@img10B2A: 'WYJSCIE'
;   str@img10B32: 'WSCHOD'
;   str@img10B39: 'POLNOC-MUD SZKOLA(2)'
;   str@img10B4E: 'POLNOC'
;   str@img10B55: 'POLODNIE-MUD SZKOLA(2)'
;   str@img10B6C: 'POLODNIE'
;   str@img10B75: 'GORA-MUD SZKOLA(2)'
;   str@img10B88: 'GORA'
;   str@img10BA0: '┐'
;   str@img10BC4: 'Ö'
;   str@img10BDF: 'Ö'
;   str@img10CBA: '┐'
;   str@img10CDE: 'Ö'
;   str@img10CF9: 'Ö'
;   str@img10DA9: '┐d'
;   str@img10DD4: '┐'
;   str@img10DF8: 'Ö'
;   str@img10E13: 'Ö'
;   str@img10EC3: '┐'
;   str@img10EEE: '┐'
;   str@img10F12: 'Ö'
;   str@img10F2D: 'Ö'
;   str@img10FDA: 'δ!'
;   str@img10FFC: ' ]╦%JESTES W '

10B8D: 5589  push    bp
10B8E: 89E5  mov     bp, sp
10B90: 31C0  xor     ax, ax
10B92: 9ACD  lcall   0x1c71, 0x2cd ; ->para1C71:02CD
10B97: 833E  cmp     word ptr [0x1d6], 6 ; data:context
10B9C: 7403  je      0x10ba1
10B9E: E910  jmp     0x10cb1 ;
10BA1: BFA2  mov     di, 0x7a2
10BA4: 1E57  push    ds
10BA5: 57BF  push    di
10BA6: BFF4  mov     di, 0x14f4 ; str:"JESTES W DOSYC CIASNYM POKOJU I NICZEGO TU NIEMA "
10BA9: 0E57  push    cs
10BAA: 5731  push    di
10BAB: 31C0  xor     ax, ax
10BAD: 509A  push    ax
10BAE: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10BB3: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10BB8: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10BBD: BFA2  mov     di, 0x7a2
10BC0: 1E57  push    ds
10BC1: 57A1  push    di
10BC2: A19C  mov     ax, word ptr [0x19c] ; data:Energy
10BC5: 9952  cdq
10BC6: 5250  push    dx
10BC7: 5031  push    ax
10BC8: 31C0  xor     ax, ax
10BCA: 509A  push    ax
10BCB: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
10BD0: BF26  mov     di, 0x1526 ; str:"%."
10BD3: 0E57  push    cs
10BD4: 5731  push    di
10BD5: 31C0  xor     ax, ax
10BD7: 509A  push    ax
10BD8: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10BDD: A1D4  mov     ax, word ptr [0x1d4] ; data:KUNSZT
10BE0: 9952  cdq
10BE1: 5250  push    dx
10BE2: 5031  push    ax
10BE3: 31C0  xor     ax, ax
10BE5: 509A  push    ax
10BE6: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
10BEB: B03E  mov     al, 0x3e
10BED: 5031  push    ax
10BEE: 31C0  xor     ax, ax
10BF0: 509A  push    ax
10BF1: 9A7B  lcall   0x1c71, 0x67b ; ->para1C71:067B
10BF6: 9AFE  lcall   0x1c71, 0x5fe ; ->para1C71:05FE
10BFB: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10C00: BFA2  mov     di, 0x6a2
10C03: 1E57  push    ds
10C04: 57BF  push    di
10C05: BF64  mov     di, 0x564
10C08: 1E57  push    ds
10C09: 57B8  push    di
10C0A: B8FF  mov     ax, 0xff
10C0D: 509A  push    ax
10C0E: 9AC6  lcall   0x1c71, 0x6c6 ; ->para1C71:06C6
10C13: 9A9D  lcall   0x1c71, 0x59d ; ->para1C71:059D
10C18: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10C1D: BF64  mov     di, 0x564
10C20: 1E57  push    ds
10C21: 57BF  push    di
10C22: BF29  mov     di, 0x1529 ; str:"MODE"
10C25: 0E57  push    cs
10C26: 579A  push    di
10C27: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
10C2C: 7505  jne     0x10c33
10C2E: 9A14  lcall   0x129d, 0x3114 ; ->PRZEDM_MODE
10C33: BF64  mov     di, 0x564
10C36: 1E57  push    ds
10C37: 57BF  push    di
10C38: BF2E  mov     di, 0x152e ; str:"EXIT"
10C3B: 0E57  push    cs
10C3C: 579A  push    di
10C3D: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
10C42: 7538  jne     0x10c7c
10C44: BFA2  mov     di, 0x7a2
10C47: 1E57  push    ds
10C48: 57BF  push    di
10C49: BF33  mov     di, 0x1533 ; str:"DOSTEPNE WYJSCIA:"
10C4C: 0E57  push    cs
10C4D: 5731  push    di
10C4E: 31C0  xor     ax, ax
10C50: 509A  push    ax
10C51: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10C56: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10C5B: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10C60: BFA2  mov     di, 0x7a2
10C63: 1E57  push    ds
10C64: 57BF  push    di
10C65: BF45  mov     di, 0x1545 ; str:"WSCHOD-MUD SZKOLA(2)"
10C68: 0E57  push    cs
10C69: 5731  push    di
10C6A: 31C0  xor     ax, ax
10C6C: 509A  push    ax
10C6D: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10C72: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10C77: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10C7C: BF64  mov     di, 0x564
10C7F: 1E57  push    ds
10C80: 57BF  push    di
10C81: BF5A  mov     di, 0x155a ; str:"WYJSCIE"
10C84: 0E57  push    cs
10C85: 579A  push    di
10C86: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
10C8B: 7503  jne     0x10c90
10C8D: E96E  jmp     0x10ffe ;
10C90: BF64  mov     di, 0x564
10C93: 1E57  push    ds
10C94: 57BF  push    di
10C95: BF62  mov     di, 0x1562 ; str:"WSCHOD"
10C98: 0E57  push    cs
10C99: 579A  push    di
10C9A: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
10C9F: 7506  jne     0x10ca7
10CA1: C706  mov     word ptr [0x1d6], 5 ; data:context
10CA7: 833E  cmp     word ptr [0x1d6], 6 ; data:context
10CAC: 7503  jne     0x10cb1
10CAE: E90C  jmp     0x10bbd ;
10CB1: 833E  cmp     word ptr [0x1d6], 8 ; data:context
10CB6: 7403  je      0x10cbb
10CB8: E910  jmp     0x10dcb ;
10CBB: BFA2  mov     di, 0x7a2
10CBE: 1E57  push    ds
10CBF: 57BF  push    di
10CC0: BFF4  mov     di, 0x14f4 ; str:"JESTES W DOSYC CIASNYM POKOJU I NICZEGO TU NIEMA "
10CC3: 0E57  push    cs
10CC4: 5731  push    di
10CC5: 31C0  xor     ax, ax
10CC7: 509A  push    ax
10CC8: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10CCD: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10CD2: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10CD7: BFA2  mov     di, 0x7a2
10CDA: 1E57  push    ds
10CDB: 57A1  push    di
10CDC: A19C  mov     ax, word ptr [0x19c] ; data:Energy
10CDF: 9952  cdq
10CE0: 5250  push    dx
10CE1: 5031  push    ax
10CE2: 31C0  xor     ax, ax
10CE4: 509A  push    ax
10CE5: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
10CEA: BF26  mov     di, 0x1526 ; str:"%."
10CED: 0E57  push    cs
10CEE: 5731  push    di
10CEF: 31C0  xor     ax, ax
10CF1: 509A  push    ax
10CF2: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10CF7: A1D4  mov     ax, word ptr [0x1d4] ; data:KUNSZT
10CFA: 9952  cdq
10CFB: 5250  push    dx
10CFC: 5031  push    ax
10CFD: 31C0  xor     ax, ax
10CFF: 509A  push    ax
10D00: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
10D05: B03E  mov     al, 0x3e
10D07: 5031  push    ax
10D08: 31C0  xor     ax, ax
10D0A: 509A  push    ax
10D0B: 9A7B  lcall   0x1c71, 0x67b ; ->para1C71:067B
10D10: 9AFE  lcall   0x1c71, 0x5fe ; ->para1C71:05FE
10D15: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10D1A: BFA2  mov     di, 0x6a2
10D1D: 1E57  push    ds
10D1E: 57BF  push    di
10D1F: BF64  mov     di, 0x564
10D22: 1E57  push    ds
10D23: 57B8  push    di
10D24: B8FF  mov     ax, 0xff
10D27: 509A  push    ax
10D28: 9AC6  lcall   0x1c71, 0x6c6 ; ->para1C71:06C6
10D2D: 9A9D  lcall   0x1c71, 0x59d ; ->para1C71:059D
10D32: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10D37: BF64  mov     di, 0x564
10D3A: 1E57  push    ds
10D3B: 57BF  push    di
10D3C: BF29  mov     di, 0x1529 ; str:"MODE"
10D3F: 0E57  push    cs
10D40: 579A  push    di
10D41: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
10D46: 7505  jne     0x10d4d
10D48: 9A14  lcall   0x129d, 0x3114 ; ->PRZEDM_MODE
10D4D: BF64  mov     di, 0x564
10D50: 1E57  push    ds
10D51: 57BF  push    di
10D52: BF2E  mov     di, 0x152e ; str:"EXIT"
10D55: 0E57  push    cs
10D56: 579A  push    di
10D57: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
10D5C: 7538  jne     0x10d96
10D5E: BFA2  mov     di, 0x7a2
10D61: 1E57  push    ds
10D62: 57BF  push    di
10D63: BF33  mov     di, 0x1533 ; str:"DOSTEPNE WYJSCIA:"
10D66: 0E57  push    cs
10D67: 5731  push    di
10D68: 31C0  xor     ax, ax
10D6A: 509A  push    ax
10D6B: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10D70: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10D75: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10D7A: BFA2  mov     di, 0x7a2
10D7D: 1E57  push    ds
10D7E: 57BF  push    di
10D7F: BF69  mov     di, 0x1569 ; str:"POLNOC-MUD SZKOLA(2)"
10D82: 0E57  push    cs
10D83: 5731  push    di
10D84: 31C0  xor     ax, ax
10D86: 509A  push    ax
10D87: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10D8C: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10D91: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10D96: BF64  mov     di, 0x564
10D99: 1E57  push    ds
10D9A: 57BF  push    di
10D9B: BF5A  mov     di, 0x155a ; str:"WYJSCIE"
10D9E: 0E57  push    cs
10D9F: 579A  push    di
10DA0: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
10DA5: 7503  jne     0x10daa
10DA7: E954  jmp     0x10ffe ;
10DAA: BF64  mov     di, 0x564
10DAD: 1E57  push    ds
10DAE: 57BF  push    di
10DAF: BF7E  mov     di, 0x157e ; str:"POLNOC"
10DB2: 0E57  push    cs
10DB3: 579A  push    di
10DB4: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
10DB9: 7506  jne     0x10dc1
10DBB: C706  mov     word ptr [0x1d6], 5 ; data:context
10DC1: 833E  cmp     word ptr [0x1d6], 8 ; data:context
10DC6: 7503  jne     0x10dcb
10DC8: E90C  jmp     0x10cd7 ;
10DCB: 833E  cmp     word ptr [0x1d6], 7 ; data:context
10DD0: 7403  je      0x10dd5
10DD2: E910  jmp     0x10ee5 ;
10DD5: BFA2  mov     di, 0x7a2
10DD8: 1E57  push    ds
10DD9: 57BF  push    di
10DDA: BFF4  mov     di, 0x14f4 ; str:"JESTES W DOSYC CIASNYM POKOJU I NICZEGO TU NIEMA "
10DDD: 0E57  push    cs
10DDE: 5731  push    di
10DDF: 31C0  xor     ax, ax
10DE1: 509A  push    ax
10DE2: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10DE7: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10DEC: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10DF1: BFA2  mov     di, 0x7a2
10DF4: 1E57  push    ds
10DF5: 57A1  push    di
10DF6: A19C  mov     ax, word ptr [0x19c] ; data:Energy
10DF9: 9952  cdq
10DFA: 5250  push    dx
10DFB: 5031  push    ax
10DFC: 31C0  xor     ax, ax
10DFE: 509A  push    ax
10DFF: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
10E04: BF26  mov     di, 0x1526 ; str:"%."
10E07: 0E57  push    cs
10E08: 5731  push    di
10E09: 31C0  xor     ax, ax
10E0B: 509A  push    ax
10E0C: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10E11: A1D4  mov     ax, word ptr [0x1d4] ; data:KUNSZT
10E14: 9952  cdq
10E15: 5250  push    dx
10E16: 5031  push    ax
10E17: 31C0  xor     ax, ax
10E19: 509A  push    ax
10E1A: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
10E1F: B03E  mov     al, 0x3e
10E21: 5031  push    ax
10E22: 31C0  xor     ax, ax
10E24: 509A  push    ax
10E25: 9A7B  lcall   0x1c71, 0x67b ; ->para1C71:067B
10E2A: 9AFE  lcall   0x1c71, 0x5fe ; ->para1C71:05FE
10E2F: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10E34: BFA2  mov     di, 0x6a2
10E37: 1E57  push    ds
10E38: 57BF  push    di
10E39: BF64  mov     di, 0x564
10E3C: 1E57  push    ds
10E3D: 57B8  push    di
10E3E: B8FF  mov     ax, 0xff
10E41: 509A  push    ax
10E42: 9AC6  lcall   0x1c71, 0x6c6 ; ->para1C71:06C6
10E47: 9A9D  lcall   0x1c71, 0x59d ; ->para1C71:059D
10E4C: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10E51: BF64  mov     di, 0x564
10E54: 1E57  push    ds
10E55: 57BF  push    di
10E56: BF29  mov     di, 0x1529 ; str:"MODE"
10E59: 0E57  push    cs
10E5A: 579A  push    di
10E5B: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
10E60: 7505  jne     0x10e67
10E62: 9A14  lcall   0x129d, 0x3114 ; ->PRZEDM_MODE
10E67: BF64  mov     di, 0x564
10E6A: 1E57  push    ds
10E6B: 57BF  push    di
10E6C: BF2E  mov     di, 0x152e ; str:"EXIT"
10E6F: 0E57  push    cs
10E70: 579A  push    di
10E71: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
10E76: 7538  jne     0x10eb0
10E78: BFA2  mov     di, 0x7a2
10E7B: 1E57  push    ds
10E7C: 57BF  push    di
10E7D: BF33  mov     di, 0x1533 ; str:"DOSTEPNE WYJSCIA:"
10E80: 0E57  push    cs
10E81: 5731  push    di
10E82: 31C0  xor     ax, ax
10E84: 509A  push    ax
10E85: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10E8A: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10E8F: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10E94: BFA2  mov     di, 0x7a2
10E97: 1E57  push    ds
10E98: 57BF  push    di
10E99: BF85  mov     di, 0x1585 ; str:"POLODNIE-MUD SZKOLA(2)"
10E9C: 0E57  push    cs
10E9D: 5731  push    di
10E9E: 31C0  xor     ax, ax
10EA0: 509A  push    ax
10EA1: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10EA6: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10EAB: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10EB0: BF64  mov     di, 0x564
10EB3: 1E57  push    ds
10EB4: 57BF  push    di
10EB5: BF5A  mov     di, 0x155a ; str:"WYJSCIE"
10EB8: 0E57  push    cs
10EB9: 579A  push    di
10EBA: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
10EBF: 7503  jne     0x10ec4
10EC1: E93A  jmp     0x10ffe ;
10EC4: BF64  mov     di, 0x564
10EC7: 1E57  push    ds
10EC8: 57BF  push    di
10EC9: BF9C  mov     di, 0x159c ; str:"POLODNIE"
10ECC: 0E57  push    cs
10ECD: 579A  push    di
10ECE: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
10ED3: 7506  jne     0x10edb
10ED5: C706  mov     word ptr [0x1d6], 5 ; data:context
10EDB: 833E  cmp     word ptr [0x1d6], 7 ; data:context
10EE0: 7503  jne     0x10ee5
10EE2: E90C  jmp     0x10df1 ;
10EE5: 833E  cmp     word ptr [0x1d6], 0xa ; data:context
10EEA: 7403  je      0x10eef
10EEC: E90F  jmp     0x10ffe ;
10EEF: BFA2  mov     di, 0x7a2
10EF2: 1E57  push    ds
10EF3: 57BF  push    di
10EF4: BFF4  mov     di, 0x14f4 ; str:"JESTES W DOSYC CIASNYM POKOJU I NICZEGO TU NIEMA "
10EF7: 0E57  push    cs
10EF8: 5731  push    di
10EF9: 31C0  xor     ax, ax
10EFB: 509A  push    ax
10EFC: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10F01: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10F06: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10F0B: BFA2  mov     di, 0x7a2
10F0E: 1E57  push    ds
10F0F: 57A1  push    di
10F10: A19C  mov     ax, word ptr [0x19c] ; data:Energy
10F13: 9952  cdq
10F14: 5250  push    dx
10F15: 5031  push    ax
10F16: 31C0  xor     ax, ax
10F18: 509A  push    ax
10F19: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
10F1E: BF26  mov     di, 0x1526 ; str:"%."
10F21: 0E57  push    cs
10F22: 5731  push    di
10F23: 31C0  xor     ax, ax
10F25: 509A  push    ax
10F26: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10F2B: A1D4  mov     ax, word ptr [0x1d4] ; data:KUNSZT
10F2E: 9952  cdq
10F2F: 5250  push    dx
10F30: 5031  push    ax
10F31: 31C0  xor     ax, ax
10F33: 509A  push    ax
10F34: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
10F39: B03E  mov     al, 0x3e
10F3B: 5031  push    ax
10F3C: 31C0  xor     ax, ax
10F3E: 509A  push    ax
10F3F: 9A7B  lcall   0x1c71, 0x67b ; ->para1C71:067B
10F44: 9AFE  lcall   0x1c71, 0x5fe ; ->para1C71:05FE
10F49: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10F4E: BFA2  mov     di, 0x6a2
10F51: 1E57  push    ds
10F52: 57BF  push    di
10F53: BF64  mov     di, 0x564
10F56: 1E57  push    ds
10F57: 57B8  push    di
10F58: B8FF  mov     ax, 0xff
10F5B: 509A  push    ax
10F5C: 9AC6  lcall   0x1c71, 0x6c6 ; ->para1C71:06C6
10F61: 9A9D  lcall   0x1c71, 0x59d ; ->para1C71:059D
10F66: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10F6B: BF64  mov     di, 0x564
10F6E: 1E57  push    ds
10F6F: 57BF  push    di
10F70: BF29  mov     di, 0x1529 ; str:"MODE"
10F73: 0E57  push    cs
10F74: 579A  push    di
10F75: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
10F7A: 7505  jne     0x10f81
10F7C: 9A14  lcall   0x129d, 0x3114 ; ->PRZEDM_MODE
10F81: BF64  mov     di, 0x564
10F84: 1E57  push    ds
10F85: 57BF  push    di
10F86: BF2E  mov     di, 0x152e ; str:"EXIT"
10F89: 0E57  push    cs
10F8A: 579A  push    di
10F8B: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
10F90: 7538  jne     0x10fca
10F92: BFA2  mov     di, 0x7a2
10F95: 1E57  push    ds
10F96: 57BF  push    di
10F97: BF33  mov     di, 0x1533 ; str:"DOSTEPNE WYJSCIA:"
10F9A: 0E57  push    cs
10F9B: 5731  push    di
10F9C: 31C0  xor     ax, ax
10F9E: 509A  push    ax
10F9F: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10FA4: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10FA9: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10FAE: BFA2  mov     di, 0x7a2
10FB1: 1E57  push    ds
10FB2: 57BF  push    di
10FB3: BFA5  mov     di, 0x15a5 ; str:"GORA-MUD SZKOLA(2)"
10FB6: 0E57  push    cs
10FB7: 5731  push    di
10FB8: 31C0  xor     ax, ax
10FBA: 509A  push    ax
10FBB: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
10FC0: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
10FC5: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
10FCA: BF64  mov     di, 0x564
10FCD: 1E57  push    ds
10FCE: 57BF  push    di
10FCF: BF5A  mov     di, 0x155a ; str:"WYJSCIE"
10FD2: 0E57  push    cs
10FD3: 579A  push    di
10FD4: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
10FD9: 7502  jne     0x10fdd
10FDB: EB21  jmp     0x10ffe ;
10FDD: BF64  mov     di, 0x564
10FE0: 1E57  push    ds
10FE1: 57BF  push    di
10FE2: BFB8  mov     di, 0x15b8 ; str:"GORA"
10FE5: 0E57  push    cs
10FE6: 579A  push    di
10FE7: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
10FEC: 7506  jne     0x10ff4
10FEE: C706  mov     word ptr [0x1d6], 5 ; data:context
10FF4: 833E  cmp     word ptr [0x1d6], 0xa ; data:context
10FF9: 7503  jne     0x10ffe
10FFB: E90D  jmp     0x10f0b ;
10FFE: 5DCB  pop     bp
10FFF: CB25  retf

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

; ===== PROC POKOJ30 @ img 11638 (block 11547..117DE) =====
;   str@img11547: 'ULICA DLUGA CIAGNIE SIE W NIESKONCZONOSC,SORKI'
;   str@img11576: 'NA POLNOCY ZNAJDUJESZ OGROMNA BUDOWLE=TO ARENA PRZEZNACZONA DO WALKI'
;   str@img115BB: '%.'
;   str@img115BE: 'MODE'
;   str@img115C3: 'EXIT'
;   str@img115C8: 'DOSTEPNE WYJSCIA:'
;   str@img115DA: 'WSCHOD-CENTRUM MIASTA'
;   str@img115F0: 'ZACHOD-ULICA DLUGA'
;   str@img11603: 'POLNOC-WEJSCIE NA ARENE'
;   str@img1161B: 'WYJSCIE'
;   str@img11623: 'WSCHOD'
;   str@img1162A: 'ZACHOD'
;   str@img11631: 'POLNOC'
;   str@img1164B: '┐'
;   str@img1168B: 'Ö'
;   str@img116A6: 'Ö'
;   str@img1178B: 'δO'
;   str@img117D0: ' '
;   str@img117D9: 'Θº■'

11638: 5589  push    bp
11639: 89E5  mov     bp, sp
1163B: 31C0  xor     ax, ax
1163D: 9ACD  lcall   0x1c71, 0x2cd ; ->para1C71:02CD
11642: 833E  cmp     word ptr [0x1d6], 0x1e ; data:context
11647: 7403  je      0x1164c
11649: E991  jmp     0x117dd ;
1164C: BFA2  mov     di, 0x7a2
1164F: 1E57  push    ds
11650: 57BF  push    di
11651: BF77  mov     di, 0x1f77 ; str:"ULICA DLUGA CIAGNIE SIE W NIESKONCZONOSC,SORKI"
11654: 0E57  push    cs
11655: 5731  push    di
11656: 31C0  xor     ax, ax
11658: 509A  push    ax
11659: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
1165E: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
11663: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11668: BFA2  mov     di, 0x7a2
1166B: 1E57  push    ds
1166C: 57BF  push    di
1166D: BFA6  mov     di, 0x1fa6 ; str:"NA POLNOCY ZNAJDUJESZ OGROMNA BUDOWLE=TO ARENA PRZEZNACZONA DO WALKI"
11670: 0E57  push    cs
11671: 5731  push    di
11672: 31C0  xor     ax, ax
11674: 509A  push    ax
11675: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
1167A: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
1167F: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11684: BFA2  mov     di, 0x7a2
11687: 1E57  push    ds
11688: 57A1  push    di
11689: A19C  mov     ax, word ptr [0x19c] ; data:Energy
1168C: 9952  cdq
1168D: 5250  push    dx
1168E: 5031  push    ax
1168F: 31C0  xor     ax, ax
11691: 509A  push    ax
11692: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
11697: BFEB  mov     di, 0x1feb ; str:"%."
1169A: 0E57  push    cs
1169B: 5731  push    di
1169C: 31C0  xor     ax, ax
1169E: 509A  push    ax
1169F: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
116A4: A1D4  mov     ax, word ptr [0x1d4] ; data:KUNSZT
116A7: 9952  cdq
116A8: 5250  push    dx
116A9: 5031  push    ax
116AA: 31C0  xor     ax, ax
116AC: 509A  push    ax
116AD: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
116B2: B03E  mov     al, 0x3e
116B4: 5031  push    ax
116B5: 31C0  xor     ax, ax
116B7: 509A  push    ax
116B8: 9A7B  lcall   0x1c71, 0x67b ; ->para1C71:067B
116BD: 9AFE  lcall   0x1c71, 0x5fe ; ->para1C71:05FE
116C2: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
116C7: BFA2  mov     di, 0x6a2
116CA: 1E57  push    ds
116CB: 57BF  push    di
116CC: BF64  mov     di, 0x564
116CF: 1E57  push    ds
116D0: 57B8  push    di
116D1: B8FF  mov     ax, 0xff
116D4: 509A  push    ax
116D5: 9AC6  lcall   0x1c71, 0x6c6 ; ->para1C71:06C6
116DA: 9A9D  lcall   0x1c71, 0x59d ; ->para1C71:059D
116DF: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
116E4: BF64  mov     di, 0x564
116E7: 1E57  push    ds
116E8: 57BF  push    di
116E9: BFEE  mov     di, 0x1fee ; str:"MODE"
116EC: 0E57  push    cs
116ED: 579A  push    di
116EE: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
116F3: 7505  jne     0x116fa
116F5: 9A14  lcall   0x129d, 0x3114 ; ->PRZEDM_MODE
116FA: BF64  mov     di, 0x564
116FD: 1E57  push    ds
116FE: 57BF  push    di
116FF: BFF3  mov     di, 0x1ff3 ; str:"EXIT"
11702: 0E57  push    cs
11703: 579A  push    di
11704: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
11709: 7570  jne     0x1177b
1170B: BFA2  mov     di, 0x7a2
1170E: 1E57  push    ds
1170F: 57BF  push    di
11710: BFF8  mov     di, 0x1ff8 ; str:"DOSTEPNE WYJSCIA:"
11713: 0E57  push    cs
11714: 5731  push    di
11715: 31C0  xor     ax, ax
11717: 509A  push    ax
11718: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
1171D: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
11722: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11727: BFA2  mov     di, 0x7a2
1172A: 1E57  push    ds
1172B: 57BF  push    di
1172C: BF0A  mov     di, 0x200a ; str:"WSCHOD-CENTRUM MIASTA"
1172F: 0E57  push    cs
11730: 5731  push    di
11731: 31C0  xor     ax, ax
11733: 509A  push    ax
11734: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
11739: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
1173E: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11743: BFA2  mov     di, 0x7a2
11746: 1E57  push    ds
11747: 57BF  push    di
11748: BF20  mov     di, 0x2020 ; str:"ZACHOD-ULICA DLUGA"
1174B: 0E57  push    cs
1174C: 5731  push    di
1174D: 31C0  xor     ax, ax
1174F: 509A  push    ax
11750: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
11755: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
1175A: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
1175F: BFA2  mov     di, 0x7a2
11762: 1E57  push    ds
11763: 57BF  push    di
11764: BF33  mov     di, 0x2033 ; str:"POLNOC-WEJSCIE NA ARENE"
11767: 0E57  push    cs
11768: 5731  push    di
11769: 31C0  xor     ax, ax
1176B: 509A  push    ax
1176C: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
11771: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
11776: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
1177B: BF64  mov     di, 0x564
1177E: 1E57  push    ds
1177F: 57BF  push    di
11780: BF4B  mov     di, 0x204b ; str:"WYJSCIE"
11783: 0E57  push    cs
11784: 579A  push    di
11785: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
1178A: 7502  jne     0x1178e
1178C: EB4F  jmp     0x117dd ;
1178E: BF64  mov     di, 0x564
11791: 1E57  push    ds
11792: 57BF  push    di
11793: BF53  mov     di, 0x2053 ; str:"WSCHOD"
11796: 0E57  push    cs
11797: 579A  push    di
11798: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
1179D: 7506  jne     0x117a5
1179F: C706  mov     word ptr [0x1d6], 0x14 ; data:context
117A5: BF64  mov     di, 0x564
117A8: 1E57  push    ds
117A9: 57BF  push    di
117AA: BF5A  mov     di, 0x205a ; str:"ZACHOD"
117AD: 0E57  push    cs
117AE: 579A  push    di
117AF: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
117B4: 7506  jne     0x117bc
117B6: C706  mov     word ptr [0x1d6], 0x1f ; data:context
117BC: BF64  mov     di, 0x564
117BF: 1E57  push    ds
117C0: 57BF  push    di
117C1: BF61  mov     di, 0x2061 ; str:"POLNOC"
117C4: 0E57  push    cs
117C5: 579A  push    di
117C6: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
117CB: 7506  jne     0x117d3
117CD: C706  mov     word ptr [0x1d6], 0x20 ; data:context
117D3: 833E  cmp     word ptr [0x1d6], 0x1e ; data:context
117D8: 7503  jne     0x117dd
117DA: E9A7  jmp     0x11684 ;
117DD: 5DCB  pop     bp
117DE: CB44  retf

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

; ===== PROC POKOJ75 @ img 11BDC (block 11A8E..11D9E) =====
;   str@img11A8E: 'JESTES NA ULICY CIEMNEJ , WLASCIWIE NARAZIE NIE JEST TU JESZCZE TAK CIEMNO '
;   str@img11ADA: 'TA ULICA WYGLADA NA REMONTOWANñ , NA POLNOC WIDZISZ JAKIS BAR '
;   str@img11B19: 'NA POLODNIE PRZEBIEGAJA CIE DRESZCZE , JEST TAM NAPRAWDE CIEMNO'
;   str@img11B59: '%.'
;   str@img11B5C: 'MODE'
;   str@img11B61: 'EXIT'
;   str@img11B66: 'DOSTEPNE WYJSCIA:'
;   str@img11B78: 'ZACHOD-CENTRUM MIASTA'
;   str@img11B8E: 'POLNOC-BAR POD DWOMA PEDALAMI'
;   str@img11BAC: 'POLODNIE-BLUSZCZ'
;   str@img11BBD: 'WYJSCIE'
;   str@img11BC5: 'ZACHOD'
;   str@img11BCC: 'POLNOC'
;   str@img11BD3: 'POLODNIE'
;   str@img11BE9: 'K'
;   str@img11BEF: '┐'
;   str@img11C4B: 'Ö'
;   str@img11C66: 'Ö'
;   str@img11D4B: 'δO'
;   str@img11D79: 'L'
;   str@img11D90: 'M'
;   str@img11D96: 'K'
;   str@img11D99: 'Θº■'

11BDC: 5589  push    bp
11BDD: 89E5  mov     bp, sp
11BDF: 31C0  xor     ax, ax
11BE1: 9ACD  lcall   0x1c71, 0x2cd ; ->para1C71:02CD
11BE6: 833E  cmp     word ptr [0x1d6], 0x4b ; data:context
11BEB: 7403  je      0x11bf0
11BED: E9AD  jmp     0x11d9d ;
11BF0: BFA2  mov     di, 0x7a2
11BF3: 1E57  push    ds
11BF4: 57BF  push    di
11BF5: BFBE  mov     di, 0x24be ; str:"JESTES NA ULICY CIEMNEJ , WLASCIWIE NARAZIE NIE JEST TU JESZCZE TAK CIEMNO "
11BF8: 0E57  push    cs
11BF9: 5731  push    di
11BFA: 31C0  xor     ax, ax
11BFC: 509A  push    ax
11BFD: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
11C02: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
11C07: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11C0C: BFA2  mov     di, 0x7a2
11C0F: 1E57  push    ds
11C10: 57BF  push    di
11C11: BF0A  mov     di, 0x250a ; str:"TA ULICA WYGLADA NA REMONTOWANñ , NA POLNOC WIDZISZ JAKIS BAR "
11C14: 0E57  push    cs
11C15: 5731  push    di
11C16: 31C0  xor     ax, ax
11C18: 509A  push    ax
11C19: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
11C1E: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
11C23: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11C28: BFA2  mov     di, 0x7a2
11C2B: 1E57  push    ds
11C2C: 57BF  push    di
11C2D: BF49  mov     di, 0x2549 ; str:"NA POLODNIE PRZEBIEGAJA CIE DRESZCZE , JEST TAM NAPRAWDE CIEMNO"
11C30: 0E57  push    cs
11C31: 5731  push    di
11C32: 31C0  xor     ax, ax
11C34: 509A  push    ax
11C35: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
11C3A: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
11C3F: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11C44: BFA2  mov     di, 0x7a2
11C47: 1E57  push    ds
11C48: 57A1  push    di
11C49: A19C  mov     ax, word ptr [0x19c] ; data:Energy
11C4C: 9952  cdq
11C4D: 5250  push    dx
11C4E: 5031  push    ax
11C4F: 31C0  xor     ax, ax
11C51: 509A  push    ax
11C52: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
11C57: BF89  mov     di, 0x2589 ; str:"%."
11C5A: 0E57  push    cs
11C5B: 5731  push    di
11C5C: 31C0  xor     ax, ax
11C5E: 509A  push    ax
11C5F: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
11C64: A1D4  mov     ax, word ptr [0x1d4] ; data:KUNSZT
11C67: 9952  cdq
11C68: 5250  push    dx
11C69: 5031  push    ax
11C6A: 31C0  xor     ax, ax
11C6C: 509A  push    ax
11C6D: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
11C72: B03E  mov     al, 0x3e
11C74: 5031  push    ax
11C75: 31C0  xor     ax, ax
11C77: 509A  push    ax
11C78: 9A7B  lcall   0x1c71, 0x67b ; ->para1C71:067B
11C7D: 9AFE  lcall   0x1c71, 0x5fe ; ->para1C71:05FE
11C82: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11C87: BFA2  mov     di, 0x6a2
11C8A: 1E57  push    ds
11C8B: 57BF  push    di
11C8C: BF64  mov     di, 0x564
11C8F: 1E57  push    ds
11C90: 57B8  push    di
11C91: B8FF  mov     ax, 0xff
11C94: 509A  push    ax
11C95: 9AC6  lcall   0x1c71, 0x6c6 ; ->para1C71:06C6
11C9A: 9A9D  lcall   0x1c71, 0x59d ; ->para1C71:059D
11C9F: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11CA4: BF64  mov     di, 0x564
11CA7: 1E57  push    ds
11CA8: 57BF  push    di
11CA9: BF8C  mov     di, 0x258c ; str:"MODE"
11CAC: 0E57  push    cs
11CAD: 579A  push    di
11CAE: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
11CB3: 7505  jne     0x11cba
11CB5: 9A14  lcall   0x129d, 0x3114 ; ->PRZEDM_MODE
11CBA: BF64  mov     di, 0x564
11CBD: 1E57  push    ds
11CBE: 57BF  push    di
11CBF: BF91  mov     di, 0x2591 ; str:"EXIT"
11CC2: 0E57  push    cs
11CC3: 579A  push    di
11CC4: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
11CC9: 7570  jne     0x11d3b
11CCB: BFA2  mov     di, 0x7a2
11CCE: 1E57  push    ds
11CCF: 57BF  push    di
11CD0: BF96  mov     di, 0x2596 ; str:"DOSTEPNE WYJSCIA:"
11CD3: 0E57  push    cs
11CD4: 5731  push    di
11CD5: 31C0  xor     ax, ax
11CD7: 509A  push    ax
11CD8: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
11CDD: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
11CE2: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11CE7: BFA2  mov     di, 0x7a2
11CEA: 1E57  push    ds
11CEB: 57BF  push    di
11CEC: BFA8  mov     di, 0x25a8 ; str:"ZACHOD-CENTRUM MIASTA"
11CEF: 0E57  push    cs
11CF0: 5731  push    di
11CF1: 31C0  xor     ax, ax
11CF3: 509A  push    ax
11CF4: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
11CF9: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
11CFE: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11D03: BFA2  mov     di, 0x7a2
11D06: 1E57  push    ds
11D07: 57BF  push    di
11D08: BFBE  mov     di, 0x25be ; str:"POLNOC-BAR POD DWOMA PEDALAMI"
11D0B: 0E57  push    cs
11D0C: 5731  push    di
11D0D: 31C0  xor     ax, ax
11D0F: 509A  push    ax
11D10: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
11D15: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
11D1A: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11D1F: BFA2  mov     di, 0x7a2
11D22: 1E57  push    ds
11D23: 57BF  push    di
11D24: BFDC  mov     di, 0x25dc ; str:"POLODNIE-BLUSZCZ"
11D27: 0E57  push    cs
11D28: 5731  push    di
11D29: 31C0  xor     ax, ax
11D2B: 509A  push    ax
11D2C: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
11D31: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
11D36: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11D3B: BF64  mov     di, 0x564
11D3E: 1E57  push    ds
11D3F: 57BF  push    di
11D40: BFED  mov     di, 0x25ed ; str:"WYJSCIE"
11D43: 0E57  push    cs
11D44: 579A  push    di
11D45: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
11D4A: 7502  jne     0x11d4e
11D4C: EB4F  jmp     0x11d9d ;
11D4E: BF64  mov     di, 0x564
11D51: 1E57  push    ds
11D52: 57BF  push    di
11D53: BFF5  mov     di, 0x25f5 ; str:"ZACHOD"
11D56: 0E57  push    cs
11D57: 579A  push    di
11D58: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
11D5D: 7506  jne     0x11d65
11D5F: C706  mov     word ptr [0x1d6], 0x14 ; data:context
11D65: BF64  mov     di, 0x564
11D68: 1E57  push    ds
11D69: 57BF  push    di
11D6A: BFFC  mov     di, 0x25fc ; str:"POLNOC"
11D6D: 0E57  push    cs
11D6E: 579A  push    di
11D6F: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
11D74: 7506  jne     0x11d7c
11D76: C706  mov     word ptr [0x1d6], 0x4c ; data:context
11D7C: BF64  mov     di, 0x564
11D7F: 1E57  push    ds
11D80: 57BF  push    di
11D81: BF03  mov     di, 0x2603 ; str:"POLODNIE"
11D84: 0E57  push    cs
11D85: 579A  push    di
11D86: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
11D8B: 7506  jne     0x11d93
11D8D: C706  mov     word ptr [0x1d6], 0x4d ; data:context
11D93: 833E  cmp     word ptr [0x1d6], 0x4b ; data:context
11D98: 7503  jne     0x11d9d
11D9A: E9A7  jmp     0x11c44 ;
11D9D: 5DCB  pop     bp
11D9E: CB44  retf

; ===== PROC POKOJ83 @ img 11ECA (block 11D9F..12068) =====
;   str@img11D9F: '............................. PIERDUT...........PIERDUT......PIERDUT'
;   str@img11DE4: 'DOPIERO TERAZ SIE ZORIENTOWALES ZE NA SRODKU STOI WIELKIE DRZEWO'
;   str@img11E25: 'HMMM ALE ZARAZ ... TE KRZAKI NA ZACHOD WYGLADAJA BARDZO PODEJRZANIE....'
;   str@img11E6D: '%.'
;   str@img11E70: 'MODE'
;   str@img11E75: 'EXIT'
;   str@img11E7A: 'DOSTEPNE WYJSCIA:'
;   str@img11E8C: 'POLNOC-BLUSZCZ'
;   str@img11E9B: 'ZACHOD-PODEJRZANE KRZAKI'
;   str@img11EB4: 'WYJSCIE'
;   str@img11EBC: 'POLNOC'
;   str@img11EC3: 'ZACHOD'
;   str@img11ED7: 'S'
;   str@img11EDD: '┐'
;   str@img11F3E: 'Ö'
;   str@img11F59: 'Ö'
;   str@img1202C: 'δ8'
;   str@img12043: 'P'
;   str@img1205A: 'T'
;   str@img12060: 'S'
;   str@img12063: 'Θ╨■'

11ECA: 5589  push    bp
11ECB: 89E5  mov     bp, sp
11ECD: 31C0  xor     ax, ax
11ECF: 9ACD  lcall   0x1c71, 0x2cd ; ->para1C71:02CD
11ED4: 833E  cmp     word ptr [0x1d6], 0x53 ; data:context
11ED9: 7403  je      0x11ede
11EDB: E989  jmp     0x12067 ;
11EDE: BFA2  mov     di, 0x7a2
11EE1: 1E57  push    ds
11EE2: 57BF  push    di
11EE3: BFCF  mov     di, 0x27cf ; str:"............................. PIERDUT...........PIERDUT......PIERDUT"
11EE6: 0E57  push    cs
11EE7: 5731  push    di
11EE8: 31C0  xor     ax, ax
11EEA: 509A  push    ax
11EEB: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
11EF0: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
11EF5: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11EFA: BFA2  mov     di, 0x7a2
11EFD: 1E57  push    ds
11EFE: 57BF  push    di
11EFF: BF14  mov     di, 0x2814 ; str:"DOPIERO TERAZ SIE ZORIENTOWALES ZE NA SRODKU STOI WIELKIE DRZEWO"
11F02: 0E57  push    cs
11F03: 5731  push    di
11F04: 31C0  xor     ax, ax
11F06: 509A  push    ax
11F07: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
11F0C: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
11F11: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11F16: BFA2  mov     di, 0x7a2
11F19: 1E57  push    ds
11F1A: 57BF  push    di
11F1B: BF55  mov     di, 0x2855 ; str:"HMMM ALE ZARAZ ... TE KRZAKI NA ZACHOD WYGLADAJA BARDZO PODEJRZANIE...."
11F1E: 0E57  push    cs
11F1F: 5731  push    di
11F20: 31C0  xor     ax, ax
11F22: 509A  push    ax
11F23: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
11F28: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
11F2D: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11F32: 9A59  lcall   0x129d, 0xc59 ; ->para129D:0C59
11F37: BFA2  mov     di, 0x7a2
11F3A: 1E57  push    ds
11F3B: 57A1  push    di
11F3C: A19C  mov     ax, word ptr [0x19c] ; data:Energy
11F3F: 9952  cdq
11F40: 5250  push    dx
11F41: 5031  push    ax
11F42: 31C0  xor     ax, ax
11F44: 509A  push    ax
11F45: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
11F4A: BF9D  mov     di, 0x289d ; str:"%."
11F4D: 0E57  push    cs
11F4E: 5731  push    di
11F4F: 31C0  xor     ax, ax
11F51: 509A  push    ax
11F52: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
11F57: A1D4  mov     ax, word ptr [0x1d4] ; data:KUNSZT
11F5A: 9952  cdq
11F5B: 5250  push    dx
11F5C: 5031  push    ax
11F5D: 31C0  xor     ax, ax
11F5F: 509A  push    ax
11F60: 9A89  lcall   0x1c71, 0x789 ; ->para1C71:0789
11F65: B03E  mov     al, 0x3e
11F67: 5031  push    ax
11F68: 31C0  xor     ax, ax
11F6A: 509A  push    ax
11F6B: 9A7B  lcall   0x1c71, 0x67b ; ->para1C71:067B
11F70: 9AFE  lcall   0x1c71, 0x5fe ; ->para1C71:05FE
11F75: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11F7A: BFA2  mov     di, 0x6a2
11F7D: 1E57  push    ds
11F7E: 57BF  push    di
11F7F: BF64  mov     di, 0x564
11F82: 1E57  push    ds
11F83: 57B8  push    di
11F84: B8FF  mov     ax, 0xff
11F87: 509A  push    ax
11F88: 9AC6  lcall   0x1c71, 0x6c6 ; ->para1C71:06C6
11F8D: 9A9D  lcall   0x1c71, 0x59d ; ->para1C71:059D
11F92: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11F97: 9A37  lcall   0x129d, 0x9137 ; ->para129D:9137
11F9C: 9AE7  lcall   0x129d, 0x8be7 ; ->para129D:8BE7
11FA1: BF64  mov     di, 0x564
11FA4: 1E57  push    ds
11FA5: 57BF  push    di
11FA6: BFA0  mov     di, 0x28a0 ; str:"MODE"
11FA9: 0E57  push    cs
11FAA: 579A  push    di
11FAB: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
11FB0: 7505  jne     0x11fb7
11FB2: 9A14  lcall   0x129d, 0x3114 ; ->PRZEDM_MODE
11FB7: BF64  mov     di, 0x564
11FBA: 1E57  push    ds
11FBB: 57BF  push    di
11FBC: BFA5  mov     di, 0x28a5 ; str:"EXIT"
11FBF: 0E57  push    cs
11FC0: 579A  push    di
11FC1: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
11FC6: 7554  jne     0x1201c
11FC8: BFA2  mov     di, 0x7a2
11FCB: 1E57  push    ds
11FCC: 57BF  push    di
11FCD: BFAA  mov     di, 0x28aa ; str:"DOSTEPNE WYJSCIA:"
11FD0: 0E57  push    cs
11FD1: 5731  push    di
11FD2: 31C0  xor     ax, ax
11FD4: 509A  push    ax
11FD5: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
11FDA: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
11FDF: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
11FE4: BFA2  mov     di, 0x7a2
11FE7: 1E57  push    ds
11FE8: 57BF  push    di
11FE9: BFBC  mov     di, 0x28bc ; str:"POLNOC-BLUSZCZ"
11FEC: 0E57  push    cs
11FED: 5731  push    di
11FEE: 31C0  xor     ax, ax
11FF0: 509A  push    ax
11FF1: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
11FF6: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
11FFB: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
12000: BFA2  mov     di, 0x7a2
12003: 1E57  push    ds
12004: 57BF  push    di
12005: BFCB  mov     di, 0x28cb ; str:"ZACHOD-PODEJRZANE KRZAKI"
12008: 0E57  push    cs
12009: 5731  push    di
1200A: 31C0  xor     ax, ax
1200C: 509A  push    ax
1200D: 9A01  lcall   0x1c71, 0x701 ; ->para1C71:0701
12012: 9ADD  lcall   0x1c71, 0x5dd ; ->para1C71:05DD
12017: 9A91  lcall   0x1c71, 0x291 ; ->para1C71:0291
1201C: BF64  mov     di, 0x564
1201F: 1E57  push    ds
12020: 57BF  push    di
12021: BFE4  mov     di, 0x28e4 ; str:"WYJSCIE"
12024: 0E57  push    cs
12025: 579A  push    di
12026: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
1202B: 7502  jne     0x1202f
1202D: EB38  jmp     0x12067 ;
1202F: BF64  mov     di, 0x564
12032: 1E57  push    ds
12033: 57BF  push    di
12034: BFEC  mov     di, 0x28ec ; str:"POLNOC"
12037: 0E57  push    cs
12038: 579A  push    di
12039: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
1203E: 7506  jne     0x12046
12040: C706  mov     word ptr [0x1d6], 0x50 ; data:context
12046: BF64  mov     di, 0x564
12049: 1E57  push    ds
1204A: 57BF  push    di
1204B: BFF3  mov     di, 0x28f3 ; str:"ZACHOD"
1204E: 0E57  push    cs
1204F: 579A  push    di
12050: 9AD7  lcall   0x1c71, 0x9d7 ; ->para1C71:09D7
12055: 7506  jne     0x1205d
12057: C706  mov     word ptr [0x1d6], 0x54 ; data:context
1205D: 833E  cmp     word ptr [0x1d6], 0x53 ; data:context
12062: 7503  jne     0x12067
12064: E9D0  jmp     0x11f37 ;
12067: 5DCB  pop     bp
12068: CB3E  retf

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

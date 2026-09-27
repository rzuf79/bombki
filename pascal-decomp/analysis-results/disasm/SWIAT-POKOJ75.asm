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

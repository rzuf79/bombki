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

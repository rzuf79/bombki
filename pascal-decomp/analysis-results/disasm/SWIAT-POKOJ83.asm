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

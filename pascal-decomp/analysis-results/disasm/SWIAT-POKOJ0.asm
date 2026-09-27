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

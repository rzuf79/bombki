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

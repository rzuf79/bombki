; TARGETMAP -- every loader-fixed far destination (game + runtime) in EXE
; image 120048 B, base file052E0, entry para0000:ofs0000
;
; <addr> <refs> : first 3 insns

  0001:06C7  x1
      push    sp
      push    di
      dec     di

  0068:1AB0  x6
      inc     bp
      and     byte ptr [bx + 0x47], cl
      dec     si

  00DA:1AA3  x1
      mov     word ptr [bx], ax
      jno     0x2863
      mov     di, 0x2206

  021C:1AA3  x1
      fiadd   dword ptr [bx + si]
      mov     word ptr [0x21a], ax
      mov     word ptr [0x21c], dx

  0291:1C71  x5
      inc     dx
      push    cs
      push    di

  01FC:26B8  x1
      mov     word ptr [0x21c], dx
      mov     ax, word ptr [0x22e]
      sub     ax, 0xa

  0375:16E9  x1
      push    cs
      push    di
      lcall   0x1c71, 0x9d7

  007E:571E  x1
      salc    
      add     word ptr [si], cx
      jne     0x5f07

  01D6:4975  x1
      dec     si
      dec     cx
      inc     bp

  0674:063B  x2
      jmp     0x7d69
      mov     di, 0x564
      push    ds

  05DD:1C71  x35   <== GAME CODE
      fld     qword ptr [di]
      jno     0x7a61
      lcall   0x1c71, 0x291

  019A:7107  x1
      push    es
      xchg    si, ax
      add     word ptr [bp + 9], di

  0701:1C71  x2
      push    ax
      dec     di
      push    sp

  0186:7500  x1
      and     byte ptr [si + 0x41], dl
      push    dx
      inc     bx

  0789:1C71  x1
      pop     dx
      inc     bx
      pop     dx

  00FF:9A50  x1
      pop     cx
      pop     dx
      inc     bp

  0564:571E  x2
      dec     cx
      inc     bp
      push    dx

  09D7:1C71  x2
      lcall   0x1c71, 0x67b
      lcall   0x1c71, 0x5fe
      lcall   0x1c71, 0x291

  018C:A340  x1
      lcall   0x1c71, 0x5dd
      lcall   0x1c71, 0x291
      mov     di, 0x7a2

  0745:5957  x1
      jne     0xcdac
      jmp     0xf5c2
      mov     di, 0x564

  07A2:571E  x26
      jno     0xd15c
      lcall   0x1c71, 0x291
      mov     di, 0x6a2

  067E:8B26  x4
      xor     byte ptr [bp + si], al
      mov     ax, word ptr [0x182]
      dec     ax

  0696:8B47  x1
      lcall   0x1c71, 0x5dd
      lcall   0x1c71, 0x291
      cmp     word ptr [0x18c], 0xb

  0E5F:3157  x1
      push    di
      mov     di, 0x2020
      push    cs

  0E70:3157  x1
      pop     dx
      inc     cx
      push    bx

  0EA3:3157  x1
      and     byte ptr [di + 0x49], cl
      inc     cx
      push    bx

  0EAF:3157  x2
      push    ds
      push    di
      mov     ax, word ptr [0x19c]

  087E:B4A1  x1
      inc     bx
      dec     cx
      inc     cx

  0A05:A300  x1
      and     byte ptr [bp + 0x49], cl
      inc     bp
      and     byte ptr [bp + 0x41], cl

  0E42:9A57  x52   <== GAME CODE
      jno     0x17e95
      lcall   0x1c71, 0x291
      mov     ax, 0x7d0


; ======== proc_05DD_1C71  ========  (cell para 05DD:ofs 1C71, img07A41)
  07A4:0001  fld      qword ptr [di]
  07A4:0003  jno      0x7a61
  07A4:0005  lcall    0x1c71, 0x291
  07A4:000A  mov      di, 0x7a2
  07A4:000D  push     ds
  07A4:000E  push     di
  07A4:000F  mov      di, 0x679e
  07A5:0002  push     cs
  07A5:0003  push     di
  07A5:0004  xor      ax, ax
  07A5:0006  push     ax
  07A5:0007  lcall    0x1c71, 0x701
  07A5:000C  lcall    0x1c71, 0x5dd
  07A6:0001  lcall    0x1c71, 0x291
  07A6:0006  mov      di, 0x564
  07A6:0009  push     ds
  07A6:000A  push     di
  07A6:000B  mov      di, 0x600d
  07A6:000E  push     cs
  07A6:000F  push     di
  07A7:0000  lcall    0x1c71, 0x9d7
  07A7:0005  jne      0x7a7a
  07A7:0007  jmp      0x7d69
  07A7:000A  mov      di, 0x564
  07A7:000D  push     ds
  07A7:000E  push     di
  07A7:000F  mov      di, 0x601c
  07A8:0002  push     cs
  07A8:0003  push     di
  07A8:0004  lcall    0x1c71, 0x9d7
  07A8:0009  jne      0x7a91
  07A8:000B  mov      word ptr [0x1d6], 0x45
  07A9:0001  mov      di, 0x564
  07A9:0004  push     ds
  07A9:0005  push     di
  07A9:0006  mov      di, 0x6023
  07A9:0009  push     cs
  07A9:000A  push     di
  07A9:000B  lcall    0x1c71, 0x9d7
  07AA:0000  jne      0x7aa8
  07AA:0002  mov      word ptr [0x1d6], 0x47
  07AA:0008  lcall    0x129d, 0x85c7
  07AA:000D  cmp      word ptr [0x1d6], 0x46
  07AB:0002  jne      0x7ab7
  07AB:0004  jmp      0x798b
  07AB:0007  cmp      word ptr [0x1d6], 0x47
  07AB:000C  je       0x7ac1
  07AB:000E  jmp      0x7c2a
  07AC:0001  mov      di, 0x7a2
  07AC:0004  push     ds
  07AC:0005  push     di
  07AC:0006  mov      di, 0x67b4
  07AC:0009  push     cs
  07AC:000A  push     di
  07AC:000B  xor      ax, ax
  07AC:000D  push     ax
  07AC:000E  lcall    0x1c71, 0x701
  07AD:0003  lcall    0x1c71, 0x5dd
  07AD:0008  lcall    0x1c71, 0x291
  07AD:000D  mov      di, 0x7a2
  07AE:0000  push     ds
  07AE:0001  push     di
  07AE:0002  mov      di, 0x67fa
  07AE:0005  push     cs
  07AE:0006  push     di
  07AE:0007  xor      ax, ax
  07AE:0009  push     ax
  07AE:000A  lcall    0x1c71, 0x701
  07AE:000F  lcall    0x1c71, 0x5dd
  07AF:0004  lcall    0x1c71, 0x291
  07AF:0009  lcall    0x129d, 0x31ff
  07AF:000E  mov      di, 0x7a2
  07B0:0001  push     ds
  07B0:0002  push     di
  07B0:0003  mov      ax, word ptr [0x19c]
  07B0:0006  cdq      
  07B0:0007  push     dx
  07B0:0008  push     ax
  07B0:0009  xor      ax, ax
  07B0:000B  push     ax
  07B0:000C  lcall    0x1c71, 0x789
  07B1:0001  mov      di, 0x5fbd
  07B1:0004  push     cs
  07B1:0005  push     di
  07B1:0006  xor      ax, ax
  07B1:0008  push     ax
  07B1:0009  lcall    0x1c71, 0x701
  07B1:000E  mov      ax, word ptr [0x1d4]
  07B2:0001  cdq      
  07B2:0002  push     dx
  07B2:0003  push     ax
  07B2:0004  xor      ax, ax
  07B2:0006  push     ax
  07B2:0007  lcall    0x1c71, 0x789
  07B2:000C  mov      al, 0x3e
  07B2:000E  push     ax
  07B2:000F  xor      ax, ax
  07B3:0001  push     ax
  07B3:0002  lcall    0x1c71, 0x67b
  07B3:0007  lcall    0x1c71, 0x5fe
  07B3:000C  lcall    0x1c71, 0x291
  07B4:0001  mov      di, 0x6a2
  07B4:0004  push     ds
  07B4:0005  push     di
  07B4:0006  mov      di, 0x564
  07B4:0009  push     ds
  07B4:000A  push     di
  07B4:000B  mov      ax, 0xff
  07B4:000E  push     ax
  07B4:000F  lcall    0x1c71, 0x6c6
  07B5:0004  lcall    0x1c71, 0x59d
  07B5:0009  lcall    0x1c71, 0x291
  07B5:000E  mov      di, 0x564
  07B6:0001  push     ds
  07B6:0002  push     di
  07B6:0003  mov      di, 0x5fc0
  07B6:0006  push     cs
  07B6:0007  push     di
  07B6:0008  lcall    0x1c71, 0x9d7
  07B6:000D  jne      0x7b74
  07B6:000F  lcall    0x129d, 0x3114
  07B7:0004  mov      di, 0x564
  07B7:0007  push     ds
  07B7:0008  push     di
  07B7:0009  mov      di, 0x5fc5
  07B7:000C  push     cs
  07B7:000D  push     di
  07B7:000E  lcall    0x1c71, 0x9d7
  07B8:0003  jne      0x7bd9
  07B8:0005  mov      di, 0x7a2
  07B8:0008  push     ds
  07B8:0009  push     di
  07B8:000A  mov      di, 0x5fca
  07B8:000D  push     cs
  07B8:000E  push     di
  07B8:000F  xor      ax, ax
  07B9:0001  push     ax
  07B9:0002  lcall    0x1c71, 0x701
  07B9:0007  lcall    0x1c71, 0x5dd
  07B9:000C  lcall    0x1c71, 0x291
  07BA:0001  mov      di, 0x7a2
  07BA:0004  push     ds
  07BA:0005  push     di
  07BA:0006  mov      di, 0x6791
  07BA:0009  push     cs
  07BA:000A  push     di
  07BA:000B  xor      ax, ax
  07BA:000D  push     ax
  07BA:000E  lcall    0x1c71, 0x701
  07BB:0003  lcall    0x1c71, 0x5dd
  07BB:0008  lcall    0x1c71, 0x291
  07BB:000D  mov      di, 0x7a2
  07BC:0000  push     ds
  07BC:0001  push     di
  07BC:0002  mov      di, 0x663f
  07BC:0005  push     cs
  07BC:0006  push     di
  07BC:0007  xor      ax, ax
  07BC:0009  push     ax
  07BC:000A  lcall    0x1c71, 0x701
  07BC:000F  lcall    0x1c71, 0x5dd
  07BD:0004  lcall    0x1c71, 0x291
  07BD:0009  mov      di, 0x564
  07BD:000C  push     ds
  07BD:000D  push     di
  07BD:000E  mov      di, 0x600d
  07BE:0001  push     cs
  07BE:0002  push     di
  07BE:0003  lcall    0x1c71, 0x9d7
  07BE:0008  jne      0x7bed
  07BE:000A  jmp      0x7d69
  07BE:000D  mov      di, 0x564
  07BF:0000  push     ds
  07BF:0001  push     di
  07BF:0002  mov      di, 0x601c
  07BF:0005  push     cs
  07BF:0006  push     di
  07BF:0007  lcall    0x1c71, 0x9d7
  07BF:000C  jne      0x7c04
  07BF:000E  mov      word ptr [0x1d6], 0x46
  07C0:0004  mov      di, 0x564
  07C0:0007  push     ds
  07C0:0008  push     di
  07C0:0009  mov      di, 0x6023
  07C0:000C  push     cs
  07C0:000D  push     di
  07C0:000E  lcall    0x1c71, 0x9d7
  07C1:0003  jne      0x7c1b
  07C1:0005  mov      word ptr [0x1d6], 0x48
  07C1:000B  lcall    0x129d, 0x85c7
  07C2:0000  cmp      word ptr [0x1d6], 0x47
  07C2:0005  jne      0x7c2a
  07C2:0007  jmp      0x7afe
  07C2:000A  cmp      word ptr [0x1d6], 0x48
  07C2:000F  je       0x7c34
  07C3:0001  jmp      0x7d69
  07C3:0004  mov      di, 0x7a2
  07C3:0007  push     ds
  07C3:0008  push     di
  07C3:0009  mov      di, 0x6832
  07C3:000C  push     cs
  07C3:000D  push     di
  07C3:000E  xor      ax, ax
  07C4:0000  push     ax
  07C4:0001  lcall    0x1c71, 0x701
  07C4:0006  lcall    0x1c71, 0x5dd
  07C4:000B  lcall    0x1c71, 0x291
  07C5:0000  mov      di, 0x7a2
  07C5:0003  push     ds
  07C5:0004  push     di
  07C5:0005  mov      di, 0x6874
  07C5:0008  push     cs
  07C5:0009  push     di
  07C5:000A  xor      ax, ax
  07C5:000C  push     ax
  07C5:000D  lcall    0x1c71, 0x701
  07C6:0002  lcall    0x1c71, 0x5dd
  07C6:0007  lcall    0x1c71, 0x291
  07C6:000C  lcall    0x129d, 0x31ff
  07C7:0001  mov      di, 0x7a2
  07C7:0004  push     ds
  07C7:0005  push     di
  07C7:0006  mov      ax, word ptr [0x19c]
  07C7:0009  cdq      
  07C7:000A  push     dx
  07C7:000B  push     ax
  07C7:000C  xor      ax, ax
  07C7:000E  push     ax
  07C7:000F  lcall    0x1c71, 0x789
  07C8:0004  mov      di, 0x5fbd
  07C8:0007  push     cs
  07C8:0008  push     di
  07C8:0009  xor      ax, ax
  07C8:000B  push     ax
  07C8:000C  lcall    0x1c71, 0x701
  07C9:0001  mov      ax, word ptr [0x1d4]
  07C9:0004  cdq      
  07C9:0005  push     dx
  07C9:0006  push     ax
  07C9:0007  xor      ax, ax
  07C9:0009  push     ax
  07C9:000A  lcall    0x1c71, 0x789
  07C9:000F  mov      al, 0x3e
  07CA:0001  push     ax
  07CA:0002  xor      ax, ax
  07CA:0004  push     ax
  07CA:0005  lcall    0x1c71, 0x67b
  07CA:000A  lcall    0x1c71, 0x5fe
  07CA:000F  lcall    0x1c71, 0x291
  07CB:0004  mov      di, 0x6a2
  07CB:0007  push     ds
  07CB:0008  push     di
  07CB:0009  mov      di, 0x564
  07CB:000C  push     ds
  07CB:000D  push     di
  07CB:000E  mov      ax, 0xff
  07CC:0001  push     ax
  07CC:0002  lcall    0x1c71, 0x6c6
  07CC:0007  lcall    0x1c71, 0x59d
  07CC:000C  lcall    0x1c71, 0x291
  07CD:0001  mov      di, 0x564
  07CD:0004  push     ds
  07CD:0005  push     di
  07CD:0006  mov      di, 0x5fc0
  07CD:0009  push     cs
  07CD:000A  push     di
  07CD:000B  lcall    0x1c71, 0x9d7
  07CE:0000  jne      0x7ce7
  07CE:0002  lcall    0x129d, 0x3114
  07CE:0007  mov      di, 0x564
  07CE:000A  push     ds
  07CE:000B  push     di
  07CE:000C  mov      di, 0x5fc5
  07CE:000F  push     cs
  07CF:0000  push     di
  07CF:0001  lcall    0x1c71, 0x9d7
  07CF:0006  jne      0x7d30
  07CF:0008  mov      di, 0x7a2
  07CF:000B  push     ds
  07CF:000C  push     di
  07CF:000D  mov      di, 0x5fca
  07D0:0000  push     cs
  07D0:0001  push     di
  07D0:0002  xor      ax, ax
  07D0:0004  push     ax
  07D0:0005  lcall    0x1c71, 0x701
  07D0:000A  lcall    0x1c71, 0x5dd
  07D0:000F  lcall    0x1c71, 0x291
  07D1:0004  mov      di, 0x7a2
  07D1:0007  push     ds
  07D1:0008  push     di
  07D1:0009  mov      di, 0x68a8
  07D1:000C  push     cs
  07D1:000D  push     di
  07D1:000E  xor      ax, ax
  07D2:0000  push     ax
  07D2:0001  lcall    0x1c71, 0x701
  07D2:0006  lcall    0x1c71, 0x5dd
  07D2:000B  lcall    0x1c71, 0x291
  07D3:0000  mov      di, 0x564
  07D3:0003  push     ds
  07D3:0004  push     di
  07D3:0005  mov      di, 0x600d
  07D3:0008  push     cs
  07D3:0009  push     di
  07D3:000A  lcall    0x1c71, 0x9d7
  07D3:000F  jne      0x7d43
  07D4:0001  jmp      0x7d69
  07D4:0003  mov      di, 0x564
  07D4:0006  push     ds
  07D4:0007  push     di
  07D4:0008  mov      di, 0x601c
  07D4:000B  push     cs
  07D4:000C  push     di
  07D4:000D  lcall    0x1c71, 0x9d7
  07D5:0002  jne      0x7d5a
  07D5:0004  mov      word ptr [0x1d6], 0x47
  07D5:000A  lcall    0x129d, 0x85c7
  07D5:000F  cmp      word ptr [0x1d6], 0x48
  07D6:0004  jne      0x7d69
  07D6:0006  jmp      0x7c71
  07D6:0009  pop      bp
  07D6:000A  ret      
  07D6:000B  or       word ptr [bx + si + 0x6c], si
  07D6:000E  imul     bp, word ptr [bp + di + 0x69], 0x742e
  07D7:0003  jo       0x7dea
  07D7:0005  or       dh, byte ptr [bp + di + 0x75]
  07D7:0008  arpl     word ptr [bp + di + 0x65], bp
  07D7:000B  insw     word ptr es:[di], dx
  07D7:000C  popaw    
  07D7:000D  insb     byte ptr es:[di], dx
  07D7:000E  insb     byte ptr es:[di], dx
  07D7:000F  cmp      dl, byte ptr [di - 0x77]
  07D8:0002  in       ax, 0x31
  07D8:0004  rcr      byte ptr [bp + si + 0x2cd], 0x71
  07D8:0009  sbb      al, 0xbf
  07D8:000B  mov      byte ptr [0x1e06], al
  07D8:000E  push     di
  07D8:000F  mov      di, 0x564
  07D9:0002  push     ds
  07D9:0003  push     di
  07D9:0004  mov      ax, 0xff
  07D9:0007  push     ax
  07D9:0008  lcall    0x1c71, 0x6c6
  07D9:000D  lcall    0x1c71, 0x59d
  07DA:0002  lcall    0x1c71, 0x291
  07DA:0007  mov      di, 0x7e
  07DA:000A  push     ds
  07DA:000B  push     di
  07DA:000C  mov      di, 0x7d6b
  07DA:000F  push     cs
  07DB:0000  push     di
  07DB:0001  lcall    0x1c71, 0x2e6
  07DB:0006  mov      di, 0x7e
  07DB:0009  push     ds
  07DB:000A  push     di
  07DB:000B  lcall    0x1c71, 0x364
  07DC:0000  lcall    0x1c71, 0x291
  07DC:0005  mov      di, 0x7e
  07DC:0008  push     ds
  07DC:0009  push     di
  07DC:000A  lcall    0x1c71, 0x72d
  07DC:000F  mov      word ptr [0x1ac], ax
  07DD:0002  lcall    0x1c71, 0x5fe
  07DD:0007  lcall    0x1c71, 0x291
  07DD:000C  mov      ax, word ptr [0x1ac]
  07DD:000F  cdq      
  07DE:0000  mov      cx, 4
  07DE:0003  idiv     cx
  07DE:0005  mov      word ptr [0x1ac], ax
  07DE:0008  mov      di, 0x7e
  07DE:000B  push     ds
  07DE:000C  push     di
  07DE:000D  lcall    0x1c71, 0x72d
  07DF:0002  mov      byte ptr [0x25c], al
  07DF:0005  lcall    0x1c71, 0x5fe
  07DF:000A  lcall    0x1c71, 0x291
  07DF:000F  mov      al, byte ptr [0x25c]
  07E0:0002  cwde     
  07E0:0003  sub      ax, 0x17
  07E0:0006  mov      byte ptr [0x25c], al
  07E0:0009  mov      di, 0x7e
  07E0:000C  push     ds
  07E0:000D  push     di
  07E0:000E  lcall    0x1c71, 0x72d
  07E1:0003  mov      word ptr [0x17e], ax
  07E1:0006  lcall    0x1c71, 0x5fe
  07E1:000B  lcall    0x1c71, 0x291
  07E2:0000  mov      di, 0x7e
  07E2:0003  push     ds
  07E2:0004  push     di
  07E2:0005  lcall    0x1c71, 0x72d
  07E2:000A  mov      word ptr [0x18a], ax
  07E2:000D  lcall    0x1c71, 0x5fe
  07E3:0002  lcall    0x1c71, 0x291
  07E3:0007  mov      di, 0x7e
  07E3:000A  push     ds
  07E3:000B  push     di
  07E3:000C  lcall    0x1c71, 0x72d
  07E4:0001  mov      word ptr [0x188], ax
  07E4:0004  lcall    0x1c71, 0x5fe
  07E4:0009  lcall    0x1c71, 0x291
  07E4:000E  mov      di, 0x7e
  07E5:0001  push     ds
  07E5:0002  push     di
  07E5:0003  lcall    0x1c71, 0x72d
  07E5:0008  mov      word ptr [0x184], ax
  07E5:000B  lcall    0x1c71, 0x5fe
  07E6:0000  lcall    0x1c71, 0x291
  07E6:0005  mov      di, 0x7e
  07E6:0008  push     ds
  07E6:0009  push     di
  07E6:000A  lcall    0x1c71, 0x72d
  07E6:000F  mov      word ptr [0x222], ax
  07E7:0002  lcall    0x1c71, 0x5fe
  07E7:0007  lcall    0x1c71, 0x291
  07E7:000C  mov      di, 0x7e
  07E7:000F  push     ds
  07E8:0000  push     di
  07E8:0001  lcall    0x1c71, 0x72d
  07E8:0006  mov      word ptr [0x1d4], ax
  07E8:0009  lcall    0x1c71, 0x5fe
  07E8:000E  lcall    0x1c71, 0x291
  07E9:0003  mov      di, 0x7e
  07E9:0006  push     ds
  07E9:0007  push     di
  07E9:0008  lcall    0x1c71, 0x72d
  07E9:000D  mov      word ptr [0x19c], ax
  07EA:0000  lcall    0x1c71, 0x5fe
  07EA:0005  lcall    0x1c71, 0x291
  07EA:000A  mov      ax, word ptr [0x19c]
  07EA:000D  cdq      
  07EA:000E  mov      cx, 4
  07EB:0001  idiv     cx
  07EB:0003  mov      word ptr [0x19c], ax
  07EB:0006  mov      ax, word ptr [0x19c]
  07EB:0009  sub      ax, 0x28
  07EB:000C  mov      word ptr [0x19c], ax
  07EB:000F  mov      di, 0x7e
  07EC:0002  push     ds
  07EC:0003  push     di
  07EC:0004  lcall    0x1c71, 0x72d
  07EC:0009  mov      word ptr [0x180], ax
  07EC:000C  lcall    0x1c71, 0x5fe
  07ED:0001  lcall    0x1c71, 0x291
  07ED:0006  mov      di, 0x7e
  07ED:0009  push     ds
  07ED:000A  push     di
  07ED:000B  lcall    0x1c71, 0x72d
  07EE:0000  mov      word ptr [0x190], ax
  07EE:0003  lcall    0x1c71, 0x5fe
  07EE:0008  lcall    0x1c71, 0x291
  07EE:000D  mov      ax, word ptr [0x190]
  07EF:0000  sub      ax, 0xc
  07EF:0003  mov      word ptr [0x190], ax
  07EF:0006  mov      di, 0x7e
  07EF:0009  push     ds
  07EF:000A  push     di
  07EF:000B  lcall    0x1c71, 0x72d
  07F0:0000  mov      word ptr [0x18e], ax
  07F0:0003  lcall    0x1c71, 0x5fe
  07F0:0008  lcall    0x1c71, 0x291
  07F0:000D  mov      ax, word ptr [0x18e]
  07F1:0000  add      ax, 0x18
  07F1:0003  mov      word ptr [0x18e], ax
  07F1:0006  mov      di, 0x7e
  07F1:0009  push     ds
  07F1:000A  push     di
  07F1:000B  lcall    0x1c71, 0x72d
  07F2:0000  mov      word ptr [0x18c], ax
  07F2:0003  lcall    0x1c71, 0x5fe
  07F2:0008  lcall    0x1c71, 0x291
  07F2:000D  mov      di, 0x7e
  07F3:0000  push     ds
  07F3:0001  push     di
  07F3:0002  lcall    0x1c71, 0x72d
  07F3:0007  mov      word ptr [0x194], ax
  07F3:000A  lcall    0x1c71, 0x5fe
  07F3:000F  lcall    0x1c71, 0x291
  07F4:0004  mov      di, 0x7e
  07F4:0007  push     ds
  07F4:0008  push     di
  07F4:0009  lcall    0x1c71, 0x72d
  07F4:000E  mov      word ptr [0x6c], ax
  07F5:0001  lcall    0x1c71, 0x5fe
  07F5:0006  lcall    0x1c71, 0x291
  07F5:000B  mov      di, 0x7e
  07F5:000E  push     ds
  07F5:000F  push     di
  07F6:0000  lcall    0x1c71, 0x72d
  07F6:0005  mov      word ptr [0x52], ax
  07F6:0008  lcall    0x1c71, 0x5fe
  07F6:000D  lcall    0x1c71, 0x291
  07F7:0002  mov      di, 0x7e
  07F7:0005  push     ds
  07F7:0006  push     di
  07F7:0007  lcall    0x1c71, 0x72d
  07F7:000C  mov      word ptr [0x1b2], ax
  07F7:000F  lcall    0x1c71, 0x5fe
  07F8:0004  lcall    0x1c71, 0x291
  07F8:0009  mov      di, 0x7e
  07F8:000C  push     ds
  07F8:000D  push     di
  07F8:000E  lcall    0x1c71, 0x72d
  07F9:0003  mov      word ptr [0x21a], ax
  07F9:0006  mov      word ptr [0x21c], dx
  07F9:000A  lcall    0x1c71, 0x5fe
  07F9:000F  lcall    0x1c71, 0x291
  07FA:0004  mov      ax, word ptr [0x18c]
  07FA:0007  cdq      
  07FA:0008  mov      cx, ax
  07FA:000A  mov      bx, dx
  07FA:000C  mov      ax, word ptr [0x21a]
  07FA:000F  mov      dx, word ptr [0x21c]
  07FB:0003  lcall    0x1c71, 0x7fa
  07FB:0008  mov      word ptr [0x21a], ax
  07FB:000B  mov      word ptr [0x21c], dx
  07FB:000F  mov      di, 0x7e
  07FC:0002  push     ds
  07FC:0003  push     di
  07FC:0004  lcall    0x1c71, 0x72d
  07FC:0009  mov      word ptr [0x212], ax
  07FC:000C  lcall    0x1c71, 0x5fe
  07FD:0001  lcall    0x1c71, 0x291
  07FD:0006  mov      di, 0x7e
  07FD:0009  push     ds
  07FD:000A  push     di
  07FD:000B  lcall    0x1c71, 0x72d
  07FE:0000  mov      word ptr [0x664], ax
  07FE:0003  lcall    0x1c71, 0x5fe
  07FE:0008  lcall    0x1c71, 0x291
  07FE:000D  mov      di, 0x7e
  07FF:0000  push     ds
  07FF:0001  push     di
  07FF:0002  lcall    0x1c71, 0x72d
  07FF:0007  mov      word ptr [0x62], ax
  07FF:000A  lcall    0x1c71, 0x5fe
  07FF:000F  lcall    0x1c71, 0x291
  0800:0004  mov      di, 0x7e
  0800:0007  push     ds
  0800:0008  push     di
  0800:0009  lcall    0x1c71, 0x72d
  0800:000E  mov      byte ptr [0x25d], al
  0801:0001  lcall    0x1c71, 0x5fe
  0801:0006  lcall    0x1c71, 0x291
  0801:000B  mov      di, 0x7e
  0801:000E  push     ds
  0801:000F  push     di
  0802:0000  lcall    0x1c71, 0x72d
  0802:0005  mov      word ptr [0x1ae], ax
  0802:0008  lcall    0x1c71, 0x5fe
  0802:000D  lcall    0x1c71, 0x291
  0803:0002  mov      di, 0x7e
  0803:0005  push     ds
  0803:0006  push     di
  0803:0007  lcall    0x1c71, 0x72d
  0803:000C  mov      word ptr [0x198], ax
  0803:000F  lcall    0x1c71, 0x5fe
  0804:0004  lcall    0x1c71, 0x291
  0804:0009  mov      di, 0x7e
  0804:000C  push     ds
  0804:000D  push     di
  0804:000E  lcall    0x1c71, 0x72d
  0805:0003  mov      word ptr [0x19a], ax
  0805:0006  lcall    0x1c71, 0x5fe
  0805:000B  lcall    0x1c71, 0x291
  0806:0000  mov      di, 0x7e
  0806:0003  push     ds
  0806:0004  push     di
  0806:0005  lcall    0x1c71, 0x72d
  0806:000A  mov      word ptr [0x196], ax
  0806:000D  lcall    0x1c71, 0x5fe
  0807:0002  lcall    0x1c71, 0x291
  0807:0007  mov      di, 0x7e
  0807:000A  push     ds
  0807:000B  push     di
  0807:000C  lcall    0x1c71, 0x72d
  0808:0001  mov      word ptr [0x182], ax
  0808:0004  lcall    0x1c71, 0x5fe
  0808:0009  lcall    0x1c71, 0x291
  0808:000E  mov      di, 0x7e
  0809:0001  push     ds
  0809:0002  push     di
  0809:0003  lcall    0x1c71, 0x72d
  0809:0008  mov      word ptr [0x1c2], ax
  0809:000B  lcall    0x1c71, 0x5fe
  080A:0000  lcall    0x1c71, 0x291
  080A:0005  mov      di, 0x7e
  080A:0008  push     ds
  080A:0009  push     di
  080A:000A  lcall    0x1c71, 0x72d
  080A:000F  mov      word ptr [0x224], ax
  080B:0002  lcall    0x1c71, 0x5fe
  080B:0007  lcall    0x1c71, 0x291
  080B:000C  mov      di, 0x7e
  080B:000F  push     ds
  080C:0000  push     di
  080C:0001  lcall    0x1c71, 0x72d
  080C:0006  mov      word ptr [0x54], ax
  080C:0009  lcall    0x1c71, 0x5fe
  080C:000E  lcall    0x1c71, 0x291
  080D:0003  mov      di, 0x7e
  080D:0006  push     ds
  080D:0007  push     di
  080D:0008  lcall    0x1c71, 0x72d
  080D:000D  mov      word ptr [0x218], ax
  080E:0000  lcall    0x1c71, 0x5fe
  080E:0005  lcall    0x1c71, 0x291
  080E:000A  mov      di, 0x7e
  080E:000D  push     ds
  080E:000E  push     di
  080E:000F  lcall    0x1c71, 0x72d
  080F:0004  mov      word ptr [0x686], ax
  080F:0007  lcall    0x1c71, 0x5fe
  080F:000C  lcall    0x1c71, 0x291
  0810:0001  mov      di, 0x7e
  0810:0004  push     ds
  0810:0005  push     di
  0810:0006  lcall    0x1c71, 0x72d
  0810:000B  mov      word ptr [0x56], ax
  0810:000E  lcall    0x1c71, 0x5fe
  0811:0003  lcall    0x1c71, 0x291
  0811:0008  mov      di, 0x7e
  0811:000B  push     ds
  0811:000C  push     di
  0811:000D  lcall    0x1c71, 0x72d
  0812:0002  mov      word ptr [0x58], ax
  0812:0005  lcall    0x1c71, 0x5fe
  0812:000A  lcall    0x1c71, 0x291
  0812:000F  mov      di, 0x7e
  0813:0002  push     ds
  0813:0003  push     di
  0813:0004  lcall    0x1c71, 0x72d
  0813:0009  mov      word ptr [0x68c], ax
  0813:000C  lcall    0x1c71, 0x5fe
  0814:0001  lcall    0x1c71, 0x291
  0814:0006  mov      di, 0x7e
  0814:0009  push     ds
  0814:000A  push     di
  0814:000B  lcall    0x1c71, 0x72d
  0815:0000  mov      word ptr [0x5a], ax
  0815:0003  lcall    0x1c71, 0x5fe
  0815:0008  lcall    0x1c71, 0x291
  0815:000D  mov      di, 0x7e
  0816:0000  push     ds
  0816:0001  push     di
  0816:0002  lcall    0x1c71, 0x72d
  0816:0007  mov      word ptr [0x5c], ax
  0816:000A  lcall    0x1c71, 0x5fe
  0816:000F  lcall    0x1c71, 0x291
  0817:0004  mov      di, 0x7e
  0817:0007  push     ds
  0817:0008  push     di
  0817:0009  lcall    0x1c71, 0x72d
  0817:000E  mov      word ptr [0x5e], ax
  0818:0001  lcall    0x1c71, 0x5fe
  0818:0006  lcall    0x1c71, 0x291
  0818:000B  mov      di, 0x7e
  0818:000E  push     ds
  0818:000F  push     di
  0819:0000  lcall    0x1c71, 0x72d
  0819:0005  mov      word ptr [0x60], ax
  0819:0008  lcall    0x1c71, 0x5fe
  0819:000D  lcall    0x1c71, 0x291
  081A:0002  mov      di, 0x7e
  081A:0005  push     ds
  081A:0006  push     di
  081A:0007  lcall    0x1c71, 0x72d
  081A:000C  mov      word ptr [0x6e], ax
  081A:000F  lcall    0x1c71, 0x5fe
  081B:0004  lcall    0x1c71, 0x291
  081B:0009  mov      di, 0x7e
  081B:000C  push     ds
  081B:000D  push     di
  081B:000E  lcall    0x1c71, 0x72d
  081C:0003  mov      byte ptr [0x258], al
  081C:0006  lcall    0x1c71, 0x5fe
  081C:000B  lcall    0x1c71, 0x291
  081D:0000  mov      di, 0x7e
  081D:0003  push     ds
  081D:0004  push     di
  081D:0005  lcall    0x1c71, 0x72d
  081D:000A  mov      word ptr [0x74], ax
  081D:000D  lcall    0x1c71, 0x5fe
  081E:0002  lcall    0x1c71, 0x291
  081E:0007  mov      di, 0x7e
  081E:000A  push     ds
  081E:000B  push     di
  081E:000C  lcall    0x1c71, 0x72d
  081F:0001  mov      word ptr [0x76], ax
  081F:0004  lcall    0x1c71, 0x5fe
  081F:0009  lcall    0x1c71, 0x291
  081F:000E  mov      di, 0x7e
  0820:0001  push     ds
  0820:0002  push     di
  0820:0003  lcall    0x1c71, 0x72d
  0820:0008  mov      word ptr [0x186], ax
  0820:000B  lcall    0x1c71, 0x5fe
  0821:0000  lcall    0x1c71, 0x291
  0821:0005  mov      di, 0x7e
  0821:0008  push     ds
  0821:0009  push     di
  0821:000A  lcall    0x1c71, 0x72d
  0821:000F  mov      word ptr [0x192], ax
  0822:0002  lcall    0x1c71, 0x5fe
  0822:0007  lcall    0x1c71, 0x291
  0822:000C  mov      di, 0x7e
  0822:000F  push     ds
  0823:0000  push     di
  0823:0001  lcall    0x1c71, 0x72d
  0823:0006  mov      word ptr [0x1a2], ax
  0823:0009  lcall    0x1c71, 0x5fe
  0823:000E  .byte    0x9a
  0823:000F  xchg     cx, ax
  0824:0000  .byte    0x02

; ======== proc_0E42_9A57  ========  (cell para 0E42:ofs 9A57, img17E77)
  17E7:0007  jno      0x17e95
  17E7:0009  lcall    0x1c71, 0x291
  17E7:000E  mov      ax, 0x7d0
  17E8:0001  push     ax
  17E8:0002  lcall    0x1c0f, 0x2a8
  17E8:0007  cmp      word ptr [0x1c8], 0
  17E8:000C  jg       0x17e91
  17E8:000E  jmp      0x17f8d
  17E9:0001  mov      ax, word ptr [0x1ac]
  17E9:0004  cmp      ax, word ptr [0x1ca]
  17E9:0008  jg       0x17e9d
  17E9:000A  jmp      0x17f8d
  17E9:000D  mov      ax, word ptr [0x19c]
  17EA:0000  cmp      ax, word ptr [0x1cc]
  17EA:0004  jl       0x17ea9
  17EA:0006  jmp      0x17f8d
  17EA:0009  mov      ax, 0x64
  17EA:000C  push     ax
  17EA:000D  lcall    0x1c71, 0xbe4
  17EB:0002  mov      word ptr [0x19e], ax
  17EB:0005  mov      ax, word ptr [0x1c8]
  17EB:0008  sub      ax, 0xa
  17EB:000B  cmp      ax, word ptr [0x19e]
  17EB:000F  jge      0x17ec4
  17EC:0001  jmp      0x17f51
  17EC:0004  mov      al, byte ptr [0x25c]
  17EC:0007  cwde     
  17EC:0008  push     ax
  17EC:0009  lcall    0x1c71, 0xbe4
  17EC:000E  push     ax
  17EC:000F  mov      ax, 0xa
  17ED:0002  push     ax
  17ED:0003  lcall    0x1c71, 0xbe4
  17ED:0008  pop      dx
  17ED:0009  add      ax, dx
  17ED:000B  mov      word ptr [0x19e], ax
  17ED:000E  mov      al, 0xe
  17EE:0000  push     ax
  17EE:0001  lcall    0x1c0f, 0x263
  17EE:0006  mov      di, 0x7a2
  17EE:0009  push     ds
  17EE:000A  push     di
  17EE:000B  mov      di, 0x4363
  17EE:000E  push     cs
  17EE:000F  push     di
  17EF:0000  xor      ax, ax
  17EF:0002  push     ax
  17EF:0003  lcall    0x1c71, 0x701
  17EF:0008  mov      ax, word ptr [0x19e]
  17EF:000B  cdq      
  17EF:000C  push     dx
  17EF:000D  push     ax
  17EF:000E  xor      ax, ax
  17F0:0000  push     ax
  17F0:0001  lcall    0x1c71, 0x789
  17F0:0006  mov      di, 0x41e0
  17F0:0009  push     cs
  17F0:000A  push     di
  17F0:000B  xor      ax, ax
  17F0:000D  push     ax
  17F0:000E  lcall    0x1c71, 0x701
  17F1:0003  lcall    0x1c71, 0x5dd
  17F1:0008  lcall    0x1c71, 0x291
  17F1:000D  mov      al, 0xf
  17F1:000F  push     ax
  17F2:0000  lcall    0x1c0f, 0x263
  17F2:0005  mov      ax, 3
  17F2:0008  push     ax
  17F2:0009  lcall    0x1c71, 0xbe4
  17F2:000E  xor      dx, dx
  17F3:0000  mov      cx, ax
  17F3:0002  mov      bx, dx
  17F3:0004  mov      ax, word ptr [0x1ac]
  17F3:0007  cdq      
  17F3:0008  sub      ax, cx
  17F3:000A  sbb      dx, bx
  17F3:000C  sub      ax, 3
  17F3:000F  sbb      dx, 0
  17F4:0002  mov      word ptr [0x1ac], ax
  17F4:0005  mov      ax, word ptr [0x1b0]
  17F4:0008  sub      ax, word ptr [0x19e]
  17F4:000C  mov      word ptr [0x1b0], ax
  17F4:000F  jmp      0x17f6d
  17F5:0001  mov      di, 0x7a2
  17F5:0004  push     ds
  17F5:0005  push     di
  17F5:0006  mov      di, 0x437b
  17F5:0009  push     cs
  17F5:000A  push     di
  17F5:000B  xor      ax, ax
  17F5:000D  push     ax
  17F5:000E  lcall    0x1c71, 0x701
  17F6:0003  lcall    0x1c71, 0x5dd
  17F6:0008  lcall    0x1c71, 0x291
  17F6:000D  mov      ax, 2
  17F7:0000  push     ax
  17F7:0001  lcall    0x1c71, 0xbe4
  17F7:0006  xor      dx, dx
  17F7:0008  mov      cx, ax
  17F7:000A  mov      bx, dx
  17F7:000C  mov      ax, word ptr [0x1ac]
  17F7:000F  cdq      
  17F8:0000  sub      ax, cx
  17F8:0002  sbb      dx, bx
  17F8:0004  sub      ax, 2
  17F8:0007  sbb      dx, 0
  17F8:000A  mov      word ptr [0x1ac], ax
  17F8:000D  cmp      word ptr [0x1ce], 0
  17F9:0002  jle      0x1800b
  17F9:0004  mov      ax, word ptr [0x19c]
  17F9:0007  cmp      ax, word ptr [0x1d0]
  17F9:000B  jge      0x1800b
  17F9:000D  cmp      word ptr [0x1ac], 0xe
  17FA:0002  jle      0x1800b
  17FA:0004  mov      ax, word ptr [0x1ac]
  17FA:0007  sub      ax, 0xf
  17FA:000A  mov      word ptr [0x1ac], ax
  17FA:000D  mov      ax, 0x64
  17FB:0000  push     ax
  17FB:0001  lcall    0x1c71, 0xbe4
  17FB:0006  mov      word ptr [0x19e], ax
  17FB:0009  mov      ax, word ptr [0x19e]
  17FB:000C  cmp      ax, word ptr [0x1ce]
  17FC:0000  jg       0x17fef
  17FC:0002  mov      word ptr [0x1d2], 1
  17FC:0008  mov      di, 0x7a2
  17FC:000B  push     ds
  17FC:000C  push     di
  17FC:000D  mov      di, 0x439e
  17FD:0000  push     cs
  17FD:0001  push     di
  17FD:0002  xor      ax, ax
  17FD:0004  push     ax
  17FD:0005  lcall    0x1c71, 0x701
  17FD:000A  lcall    0x1c71, 0x5dd
  17FD:000F  lcall    0x1c71, 0x291
  17FE:0004  mov      ax, word ptr [0x1d4]
  17FE:0007  sub      ax, 0x14
  17FE:000A  mov      word ptr [0x1d4], ax
  17FE:000D  jmp      0x1800b
  17FE:000F  mov      di, 0x7a2
  17FF:0002  push     ds
  17FF:0003  push     di
  17FF:0004  mov      di, 0x43d1
  17FF:0007  push     cs
  17FF:0008  push     di
  17FF:0009  xor      ax, ax
  17FF:000B  push     ax
  17FF:000C  lcall    0x1c71, 0x701
  1800:0001  lcall    0x1c71, 0x5dd
  1800:0006  lcall    0x1c71, 0x291
  1800:000B  cmp      word ptr [0x19c], 1
  1801:0000  jl       0x18023
  1801:0002  cmp      word ptr [0x1b0], 1
  1801:0007  jl       0x18023
  1801:0009  cmp      word ptr [0x1d2], 1
  1801:000E  je       0x18023
  1802:0000  jmp      0x173bc
  1802:0003  cmp      word ptr [0x1b0], 1
  1802:0008  jl       0x1802d
  1802:000A  jmp      0x1818e
  1802:000D  cmp      word ptr [0x19c], 0
  1803:0002  jg       0x18037
  1803:0004  jmp      0x1818e
  1803:0007  cmp      word ptr [0x664], 0x4b
  1803:000C  jle      0x18046
  1803:000E  mov      ax, word ptr [0x1b4]
  1804:0001  dec      ax
  1804:0002  dec      ax
  1804:0003  mov      word ptr [0x1b4], ax
  1804:0006  cmp      word ptr [0x664], 0x73
  1804:000B  jle      0x18056
  1804:000D  mov      ax, word ptr [0x1b4]
  1805:0000  sub      ax, 3
  1805:0003  mov      word ptr [0x1b4], ax
  1805:0006  cmp      word ptr [0x1c6], 0x32
  1805:000B  jle      0x18065
  1805:000D  mov      ax, word ptr [0x1b4]
  1806:0000  dec      ax
  1806:0001  dec      ax
  1806:0002  mov      word ptr [0x1b4], ax
  1806:0005  cmp      word ptr [0x1c6], 0x4b
  1806:000A  jle      0x18074
  1806:000C  mov      ax, word ptr [0x1b4]
  1806:000F  dec      ax
  1807:0000  dec      ax
  1807:0001  mov      word ptr [0x1b4], ax
  1807:0004  cmp      word ptr [0x1c6], 0x5f
  1807:0009  jle      0x18082
  1807:000B  mov      ax, word ptr [0x1b4]
  1807:000E  dec      ax
  1807:000F  mov      word ptr [0x1b4], ax
  1808:0002  cmp      word ptr [0x1c8], 0x32
  1808:0007  jle      0x18092
  1808:0009  mov      ax, word ptr [0x1b4]
  1808:000C  sub      ax, 5
  1808:000F  mov      word ptr [0x1b4], ax
  1809:0002  cmp      word ptr [0x1c8], 0x5f
  1809:0007  jle      0x180a1
  1809:0009  mov      ax, word ptr [0x1b4]
  1809:000C  dec      ax
  1809:000D  dec      ax
  1809:000E  mov      word ptr [0x1b4], ax
  180A:0001  cmp      word ptr [0x1b4], 0
  180A:0006  jge      0x180ad
  180A:0008  xor      ax, ax
  180A:000A  mov      word ptr [0x1b4], ax
  180A:000D  mov      di, 0x7a2
  180B:0000  push     ds
  180B:0001  push     di
  180B:0002  mov      di, 0x4401
  180B:0005  push     cs
  180B:0006  push     di
  180B:0007  xor      ax, ax
  180B:0009  push     ax
  180B:000A  lcall    0x1c71, 0x701
  180B:000F  mov      ax, word ptr [0x1b4]
  180C:0002  cdq      
  180C:0003  push     dx
  180C:0004  push     ax
  180C:0005  xor      ax, ax
  180C:0007  push     ax
  180C:0008  lcall    0x1c71, 0x789
  180C:000D  mov      di, 0x441f
  180D:0000  push     cs
  180D:0001  push     di
  180D:0002  xor      ax, ax
  180D:0004  push     ax
  180D:0005  lcall    0x1c71, 0x701
  180D:000A  lcall    0x1c71, 0x5dd
  180D:000F  lcall    0x1c71, 0x291
  180E:0004  mov      ax, word ptr [0x1b4]
  180E:0007  add      ax, word ptr [0x1d4]
  180E:000B  mov      word ptr [0x1d4], ax
  180E:000E  mov      byte ptr [0x25e], 0
  180F:0003  mov      byte ptr [0x25f], 0
  180F:0008  cmp      word ptr [0x248], 0
  180F:000D  jle      0x18106
  180F:000F  mov      ax, word ptr [0x24a]
  1810:0002  dec      ax
  1810:0003  mov      word ptr [0x24a], ax
  1810:0006  cmp      byte ptr [0x258], 0
  1810:000B  jg       0x18110
  1810:000D  jmp      0x1818e
  1811:0000  mov      ax, 0x64
  1811:0003  push     ax
  1811:0004  lcall    0x1c71, 0xbe4
  1811:0009  mov      word ptr [0x19e], ax
  1811:000C  mov      al, byte ptr [0x258]
  1811:000F  cwde     
  1812:0000  cmp      ax, word ptr [0x19e]
  1812:0004  jle      0x1818e
  1812:0006  mov      di, 0x7a2
  1812:0009  push     ds
  1812:000A  push     di
  1812:000B  mov      di, 0x4429
  1812:000E  push     cs
  1812:000F  push     di
  1813:0000  xor      ax, ax
  1813:0002  push     ax
  1813:0003  lcall    0x1c71, 0x701
  1813:0008  lcall    0x1c71, 0x5dd
  1813:000D  lcall    0x1c71, 0x291
  1814:0002  mov      al, byte ptr [0x259]
  1814:0005  cwde     
  1814:0006  sub      ax, 0xa
  1814:0009  mov      byte ptr [0x259], al
  1814:000C  mov      ax, word ptr [0x182]
  1814:000F  inc      ax
  1815:0000  mov      word ptr [0x182], ax
  1815:0003  cmp      word ptr [0x19e], 1
  1815:0008  jge      0x1818e
  1815:000A  cmp      byte ptr [0x258], 0x64
  1815:000F  jge      0x1818e
  1816:0001  mov      di, 0x7a2
  1816:0004  push     ds
  1816:0005  push     di
  1816:0006  mov      di, 0x445c
  1816:0009  push     cs
  1816:000A  push     di
  1816:000B  xor      ax, ax
  1816:000D  push     ax
  1816:000E  lcall    0x1c71, 0x701
  1817:0003  lcall    0x1c71, 0x5dd
  1817:0008  lcall    0x1c71, 0x291
  1817:000D  mov      al, byte ptr [0x258]
  1818:0000  cwde     
  1818:0001  inc      ax
  1818:0002  mov      byte ptr [0x258], al
  1818:0005  mov      ax, word ptr [0x1d4]
  1818:0008  add      ax, 0xa
  1818:000B  mov      word ptr [0x1d4], ax
  1818:000E  cmp      word ptr [0x19c], 1
  1819:0003  jge      0x181c0
  1819:0005  mov      di, 0x7a2
  1819:0008  push     ds
  1819:0009  push     di
  1819:000A  mov      di, 0x447f
  1819:000D  push     cs
  1819:000E  push     di
  1819:000F  xor      ax, ax
  181A:0001  push     ax
  181A:0002  lcall    0x1c71, 0x701
  181A:0007  lcall    0x1c71, 0x5dd
  181A:000C  lcall    0x1c71, 0x291
  181B:0001  mov      ax, 0xbb8
  181B:0004  push     ax
  181B:0005  lcall    0x1c0f, 0x2a8
  181B:000A  mov      word ptr [0x1d6], 0x2710
  181C:0000  xor      ax, ax
  181C:0002  mov      word ptr [0x1b4], ax
  181C:0005  pop      bp
  181C:0006  retf     


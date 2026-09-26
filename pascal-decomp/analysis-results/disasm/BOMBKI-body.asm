; ==================== BOMBKI.EXE  game-proc bodies ====================
; loader-fixed far cells that target paragraphs 0E42 / 05DD are the body entries;
; recursive-descent from each (para:ofs); capstone x86/16.
; image 120048 B  base img52E0

; ===================== proc 0E42:9A57  (from cell) =====================
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

; ===================== proc 05DD:1C71  (from cell) =====================
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

; ===================== proc 0000:0000  (from exeip) =====================
  0000:0000  cmovle   cx, word ptr [bx + 0x53]
  0000:0004  dec      cx
  0000:0005  push     bx
  0000:0006  pop      dx
  0000:0007  and      byte ptr [bp + si + 0x45], bl
  0000:000A  and      byte ptr [bp + di + 0x4f], dl
  0000:000D  inc      dx
  0000:000E  inc      cx
  0000:000F  cmp      dl, byte ptr [bx]
  0001:0001  push     bx
  0001:0002  push     sp
  0001:0003  inc      cx
  0001:0004  push     dx
  0001:0005  pop      cx
  0001:0006  and      byte ptr [bp + si + 0x41], bl
  0001:0009  push     dx
  0001:000A  inc      sp
  0001:000B  pop      dx
  0001:000C  inc      bp
  0001:000D  push     di
  0001:000E  dec      cx
  0001:000F  inc      cx
  0002:0000  dec      sp
  0002:0001  pop      cx
  0002:0002  and      byte ptr [di + 0x49], cl
  0002:0005  inc      bp
  0002:0006  inc      bx
  0002:0007  pop      dx
  0002:0008  adc      cx, word ptr [bx + 0x4b]
  0002:000B  push     dx
  0002:000C  inc      cx
  0002:000D  inc      di
  0002:000E  dec      sp
  0002:000F  inc      cx
  0003:0000  and      byte ptr [di + 0x41], cl
  0003:0003  dec      sp
  0003:0004  inc      cx
  0003:0005  and      byte ptr [si + 0x41], dl
  0003:0008  push     dx
  0003:0009  inc      bx
  0003:000A  pop      dx
  0003:000B  inc      cx
  0003:000C  adc      word ptr [bp + si + 0x41], bx
  0003:000F  dec      bx
  0004:0000  push     dx
  0004:0001  push     di
  0004:0002  inc      cx
  0004:0003  push     di
  0004:0004  dec      cx
  0004:0005  dec      di
  0004:0006  dec      si
  0004:0007  inc      bp
  0004:0008  and      byte ptr [bp + di + 0x45], dl
  0004:000B  push     dx
  0004:000C  inc      bx
  0004:000D  inc      bp
  0004:000E  adc      word ptr [si + 0x59], ax
  0005:0001  push     ax
  0005:0002  dec      sp
  0005:0003  dec      di
  0005:0004  dec      bp
  0005:0005  and      byte ptr [di + 0x55], cl
  0005:0008  inc      sp
  0005:0009  and      byte ptr [bp + di + 0x5a], dl
  0005:000C  dec      bx
  0005:000D  dec      di
  0005:000E  dec      sp
  0005:000F  pop      cx
  0006:0000  push     ds
  0006:0001  push     bx
  0006:0002  dec      bp
  0006:0003  inc      cx
  0006:0004  inc      bx
  0006:0005  pop      dx
  0006:0006  dec      si
  0006:0007  pop      cx
  0006:0008  and      byte ptr [bx + si + 0x4f], dl
  0006:000B  dec      sp
  0006:000C  inc      cx
  0006:000D  dec      si
  0006:000E  pop      cx
  0006:000F  and      byte ptr [si + 0x49], cl
  0007:0002  dec      bx
  0007:0003  dec      cx
  0007:0004  inc      bp
  0007:0005  push     dx
  0007:0006  inc      bp
  0007:0007  dec      bp
  0007:0008  and      byte ptr [bx + si + 0x41], dl
  0007:000B  inc      bx
  0007:000C  pop      dx
  0007:000D  inc      bp
  0007:000E  dec      bx
  0007:000F  adc      byte ptr [bp + di + 0x4d], dl
  0008:0002  inc      cx
  0008:0003  inc      bx
  0008:0004  pop      dx
  0008:0005  dec      si
  0008:0006  inc      bp
  0008:0007  and      byte ptr [bp + di + 0x49], al
  0008:000A  inc      cx
  0008:000B  push     bx
  0008:000C  push     sp
  0008:000D  dec      bx
  0008:000E  dec      di
  0008:000F  and      byte ptr [bp + si], dl
  0009:0001  push     sp
  0009:0002  push     di
  0009:0003  inc      cx
  0009:0004  push     dx
  0009:0005  inc      sp
  0009:0006  inc      cx
  0009:0007  and      byte ptr [bp + di + 0x55], dl
  0009:000A  inc      bx
  0009:000B  dec      ax
  0009:000C  inc      cx
  0009:000D  and      byte ptr [bp + si + 0x41], dl
  000A:0000  inc      bx
  000A:0001  dec      dx
  000A:0002  inc      bp
  000A:0003  push     ss
  000A:0004  dec      di
  000A:0005  dec      bx
  000A:0006  push     dx
  000A:0007  inc      cx
  000A:0008  inc      di
  000A:0009  dec      sp
  000A:000A  inc      cx
  000A:000B  and      byte ptr [bx + si + 0x41], dl
  000A:000E  inc      bx
  000A:000F  dec      ax
  000B:0000  dec      si
  000B:0001  inc      cx
  000B:0002  inc      bx
  000B:0003  inc      cx
  000B:0004  and      byte ptr [bp + si + 0x55], al
  000B:0007  dec      sp
  000B:0008  dec      bx
  000B:0009  inc      cx
  000B:000A  adc      word ptr [si + 0x55], ax
  000B:000D  pop      dx
  000B:000E  pop      cx
  000B:000F  and      byte ptr [bp + di + 0x49], al
  000C:0002  inc      bp
  000C:0003  push     ax
  000C:0004  dec      sp
  000C:0005  pop      cx
  000C:0006  and      byte ptr [bp + di + 0x48], al
  000C:0009  dec      sp
  000C:000A  inc      bp
  000C:000B  inc      dx
  000C:000C  adc      al, 0x44
  000C:000E  dec      sp
  000C:000F  push     bp
  000D:0000  inc      di
  000D:0001  inc      cx
  000D:0002  and      byte ptr [bx + di + 0x20], cl
  000D:0005  push     bx
  000D:0006  dec      bp
  000D:0007  inc      cx
  000D:0008  inc      bx
  000D:0009  pop      dx
  000D:000A  dec      si
  000D:000B  inc      cx
  000D:000C  and      byte ptr [bx + 0x45], dl
  000D:000F  dec      bx
  000E:0000  inc      bp
  000E:0001  push     ds
  000E:0002  push     ax
  000E:0003  pop      cx
  000E:0004  push     bx
  000E:0005  pop      dx
  000E:0006  dec      si
  000E:0007  pop      cx
  000E:0008  and      byte ptr [bp + si + 0x49], al
  000E:000B  inc      di
  000E:000C  dec      di
  000E:000D  push     bx
  000E:000E  and      byte ptr [bp + si + 0x20], bl
  000F:0001  dec      bx
  000F:0002  inc      cx
  000F:0003  push     ax
  000F:0004  push     bp
  000F:0005  push     bx
  000F:0006  push     sp
  000F:0007  inc      cx
  000F:0008  and      byte ptr [bp + si + 0x20], bl
  000F:000B  push     di
  000F:000C  push     dx
  000F:000D  dec      di
  000F:000E  inc      di
  000F:000F  inc      cx
  0010:0000  daa      
  0010:0001  dec      di
  0010:0002  pop      dx
  0010:0003  inc      bp
  0010:0004  push     di
  0010:0005  dec      cx
  0010:0006  inc      cx
  0010:0007  dec      dx
  0010:0008  inc      cx
  0010:0009  inc      bx
  0010:000A  inc      bp
  0010:000B  and      byte ptr [bx + si + 0x49], dl
  0010:000E  push     di
  0010:000F  push     bx
  0011:0000  dec      bx
  0011:0001  dec      di
  0011:0002  and      byte ptr [bp + si + 0x20], bl
  0011:0005  dec      bx
  0011:0006  dec      di
  0011:0007  dec      si
  0011:0008  dec      bx
  0011:0009  push     dx
  0011:000A  inc      bp
  0011:000B  push     sp
  0011:000C  dec      si
  0011:000D  pop      cx
  0011:000E  dec      bp
  0011:000F  and      byte ptr [bp + di + 0x4c], cl
  0012:0002  dec      cx
  0012:0003  dec      bp
  0012:0004  inc      cx
  0012:0005  push     sp
  0012:0006  inc      bp
  0012:0007  dec      bp
  0012:0008  sbb      al, 0x43
  0012:000A  dec      cx
  0012:000B  inc      bp
  0012:000C  pop      dx
  0012:000D  dec      bx
  0012:000E  inc      cx
  0012:000F  and      byte ptr [bp + 0x41], al
  0013:0002  dec      dx
  0013:0003  dec      bx
  0013:0004  inc      cx
  0013:0005  and      byte ptr [bx + 0x44], cl
  0013:0008  and      byte ptr [si + 0x5a], al
  0013:000B  dec      cx
  0013:000C  inc      cx
  0013:000D  inc      sp
  0013:000E  inc      cx
  0013:000F  and      byte ptr [di + 0x52], cl
  0014:0002  dec      di
  0014:0003  pop      dx
  0014:0004  inc      cx
  0014:0005  sbb      word ptr [bp + di + 0x4f], cx
  0014:0008  dec      bp
  0014:0009  push     ax
  0014:000A  dec      sp
  0014:000B  inc      bp
  0014:000C  push     sp
  0014:000D  and      byte ptr [di + 0x42], dl
  0015:0000  push     dx
  0015:0001  inc      cx
  0015:0002  dec      si
  0015:0003  and      byte ptr [bp + 0x49], al
  0015:0006  push     dx
  0015:0007  dec      bp
  0015:0008  pop      cx
  0015:0009  and      byte ptr [bp + si], ah
  0015:000B  push     bx
  0015:000C  pop      cx
  0015:000D  inc      si
  0015:000E  and      dl, byte ptr [bp + si]
  0016:0000  inc      di
  0016:0001  inc      cx
  0016:0002  push     dx
  0016:0003  dec      si
  0016:0004  dec      cx
  0016:0005  push     sp
  0016:0006  push     bp
  0016:0007  push     dx
  0016:0008  and      byte ptr [bp + si + 0x20], bl
  0016:000B  dec      bx
  0016:000C  dec      di
  0016:000D  dec      sp
  0016:000E  inc      bx
  0016:000F  inc      cx
  0017:0000  dec      bp
  0017:0001  dec      cx
  0017:0002  adc      word ptr [di + 0x41], cx
  0017:0005  dec      sp
  0017:0006  inc      cx
  0017:0007  and      byte ptr [bp + si + 0x55], al
  0017:000A  push     sp
  0017:000B  inc      bp
  0017:000C  dec      sp
  0017:000D  dec      bx
  0017:000E  inc      bp
  0017:000F  and      byte ptr [di + 0x41], cl
  0018:0002  dec      si
  0018:0003  pop      cx
  0018:0004  push     ds
  0018:0005  inc      sp
  0018:0006  inc      bp
  0018:0007  dec      sp
  0018:0008  dec      cx
  0018:0009  dec      bx
  0018:000A  inc      cx
  0018:000B  push     sp
  0018:000C  dec      si
  0018:000D  pop      cx
  0018:000E  and      byte ptr [bp + di + 0x48], al
  0019:0001  dec      di
  0019:0002  inc      bx
  0019:0003  and      byte ptr [bp + di + 0x5a], dl
  0019:0006  dec      di
  0019:0007  push     dx
  0019:0008  push     bx
  0019:0009  push     sp
  0019:000A  dec      bx
  0019:000B  dec      cx
  0019:000C  and      byte ptr [si + 0x49], cl
  0019:000F  push     bx
  001A:0000  push     sp
  001A:0001  inc      bp
  001A:0002  dec      bx
  001A:0003  push     ds
  001A:0004  dec      bx
  001A:0005  inc      cx
  001A:0006  push     bx
  001A:0007  inc      bp
  001A:0008  push     sp
  001A:0009  inc      cx
  001A:000A  and      byte ptr [si + 0x49], cl
  001A:000D  push     dx
  001A:000E  dec      di
  001A:000F  pop      cx
  001B:0000  inc      cx
  001B:0001  and      byte ptr [bp + si], bh
  001B:0003  and      byte ptr [si + 0x20], cl
  001B:0006  sub      ax, 0x4a20
  001B:0009  inc      cx
  001B:000A  dec      bx
  001B:000B  and      byte ptr [si + 0x49], cl
  001B:000E  push     dx
  001B:000F  dec      di
  001C:0000  pop      cx
  001C:0001  and      byte ptr [di], bl
  001C:0003  push     ax
  001C:0004  dec      cx
  001C:0005  inc      di
  001C:0006  push     bp
  001C:0007  dec      sp
  001C:0008  dec      bx
  001C:0009  inc      cx
  001C:000A  and      byte ptr [si + 0x52], dl
  001C:000D  inc      cx
  001C:000E  dec      si
  001C:000F  push     bx
  001D:0000  push     ax
  001D:0001  dec      di
  001D:0002  push     dx
  001D:0003  push     sp
  001D:0004  push     bp
  001D:0005  dec      dx
  001D:0006  inc      cx
  001D:0007  inc      bx
  001D:0008  inc      cx
  001D:0009  and      byte ptr [bx + si], ch
  001D:000B  dec      bp
  001D:000C  cmp      al, byte ptr [bx + 0x29]
  001D:000F  and      byte ptr [bx], dh
  001E:0001  push     ax
  001E:0002  push     dx
  001E:0003  pop      dx
  001E:0004  inc      bp
  001E:0005  push     ax
  001E:0006  push     bp
  001E:0007  push     bx
  001E:0008  push     sp
  001E:0009  dec      bx
  001E:000A  inc      cx
  001E:000B  and      byte ptr [bx + 0x4c], dl
  001E:000E  inc      cx
  001E:000F  push     bx
  001F:0000  dec      si
  001F:0001  dec      di
  001F:0002  push     dx
  001F:0003  inc      bp
  001F:0004  inc      bx
  001F:0005  pop      dx
  001F:0006  dec      si
  001F:0007  dec      cx
  001F:0008  inc      bp
  001F:0009  and      byte ptr [bx + si + 0x4f], dl
  001F:000C  inc      sp
  001F:000D  push     ax
  001F:000E  dec      cx
  001F:000F  push     bx
  0020:0000  inc      cx
  0020:0001  dec      si
  0020:0002  inc      cx
  0020:0003  and      byte ptr [bx + si + 0x52], dl
  0020:0006  pop      dx
  0020:0007  inc      bp
  0020:0008  pop      dx
  0020:0009  and      byte ptr [bx + di + 0x55], dl
  0020:000C  inc      bp
  0020:000D  push     bx
  0020:000E  push     sp
  0020:000F  sub      ax, 0x414d
  0021:0002  push     bx
  0021:0003  push     sp
  0021:0004  inc      bp
  0021:0005  push     dx
  0021:0006  inc      cx
  0021:0007  and      byte ptr [bx], bl
  0021:0009  push     bx
  0021:000A  inc      bx
  0021:000B  push     dx
  0021:000C  dec      di
  0021:000D  dec      sp
  0021:000E  dec      sp
  0021:000F  and      byte ptr [bp + si + 0x20], bl
  0022:0002  inc      bx
  0022:0003  pop      dx
  0022:0004  inc      cx
  0022:0005  push     dx
  0022:0006  inc      bp
  0022:0007  dec      bp
  0022:0008  and      byte ptr [bp + si], bh
  0022:000A  and      byte ptr [bx + si + 0x4f], dl
  0022:000D  push     dx
  0022:000E  dec      di
  0022:000F  push     di
  0023:0000  dec      si
  0023:0001  pop      cx
  0023:0002  push     di
  0023:0003  inc      cx
  0023:0004  dec      si
  0023:0005  dec      cx
  0023:0006  inc      bp
  0023:0007  and      byte ptr [bx + di], bl
  0023:0009  push     bx
  0023:000A  inc      bx
  0023:000B  push     dx
  0023:000C  dec      di
  0023:000D  dec      sp
  0023:000E  dec      sp
  0023:000F  and      byte ptr [bp + si + 0x20], bl
  0024:0002  inc      bx
  0024:0003  pop      dx
  0024:0004  inc      cx
  0024:0005  push     dx
  0024:0006  inc      bp
  0024:0007  dec      bp
  0024:0008  and      byte ptr [bp + si], bh
  0024:000A  and      byte ptr [bx + si + 0x4f], dl
  0024:000D  push     di
  0024:000E  push     dx
  0024:000F  dec      di
  0025:0000  push     sp
  0025:0001  and      byte ptr [di], cl
  0025:0003  push     di
  0025:0004  and      byte ptr [bp + di + 0x55], dl
  0025:0007  dec      bp
  0025:0008  dec      cx
  0025:0009  inc      bp
  0025:000A  and      byte ptr [di + 0x41], cl
  0025:000D  push     bx
  0025:000E  pop      dx
  0025:000F  and      byte ptr [si], cl
  0026:0001  and      byte ptr [bx + si + 0x52], dl
  0026:0004  pop      dx
  0026:0005  inc      bp
  0026:0006  inc      sp
  0026:0007  dec      bp
  0026:0008  dec      cx
  0026:0009  dec      di
  0026:000A  push     sp
  0026:000B  dec      di
  0026:000C  push     di
  0026:000D  adc      al, 0x42
  0026:000F  dec      cx
  0027:0000  dec      dx
  0027:0001  inc      bp
  0027:0002  push     bx
  0027:0003  pop      dx
  0027:0004  and      byte ptr [bp + di + 0x49], dl
  0027:0007  inc      bp
  0027:0008  and      byte ptr [bp + 0x41], cl
  0027:000B  and      byte ptr [bx + si + 0x49], dl
  0027:000E  inc      bp
  0027:000F  push     bx
  0028:0000  inc      bx
  0028:0001  dec      cx
  0028:0002  pop      ss
  0028:0003  dec      si
  0028:0004  dec      cx
  0028:0005  inc      bp
  0028:0006  and      byte ptr [di + 0x41], cl
  0028:0009  push     bx
  0028:000A  pop      dx
  0028:000B  and      byte ptr [bp + si + 0x41], bl
  0028:000E  inc      sp
  0028:000F  dec      si
  0029:0000  inc      bp
  0029:0001  dec      dx
  0029:0002  and      byte ptr [bx + 0x43], cl
  0029:0005  dec      ax
  0029:0006  push     dx
  0029:0007  dec      di
  0029:0008  dec      si
  0029:0009  pop      cx
  0029:000A  adc      al, 0x4a
  0029:000C  inc      bp
  0029:000D  push     bx
  0029:000E  push     sp
  0029:000F  inc      bp
  002A:0000  push     bx
  002A:0001  and      byte ptr [bp + 0x41], cl
  002A:0004  inc      di
  002A:0005  dec      cx
  002A:0006  and      byte ptr [bx + di], ah
  002A:0008  and      word ptr [bx + di], sp
  002A:000A  and      word ptr [bx + di], sp
  002A:000C  and      word ptr [bx + di], sp
  002A:000E  and      word ptr [bp + di], ax
  002B:0000  push     bx
  002B:0001  pop      cx
  002B:0002  inc      si
  002B:0003  daa      
  002B:0004  dec      bp
  002B:0005  inc      cx
  002B:0006  push     bx
  002B:0007  pop      dx
  002B:0008  and      byte ptr [bp + 0x41], cl
  002B:000B  and      byte ptr [bp + di + 0x4f], dl
  002B:000E  inc      dx
  002B:000F  dec      cx
  002C:0000  inc      bp
  002C:0001  and      byte ptr [bp + di + 0x4f], cl
  002C:0004  dec      bp
  002C:0005  push     ax
  002C:0006  dec      sp
  002C:0007  inc      bp
  002C:0008  push     sp
  002C:0009  and      byte ptr [di + 0x42], dl
  002C:000C  push     dx
  002C:000D  inc      cx
  002C:000E  dec      si
  002C:000F  and      byte ptr [bp + 0x49], al
  002D:0002  push     dx
  002D:0003  dec      bp
  002D:0004  pop      cx
  002D:0005  and      byte ptr [bp + si], ah
  002D:0007  push     bx
  002D:0008  pop      cx
  002D:0009  inc      si
  002D:000A  and      cl, byte ptr [bx + si]
  002D:000C  inc      di
  002D:000D  inc      cx
  002D:000E  push     dx
  002D:000F  dec      si
  002E:0000  dec      cx
  002E:0001  push     sp
  002E:0002  push     bp
  002E:0003  push     dx
  002E:0004  and      word ptr [di + 0x41], cx
  002E:0007  push     bx
  002E:0008  pop      dx
  002E:0009  and      byte ptr [bp + 0x41], cl
  002E:000C  and      byte ptr [bp + di + 0x4f], dl
  002E:000F  inc      dx
  002F:0000  dec      cx
  002F:0001  inc      bp
  002F:0002  and      byte ptr [bx + 0x52], al
  002F:0005  inc      cx
  002F:0006  dec      si
  002F:0007  dec      cx
  002F:0008  push     sp
  002F:0009  push     bp
  002F:000A  push     dx
  002F:000B  and      byte ptr [bp + si + 0x20], bl
  002F:000E  dec      bx
  002F:000F  dec      di
  0030:0000  dec      sp
  0030:0001  inc      bx
  0030:0002  inc      cx
  0030:0003  dec      bp
  0030:0004  dec      cx
  0030:0005  and      byte ptr [0x5754], bl
  0030:0009  dec      di
  0030:000A  dec      dx
  0030:000B  inc      cx
  0030:000C  and      byte ptr [bx + 0x43], cl
  0030:000F  dec      ax
  0031:0000  push     dx
  0031:0001  dec      di
  0031:0002  dec      si
  0031:0003  inc      cx
  0031:0004  and      byte ptr [bp + si + 0x45], cl
  0031:0007  push     bx
  0031:0008  push     sp
  0031:0009  and      byte ptr [di + 0x41], cl
  0031:000C  dec      sp
  0031:000D  inc      cx
  0031:000E  and      byte ptr [si + 0x41], dl
  0032:0001  push     dx
  0032:0002  inc      bx
  0032:0003  pop      dx
  0032:0004  inc      cx
  0032:0005  and      word ptr [bp + si + 0x41], cx
  0032:0008  dec      bx
  0032:0009  dec      di
  0032:000A  and      byte ptr [bp + si + 0x52], al
  0032:000D  dec      di
  0032:000E  dec      si
  0032:000F  dec      cx
  0033:0000  and      byte ptr [di + 0x5a], dl
  0033:0003  pop      cx
  0033:0004  push     di
  0033:0005  inc      cx
  0033:0006  push     bx
  0033:0007  pop      dx
  0033:0008  and      byte ptr [bp + di + 0x54], dl
  0033:000B  inc      cx
  0033:000C  push     dx
  0033:000D  inc      bp
  0033:000E  inc      di
  0033:000F  dec      di
  0034:0000  and      byte ptr [di + 0x49], cl
  0034:0003  inc      bp
  0034:0004  inc      bx
  0034:0005  pop      dx
  0034:0006  inc      cx
  0034:0007  add      ax, 0x414d
  0034:000A  push     bx
  0034:000B  pop      dx
  0034:000C  and      byte ptr [bx + di], cl
  0034:000E  and      byte ptr [di + 0x4f], cl
  0035:0001  dec      si
  0035:0002  inc      bp
  0035:0003  push     sp
  0035:0004  and      byte ptr [bx + di + 0x20], cl
  0035:0007  or       byte ptr [bx + si], ah
  0035:0009  push     ax
  0035:000A  push     dx
  0035:000B  inc      cx
  0035:000C  dec      bx
  0035:000D  push     sp
  0035:000E  pop      cx
  0035:000F  dec      bx
  0036:0000  dec      dx
  0036:0002  inc      bp
  0036:0003  push     bx
  0036:0004  push     sp
  0036:0005  inc      bp
  0036:0006  push     bx
  0036:0007  and      byte ptr [bp + 0x41], cl
  0036:000A  and      byte ptr [bx + si + 0x49], dl
  0036:000D  inc      bp
  0036:000E  push     dx
  0036:000F  push     di
  0037:0000  push     bx
  0037:0001  pop      dx
  0037:0002  pop      cx
  0037:0003  dec      bp
  0037:0004  and      byte ptr [si + 0x45], cl
  0037:0007  push     si
  0037:0008  inc      bp
  0037:0009  dec      sp
  0037:000A  push     bp
  0037:000B  and      byte ptr [bx + di + 0x20], al
  0037:000E  inc      sp
  0037:000F  dec      di
  0038:0000  and      byte ptr [bp + 0x41], cl
  0038:0003  push     bx
  0038:0004  push     sp
  0038:0005  inc      bp
  0038:0006  push     ax
  0038:0007  dec      si
  0038:0008  inc      bp
  0038:0009  inc      di
  0038:000A  dec      di
  0038:000B  and      byte ptr [bp + si + 0x52], al
  0038:000E  inc      cx
  0038:000F  dec      bx
  0039:0000  push     bp
  0039:0001  dec      dx
  0039:0002  inc      bp
  0039:0003  and      byte ptr [bp + di + 0x49], al
  0039:0006  and      byte ptr [bx + si], cl
  0039:0008  and      byte ptr [bp + di + 0x55], cl
  0039:000B  dec      si
  0039:000C  push     bx
  0039:000D  pop      dx
  0039:000E  push     sp
  0039:000F  push     bp
  003A:0000  xor      cx, word ptr [bp + si + 0x45]
  003A:0003  push     bx
  003A:0004  push     sp
  003A:0005  inc      bp
  003A:0006  push     bx
  003A:0007  and      byte ptr [bp + 0x41], cl
  003A:000A  and      byte ptr [si + 0x52], al
  003A:000D  push     bp
  003A:000E  inc      di
  003A:000F  dec      cx
  003B:0000  dec      bp
  003B:0001  and      byte ptr [si + 0x45], cl
  003B:0004  push     si
  003B:0005  inc      bp
  003B:0006  dec      sp
  003B:0007  push     bp
  003B:0008  and      byte ptr [bx + di + 0x20], al
  003B:000B  inc      sp
  003B:000C  dec      di
  003B:000D  and      byte ptr [bp + 0x41], cl
  003C:0000  push     bx
  003C:0001  push     sp
  003C:0002  inc      bp
  003C:0003  push     ax
  003C:0004  dec      si
  003C:0005  inc      bp
  003C:0006  inc      di
  003C:0007  dec      di
  003C:0008  and      byte ptr [bp + si + 0x52], al
  003C:000B  inc      cx
  003C:000C  dec      bx
  003C:000D  push     bp
  003C:000E  dec      dx
  003C:000F  inc      bp
  003D:0000  and      byte ptr [bp + di + 0x49], al
  003D:0003  and      byte ptr [si], dh
  003D:0005  dec      dx
  003D:0006  inc      bp
  003D:0007  push     bx
  003D:0008  push     sp
  003D:0009  inc      bp
  003D:000A  push     bx
  003D:000B  and      byte ptr [bp + 0x41], cl
  003D:000E  and      byte ptr [si + 0x52], dl
  003E:0001  pop      dx
  003E:0002  inc      bp
  003E:0003  inc      bx
  003E:0004  dec      cx
  003E:0005  dec      bp
  003E:0006  and      byte ptr [si + 0x45], cl
  003E:0009  push     si
  003E:000A  inc      bp
  003E:000B  dec      sp
  003E:000C  push     bp
  003E:000D  and      byte ptr [bx + di + 0x20], al
  003F:0000  inc      sp
  003F:0001  dec      di


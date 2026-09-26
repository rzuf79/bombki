; ---- BOMBKI.EXE  linear x86-16 disassembly ----
; entry: CS:IP=052E:H0 0000 (image base 0000, img ofs 00000)
; sweep: 512 bytes after entry, stops at RETF/IRET

; === MAIN program body (entry) ===

  0000:0000  cmovle   cx, word ptr [bx + 0x53] cx, word ptr [bx + 0x53] ; cx, word ptr [bx + 0x53]
  0000:0004  dec      cx                                ; cx
  0000:0005  push     bx                                ; bx
  0000:0006  pop      dx                                ; dx
  0000:0007  and      byte ptr [bp + si + 0x45], bl byte ptr [bp + si + 0x45], bl ; byte ptr [bp + si + 0x45], bl
  0000:000A  and      byte ptr [bp + di + 0x4f], dl byte ptr [bp + di + 0x4f], dl ; byte ptr [bp + di + 0x4f], dl
  0000:000D  inc      dx                                ; dx
  0000:000E  inc      cx                                ; cx
  0000:000F  cmp      dl, byte ptr [bx] dl, byte ptr [bx] ; dl, byte ptr [bx]
  0001:0001  push     bx                                ; bx
  0001:0002  push     sp                                ; sp
  0001:0003  inc      cx                                ; cx
  0001:0004  push     dx                                ; dx
  0001:0005  pop      cx                                ; cx
  0001:0006  and      byte ptr [bp + si + 0x41], bl byte ptr [bp + si + 0x41], bl ; byte ptr [bp + si + 0x41], bl
  0001:0009  push     dx                                ; dx
  0001:000A  inc      sp                                ; sp
  0001:000B  pop      dx                                ; dx
  0001:000C  inc      bp                                ; bp
  0001:000D  push     di                                ; di
  0001:000E  dec      cx                                ; cx
  0001:000F  inc      cx                                ; cx
  0002:0000  dec      sp                                ; sp
  0002:0001  pop      cx                                ; cx
  0002:0002  and      byte ptr [di + 0x49], cl byte ptr [di + 0x49], cl ; byte ptr [di + 0x49], cl
  0002:0005  inc      bp                                ; bp
  0002:0006  inc      bx                                ; bx
  0002:0007  pop      dx                                ; dx
  0002:0008  adc      cx, word ptr [bx + 0x4b] cx, word ptr [bx + 0x4b] ; cx, word ptr [bx + 0x4b]
  0002:000B  push     dx                                ; dx
  0002:000C  inc      cx                                ; cx
  0002:000D  inc      di                                ; di
  0002:000E  dec      sp                                ; sp
  0002:000F  inc      cx                                ; cx
  0003:0000  and      byte ptr [di + 0x41], cl byte ptr [di + 0x41], cl ; byte ptr [di + 0x41], cl
  0003:0003  dec      sp                                ; sp
  0003:0004  inc      cx                                ; cx
  0003:0005  and      byte ptr [si + 0x41], dl byte ptr [si + 0x41], dl ; byte ptr [si + 0x41], dl
  0003:0008  push     dx                                ; dx
  0003:0009  inc      bx                                ; bx
  0003:000A  pop      dx                                ; dx
  0003:000B  inc      cx                                ; cx
  0003:000C  adc      word ptr [bp + si + 0x41], bx word ptr [bp + si + 0x41], bx ; word ptr [bp + si + 0x41], bx
  0003:000F  dec      bx                                ; bx
  0004:0000  push     dx                                ; dx
  0004:0001  push     di                                ; di
  0004:0002  inc      cx                                ; cx
  0004:0003  push     di                                ; di
  0004:0004  dec      cx                                ; cx
  0004:0005  dec      di                                ; di
  0004:0006  dec      si                                ; si
  0004:0007  inc      bp                                ; bp
  0004:0008  and      byte ptr [bp + di + 0x45], dl byte ptr [bp + di + 0x45], dl ; byte ptr [bp + di + 0x45], dl
  0004:000B  push     dx                                ; dx
  0004:000C  inc      bx                                ; bx
  0004:000D  inc      bp                                ; bp
  0004:000E  adc      word ptr [si + 0x59], ax word ptr [si + 0x59], ax ; word ptr [si + 0x59], ax
  0005:0001  push     ax                                ; ax
  0005:0002  dec      sp                                ; sp
  0005:0003  dec      di                                ; di
  0005:0004  dec      bp                                ; bp
  0005:0005  and      byte ptr [di + 0x55], cl byte ptr [di + 0x55], cl ; byte ptr [di + 0x55], cl
  0005:0008  inc      sp                                ; sp
  0005:0009  and      byte ptr [bp + di + 0x5a], dl byte ptr [bp + di + 0x5a], dl ; byte ptr [bp + di + 0x5a], dl
  0005:000C  dec      bx                                ; bx
  0005:000D  dec      di                                ; di
  0005:000E  dec      sp                                ; sp
  0005:000F  pop      cx                                ; cx
  0006:0000  push     ds                                ; ds
  0006:0001  push     bx                                ; bx
  0006:0002  dec      bp                                ; bp
  0006:0003  inc      cx                                ; cx
  0006:0004  inc      bx                                ; bx
  0006:0005  pop      dx                                ; dx
  0006:0006  dec      si                                ; si
  0006:0007  pop      cx                                ; cx
  0006:0008  and      byte ptr [bx + si + 0x4f], dl byte ptr [bx + si + 0x4f], dl ; byte ptr [bx + si + 0x4f], dl
  0006:000B  dec      sp                                ; sp
  0006:000C  inc      cx                                ; cx
  0006:000D  dec      si                                ; si
  0006:000E  pop      cx                                ; cx
  0006:000F  and      byte ptr [si + 0x49], cl byte ptr [si + 0x49], cl ; byte ptr [si + 0x49], cl
  0007:0002  dec      bx                                ; bx
  0007:0003  dec      cx                                ; cx
  0007:0004  inc      bp                                ; bp
  0007:0005  push     dx                                ; dx
  0007:0006  inc      bp                                ; bp
  0007:0007  dec      bp                                ; bp
  0007:0008  and      byte ptr [bx + si + 0x41], dl byte ptr [bx + si + 0x41], dl ; byte ptr [bx + si + 0x41], dl
  0007:000B  inc      bx                                ; bx
  0007:000C  pop      dx                                ; dx
  0007:000D  inc      bp                                ; bp
  0007:000E  dec      bx                                ; bx
  0007:000F  adc      byte ptr [bp + di + 0x4d], dl byte ptr [bp + di + 0x4d], dl ; byte ptr [bp + di + 0x4d], dl
  0008:0002  inc      cx                                ; cx
  0008:0003  inc      bx                                ; bx
  0008:0004  pop      dx                                ; dx
  0008:0005  dec      si                                ; si
  0008:0006  inc      bp                                ; bp
  0008:0007  and      byte ptr [bp + di + 0x49], al byte ptr [bp + di + 0x49], al ; byte ptr [bp + di + 0x49], al
  0008:000A  inc      cx                                ; cx
  0008:000B  push     bx                                ; bx
  0008:000C  push     sp                                ; sp
  0008:000D  dec      bx                                ; bx
  0008:000E  dec      di                                ; di
  0008:000F  and      byte ptr [bp + si], dl byte ptr [bp + si], dl ; byte ptr [bp + si], dl
  0009:0001  push     sp                                ; sp
  0009:0002  push     di                                ; di
  0009:0003  inc      cx                                ; cx
  0009:0004  push     dx                                ; dx
  0009:0005  inc      sp                                ; sp
  0009:0006  inc      cx                                ; cx
  0009:0007  and      byte ptr [bp + di + 0x55], dl byte ptr [bp + di + 0x55], dl ; byte ptr [bp + di + 0x55], dl
  0009:000A  inc      bx                                ; bx
  0009:000B  dec      ax                                ; ax
  0009:000C  inc      cx                                ; cx
  0009:000D  and      byte ptr [bp + si + 0x41], dl byte ptr [bp + si + 0x41], dl ; byte ptr [bp + si + 0x41], dl
  000A:0000  inc      bx                                ; bx
  000A:0001  dec      dx                                ; dx
  000A:0002  inc      bp                                ; bp
  000A:0003  push     ss                                ; ss
  000A:0004  dec      di                                ; di
  000A:0005  dec      bx                                ; bx
  000A:0006  push     dx                                ; dx
  000A:0007  inc      cx                                ; cx
  000A:0008  inc      di                                ; di
  000A:0009  dec      sp                                ; sp
  000A:000A  inc      cx                                ; cx
  000A:000B  and      byte ptr [bx + si + 0x41], dl byte ptr [bx + si + 0x41], dl ; byte ptr [bx + si + 0x41], dl
  000A:000E  inc      bx                                ; bx
  000A:000F  dec      ax                                ; ax
  000B:0000  dec      si                                ; si
  000B:0001  inc      cx                                ; cx
  000B:0002  inc      bx                                ; bx
  000B:0003  inc      cx                                ; cx
  000B:0004  and      byte ptr [bp + si + 0x55], al byte ptr [bp + si + 0x55], al ; byte ptr [bp + si + 0x55], al
  000B:0007  dec      sp                                ; sp
  000B:0008  dec      bx                                ; bx
  000B:0009  inc      cx                                ; cx
  000B:000A  adc      word ptr [si + 0x55], ax word ptr [si + 0x55], ax ; word ptr [si + 0x55], ax
  000B:000D  pop      dx                                ; dx
  000B:000E  pop      cx                                ; cx
  000B:000F  and      byte ptr [bp + di + 0x49], al byte ptr [bp + di + 0x49], al ; byte ptr [bp + di + 0x49], al
  000C:0002  inc      bp                                ; bp
  000C:0003  push     ax                                ; ax
  000C:0004  dec      sp                                ; sp
  000C:0005  pop      cx                                ; cx
  000C:0006  and      byte ptr [bp + di + 0x48], al byte ptr [bp + di + 0x48], al ; byte ptr [bp + di + 0x48], al
  000C:0009  dec      sp                                ; sp
  000C:000A  inc      bp                                ; bp
  000C:000B  inc      dx                                ; dx
  000C:000C  adc      al, 0x44 al, 0x44                 ; al, 0x44
  000C:000E  dec      sp                                ; sp
  000C:000F  push     bp                                ; bp
  000D:0000  inc      di                                ; di
  000D:0001  inc      cx                                ; cx
  000D:0002  and      byte ptr [bx + di + 0x20], cl byte ptr [bx + di + 0x20], cl ; byte ptr [bx + di + 0x20], cl
  000D:0005  push     bx                                ; bx
  000D:0006  dec      bp                                ; bp
  000D:0007  inc      cx                                ; cx
  000D:0008  inc      bx                                ; bx
  000D:0009  pop      dx                                ; dx
  000D:000A  dec      si                                ; si
  000D:000B  inc      cx                                ; cx
  000D:000C  and      byte ptr [bx + 0x45], dl byte ptr [bx + 0x45], dl ; byte ptr [bx + 0x45], dl
  000D:000F  dec      bx                                ; bx
  000E:0000  inc      bp                                ; bp
  000E:0001  push     ds                                ; ds
  000E:0002  push     ax                                ; ax
  000E:0003  pop      cx                                ; cx
  000E:0004  push     bx                                ; bx
  000E:0005  pop      dx                                ; dx
  000E:0006  dec      si                                ; si
  000E:0007  pop      cx                                ; cx
  000E:0008  and      byte ptr [bp + si + 0x49], al byte ptr [bp + si + 0x49], al ; byte ptr [bp + si + 0x49], al
  000E:000B  inc      di                                ; di
  000E:000C  dec      di                                ; di
  000E:000D  push     bx                                ; bx
  000E:000E  and      byte ptr [bp + si + 0x20], bl byte ptr [bp + si + 0x20], bl ; byte ptr [bp + si + 0x20], bl
  000F:0001  dec      bx                                ; bx
  000F:0002  inc      cx                                ; cx
  000F:0003  push     ax                                ; ax
  000F:0004  push     bp                                ; bp
  000F:0005  push     bx                                ; bx
  000F:0006  push     sp                                ; sp
  000F:0007  inc      cx                                ; cx
  000F:0008  and      byte ptr [bp + si + 0x20], bl byte ptr [bp + si + 0x20], bl ; byte ptr [bp + si + 0x20], bl
  000F:000B  push     di                                ; di
  000F:000C  push     dx                                ; dx
  000F:000D  dec      di                                ; di
  000F:000E  inc      di                                ; di
  000F:000F  inc      cx                                ; cx
  0010:0000  daa                                        ; 
  0010:0001  dec      di                                ; di
  0010:0002  pop      dx                                ; dx
  0010:0003  inc      bp                                ; bp
  0010:0004  push     di                                ; di
  0010:0005  dec      cx                                ; cx
  0010:0006  inc      cx                                ; cx
  0010:0007  dec      dx                                ; dx
  0010:0008  inc      cx                                ; cx
  0010:0009  inc      bx                                ; bx
  0010:000A  inc      bp                                ; bp
  0010:000B  and      byte ptr [bx + si + 0x49], dl byte ptr [bx + si + 0x49], dl ; byte ptr [bx + si + 0x49], dl
  0010:000E  push     di                                ; di
  0010:000F  push     bx                                ; bx
  0011:0000  dec      bx                                ; bx
  0011:0001  dec      di                                ; di
  0011:0002  and      byte ptr [bp + si + 0x20], bl byte ptr [bp + si + 0x20], bl ; byte ptr [bp + si + 0x20], bl
  0011:0005  dec      bx                                ; bx
  0011:0006  dec      di                                ; di
  0011:0007  dec      si                                ; si
  0011:0008  dec      bx                                ; bx
  0011:0009  push     dx                                ; dx
  0011:000A  inc      bp                                ; bp
  0011:000B  push     sp                                ; sp
  0011:000C  dec      si                                ; si
  0011:000D  pop      cx                                ; cx
  0011:000E  dec      bp                                ; bp
  0011:000F  and      byte ptr [bp + di + 0x4c], cl byte ptr [bp + di + 0x4c], cl ; byte ptr [bp + di + 0x4c], cl
  0012:0002  dec      cx                                ; cx
  0012:0003  dec      bp                                ; bp
  0012:0004  inc      cx                                ; cx
  0012:0005  push     sp                                ; sp
  0012:0006  inc      bp                                ; bp
  0012:0007  dec      bp                                ; bp
  0012:0008  sbb      al, 0x43 al, 0x43                 ; al, 0x43
  0012:000A  dec      cx                                ; cx
  0012:000B  inc      bp                                ; bp
  0012:000C  pop      dx                                ; dx
  0012:000D  dec      bx                                ; bx
  0012:000E  inc      cx                                ; cx
  0012:000F  and      byte ptr [bp + 0x41], al byte ptr [bp + 0x41], al ; byte ptr [bp + 0x41], al
  0013:0002  dec      dx                                ; dx
  0013:0003  dec      bx                                ; bx
  0013:0004  inc      cx                                ; cx
  0013:0005  and      byte ptr [bx + 0x44], cl byte ptr [bx + 0x44], cl ; byte ptr [bx + 0x44], cl
  0013:0008  and      byte ptr [si + 0x5a], al byte ptr [si + 0x5a], al ; byte ptr [si + 0x5a], al
  0013:000B  dec      cx                                ; cx
  0013:000C  inc      cx                                ; cx
  0013:000D  inc      sp                                ; sp
  0013:000E  inc      cx                                ; cx
  0013:000F  and      byte ptr [di + 0x52], cl byte ptr [di + 0x52], cl ; byte ptr [di + 0x52], cl
  0014:0002  dec      di                                ; di
  0014:0003  pop      dx                                ; dx
  0014:0004  inc      cx                                ; cx
  0014:0005  sbb      word ptr [bp + di + 0x4f], cx word ptr [bp + di + 0x4f], cx ; word ptr [bp + di + 0x4f], cx
  0014:0008  dec      bp                                ; bp
  0014:0009  push     ax                                ; ax
  0014:000A  dec      sp                                ; sp
  0014:000B  inc      bp                                ; bp
  0014:000C  push     sp                                ; sp
  0014:000D  and      byte ptr [di + 0x42], dl byte ptr [di + 0x42], dl ; byte ptr [di + 0x42], dl
  0015:0000  push     dx                                ; dx
  0015:0001  inc      cx                                ; cx
  0015:0002  dec      si                                ; si
  0015:0003  and      byte ptr [bp + 0x49], al byte ptr [bp + 0x49], al ; byte ptr [bp + 0x49], al
  0015:0006  push     dx                                ; dx
  0015:0007  dec      bp                                ; bp
  0015:0008  pop      cx                                ; cx
  0015:0009  and      byte ptr [bp + si], ah byte ptr [bp + si], ah ; byte ptr [bp + si], ah
  0015:000B  push     bx                                ; bx
  0015:000C  pop      cx                                ; cx
  0015:000D  inc      si                                ; si
  0015:000E  and      dl, byte ptr [bp + si] dl, byte ptr [bp + si] ; dl, byte ptr [bp + si]
  0016:0000  inc      di                                ; di
  0016:0001  inc      cx                                ; cx
  0016:0002  push     dx                                ; dx
  0016:0003  dec      si                                ; si
  0016:0004  dec      cx                                ; cx
  0016:0005  push     sp                                ; sp
  0016:0006  push     bp                                ; bp
  0016:0007  push     dx                                ; dx
  0016:0008  and      byte ptr [bp + si + 0x20], bl byte ptr [bp + si + 0x20], bl ; byte ptr [bp + si + 0x20], bl
  0016:000B  dec      bx                                ; bx
  0016:000C  dec      di                                ; di
  0016:000D  dec      sp                                ; sp
  0016:000E  inc      bx                                ; bx
  0016:000F  inc      cx                                ; cx
  0017:0000  dec      bp                                ; bp
  0017:0001  dec      cx                                ; cx
  0017:0002  adc      word ptr [di + 0x41], cx word ptr [di + 0x41], cx ; word ptr [di + 0x41], cx
  0017:0005  dec      sp                                ; sp
  0017:0006  inc      cx                                ; cx
  0017:0007  and      byte ptr [bp + si + 0x55], al byte ptr [bp + si + 0x55], al ; byte ptr [bp + si + 0x55], al
  0017:000A  push     sp                                ; sp
  0017:000B  inc      bp                                ; bp
  0017:000C  dec      sp                                ; sp
  0017:000D  dec      bx                                ; bx
  0017:000E  inc      bp                                ; bp
  0017:000F  and      byte ptr [di + 0x41], cl byte ptr [di + 0x41], cl ; byte ptr [di + 0x41], cl
  0018:0002  dec      si                                ; si
  0018:0003  pop      cx                                ; cx
  0018:0004  push     ds                                ; ds
  0018:0005  inc      sp                                ; sp
  0018:0006  inc      bp                                ; bp
  0018:0007  dec      sp                                ; sp
  0018:0008  dec      cx                                ; cx
  0018:0009  dec      bx                                ; bx
  0018:000A  inc      cx                                ; cx
  0018:000B  push     sp                                ; sp
  0018:000C  dec      si                                ; si
  0018:000D  pop      cx                                ; cx
  0018:000E  and      byte ptr [bp + di + 0x48], al byte ptr [bp + di + 0x48], al ; byte ptr [bp + di + 0x48], al
  0019:0001  dec      di                                ; di
  0019:0002  inc      bx                                ; bx
  0019:0003  and      byte ptr [bp + di + 0x5a], dl byte ptr [bp + di + 0x5a], dl ; byte ptr [bp + di + 0x5a], dl
  0019:0006  dec      di                                ; di
  0019:0007  push     dx                                ; dx
  0019:0008  push     bx                                ; bx
  0019:0009  push     sp                                ; sp
  0019:000A  dec      bx                                ; bx
  0019:000B  dec      cx                                ; cx
  0019:000C  and      byte ptr [si + 0x49], cl byte ptr [si + 0x49], cl ; byte ptr [si + 0x49], cl
  0019:000F  push     bx                                ; bx
  001A:0000  push     sp                                ; sp
  001A:0001  inc      bp                                ; bp
  001A:0002  dec      bx                                ; bx
  001A:0003  push     ds                                ; ds
  001A:0004  dec      bx                                ; bx
  001A:0005  inc      cx                                ; cx
  001A:0006  push     bx                                ; bx
  001A:0007  inc      bp                                ; bp
  001A:0008  push     sp                                ; sp
  001A:0009  inc      cx                                ; cx
  001A:000A  and      byte ptr [si + 0x49], cl byte ptr [si + 0x49], cl ; byte ptr [si + 0x49], cl
  001A:000D  push     dx                                ; dx
  001A:000E  dec      di                                ; di
  001A:000F  pop      cx                                ; cx
  001B:0000  inc      cx                                ; cx
  001B:0001  and      byte ptr [bp + si], bh byte ptr [bp + si], bh ; byte ptr [bp + si], bh
  001B:0003  and      byte ptr [si + 0x20], cl byte ptr [si + 0x20], cl ; byte ptr [si + 0x20], cl
  001B:0006  sub      ax, 0x4a20 ax, 0x4a20             ; ax, 0x4a20
  001B:0009  inc      cx                                ; cx
  001B:000A  dec      bx                                ; bx
  001B:000B  and      byte ptr [si + 0x49], cl byte ptr [si + 0x49], cl ; byte ptr [si + 0x49], cl
  001B:000E  push     dx                                ; dx
  001B:000F  dec      di                                ; di
  001C:0000  pop      cx                                ; cx
  001C:0001  and      byte ptr [di], bl byte ptr [di], bl ; byte ptr [di], bl
  001C:0003  push     ax                                ; ax
  001C:0004  dec      cx                                ; cx
  001C:0005  inc      di                                ; di
  001C:0006  push     bp                                ; bp
  001C:0007  dec      sp                                ; sp
  001C:0008  dec      bx                                ; bx
  001C:0009  inc      cx                                ; cx
  001C:000A  and      byte ptr [si + 0x52], dl byte ptr [si + 0x52], dl ; byte ptr [si + 0x52], dl
  001C:000D  inc      cx                                ; cx
  001C:000E  dec      si                                ; si
  001C:000F  push     bx                                ; bx
  001D:0000  push     ax                                ; ax
  001D:0001  dec      di                                ; di
  001D:0002  push     dx                                ; dx
  001D:0003  push     sp                                ; sp
  001D:0004  push     bp                                ; bp
  001D:0005  dec      dx                                ; dx
  001D:0006  inc      cx                                ; cx
  001D:0007  inc      bx                                ; bx
  001D:0008  inc      cx                                ; cx
  001D:0009  and      byte ptr [bx + si], ch byte ptr [bx + si], ch ; byte ptr [bx + si], ch
  001D:000B  dec      bp                                ; bp
  001D:000C  cmp      al, byte ptr [bx + 0x29] al, byte ptr [bx + 0x29] ; al, byte ptr [bx + 0x29]
  001D:000F  and      byte ptr [bx], dh byte ptr [bx], dh ; byte ptr [bx], dh
  001E:0001  push     ax                                ; ax
  001E:0002  push     dx                                ; dx
  001E:0003  pop      dx                                ; dx
  001E:0004  inc      bp                                ; bp
  001E:0005  push     ax                                ; ax
  001E:0006  push     bp                                ; bp
  001E:0007  push     bx                                ; bx
  001E:0008  push     sp                                ; sp
  001E:0009  dec      bx                                ; bx
  001E:000A  inc      cx                                ; cx
  001E:000B  and      byte ptr [bx + 0x4c], dl byte ptr [bx + 0x4c], dl ; byte ptr [bx + 0x4c], dl
  001E:000E  inc      cx                                ; cx
  001E:000F  push     bx                                ; bx
  001F:0000  dec      si                                ; si
  001F:0001  dec      di                                ; di
  001F:0002  push     dx                                ; dx
  001F:0003  inc      bp                                ; bp
  001F:0004  inc      bx                                ; bx
  001F:0005  pop      dx                                ; dx
  001F:0006  dec      si                                ; si
  001F:0007  dec      cx                                ; cx
  001F:0008  inc      bp                                ; bp
  001F:0009  and      byte ptr [bx + si + 0x4f], dl byte ptr [bx + si + 0x4f], dl ; byte ptr [bx + si + 0x4f], dl
  001F:000C  inc      sp                                ; sp
  001F:000D  push     ax                                ; ax
  001F:000E  dec      cx                                ; cx
  001F:000F  push     bx                                ; bx

; === top of image (startup/unit init) ===

  0000:0000  cmovle   cx, word ptr [bx + 0x53] cx, word ptr [bx + 0x53] ; cx, word ptr [bx + 0x53]
  0000:0004  dec      cx                                ; cx
  0000:0005  push     bx                                ; bx
  0000:0006  pop      dx                                ; dx
  0000:0007  and      byte ptr [bp + si + 0x45], bl byte ptr [bp + si + 0x45], bl ; byte ptr [bp + si + 0x45], bl
  0000:000A  and      byte ptr [bp + di + 0x4f], dl byte ptr [bp + di + 0x4f], dl ; byte ptr [bp + di + 0x4f], dl
  0000:000D  inc      dx                                ; dx
  0000:000E  inc      cx                                ; cx
  0000:000F  cmp      dl, byte ptr [bx] dl, byte ptr [bx] ; dl, byte ptr [bx]
  0001:0001  push     bx                                ; bx
  0001:0002  push     sp                                ; sp
  0001:0003  inc      cx                                ; cx
  0001:0004  push     dx                                ; dx
  0001:0005  pop      cx                                ; cx
  0001:0006  and      byte ptr [bp + si + 0x41], bl byte ptr [bp + si + 0x41], bl ; byte ptr [bp + si + 0x41], bl
  0001:0009  push     dx                                ; dx
  0001:000A  inc      sp                                ; sp
  0001:000B  pop      dx                                ; dx
  0001:000C  inc      bp                                ; bp
  0001:000D  push     di                                ; di
  0001:000E  dec      cx                                ; cx
  0001:000F  inc      cx                                ; cx
  0002:0000  dec      sp                                ; sp
  0002:0001  pop      cx                                ; cx
  0002:0002  and      byte ptr [di + 0x49], cl byte ptr [di + 0x49], cl ; byte ptr [di + 0x49], cl
  0002:0005  inc      bp                                ; bp
  0002:0006  inc      bx                                ; bx
  0002:0007  pop      dx                                ; dx
  0002:0008  adc      cx, word ptr [bx + 0x4b] cx, word ptr [bx + 0x4b] ; cx, word ptr [bx + 0x4b]
  0002:000B  push     dx                                ; dx
  0002:000C  inc      cx                                ; cx
  0002:000D  inc      di                                ; di
  0002:000E  dec      sp                                ; sp
  0002:000F  inc      cx                                ; cx
  0003:0000  and      byte ptr [di + 0x41], cl byte ptr [di + 0x41], cl ; byte ptr [di + 0x41], cl
  0003:0003  dec      sp                                ; sp
  0003:0004  inc      cx                                ; cx
  0003:0005  and      byte ptr [si + 0x41], dl byte ptr [si + 0x41], dl ; byte ptr [si + 0x41], dl
  0003:0008  push     dx                                ; dx
  0003:0009  inc      bx                                ; bx
  0003:000A  pop      dx                                ; dx
  0003:000B  inc      cx                                ; cx
  0003:000C  adc      word ptr [bp + si + 0x41], bx word ptr [bp + si + 0x41], bx ; word ptr [bp + si + 0x41], bx
  0003:000F  dec      bx                                ; bx
  0004:0000  push     dx                                ; dx
  0004:0001  push     di                                ; di
  0004:0002  inc      cx                                ; cx
  0004:0003  push     di                                ; di
  0004:0004  dec      cx                                ; cx
  0004:0005  dec      di                                ; di
  0004:0006  dec      si                                ; si
  0004:0007  inc      bp                                ; bp
  0004:0008  and      byte ptr [bp + di + 0x45], dl byte ptr [bp + di + 0x45], dl ; byte ptr [bp + di + 0x45], dl
  0004:000B  push     dx                                ; dx
  0004:000C  inc      bx                                ; bx
  0004:000D  inc      bp                                ; bp
  0004:000E  adc      word ptr [si + 0x59], ax word ptr [si + 0x59], ax ; word ptr [si + 0x59], ax
  0005:0001  push     ax                                ; ax
  0005:0002  dec      sp                                ; sp
  0005:0003  dec      di                                ; di
  0005:0004  dec      bp                                ; bp
  0005:0005  and      byte ptr [di + 0x55], cl byte ptr [di + 0x55], cl ; byte ptr [di + 0x55], cl
  0005:0008  inc      sp                                ; sp
  0005:0009  and      byte ptr [bp + di + 0x5a], dl byte ptr [bp + di + 0x5a], dl ; byte ptr [bp + di + 0x5a], dl
  0005:000C  dec      bx                                ; bx
  0005:000D  dec      di                                ; di
  0005:000E  dec      sp                                ; sp
  0005:000F  pop      cx                                ; cx
  0006:0000  push     ds                                ; ds
  0006:0001  push     bx                                ; bx
  0006:0002  dec      bp                                ; bp
  0006:0003  inc      cx                                ; cx
  0006:0004  inc      bx                                ; bx
  0006:0005  pop      dx                                ; dx
  0006:0006  dec      si                                ; si
  0006:0007  pop      cx                                ; cx
  0006:0008  and      byte ptr [bx + si + 0x4f], dl byte ptr [bx + si + 0x4f], dl ; byte ptr [bx + si + 0x4f], dl
  0006:000B  dec      sp                                ; sp
  0006:000C  inc      cx                                ; cx
  0006:000D  dec      si                                ; si
  0006:000E  pop      cx                                ; cx
  0006:000F  and      byte ptr [si + 0x49], cl byte ptr [si + 0x49], cl ; byte ptr [si + 0x49], cl
  0007:0002  dec      bx                                ; bx
  0007:0003  dec      cx                                ; cx
  0007:0004  inc      bp                                ; bp
  0007:0005  push     dx                                ; dx
  0007:0006  inc      bp                                ; bp
  0007:0007  dec      bp                                ; bp
  0007:0008  and      byte ptr [bx + si + 0x41], dl byte ptr [bx + si + 0x41], dl ; byte ptr [bx + si + 0x41], dl
  0007:000B  inc      bx                                ; bx
  0007:000C  pop      dx                                ; dx
  0007:000D  inc      bp                                ; bp
  0007:000E  dec      bx                                ; bx
  0007:000F  adc      byte ptr [bp + di + 0x4d], dl byte ptr [bp + di + 0x4d], dl ; byte ptr [bp + di + 0x4d], dl
  0008:0002  inc      cx                                ; cx
  0008:0003  inc      bx                                ; bx
  0008:0004  pop      dx                                ; dx
  0008:0005  dec      si                                ; si
  0008:0006  inc      bp                                ; bp
  0008:0007  and      byte ptr [bp + di + 0x49], al byte ptr [bp + di + 0x49], al ; byte ptr [bp + di + 0x49], al
  0008:000A  inc      cx                                ; cx
  0008:000B  push     bx                                ; bx
  0008:000C  push     sp                                ; sp
  0008:000D  dec      bx                                ; bx
  0008:000E  dec      di                                ; di
  0008:000F  and      byte ptr [bp + si], dl byte ptr [bp + si], dl ; byte ptr [bp + si], dl
  0009:0001  push     sp                                ; sp
  0009:0002  push     di                                ; di
  0009:0003  inc      cx                                ; cx
  0009:0004  push     dx                                ; dx
  0009:0005  inc      sp                                ; sp
  0009:0006  inc      cx                                ; cx
  0009:0007  and      byte ptr [bp + di + 0x55], dl byte ptr [bp + di + 0x55], dl ; byte ptr [bp + di + 0x55], dl
  0009:000A  inc      bx                                ; bx
  0009:000B  dec      ax                                ; ax
  0009:000C  inc      cx                                ; cx
  0009:000D  and      byte ptr [bp + si + 0x41], dl byte ptr [bp + si + 0x41], dl ; byte ptr [bp + si + 0x41], dl
  000A:0000  inc      bx                                ; bx
  000A:0001  dec      dx                                ; dx
  000A:0002  inc      bp                                ; bp
  000A:0003  push     ss                                ; ss
  000A:0004  dec      di                                ; di
  000A:0005  dec      bx                                ; bx
  000A:0006  push     dx                                ; dx
  000A:0007  inc      cx                                ; cx
  000A:0008  inc      di                                ; di
  000A:0009  dec      sp                                ; sp
  000A:000A  inc      cx                                ; cx
  000A:000B  and      byte ptr [bx + si + 0x41], dl byte ptr [bx + si + 0x41], dl ; byte ptr [bx + si + 0x41], dl
  000A:000E  inc      bx                                ; bx
  000A:000F  dec      ax                                ; ax
  000B:0000  dec      si                                ; si
  000B:0001  inc      cx                                ; cx
  000B:0002  inc      bx                                ; bx
  000B:0003  inc      cx                                ; cx
  000B:0004  and      byte ptr [bp + si + 0x55], al byte ptr [bp + si + 0x55], al ; byte ptr [bp + si + 0x55], al
  000B:0007  dec      sp                                ; sp
  000B:0008  dec      bx                                ; bx
  000B:0009  inc      cx                                ; cx
  000B:000A  adc      word ptr [si + 0x55], ax word ptr [si + 0x55], ax ; word ptr [si + 0x55], ax
  000B:000D  pop      dx                                ; dx
  000B:000E  pop      cx                                ; cx
  000B:000F  and      byte ptr [bp + di + 0x49], al byte ptr [bp + di + 0x49], al ; byte ptr [bp + di + 0x49], al
  000C:0002  inc      bp                                ; bp
  000C:0003  push     ax                                ; ax
  000C:0004  dec      sp                                ; sp
  000C:0005  pop      cx                                ; cx
  000C:0006  and      byte ptr [bp + di + 0x48], al byte ptr [bp + di + 0x48], al ; byte ptr [bp + di + 0x48], al
  000C:0009  dec      sp                                ; sp
  000C:000A  inc      bp                                ; bp
  000C:000B  inc      dx                                ; dx
  000C:000C  adc      al, 0x44 al, 0x44                 ; al, 0x44
  000C:000E  dec      sp                                ; sp
  000C:000F  push     bp                                ; bp
  000D:0000  inc      di                                ; di
  000D:0001  inc      cx                                ; cx
  000D:0002  and      byte ptr [bx + di + 0x20], cl byte ptr [bx + di + 0x20], cl ; byte ptr [bx + di + 0x20], cl
  000D:0005  push     bx                                ; bx
  000D:0006  dec      bp                                ; bp
  000D:0007  inc      cx                                ; cx
  000D:0008  inc      bx                                ; bx
  000D:0009  pop      dx                                ; dx
  000D:000A  dec      si                                ; si
  000D:000B  inc      cx                                ; cx
  000D:000C  and      byte ptr [bx + 0x45], dl byte ptr [bx + 0x45], dl ; byte ptr [bx + 0x45], dl
  000D:000F  dec      bx                                ; bx
  000E:0000  inc      bp                                ; bp
  000E:0001  push     ds                                ; ds
  000E:0002  push     ax                                ; ax
  000E:0003  pop      cx                                ; cx
  000E:0004  push     bx                                ; bx
  000E:0005  pop      dx                                ; dx
  000E:0006  dec      si                                ; si
  000E:0007  pop      cx                                ; cx
  000E:0008  and      byte ptr [bp + si + 0x49], al byte ptr [bp + si + 0x49], al ; byte ptr [bp + si + 0x49], al
  000E:000B  inc      di                                ; di
  000E:000C  dec      di                                ; di
  000E:000D  push     bx                                ; bx
  000E:000E  and      byte ptr [bp + si + 0x20], bl byte ptr [bp + si + 0x20], bl ; byte ptr [bp + si + 0x20], bl
  000F:0001  dec      bx                                ; bx
  000F:0002  inc      cx                                ; cx
  000F:0003  push     ax                                ; ax
  000F:0004  push     bp                                ; bp
  000F:0005  push     bx                                ; bx
  000F:0006  push     sp                                ; sp
  000F:0007  inc      cx                                ; cx
  000F:0008  and      byte ptr [bp + si + 0x20], bl byte ptr [bp + si + 0x20], bl ; byte ptr [bp + si + 0x20], bl
  000F:000B  push     di                                ; di
  000F:000C  push     dx                                ; dx
  000F:000D  dec      di                                ; di
  000F:000E  inc      di                                ; di
  000F:000F  inc      cx                                ; cx
  0010:0000  daa                                        ; 
  0010:0001  dec      di                                ; di
  0010:0002  pop      dx                                ; dx
  0010:0003  inc      bp                                ; bp
  0010:0004  push     di                                ; di
  0010:0005  dec      cx                                ; cx
  0010:0006  inc      cx                                ; cx
  0010:0007  dec      dx                                ; dx
  0010:0008  inc      cx                                ; cx
  0010:0009  inc      bx                                ; bx
  0010:000A  inc      bp                                ; bp
  0010:000B  and      byte ptr [bx + si + 0x49], dl byte ptr [bx + si + 0x49], dl ; byte ptr [bx + si + 0x49], dl
  0010:000E  push     di                                ; di
  0010:000F  push     bx                                ; bx
  0011:0000  dec      bx                                ; bx
  0011:0001  dec      di                                ; di
  0011:0002  and      byte ptr [bp + si + 0x20], bl byte ptr [bp + si + 0x20], bl ; byte ptr [bp + si + 0x20], bl
  0011:0005  dec      bx                                ; bx
  0011:0006  dec      di                                ; di
  0011:0007  dec      si                                ; si
  0011:0008  dec      bx                                ; bx
  0011:0009  push     dx                                ; dx
  0011:000A  inc      bp                                ; bp
  0011:000B  push     sp                                ; sp
  0011:000C  dec      si                                ; si
  0011:000D  pop      cx                                ; cx
  0011:000E  dec      bp                                ; bp
  0011:000F  and      byte ptr [bp + di + 0x4c], cl byte ptr [bp + di + 0x4c], cl ; byte ptr [bp + di + 0x4c], cl
  0012:0002  dec      cx                                ; cx
  0012:0003  dec      bp                                ; bp
  0012:0004  inc      cx                                ; cx
  0012:0005  push     sp                                ; sp
  0012:0006  inc      bp                                ; bp
  0012:0007  dec      bp                                ; bp
  0012:0008  sbb      al, 0x43 al, 0x43                 ; al, 0x43
  0012:000A  dec      cx                                ; cx
  0012:000B  inc      bp                                ; bp
  0012:000C  pop      dx                                ; dx
  0012:000D  dec      bx                                ; bx
  0012:000E  inc      cx                                ; cx
  0012:000F  and      byte ptr [bp + 0x41], al byte ptr [bp + 0x41], al ; byte ptr [bp + 0x41], al
  0013:0002  dec      dx                                ; dx
  0013:0003  dec      bx                                ; bx
  0013:0004  inc      cx                                ; cx
  0013:0005  and      byte ptr [bx + 0x44], cl byte ptr [bx + 0x44], cl ; byte ptr [bx + 0x44], cl
  0013:0008  and      byte ptr [si + 0x5a], al byte ptr [si + 0x5a], al ; byte ptr [si + 0x5a], al
  0013:000B  dec      cx                                ; cx
  0013:000C  inc      cx                                ; cx
  0013:000D  inc      sp                                ; sp
  0013:000E  inc      cx                                ; cx
  0013:000F  and      byte ptr [di + 0x52], cl byte ptr [di + 0x52], cl ; byte ptr [di + 0x52], cl
  0014:0002  dec      di                                ; di
  0014:0003  pop      dx                                ; dx
  0014:0004  inc      cx                                ; cx
  0014:0005  sbb      word ptr [bp + di + 0x4f], cx word ptr [bp + di + 0x4f], cx ; word ptr [bp + di + 0x4f], cx
  0014:0008  dec      bp                                ; bp
  0014:0009  push     ax                                ; ax
  0014:000A  dec      sp                                ; sp
  0014:000B  inc      bp                                ; bp
  0014:000C  push     sp                                ; sp
  0014:000D  and      byte ptr [di + 0x42], dl byte ptr [di + 0x42], dl ; byte ptr [di + 0x42], dl
  0015:0000  push     dx                                ; dx
  0015:0001  inc      cx                                ; cx
  0015:0002  dec      si                                ; si
  0015:0003  and      byte ptr [bp + 0x49], al byte ptr [bp + 0x49], al ; byte ptr [bp + 0x49], al
  0015:0006  push     dx                                ; dx
  0015:0007  dec      bp                                ; bp
  0015:0008  pop      cx                                ; cx
  0015:0009  and      byte ptr [bp + si], ah byte ptr [bp + si], ah ; byte ptr [bp + si], ah
  0015:000B  push     bx                                ; bx
  0015:000C  pop      cx                                ; cx
  0015:000D  inc      si                                ; si
  0015:000E  and      dl, byte ptr [bp + si] dl, byte ptr [bp + si] ; dl, byte ptr [bp + si]
  0016:0000  inc      di                                ; di
  0016:0001  inc      cx                                ; cx
  0016:0002  push     dx                                ; dx
  0016:0003  dec      si                                ; si
  0016:0004  dec      cx                                ; cx
  0016:0005  push     sp                                ; sp
  0016:0006  push     bp                                ; bp
  0016:0007  push     dx                                ; dx
  0016:0008  and      byte ptr [bp + si + 0x20], bl byte ptr [bp + si + 0x20], bl ; byte ptr [bp + si + 0x20], bl
  0016:000B  dec      bx                                ; bx
  0016:000C  dec      di                                ; di
  0016:000D  dec      sp                                ; sp
  0016:000E  inc      bx                                ; bx
  0016:000F  inc      cx                                ; cx
  0017:0000  dec      bp                                ; bp
  0017:0001  dec      cx                                ; cx
  0017:0002  adc      word ptr [di + 0x41], cx word ptr [di + 0x41], cx ; word ptr [di + 0x41], cx
  0017:0005  dec      sp                                ; sp
  0017:0006  inc      cx                                ; cx
  0017:0007  and      byte ptr [bp + si + 0x55], al byte ptr [bp + si + 0x55], al ; byte ptr [bp + si + 0x55], al
  0017:000A  push     sp                                ; sp
  0017:000B  inc      bp                                ; bp
  0017:000C  dec      sp                                ; sp
  0017:000D  dec      bx                                ; bx
  0017:000E  inc      bp                                ; bp
  0017:000F  and      byte ptr [di + 0x41], cl byte ptr [di + 0x41], cl ; byte ptr [di + 0x41], cl
  0018:0002  dec      si                                ; si
  0018:0003  pop      cx                                ; cx
  0018:0004  push     ds                                ; ds
  0018:0005  inc      sp                                ; sp
  0018:0006  inc      bp                                ; bp
  0018:0007  dec      sp                                ; sp
  0018:0008  dec      cx                                ; cx
  0018:0009  dec      bx                                ; bx
  0018:000A  inc      cx                                ; cx
  0018:000B  push     sp                                ; sp
  0018:000C  dec      si                                ; si
  0018:000D  pop      cx                                ; cx
  0018:000E  and      byte ptr [bp + di + 0x48], al byte ptr [bp + di + 0x48], al ; byte ptr [bp + di + 0x48], al
  0019:0001  dec      di                                ; di
  0019:0002  inc      bx                                ; bx
  0019:0003  and      byte ptr [bp + di + 0x5a], dl byte ptr [bp + di + 0x5a], dl ; byte ptr [bp + di + 0x5a], dl
  0019:0006  dec      di                                ; di
  0019:0007  push     dx                                ; dx
  0019:0008  push     bx                                ; bx
  0019:0009  push     sp                                ; sp
  0019:000A  dec      bx                                ; bx
  0019:000B  dec      cx                                ; cx
  0019:000C  and      byte ptr [si + 0x49], cl byte ptr [si + 0x49], cl ; byte ptr [si + 0x49], cl
  0019:000F  push     bx                                ; bx
  001A:0000  push     sp                                ; sp
  001A:0001  inc      bp                                ; bp
  001A:0002  dec      bx                                ; bx
  001A:0003  push     ds                                ; ds
  001A:0004  dec      bx                                ; bx
  001A:0005  inc      cx                                ; cx
  001A:0006  push     bx                                ; bx
  001A:0007  inc      bp                                ; bp
  001A:0008  push     sp                                ; sp
  001A:0009  inc      cx                                ; cx
  001A:000A  and      byte ptr [si + 0x49], cl byte ptr [si + 0x49], cl ; byte ptr [si + 0x49], cl
  001A:000D  push     dx                                ; dx
  001A:000E  dec      di                                ; di
  001A:000F  pop      cx                                ; cx
  001B:0000  inc      cx                                ; cx
  001B:0001  and      byte ptr [bp + si], bh byte ptr [bp + si], bh ; byte ptr [bp + si], bh
  001B:0003  and      byte ptr [si + 0x20], cl byte ptr [si + 0x20], cl ; byte ptr [si + 0x20], cl
  001B:0006  sub      ax, 0x4a20 ax, 0x4a20             ; ax, 0x4a20
  001B:0009  inc      cx                                ; cx
  001B:000A  dec      bx                                ; bx
  001B:000B  and      byte ptr [si + 0x49], cl byte ptr [si + 0x49], cl ; byte ptr [si + 0x49], cl
  001B:000E  push     dx                                ; dx
  001B:000F  dec      di                                ; di
  001C:0000  pop      cx                                ; cx
  001C:0001  and      byte ptr [di], bl byte ptr [di], bl ; byte ptr [di], bl
  001C:0003  push     ax                                ; ax
  001C:0004  dec      cx                                ; cx
  001C:0005  inc      di                                ; di
  001C:0006  push     bp                                ; bp
  001C:0007  dec      sp                                ; sp
  001C:0008  dec      bx                                ; bx
  001C:0009  inc      cx                                ; cx
  001C:000A  and      byte ptr [si + 0x52], dl byte ptr [si + 0x52], dl ; byte ptr [si + 0x52], dl
  001C:000D  inc      cx                                ; cx
  001C:000E  dec      si                                ; si
  001C:000F  push     bx                                ; bx
  001D:0000  push     ax                                ; ax
  001D:0001  dec      di                                ; di
  001D:0002  push     dx                                ; dx
  001D:0003  push     sp                                ; sp
  001D:0004  push     bp                                ; bp
  001D:0005  dec      dx                                ; dx
  001D:0006  inc      cx                                ; cx
  001D:0007  inc      bx                                ; bx
  001D:0008  inc      cx                                ; cx
  001D:0009  and      byte ptr [bx + si], ch byte ptr [bx + si], ch ; byte ptr [bx + si], ch
  001D:000B  dec      bp                                ; bp
  001D:000C  cmp      al, byte ptr [bx + 0x29] al, byte ptr [bx + 0x29] ; al, byte ptr [bx + 0x29]
  001D:000F  and      byte ptr [bx], dh byte ptr [bx], dh ; byte ptr [bx], dh
  001E:0001  push     ax                                ; ax
  001E:0002  push     dx                                ; dx
  001E:0003  pop      dx                                ; dx
  001E:0004  inc      bp                                ; bp
  001E:0005  push     ax                                ; ax
  001E:0006  push     bp                                ; bp
  001E:0007  push     bx                                ; bx
  001E:0008  push     sp                                ; sp
  001E:0009  dec      bx                                ; bx
  001E:000A  inc      cx                                ; cx
  001E:000B  and      byte ptr [bx + 0x4c], dl byte ptr [bx + 0x4c], dl ; byte ptr [bx + 0x4c], dl
  001E:000E  inc      cx                                ; cx
  001E:000F  push     bx                                ; bx
  001F:0000  dec      si                                ; si
  001F:0001  dec      di                                ; di
  001F:0002  push     dx                                ; dx
  001F:0003  inc      bp                                ; bp
  001F:0004  inc      bx                                ; bx
  001F:0005  pop      dx                                ; dx
  001F:0006  dec      si                                ; si
  001F:0007  dec      cx                                ; cx
  001F:0008  inc      bp                                ; bp
  001F:0009  and      byte ptr [bx + si + 0x4f], dl byte ptr [bx + si + 0x4f], dl ; byte ptr [bx + si + 0x4f], dl
  001F:000C  inc      sp                                ; sp
  001F:000D  push     ax                                ; ax
  001F:000E  dec      cx                                ; cx
  001F:000F  push     bx                                ; bx

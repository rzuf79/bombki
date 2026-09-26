['; BOMBKI.exe segment 0E42 -- proc slices at loader-fixed far-cell targets', '; 2 entry cells seeded.', '']

; ============ proc@0E42:0000 (entry cell) ============
  0E42:0000  cmp      byte ptr [bp + di - 0x29c2], al
  0E42:0004  add      word ptr [bx + si], bx    
  0E42:0006  jne      0xe42b                    
  0E42:0008  jmp      0xe304                    

; ============ proc@0E42:9A57 (entry cell) ============
  17E7:0007  jno      0x17e95                   
  17E7:0009  lcall    0x1c71, 0x291             
  17E7:000E  mov      ax, 0x7d0                 
  17E8:0001  push     ax                        
  17E8:0002  lcall    0x1c0f, 0x2a8             
  17E8:0007  cmp      word ptr [0x1c8], 0       
  17E8:000C  jg       0x17e91                   
  17E8:000E  jmp      0x17f8d                   

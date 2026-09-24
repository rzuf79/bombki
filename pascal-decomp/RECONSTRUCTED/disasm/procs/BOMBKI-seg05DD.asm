['; BOMBKI.exe segment 05DD -- proc slices at loader-fixed far-cell targets', '; 2 entry cells seeded.', '']

; ============ proc@05DD:0000 (entry cell) ============
  05DD:0000  je       0x5dd5                    
  05DD:0002  jmp      0x5ef8                    

; ============ proc@05DD:1C71 (entry cell) ============
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

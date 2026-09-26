['; BOMBKI.exe segment 129D -- proc slices at loader-fixed far-cell targets', '; 1 entry cells seeded.', '']

; ============ proc@129D:0000 (entry cell) ============
  129D:0000  or       dl, byte ptr [bx + 0x59]  
  129D:0003  inc      bx                        
  129D:0004  dec      cx                        
  129D:0005  inc      cx                        
  129D:0006  inc      di                        
  129D:0007  inc      cx                        
  129D:0008  push     bx                        
  129D:0009  pop      dx                        
  129D:000A  and      byte ptr [bp + si], dl    
  129D:000C  and      byte ptr [di + 0x4f], cl  
  129D:000F  dec      si                        
  129E:0000  inc      bp                        
  129E:0001  push     sp                        
  129E:0002  and      byte ptr [bp + si + 0x20], bl
  129E:0005  inc      bx                        
  129E:0006  dec      cx                        
  129E:0007  inc      cx                        
  129E:0008  dec      sp                        
  129E:0009  inc      cx                        
  129E:000A  and      byte ptr [bx + si + 0x53], dl
  129E:000D  inc      cx                        
  129E:000E  daa                                
  129E:000F  push     di                        
  129F:0000  pop      cx                        
  129F:0001  inc      bx                        
  129F:0002  dec      cx                        
  129F:0003  inc      cx                        
  129F:0004  inc      di                        
  129F:0005  inc      cx                        
  129F:0006  push     bx                        
  129F:0007  pop      dx                        
  129F:0008  and      byte ptr [bp + si + 0x41], bl
  129F:000B  dec      bx                        
  129F:000C  push     dx                        
  129F:000D  push     di                        
  129F:000E  inc      cx                        
  129F:000F  push     di                        
  12A0:0000  dec      cx                        
  12A0:0001  dec      di                        
  12A0:0002  dec      si                        
  12A0:0003  inc      bp                        
  12A0:0004  and      byte ptr [bp + di + 0x45], dl
  12A0:0007  push     dx                        
  12A0:0008  inc      bx                        
  12A0:0009  inc      bp                        
  12A0:000A  and      byte ptr [bp + si + 0x20], bl
  12A0:000D  inc      bx                        
  12A0:000E  dec      cx                        
  12A0:000F  inc      cx                        
  12A1:0000  dec      sp                        
  12A1:0001  inc      cx                        
  12A1:0002  and      byte ptr [bx + si + 0x53], dl
  12A1:0005  inc      cx                        
  12A1:0006  push     bp                        
  12A1:0007  mov      bp, sp                    
  12A1:0009  xor      ax, ax                    
  12A1:000B  lcall    0x1c71, 0x2cd             
  12A2:0000  mov      word ptr [0x1b0], 0xa     
  12A2:0006  mov      word ptr [0x1b8], 0xa     
  12A2:000C  mov      word ptr [0x1b6], 5       
  12A3:0002  push     cs                        
  12A3:0003  call     0x16e76                   
  12A3:0006  mov      ax, 0xf                   
  12A3:0009  push     ax                        
  12A3:000A  lcall    0x1c71, 0xbe4             
  12A3:000F  mov      word ptr [0x212], ax      
  12A4:0002  mov      di, 0x7a2                 
  12A4:0005  push     ds                        
  12A4:0006  push     di                        
  12A4:0007  mov      di, 0                     
  12A4:000A  push     cs                        
  12A4:000B  push     di                        
  12A4:000C  xor      ax, ax                    
  12A4:000E  push     ax                        
  12A4:000F  lcall    0x1c71, 0x701             
  12A5:0004  mov      ax, word ptr [0x212]      
  12A5:0007  cdq                                
  12A5:0008  push     dx                        
  12A5:0009  push     ax                        
  12A5:000A  xor      ax, ax                    
  12A5:000C  push     ax                        
  12A5:000D  lcall    0x1c71, 0x789             
  12A6:0002  mov      di, 0xb                   
  12A6:0005  push     cs                        
  12A6:0006  push     di                        
  12A6:0007  xor      ax, ax                    
  12A6:0009  push     ax                        
  12A6:000A  lcall    0x1c71, 0x701             
  12A6:000F  lcall    0x1c71, 0x5dd             
  12A7:0004  lcall    0x1c71, 0x291             
  12A7:0009  mov      ax, word ptr [0x212]      
  12A7:000C  cdq                                
  12A7:000D  add      ax, word ptr [0x21a]      
  12A8:0001  adc      dx, word ptr [0x21c]      
  12A8:0005  mov      word ptr [0x21a], ax      
  12A8:0008  mov      word ptr [0x21c], dx      
  12A8:000C  cmp      word ptr [0x186], 0       
  12A9:0001  jne      0x12ac8                   
  12A9:0003  mov      ax, 0x14                  
  12A9:0006  push     ax                        
  12A9:0007  lcall    0x1c71, 0xbe4             
  12A9:000C  mov      word ptr [0x19e], ax      
  12A9:000F  cmp      word ptr [0x19e], 5       
  12AA:0004  jge      0x12ac8                   
  12AA:0006  mov      ax, word ptr [0x1d6]      
  12AA:0009  mov      word ptr [0x186], ax      
  12AA:000C  mov      di, 0x7a2                 
  12AA:000F  push     ds                        
  12AB:0000  push     di                        
  12AB:0001  mov      di, 0x1e                  
  12AB:0004  push     cs                        
  12AB:0005  push     di                        
  12AB:0006  xor      ax, ax                    
  12AB:0008  push     ax                        
  12AB:0009  lcall    0x1c71, 0x701             
  12AB:000E  lcall    0x1c71, 0x5dd             
  12AC:0003  lcall    0x1c71, 0x291             
  12AC:0008  pop      bp                        
  12AC:0009  retf                               

// BOMBKI-body.pas -- reconstructed game proc bodies (EXE image)
// DGROUP anchors: MONSTRA @0x1AC (21 ints), PRZEDM @~0x17E.
// Comments resolve memory operands to interface globals.

{ BODY-A  para 0E42:9A57  (MONSTRA/room logic)   abs=17E77 }
  {17E77}  jno      0x17e95                     
  {17E79}  lcall    0x1c71, 0x291               
  {17E7E}  mov      ax, 0x7d0                   
  {17E81}  push     ax                          
  {17E82}  lcall    0x1c0f, 0x2a8               
  {17E87}  cmp      word ptr [0x1c8], 0         
  {17E8C}  jg       0x17e91                     
  {17E8E}  jmp      0x17f8d                     
  {17E91}  mov      ax, word ptr [0x1ac]        
  {17E94}  cmp      ax, word ptr [0x1ca]        
  {17E98}  jg       0x17e9d                     
  {17E9A}  jmp      0x17f8d                     
  {17E9D}  mov      ax, word ptr [0x19c]        
  {17EA0}  cmp      ax, word ptr [0x1cc]        
  {17EA4}  jl       0x17ea9                     
  {17EA6}  jmp      0x17f8d                     
  {17EA9}  mov      ax, 0x64                    
  {17EAC}  push     ax                          
  {17EAD}  lcall    0x1c71, 0xbe4               
  {17EB2}  mov      word ptr [0x19e], ax        
  {17EB5}  mov      ax, word ptr [0x1c8]        
  {17EB8}  sub      ax, 0xa                     
  {17EBB}  cmp      ax, word ptr [0x19e]        
  {17EBF}  jge      0x17ec4                     
  {17EC1}  jmp      0x17f51                     
  {17EC4}  mov      al, byte ptr [0x25c]        
  {17EC7}  cwde                                 
  {17EC8}  push     ax                          
  {17EC9}  lcall    0x1c71, 0xbe4               
  {17ECE}  push     ax                          
  {17ECF}  mov      ax, 0xa                     
  {17ED2}  push     ax                          
  {17ED3}  lcall    0x1c71, 0xbe4               
  {17ED8}  pop      dx                          
  {17ED9}  add      ax, dx                      
  {17EDB}  mov      word ptr [0x19e], ax        
  {17EDE}  mov      al, 0xe                     
  {17EE0}  push     ax                          
  {17EE1}  lcall    0x1c0f, 0x263               
  {17EE6}  mov      di, 0x7a2                   
  {17EE9}  push     ds                          
  {17EEA}  push     di                          
  {17EEB}  mov      di, 0x4363                  
  {17EEE}  push     cs                          
  {17EEF}  push     di                          
  {17EF0}  xor      ax, ax                      
  {17EF2}  push     ax                          
  {17EF3}  lcall    0x1c71, 0x701               
  {17EF8}  mov      ax, word ptr [0x19e]        
  {17EFB}  cdq                                  
  {17EFC}  push     dx                          
  {17EFD}  push     ax                          
  {17EFE}  xor      ax, ax                      
  {17F00}  push     ax                          
  {17F01}  lcall    0x1c71, 0x789               
  {17F06}  mov      di, 0x41e0                  
  {17F09}  push     cs                          
  {17F0A}  push     di                          
  {17F0B}  xor      ax, ax                      
  {17F0D}  push     ax                          
  {17F0E}  lcall    0x1c71, 0x701               
  {17F13}  lcall    0x1c71, 0x5dd               
  {17F18}  lcall    0x1c71, 0x291               
  {17F1D}  mov      al, 0xf                     
  {17F1F}  push     ax                          
  {17F20}  lcall    0x1c0f, 0x263               
  {17F25}  mov      ax, 3                       
  {17F28}  push     ax                          
  {17F29}  lcall    0x1c71, 0xbe4               
  {17F2E}  xor      dx, dx                      
  {17F30}  mov      cx, ax                      
  {17F32}  mov      bx, dx                      
  {17F34}  mov      ax, word ptr [0x1ac]        
  {17F37}  cdq                                  
  {17F38}  sub      ax, cx                      
  {17F3A}  sbb      dx, bx                      
  {17F3C}  sub      ax, 3                       
  {17F3F}  sbb      dx, 0                       
  {17F42}  mov      word ptr [0x1ac], ax        
  {17F45}  mov      ax, word ptr [0x1b0]        
  {17F48}  sub      ax, word ptr [0x19e]        
  {17F4C}  mov      word ptr [0x1b0], ax        
  {17F4F}  jmp      0x17f6d                     
  {17F51}  mov      di, 0x7a2                   
  {17F54}  push     ds                          
  {17F55}  push     di                          
  {17F56}  mov      di, 0x437b                  
  {17F59}  push     cs                          
  {17F5A}  push     di                          
  {17F5B}  xor      ax, ax                      
  {17F5D}  push     ax                          
  {17F5E}  lcall    0x1c71, 0x701               
  {17F63}  lcall    0x1c71, 0x5dd               
  {17F68}  lcall    0x1c71, 0x291               
  {17F6D}  mov      ax, 2                       
  {17F70}  push     ax                          
  {17F71}  lcall    0x1c71, 0xbe4               
  {17F76}  xor      dx, dx                      
  {17F78}  mov      cx, ax                      
  {17F7A}  mov      bx, dx                      
  {17F7C}  mov      ax, word ptr [0x1ac]        
  {17F7F}  cdq                                  
  {17F80}  sub      ax, cx                      
  {17F82}  sbb      dx, bx                      
  {17F84}  sub      ax, 2                       
  {17F87}  sbb      dx, 0                       
  {17F8A}  mov      word ptr [0x1ac], ax        
  {17F8D}  cmp      word ptr [0x1ce], 0         
  {17F92}  jle      0x1800b                     
  {17F94}  mov      ax, word ptr [0x19c]        
  {17F97}  cmp      ax, word ptr [0x1d0]        
  {17F9B}  jge      0x1800b                     
  {17F9D}  cmp      word ptr [0x1ac], 0xe       
  {17FA2}  jle      0x1800b                     
  {17FA4}  mov      ax, word ptr [0x1ac]        
  {17FA7}  sub      ax, 0xf                     
  {17FAA}  mov      word ptr [0x1ac], ax        
  {17FAD}  mov      ax, 0x64                    
  {17FB0}  push     ax                          
  {17FB1}  lcall    0x1c71, 0xbe4               
  {17FB6}  mov      word ptr [0x19e], ax        
  {17FB9}  mov      ax, word ptr [0x19e]        
  {17FBC}  cmp      ax, word ptr [0x1ce]        
  {17FC0}  jg       0x17fef                     
  {17FC2}  mov      word ptr [0x1d2], 1         
  {17FC8}  mov      di, 0x7a2                   
  {17FCB}  push     ds                          
  {17FCC}  push     di                          
  {17FCD}  mov      di, 0x439e                  
  {17FD0}  push     cs                          
  {17FD1}  push     di                          
  {17FD2}  xor      ax, ax                      
  {17FD4}  push     ax                          
  {17FD5}  lcall    0x1c71, 0x701               
  {17FDA}  lcall    0x1c71, 0x5dd               
  {17FDF}  lcall    0x1c71, 0x291               
  {17FE4}  mov      ax, word ptr [0x1d4]        
  {17FE7}  sub      ax, 0x14                    
  {17FEA}  mov      word ptr [0x1d4], ax        
  {17FED}  jmp      0x1800b                     
  {17FEF}  mov      di, 0x7a2                   
  {17FF2}  push     ds                          
  {17FF3}  push     di                          
  {17FF4}  mov      di, 0x43d1                  
  {17FF7}  push     cs                          
  {17FF8}  push     di                          
  {17FF9}  xor      ax, ax                      
  {17FFB}  push     ax                          
  {17FFC}  lcall    0x1c71, 0x701               
  {18001}  lcall    0x1c71, 0x5dd               
  {18006}  lcall    0x1c71, 0x291               
  {1800B}  cmp      word ptr [0x19c], 1         
  {18010}  jl       0x18023                     
  {18012}  cmp      word ptr [0x1b0], 1         
  {18017}  jl       0x18023                     
  {18019}  cmp      word ptr [0x1d2], 1         
  {1801E}  je       0x18023                     
  {18020}  jmp      0x173bc                     
  {18023}  cmp      word ptr [0x1b0], 1         
  {18028}  jl       0x1802d                     
  {1802A}  jmp      0x1818e                     
  {1802D}  cmp      word ptr [0x19c], 0         
  {18032}  jg       0x18037                     
  {18034}  jmp      0x1818e                     
  {18037}  cmp      word ptr [0x664], 0x4b      
  {1803C}  jle      0x18046                     
  {1803E}  mov      ax, word ptr [0x1b4]        
  {18041}  dec      ax                          
  {18042}  dec      ax                          
  {18043}  mov      word ptr [0x1b4], ax        
  {18046}  cmp      word ptr [0x664], 0x73      
  {1804B}  jle      0x18056                     
  {1804D}  mov      ax, word ptr [0x1b4]        
  {18050}  sub      ax, 3                       
  {18053}  mov      word ptr [0x1b4], ax        
  {18056}  cmp      word ptr [0x1c6], 0x32      
  {1805B}  jle      0x18065                     
  {1805D}  mov      ax, word ptr [0x1b4]        
  {18060}  dec      ax                          
  {18061}  dec      ax                          
  {18062}  mov      word ptr [0x1b4], ax        
  {18065}  cmp      word ptr [0x1c6], 0x4b      
  {1806A}  jle      0x18074                     
  {1806C}  mov      ax, word ptr [0x1b4]        
  {1806F}  dec      ax                          
  {18070}  dec      ax                          
  {18071}  mov      word ptr [0x1b4], ax        
  {18074}  cmp      word ptr [0x1c6], 0x5f      
  {18079}  jle      0x18082                     
  {1807B}  mov      ax, word ptr [0x1b4]        
  {1807E}  dec      ax                          
  {1807F}  mov      word ptr [0x1b4], ax        
  {18082}  cmp      word ptr [0x1c8], 0x32      
  {18087}  jle      0x18092                     
  {18089}  mov      ax, word ptr [0x1b4]        
  {1808C}  sub      ax, 5                       
  {1808F}  mov      word ptr [0x1b4], ax        
  {18092}  cmp      word ptr [0x1c8], 0x5f      
  {18097}  jle      0x180a1                     
  {18099}  mov      ax, word ptr [0x1b4]        
  {1809C}  dec      ax                          
  {1809D}  dec      ax                          
  {1809E}  mov      word ptr [0x1b4], ax        
  {180A1}  cmp      word ptr [0x1b4], 0         
  {180A6}  jge      0x180ad                     
  {180A8}  xor      ax, ax                      
  {180AA}  mov      word ptr [0x1b4], ax        
  {180AD}  mov      di, 0x7a2                   
  {180B0}  push     ds                          
  {180B1}  push     di                          
  {180B2}  mov      di, 0x4401                  
  {180B5}  push     cs                          
  {180B6}  push     di                          
  {180B7}  xor      ax, ax                      
  {180B9}  push     ax                          
  {180BA}  lcall    0x1c71, 0x701               
  {180BF}  mov      ax, word ptr [0x1b4]        
  {180C2}  cdq                                  
  {180C3}  push     dx                          
  {180C4}  push     ax                          
  {180C5}  xor      ax, ax                      
  {180C7}  push     ax                          
  {180C8}  lcall    0x1c71, 0x789               
  {180CD}  mov      di, 0x441f                  
  {180D0}  push     cs                          
  {180D1}  push     di                          
  {180D2}  xor      ax, ax                      
  {180D4}  push     ax                          
  {180D5}  lcall    0x1c71, 0x701               
  {180DA}  lcall    0x1c71, 0x5dd               
  {180DF}  lcall    0x1c71, 0x291               
  {180E4}  mov      ax, word ptr [0x1b4]        
  {180E7}  add      ax, word ptr [0x1d4]        
  {180EB}  mov      word ptr [0x1d4], ax        
  {180EE}  mov      byte ptr [0x25e], 0         
  {180F3}  mov      byte ptr [0x25f], 0         
  {180F8}  cmp      word ptr [0x248], 0         
  {180FD}  jle      0x18106                     
  {180FF}  mov      ax, word ptr [0x24a]        
  {18102}  dec      ax                          
  {18103}  mov      word ptr [0x24a], ax        
  {18106}  cmp      byte ptr [0x258], 0         
  {1810B}  jg       0x18110                     
  {1810D}  jmp      0x1818e                     
  {18110}  mov      ax, 0x64                    
  {18113}  push     ax                          
  {18114}  lcall    0x1c71, 0xbe4               
  {18119}  mov      word ptr [0x19e], ax        
  {1811C}  mov      al, byte ptr [0x258]        
  {1811F}  cwde                                 
  {18120}  cmp      ax, word ptr [0x19e]        
  {18124}  jle      0x1818e                     
  {18126}  mov      di, 0x7a2                   
  {18129}  push     ds                          
  {1812A}  push     di                          
  {1812B}  mov      di, 0x4429                  
  {1812E}  push     cs                          
  {1812F}  push     di                          
  {18130}  xor      ax, ax                      
  {18132}  push     ax                          
  {18133}  lcall    0x1c71, 0x701               
  {18138}  lcall    0x1c71, 0x5dd               
  {1813D}  lcall    0x1c71, 0x291               
  {18142}  mov      al, byte ptr [0x259]        
  {18145}  cwde                                 
  {18146}  sub      ax, 0xa                     
  {18149}  mov      byte ptr [0x259], al        
  {1814C}  mov      ax, word ptr [0x182]        
  {1814F}  inc      ax                          
  {18150}  mov      word ptr [0x182], ax           // PRZEDM.KUNSZT
  {18153}  cmp      word ptr [0x19e], 1         
  {18158}  jge      0x1818e                     
  {1815A}  cmp      byte ptr [0x258], 0x64      
  {1815F}  jge      0x1818e                     
  {18161}  mov      di, 0x7a2                   
  {18164}  push     ds                          
  {18165}  push     di                          
  {18166}  mov      di, 0x445c                  
  {18169}  push     cs                          
  {1816A}  push     di                          
  {1816B}  xor      ax, ax                      
  {1816D}  push     ax                          
  {1816E}  lcall    0x1c71, 0x701               
  {18173}  lcall    0x1c71, 0x5dd               
  {18178}  lcall    0x1c71, 0x291               
  {1817D}  mov      al, byte ptr [0x258]        
  {18180}  cwde                                 
  {18181}  inc      ax                          
  {18182}  mov      byte ptr [0x258], al        
  {18185}  mov      ax, word ptr [0x1d4]        
  {18188}  add      ax, 0xa                     
  {1818B}  mov      word ptr [0x1d4], ax        
  {1818E}  cmp      word ptr [0x19c], 1         
  {18193}  jge      0x181c0                     
  {18195}  mov      di, 0x7a2                   
  {18198}  push     ds                          
  {18199}  push     di                          
  {1819A}  mov      di, 0x447f                  
  {1819D}  push     cs                          
  {1819E}  push     di                          
  {1819F}  xor      ax, ax                      
  {181A1}  push     ax                          
  {181A2}  lcall    0x1c71, 0x701               
  {181A7}  lcall    0x1c71, 0x5dd               
  {181AC}  lcall    0x1c71, 0x291               
  {181B1}  mov      ax, 0xbb8                   
  {181B4}  push     ax                          
  {181B5}  lcall    0x1c0f, 0x2a8               
  {181BA}  mov      word ptr [0x1d6], 0x2710    
  {181C0}  xor      ax, ax                      
  {181C2}  mov      word ptr [0x1b4], ax        
  {181C5}  pop      bp                          
  {181C6}  retf                                 
  {181C7}  or       ax, word ptr [bp + si + 0x49]
  {181CA}  inc      bp                          
  {181CB}  push     dx                          
  {181CC}  pop      dx                          
  {181CD}  and      byte ptr [bp + di + 0x54], dl
  {181D0}  inc      cx                          
  {181D1}  push     dx                          
  {181D2}  pop      cx                          
  {181D3}  aas                                  
  {181D4}  push     ax                          
  {181D5}  dec      di                          
  {181D6}  inc      sp                          
  {181D7}  dec      si                          
  {181D8}  dec      di                          
  {181D9}  push     bx                          
  {181DA}  dec      cx                          
  {181DB}  push     bx                          
  {181DC}  pop      dx                          
  {181DD}  and      byte ptr [bp + di + 0x54], dl
  {181E0}  inc      cx                          
  {181E1}  push     dx                          
  {181E2}  pop      cx                          
  {181E3}  and      byte ptr [bp + si + 0x41], bl
  {181E6}  push     dx                          
  {181E7}  inc      sp                          
  {181E8}  pop      dx                          
  {181E9}  inc      bp                          
  {181EA}  push     di                          
  {181EB}  dec      cx                          
  {181EC}  inc      cx                          
  {181ED}  dec      sp                          
  {181EE}  pop      cx                          
  {181EF}  and      byte ptr [di + 0x49], cl    
  {181F2}  inc      bp                          
  {181F3}  inc      bx                          
  {181F4}  pop      dx                          
  {181F5}  and      byte ptr [bx + di + 0x20], cl
  {181F8}  dec      bp                          
  {181F9}  inc      cx                          
  {181FA}  push     bx                          
  {181FB}  pop      dx                          
  {181FC}  and      byte ptr [bp + si + 0x41], cl
  {181FF}  push     dx                          
  {18200}  dec      di                          
  {18201}  push     di                          
  {18202}  inc      bp                          
  {18203}  and      byte ptr [bp + si + 0x45], bl
  {18206}  and      byte ptr [bx + 0x4f], al    
  {18209}  and      byte ptr [bx + si + 0x4f], dl
  {1820C}  push     bx                          
  {1820D}  dec      cx                          
  {1820E}  inc      cx                          
  {1820F}  inc      sp                          
  {18210}  inc      cx                          
  {18211}  push     bx                          
  {18212}  pop      dx                          
  {18213}  or       al, byte ptr [bp + si + 0x49]
  {18216}  inc      bp                          
  {18217}  push     dx                          
  {18218}  pop      dx                          
  {18219}  and      byte ptr [di + 0x41], cl    
  {1821C}  dec      sp                          
  {1821D}  inc      cx                          
  {1821E}  and      al, 0x50                    
  {18220}  dec      di                          
  {18221}  inc      sp                          
  {18222}  dec      si                          
  {18223}  dec      di                          
  {18224}  push     bx                          
  {18225}  dec      cx                          
  {18226}  push     bx                          
  {18227}  pop      dx                          
  {18228}  and      byte ptr [di + 0x41], cl    
  {1822B}  dec      sp                          
  {1822C}  inc      cx                          
  {1822D}  and      byte ptr [si + 0x41], dl    
  {18230}  push     dx                          
  {18231}  inc      bx                          
  {18232}  pop      dx                          
  {18233}  inc      cx                          
  {18234}  and      byte ptr [bx + si], ch      
  {18236}  dec      dx                          
  {18237}  inc      bp                          
  {18238}  push     bx                          
  {18239}  push     sp                          
  {1823A}  and      byte ptr [bx + 0x4b], cl    
  {1823D}  push     dx                          
  {1823E}  inc      cx                          
  {1823F}  inc      di                          
  {18240}  dec      sp                          
  {18241}  inc      cx                          
  {18242}  sub      word ptr [bp + di], cx      
  {18244}  inc      dx                          
  {18245}  dec      cx                          
  {18246}  inc      bp                          
  {18247}  push     dx                          
  {18248}  pop      dx                          
  {18249}  and      byte ptr [bp + di + 0x45], dl
  {1824C}  push     dx                          
  {1824D}  inc      bx                          
  {1824E}  inc      bp                          
  {1824F}  and      al, 0x50                    
  {18251}  dec      di                          
  {18252}  inc      sp                          
  {18253}  dec      si                          
  {18254}  dec      di                          
  {18255}  push     bx                          
  {18256}  dec      cx                          
  {18257}  push     bx                          
  {18258}  pop      dx                          
  {18259}  and      byte ptr [bp + si + 0x41], bl
  {1825C}  dec      bx                          
  {1825D}  push     dx                          
  {1825E}  push     di                          
  {1825F}  inc      cx                          
  {18260}  push     di                          
  {18261}  dec      cx                          
  {18262}  dec      di                          
  {18263}  dec      si                          
  {18264}  inc      bp                          
  {18265}  and      byte ptr [bp + di + 0x45], dl
  {18268}  push     dx                          
  {18269}  inc      bx                          
  {1826A}  inc      bp                          
  {1826B}  and      byte ptr [bx + si], ch      
  {1826D}  inc      dx                          
  {1826E}  dec      sp                          
  {1826F}  inc      bp                          
  {18270}  inc      bp                          
  {18271}  inc      bp                          
  {18272}  inc      bp                          
  {18273}  sub      word ptr [si], cx           
  {18275}  inc      dx                          
  {18276}  dec      cx                          
  {18277}  inc      bp                          
  {18278}  push     dx                          
  {18279}  pop      dx                          
  {1827A}  and      byte ptr [si + 0x59], al    
  {1827D}  push     ax                          
  {1827E}  dec      sp                          
  {1827F}  dec      di                          
  {18280}  dec      bp                          
  {18281}  inc      si                          
  {18282}  push     ax                          
  {18283}  dec      di                          
  {18284}  inc      sp                          
  {18285}  dec      si                          
  {18286}  dec      di                          
  {18287}  push     bx                          
  {18288}  dec      cx                          
  {18289}  push     bx                          
  {1828A}  pop      dx                          
  {1828B}  and      byte ptr [si + 0x59], al    
  {1828E}  push     ax                          
  {1828F}  dec      sp                          
  {18290}  dec      di                          
  {18291}  dec      bp                          
  {18292}  and      byte ptr [di + 0x55], cl    
  {18295}  inc      sp                          
  {18296}  and      byte ptr [bp + di + 0x5a], dl
  {18299}  dec      bx                          
  {1829A}  dec      di                          
  {1829B}  dec      sp                          
  {1829C}  pop      cx                          
  {1829D}  and      byte ptr [si], ch           
  {1829F}  and      byte ptr [bx + di + 0x20], cl
  {182A2}  inc      bx                          
  {182A3}  pop      dx                          
  {182A4}  push     bp                          
  {182A5}  dec      dx                          
  {182A6}  inc      bp                          
  {182A7}  push     bx                          
  {182A8}  pop      dx                          
  {182A9}  and      byte ptr [bx + si + 0x52], dl
  {182AC}  pop      dx                          
  {182AD}  inc      bp                          
  {182AE}  push     ax                          
  {182AF}  dec      sp                          
  {182B0}  pop      cx                          
  {182B1}  push     di                          
  {182B2}  inc      cx                          
  {182B3}  dec      dx                          
  {182B4}  inc      cx                          
  {182B5}  inc      bx                          
  {182B6}  inc      cx                          
  {182B7}  and      byte ptr [bx + si + 0x52], dl
  {182BA}  pop      dx                          
  {182BB}  inc      bp                          
  {182BC}  pop      dx                          
  {182BD}  and      byte ptr [bp + di + 0x49], al
  {182C0}  inc      bp                          
  {182C1}  inc      dx                          
  {182C2}  dec      cx                          
  {182C3}  inc      bp                          
  {182C4}  and      byte ptr [di + 0x4f], cl    
  {182C7}  inc      bx                          
  {182C8}  or       ax, word ptr [bp + si + 0x49]
  {182CB}  inc      bp                          
  {182CC}  push     dx                          
  {182CD}  pop      dx                          
  {182CE}  and      byte ptr [bp + 0x41], al    
  {182D1}  dec      dx                          
  {182D2}  dec      bx                          
  {182D3}  inc      cx                          
  {182D4}  adc      byte ptr [bx + si + 0x4f], dl
  {182D7}  inc      sp                          
  {182D8}  dec      si                          
  {182D9}  dec      di                          
  {182DA}  push     bx                          
  {182DB}  dec      cx                          
  {182DC}  push     bx                          
  {182DD}  pop      dx                          
  {182DE}  and      byte ptr [bp + 0x41], al    
  {182E1}  dec      dx                          
  {182E2}  dec      bx                          
  {182E3}  inc      bp                          
  {182E4}  and      byte ptr [si], cl           
  {182E6}  dec      di                          
  {182E7}  inc      sp                          
  {182E8}  push     dx                          
  {182E9}  pop      dx                          
  {182EA}  push     bp                          
  {182EB}  inc      bx                          
  {182EC}  and      byte ptr [bp + di + 0x54], dl
  {182EF}  inc      cx                          
  {182F0}  push     dx                          
  {182F1}  pop      cx                          
  {182F2}  inc      bx                          
  {182F3}  dec      di                          
  {182F4}  inc      sp                          
  {182F5}  push     dx                          
  {182F6}  pop      dx                          
  {182F7}  push     bp                          
  {182F8}  inc      bx                          
  {182F9}  inc      cx                          
  {182FA}  push     bx                          
  {182FB}  pop      dx                          
  {182FC}  and      byte ptr [bp + di + 0x54], dl
  {182FF}  inc      cx                          
  {18300}  push     dx                          
  {18301}  pop      cx                          
  {18302}  and      byte ptr [bp + si + 0x41], bl
  {18305}  push     dx                          
  {18306}  inc      sp                          
  {18307}  pop      dx                          
  {18308}  inc      bp                          
  {18309}  push     di                          
  {1830A}  dec      cx                          
  {1830B}  inc      cx                          
  {1830C}  dec      sp                          
  {1830D}  pop      cx                          
  {1830E}  and      byte ptr [di + 0x49], cl    
  {18311}  inc      bp                          
  {18312}  inc      bx                          
  {18313}  pop      dx                          
  {18314}  and      byte ptr [bx + di + 0x20], cl
  {18317}  dec      bp                          
  {18318}  inc      cx                          
  {18319}  push     bx                          
  {1831A}  pop      dx                          
  {1831B}  and      byte ptr [bp + si + 0x41], cl
  {1831E}  push     dx                          
  {1831F}  dec      di                          
  {18320}  push     di                          
  {18321}  inc      bp                          
  {18322}  and      byte ptr [bp + si + 0x45], bl
  {18325}  and      byte ptr [bx + 0x4f], al    
  {18328}  and      byte ptr [bp + 0x49], cl    
  {1832B}  inc      bp                          
  {1832C}  and      byte ptr [bx + si + 0x4f], dl
  {1832F}  push     bx                          
  {18330}  dec      cx                          
  {18331}  inc      cx                          
  {18332}  inc      sp                          
  {18333}  inc      cx                          
  {18334}  push     bx                          
  {18335}  pop      dx                          
  {18336}  or       al, 0x4f                    
  {18338}  inc      sp                          
  {18339}  push     dx                          
  {1833A}  pop      dx                          
  {1833B}  push     bp                          
  {1833C}  inc      bx                          
  {1833D}  and      byte ptr [bp + 0x41], al    
  {18340}  dec      dx                          
  {18341}  dec      bx                          
  {18342}  inc      cx                          
  {18343}  adc      byte ptr [bx + 0x59], dl    
  {18346}  push     dx                          
  {18347}  pop      dx                          
  {18348}  push     bp                          
  {18349}  inc      bx                          
  {1834A}  inc      cx                          
  {1834B}  push     bx                          
  {1834C}  pop      dx                          
  {1834D}  and      byte ptr [bp + 0x41], al    
  {18350}  dec      dx                          
  {18351}  dec      bx                          
  {18352}  inc      bp                          
  {18353}  and      byte ptr [bp + di], cl      
  {18355}  dec      di                          
  {18356}  inc      sp                          
  {18357}  push     dx                          
  {18358}  pop      dx                          
  {18359}  push     bp                          
  {1835A}  inc      bx                          
  {1835B}  and      byte ptr [di + 0x41], cl    
  {1835E}  dec      sp                          
  {1835F}  inc      cx                          
  {18360}  sbb      ax, 0x444f                  
  {18363}  push     dx                          
  {18364}  pop      dx                          
  {18365}  push     bp                          
  {18366}  inc      bx                          
  {18367}  inc      cx                          
  {18368}  push     bx                          
  {18369}  pop      dx                          
  {1836A}  and      byte ptr [di + 0x41], cl    
  {1836D}  dec      sp                          
  {1836E}  inc      cx                          
  {1836F}  and      byte ptr [bp + si + 0x57], bl
  {18372}  pop      cx                          
  {18373}  dec      bx                          
  {18374}  dec      sp                          
  {18375}  inc      cx                          
  {18376}  and      byte ptr [si + 0x41], dl    
  {18379}  push     dx                          
  {1837A}  inc      bx                          
  {1837B}  pop      dx                          
  {1837C}  inc      bp                          
  {1837D}  and      byte ptr [si], cl           
  {1837F}  dec      di                          
  {18380}  inc      sp                          
  {18381}  push     dx                          
  {18382}  pop      dx                          
  {18383}  push     bp                          
  {18384}  inc      bx                          
  {18385}  and      byte ptr [bp + di + 0x45], dl
  {18388}  push     dx                          
  {18389}  inc      bx                          
  {1838A}  inc      bp                          
  {1838B}  sbb      al, 0x4f                    
  {1838D}  inc      sp                          
  {1838E}  push     dx                          
  {1838F}  pop      dx                          
  {18390}  push     bp                          
  {18391}  inc      bx                          
  {18392}  inc      cx                          
  {18393}  push     bx                          
  {18394}  pop      dx                          
  {18395}  and      byte ptr [bp + si + 0x41], bl
  {18398}  dec      bx                          
  {18399}  push     dx                          
  {1839A}  push     di                          
  {1839B}  inc      cx                          
  {1839C}  push     di                          
  {1839D}  dec      cx                          
  {1839E}  dec      di                          
  {1839F}  dec      si                          
  {183A0}  inc      bp                          
  {183A1}  and      byte ptr [bp + di + 0x45], dl
  {183A4}  push     dx                          
  {183A5}  inc      bx                          
  {183A6}  inc      bp                          
  {183A7}  and      byte ptr [di], cl           
  {183A9}  dec      di                          
  {183AA}  inc      sp                          
  {183AB}  push     dx                          
  {183AC}  pop      dx                          
  {183AD}  push     bp                          
  {183AE}  inc      bx                          
  {183AF}  and      byte ptr [si + 0x59], al    
  {183B2}  push     ax                          
  {183B3}  dec      sp                          
  {183B4}  dec      di                          
  {183B5}  dec      bp                          
  {183B6}  dec      di                          
  {183B7}  dec      di                          
  {183B8}  inc      sp                          
  {183B9}  push     dx                          
  {183BA}  pop      dx                          
  {183BB}  push     bp                          
  {183BC}  inc      bx                          
  {183BD}  inc      cx                          
  {183BE}  push     bx                          
  {183BF}  pop      dx                          
  {183C0}  and      byte ptr [si + 0x59], al    
  {183C3}  push     ax                          
  {183C4}  dec      sp                          
  {183C5}  dec      di                          
  {183C6}  dec      bp                          
  {183C7}  and      byte ptr [di + 0x55], cl    
  {183CA}  inc      sp                          
  {183CB}  and      byte ptr [bp + di + 0x5a], dl
  {183CE}  dec      bx                          
  {183CF}  dec      di                          
  {183D0}  dec      sp                          
  {183D1}  pop      cx                          
  {183D2}  and      byte ptr [si], ch           
  {183D4}  and      byte ptr [bx + di + 0x20], cl
  {183D7}  push     ax                          
  {183D8}  push     dx                          
  {183D9}  pop      dx                          
  {183DA}  inc      bp                          
  {183DB}  push     bx                          
  {183DC}  push     sp                          
  {183DD}  inc      cx                          
  {183DE}  dec      dx                          
  {183DF}  inc      bp                          
  {183E0}  push     bx                          
  {183E1}  pop      dx                          
  {183E2}  and      byte ptr [bp + di + 0x5a], al
  {183E5}  push     bp                          
  {183E6}  inc      bx                          
  {183E7}  and      byte ptr [bx + si + 0x52], dl
  {183EA}  pop      dx                          
  {183EB}  inc      bp                          
  {183EC}  push     ax                          
  {183ED}  dec      sp                          
  {183EE}  pop      cx                          
  {183EF}  push     di                          
  {183F0}  inc      cx                          
  {183F1}  dec      dx                          
  {183F2}  inc      cx                          
  {183F3}  inc      bx                          
  {183F4}  inc      cx                          
  {183F5}  and      byte ptr [bx + si + 0x52], dl
  {183F8}  pop      dx                          
  {183F9}  inc      bp                          
  {183FA}  pop      dx                          
  {183FB}  and      byte ptr [bp + di + 0x49], al
  {183FE}  inc      bp                          
  {183FF}  inc      dx                          
  {18400}  dec      cx                          
  {18401}  inc      bp                          
  {18402}  and      byte ptr [di + 0x4f], cl    
  {18405}  inc      bx                          
  {18406}  push     bp                          
  {18407}  mov      bp, sp                      
  {18409}  xor      ax, ax                      
  {1840B}  lcall    0x1c71, 0x2cd               
  {18410}  mov      di, 0x564                   
  {18413}  push     ds                          
  {18414}  push     di                          
  {18415}  mov      di, 0x57f7                  
  {18418}  push     cs                          
  {18419}  push     di                          
  {1841A}  lcall    0x1c71, 0x9d7               
  {1841F}  jne      0x18453                     
  {18421}  mov      ax, word ptr [0x17e]        
  {18424}  cmp      ax, word ptr [0x180]        
  {18428}  jne      0x18453                     
  {1842A}  mov      di, 0x7a2                   
  {1842D}  push     ds                          
  {1842E}  push     di                          
  {1842F}  mov      di, 0x5803                  
  {18432}  push     cs                          
  {18433}  push     di                          
  {18434}  xor      ax, ax                      
  {18436}  push     ax                          
  {18437}  lcall    0x1c71, 0x701               
  {1843C}  lcall    0x1c71, 0x5dd               
  {18441}  lcall    0x1c71, 0x291               
  {18446}  mov      word ptr [0x17e], 0xfff6    
  {1844C}  mov      ax, word ptr [0x182]        
  {1844F}  inc      ax                          
  {18450}  mov      word ptr [0x182], ax           // PRZEDM.KUNSZT
  {18453}  mov      di, 0x564                   
  {18456}  push     ds                          
  {18457}  push     di                          
  {18458}  mov      di, 0x5843                  
  {1845B}  push     cs                          
  {1845C}  push     di                          
  {1845D}  lcall    0x1c71, 0x9d7               
  {18462}  jne      0x18496                     
  {18464}  mov      ax, word ptr [0x184]        
  {18467}  cmp      ax, word ptr [0x180]        
  {1846B}  jne      0x18496                     
  {1846D}  mov      di, 0x7a2                   
  {18470}  push     ds                          
  {18471}  push     di                          
  {18472}  mov      di, 0x584e                  
  {18475}  push     cs                          
  {18476}  push     di                          
  {18477}  xor      ax, ax                      
  {18479}  push     ax                          
  {1847A}  lcall    0x1c71, 0x701               
  {1847F}  lcall    0x1c71, 0x5dd               
  {18484}  lcall    0x1c71, 0x291               
  {18489}  mov      word ptr [0x184], 0xfff6       // PRZEDM.PASZOL
  {1848F}  mov      ax, word ptr [0x182]        
  {18492}  inc      ax                          
  {18493}  mov      word ptr [0x182], ax           // PRZEDM.KUNSZT
  {18496}  mov      di, 0x564                   
  {18499}  push     ds                          
  {1849A}  push     di                          
  {1849B}  mov      di, 0x5873                  
  {1849E}  push     cs                          
  {1849F}  push     di                          
  {184A0}  lcall    0x1c71, 0x9d7               
  {184A5}  jne      0x184d9                     
  {184A7}  mov      ax, word ptr [0x186]        
  {184AA}  cmp      ax, word ptr [0x180]        
  {184AE}  jne      0x184d9                     
  {184B0}  mov      di, 0x7a2                   
  {184B3}  push     ds                          
  {184B4}  push     di                          
  {184B5}  mov      di, 0x587f                  
  {184B8}  push     cs                          
  {184B9}  push     di                          
  {184BA}  xor      ax, ax                      
  {184BC}  push     ax                          
  {184BD}  lcall    0x1c71, 0x701               
  {184C2}  lcall    0x1c71, 0x5dd               
  {184C7}  lcall    0x1c71, 0x291               
  {184CC}  mov      word ptr [0x186], 0xfff6       // PRZEDM.WIMP
  {184D2}  mov      ax, word ptr [0x182]        
  {184D5}  inc      ax                          
  {184D6}  mov      word ptr [0x182], ax           // PRZEDM.KUNSZT
  {184D9}  mov      di, 0x564                   
  {184DC}  push     ds                          
  {184DD}  push     di                          
  {184DE}  mov      di, 0x58a4                  
  {184E1}  push     cs                          
  {184E2}  push     di                          
  {184E3}  lcall    0x1c71, 0x9d7               
  {184E8}  jne      0x18525                     
  {184EA}  mov      ax, word ptr [0x188]        
  {184ED}  cmp      ax, word ptr [0x180]        
  {184F1}  jne      0x18525                     
  {184F3}  mov      di, 0x7a2                   
  {184F6}  push     ds                          
  {184F7}  push     di                          
  {184F8}  mov      di, 0x58b1                  
  {184FB}  push     cs                          
  {184FC}  push     di                          
  {184FD}  xor      ax, ax                      
  {184FF}  push     ax                          
  {18500}  lcall    0x1c71, 0x701               
  {18505}  lcall    0x1c71, 0x5dd               
  {1850A}  lcall    0x1c71, 0x291               
  {1850F}  mov      word ptr [0x188], 0xfff6       // PRZEDM.ZWIEJ
  {18515}  mov      ax, word ptr [0x664]        
  {18518}  add      ax, 5                       
  {1851B}  mov      word ptr [0x664], ax        
  {1851E}  mov      ax, word ptr [0x182]        
  {18521}  inc      ax                          
  {18522}  mov      word ptr [0x182], ax           // PRZEDM.KUNSZT
  {18525}  mov      di, 0x564                   
  {18528}  push     ds                          
  {18529}  push     di                          
  {1852A}  mov      di, 0x58f8                  
  {1852D}  push     cs                          
  {1852E}  push     di                          
  {1852F}  lcall    0x1c71, 0x9d7               
  {18534}  jne      0x18578                     
  {18536}  mov      ax, word ptr [0x18a]        
  {18539}  cmp      ax, word ptr [0x180]        
  {1853D}  jne      0x18578                     
  {1853F}  mov      di, 0x7a2                   
  {18542}  push     ds                          
  {18543}  push     di                          
  {18544}  mov      di, 0x5904                  
  {18547}  push     cs                          
  {18548}  push     di                          
  {18549}  xor      ax, ax                      
  {1854B}  push     ax                          
  {1854C}  lcall    0x1c71, 0x701               
  {18551}  lcall    0x1c71, 0x5dd               
  {18556}  lcall    0x1c71, 0x291               
  {1855B}  mov      word ptr [0x18a], 0xfff6    
  {18561}  mov      ax, word ptr [0x182]        
  {18564}  inc      ax                          
  {18565}  mov      word ptr [0x182], ax           // PRZEDM.KUNSZT
  {18568}  mov      ax, word ptr [0x18c]        
  {1856B}  cmp      ax, word ptr [0x196]        
  {1856F}  jge      0x18578                     
  {18571}  mov      ax, word ptr [0x18c]        
  {18574}  inc      ax                          
  {18575}  mov      word ptr [0x18c], ax        
  {18578}  mov      di, 0x564                   
  {1857B}  push     ds                          
  {1857C}  push     di                          
  {1857D}  mov      di, 0x5915                  
  {18580}  push     cs                          
  {18581}  push     di                          
  {18582}  lcall    0x1c71, 0x9d7               
  {18587}  jne      0x185b9                     
  {18589}  cmp      word ptr [0x17e], -0xa      
  {1858E}  jne      0x185b9                     
  {18590}  mov      di, 0x7a2                   
  {18593}  push     ds                          
  {18594}  push     di                          
  {18595}  mov      di, 0x5922                  
  {18598}  push     cs                          
  {18599}  push     di                          
  {1859A}  xor      ax, ax                      
  {1859C}  push     ax                          
  {1859D}  lcall    0x1c71, 0x701               
  {185A2}  lcall    0x1c71, 0x5dd               
  {185A7}  lcall    0x1c71, 0x291               
  {185AC}  mov      ax, word ptr [0x180]        
  {185AF}  mov      word ptr [0x17e], ax        
  {185B2}  mov      ax, word ptr [0x182]        
  {185B5}  dec      ax                          
  {185B6}  mov      word ptr [0x182], ax           // PRZEDM.KUNSZT
  {185B9}  mov      di, 0x564                   
  {185BC}  push     ds                          
  {185BD}  push     di                          
  {185BE}  mov      di, 0x5966                  
  {185C1}  push     cs                          
  {185C2}  push     di                          
  {185C3}  lcall    0x1c71, 0x9d7               
  {185C8}  jne      0x18601                     
  {185CA}  cmp      word ptr [0x18a], -0xa      
  {185CF}  jne      0x18601                     
  {185D1}  mov      di, 0x7a2                   
  {185D4}  push     ds                          
  {185D5}  push     di                          
  {185D6}  mov      di, 0x5973                  
  {185D9}  push     cs                          
  {185DA}  push     di                          
  {185DB}  xor      ax, ax                      
  {185DD}  push     ax                          
  {185DE}  lcall    0x1c71, 0x701               
  {185E3}  lcall    0x1c71, 0x5dd               
  {185E8}  lcall    0x1c71, 0x291               
  {185ED}  mov      ax, word ptr [0x180]        
  {185F0}  mov      word ptr [0x18a], ax        
  {185F3}  mov      ax, word ptr [0x182]        
  {185F6}  dec      ax                          
  {185F7}  mov      word ptr [0x182], ax           // PRZEDM.KUNSZT
  {185FA}  mov      ax, word ptr [0x18c]        
  {185FD}  dec      ax                          
  {185FE}  mov      word ptr [0x18c], ax        
  {18601}  mov      di, 0x564                   
  {18604}  push     ds                          
  {18605}  push     di                          
  {18606}  mov      di, 0x5984                  
  {18609}  push     cs                          
  {1860A}  push     di                          
  {1860B}  lcall    0x1c71, 0x9d7               
  {18610}  jne      0x18642                     
  {18612}  cmp      word ptr [0x184], -0xa         // PRZEDM.PASZOL
  {18617}  jne      0x18642                     
  {18619}  mov      di, 0x7a2                   
  {1861C}  push     ds                          
  {1861D}  push     di                          
  {1861E}  mov      di, 0x5990                  
  {18621}  push     cs                          
  {18622}  push     di                          
  {18623}  xor      ax, ax                      
  {18625}  push     ax                          
  {18626}  lcall    0x1c71, 0x701               
  {1862B}  lcall    0x1c71, 0x5dd               
  {18630}  lcall    0x1c71, 0x291               
  {18635}  mov      ax, word ptr [0x180]        
  {18638}  mov      word ptr [0x184], ax           // PRZEDM.PASZOL
  {1863B}  mov      ax, word ptr [0x182]        
  {1863E}  dec      ax                          
  {1863F}  mov      word ptr [0x182], ax           // PRZEDM.KUNSZT
  {18642}  mov      di, 0x564                   
  {18645}  push     ds                          
  {18646}  push     di                          
  {18647}  mov      di, 0x59ae                  
  {1864A}  push     cs                          
  {1864B}  push     di                          
  {1864C}  lcall    0x1c71, 0x9d7               
  {18651}  jne      0x18683                     
  {18653}  cmp      word ptr [0x186], -0xa         // PRZEDM.WIMP
  {18658}  jne      0x18683                     
  {1865A}  mov      di, 0x7a2                   
  {1865D}  push     ds                          
  {1865E}  push     di                          
  {1865F}  mov      di, 0x59bb                  
  {18662}  push     cs                          
  {18663}  push     di                          
  {18664}  xor      ax, ax                      
  {18666}  push     ax                          
  {18667}  lcall    0x1c71, 0x701               
  {1866C}  lcall    0x1c71, 0x5dd               
  {18671}  lcall    0x1c71, 0x291               
  {18676}  mov      ax, word ptr [0x180]        
  {18679}  mov      word ptr [0x186], ax           // PRZEDM.WIMP
  {1867C}  mov      ax, word ptr [0x182]        
  {1867F}  dec      ax                          
  {18680}  mov      word ptr [0x182], ax           // PRZEDM.KUNSZT
  {18683}  mov      di, 0x564                   
  {18686}  push     ds                          
  {18687}  push     di                          
  {18688}  mov      di, 0x59d8                  
  {1868B}  push     cs                          
  {1868C}  push     di                          
  {1868D}  lcall    0x1c71, 0x9d7               
  {18692}  jne      0x186cd                     
  {18694}  cmp      word ptr [0x188], -0xa         // PRZEDM.ZWIEJ
  {18699}  jne      0x186cd                     
  {1869B}  mov      di, 0x7a2                   
  {1869E}  push     ds                          
  {1869F}  push     di                          
  {186A0}  mov      di, 0x59e6                  
  {186A3}  push     cs                          
  {186A4}  push     di                          
  {186A5}  xor      ax, ax                      
  {186A7}  push     ax                          
  {186A8}  lcall    0x1c71, 0x701               
  {186AD}  lcall    0x1c71, 0x5dd               
  {186B2}  lcall    0x1c71, 0x291               
  {186B7}  mov      ax, word ptr [0x180]        
  {186BA}  mov      word ptr [0x188], ax           // PRZEDM.ZWIEJ
  {186BD}  mov      ax, word ptr [0x664]        
  {186C0}  sub      ax, 5                       
  {186C3}  mov      word ptr [0x664], ax        
  {186C6}  mov      ax, word ptr [0x182]        
  {186C9}  dec      ax                          
  {186CA}  mov      word ptr [0x182], ax           // PRZEDM.KUNSZT
  {186CD}  pop      bp                          
  {186CE}  retf                                 
  {186CF}  or       dl, byte ptr [di + 0x5a]    
  {186D2}  pop      cx                          
  {186D3}  dec      dx                          
  {186D4}  and      byte ptr [bp + 0x41], al    
  {186D7}  dec      dx                          
  {186D8}  dec      bx                          
  {186D9}  inc      cx                          
  {186DA}  sub      word ptr [bp + si + 0x41], bx
  {186DD}  push     ax                          
  {186DE}  inc      cx                          
  {186DF}  dec      sp                          
  {186E0}  inc      cx                          
  {186E1}  push     bx                          
  {186E2}  pop      dx                          
  {186E3}  and      byte ptr [bp + 0x41], al    
  {186E6}  dec      dx                          
  {186E7}  inc      bp                          
  {186E8}  inc      bx                          
  {186E9}  pop      dx                          
  {186EA}  dec      bx                          
  {186EB}  inc      bp                          
  {186EC}  and      byte ptr [bx + di + 0x20], cl
  {186EF}  push     ax                          
  {186F0}  pop      cx                          
  {186F1}  dec      bx                          
  {186F2}  inc      cx                          
  {186F3}  push     bx                          
  {186F4}  pop      dx                          
  {186F5}  and      byte ptr [bp + si + 0x20], bl
  {186F8}  pop      dx                          
  {186F9}  inc      cx                          
  {186FA}  inc      sp                          
  {186FB}  dec      di                          
  {186FC}  push     di                          
  {186FD}  dec      di                          
  {186FE}  dec      sp                          
  {186FF}  inc      bp                          
  {18700}  dec      si                          
  {18701}  dec      cx                          
  {18702}  inc      bp                          
  {18703}  dec      bp                          
  {18704}  or       dl, byte ptr [di + 0x5a]    
  {18707}  pop      cx                          
  {18708}  dec      dx                          
  {18709}  and      byte ptr [bp + di + 0x45], dl
  {1870C}  push     dx                          
  {1870D}  inc      bx                          
  {1870E}  inc      bp                          
  {1870F}  xor      bl, byte ptr [bp + si + 0x4a]
  {18712}  inc      cx                          
  {18713}  inc      sp                          
  {18714}  inc      cx                          
  {18715}  push     bx                          
  {18716}  pop      dx                          
  {18717}  and      byte ptr [bp + si + 0x41], bl
  {1871A}  dec      bx                          
  {1871B}  push     dx                          
  {1871C}  push     di                          
  {1871D}  inc      cx                          
  {1871E}  push     di                          
  {1871F}  dec      cx                          
  {18720}  dec      di                          
  {18721}  dec      si                          
  {18722}  inc      bp                          
  {18723}  and      byte ptr [bp + di + 0x45], dl
  {18726}  push     dx                          
  {18727}  inc      bx                          
  {18728}  inc      bp                          
  {18729}  and      byte ptr [bx + di + 0x20], cl
  {1872C}  dec      di                          
  {1872D}  inc      sp                          
  {1872E}  pop      dx                          
  {1872F}  pop      cx                          
  {18730}  push     bx                          
  {18731}  dec      bx                          
  {18732}  push     bp                          
  {18733}  dec      dx                          
  {18734}  inc      bp                          
  {18735}  push     bx                          
  {18736}  pop      dx                          
  {18737}  and      byte ptr [di], dh           
  {18739}  and      ax, 0x4520                  
  {1873C}  dec      si                          
  {1873D}  inc      bp                          
  {1873E}  push     dx                          
  {1873F}  inc      di                          
  {18740}  dec      cx                          
  {18741}  dec      cx                          
  {18742}  or       dx, word ptr [di + 0x5a]    
  {18745}  pop      cx                          
  {18746}  dec      dx                          
  {18747}  and      byte ptr [si + 0x59], al    
  {1874A}  push     ax                          
  {1874B}  dec      sp                          
  {1874C}  dec      di                          
  {1874D}  dec      bp                          
  {1874E}  pop      ss                          
  {1874F}  push     ax                          
  {18750}  inc      cx                          
  {18751}  push     sp                          
  {18752}  push     dx                          
  {18753}  pop      dx                          
  {18754}  pop      cx                          
  {18755}  push     bx                          
  {18756}  pop      dx                          
  {18757}  and      byte ptr [bp + di + 0x49], dl
  {1875A}  inc      bp                          
  {1875B}  and      byte ptr [bp + 0x41], cl    
  {1875E}  and      byte ptr [si + 0x59], al    
  {18761}  push     ax                          
  {18762}  dec      sp                          
  {18763}  dec      di                          
  {18764}  dec      bp                          
  {18765}  cmp      ah, byte ptr [0x2d2d]       
  {18769}  sub      ax, 0x2d2d                  
  {1876C}  sub      ax, 0x2d2d                  
  {1876F}  sub      ax, 0x2d2d                  
  {18772}  sub      ax, 0x2d2d                  
  {18775}  sub      ax, 0x2d2d                  
  {18778}  sub      ax, 0x2d2d                  
  {1877B}  sub      ax, 0x2d2d                  
  {1877E}  sub      ax, 0x2d2d                  
  {18781}  sub      ax, 0x2d2d                  
  {18784}  sub      ax, 0x2d2d                  
  {18787}  sub      ax, 0x2d2d                  
  {1878A}  sub      ax, 0x2d2d                  
  {1878D}  jl       0x187b0                     
  {18790}  and      byte ptr [bx + si], ah      
  {18792}  and      byte ptr [bx + si], ah      
  {18794}  and      byte ptr [bx + si], ah      
  {18796}  and      byte ptr [bx + si], ah      
  {18798}  inc      sp                          
  {18799}  pop      cx                          
  {1879A}  push     ax                          
  {1879B}  dec      sp                          
  {1879C}  dec      di                          
  {1879D}  dec      bp                          
  {1879E}  and      byte ptr [di + 0x55], cl    
  {187A1}  inc      sp                          
  {187A2}  and      byte ptr [bp + di + 0x5a], dl
  {187A5}  dec      bx                          
  {187A6}  dec      di                          
  {187A7}  dec      sp                          
  {187A8}  pop      cx                          
  {187A9}  and      byte ptr [bx + si], ah      
  {187AB}  and      byte ptr [bx + si], ah      
  {187AD}  and      byte ptr [bx + si], ah      
  {187AF}  and      byte ptr [bx + si], ah      
  {187B1}  and      byte ptr [bx + si], ah      
  {187B3}  jl       0x187db                     
  {187B5}  jl       0x187d7                     
  {187B7}  and      byte ptr [bx + si], ah      
  {187B9}  and      byte ptr [bx + si], ah      
  {187BB}  and      byte ptr [bx + si], ah      
  {187BD}  and      byte ptr [bx + si], ah      
  {187BF}  and      byte ptr [bx + si], ah      
  {187C1}  and      byte ptr [bx + si], ah      
  {187C3}  and      byte ptr [bx + si], ah      
  {187C5}  and      byte ptr [bx + si], ah      
  {187C7}  and      byte ptr [bx + si], ah      
  {187C9}  and      byte ptr [bx + si], ah      
  {187CB}  and      byte ptr [bx + si], ah      
  {187CD}  and      byte ptr [bx + si], ah      
  {187CF}  and      byte ptr [bx + si], ah      
  {187D1}  and      byte ptr [bx + si], ah      
  {187D3}  and      byte ptr [bx + si], ah      
  {187D5}  and      byte ptr [bx + si], ah      
  {187D7}  and      byte ptr [bx + si], ah      
  {187D9}  and      byte ptr [si + 0x26], bh    
  {187DC}  jl       0x187fe                     
  {187DE}  and      byte ptr [bp + si + 0x52], al
  {187E1}  inc      cx                          
  {187E2}  push     di                          
  {187E3}  dec      di                          
  {187E4}  and      word ptr [bx + si], sp      
  {187E6}  inc      dx                          
  {187E7}  inc      bp                          
  {187E8}  pop      dx                          
  {187E9}  and      byte ptr [bx + 0x49], dl    
  {187EC}  inc      bp                          
  {187ED}  dec      bx                          
  {187EE}  push     bx                          
  {187EF}  pop      dx                          
  {187F0}  pop      cx                          
  {187F1}  inc      bx                          
  {187F2}  dec      ax                          
  {187F3}  and      byte ptr [bx + si + 0x52], dl
  {187F6}  dec      di                          
  {187F7}  inc      dx                          
  {187F8}  dec      sp                          
  {187F9}  inc      bp                          
  {187FA}  dec      bp                          
  {187FB}  dec      di                          
  {187FC}  push     di                          
  {187FD}  and      byte ptr [bx + si], ah      
  {187FF}  and      byte ptr [bx + si], ah      
  {18801}  jl       0x18829                     
  {18803}  jl       0x18825                     
  {18805}  and      byte ptr [bx + si + 0x52], dl
  {18808}  pop      dx                          
  {18809}  inc      bp                          
  {1880A}  inc      dx                          
  {1880B}  push     dx                          
  {1880C}  dec      si                          
  {1880D}  inc      cx                          
  {1880E}  dec      sp                          
  {1880F}  inc      bp                          
  {18810}  push     bx                          
  {18811}  and      byte ptr [bx + si + 0x52], dl
  {18814}  pop      dx                          
  {18815}  inc      bp                          
  {18816}  pop      dx                          
  {18817}  and      byte ptr [di + 0x55], cl    
  {1881A}  inc      sp                          
  {1881B}  and      byte ptr [bp + di + 0x5a], dl
  {1881E}  dec      bx                          
  {1881F}  dec      di                          
  {18820}  dec      sp                          
  {18821}  inc      bp                          
  {18822}  and      byte ptr [bx + si], ah      
  {18824}  and      byte ptr [bx + si], ah      
  {18826}  and      byte ptr [bx + si], ah      
  {18828}  jl       0x18850                     
  {1882A}  jl       0x1884c                     
  {1882C}  and      byte ptr [bx + 0x20], dl    
  {1882F}  dec      si                          
  {18830}  inc      cx                          
  {18831}  inc      di                          
  {18832}  push     dx                          
  {18833}  dec      di                          
  {18834}  inc      sp                          
  {18835}  inc      bp                          
  {18836}  and      byte ptr [bp + si + 0x41], bl
  {18839}  and      byte ptr [si + 0x55], al    
  {1883C}  pop      dx                          
  {1883D}  inc      cx                          
  {1883E}  and      byte ptr [bx + di + 0x4b], al
  {18841}  push     sp                          
  {18842}  pop      cx                          
  {18843}  push     di                          
  {18844}  dec      si                          
  {18845}  dec      di                          
  {18846}  push     bx                          
  {18847}  inc      bx                          
  {18848}  and      byte ptr [bx + si], ah      
  {1884A}  and      byte ptr [bx + si], ah      
  {1884C}  and      byte ptr [bx + si], ah      
  {1884E}  and      byte ptr [si + 0x26], bh    
  {18851}  jl       0x18873                     
  {18853}  and      byte ptr [si + 0x41], al    
  {18856}  dec      dx                          
  {18857}  inc      bp                          
  {18858}  and      byte ptr [bp + di + 0x49], al
  {1885B}  and      byte ptr [bx + 0x54], cl    
  {1885E}  dec      di                          
  {1885F}  and      byte ptr [si + 0x45], dl    
  {18862}  dec      si                          
  {18863}  and      byte ptr [si + 0x59], al    
  {18866}  push     ax                          
  {18867}  dec      sp                          
  {18868}  dec      di                          
  {18869}  dec      bp                          
  {1886A}  and      byte ptr [di + 0x55], cl    
  {1886D}  inc      sp                          
  {1886E}  and      byte ptr [bp + di + 0x5a], dl
  {18871}  dec      bx                          
  {18872}  dec      di                          
  {18873}  dec      sp                          
  {18874}  pop      cx                          
  {18875}  and      byte ptr [si + 0x26], bh    
  {18878}  jl       0x188d9                     
  {1887A}  pop      di                          
  {1887B}  pop      di                          
  {1887C}  pop      di                          
  {1887D}  pop      di                          
  {1887E}  pop      di                          
  {1887F}  pop      di                          
  {18880}  pop      di                          
  {18881}  pop      di                          
  {18882}  pop      di                          
  {18883}  pop      di                          
  {18884}  pop      di                          
  {18885}  pop      di                          
  {18886}  pop      di                          
  {18887}  pop      di                          
  {18888}  pop      di                          
  {18889}  pop      di                          
  {1888A}  pop      di                          
  {1888B}  pop      di                          
  {1888C}  pop      di                          
  {1888D}  pop      di                          
  {1888E}  pop      di                          
  {1888F}  pop      di                          
  {18890}  pop      di                          
  {18891}  pop      di                          
  {18892}  pop      di                          
  {18893}  pop      di                          
  {18894}  pop      di                          
  {18895}  pop      di                          
  {18896}  pop      di                          
  {18897}  pop      di                          
  {18898}  pop      di                          
  {18899}  pop      di                          
  {1889A}  pop      di                          
  {1889B}  pop      di                          
  {1889C}  pop      di                          
  {1889D}  jl       0x188aa                     
  {1889F}  push     bp                          
  {188A0}  pop      dx                          
  {188A1}  pop      cx                          
  {188A2}  dec      dx                          
  {188A3}  and      byte ptr [bx + si + 0x41], dl
  {188A6}  inc      bx                          
  {188A7}  pop      dx                          
  {188A8}  inc      bp                          
  {188A9}  dec      bx                          
  {188AA}  xor      al, 0x5a                    
  {188AC}  dec      dx                          
  {188AD}  inc      cx                          
  {188AE}  inc      sp                          
  {188AF}  inc      cx                          
  {188B0}  push     bx                          
  {188B1}  pop      dx                          
  {188B2}  and      byte ptr [bx + si + 0x41], dl
  {188B5}  inc      bx                          
  {188B6}  pop      dx                          
  {188B7}  dec      bx                          
  {188B8}  inc      cx                          
  {188B9}  and      byte ptr [bx + di + 0x20], cl
  {188BC}  push     sp                          
  {188BD}  pop      cx                          
  {188BE}  dec      dx                          
  {188BF}  inc      bp                          
  {188C0}  push     bx                          
  {188C1}  pop      dx                          
  {188C2}  and      byte ptr [bx + di], dh      
  {188C4}  and      byte ptr [bp + di + 0x49], cl
  {188C7}  dec      sp                          
  {188C8}  dec      di                          
  {188C9}  and      byte ptr [bx + si], ch      
  {188CB}  inc      sp                          
  {188CC}  dec      di                          
  {188CD}  push     bx                          
  {188CE}  push     sp                          
  {188CF}  inc      cx                          
  {188D0}  dec      dx                          
  {188D1}  inc      bp                          
  {188D2}  push     bx                          
  {188D3}  pop      dx                          
  {188D4}  and      byte ptr [bx + si], bh      
  {188D6}  and      ax, 0x4e45                  
  {188D9}  inc      bp                          
  {188DA}  push     dx                          
  {188DB}  inc      di                          
  {188DC}  dec      cx                          
  {188DD}  dec      cx                          
  {188DE}  sub      word ptr [si], cx           
  {188E0}  push     bp                          
  {188E1}  pop      dx                          
  {188E2}  pop      cx                          
  {188E3}  dec      dx                          
  {188E4}  and      byte ptr [bp + di + 0x49], al
  {188E7}  inc      cx                          
  {188E8}  push     bx                          
  {188E9}  push     sp                          
  {188EA}  dec      bx                          
  {188EB}  dec      di                          
  {188EC}  aaa                                  
  {188ED}  pop      dx                          
  {188EE}  dec      dx                          
  {188EF}  inc      cx                          
  {188F0}  inc      sp                          
  {188F1}  inc      cx                          
  {188F2}  push     bx                          
  {188F3}  pop      dx                          
  {188F4}  and      byte ptr [bp + di + 0x49], al
  {188F7}  inc      cx                          
  {188F8}  push     bx                          
  {188F9}  push     sp                          
  {188FA}  dec      bx                          
  {188FB}  dec      di                          
  {188FC}  and      byte ptr [bx + di + 0x20], cl
  {188FF}  push     sp                          
  {18900}  pop      cx                          
  {18901}  dec      dx                          
  {18902}  inc      bp                          
  {18903}  push     bx                          
  {18904}  pop      dx                          
  {18905}  and      byte ptr [bp + si], dh      
  {18907}  and      byte ptr [bp + di + 0x49], cl
  {1890A}  dec      sp                          
  {1890B}  dec      di                          
  {1890C}  and      byte ptr [bx + si], ch      
  {1890E}  inc      sp                          
  {1890F}  dec      di                          
  {18910}  push     bx                          
  {18911}  push     sp                          
  {18912}  inc      cx                          
  {18913}  dec      dx                          
  {18914}  inc      bp                          
  {18915}  push     bx                          
  {18916}  pop      dx                          
  {18917}  and      byte ptr [bx + di], dh      
  {18919}  xor      ah, byte ptr [di]           
  {1891B}  and      byte ptr [di + 0x4e], al    
  {1891E}  inc      bp                          
  {1891F}  push     dx                          
  {18920}  inc      di                          
  {18921}  dec      cx                          
  {18922}  dec      cx                          
  {18923}  sub      word ptr [bx + si], dx      
  {18925}  push     bp                          
  {18926}  pop      dx                          
  {18927}  pop      cx                          
  {18928}  dec      dx                          
  {18929}  and      byte ptr [bp + di + 0x55], dl
  {1892C}  inc      bx                          
  {1892D}  dec      ax                          
  {1892E}  inc      cx                          
  {1892F}  and      byte ptr [bp + si + 0x41], dl
  {18932}  inc      bx                          
  {18933}  dec      dx                          
  {18934}  inc      cx                          
  {18935}  pop      dx                          
  {18937}  dec      dx                          
  {18938}  inc      cx                          
  {18939}  inc      sp                          
  {1893A}  inc      cx                          
  {1893B}  push     bx                          
  {1893C}  pop      dx                          
  {1893D}  and      byte ptr [bp + di + 0x55], dl
  {18940}  inc      bx                          
  {18941}  dec      ax                          
  {18942}  inc      cx                          
  {18943}  and      byte ptr [bp + si + 0x41], dl
  {18946}  inc      bx                          
  {18947}  dec      dx                          
  {18948}  inc      bp                          
  {18949}  and      byte ptr [bx + di + 0x20], cl
  {1894C}  inc      bx                          
  {1894D}  dec      ax                          
  {1894E}  push     bp                          
  {1894F}  inc      sp                          
  {18950}  dec      si                          
  {18951}  dec      cx                          
  {18952}  inc      bp                          
  {18953}  push     bx                          
  {18954}  pop      dx                          
  {18955}  and      byte ptr [bp + di], dh      
  {18957}  and      byte ptr [bp + di + 0x49], cl
  {1895A}  dec      sp                          
  {1895B}  dec      di                          
  {1895C}  and      byte ptr [bx + si], ch      
  {1895E}  inc      sp                          
  {1895F}  dec      di                          
  {18960}  push     bx                          
  {18961}  push     sp                          
  {18962}  inc      cx                          
  {18963}  dec      dx                          
  {18964}  inc      bp                          
  {18965}  push     bx                          
  {18966}  pop      dx                          
  {18967}  and      byte ptr [bx + di], dh      
  {18969}  and      ax, 0x4520                  
  {1896D}  dec      si                          
  {1896E}  inc      bp                          
  {1896F}  push     dx                          
  {18970}  inc      di                          
  {18971}  dec      cx                          
  {18972}  dec      cx                          
  {18973}  sub      word ptr [bp + si], cx      
  {18975}  push     bp                          
  {18976}  pop      dx                          
  {18977}  pop      cx                          
  {18978}  dec      dx                          
  {18979}  and      byte ptr [bp + si + 0x55], al
  {1897C}  dec      sp                          
  {1897D}  dec      bx                          
  {1897E}  inc      cx                          
  {1897F}  sub      bx, word ptr [bp + si + 0x4a]
  {18982}  inc      cx                          
  {18983}  inc      sp                          
  {18984}  inc      cx                          
  {18985}  push     bx                          
  {18986}  pop      dx                          
  {18987}  and      byte ptr [bp + si + 0x55], al
  {1898A}  dec      sp                          
  {1898B}  dec      bx                          
  {1898C}  inc      bp                          
  {1898D}  and      byte ptr [bx + di + 0x20], cl
  {18990}  push     bx                          
  {18991}  push     sp                          
  {18992}  push     di                          
  {18993}  dec      cx                          
  {18994}  inc      bp                          
  {18995}  push     dx                          
  {18996}  inc      sp                          
  {18997}  pop      dx                          
  {18998}  inc      cx                          
  {18999}  push     bx                          
  {1899A}  pop      dx                          
  {1899B}  and      byte ptr [bp + si + 0x45], bl
  {1899E}  and      byte ptr [bp + si + 0x59], bl
  {189A1}  push     bx                          
  {189A2}  dec      bx                          
  {189A3}  inc      cx                          
  {189A4}  dec      sp                          
  {189A5}  inc      bp                          
  {189A6}  push     bx                          
  {189A7}  and      byte ptr [bp + si], dh      
  {189A9}  xor      byte ptr [di], ah           
  {189AB}  adc      bl, byte ptr [bp + si + 0x4e]
  {189AE}  dec      cx                          
  {189AF}  push     bx                          
  {189B0}  pop      dx                          
  {189B1}  inc      bx                          
  {189B2}  pop      dx                          
  {189B3}  and      byte ptr [bx + si + 0x52], dl
  {189B6}  pop      dx                          
  {189B7}  inc      bp                          
  {189B8}  push     ax                          
  {189B9}  push     bp                          
  {189BA}  push     bx                          
  {189BB}  push     sp                          
  {189BC}  dec      bx                          
  {189BD}  inc      cx                          
  {189BE}  and      word ptr [bx + 0x52], ax    
  {189C1}  push     dx                          
  {189C2}  push     dx                          
  {189C3}  push     dx                          
  {189C4}  push     dx                          
  {189C5}  push     dx                          
  {189C6}  push     dx                          
  {189C7}  push     dx                          
  {189C8}  push     dx                          
  {189C9}  and      byte ptr [0x2e2e], ch       
  {189CD}  and      byte ptr cs:[bx + 0x4c], al 
  {189D1}  push     bp                          
  {189D2}  push     ax                          
  {189D3}  dec      cx                          
  {189D4}  inc      cx                          
  {189D5}  and      byte ptr [bx + si + 0x52], dl
  {189D8}  pop      dx                          
  {189D9}  inc      bp                          
  {189DA}  push     ax                          
  {189DB}  push     bp                          
  {189DC}  push     bx                          
  {189DD}  push     sp                          
  {189DE}  dec      bx                          
  {189DF}  inc      cx                          
  {189E0}  adc      byte ptr [bx + si + 0x41], dl
  {189E3}  push     sp                          
  {189E4}  push     dx                          
  {189E5}  pop      dx                          
  {189E6}  and      byte ptr [bx + si + 0x52], dl
  {189E9}  pop      dx                          
  {189EA}  inc      bp                          
  {189EB}  push     ax                          
  {189EC}  push     bp                          
  {189ED}  push     bx                          
  {189EE}  push     sp                          
  {189EF}  dec      bx                          
  {189F0}  inc      cx                          
  {189F1}  sbb      bh, byte ptr [si + 0x3d]    
  {189F4}  cmp      ax, 0x3d3d                  
  {189F7}  cmp      ax, 0x3d3d                  
  {189FA}  cmp      ax, 0x3d3d                  
  {189FD}  cmp      ax, 0x3d3d                  
  {18A00}  cmp      ax, 0x3d3d                  
  {18A03}  cmp      ax, 0x3d3d                  
  {18A06}  cmp      ax, 0x3d3d                  
  {18A09}  cmp      ax, 0x7c3d                  
  {18A0C}  sbb      bh, byte ptr [si + 0x20]    
  {18A0F}  dec      si                          
  {18A10}  imul     bp, word ptr [bp + 0x69], 0x6a65
  {18A15}  jae      0x18a91                     
  {18A17}  jns      0x18a86                     
  {18A19}  and      byte ptr [bp + si + 0x61], bh
  {18A1C}  jae      0x18a95                     
  {18A1E}  imul     sp, word ptr [bx + di + 0x64], 0x7a63
  {18A23}  popaw                                
  {18A24}  insw     word ptr es:[di], dx        
  {18A25}  and      byte ptr [si + 0x1a], bh    
  {18A28}  jl       0x18a4a                     
  {18A2A}  and      byte ptr [bx + di + 0x7a], cl
  {18A2D}  and      byte ptr [bx + 0x73], ch    
  {18A30}  outsw    dx, word ptr [si]           
  {18A31}  bound    sp, dword ptr [bx + di + 0x20]
  {18A34}  jo       0x18aa5                     
  {18A36}  jae      0x18aa1                     
  {18A38}  popaw                                
  {18A39}  popaw                                
  {18A3B}  push     0x61                        
  {18A3D}  arpl     word ptr [bx + di + 0x20], sp
  {18A40}  and      byte ptr [si + 0x1a], bh    
  {18A43}  jl       0x18a65                     
  {18A45}  and      byte ptr [bx + si], ah      
  {18A47}  and      byte ptr [bx + si], ah      
  {18A49}  and      byte ptr [si + 0x65], dl    
  {18A4C}  outsb    dx, byte ptr [si]           
  {18A4D}  and      byte ptr [si + 0x6f], ah    
  {18A50}  imul     si, word ptr [di + 0x6d], 0x65
  {18A54}  outsb    dx, byte ptr [si]           
  {18A55}  je       0x18a77                     
  {18A57}  and      byte ptr [bx + si], ah      
  {18A59}  and      byte ptr [bx + si], ah      
  {18A5B}  and      byte ptr [si + 0x1a], bh    
  {18A5E}  jl       0x18a80                     
  {18A60}  and      byte ptr [bx + si], ah      
  {18A62}  push     bp                          
  {18A63}  imul     bp, word ptr [bx + 0x6e], 0x63
  {18A67}  jp       0x18ae2                     
  {18A69}  insb     byte ptr es:[di], dx        
  {18A6A}  popaw                                
  {18A6B}  and      byte ptr [bx + si + 0x6f], dh
  {18A6E}  jp       0x18ae9                     
  {18A70}  je       0x18aeb                     
  {18A72}  ja       0x18ae2                     
  {18A74}  imul     sp, word ptr [di + 0x20], 0x1a7c
  {18A79}  jl       0x18a9b                     
  {18A7B}  dec      dx                          
  {18A7C}  outsb    dx, byte ptr gs:[si]        
  {18A80}  and      byte ptr [bp + si + 0x20], bh
  {18A83}  insw     word ptr es:[di], dx        
  {18A84}  outsw    dx, word ptr [si]           
  {18A85}  imul     sp, word ptr [bp + di + 0x68], 0x7120
  {18A8A}  jne      0x18af1                     
  {18A8C}  jae      0x18b02                     
  {18A8E}  mov      byte ptr [0x2077], al       
  {18A91}  and      byte ptr [si + 0xa], bh     
  {18A94}  push     bp                          
  {18A95}  pop      dx                          
  {18A96}  pop      cx                          
  {18A97}  dec      dx                          
  {18A98}  and      byte ptr [bp + di + 0x48], al
  {18A9B}  dec      sp                          
  {18A9C}  inc      bp                          
  {18A9D}  inc      dx                          
  {18A9E}  cmp      byte ptr [bp + si + 0x4a], bl
  {18AA1}  inc      cx                          
  {18AA2}  inc      sp                          
  {18AA3}  inc      cx                          
  {18AA4}  push     bx                          
  {18AA5}  pop      dx                          
  {18AA6}  and      byte ptr [si + 0x55], al    
  {18AA9}  pop      dx                          
  {18AAA}  pop      cx                          
  {18AAB}  and      byte ptr [bp + di + 0x49], al
  {18AAE}  inc      bp                          
  {18AAF}  push     ax                          
  {18AB0}  dec      sp                          
  {18AB1}  pop      cx                          
  {18AB2}  and      byte ptr [bp + di + 0x48], al
  {18AB5}  dec      sp                          
  {18AB6}  inc      bp                          
  {18AB7}  inc      dx                          
  {18AB8}  and      byte ptr [bx + di + 0x20], cl
  {18ABB}  dec      dx                          
  {18ABC}  inc      bp                          
  {18ABD}  push     bx                          
  {18ABE}  push     sp                          
  {18ABF}  inc      bp                          
  {18AC0}  push     bx                          
  {18AC1}  and      byte ptr [bx + si + 0x45], dl
  {18AC4}  dec      sp                          
  {18AC5}  inc      bp                          
  {18AC6}  dec      si                          
  {18AC7}  and      byte ptr [bx + si], ch      
  {18AC9}  pop      dx                          
  {18ACA}  pop      cx                          
  {18ACB}  push     bx                          
  {18ACC}  dec      bx                          
  {18ACD}  push     bp                          
  {18ACE}  dec      dx                          
  {18ACF}  inc      bp                          
  {18AD0}  push     bx                          
  {18AD1}  pop      dx                          
  {18AD2}  and      byte ptr [bp + si], dh      
  {18AD4}  and      ax, 0xb29                   
  {18AD8}  push     bp                          
  {18AD9}  pop      dx                          
  {18ADA}  pop      cx                          
  {18ADB}  dec      dx                          
  {18ADC}  and      byte ptr [bp + di + 0x41], cl
  {18ADF}  push     bx                          
  {18AE0}  inc      bp                          
  {18AE1}  push     sp                          
  {18AE2}  inc      cx                          
  {18AE3}  aaa                                  
  {18AE4}  push     sp                          
  {18AE5}  inc      bp                          
  {18AE6}  dec      si                          
  {18AE7}  and      byte ptr [bx + si + 0x52], dl
  {18AEA}  pop      dx                          
  {18AEB}  inc      bp                          
  {18AEC}  dec      bp                          
  {18AED}  dec      cx                          
  {18AEE}  dec      di                          
  {18AEF}  push     sp                          
  {18AF0}  and      byte ptr [bp + si + 0x45], cl
  {18AF3}  push     bx                          
  {18AF4}  push     sp                          
  {18AF5}  and      byte ptr [si + 0x59], dl    
  {18AF8}  push     ax                          
  {18AF9}  push     bp                          
  {18AFA}  and      byte ptr [bp + si], bh      
  {18AFC}  and      byte ptr [bp + di + 0x4d], dl
  {18AFF}  dec      cx                          
  {18B00}  inc      bp                          
  {18B01}  inc      bx                          
  {18B02}  and      byte ptr [0x5320], ch       
  {18B06}  pop      dx                          
  {18B08}  and      byte ptr [di], ch           
  {18B0A}  cmp      byte ptr [bx + si], ah      
  {18B0C}  dec      bp                          
  {18B0D}  inc      cx                          
  {18B0E}  pop      ax                          
  {18B0F}  inc      bp                          
  {18B10}  and      byte ptr [bp + di], ch      
  {18B12}  xor      ax, 0x5a20                  
  {18B15}  push     dx                          
  {18B16}  inc      bp                          
  {18B17}  and      byte ptr [bp + di], ch      
  {18B19}  xor      word ptr [bx + si], sp      
  {18B1B}  or       word ptr [di + 0x5a], dx    
  {18B1E}  pop      cx                          
  {18B1F}  dec      dx                          
  {18B20}  and      byte ptr [bx + 0x45], dl    
  {18B23}  dec      bx                          
  {18B24}  inc      cx                          
  {18B25}  xor      bx, word ptr [bp + si + 0x4a]
  {18B28}  inc      cx                          
  {18B29}  inc      sp                          
  {18B2A}  inc      cx                          
  {18B2B}  push     bx                          
  {18B2C}  pop      dx                          
  {18B2D}  and      byte ptr [si + 0x4c], al    
  {18B30}  push     bp                          
  {18B31}  inc      di                          
  {18B32}  inc      cx                          
  {18B33}  push     bx                          
  {18B34}  dec      si                          
  {18B35}  inc      cx                          
  {18B36}  and      byte ptr [bx + 0x45], dl    
  {18B39}  dec      bx                          
  {18B3A}  inc      bp                          
  {18B3B}  and      byte ptr [bx + di + 0x20], cl
  {18B3E}  push     sp                          
  {18B3F}  pop      cx                          
  {18B40}  dec      dx                          
  {18B41}  inc      cx                          
  {18B42}  inc      bx                          
  {18B43}  and      byte ptr [bx + di], dh      
  {18B45}  xor      ax, 0x4b20                  
  {18B48}  dec      cx                          
  {18B49}  dec      sp                          
  {18B4A}  dec      di                          
  {18B4B}  and      byte ptr [bp + si + 0x59], bl
  {18B4E}  push     bx                          
  {18B4F}  dec      bx                          
  {18B50}  push     bp                          
  {18B51}  dec      dx                          
  {18B52}  inc      bp                          
  {18B53}  push     bx                          
  {18B54}  pop      dx                          
  {18B55}  and      byte ptr [bp + di], dh      
  {18B57}  xor      al, 0x25                    
  {18B59}  push     ss                          
  {18B5A}  push     bp                          
  {18B5B}  pop      dx                          
  {18B5C}  pop      cx                          
  {18B5D}  dec      dx                          
  {18B5E}  and      byte ptr [di + 0x41], cl    
  {18B61}  dec      sp                          
  {18B62}  inc      cx                          
  {18B63}  and      byte ptr [bp + si + 0x55], al
  {18B66}  push     sp                          
  {18B67}  inc      bp                          
  {18B68}  dec      sp                          
  {18B69}  dec      bx                          
  {18B6A}  inc      cx                          
  {18B6B}  and      byte ptr [di + 0x41], cl    
  {18B6E}  dec      si                          
  {18B6F}  pop      cx                          
  {18B70}  xor      byte ptr [bx + 0x59], dl    
  {18B73}  push     ax                          
  {18B74}  dec      cx                          
  {18B75}  dec      dx                          
  {18B76}  inc      cx                          
  {18B77}  push     bx                          
  {18B78}  pop      dx                          
  {18B79}  and      byte ptr [di + 0x41], cl    
  {18B7C}  dec      sp                          
  {18B7D}  inc      cx                          
  {18B7E}  and      byte ptr [bp + si + 0x55], al
  {18B81}  push     sp                          
  {18B82}  inc      bp                          
  {18B83}  dec      sp                          
  {18B84}  dec      bx                          
  {18B85}  inc      bp                          
  {18B86}  and      byte ptr [di + 0x41], cl    
  {18B89}  dec      si                          
  {18B8A}  pop      cx                          
  {18B8B}  and      byte ptr [bx + di + 0x20], cl
  {18B8E}  dec      di                          
  {18B8F}  inc      sp                          
  {18B90}  pop      dx                          
  {18B91}  pop      cx                          
  {18B92}  push     bx                          
  {18B93}  dec      bx                          
  {18B94}  push     bp                          
  {18B95}  dec      dx                          
  {18B96}  inc      bp                          
  {18B97}  push     bx                          
  {18B98}  pop      dx                          
  {18B99}  and      byte ptr [bp + di], dh      
  {18B9B}  xor      byte ptr [bx + si], ah      
  {18B9D}  dec      bp                          
  {18B9E}  inc      cx                          
  {18B9F}  dec      si                          
  {18BA0}  pop      cx                          
  {18BA1}  or       dl, byte ptr [di + 0x5a]    
  {18BA4}  pop      cx                          
  {18BA5}  dec      dx                          
  {18BA6}  and      byte ptr [bp + si + 0x49], al
  {18BA9}  inc      di                          
  {18BAA}  dec      di                          
  {18BAB}  push     bx                          
  {18BAC}  pop      dx                          
  {18BAE}  dec      dx                          
  {18BAF}  inc      cx                          
  {18BB0}  inc      sp                          
  {18BB1}  inc      cx                          
  {18BB2}  push     bx                          
  {18BB3}  pop      dx                          
  {18BB4}  and      byte ptr [bp + si + 0x49], al
  {18BB7}  inc      di                          
  {18BB8}  dec      di                          
  {18BB9}  push     bx                          
  {18BBA}  and      byte ptr [bp + si + 0x20], bl
  {18BBD}  push     di                          
  {18BBE}  push     dx                          
  {18BBF}  dec      di                          
  {18BC0}  inc      di                          
  {18BC1}  inc      cx                          
  {18BC2}  and      byte ptr [bx + di + 0x20], cl
  {18BC5}  dec      di                          
  {18BC6}  inc      sp                          
  {18BC7}  pop      dx                          
  {18BC8}  pop      cx                          
  {18BC9}  push     bx                          
  {18BCA}  dec      bx                          
  {18BCB}  push     bp                          
  {18BCC}  dec      dx                          
  {18BCD}  inc      bp                          
  {18BCE}  push     bx                          
  {18BCF}  pop      dx                          
  {18BD0}  and      byte ptr [bp + si], dh      
  {18BD2}  xor      byte ptr [di], ah           
  {18BD4}  and      byte ptr [di + 0x4e], al    
  {18BD7}  inc      bp                          
  {18BD8}  push     dx                          
  {18BD9}  inc      di                          
  {18BDA}  dec      cx                          
  {18BDB}  or       al, 0x55                    
  {18BDD}  pop      dx                          
  {18BDE}  pop      cx                          
  {18BDF}  dec      dx                          
  {18BE0}  and      byte ptr [bp + di + 0x4f], cl
  {18BE3}  dec      bp                          
  {18BE4}  push     ax                          
  {18BE5}  dec      sp                          
  {18BE6}  inc      bp                          
  {18BE7}  push     sp                          
  {18BE8}  and      cx, word ptr [bp + 0x41]    
  {18BEB}  dec      bx                          
  {18BEC}  dec      sp                          
  {18BED}  inc      cx                          
  {18BEE}  inc      sp                          
  {18BEF}  inc      cx                          
  {18BF0}  push     bx                          
  {18BF1}  pop      dx                          
  {18BF2}  and      byte ptr [bp + di + 0x4f], cl
  {18BF5}  dec      bp                          
  {18BF6}  push     ax                          
  {18BF7}  dec      sp                          
  {18BF8}  inc      bp                          
  {18BF9}  push     sp                          
  {18BFA}  and      byte ptr [di + 0x42], dl    
  {18BFD}  push     dx                          
  {18BFE}  inc      cx                          
  {18BFF}  dec      si                          
  {18C00}  and      byte ptr [bp + 0x49], al    
  {18C03}  push     dx                          
  {18C04}  dec      bp                          
  {18C05}  pop      cx                          
  {18C06}  and      byte ptr [bp + si], ah      
  {18C08}  push     bx                          
  {18C09}  pop      cx                          
  {18C0A}  inc      si                          
  {18C0B}  and      al, byte ptr [bp + di]      
  {18C0D}  push     bx                          
  {18C0E}  pop      cx                          
  {18C0F}  inc      si                          
  {18C10}  push     cs                          
  {18C11}  dec      di                          
  {18C12}  inc      sp                          
  {18C13}  dec      sp                          
  {18C14}  dec      di                          
  {18C15}  push     dx                          
  {18C16}  pop      dx                          
  {18C17}  and      byte ptr [bp + di + 0x4f], cl
  {18C1A}  dec      bp                          
  {18C1B}  push     ax                          
  {18C1C}  dec      sp                          
  {18C1D}  inc      bp                          
  {18C1E}  push     sp                          
  {18C1F}  and      al, 0x5a                    
  {18C21}  inc      sp                          
  {18C22}  inc      bp                          
  {18C23}  dec      dx                          
  {18C24}  dec      bp                          
  {18C25}  push     bp                          
  {18C26}  dec      dx                          
  {18C27}  inc      bp                          
  {18C28}  push     bx                          
  {18C29}  pop      dx                          
  {18C2A}  and      byte ptr [bp + di + 0x4f], cl
  {18C2D}  dec      bp                          
  {18C2E}  push     ax                          
  {18C2F}  dec      sp                          
  {18C30}  inc      bp                          
  {18C31}  push     sp                          
  {18C32}  and      byte ptr [di + 0x42], dl    
  {18C35}  push     dx                          
  {18C36}  inc      cx                          
  {18C37}  dec      si                          
  {18C38}  and      byte ptr [bp + 0x49], al    
  {18C3B}  push     dx                          
  {18C3C}  dec      bp                          
  {18C3D}  pop      cx                          
  {18C3E}  and      byte ptr [bp + si], ah      
  {18C40}  push     bx                          
  {18C41}  pop      cx                          
  {18C42}  inc      si                          
  {18C43}  and      cl, byte ptr [bp + di]      
  {18C45}  push     bp                          
  {18C46}  pop      dx                          
  {18C47}  pop      cx                          
  {18C48}  dec      dx                          
  {18C49}  and      byte ptr [si + 0x49], cl    
  {18C4C}  push     bx                          
  {18C4D}  push     sp                          
  {18C4E}  inc      bp                          
  {18C4F}  dec      bx                          
  {18C50}  sub      cx, word ptr [si + 0x49]    
  {18C53}  push     bx                          
  {18C54}  push     sp                          
  {18C55}  inc      bp                          
  {18C56}  dec      bx                          
  {18C57}  and      byte ptr [bp + si + 0x45], cl
  {18C5A}  push     bx                          
  {18C5B}  push     sp                          
  {18C5C}  and      byte ptr [si + 0x59], dl    
  {18C5F}  push     ax                          
  {18C60}  push     bp                          
  {18C61}  and      byte ptr [bp + di + 0x4d], dl
  {18C64}  dec      cx                          
  {18C65}  inc      bp                          
  {18C66}  inc      bx                          
  {18C67}  and      byte ptr [di + 0x41], cl    
  {18C6A}  pop      ax                          
  {18C6B}  and      byte ptr [bx + si + 0x52], dl
  {18C6E}  pop      dx                          
  {18C6F}  inc      bp                          
  {18C70}  inc      sp                          
  {18C71}  dec      bp                          
  {18C72}  dec      cx                          
  {18C73}  dec      di                          
  {18C74}  push     sp                          
  {18C75}  dec      di                          
  {18C76}  push     di                          
  {18C77}  and      byte ptr [bp + di], ch      
  {18C79}  and      byte ptr [bp + di], dh      
  {18C7B}  and      byte ptr [di], cl           
  {18C7D}  push     bp                          
  {18C7E}  pop      dx                          
  {18C7F}  pop      cx                          
  {18C80}  dec      dx                          
  {18C81}  and      byte ptr [bx + 0x41], al    
  {18C84}  push     dx                          
  {18C85}  dec      si                          
  {18C86}  dec      cx                          
  {18C87}  push     sp                          
  {18C88}  push     bp                          
  {18C89}  push     dx                          
  {18C8A}  cmp      cx, word ptr [bp + 0x41]    
  {18C8D}  dec      bx                          
  {18C8E}  dec      sp                          
  {18C8F}  inc      cx                          
  {18C90}  inc      sp                          
  {18C91}  inc      cx                          
  {18C92}  push     bx                          
  {18C93}  pop      dx                          
  {18C94}  and      byte ptr [bx + 0x41], al    
  {18C97}  push     dx                          
  {18C98}  dec      si                          
  {18C99}  dec      cx                          
  {18C9A}  push     sp                          
  {18C9B}  push     bp                          
  {18C9C}  push     dx                          
  {18C9D}  and      byte ptr [bp + si + 0x20], bl
  {18CA0}  dec      bx                          
  {18CA1}  dec      di                          
  {18CA2}  dec      sp                          
  {18CA3}  inc      bx                          
  {18CA4}  inc      cx                          
  {18CA5}  dec      bp                          
  {18CA6}  dec      cx                          
  {18CA7}  and      byte ptr [bp + 0x41], cl    
  {18CAA}  and      byte ptr [bp + di + 0x57], dl
  {18CAD}  inc      bp                          
  {18CAE}  and      byte ptr [bx + si], ch      
  {18CB0}  dec      si                          
  {18CB1}  dec      cx                          
  {18CB2}  inc      bp                          
  {18CB3}  sub      word ptr [bx + 0x59], dx    
  {18CB6}  push     bx                          
  {18CB7}  push     ax                          
  {18CB8}  dec      di                          
  {18CB9}  push     dx                          
  {18CBA}  push     sp                          
  {18CBB}  dec      di                          
  {18CBC}  push     di                          
  {18CBD}  inc      cx                          
  {18CBE}  dec      si                          
  {18CBF}  inc      bp                          
  {18CC0}  and      byte ptr [bp + di + 0x49], al
  {18CC3}  inc      cx                          
  {18CC4}  dec      sp                          
  {18CC5}  dec      di                          
  {18CC6}  or       byte ptr [bx + 0x41], al    
  {18CC9}  push     dx                          
  {18CCA}  dec      si                          
  {18CCB}  dec      cx                          
  {18CCC}  push     sp                          
  {18CCD}  push     bp                          
  {18CCE}  push     dx                          
  {18CCF}  or       al, 0x55                    
  {18CD1}  pop      dx                          
  {18CD2}  pop      cx                          
  {18CD3}  dec      dx                          
  {18CD4}  and      byte ptr [bx + si + 0x49], dl
  {18CD7}  inc      di                          
  {18CD8}  push     bp                          
  {18CD9}  dec      sp                          
  {18CDA}  dec      bx                          
  {18CDB}  inc      cx                          
  {18CDC}  dec      bx                          
  {18CDD}  push     di                          
  {18CDE}  push     bx                          
  {18CDF}  pop      dx                          
  {18CE0}  pop      cx                          
  {18CE1}  push     bx                          
  {18CE2}  push     sp                          
  {18CE3}  dec      bx                          
  {18CE4}  dec      di                          
  {18CE5}  and      byte ptr [bp + si + 0x41], bl
  {18CE8}  inc      bx                          
  {18CE9}  pop      dx                          
  {18CEA}  pop      cx                          
  {18CEB}  dec      si                          
  {18CEC}  inc      cx                          
  {18CED}  and      byte ptr [bx + 0x49], dl    
  {18CF0}  push     dx                          
  {18CF1}  dec      di                          
  {18CF2}  push     di                          
  {18CF3}  inc      cx                          
  {18CF4}  inc      bx                          
  {18CF5}  and      byte ptr [si], ch           
  {18CF7}  and      byte ptr [bx + si + 0x4f], dl
  {18CFA}  push     sp                          
  {18CFB}  inc      bp                          
  {18CFC}  dec      bp                          
  {18CFD}  and      byte ptr [bp + 0x41], cl    
  {18D00}  inc      di                          
  {18D01}  dec      sp                          
  {18D02}  pop      cx                          
  {18D03}  and      byte ptr [bp + si + 0x4c], al
  {18D06}  pop      cx                          
  {18D07}  push     bx                          
  {18D08}  dec      bx                          
  {18D09}  and      byte ptr [bx + di + 0x20], cl
  {18D0C}  pop      dx                          
  {18D0D}  dec      si                          
  {18D0E}  inc      cx                          
  {18D0F}  dec      dx                          
  {18D10}  inc      sp                          
  {18D11}  push     bp                          
  {18D12}  dec      dx                          
  {18D13}  inc      bp                          
  {18D14}  push     bx                          
  {18D15}  pop      dx                          
  {18D16}  and      byte ptr [bp + di + 0x49], dl
  {18D19}  inc      bp                          
  {18D1A}  and      byte ptr [bx + 0x20], dl    
  {18D1D}  push     ax                          
  {18D1E}  push     dx                          
  {18D1F}  pop      dx                          
  {18D20}  inc      bp                          
  {18D21}  push     bx                          
  {18D22}  pop      dx                          
  {18D23}  dec      sp                          
  {18D24}  dec      di                          
  {18D25}  push     bx                          
  {18D26}  inc      bx                          
  {18D27}  dec      cx                          
  {18D28}  inc      dx                          
  {18D29}  inc      dx                          
  {18D2A}  push     dx                          
  {18D2B}  inc      cx                          
  {18D2C}  dec      bx                          
  {18D2D}  and      byte ptr [bx + 0x42], cl    
  {18D30}  pop      cx                          
  {18D31}  inc      bx                          
  {18D32}  dec      cx                          
  {18D33}  inc      cx                          
  {18D34}  and      byte ptr [bx + 0x20], dl    
  {18D37}  push     ax                          
  {18D38}  dec      di                          
  {18D39}  push     bx                          
  {18D3A}  dec      sp                          
  {18D3B}  push     bp                          
  {18D3C}  inc      di                          
  {18D3D}  dec      cx                          
  {18D3E}  push     di                          
  {18D3F}  inc      cx                          
  {18D40}  dec      si                          
  {18D41}  dec      cx                          
  {18D42}  push     bp                          
  {18D43}  and      byte ptr [bp + di + 0x49], dl
  {18D46}  inc      bp                          
  {18D47}  and      byte ptr [di + 0x41], cl    
  {18D4A}  inc      di                          
  {18D4B}  dec      cx                          
  {18D4C}  inc      bx                          
  {18D4D}  pop      dx                          
  {18D4E}  dec      si                          
  {18D4F}  pop      cx                          
  {18D50}  dec      bp                          
  {18D51}  dec      cx                          
  {18D52}  and      byte ptr [bx + si + 0x52], dl
  {18D55}  pop      dx                          
  {18D56}  inc      bp                          
  {18D57}  inc      sp                          
  {18D58}  dec      bp                          
  {18D59}  dec      cx                          
  {18D5A}  dec      di                          
  {18D5B}  push     sp                          
  {18D5C}  inc      cx                          
  {18D5D}  dec      bp                          
  {18D5E}  dec      cx                          
  {18D5F}  and      byte ptr [bp + di + 0x50], dl
  {18D62}  push     dx                          
  {18D63}  inc      cx                          
  {18D64}  push     di                          
  {18D65}  dec      cx                          
  {18D66}  dec      sp                          
  {18D67}  and      byte ptr [bp + si + 0x45], bl
  {18D6A}  and      byte ptr [bp + di], dh      
  {18D6C}  pop      dx                          
  {18D6D}  dec      si                          
  {18D6E}  inc      cx                          
  {18D6F}  inc      bx                          
  {18D70}  pop      dx                          
  {18D71}  dec      si                          
  {18D72}  dec      cx                          
  {18D73}  inc      bp                          
  {18D74}  and      byte ptr [bx + 0x50], cl    
  {18D77}  inc      cx                          
  {18D78}  inc      sp                          
  {18D79}  dec      sp                          
  {18D7A}  inc      bp                          
  {18D7B}  push     bx                          
  {18D7C}  and      byte ptr [bp + si + 0x20], bl
  {18D7F}  push     bx                          
  {18D80}  dec      cx                          
  {18D81}  dec      sp                          
  {18D82}  and      byte ptr [bx + di + 0x20], cl
  {18D85}  push     bx                          
  {18D86}  push     sp                          
  {18D87}  inc      cx                          
  {18D88}  dec      sp                          
  {18D89}  inc      bp                          
  {18D8A}  push     bx                          
  {18D8B}  and      byte ptr [bp + di + 0x49], dl
  {18D8E}  inc      bp                          
  {18D8F}  and      byte ptr [bp + si + 0x41], al
  {18D92}  push     dx                          
  {18D93}  inc      sp                          
  {18D94}  pop      dx                          
  {18D95}  dec      di                          
  {18D96}  and      byte ptr [bp + si + 0x4d], bl
  {18D99}  inc      bp                          
  {18D9A}  inc      bx                          
  {18D9B}  pop      dx                          
  {18D9C}  dec      di                          
  {18D9D}  dec      si                          
  {18D9E}  pop      cx                          
  {18D9F}  cmp      ax, 0x414d                  
  {18DA2}  push     bx                          
  {18DA3}  pop      dx                          
  {18DA4}  and      byte ptr [bx + si + 0x45], dl
  {18DA7}  push     di                          
  {18DA8}  dec      si                          
  {18DA9}  inc      bp                          
  {18DAA}  and      byte ptr [bx + 0x42], cl    
  {18DAD}  pop      cx                          
  {18DAE}  inc      bx                          
  {18DAF}  dec      cx                          
  {18DB0}  inc      bp                          
  {18DB1}  and      byte ptr [bx + 0x20], dl    
  {18DB4}  dec      bp                          
  {18DB5}  inc      cx                          
  {18DB6}  inc      di                          
  {18DB7}  dec      cx                          
  {18DB8}  inc      bx                          
  {18DB9}  pop      dx                          
  {18DBA}  dec      si                          
  {18DBB}  pop      cx                          
  {18DBC}  inc      bx                          
  {18DBD}  dec      ax                          
  {18DBE}  and      byte ptr [bx + si + 0x52], dl
  {18DC1}  pop      dx                          
  {18DC2}  inc      bp                          
  {18DC3}  inc      sp                          
  {18DC4}  dec      bp                          
  {18DC5}  dec      cx                          
  {18DC6}  dec      di                          
  {18DC7}  push     sp                          
  {18DC8}  inc      cx                          
  {18DC9}  inc      bx                          
  {18DCA}  dec      ax                          
  {18DCB}  and      byte ptr [bx + di + 0x4c], al
  {18DCE}  inc      bp                          
  {18DCF}  and      byte ptr [di + 0x49], cl    
  {18DD2}  dec      bp                          
  {18DD3}  dec      di                          
  {18DD4}  and      byte ptr [bx + 0x53], dl    
  {18DD7}  pop      dx                          
  {18DD8}  pop      cx                          
  {18DD9}  push     bx                          
  {18DDA}  push     sp                          
  {18DDB}  dec      bx                          
  {18DDC}  dec      di                          
  {18DDD}  and      cx, word ptr [bx + 0x50]    
  {18DE0}  inc      cx                          
  {18DE1}  inc      sp                          
  {18DE2}  dec      sp                          
  {18DE3}  inc      bp                          
  {18DE4}  push     bx                          
  {18DE5}  and      byte ptr [bp + si + 0x20], bl
  {18DE8}  push     bx                          
  {18DE9}  dec      cx                          
  {18DEA}  dec      sp                          
  {18DEB}  and      byte ptr [bx + di + 0x20], cl
  {18DEE}  push     bx                          
  {18DEF}  push     sp                          
  {18DF0}  inc      cx                          
  {18DF1}  dec      sp                          
  {18DF2}  inc      bp                          
  {18DF3}  push     bx                          
  {18DF4}  and      byte ptr [bp + di + 0x49], dl
  {18DF7}  inc      bp                          
  {18DF8}  and      byte ptr [bp + si + 0x4d], bl
  {18DFB}  inc      bp                          
  {18DFC}  inc      bx                          
  {18DFD}  pop      dx                          
  {18DFE}  dec      di                          
  {18DFF}  dec      si                          
  {18E00}  pop      cx                          
  {18E01}  inc      dx                          
  {18E02}  pop      dx                          
  {18E03}  dec      si                          
  {18E04}  inc      cx                          
  {18E05}  push     bx                          
  {18E06}  pop      dx                          
  {18E07}  and      byte ptr [bp + di + 0x49], dl
  {18E0A}  inc      bp                          
  {18E0B}  and      byte ptr [bp + 0x41], cl    
  {18E0E}  and      byte ptr [si + 0x45], dl    
  {18E11}  inc      di                          
  {18E12}  dec      di                          
  {18E13}  and      byte ptr [si + 0x59], dl    
  {18E16}  push     ax                          
  {18E17}  push     bp                          
  {18E18}  and      byte ptr [bx + si + 0x52], dl
  {18E1B}  pop      dx                          
  {18E1C}  inc      bp                          
  {18E1D}  inc      sp                          
  {18E1E}  dec      bp                          
  {18E1F}  dec      cx                          
  {18E20}  dec      di                          
  {18E21}  push     sp                          
  {18E22}  inc      cx                          
  {18E23}  inc      bx                          
  {18E24}  dec      ax                          
  {18E25}  and      byte ptr [si], ch           
  {18E27}  and      byte ptr [bx + 0x59], dl    
  {18E2A}  push     bx                          
  {18E2B}  pop      dx                          
  {18E2C}  inc      bp                          
  {18E2D}  inc      sp                          
  {18E2E}  dec      sp                          
  {18E2F}  inc      bp                          
  {18E30}  push     bx                          
  {18E31}  and      byte ptr [bp + si + 0x20], bl
  {18E34}  push     sp                          
  {18E35}  inc      bp                          
  {18E36}  inc      di                          
  {18E37}  dec      di                          
  {18E38}  and      byte ptr [bp + si + 0x45], al
  {18E3B}  pop      dx                          
  {18E3C}  and      byte ptr [bp + di + 0x5a], dl
  {18E3F}  push     di                          
  {18E40}  inc      cx                          
  {18E41}  dec      si                          
  {18E42}  dec      bx                          
  {18E43}  push     bp                          
  {18E44}  cmovg    ax, word ptr [si + 0x4c]    
  {18E48}  dec      di                          
  {18E49}  push     dx                          
  {18E4A}  pop      dx                          
  {18E4B}  and      byte ptr [bx + 0x41], al    
  {18E4E}  push     dx                          
  {18E4F}  dec      si                          
  {18E50}  dec      cx                          
  {18E51}  push     sp                          
  {18E52}  push     bp                          
  {18E53}  push     dx                          
  {18E54}  inc      ax                          
  {18E55}  pop      dx                          
  {18E56}  inc      sp                          
  {18E57}  inc      bp                          
  {18E58}  dec      dx                          
  {18E59}  dec      bp                          
  {18E5A}  push     bp                          
  {18E5B}  dec      dx                          
  {18E5C}  inc      bp                          
  {18E5D}  push     bx                          
  {18E5E}  pop      dx                          
  {18E5F}  and      byte ptr [bx + 0x41], al    
  {18E62}  push     dx                          
  {18E63}  dec      si                          
  {18E64}  dec      cx                          
  {18E65}  push     sp                          
  {18E66}  push     bp                          
  {18E67}  push     dx                          
  {18E68}  and      byte ptr [bp + si + 0x20], bl
  {18E6B}  dec      bx                          
  {18E6C}  dec      di                          
  {18E6D}  dec      sp                          
  {18E6E}  inc      bx                          
  {18E6F}  inc      cx                          
  {18E70}  dec      bp                          
  {18E71}  dec      cx                          
  {18E72}  and      byte ptr [bp + si + 0x45], bl
  {18E75}  and      byte ptr [bp + di + 0x57], dl
  {18E78}  inc      bp                          
  {18E79}  inc      di                          
  {18E7A}  dec      di                          
  {18E7B}  and      byte ptr [bx + si], ch      
  {18E7D}  dec      si                          
  {18E7E}  dec      cx                          
  {18E7F}  inc      bp                          
  {18E80}  sub      word ptr [bx + 0x59], dx    
  {18E83}  push     bx                          
  {18E84}  push     ax                          
  {18E85}  dec      di                          
  {18E86}  push     dx                          
  {18E87}  push     sp                          
  {18E88}  dec      di                          
  {18E89}  push     di                          
  {18E8A}  inc      cx                          
  {18E8B}  dec      si                          
  {18E8C}  inc      bp                          
  {18E8D}  inc      di                          
  {18E8E}  dec      di                          
  {18E8F}  and      byte ptr [bp + di + 0x49], al
  {18E92}  inc      cx                          
  {18E93}  dec      sp                          
  {18E94}  inc      cx                          
  {18E95}  push     bp                          
  {18E96}  mov      bp, sp                      
  {18E98}  xor      ax, ax                      
  {18E9A}  lcall    0x1c71, 0x2cd               
  {18E9F}  mov      di, 0x564                   
  {18EA2}  push     ds                          
  {18EA3}  push     di                          
  {18EA4}  mov      di, 0x5cff                  
  {18EA7}  push     cs                          
  {18EA8}  push     di                          
  {18EA9}  lcall    0x1c71, 0x9d7               
  {18EAE}  jne      0x18ed3                     
  {18EB0}  cmp      word ptr [0x18a], -0xa      
  {18EB5}  jne      0x18ed3                     
  {18EB7}  mov      di, 0x7a2                   
  {18EBA}  push     ds                          
  {18EBB}  push     di                          
  {18EBC}  mov      di, 0x5d0a                  
  {18EBF}  push     cs                          
  {18EC0}  push     di                          
  {18EC1}  xor      ax, ax                      
  {18EC3}  push     ax                          
  {18EC4}  lcall    0x1c71, 0x701               
  {18EC9}  lcall    0x1c71, 0x5dd               
  {18ECE}  lcall    0x1c71, 0x291               
  {18ED3}  mov      di, 0x564                   
  {18ED6}  push     ds                          
  {18ED7}  push     di                          
  {18ED8}  mov      di, 0x5d34                  
  {18EDB}  push     cs                          
  {18EDC}  push     di                          
  {18EDD}  lcall    0x1c71, 0x9d7               
  {18EE2}  jne      0x18f2b                     
  {18EE4}  cmp      word ptr [0x186], -0xa         // PRZEDM.WIMP
  {18EE9}  jne      0x18f2b                     
  {18EEB}  xor      ax, ax                      
  {18EED}  mov      word ptr [0x186], ax           // PRZEDM.WIMP
  {18EF0}  mov      di, 0x7a2                   
  {18EF3}  push     ds                          
  {18EF4}  push     di                          
  {18EF5}  mov      di, 0x5d3f                  
  {18EF8}  push     cs                          
  {18EF9}  push     di                          
  {18EFA}  xor      ax, ax                      
  {18EFC}  push     ax                          
  {18EFD}  lcall    0x1c71, 0x701               
  {18F02}  lcall    0x1c71, 0x5dd               
  {18F07}  lcall    0x1c71, 0x291               
  {18F0C}  mov      ax, word ptr [0x19c]        
  {18F0F}  add      ax, 5                       
  {18F12}  mov      word ptr [0x19c], ax        
  {18F15}  mov      ax, word ptr [0x19c]        
  {18F18}  cmp      ax, word ptr [0x664]        
  {18F1C}  jle      0x18f24                     
  {18F1E}  mov      ax, word ptr [0x664]        
  {18F21}  mov      word ptr [0x19c], ax        
  {18F24}  mov      ax, word ptr [0x182]        
  {18F27}  dec      ax                          
  {18F28}  mov      word ptr [0x182], ax           // PRZEDM.KUNSZT
  {18F2B}  mov      di, 0x564                   
  {18F2E}  push     ds                          
  {18F2F}  push     di                          
  {18F30}  mov      di, 0x5d72                  
  {18F33}  push     cs                          
  {18F34}  push     di                          
  {18F35}  lcall    0x1c71, 0x9d7               
  {18F3A}  je       0x18f3f                     
  {18F3C}  jmp      0x1907d                     
  {18F3F}  cmp      word ptr [0x188], -0xa         // PRZEDM.ZWIEJ
  {18F44}  je       0x18f49                     
  {18F46}  jmp      0x1907d                     
  {18F49}  mov      di, 0x7a2                   
  {18F4C}  push     ds                          
  {18F4D}  push     di                          
  {18F4E}  mov      di, 0x5d7e                  
  {18F51}  push     cs                          
  {18F52}  push     di                          
  {18F53}  xor      ax, ax                      
  {18F55}  push     ax                          
  {18F56}  lcall    0x1c71, 0x701               
  {18F5B}  lcall    0x1c71, 0x5dd               
  {18F60}  lcall    0x1c71, 0x291               
  {18F65}  mov      di, 0x7a2                   
  {18F68}  push     ds                          
  {18F69}  push     di                          
  {18F6A}  mov      di, 0x5d96                  
  {18F6D}  push     cs                          
  {18F6E}  push     di                          
  {18F6F}  xor      ax, ax                      
  {18F71}  push     ax                          
  {18F72}  lcall    0x1c71, 0x701               
  {18F77}  lcall    0x1c71, 0x5dd               
  {18F7C}  lcall    0x1c71, 0x291               
  {18F81}  mov      di, 0x7a2                   
  {18F84}  push     ds                          
  {18F85}  push     di                          
  {18F86}  mov      di, 0x5dbd                  
  {18F89}  push     cs                          
  {18F8A}  push     di                          
  {18F8B}  xor      ax, ax                      
  {18F8D}  push     ax                          
  {18F8E}  lcall    0x1c71, 0x701               
  {18F93}  lcall    0x1c71, 0x5dd               
  {18F98}  lcall    0x1c71, 0x291               
  {18F9D}  mov      di, 0x7a2                   
  {18FA0}  push     ds                          
  {18FA1}  push     di                          
  {18FA2}  mov      di, 0x5de4                  
  {18FA5}  push     cs                          
  {18FA6}  push     di                          
  {18FA7}  xor      ax, ax                      
  {18FA9}  push     ax                          
  {18FAA}  lcall    0x1c71, 0x701               
  {18FAF}  lcall    0x1c71, 0x5dd               
  {18FB4}  lcall    0x1c71, 0x291               
  {18FB9}  mov      di, 0x7a2                   
  {18FBC}  push     ds                          
  {18FBD}  push     di                          
  {18FBE}  mov      di, 0x5de4                  
  {18FC1}  push     cs                          
  {18FC2}  push     di                          
  {18FC3}  xor      ax, ax                      
  {18FC5}  push     ax                          
  {18FC6}  lcall    0x1c71, 0x701               
  {18FCB}  lcall    0x1c71, 0x5dd               
  {18FD0}  lcall    0x1c71, 0x291               
  {18FD5}  mov      di, 0x7a2                   
  {18FD8}  push     ds                          
  {18FD9}  push     di                          
  {18FDA}  mov      di, 0x5de4                  
  {18FDD}  push     cs                          
  {18FDE}  push     di                          
  {18FDF}  xor      ax, ax                      
  {18FE1}  push     ax                          
  {18FE2}  lcall    0x1c71, 0x701               
  {18FE7}  lcall    0x1c71, 0x5dd               
  {18FEC}  lcall    0x1c71, 0x291               
  {18FF1}  mov      di, 0x7a2                   
  {18FF4}  push     ds                          
  {18FF5}  push     di                          
  {18FF6}  mov      di, 0x5e0b                  
  {18FF9}  push     cs                          
  {18FFA}  push     di                          
  {18FFB}  xor      ax, ax                      
  {18FFD}  push     ax                          
  {18FFE}  lcall    0x1c71, 0x701               
  {19003}  lcall    0x1c71, 0x5dd               
  {19008}  lcall    0x1c71, 0x291               
  {1900D}  mov      di, 0x7a2                   
  {19010}  push     ds                          
  {19011}  push     di                          
  {19012}  mov      di, 0x5e32                  
  {19015}  push     cs                          
  {19016}  push     di                          
  {19017}  xor      ax, ax                      
  {19019}  push     ax                          
  {1901A}  lcall    0x1c71, 0x701               
  {1901F}  lcall    0x1c71, 0x5dd               
  {19024}  lcall    0x1c71, 0x291               
  {19029}  mov      di, 0x7a2                   
  {1902C}  push     ds                          
  {1902D}  push     di                          
  {1902E}  mov      di, 0x5e59                  
  {19031}  push     cs                          
  {19032}  push     di                          
  {19033}  xor      ax, ax                      
  {19035}  push     ax                          
  {19036}  lcall    0x1c71, 0x701               
  {1903B}  lcall    0x1c71, 0x5dd               
  {19040}  lcall    0x1c71, 0x291               
  {19045}  mov      di, 0x7a2                   
  {19048}  push     ds                          
  {19049}  push     di                          
  {1904A}  mov      di, 0x5e80                  
  {1904D}  push     cs                          
  {1904E}  push     di                          
  {1904F}  xor      ax, ax                      
  {19051}  push     ax                          
  {19052}  lcall    0x1c71, 0x701               
  {19057}  lcall    0x1c71, 0x5dd               
  {1905C}  lcall    0x1c71, 0x291               
  {19061}  mov      di, 0x7a2                   
  {19064}  push     ds                          
  {19065}  push     di                          
  {19066}  mov      di, 0x5ea7                  
  {19069}  push     cs                          
  {1906A}  push     di                          
  {1906B}  xor      ax, ax                      
  {1906D}  push     ax                          
  {1906E}  lcall    0x1c71, 0x701               
  {19073}  lcall    0x1c71, 0x5dd               
  {19078}  lcall    0x1c71, 0x291               
  {1907D}  mov      di, 0x564                   
  {19080}  push     ds                          
  {19081}  push     di                          
  {19082}  mov      di, 0x5ece                  
  {19085}  push     cs                          
  {19086}  push     di                          
  {19087}  lcall    0x1c71, 0x9d7               
  {1908C}  jne      0x190d9                     
  {1908E}  cmp      word ptr [0x1a0], -0xa      
  {19093}  jg       0x190d9                     
  {19095}  mov      ax, word ptr [0x182]        
  {19098}  dec      ax                          
  {19099}  mov      word ptr [0x182], ax           // PRZEDM.KUNSZT
  {1909C}  mov      ax, word ptr [0x1a0]        
  {1909F}  add      ax, 0xa                     
  {190A2}  mov      word ptr [0x1a0], ax        
  {190A5}  mov      di, 0x7a2                   
  {190A8}  push     ds                          
  {190A9}  push     di                          
  {190AA}  mov      di, 0x5eda                  
  {190AD}  push     cs                          
  {190AE}  push     di                          
  {190AF}  xor      ax, ax                      
  {190B1}  push     ax                          
  {190B2}  lcall    0x1c71, 0x701               
  {190B7}  lcall    0x1c71, 0x5dd               
  {190BC}  lcall    0x1c71, 0x291               
  {190C1}  mov      ax, word ptr [0x19c]        
  {190C4}  add      ax, 8                       
  {190C7}  mov      word ptr [0x19c], ax        
  {190CA}  mov      ax, word ptr [0x19c]        
  {190CD}  cmp      ax, word ptr [0x664]        
  {190D1}  jle      0x190d9                     
  {190D3}  mov      ax, word ptr [0x664]        
  {190D6}  mov      word ptr [0x19c], ax        
  {190D9}  mov      di, 0x564                   
  {190DC}  push     ds                          
  {190DD}  push     di                          
  {190DE}  mov      di, 0x5f0f                  
  {190E1}  push     cs                          
  {190E2}  push     di                          
  {190E3}  lcall    0x1c71, 0x9d7               
  {190E8}  jne      0x19135                     
  {190EA}  cmp      word ptr [0x1a2], -0xa      
  {190EF}  jg       0x19135                     
  {190F1}  mov      ax, word ptr [0x182]        
  {190F4}  dec      ax                          
  {190F5}  mov      word ptr [0x182], ax           // PRZEDM.KUNSZT
  {190F8}  mov      ax, word ptr [0x1a2]        
  {190FB}  add      ax, 0xa                     
  {190FE}  mov      word ptr [0x1a2], ax        
  {19101}  mov      di, 0x7a2                   
  {19104}  push     ds                          
  {19105}  push     di                          
  {19106}  mov      di, 0x5f1c                  
  {19109}  push     cs                          
  {1910A}  push     di                          
  {1910B}  xor      ax, ax                      
  {1910D}  push     ax                          
  {1910E}  lcall    0x1c71, 0x701               
  {19113}  lcall    0x1c71, 0x5dd               
  {19118}  lcall    0x1c71, 0x291               
  {1911D}  mov      ax, word ptr [0x19c]        
  {19120}  add      ax, 0xc                     
  {19123}  mov      word ptr [0x19c], ax        
  {19126}  mov      ax, word ptr [0x19c]        
  {19129}  cmp      ax, word ptr [0x664]        
  {1912D}  jle      0x19135                     
  {1912F}  mov      ax, word ptr [0x664]        
  {19132}  mov      word ptr [0x19c], ax        
  {19135}  mov      di, 0x564                   
  {19138}  push     ds                          
  {19139}  push     di                          
  {1913A}  mov      di, 0x5f54                  
  {1913D}  push     cs                          
  {1913E}  push     di                          
  {1913F}  lcall    0x1c71, 0x9d7               
  {19144}  jne      0x19191                     
  {19146}  cmp      word ptr [0x1a4], -0xa      
  {1914B}  jg       0x19191                     
  {1914D}  mov      ax, word ptr [0x182]        
  {19150}  dec      ax                          
  {19151}  mov      word ptr [0x182], ax           // PRZEDM.KUNSZT
  {19154}  mov      ax, word ptr [0x1a4]        
  {19157}  add      ax, 0xa                     
  {1915A}  mov      word ptr [0x1a4], ax        
  {1915D}  mov      di, 0x7a2                   
  {19160}  push     ds                          
  {19161}  push     di                          
  {19162}  mov      di, 0x5f65                  
  {19165}  push     cs                          
  {19166}  push     di                          
  {19167}  xor      ax, ax                      
  {19169}  push     ax                          
  {1916A}  lcall    0x1c71, 0x701               
  {1916F}  lcall    0x1c71, 0x5dd               
  {19174}  lcall    0x1c71, 0x291               
  {19179}  mov      ax, word ptr [0x19c]        
  {1917C}  add      ax, 0x10                    
  {1917F}  mov      word ptr [0x19c], ax        
  {19182}  mov      ax, word ptr [0x19c]        
  {19185}  cmp      ax, word ptr [0x664]        
  {19189}  jle      0x19191                     
  {1918B}  mov      ax, word ptr [0x664]        
  {1918E}  mov      word ptr [0x19c], ax        
  {19191}  mov      di, 0x564                   
  {19194}  push     ds                          
  {19195}  push     di                          
  {19196}  mov      di, 0x5fa4                  
  {19199}  push     cs                          
  {1919A}  push     di                          
  {1919B}  lcall    0x1c71, 0x9d7               
  {191A0}  jne      0x191ed                     
  {191A2}  cmp      word ptr [0x1a8], -0xa      
  {191A7}  jg       0x191ed                     
  {191A9}  mov      ax, word ptr [0x182]        
  {191AC}  dec      ax                          
  {191AD}  mov      word ptr [0x182], ax           // PRZEDM.KUNSZT
  {191B0}  mov      ax, word ptr [0x1a8]        
  {191B3}  add      ax, 0xa                     
  {191B6}  mov      word ptr [0x1a8], ax        
  {191B9}  mov      di, 0x7a2                   
  {191BC}  push     ds                          
  {191BD}  push     di                          
  {191BE}  mov      di, 0x5faf                  
  {191C1}  push     cs                          
  {191C2}  push     di                          
  {191C3}  xor      ax, ax                      
  {191C5}  push     ax                          
  {191C6}  lcall    0x1c71, 0x701               
  {191CB}  lcall    0x1c71, 0x5dd               
  {191D0}  lcall    0x1c71, 0x291               
  {191D5}  mov      ax, word ptr [0x19c]        
  {191D8}  add      ax, 0x14                    
  {191DB}  mov      word ptr [0x19c], ax        
  {191DE}  mov      ax, word ptr [0x19c]        
  {191E1}  cmp      ax, word ptr [0x664]        
  {191E5}  jle      0x191ed                     
  {191E7}  mov      ax, word ptr [0x664]        
  {191EA}  mov      word ptr [0x19c], ax        
  {191ED}  mov      di, 0x564                   
  {191F0}  push     ds                          
  {191F1}  push     di                          
  {191F2}  mov      di, 0x5fdb                  
  {191F5}  push     cs                          
  {191F6}  push     di                          
  {191F7}  lcall    0x1c71, 0x9d7               
  {191FC}  jne      0x19245                     
  {191FE}  cmp      word ptr [0x220], -1        
  {19203}  jl       0x1920e                     
  {19205}  jg       0x19245                     
  {19207}  cmp      word ptr [0x21e], -0xa      
  {1920C}  ja       0x19245                     
  {1920E}  mov      di, 0x7a2                   
  {19211}  push     ds                          
  {19212}  push     di                          
  {19213}  mov      di, 0x5fee                  
  {19216}  push     cs                          
  {19217}  push     di                          
  {19218}  xor      ax, ax                      
  {1921A}  push     ax                          
  {1921B}  lcall    0x1c71, 0x701               
  {19220}  lcall    0x1c71, 0x5dd               
  {19225}  lcall    0x1c71, 0x291               
  {1922A}  mov      ax, word ptr [0x21e]        
  {1922D}  mov      dx, word ptr [0x220]        
  {19231}  add      ax, 0xa                     
  {19234}  adc      dx, 0                       
  {19237}  mov      word ptr [0x21e], ax        
  {1923A}  mov      word ptr [0x220], dx        
  {1923E}  mov      ax, word ptr [0x182]        
  {19241}  inc      ax                          
  {19242}  mov      word ptr [0x182], ax           // PRZEDM.KUNSZT
  {19245}  mov      di, 0x564                   
  {19248}  push     ds                          
  {19249}  push     di                          
  {1924A}  mov      di, 0x6010                  
  {1924D}  push     cs                          
  {1924E}  push     di                          
  {1924F}  lcall    0x1c71, 0x9d7               
  {19254}  je       0x19259                     
  {19256}  jmp      0x19333                     
  {19259}  cmp      word ptr [0x220], -1        
  {1925E}  jl       0x1926f                     
  {19260}  jle      0x19265                     
  {19262}  jmp      0x19333                     
  {19265}  cmp      word ptr [0x21e], -0xa      
  {1926A}  jbe      0x1926f                     
  {1926C}  jmp      0x19333                     
  {1926F}  mov      di, 0x7a2                   
  {19272}  push     ds                          
  {19273}  push     di                          
  {19274}  mov      di, 0x6021                  
  {19277}  push     cs                          
  {19278}  push     di                          
  {19279}  xor      ax, ax                      
  {1927B}  push     ax                          
  {1927C}  lcall    0x1c71, 0x701               
  {19281}  lcall    0x1c71, 0x5dd               
  {19286}  lcall    0x1c71, 0x291               
  {1928B}  mov      di, 0x7a2                   
  {1928E}  push     ds                          
  {1928F}  push     di                          
  {19290}  mov      di, 0x603c                  
  {19293}  push     cs                          
  {19294}  push     di                          
  {19295}  xor      ax, ax                      
  {19297}  push     ax                          
  {19298}  lcall    0x1c71, 0x701               
  {1929D}  lcall    0x1c71, 0x5dd               
  {192A2}  lcall    0x1c71, 0x291               
  {192A7}  mov      di, 0x7a2                   
  {192AA}  push     ds                          
  {192AB}  push     di                          
  {192AC}  mov      di, 0x6057                  
  {192AF}  push     cs                          
  {192B0}  push     di                          
  {192B1}  xor      ax, ax                      
  {192B3}  push     ax                          
  {192B4}  lcall    0x1c71, 0x701               
  {192B9}  lcall    0x1c71, 0x5dd               
  {192BE}  lcall    0x1c71, 0x291               
  {192C3}  mov      di, 0x7a2                   
  {192C6}  push     ds                          
  {192C7}  push     di                          
  {192C8}  mov      di, 0x6072                  
  {192CB}  push     cs                          
  {192CC}  push     di                          
  {192CD}  xor      ax, ax                      
  {192CF}  push     ax                          
  {192D0}  lcall    0x1c71, 0x701               
  {192D5}  lcall    0x1c71, 0x5dd               
  {192DA}  lcall    0x1c71, 0x291               
  {192DF}  mov      di, 0x7a2                   
  {192E2}  push     ds                          
  {192E3}  push     di                          
  {192E4}  mov      di, 0x608d                  
  {192E7}  push     cs                          
  {192E8}  push     di                          
  {192E9}  xor      ax, ax                      
  {192EB}  push     ax                          
  {192EC}  lcall    0x1c71, 0x701               
  {192F1}  lcall    0x1c71, 0x5dd               
  {192F6}  lcall    0x1c71, 0x291               
  {192FB}  mov      di, 0x7a2                   
  {192FE}  push     ds                          
  {192FF}  push     di                          
  {19300}  mov      di, 0x60a8                  
  {19303}  push     cs                          
  {19304}  push     di                          
  {19305}  xor      ax, ax                      
  {19307}  push     ax                          
  {19308}  lcall    0x1c71, 0x701               
  {1930D}  lcall    0x1c71, 0x5dd               
  {19312}  lcall    0x1c71, 0x291               
  {19317}  mov      di, 0x7a2                   
  {1931A}  push     ds                          
  {1931B}  push     di                          
  {1931C}  mov      di, 0x6021                  
  {1931F}  push     cs                          
  {19320}  push     di                          
  {19321}  xor      ax, ax                      
  {19323}  push     ax                          
  {19324}  lcall    0x1c71, 0x701               
  {19329}  lcall    0x1c71, 0x5dd               
  {1932E}  lcall    0x1c71, 0x291               
  {19333}  mov      di, 0x564                   
  {19336}  push     ds                          
  {19337}  push     di                          
  {19338}  mov      di, 0x60c3                  
  {1933B}  push     cs                          
  {1933C}  push     di                          
  {1933D}  lcall    0x1c71, 0x9d7               
  {19342}  jne      0x1938f                     
  {19344}  cmp      word ptr [0x1a6], -0xa      
  {19349}  jg       0x1938f                     
  {1934B}  mov      ax, word ptr [0x182]        
  {1934E}  dec      ax                          
  {1934F}  mov      word ptr [0x182], ax           // PRZEDM.KUNSZT
  {19352}  mov      ax, word ptr [0x1a6]        
  {19355}  add      ax, 0xa                     
  {19358}  mov      word ptr [0x1a6], ax        
  {1935B}  mov      di, 0x7a2                   
  {1935E}  push     ds                          
  {1935F}  push     di                          
  {19360}  mov      di, 0x60ce                  
  {19363}  push     cs                          
  {19364}  push     di                          
  {19365}  xor      ax, ax                      
  {19367}  push     ax                          
  {19368}  lcall    0x1c71, 0x701               
  {1936D}  lcall    0x1c71, 0x5dd               
  {19372}  lcall    0x1c71, 0x291               
  {19377}  mov      ax, word ptr [0x19c]        
  {1937A}  add      ax, 0x1a                    
  {1937D}  mov      word ptr [0x19c], ax        
  {19380}  mov      ax, word ptr [0x19c]        
  {19383}  cmp      ax, word ptr [0x664]        
  {19387}  jle      0x1938f                     
  {19389}  mov      ax, word ptr [0x664]        
  {1938C}  mov      word ptr [0x19c], ax        
  {1938F}  mov      di, 0x564                   
  {19392}  push     ds                          
  {19393}  push     di                          
  {19394}  mov      di, 0x6107                  
  {19397}  push     cs                          
  {19398}  push     di                          
  {19399}  lcall    0x1c71, 0x9d7               
  {1939E}  jne      0x193bc                     
  {193A0}  mov      di, 0x7a2                   
  {193A3}  push     ds                          
  {193A4}  push     di                          
  {193A5}  mov      di, 0x6113                  
  {193A8}  push     cs                          
  {193A9}  push     di                          
  {193AA}  xor      ax, ax                      
  {193AC}  push     ax                          
  {193AD}  lcall    0x1c71, 0x701               
  {193B2}  lcall    0x1c71, 0x5dd               
  {193B7}  lcall    0x1c71, 0x291               
  {193BC}  mov      di, 0x564                   
  {193BF}  push     ds                          
  {193C0}  push     di                          
  {193C1}  mov      di, 0x614b                  
  {193C4}  push     cs                          
  {193C5}  push     di                          
  {193C6}  lcall    0x1c71, 0x9d7               
  {193CB}  jne      0x19418                     
  {193CD}  cmp      word ptr [0x1aa], -0xa      
  {193D2}  jg       0x19418                     
  {193D4}  mov      ax, word ptr [0x182]        
  {193D7}  dec      ax                          
  {193D8}  mov      word ptr [0x182], ax           // PRZEDM.KUNSZT
  {193DB}  mov      ax, word ptr [0x1aa]        
  {193DE}  add      ax, 0xa                     
  {193E1}  mov      word ptr [0x1aa], ax        
  {193E4}  mov      di, 0x7a2                   
  {193E7}  push     ds                          
  {193E8}  push     di                          
  {193E9}  mov      di, 0x6155                  
  {193EC}  push     cs                          
  {193ED}  push     di                          
  {193EE}  xor      ax, ax                      
  {193F0}  push     ax                          
  {193F1}  lcall    0x1c71, 0x701               
  {193F6}  lcall    0x1c71, 0x5dd               
  {193FB}  lcall    0x1c71, 0x291               
  {19400}  mov      ax, word ptr [0x19c]        
  {19403}  add      ax, 0x22                    
  {19406}  mov      word ptr [0x19c], ax        
  {19409}  mov      ax, word ptr [0x19c]        
  {1940C}  cmp      ax, word ptr [0x664]        
  {19410}  jle      0x19418                     
  {19412}  mov      ax, word ptr [0x664]        
  {19415}  mov      word ptr [0x19c], ax        
  {19418}  mov      di, 0x564                   
  {1941B}  push     ds                          
  {1941C}  push     di                          
  {1941D}  mov      di, 0x6189                  
  {19420}  push     cs                          
  {19421}  push     di                          
  {19422}  lcall    0x1c71, 0x9d7               
  {19427}  jne      0x19474                     
  {19429}  cmp      word ptr [0x192], -0xa         // PRZEDM.ILOSC
  {1942E}  jg       0x19474                     
  {19430}  mov      ax, word ptr [0x182]        
  {19433}  dec      ax                          
  {19434}  mov      word ptr [0x182], ax           // PRZEDM.KUNSZT
  {19437}  mov      ax, word ptr [0x192]        
  {1943A}  add      ax, 0xa                     
  {1943D}  mov      word ptr [0x192], ax           // PRZEDM.ILOSC
  {19440}  mov      di, 0x7a2                   
  {19443}  push     ds                          
  {19444}  push     di                          
  {19445}  mov      di, 0x61a0                  
  {19448}  push     cs                          
  {19449}  push     di                          
  {1944A}  xor      ax, ax                      
  {1944C}  push     ax                          
  {1944D}  lcall    0x1c71, 0x701               
  {19452}  lcall    0x1c71, 0x5dd               
  {19457}  lcall    0x1c71, 0x291               
  {1945C}  mov      ax, word ptr [0x1ac]        
  {1945F}  add      ax, 0x1e                    
  {19462}  mov      word ptr [0x1ac], ax        
  {19465}  mov      ax, word ptr [0x1ac]        
  {19468}  cmp      ax, word ptr [0x1ae]        
  {1946C}  jle      0x19474                     
  {1946E}  mov      ax, word ptr [0x1ae]        
  {19471}  mov      word ptr [0x1ac], ax        
  {19474}  mov      di, 0x564                   
  {19477}  push     ds                          
  {19478}  push     di                          
  {19479}  mov      di, 0x61d1                  
  {1947C}  push     cs                          
  {1947D}  push     di                          
  {1947E}  lcall    0x1c71, 0x9d7               
  {19483}  jne      0x194d1                     
  {19485}  cmp      byte ptr [0x259], 0xf6      
  {1948A}  jg       0x194d1                     
  {1948C}  mov      ax, word ptr [0x182]        
  {1948F}  dec      ax                          
  {19490}  mov      word ptr [0x182], ax           // PRZEDM.KUNSZT
  {19493}  mov      al, byte ptr [0x259]        
  {19496}  cwde                                 
  {19497}  add      ax, 0xa                     
  {1949A}  mov      byte ptr [0x259], al        
  {1949D}  mov      di, 0x7a2                   
  {194A0}  push     ds                          
  {194A1}  push     di                          
  {194A2}  mov      di, 0x61dc                  
  {194A5}  push     cs                          
  {194A6}  push     di                          
  {194A7}  xor      ax, ax                      
  {194A9}  push     ax                          
  {194AA}  lcall    0x1c71, 0x701               
  {194AF}  lcall    0x1c71, 0x5dd               
  {194B4}  lcall    0x1c71, 0x291               
  {194B9}  mov      ax, word ptr [0x19c]        
  {194BC}  add      ax, 0x14                    
  {194BF}  mov      word ptr [0x19c], ax        
  {194C2}  mov      ax, word ptr [0x19c]        
  {194C5}  cmp      ax, word ptr [0x664]        
  {194C9}  jle      0x194d1                     
  {194CB}  mov      ax, word ptr [0x664]        
  {194CE}  mov      word ptr [0x19c], ax        
  {194D1}  mov      di, 0x564                   
  {194D4}  push     ds                          
  {194D5}  push     di                          
  {194D6}  mov      di, 0x620b                  
  {194D9}  push     cs                          
  {194DA}  push     di                          
  {194DB}  lcall    0x1c71, 0x9d7               
  {194E0}  jne      0x1952e                     
  {194E2}  cmp      word ptr [0x216], -0xa      
  {194E7}  jg       0x1952e                     
  {194E9}  cmp      byte ptr [0x264], 0         
  {194EE}  jne      0x1952e                     
  {194F0}  mov      di, 0x7a2                   
  {194F3}  push     ds                          
  {194F4}  push     di                          
  {194F5}  mov      di, 0x6218                  
  {194F8}  push     cs                          
  {194F9}  push     di                          
  {194FA}  xor      ax, ax                      
  {194FC}  push     ax                          
  {194FD}  lcall    0x1c71, 0x701               
  {19502}  lcall    0x1c71, 0x5dd               
  {19507}  lcall    0x1c71, 0x291               
  {1950C}  mov      ax, word ptr [0x1c2]        
  {1950F}  add      ax, 7                       
  {19512}  mov      word ptr [0x1c2], ax        
  {19515}  mov      word ptr [0x218], 1         
  {1951B}  mov      di, 0x623c                  
  {1951E}  push     cs                          
  {1951F}  push     di                          
  {19520}  mov      di, 0x264                   
  {19523}  push     ds                          
  {19524}  push     di                          
  {19525}  mov      ax, 0xff                    
  {19528}  push     ax                          
  {19529}  lcall    0x1c71, 0x900               
  {1952E}  mov      di, 0x564                   
  {19531}  push     ds                          
  {19532}  push     di                          
  {19533}  mov      di, 0x6240                  
  {19536}  push     cs                          
  {19537}  push     di                          
  {19538}  lcall    0x1c71, 0x9d7               
  {1953D}  jne      0x19586                     
  {1953F}  cmp      word ptr [0x216], -0xa      
  {19544}  jg       0x19586                     
  {19546}  mov      di, 0x264                   
  {19549}  push     ds                          
  {1954A}  push     di                          
  {1954B}  mov      di, 0x623c                  
  {1954E}  push     cs                          
  {1954F}  push     di                          
  {19550}  lcall    0x1c71, 0x9d7               
  {19555}  jne      0x19586                     
  {19557}  mov      di, 0x7a2                   
  {1955A}  push     ds                          
  {1955B}  push     di                          
  {1955C}  mov      di, 0x624f                  
  {1955F}  push     cs                          
  {19560}  push     di                          
  {19561}  xor      ax, ax                      
  {19563}  push     ax                          
  {19564}  lcall    0x1c71, 0x701               
  {19569}  lcall    0x1c71, 0x5dd               
  {1956E}  lcall    0x1c71, 0x291               
  {19573}  xor      ax, ax                      
  {19575}  mov      word ptr [0x218], ax        
  {19578}  mov      ax, word ptr [0x1c2]        
  {1957B}  sub      ax, 7                       
  {1957E}  mov      word ptr [0x1c2], ax        
  {19581}  mov      byte ptr [0x264], 0         
  {19586}  mov      di, 0x564                   
  {19589}  push     ds                          
  {1958A}  push     di                          
  {1958B}  mov      di, 0x6274                  
  {1958E}  push     cs                          
  {1958F}  push     di                          
  {19590}  lcall    0x1c71, 0x9d7               
  {19595}  jne      0x195ba                     
  {19597}  cmp      byte ptr [0x25b], 0xf6      
  {1959C}  jg       0x195ba                     
  {1959E}  mov      di, 0x7a2                   
  {195A1}  push     ds                          
  {195A2}  push     di                          
  {195A3}  mov      di, 0x6280                  
  {195A6}  push     cs                          
  {195A7}  push     di                          
  {195A8}  xor      ax, ax                      
  {195AA}  push     ax                          
  {195AB}  lcall    0x1c71, 0x701               
  {195B0}  lcall    0x1c71, 0x5dd               
  {195B5}  lcall    0x1c71, 0x291               
  {195BA}  mov      di, 0x564                   
  {195BD}  push     ds                          
  {195BE}  push     di                          
  {195BF}  mov      di, 0x62ac                  
  {195C2}  push     cs                          
  {195C3}  push     di                          
  {195C4}  lcall    0x1c71, 0x9d7               
  {195C9}  jne      0x19627                     
  {195CB}  cmp      word ptr [0x222], -0xa      
  {195D0}  jg       0x19627                     
  {195D2}  cmp      byte ptr [0x264], 0         
  {195D7}  jne      0x19627                     
  {195D9}  mov      di, 0x7a2                   
  {195DC}  push     ds                          
  {195DD}  push     di                          
  {195DE}  mov      di, 0x62ba                  
  {195E1}  push     cs                          
  {195E2}  push     di                          
  {195E3}  xor      ax, ax                      
  {195E5}  push     ax                          
  {195E6}  lcall    0x1c71, 0x701               
  {195EB}  lcall    0x1c71, 0x5dd               
  {195F0}  lcall    0x1c71, 0x291               
  {195F5}  mov      word ptr [0x218], 1         
  {195FB}  mov      ax, word ptr [0x1c4]        
  {195FE}  inc      ax                          
  {195FF}  mov      word ptr [0x1c4], ax        
  {19602}  mov      ax, word ptr [0x1c2]        
  {19605}  add      ax, 0xa                     
  {19608}  mov      word ptr [0x1c2], ax        
  {1960B}  mov      ax, word ptr [0x224]        
  {1960E}  add      ax, 0xf                     
  {19611}  mov      word ptr [0x224], ax        
  {19614}  mov      di, 0x62f6                  
  {19617}  push     cs                          
  {19618}  push     di                          
  {19619}  mov      di, 0x264                   
  {1961C}  push     ds                          
  {1961D}  push     di                          
  {1961E}  mov      ax, 0xff                    
  {19621}  push     ax                          
  {19622}  lcall    0x1c71, 0x900               
  {19627}  mov      di, 0x564                   
  {1962A}  push     ds                          
  {1962B}  push     di                          
  {1962C}  mov      di, 0x62ff                  
  {1962F}  push     cs                          
  {19630}  push     di                          
  {19631}  lcall    0x1c71, 0x9d7               
  {19636}  je       0x1963b                     
  {19638}  jmp      0x1974c                     
  {1963B}  cmp      byte ptr [0x257], 0xf6      
  {19640}  jle      0x19645                     
  {19642}  jmp      0x1974c                     
  {19645}  mov      di, 0x7a2                   
  {19648}  push     ds                          
  {19649}  push     di                          
  {1964A}  mov      di, 0x630c                  
  {1964D}  push     cs                          
  {1964E}  push     di                          
  {1964F}  xor      ax, ax                      
  {19651}  push     ax                          
  {19652}  lcall    0x1c71, 0x701               
  {19657}  lcall    0x1c71, 0x5dd               
  {1965C}  lcall    0x1c71, 0x291               
  {19661}  mov      al, byte ptr [0x257]        
  {19664}  cwde                                 
  {19665}  add      ax, 0xa                     
  {19668}  mov      byte ptr [0x257], al        
  {1966B}  push     cs                          
  {1966C}  call     0x12aca                     
  {1966F}  cmp      word ptr [0x18c], 0xa       
  {19674}  jge      0x196c4                     
  {19676}  mov      di, 0x7a2                   
  {19679}  push     ds                          
  {1967A}  push     di                          
  {1967B}  mov      di, 0x6358                  
  {1967E}  push     cs                          
  {1967F}  push     di                          
  {19680}  xor      ax, ax                      
  {19682}  push     ax                          
  {19683}  lcall    0x1c71, 0x701               
  {19688}  lcall    0x1c71, 0x5dd               
  {1968D}  lcall    0x1c71, 0x291               
  {19692}  mov      di, 0x7a2                   
  {19695}  push     ds                          
  {19696}  push     di                          
  {19697}  mov      di, 0x639b                  
  {1969A}  push     cs                          
  {1969B}  push     di                          
  {1969C}  xor      ax, ax                      
  {1969E}  push     ax                          
  {1969F}  lcall    0x1c71, 0x701               
  {196A4}  lcall    0x1c71, 0x5dd               
  {196A9}  lcall    0x1c71, 0x291               
  {196AE}  mov      ax, word ptr [0x664]        
  {196B1}  dec      ax                          
  {196B2}  mov      word ptr [0x664], ax        
  {196B5}  mov      word ptr [0x19c], 1         
  {196BB}  mov      ax, word ptr [0x1d4]        
  {196BE}  sub      ax, 0x32                    
  {196C1}  mov      word ptr [0x1d4], ax        
  {196C4}  cmp      word ptr [0x18c], 9         
  {196C9}  jle      0x19729                     
  {196CB}  cmp      word ptr [0x18c], 0x10      
  {196D0}  jge      0x19729                     
  {196D2}  mov      di, 0x7a2                   
  {196D5}  push     ds                          
  {196D6}  push     di                          
  {196D7}  mov      di, 0x63cf                  
  {196DA}  push     cs                          
  {196DB}  push     di                          
  {196DC}  xor      ax, ax                      
  {196DE}  push     ax                          
  {196DF}  lcall    0x1c71, 0x701               
  {196E4}  lcall    0x1c71, 0x5dd               
  {196E9}  lcall    0x1c71, 0x291               
  {196EE}  mov      di, 0x7a2                   
  {196F1}  push     ds                          
  {196F2}  push     di                          
  {196F3}  mov      di, 0x640d                  
  {196F6}  push     cs                          
  {196F7}  push     di                          
  {196F8}  xor      ax, ax                      
  {196FA}  push     ax                          
  {196FB}  lcall    0x1c71, 0x701               
  {19700}  lcall    0x1c71, 0x5dd               
  {19705}  lcall    0x1c71, 0x291               
  {1970A}  mov      ax, word ptr [0x19c]        
  {1970D}  sub      ax, 0x28                    
  {19710}  mov      word ptr [0x19c], ax        
  {19713}  cmp      word ptr [0x19c], 1         
  {19718}  jge      0x19720                     
  {1971A}  mov      word ptr [0x19c], 1         
  {19720}  mov      ax, word ptr [0x1d4]        
  {19723}  sub      ax, 0x1e                    
  {19726}  mov      word ptr [0x1d4], ax        
  {19729}  cmp      word ptr [0x18c], 0xf       
  {1972E}  jle      0x1974c                     
  {19730}  mov      di, 0x7a2                   
  {19733}  push     ds                          
  {19734}  push     di                          
  {19735}  mov      di, 0x6431                  
  {19738}  push     cs                          
  {19739}  push     di                          
  {1973A}  xor      ax, ax                      
  {1973C}  push     ax                          
  {1973D}  lcall    0x1c71, 0x701               
  {19742}  lcall    0x1c71, 0x5dd               
  {19747}  lcall    0x1c71, 0x291               
  {1974C}  mov      di, 0x564                   
  {1974F}  push     ds                          
  {19750}  push     di                          
  {19751}  mov      di, 0x6474                  
  {19754}  push     cs                          
  {19755}  push     di                          
  {19756}  lcall    0x1c71, 0x9d7               
  {1975B}  jne      0x197b4                     
  {1975D}  cmp      word ptr [0x222], -0xa      
  {19762}  jg       0x197b4                     
  {19764}  mov      di, 0x264                   
  {19767}  push     ds                          
  {19768}  push     di                          
  {19769}  mov      di, 0x62f6                  
  {1976C}  push     cs                          
  {1976D}  push     di                          
  {1976E}  lcall    0x1c71, 0x9d7               
  {19773}  jne      0x197b4                     
  {19775}  mov      di, 0x7a2                   
  {19778}  push     ds                          
  {19779}  push     di                          
  {1977A}  mov      di, 0x6484                  
  {1977D}  push     cs                          
  {1977E}  push     di                          
  {1977F}  xor      ax, ax                      
  {19781}  push     ax                          
  {19782}  lcall    0x1c71, 0x701               
  {19787}  lcall    0x1c71, 0x5dd               
  {1978C}  lcall    0x1c71, 0x291               
  {19791}  xor      ax, ax                      
  {19793}  mov      word ptr [0x218], ax        
  {19796}  mov      ax, word ptr [0x1c4]        
  {19799}  dec      ax                          
  {1979A}  mov      word ptr [0x1c4], ax        
  {1979D}  mov      ax, word ptr [0x1c2]        
  {197A0}  sub      ax, 0xa                     
  {197A3}  mov      word ptr [0x1c2], ax        
  {197A6}  mov      ax, word ptr [0x224]        
  {197A9}  sub      ax, 0xf                     
  {197AC}  mov      word ptr [0x224], ax        
  {197AF}  mov      byte ptr [0x264], 0         
  {197B4}  pop      bp                          
  {197B5}  retf                                 
  {197B6}  or       bx, word ptr [bp + si + 0x4d]
  {197B9}  dec      cx                          
  {197BA}  inc      bp                          
  {197BB}  dec      si                          
  {197BC}  and      byte ptr [bp + di + 0x4f], cl
  {197BF}  dec      sp                          
  {197C0}  dec      di                          
  {197C1}  push     dx                          
  {197C2}  adc      dx, word ptr [bx + si + 0x4f]
  {197C5}  inc      sp                          
  {197C6}  inc      cx                          
  {197C7}  dec      dx                          
  {197C8}  and      byte ptr [si + 0x49], cl    
  {197CB}  inc      bx                          
  {197CC}  pop      dx                          
  {197CD}  inc      dx                          
  {197CE}  inc      bp                          
  {197CF}  and      byte ptr [bp + di + 0x4f], cl
  {197D2}  dec      sp                          
  {197D3}  dec      di                          
  {197D4}  push     dx                          
  {197D5}  push     bp                          
  {197D6}  or       word ptr [bp + si + 0x4d], bx
  {197D9}  dec      cx                          
  {197DA}  inc      bp                          
  {197DB}  dec      si                          
  {197DC}  and      byte ptr [si + 0x4c], dl    
  {197DF}  dec      di                          
  {197E0}  adc      byte ptr [bx + si + 0x4f], dl
  {197E3}  inc      sp                          
  {197E4}  inc      cx                          
  {197E5}  dec      dx                          
  {197E6}  and      byte ptr [si + 0x49], cl    
  {197E9}  inc      bx                          
  {197EA}  pop      dx                          
  {197EB}  inc      dx                          
  {197EC}  inc      bp                          
  {197ED}  and      byte ptr [si + 0x4c], dl    
  {197F0}  inc      cx                          
  {197F1}  push     bp                          
  {197F2}  mov      bp, sp                      
  {197F4}  xor      ax, ax                      
  {197F6}  lcall    0x1c71, 0x2cd               
  {197FB}  mov      di, 0x564                   
  {197FE}  push     ds                          
  {197FF}  push     di                          
  {19800}  mov      di, 0x6de6                  
  {19803}  push     cs                          
  {19804}  push     di                          
  {19805}  lcall    0x1c71, 0x9d7               
  {1980A}  jne      0x19848                     
  {1980C}  mov      di, 0x7a2                   
  {1980F}  push     ds                          
  {19810}  push     di                          
  {19811}  mov      di, 0x6df2                  
  {19814}  push     cs                          
  {19815}  push     di                          
  {19816}  xor      ax, ax                      
  {19818}  push     ax                          
  {19819}  lcall    0x1c71, 0x701               
  {1981E}  lcall    0x1c71, 0x5dd               
  {19823}  lcall    0x1c71, 0x291               
  {19828}  mov      di, 0x6a2                   
  {1982B}  push     ds                          
  {1982C}  push     di                          
  {1982D}  lcall    0x1c71, 0x72d               
  {19832}  mov      word ptr [0x19e], ax        
  {19835}  lcall    0x1c71, 0x59d               
  {1983A}  lcall    0x1c71, 0x291               
  {1983F}  mov      al, byte ptr [0x19e]        
  {19842}  push     ax                          
  {19843}  lcall    0x1c0f, 0x263               
  {19848}  mov      di, 0x564                   
  {1984B}  push     ds                          
  {1984C}  push     di                          
  {1984D}  mov      di, 0x6e06                  
  {19850}  push     cs                          
  {19851}  push     di                          
  {19852}  lcall    0x1c71, 0x9d7               
  {19857}  jne      0x19895                     
  {19859}  mov      di, 0x7a2                   
  {1985C}  push     ds                          
  {1985D}  push     di                          
  {1985E}  mov      di, 0x6e10                  
  {19861}  push     cs                          
  {19862}  push     di                          
  {19863}  xor      ax, ax                      
  {19865}  push     ax                          
  {19866}  lcall    0x1c71, 0x701               
  {1986B}  lcall    0x1c71, 0x5dd               
  {19870}  lcall    0x1c71, 0x291               
  {19875}  mov      di, 0x6a2                   
  {19878}  push     ds                          
  {19879}  push     di                          
  {1987A}  lcall    0x1c71, 0x72d               
  {1987F}  mov      word ptr [0x19e], ax        
  {19882}  lcall    0x1c71, 0x59d               
  {19887}  lcall    0x1c71, 0x291               
  {1988C}  mov      al, byte ptr [0x19e]        
  {1988F}  push     ax                          
  {19890}  lcall    0x1c0f, 0x27d               
  {19895}  pop      bp                          
  {19896}  retf                                 
  {19897}  sub      ax, 0x454a                  
  {1989A}  push     bx                          
  {1989B}  push     sp                          
  {1989C}  inc      bp                          
  {1989D}  push     bx                          
  {1989E}  and      byte ptr [bp + 0x41], cl    
  {198A1}  and      byte ptr [bx + di + 0x52], al
  {198A4}  inc      bp                          
  {198A5}  dec      si                          
  {198A6}  dec      cx                          
  {198A7}  inc      bp                          
  {198A8}  and      byte ptr [bx + di + 0x20], cl
  {198AB}  inc      bx                          
  {198AC}  pop      dx                          
  {198AD}  push     bp                          
  {198AE}  dec      dx                          
  {198AF}  inc      bp                          
  {198B0}  push     bx                          
  {198B1}  pop      dx                          
  {198B2}  and      byte ptr [bx + si + 0x4f], dl
  {198B5}  push     sp                          
  {198B6}  push     dx                          
  {198B7}  pop      dx                          
  {198B8}  inc      bp                          
  {198B9}  inc      dx                          
  {198BA}  inc      bp                          
  {198BB}  and      byte ptr [bp + si + 0x41], bl
  {198BE}  inc      dx                          
  {198BF}  dec      cx                          
  {198C0}  dec      dx                          
  {198C1}  inc      cx                          
  {198C2}  dec      si                          
  {198C3}  dec      cx                          
  {198C4}  inc      cx                          
  {198C5}  add      ah, byte ptr [di]           
  {198C7}  add      al, 0x4d                    
  {198CA}  dec      di                          
  {198CB}  inc      sp                          
  {198CC}  inc      bp                          
  {198CD}  push     cs                          
  {198CE}  pop      dx                          
  {198CF}  inc      cx                          
  {198D0}  inc      dx                          
  {198D1}  dec      cx                          
  {198D2}  dec      dx                          
  {198D3}  and      byte ptr [bp + si + 0x41], al
  {198D6}  dec      bx                          
  {198D7}  push     sp                          
  {198D8}  inc      bp                          
  {198D9}  push     dx                          
  {198DA}  dec      cx                          
  {198DB}  inc      cx                          
  {198DC}  sbb      byte ptr [bp + si + 0x55], al
  {198DF}  push     bp                          
  {198E0}  push     bp                          
  {198E1}  push     bp                          
  {198E2}  push     bp                          
  {198E3}  and      word ptr [bx + si], sp      
  {198E5}  inc      dx                          
  {198E6}  dec      cx                          
  {198E7}  inc      bp                          
  {198E8}  inc      sp                          
  {198E9}  dec      si                          
  {198EA}  inc      cx                          
  {198EB}  and      byte ptr [bp + si + 0x41], al
  {198EE}  dec      bx                          
  {198EF}  push     sp                          
  {198F0}  inc      bp                          
  {198F1}  push     dx                          
  {198F2}  dec      cx                          
  {198F3}  inc      cx                          
  {198F4}  and      byte ptr [si], cl           
  {198F6}  pop      dx                          
  {198F7}  inc      cx                          
  {198F8}  inc      dx                          
  {198F9}  dec      cx                          
  {198FA}  dec      dx                          
  {198FB}  and      byte ptr [bp + di + 0x4c], dl
  {198FE}  dec      cx                          
  {198FF}  dec      bp                          
  {19900}  inc      cx                          
  {19901}  dec      bx                          
  {19902}  or       al, 0x5a                    
  {19904}  inc      cx                          
  {19905}  inc      dx                          
  {19906}  dec      cx                          
  {19907}  dec      dx                          
  {19908}  and      byte ptr [bp + di + 0x4f], cl
  {1990B}  push     dx                          
  {1990C}  dec      si                          
  {1990D}  dec      cx                          
  {1990E}  dec      bx                          
  {1990F}  or       bx, word ptr [bp + si + 0x41]
  {19912}  inc      dx                          
  {19913}  dec      cx                          
  {19914}  dec      dx                          
  {19915}  and      byte ptr [di + 0x55], cl    
  {19918}  inc      bx                          
  {19919}  dec      ax                          
  {1991A}  inc      cx                          
  {1991B}  or       word ptr [bp + si + 0x41], bx
  {1991E}  inc      dx                          
  {1991F}  dec      cx                          
  {19920}  dec      dx                          
  {19921}  and      byte ptr [bp + si + 0x55], bl
  {19924}  dec      bx                          
  {19925}  push     cs                          
  {19926}  pop      dx                          
  {19927}  inc      cx                          
  {19928}  inc      dx                          
  {19929}  dec      cx                          
  {1992A}  dec      dx                          
  {1992B}  and      byte ptr [bp + di + 0x41], cl
  {1992E}  push     dx                          
  {1992F}  inc      cx                          
  {19930}  dec      sp                          
  {19931}  push     bp                          
  {19932}  inc      bx                          
  {19933}  dec      ax                          
  {19934}  or       al, 0x5a                    
  {19936}  inc      cx                          
  {19937}  inc      dx                          
  {19938}  dec      cx                          
  {19939}  dec      dx                          
  {1993A}  and      byte ptr [di + 0x52], cl    
  {1993D}  dec      di                          
  {1993E}  push     di                          
  {1993F}  dec      bx                          
  {19940}  inc      cx                          
  {19941}  or       bx, word ptr [bp + si + 0x41]
  {19944}  inc      dx                          
  {19945}  dec      cx                          
  {19946}  dec      dx                          
  {19947}  and      byte ptr [bx + si + 0x41], dl
  {1994A}  dec      dx                          
  {1994B}  inc      cx                          
  {1994C}  dec      bx                          
  {1994D}  or       bl, byte ptr [bp + si + 0x41]
  {19950}  inc      dx                          
  {19951}  dec      cx                          
  {19952}  dec      dx                          
  {19953}  and      byte ptr [si + 0x5a], al    
  {19956}  dec      cx                          
  {19957}  dec      bx                          
  {19958}  or       ax, 0x415a                  
  {1995B}  inc      dx                          
  {1995C}  dec      cx                          
  {1995D}  dec      dx                          
  {1995E}  and      byte ptr [bx + 0x49], dl    
  {19961}  dec      sp                          
  {19962}  inc      bx                          
  {19963}  pop      dx                          
  {19964}  push     bp                          
  {19965}  push     dx                          
  {19966}  and      ax, 0x4957                  
  {19969}  dec      sp                          
  {1996A}  inc      bx                          
  {1996B}  pop      dx                          
  {1996C}  push     bp                          
  {1996D}  push     dx                          
  {1996E}  and      byte ptr [bx + si + 0x52], dl
  {19971}  pop      dx                          
  {19972}  pop      cx                          
  {19973}  dec      dx                          
  {19974}  inc      cx                          
  {19975}  and      byte ptr [bx + si + 0x52], dl
  {19978}  dec      di                          
  {19979}  push     ax                          
  {1997A}  dec      di                          
  {1997B}  pop      dx                          
  {1997C}  pop      cx                          
  {1997D}  inc      bx                          
  {1997E}  dec      dx                          
  {1997F}  inc      bp                          
  {19980}  and      byte ptr [bp + si + 0x20], bl
  {19983}  inc      di                          
  {19984}  dec      di                          
  {19985}  inc      sp                          
  {19986}  dec      si                          
  {19987}  dec      di                          
  {19988}  push     bx                          
  {19989}  inc      bx                          
  {1998A}  dec      cx                          
  {1998B}  inc      cx                          
  {1998C}  or       al, 0x5a                    
  {1998E}  inc      cx                          
  {1998F}  inc      dx                          
  {19990}  dec      cx                          
  {19991}  dec      dx                          
  {19992}  and      byte ptr [bp + di + 0x5a], dl
  {19995}  inc      bx                          
  {19996}  pop      dx                          
  {19997}  push     bp                          
  {19998}  push     dx                          
  {19999}  or       word ptr [bp + si + 0x41], bx
  {1999C}  inc      dx                          
  {1999D}  dec      cx                          
  {1999E}  dec      dx                          
  {1999F}  and      byte ptr [si + 0x49], cl    
  {199A2}  push     bx                          
  {199A3}  cvtps2pd xmm0, qword ptr [bx + di + 0x42]
  {199A7}  dec      cx                          
  {199A8}  dec      dx                          
  {199A9}  and      byte ptr [bp + di + 0x55], cl
  {199AC}  push     dx                          
  {199AD}  dec      di                          
  {199AE}  push     ax                          
  {199AF}  inc      cx                          
  {199B0}  push     sp                          
  {199B1}  push     di                          
  {199B2}  inc      cx                          
  {199B3}  or       bx, word ptr [bp + si + 0x41]
  {199B6}  inc      dx                          
  {199B7}  dec      cx                          
  {199B8}  dec      dx                          
  {199B9}  and      byte ptr [bp + si + 0x41], bl
  {199BC}  dec      dx                          
  {199BD}  inc      cx                          
  {199BE}  inc      bx                          
  {199BF}  or       bx, word ptr [bp + si + 0x41]
  {199C2}  inc      dx                          
  {199C3}  dec      cx                          
  {199C4}  dec      dx                          
  {199C5}  and      byte ptr [bx + 0x52], cl    
  {199C8}  pop      dx                          
  {199C9}  inc      bp                          
  {199CA}  dec      sp                          
  {199CB}  or       bx, word ptr [bp + si + 0x41]
  {199CE}  inc      dx                          
  {199CF}  dec      cx                          
  {199D0}  dec      dx                          
  {199D1}  and      byte ptr [bp + di + 0x41], dl
  {199D4}  push     dx                          
  {199D5}  dec      si                          
  {199D6}  inc      cx                          
  {199D7}  or       bl, byte ptr [bp + si + 0x41]
  {199DA}  inc      dx                          
  {199DB}  dec      cx                          
  {199DC}  dec      dx                          
  {199DD}  and      byte ptr [bp + di + 0x4c], dl
  {199E0}  dec      di                          
  {199E1}  dec      si                          
  {199E2}  or       word ptr [bp + si + 0x41], bx
  {199E5}  inc      dx                          
  {199E6}  dec      cx                          
  {199E7}  dec      dx                          
  {199E8}  and      byte ptr [si + 0x45], cl    
  {199EB}  push     di                          
  {199EC}  or       al, 0x5a                    
  {199EE}  inc      cx                          
  {199EF}  inc      dx                          
  {199F0}  dec      cx                          
  {199F1}  dec      dx                          
  {199F2}  and      byte ptr [bp + si + 0x59], bl
  {199F5}  push     dx                          
  {199F6}  inc      cx                          
  {199F7}  inc      si                          
  {199F8}  inc      cx                          
  {199F9}  or       bl, byte ptr [bp + si + 0x41]
  {199FC}  inc      dx                          
  {199FD}  dec      cx                          
  {199FE}  dec      dx                          
  {199FF}  and      byte ptr [bx + 0x49], dl    
  {19A02}  dec      sp                          
  {19A03}  dec      bx                          
  {19A04}  push     cs                          
  {19A05}  pop      dx                          
  {19A06}  inc      cx                          
  {19A07}  inc      dx                          
  {19A08}  dec      cx                          
  {19A09}  dec      dx                          
  {19A0A}  and      byte ptr [bx + 0x49], dl    
  {19A0D}  inc      bp                          
  {19A0E}  dec      sp                          
  {19A0F}  inc      dx                          
  {19A10}  dec      sp                          
  {19A11}  inc      cx                          
  {19A12}  inc      sp                          
  {19A13}  or       bx, word ptr [bp + si + 0x41]
  {19A16}  inc      dx                          
  {19A17}  dec      cx                          
  {19A18}  dec      dx                          
  {19A19}  and      byte ptr [bp + di + 0x54], dl
  {19A1C}  push     dx                          
  {19A1D}  push     bp                          
  {19A1E}  push     bx                          
  {19A1F}  or       word ptr [bp + si + 0x41], bx
  {19A22}  inc      dx                          
  {19A23}  dec      cx                          
  {19A24}  dec      dx                          
  {19A25}  and      byte ptr [bp + si + 0x4f], al
  {19A28}  inc      cx                          
  {19A29}  or       bx, word ptr [bp + si + 0x41]
  {19A2C}  inc      dx                          
  {19A2D}  dec      cx                          
  {19A2E}  dec      dx                          
  {19A2F}  and      byte ptr [bp + si + 0x49], al
  {19A32}  pop      dx                          
  {19A33}  dec      di                          
  {19A34}  dec      si                          
  {19A35}  or       ax, 0x415a                  
  {19A38}  inc      dx                          
  {19A39}  dec      cx                          
  {19A3A}  dec      dx                          
  {19A3B}  and      byte ptr [bx + si + 0x41], dl
  {19A3E}  dec      si                          
  {19A3F}  push     sp                          
  {19A40}  inc      bp                          
  {19A41}  push     dx                          
  {19A42}  inc      cx                          
  {19A43}  cvtps2pd xmm0, qword ptr [bx + di + 0x42]
  {19A47}  dec      cx                          
  {19A48}  dec      dx                          
  {19A49}  and      byte ptr [bx + 0x4c], al    
  {19A4C}  inc      cx                          
  {19A4D}  inc      sp                          
  {19A4E}  dec      cx                          
  {19A4F}  inc      cx                          
  {19A50}  push     sp                          
  {19A51}  dec      di                          
  {19A52}  push     dx                          
  {19A53}  push     cs                          
  {19A54}  pop      dx                          
  {19A55}  inc      cx                          
  {19A56}  inc      dx                          
  {19A57}  dec      cx                          
  {19A58}  dec      dx                          
  {19A59}  and      byte ptr [bx + 0x4f], dl    
  {19A5C}  dec      dx                          
  {19A5D}  dec      di                          
  {19A5E}  push     di                          
  {19A5F}  dec      si                          
  {19A60}  dec      cx                          
  {19A61}  dec      bx                          
  {19A62}  or       al, 0x5a                    
  {19A64}  inc      cx                          
  {19A65}  inc      dx                          
  {19A66}  dec      cx                          
  {19A67}  dec      dx                          
  {19A68}  and      byte ptr [si + 0x52], dl    
  {19A6B}  inc      bp                          
  {19A6C}  dec      si                          
  {19A6D}  inc      bp                          
  {19A6E}  push     dx                          
  {19A6F}  add      al, 0x45                    
  {19A71}  pop      ax                          
  {19A72}  dec      cx                          
  {19A73}  push     sp                          
  {19A74}  adc      word ptr [si + 0x4f], ax    
  {19A77}  push     bx                          
  {19A78}  push     sp                          
  {19A79}  inc      bp                          
  {19A7A}  push     ax                          
  {19A7B}  dec      si                          
  {19A7C}  inc      bp                          
  {19A7D}  and      byte ptr [bx + 0x59], dl    
  {19A80}  dec      dx                          
  {19A81}  push     bx                          
  {19A82}  inc      bx                          
  {19A83}  dec      cx                          
  {19A84}  inc      cx                          
  {19A85}  cmp      bl, byte ptr [bx + di]      
  {19A87}  push     ax                          
  {19A88}  dec      di                          
  {19A89}  dec      sp                          
  {19A8A}  dec      di                          
  {19A8B}  inc      sp                          
  {19A8C}  dec      si                          
  {19A8D}  dec      cx                          
  {19A8E}  inc      bp                          
  {19A8F}  sub      ax, 0x4557                  
  {19A92}  dec      dx                          
  {19A93}  push     bx                          
  {19A94}  inc      bx                          
  {19A95}  dec      cx                          
  {19A96}  inc      bp                          
  {19A97}  and      byte ptr [bp + 0x41], cl    
  {19A9A}  and      byte ptr [bx + di + 0x52], al
  {19A9D}  inc      bp                          
  {19A9E}  dec      si                          
  {19A9F}  inc      bp                          
  {19AA0}  or       al, 0x50                    
  {19AA2}  dec      di                          
  {19AA3}  dec      sp                          
  {19AA4}  dec      si                          
  {19AA5}  dec      di                          
  {19AA6}  inc      bx                          
  {19AA7}  sub      ax, 0x5241                  
  {19AAA}  inc      bp                          
  {19AAB}  dec      si                          
  {19AAC}  inc      cx                          
  {19AAD}  or       al, 0x57                    
  {19AAF}  push     bx                          
  {19AB0}  inc      bx                          
  {19AB1}  dec      ax                          
  {19AB2}  dec      di                          
  {19AB3}  inc      sp                          
  {19AB4}  sub      ax, 0x5241                  
  {19AB7}  inc      bp                          
  {19AB8}  dec      si                          
  {19AB9}  inc      cx                          
  {19ABA}  or       al, 0x5a                    
  {19ABC}  inc      cx                          
  {19ABD}  inc      bx                          
  {19ABE}  dec      ax                          
  {19ABF}  dec      di                          
  {19AC0}  inc      sp                          
  {19AC1}  sub      ax, 0x5241                  
  {19AC4}  inc      bp                          
  {19AC5}  dec      si                          
  {19AC6}  inc      cx                          
  {19AC7}  push     cs                          
  {19AC8}  push     ax                          
  {19AC9}  dec      di                          
  {19ACA}  dec      sp                          
  {19ACB}  dec      di                          
  {19ACC}  inc      sp                          
  {19ACD}  dec      si                          
  {19ACE}  dec      cx                          
  {19ACF}  inc      bp                          
  {19AD0}  sub      ax, 0x5241                  
  {19AD3}  inc      bp                          
  {19AD4}  dec      si                          
  {19AD5}  inc      cx                          
  {19AD6}  adc      word ptr [di + 0x4f], cx    
  {19AD9}  pop      dx                          
  {19ADA}  inc      bp                          
  {19ADB}  push     bx                          
  {19ADC}  pop      dx                          
  {19ADD}  and      byte ptr [bx + 0x59], dl    
  {19AE0}  dec      dx                          
  {19AE1}  push     bx                          
  {19AE2}  inc      bx                          
  {19AE3}  and      byte ptr [bp + 0x41], cl    
  {19AE6}  and      byte ptr [bp + si], bh      
  {19AE8}  cmovge   cx, word ptr [bx + 0x5a]    
  {19AEC}  inc      bp                          
  {19AED}  push     bx                          
  {19AEE}  pop      dx                          
  {19AEF}  and      byte ptr [bx + di + 0x53], cl
  {19AF2}  inc      bx                          
  {19AF3}  and      byte ptr [bp + 0x41], cl    
  {19AF6}  and      byte ptr [bp + si], bh      
  {19AF8}  adc      word ptr [si + 0x4f], ax    
  {19AFB}  push     bx                          
  {19AFC}  push     sp                          
  {19AFD}  inc      bp                          
  {19AFE}  push     ax                          
  {19AFF}  dec      si                          
  {19B00}  inc      bp                          
  {19B01}  and      byte ptr [bx + 0x59], dl    
  {19B04}  dec      dx                          
  {19B05}  push     bx                          
  {19B06}  inc      bx                          
  {19B07}  dec      cx                          
  {19B08}  inc      bp                          
  {19B09}  cmp      al, byte ptr [bx]           
  {19B0B}  push     di                          
  {19B0C}  pop      cx                          
  {19B0D}  dec      dx                          
  {19B0E}  push     bx                          
  {19B0F}  inc      bx                          
  {19B10}  dec      cx                          
  {19B11}  inc      bp                          
  {19B12}  or       byte ptr [bx + si + 0x4f], dl
  {19B15}  dec      sp                          
  {19B16}  dec      di                          
  {19B17}  inc      sp                          
  {19B18}  dec      si                          
  {19B19}  dec      cx                          
  {19B1A}  inc      bp                          
  {19B1B}  push     es                          
  {19B1C}  push     ax                          
  {19B1D}  dec      di                          
  {19B1E}  dec      sp                          
  {19B1F}  dec      si                          
  {19B20}  dec      di                          
  {19B21}  inc      bx                          
  {19B22}  push     es                          
  {19B23}  push     di                          
  {19B24}  push     bx                          
  {19B25}  inc      bx                          
  {19B26}  dec      ax                          
  {19B27}  dec      di                          
  {19B28}  inc      sp                          
  {19B29}  push     es                          
  {19B2A}  pop      dx                          
  {19B2B}  inc      cx                          
  {19B2C}  inc      bx                          
  {19B2D}  dec      ax                          
  {19B2E}  dec      di                          
  {19B2F}  inc      sp                          
  {19B30}  push     bp                          
  {19B31}  mov      bp, sp                      
  {19B33}  xor      ax, ax                      
  {19B35}  lcall    0x1c71, 0x2cd               
  {19B3A}  cmp      word ptr [0x1d6], 0x21      
  {19B3F}  jne      0x19b44                     
  {19B41}  jmp      0x19c01                     
  {19B44}  cmp      word ptr [0x1d6], 0x22      
  {19B49}  jne      0x19b4e                     
  {19B4B}  jmp      0x19c01                     
  {19B4E}  cmp      word ptr [0x1d6], 0x23      
  {19B53}  jne      0x19b58                     
  {19B55}  jmp      0x19c01                     
  {19B58}  cmp      word ptr [0x1d6], 0x24      
  {19B5D}  jne      0x19b62                     
  {19B5F}  jmp      0x19c01                     
  {19B62}  cmp      word ptr [0x1d6], 0x25      
  {19B67}  jne      0x19b6c                     
  {19B69}  jmp      0x19c01                     
  {19B6C}  cmp      word ptr [0x1d6], 0x26      
  {19B71}  jne      0x19b76                     
  {19B73}  jmp      0x19c01                     
  {19B76}  cmp      word ptr [0x1d6], 0x27      
  {19B7B}  jne      0x19b80                     
  {19B7D}  jmp      0x19c01                     
  {19B80}  cmp      word ptr [0x1d6], 0x28      
  {19B85}  je       0x19c01                     
  {19B87}  cmp      word ptr [0x1d6], 0x29      
  {19B8C}  je       0x19c01                     
  {19B8E}  cmp      word ptr [0x1d6], 0x2a      
  {19B93}  je       0x19c01                     
  {19B95}  cmp      word ptr [0x1d6], 0x2b      
  {19B9A}  je       0x19c01                     
  {19B9C}  cmp      word ptr [0x1d6], 0x2c      
  {19BA1}  je       0x19c01                     
  {19BA3}  cmp      word ptr [0x1d6], 0x2d      
  {19BA8}  je       0x19c01                     
  {19BAA}  cmp      word ptr [0x1d6], 0x2e      
  {19BAF}  je       0x19c01                     
  {19BB1}  cmp      word ptr [0x1d6], 0x2f      
  {19BB6}  je       0x19c01                     
  {19BB8}  cmp      word ptr [0x1d6], 0x30      
  {19BBD}  je       0x19c01                     
  {19BBF}  cmp      word ptr [0x1d6], 0x31      
  {19BC4}  je       0x19c01                     
  {19BC6}  cmp      word ptr [0x1d6], 0x32      
  {19BCB}  je       0x19c01                     
  {19BCD}  cmp      word ptr [0x1d6], 0x33      
  {19BD2}  je       0x19c01                     
  {19BD4}  cmp      word ptr [0x1d6], 0x34      
  {19BD9}  je       0x19c01                     
  {19BDB}  cmp      word ptr [0x1d6], 0x35      
  {19BE0}  je       0x19c01                     
  {19BE2}  cmp      word ptr [0x1d6], 0x36      
  {19BE7}  je       0x19c01                     
  {19BE9}  cmp      word ptr [0x1d6], 0x37      
  {19BEE}  je       0x19c01                     
  {19BF0}  cmp      word ptr [0x1d6], 0x38      
  {19BF5}  je       0x19c01                     
  {19BF7}  cmp      word ptr [0x1d6], 0x39      
  {19BFC}  je       0x19c01                     
  {19BFE}  jmp      0x1af1e                     
  {19C01}  mov      word ptr [0x1d8], 1         
  {19C07}  mov      di, 0x7a2                   
  {19C0A}  push     ds                          
  {19C0B}  push     di                          
  {19C0C}  mov      di, 0x6ec7                  
  {19C0F}  push     cs                          
  {19C10}  push     di                          
  {19C11}  xor      ax, ax                      
  {19C13}  push     ax                          
  {19C14}  lcall    0x1c71, 0x701               
  {19C19}  lcall    0x1c71, 0x5dd               
  {19C1E}  lcall    0x1c71, 0x291               
  {19C23}  push     cs                          
  {19C24}  call     0x164e2                     
  {19C27}  mov      di, 0x7a2                   
  {19C2A}  push     ds                          
  {19C2B}  push     di                          
  {19C2C}  mov      ax, word ptr [0x19c]        
  {19C2F}  cdq                                  
  {19C30}  push     dx                          
  {19C31}  push     ax                          
  {19C32}  xor      ax, ax                      
  {19C34}  push     ax                          
  {19C35}  lcall    0x1c71, 0x789               
  {19C3A}  mov      di, 0x6ef5                  
  {19C3D}  push     cs                          
  {19C3E}  push     di                          
  {19C3F}  xor      ax, ax                      
  {19C41}  push     ax                          
  {19C42}  lcall    0x1c71, 0x701               
  {19C47}  mov      ax, word ptr [0x1d4]        
  {19C4A}  cdq                                  
  {19C4B}  push     dx                          
  {19C4C}  push     ax                          
  {19C4D}  xor      ax, ax                      
  {19C4F}  push     ax                          
  {19C50}  lcall    0x1c71, 0x789               
  {19C55}  mov      al, 0x3e                    
  {19C57}  push     ax                          
  {19C58}  xor      ax, ax                      
  {19C5A}  push     ax                          
  {19C5B}  lcall    0x1c71, 0x67b               
  {19C60}  lcall    0x1c71, 0x5fe               
  {19C65}  lcall    0x1c71, 0x291               
  {19C6A}  mov      di, 0x6a2                   
  {19C6D}  push     ds                          
  {19C6E}  push     di                          
  {19C6F}  mov      di, 0x564                   
  {19C72}  push     ds                          
  {19C73}  push     di                          
  {19C74}  mov      ax, 0xff                    
  {19C77}  push     ax                          
  {19C78}  lcall    0x1c71, 0x6c6               
  {19C7D}  lcall    0x1c71, 0x59d               
  {19C82}  lcall    0x1c71, 0x291               
  {19C87}  push     cs                          
  {19C88}  call     0x1bb07                     
  {19C8B}  mov      di, 0x564                   
  {19C8E}  push     ds                          
  {19C8F}  push     di                          
  {19C90}  mov      di, 0x6ef8                  
  {19C93}  push     cs                          
  {19C94}  push     di                          
  {19C95}  lcall    0x1c71, 0x9d7               
  {19C9A}  jne      0x19ca0                     
  {19C9C}  push     cs                          
  {19C9D}  call     0x15ae4                     
  {19CA0}  mov      di, 0x564                   
  {19CA3}  push     ds                          
  {19CA4}  push     di                          
  {19CA5}  mov      di, 0x6efd                  
  {19CA8}  push     cs                          
  {19CA9}  push     di                          
  {19CAA}  lcall    0x1c71, 0x9d7               
  {19CAF}  jne      0x19cdf                     
  {19CB1}  mov      ax, word ptr [0x1d6]        
  {19CB4}  cmp      ax, word ptr [0x1de]        
  {19CB8}  jne      0x19cdf                     
  {19CBA}  push     cs                          
  {19CBB}  call     0x13839                     
  {19CBE}  xor      ax, ax                      
  {19CC0}  mov      word ptr [0x1de], ax        
  {19CC3}  mov      di, 0x7a2                   
  {19CC6}  push     ds                          
  {19CC7}  push     di                          
  {19CC8}  mov      di, 0x6f0c                  
  {19CCB}  push     cs                          
  {19CCC}  push     di                          
  {19CCD}  xor      ax, ax                      
  {19CCF}  push     ax                          
  {19CD0}  lcall    0x1c71, 0x701               
  {19CD5}  lcall    0x1c71, 0x5dd               
  {19CDA}  lcall    0x1c71, 0x291               
  {19CDF}  mov      di, 0x564                   
  {19CE2}  push     ds                          
  {19CE3}  push     di                          
  {19CE4}  mov      di, 0x6f25                  
  {19CE7}  push     cs                          
  {19CE8}  push     di                          
  {19CE9}  lcall    0x1c71, 0x9d7               
  {19CEE}  jne      0x19d09                     
  {19CF0}  mov      ax, word ptr [0x1d6]        
  {19CF3}  cmp      ax, word ptr [0x1e0]        
  {19CF7}  jne      0x19d09                     
  {19CF9}  push     cs                          
  {19CFA}  call     0x13839                     
  {19CFD}  cmp      word ptr [0x1d2], 0         
  {19D02}  jne      0x19d09                     
  {19D04}  xor      ax, ax                      
  {19D06}  mov      word ptr [0x1e0], ax        
  {19D09}  mov      di, 0x564                   
  {19D0C}  push     ds                          
  {19D0D}  push     di                          
  {19D0E}  mov      di, 0x6f32                  
  {19D11}  push     cs                          
  {19D12}  push     di                          
  {19D13}  lcall    0x1c71, 0x9d7               
  {19D18}  jne      0x19d33                     
  {19D1A}  mov      ax, word ptr [0x1d6]        
  {19D1D}  cmp      ax, word ptr [0x1da]        
  {19D21}  jne      0x19d33                     
  {19D23}  push     cs                          
  {19D24}  call     0x13839                     
  {19D27}  cmp      word ptr [0x1d2], 0         
  {19D2C}  jne      0x19d33                     
  {19D2E}  xor      ax, ax                      
  {19D30}  mov      word ptr [0x1da], ax        
  {19D33}  mov      di, 0x564                   
  {19D36}  push     ds                          
  {19D37}  push     di                          
  {19D38}  mov      di, 0x6f3f                  
  {19D3B}  push     cs                          
  {19D3C}  push     di                          
  {19D3D}  lcall    0x1c71, 0x9d7               
  {19D42}  jne      0x19d5d                     
  {19D44}  mov      ax, word ptr [0x1d6]        
  {19D47}  cmp      ax, word ptr [0x1dc]        
  {19D4B}  jne      0x19d5d                     
  {19D4D}  push     cs                          
  {19D4E}  call     0x13839                     
  {19D51}  cmp      word ptr [0x1d2], 0         
  {19D56}  jne      0x19d5d                     
  {19D58}  xor      ax, ax                      
  {19D5A}  mov      word ptr [0x1dc], ax        
  {19D5D}  mov      di, 0x564                   
  {19D60}  push     ds                          
  {19D61}  push     di                          
  {19D62}  mov      di, 0x6f4b                  
  {19D65}  push     cs                          
  {19D66}  push     di                          
  {19D67}  lcall    0x1c71, 0x9d7               
  {19D6C}  jne      0x19d87                     
  {19D6E}  mov      ax, word ptr [0x1d6]        
  {19D71}  cmp      ax, word ptr [0x1e2]        
  {19D75}  jne      0x19d87                     
  {19D77}  push     cs                          
  {19D78}  call     0x13839                     
  {19D7B}  cmp      word ptr [0x1d2], 0         
  {19D80}  jne      0x19d87                     
  {19D82}  xor      ax, ax                      
  {19D84}  mov      word ptr [0x1e2], ax        
  {19D87}  mov      di, 0x564                   
  {19D8A}  push     ds                          
  {19D8B}  push     di                          
  {19D8C}  mov      di, 0x6f55                  
  {19D8F}  push     cs                          
  {19D90}  push     di                          
  {19D91}  lcall    0x1c71, 0x9d7               
  {19D96}  jne      0x19daa                     
  {19D98}  mov      ax, word ptr [0x1d6]        
  {19D9B}  cmp      ax, word ptr [0x1e4]        
  {19D9F}  jne      0x19daa                     
  {19DA1}  push     cs                          
  {19DA2}  call     0x13839                     
  {19DA5}  xor      ax, ax                      
  {19DA7}  mov      word ptr [0x1e4], ax        
  {19DAA}  mov      di, 0x564                   
  {19DAD}  push     ds                          
  {19DAE}  push     di                          
  {19DAF}  mov      di, 0x6f64                  
  {19DB2}  push     cs                          
  {19DB3}  push     di                          
  {19DB4}  lcall    0x1c71, 0x9d7               
  {19DB9}  jne      0x19dcd                     
  {19DBB}  mov      ax, word ptr [0x1d6]        
  {19DBE}  cmp      ax, word ptr [0x1e6]        
  {19DC2}  jne      0x19dcd                     
  {19DC4}  push     cs                          
  {19DC5}  call     0x13839                     
  {19DC8}  xor      ax, ax                      
  {19DCA}  mov      word ptr [0x1e6], ax        
  {19DCD}  mov      di, 0x564                   
  {19DD0}  push     ds                          
  {19DD1}  push     di                          
  {19DD2}  mov      di, 0x6f71                  
  {19DD5}  push     cs                          
  {19DD6}  push     di                          
  {19DD7}  lcall    0x1c71, 0x9d7               
  {19DDC}  jne      0x19df0                     
  {19DDE}  mov      ax, word ptr [0x1d6]        
  {19DE1}  cmp      ax, word ptr [0x1e8]        
  {19DE5}  jne      0x19df0                     
  {19DE7}  push     cs                          
  {19DE8}  call     0x13839                     
  {19DEB}  xor      ax, ax                      
  {19DED}  mov      word ptr [0x1e8], ax        
  {19DF0}  mov      di, 0x564                   
  {19DF3}  push     ds                          
  {19DF4}  push     di                          
  {19DF5}  mov      di, 0x6f7d                  
  {19DF8}  push     cs                          
  {19DF9}  push     di                          
  {19DFA}  lcall    0x1c71, 0x9d7               
  {19DFF}  jne      0x19e13                     
  {19E01}  mov      ax, word ptr [0x1d6]        
  {19E04}  cmp      ax, word ptr [0x1ea]        
  {19E08}  jne      0x19e13                     
  {19E0A}  push     cs                          
  {19E0B}  call     0x13947                     
  {19E0E}  xor      ax, ax                      
  {19E10}  mov      word ptr [0x1ea], ax        
  {19E13}  mov      di, 0x564                   
  {19E16}  push     ds                          
  {19E17}  push     di                          
  {19E18}  mov      di, 0x6f88                  
  {19E1B}  push     cs                          
  {19E1C}  push     di                          
  {19E1D}  lcall    0x1c71, 0x9d7               
  {19E22}  jne      0x19e52                     
  {19E24}  mov      ax, word ptr [0x1d6]        
  {19E27}  cmp      ax, word ptr [0x1f4]        
  {19E2B}  jne      0x19e52                     
  {19E2D}  mov      di, 0x7a2                   
  {19E30}  push     ds                          
  {19E31}  push     di                          
  {19E32}  mov      di, 0x6f96                  
  {19E35}  push     cs                          
  {19E36}  push     di                          
  {19E37}  xor      ax, ax                      
  {19E39}  push     ax                          
  {19E3A}  lcall    0x1c71, 0x701               
  {19E3F}  lcall    0x1c71, 0x5dd               
  {19E44}  lcall    0x1c71, 0x291               
  {19E49}  push     cs                          
  {19E4A}  call     0x13947                     
  {19E4D}  xor      ax, ax                      
  {19E4F}  mov      word ptr [0x1f4], ax        
  {19E52}  mov      di, 0x564                   
  {19E55}  push     ds                          
  {19E56}  push     di                          
  {19E57}  mov      di, 0x6fbc                  
  {19E5A}  push     cs                          
  {19E5B}  push     di                          
  {19E5C}  lcall    0x1c71, 0x9d7               
  {19E61}  jne      0x19e75                     
  {19E63}  mov      ax, word ptr [0x1d6]        
  {19E66}  cmp      ax, word ptr [0x1ec]        
  {19E6A}  jne      0x19e75                     
  {19E6C}  push     cs                          
  {19E6D}  call     0x13947                     
  {19E70}  xor      ax, ax                      
  {19E72}  mov      word ptr [0x1ec], ax        
  {19E75}  mov      di, 0x564                   
  {19E78}  push     ds                          
  {19E79}  push     di                          
  {19E7A}  mov      di, 0x6fc9                  
  {19E7D}  push     cs                          
  {19E7E}  push     di                          
  {19E7F}  lcall    0x1c71, 0x9d7               
  {19E84}  jne      0x19e98                     
  {19E86}  mov      ax, word ptr [0x1d6]        
  {19E89}  cmp      ax, word ptr [0x1ee]        
  {19E8D}  jne      0x19e98                     
  {19E8F}  push     cs                          
  {19E90}  call     0x13947                     
  {19E93}  xor      ax, ax                      
  {19E95}  mov      word ptr [0x1ee], ax        
  {19E98}  mov      di, 0x564                   
  {19E9B}  push     ds                          
  {19E9C}  push     di                          
  {19E9D}  mov      di, 0x6fd3                  
  {19EA0}  push     cs                          
  {19EA1}  push     di                          
  {19EA2}  lcall    0x1c71, 0x9d7               
  {19EA7}  jne      0x19ebb                     
  {19EA9}  mov      ax, word ptr [0x1d6]        
  {19EAC}  cmp      ax, word ptr [0x1f0]        
  {19EB0}  jne      0x19ebb                     
  {19EB2}  push     cs                          
  {19EB3}  call     0x13947                     
  {19EB6}  xor      ax, ax                      
  {19EB8}  mov      word ptr [0x1f0], ax        
  {19EBB}  mov      di, 0x564                   
  {19EBE}  push     ds                          
  {19EBF}  push     di                          
  {19EC0}  mov      di, 0x6fe3                  
  {19EC3}  push     cs                          
  {19EC4}  push     di                          
  {19EC5}  lcall    0x1c71, 0x9d7               
  {19ECA}  jne      0x19ede                     
  {19ECC}  mov      ax, word ptr [0x1d6]        
  {19ECF}  cmp      ax, word ptr [0x1f2]        
  {19ED3}  jne      0x19ede                     
  {19ED5}  push     cs                          
  {19ED6}  call     0x13947                     
  {19ED9}  xor      ax, ax                      
  {19EDB}  mov      word ptr [0x1f2], ax        
  {19EDE}  mov      di, 0x564                   
  {19EE1}  push     ds                          
  {19EE2}  push     di                          
  {19EE3}  mov      di, 0x6fef                  
  {19EE6}  push     cs                          
  {19EE7}  push     di                          
  {19EE8}  lcall    0x1c71, 0x9d7               
  {19EED}  jne      0x19f01                     
  {19EEF}  mov      ax, word ptr [0x1d6]        
  {19EF2}  cmp      ax, word ptr [0x1f6]        
  {19EF6}  jne      0x19f01                     
  {19EF8}  push     cs                          
  {19EF9}  call     0x13947                     
  {19EFC}  xor      ax, ax                      
  {19EFE}  mov      word ptr [0x1f6], ax        
  {19F01}  mov      di, 0x564                   
  {19F04}  push     ds                          
  {19F05}  push     di                          
  {19F06}  mov      di, 0x6ffb                  
  {19F09}  push     cs                          
  {19F0A}  push     di                          
  {19F0B}  lcall    0x1c71, 0x9d7               
  {19F10}  jne      0x19f24                     
  {19F12}  mov      ax, word ptr [0x1d6]        
  {19F15}  cmp      ax, word ptr [0x1f8]        
  {19F19}  jne      0x19f24                     
  {19F1B}  push     cs                          
  {19F1C}  call     0x13947                     
  {19F1F}  xor      ax, ax                      
  {19F21}  mov      word ptr [0x1f8], ax        
  {19F24}  mov      di, 0x564                   
  {19F27}  push     ds                          
  {19F28}  push     di                          
  {19F29}  mov      di, 0x7007                  
  {19F2C}  push     cs                          
  {19F2D}  push     di                          
  {19F2E}  lcall    0x1c71, 0x9d7               
  {19F33}  jne      0x19f47                     
  {19F35}  mov      ax, word ptr [0x1d6]        
  {19F38}  cmp      ax, word ptr [0x1fa]        
  {19F3C}  jne      0x19f47                     
  {19F3E}  push     cs                          
  {19F3F}  call     0x13a60                     
  {19F42}  xor      ax, ax                      
  {19F44}  mov      word ptr [0x1fa], ax        
  {19F47}  mov      di, 0x564                   
  {19F4A}  push     ds                          
  {19F4B}  push     di                          
  {19F4C}  mov      di, 0x7012                  
  {19F4F}  push     cs                          
  {19F50}  push     di                          
  {19F51}  lcall    0x1c71, 0x9d7               
  {19F56}  jne      0x19f6a                     
  {19F58}  mov      ax, word ptr [0x1d6]        
  {19F5B}  cmp      ax, word ptr [0x1fc]        
  {19F5F}  jne      0x19f6a                     
  {19F61}  push     cs                          
  {19F62}  call     0x13a60                     
  {19F65}  xor      ax, ax                      
  {19F67}  mov      word ptr [0x1fc], ax        
  {19F6A}  mov      di, 0x564                   
  {19F6D}  push     ds                          
  {19F6E}  push     di                          
  {19F6F}  mov      di, 0x701c                  
  {19F72}  push     cs                          
  {19F73}  push     di                          
  {19F74}  lcall    0x1c71, 0x9d7               
  {19F79}  jne      0x19f8d                     
  {19F7B}  mov      ax, word ptr [0x1d6]        
  {19F7E}  cmp      ax, word ptr [0x1fe]        
  {19F82}  jne      0x19f8d                     
  {19F84}  push     cs                          
  {19F85}  call     0x13a60                     
  {19F88}  xor      ax, ax                      
  {19F8A}  mov      word ptr [0x1fe], ax        
  {19F8D}  mov      di, 0x564                   
  {19F90}  push     ds                          
  {19F91}  push     di                          
  {19F92}  mov      di, 0x7029                  
  {19F95}  push     cs                          
  {19F96}  push     di                          
  {19F97}  lcall    0x1c71, 0x9d7               
  {19F9C}  jne      0x19fb0                     
  {19F9E}  mov      ax, word ptr [0x1d6]        
  {19FA1}  cmp      ax, word ptr [0x206]        
  {19FA5}  jne      0x19fb0                     
  {19FA7}  push     cs                          
  {19FA8}  call     0x13a60                     
  {19FAB}  xor      ax, ax                      
  {19FAD}  mov      word ptr [0x206], ax        
  {19FB0}  mov      di, 0x564                   
  {19FB3}  push     ds                          
  {19FB4}  push     di                          
  {19FB5}  mov      di, 0x7034                  
  {19FB8}  push     cs                          
  {19FB9}  push     di                          
  {19FBA}  lcall    0x1c71, 0x9d7               
  {19FBF}  jne      0x19fd3                     
  {19FC1}  mov      ax, word ptr [0x1d6]        
  {19FC4}  cmp      ax, word ptr [0x200]        
  {19FC8}  jne      0x19fd3                     
  {19FCA}  push     cs                          
  {19FCB}  call     0x13a60                     
  {19FCE}  xor      ax, ax                      
  {19FD0}  mov      word ptr [0x200], ax        
  {19FD3}  mov      di, 0x564                   
  {19FD6}  push     ds                          
  {19FD7}  push     di                          
  {19FD8}  mov      di, 0x7043                  
  {19FDB}  push     cs                          
  {19FDC}  push     di                          
  {19FDD}  lcall    0x1c71, 0x9d7               
  {19FE2}  jne      0x19ff6                     
  {19FE4}  mov      ax, word ptr [0x1d6]        
  {19FE7}  cmp      ax, word ptr [0x202]        
  {19FEB}  jne      0x19ff6                     
  {19FED}  push     cs                          
  {19FEE}  call     0x13a60                     
  {19FF1}  xor      ax, ax                      
  {19FF3}  mov      word ptr [0x202], ax        
  {19FF6}  mov      di, 0x564                   
  {19FF9}  push     ds                          
  {19FFA}  push     di                          
  {19FFB}  mov      di, 0x704f                  
  {19FFE}  push     cs                          
  {19FFF}  push     di                          
  {1A000}  lcall    0x1c71, 0x9d7               
  {1A005}  jne      0x1a019                     
  {1A007}  mov      ax, word ptr [0x1d6]        
  {1A00A}  cmp      ax, word ptr [0x204]        
  {1A00E}  jne      0x1a019                     
  {1A010}  push     cs                          
  {1A011}  call     0x13a60                     
  {1A014}  xor      ax, ax                      
  {1A016}  mov      word ptr [0x204], ax        
  {1A019}  mov      di, 0x564                   
  {1A01C}  push     ds                          
  {1A01D}  push     di                          
  {1A01E}  mov      di, 0x7059                  
  {1A021}  push     cs                          
  {1A022}  push     di                          
  {1A023}  lcall    0x1c71, 0x9d7               
  {1A028}  jne      0x1a03c                     
  {1A02A}  mov      ax, word ptr [0x1d6]        
  {1A02D}  cmp      ax, word ptr [0x208]        
  {1A031}  jne      0x1a03c                     
  {1A033}  push     cs                          
  {1A034}  call     0x13a60                     
  {1A037}  xor      ax, ax                      
  {1A039}  mov      word ptr [0x208], ax        
  {1A03C}  mov      di, 0x564                   
  {1A03F}  push     ds                          
  {1A040}  push     di                          
  {1A041}  mov      di, 0x7065                  
  {1A044}  push     cs                          
  {1A045}  push     di                          
  {1A046}  lcall    0x1c71, 0x9d7               
  {1A04B}  jne      0x1a05f                     
  {1A04D}  mov      ax, word ptr [0x1d6]        
  {1A050}  cmp      ax, word ptr [0x20a]        
  {1A054}  jne      0x1a05f                     
  {1A056}  push     cs                          
  {1A057}  call     0x13a60                     
  {1A05A}  xor      ax, ax                      
  {1A05C}  mov      word ptr [0x20a], ax        
  {1A05F}  mov      di, 0x564                   
  {1A062}  push     ds                          
  {1A063}  push     di                          
  {1A064}  mov      di, 0x7073                  
  {1A067}  push     cs                          
  {1A068}  push     di                          
  {1A069}  lcall    0x1c71, 0x9d7               
  {1A06E}  jne      0x1a086                     
  {1A070}  mov      ax, word ptr [0x1d6]        
  {1A073}  cmp      ax, word ptr [0x20c]        
  {1A077}  jne      0x1a086                     
  {1A079}  push     cs                          
  {1A07A}  call     0x13b82                     
  {1A07D}  xor      ax, ax                      
  {1A07F}  mov      word ptr [0x20c], ax        
  {1A082}  push     cs                          
  {1A083}  call     0x1586e                     
  {1A086}  mov      di, 0x564                   
  {1A089}  push     ds                          
  {1A08A}  push     di                          
  {1A08B}  mov      di, 0x7083                  
  {1A08E}  push     cs                          
  {1A08F}  push     di                          
  {1A090}  lcall    0x1c71, 0x9d7               
  {1A095}  jne      0x1a0ad                     
  {1A097}  mov      ax, word ptr [0x1d6]        
  {1A09A}  cmp      ax, word ptr [0x20e]        
  {1A09E}  jne      0x1a0ad                     
  {1A0A0}  push     cs                          
  {1A0A1}  call     0x13b82                     
  {1A0A4}  xor      ax, ax                      
  {1A0A6}  mov      word ptr [0x20e], ax        
  {1A0A9}  push     cs                          
  {1A0AA}  call     0x1586e                     
  {1A0AD}  mov      di, 0x564                   
  {1A0B0}  push     ds                          
  {1A0B1}  push     di                          
  {1A0B2}  mov      di, 0x7092                  
  {1A0B5}  push     cs                          
  {1A0B6}  push     di                          
  {1A0B7}  lcall    0x1c71, 0x9d7               
  {1A0BC}  jne      0x1a0d4                     
  {1A0BE}  mov      ax, word ptr [0x1d6]        
  {1A0C1}  cmp      ax, word ptr [0x210]        
  {1A0C5}  jne      0x1a0d4                     
  {1A0C7}  push     cs                          
  {1A0C8}  call     0x13b82                     
  {1A0CB}  xor      ax, ax                      
  {1A0CD}  mov      word ptr [0x210], ax        
  {1A0D0}  push     cs                          
  {1A0D1}  call     0x157b9                     
  {1A0D4}  mov      di, 0x564                   
  {1A0D7}  push     ds                          
  {1A0D8}  push     di                          
  {1A0D9}  mov      di, 0x709f                  
  {1A0DC}  push     cs                          
  {1A0DD}  push     di                          
  {1A0DE}  lcall    0x1c71, 0x9d7               
  {1A0E3}  je       0x1a0e8                     
  {1A0E5}  jmp      0x1a5c5                     
  {1A0E8}  cmp      word ptr [0x1d6], 0x21      
  {1A0ED}  je       0x1a0f2                     
  {1A0EF}  jmp      0x1a17e                     
  {1A0F2}  mov      di, 0x7a2                   
  {1A0F5}  push     ds                          
  {1A0F6}  push     di                          
  {1A0F7}  mov      di, 0x70a4                  
  {1A0FA}  push     cs                          
  {1A0FB}  push     di                          
  {1A0FC}  xor      ax, ax                      
  {1A0FE}  push     ax                          
  {1A0FF}  lcall    0x1c71, 0x701               
  {1A104}  lcall    0x1c71, 0x5dd               
  {1A109}  lcall    0x1c71, 0x291               
  {1A10E}  mov      di, 0x7a2                   
  {1A111}  push     ds                          
  {1A112}  push     di                          
  {1A113}  mov      di, 0x70b6                  
  {1A116}  push     cs                          
  {1A117}  push     di                          
  {1A118}  xor      ax, ax                      
  {1A11A}  push     ax                          
  {1A11B}  lcall    0x1c71, 0x701               
  {1A120}  lcall    0x1c71, 0x5dd               
  {1A125}  lcall    0x1c71, 0x291               
  {1A12A}  mov      di, 0x7a2                   
  {1A12D}  push     ds                          
  {1A12E}  push     di                          
  {1A12F}  mov      di, 0x70d0                  
  {1A132}  push     cs                          
  {1A133}  push     di                          
  {1A134}  xor      ax, ax                      
  {1A136}  push     ax                          
  {1A137}  lcall    0x1c71, 0x701               
  {1A13C}  lcall    0x1c71, 0x5dd               
  {1A141}  lcall    0x1c71, 0x291               
  {1A146}  mov      di, 0x7a2                   
  {1A149}  push     ds                          
  {1A14A}  push     di                          
  {1A14B}  mov      di, 0x70dd                  
  {1A14E}  push     cs                          
  {1A14F}  push     di                          
  {1A150}  xor      ax, ax                      
  {1A152}  push     ax                          
  {1A153}  lcall    0x1c71, 0x701               
  {1A158}  lcall    0x1c71, 0x5dd               
  {1A15D}  lcall    0x1c71, 0x291               
  {1A162}  mov      di, 0x7a2                   
  {1A165}  push     ds                          
  {1A166}  push     di                          
  {1A167}  mov      di, 0x70ea                  
  {1A16A}  push     cs                          
  {1A16B}  push     di                          
  {1A16C}  xor      ax, ax                      
  {1A16E}  push     ax                          
  {1A16F}  lcall    0x1c71, 0x701               
  {1A174}  lcall    0x1c71, 0x5dd               
  {1A179}  lcall    0x1c71, 0x291               
  {1A17E}  cmp      word ptr [0x1d6], 0x22      
  {1A183}  je       0x1a1c0                     
  {1A185}  cmp      word ptr [0x1d6], 0x25      
  {1A18A}  je       0x1a1c0                     
  {1A18C}  cmp      word ptr [0x1d6], 0x26      
  {1A191}  je       0x1a1c0                     
  {1A193}  cmp      word ptr [0x1d6], 0x27      
  {1A198}  je       0x1a1c0                     
  {1A19A}  cmp      word ptr [0x1d6], 0x2a      
  {1A19F}  je       0x1a1c0                     
  {1A1A1}  cmp      word ptr [0x1d6], 0x2b      
  {1A1A6}  je       0x1a1c0                     
  {1A1A8}  cmp      word ptr [0x1d6], 0x2c      
  {1A1AD}  je       0x1a1c0                     
  {1A1AF}  cmp      word ptr [0x1d6], 0x30      
  {1A1B4}  je       0x1a1c0                     
  {1A1B6}  cmp      word ptr [0x1d6], 0x31      
  {1A1BB}  je       0x1a1c0                     
  {1A1BD}  jmp      0x1a24c                     
  {1A1C0}  mov      di, 0x7a2                   
  {1A1C3}  push     ds                          
  {1A1C4}  push     di                          
  {1A1C5}  mov      di, 0x70a4                  
  {1A1C8}  push     cs                          
  {1A1C9}  push     di                          
  {1A1CA}  xor      ax, ax                      
  {1A1CC}  push     ax                          
  {1A1CD}  lcall    0x1c71, 0x701               
  {1A1D2}  lcall    0x1c71, 0x5dd               
  {1A1D7}  lcall    0x1c71, 0x291               
  {1A1DC}  mov      di, 0x7a2                   
  {1A1DF}  push     ds                          
  {1A1E0}  push     di                          
  {1A1E1}  mov      di, 0x70f7                  
  {1A1E4}  push     cs                          
  {1A1E5}  push     di                          
  {1A1E6}  xor      ax, ax                      
  {1A1E8}  push     ax                          
  {1A1E9}  lcall    0x1c71, 0x701               
  {1A1EE}  lcall    0x1c71, 0x5dd               
  {1A1F3}  lcall    0x1c71, 0x291               
  {1A1F8}  mov      di, 0x7a2                   
  {1A1FB}  push     ds                          
  {1A1FC}  push     di                          
  {1A1FD}  mov      di, 0x70d0                  
  {1A200}  push     cs                          
  {1A201}  push     di                          
  {1A202}  xor      ax, ax                      
  {1A204}  push     ax                          
  {1A205}  lcall    0x1c71, 0x701               
  {1A20A}  lcall    0x1c71, 0x5dd               
  {1A20F}  lcall    0x1c71, 0x291               
  {1A214}  mov      di, 0x7a2                   
  {1A217}  push     ds                          
  {1A218}  push     di                          
  {1A219}  mov      di, 0x70dd                  
  {1A21C}  push     cs                          
  {1A21D}  push     di                          
  {1A21E}  xor      ax, ax                      
  {1A220}  push     ax                          
  {1A221}  lcall    0x1c71, 0x701               
  {1A226}  lcall    0x1c71, 0x5dd               
  {1A22B}  lcall    0x1c71, 0x291               
  {1A230}  mov      di, 0x7a2                   
  {1A233}  push     ds                          
  {1A234}  push     di                          
  {1A235}  mov      di, 0x70ea                  
  {1A238}  push     cs                          
  {1A239}  push     di                          
  {1A23A}  xor      ax, ax                      
  {1A23C}  push     ax                          
  {1A23D}  lcall    0x1c71, 0x701               
  {1A242}  lcall    0x1c71, 0x5dd               
  {1A247}  lcall    0x1c71, 0x291               
  {1A24C}  cmp      word ptr [0x1d6], 0x23      
  {1A251}  je       0x1a25a                     
  {1A253}  cmp      word ptr [0x1d6], 0x24      
  {1A258}  jne      0x1a2ca                     
  {1A25A}  mov      di, 0x7a2                   
  {1A25D}  push     ds                          
  {1A25E}  push     di                          
  {1A25F}  mov      di, 0x70a4                  
  {1A262}  push     cs                          
  {1A263}  push     di                          
  {1A264}  xor      ax, ax                      
  {1A266}  push     ax                          
  {1A267}  lcall    0x1c71, 0x701               
  {1A26C}  lcall    0x1c71, 0x5dd               
  {1A271}  lcall    0x1c71, 0x291               
  {1A276}  mov      di, 0x7a2                   
  {1A279}  push     ds                          
  {1A27A}  push     di                          
  {1A27B}  mov      di, 0x70d0                  
  {1A27E}  push     cs                          
  {1A27F}  push     di                          
  {1A280}  xor      ax, ax                      
  {1A282}  push     ax                          
  {1A283}  lcall    0x1c71, 0x701               
  {1A288}  lcall    0x1c71, 0x5dd               
  {1A28D}  lcall    0x1c71, 0x291               
  {1A292}  mov      di, 0x7a2                   
  {1A295}  push     ds                          
  {1A296}  push     di                          
  {1A297}  mov      di, 0x70dd                  
  {1A29A}  push     cs                          
  {1A29B}  push     di                          
  {1A29C}  xor      ax, ax                      
  {1A29E}  push     ax                          
  {1A29F}  lcall    0x1c71, 0x701               
  {1A2A4}  lcall    0x1c71, 0x5dd               
  {1A2A9}  lcall    0x1c71, 0x291               
  {1A2AE}  mov      di, 0x7a2                   
  {1A2B1}  push     ds                          
  {1A2B2}  push     di                          
  {1A2B3}  mov      di, 0x70ea                  
  {1A2B6}  push     cs                          
  {1A2B7}  push     di                          
  {1A2B8}  xor      ax, ax                      
  {1A2BA}  push     ax                          
  {1A2BB}  lcall    0x1c71, 0x701               
  {1A2C0}  lcall    0x1c71, 0x5dd               
  {1A2C5}  lcall    0x1c71, 0x291               
  {1A2CA}  cmp      word ptr [0x1d6], 0x28      
  {1A2CF}  jne      0x1a325                     
  {1A2D1}  mov      di, 0x7a2                   
  {1A2D4}  push     ds                          
  {1A2D5}  push     di                          
  {1A2D6}  mov      di, 0x70a4                  
  {1A2D9}  push     cs                          
  {1A2DA}  push     di                          
  {1A2DB}  xor      ax, ax                      
  {1A2DD}  push     ax                          
  {1A2DE}  lcall    0x1c71, 0x701               
  {1A2E3}  lcall    0x1c71, 0x5dd               
  {1A2E8}  lcall    0x1c71, 0x291               
  {1A2ED}  mov      di, 0x7a2                   
  {1A2F0}  push     ds                          
  {1A2F1}  push     di                          
  {1A2F2}  mov      di, 0x70d0                  
  {1A2F5}  push     cs                          
  {1A2F6}  push     di                          
  {1A2F7}  xor      ax, ax                      
  {1A2F9}  push     ax                          
  {1A2FA}  lcall    0x1c71, 0x701               
  {1A2FF}  lcall    0x1c71, 0x5dd               
  {1A304}  lcall    0x1c71, 0x291               
  {1A309}  mov      di, 0x7a2                   
  {1A30C}  push     ds                          
  {1A30D}  push     di                          
  {1A30E}  mov      di, 0x70ea                  
  {1A311}  push     cs                          
  {1A312}  push     di                          
  {1A313}  xor      ax, ax                      
  {1A315}  push     ax                          
  {1A316}  lcall    0x1c71, 0x701               
  {1A31B}  lcall    0x1c71, 0x5dd               
  {1A320}  lcall    0x1c71, 0x291               
  {1A325}  cmp      word ptr [0x1d6], 0x29      
  {1A32A}  jne      0x1a380                     
  {1A32C}  mov      di, 0x7a2                   
  {1A32F}  push     ds                          
  {1A330}  push     di                          
  {1A331}  mov      di, 0x70a4                  
  {1A334}  push     cs                          
  {1A335}  push     di                          
  {1A336}  xor      ax, ax                      
  {1A338}  push     ax                          
  {1A339}  lcall    0x1c71, 0x701               
  {1A33E}  lcall    0x1c71, 0x5dd               
  {1A343}  lcall    0x1c71, 0x291               
  {1A348}  mov      di, 0x7a2                   
  {1A34B}  push     ds                          
  {1A34C}  push     di                          
  {1A34D}  mov      di, 0x70d0                  
  {1A350}  push     cs                          
  {1A351}  push     di                          
  {1A352}  xor      ax, ax                      
  {1A354}  push     ax                          
  {1A355}  lcall    0x1c71, 0x701               
  {1A35A}  lcall    0x1c71, 0x5dd               
  {1A35F}  lcall    0x1c71, 0x291               
  {1A364}  mov      di, 0x7a2                   
  {1A367}  push     ds                          
  {1A368}  push     di                          
  {1A369}  mov      di, 0x70dd                  
  {1A36C}  push     cs                          
  {1A36D}  push     di                          
  {1A36E}  xor      ax, ax                      
  {1A370}  push     ax                          
  {1A371}  lcall    0x1c71, 0x701               
  {1A376}  lcall    0x1c71, 0x5dd               
  {1A37B}  lcall    0x1c71, 0x291               
  {1A380}  cmp      word ptr [0x1d6], 0x2d      
  {1A385}  je       0x1a395                     
  {1A387}  cmp      word ptr [0x1d6], 0x32      
  {1A38C}  je       0x1a395                     
  {1A38E}  cmp      word ptr [0x1d6], 0x36      
  {1A393}  jne      0x1a405                     
  {1A395}  mov      di, 0x7a2                   
  {1A398}  push     ds                          
  {1A399}  push     di                          
  {1A39A}  mov      di, 0x7106                  
  {1A39D}  push     cs                          
  {1A39E}  push     di                          
  {1A39F}  xor      ax, ax                      
  {1A3A1}  push     ax                          
  {1A3A2}  lcall    0x1c71, 0x701               
  {1A3A7}  lcall    0x1c71, 0x5dd               
  {1A3AC}  lcall    0x1c71, 0x291               
  {1A3B1}  mov      di, 0x7a2                   
  {1A3B4}  push     ds                          
  {1A3B5}  push     di                          
  {1A3B6}  mov      di, 0x70d0                  
  {1A3B9}  push     cs                          
  {1A3BA}  push     di                          
  {1A3BB}  xor      ax, ax                      
  {1A3BD}  push     ax                          
  {1A3BE}  lcall    0x1c71, 0x701               
  {1A3C3}  lcall    0x1c71, 0x5dd               
  {1A3C8}  lcall    0x1c71, 0x291               
  {1A3CD}  mov      di, 0x7a2                   
  {1A3D0}  push     ds                          
  {1A3D1}  push     di                          
  {1A3D2}  mov      di, 0x70f7                  
  {1A3D5}  push     cs                          
  {1A3D6}  push     di                          
  {1A3D7}  xor      ax, ax                      
  {1A3D9}  push     ax                          
  {1A3DA}  lcall    0x1c71, 0x701               
  {1A3DF}  lcall    0x1c71, 0x5dd               
  {1A3E4}  lcall    0x1c71, 0x291               
  {1A3E9}  mov      di, 0x7a2                   
  {1A3EC}  push     ds                          
  {1A3ED}  push     di                          
  {1A3EE}  mov      di, 0x70ea                  
  {1A3F1}  push     cs                          
  {1A3F2}  push     di                          
  {1A3F3}  xor      ax, ax                      
  {1A3F5}  push     ax                          
  {1A3F6}  lcall    0x1c71, 0x701               
  {1A3FB}  lcall    0x1c71, 0x5dd               
  {1A400}  lcall    0x1c71, 0x291               
  {1A405}  cmp      word ptr [0x1d6], 0x2e      
  {1A40A}  je       0x1a41a                     
  {1A40C}  cmp      word ptr [0x1d6], 0x33      
  {1A411}  je       0x1a41a                     
  {1A413}  cmp      word ptr [0x1d6], 0x37      
  {1A418}  jne      0x1a48a                     
  {1A41A}  mov      di, 0x7a2                   
  {1A41D}  push     ds                          
  {1A41E}  push     di                          
  {1A41F}  mov      di, 0x7106                  
  {1A422}  push     cs                          
  {1A423}  push     di                          
  {1A424}  xor      ax, ax                      
  {1A426}  push     ax                          
  {1A427}  lcall    0x1c71, 0x701               
  {1A42C}  lcall    0x1c71, 0x5dd               
  {1A431}  lcall    0x1c71, 0x291               
  {1A436}  mov      di, 0x7a2                   
  {1A439}  push     ds                          
  {1A43A}  push     di                          
  {1A43B}  mov      di, 0x70d0                  
  {1A43E}  push     cs                          
  {1A43F}  push     di                          
  {1A440}  xor      ax, ax                      
  {1A442}  push     ax                          
  {1A443}  lcall    0x1c71, 0x701               
  {1A448}  lcall    0x1c71, 0x5dd               
  {1A44D}  lcall    0x1c71, 0x291               
  {1A452}  mov      di, 0x7a2                   
  {1A455}  push     ds                          
  {1A456}  push     di                          
  {1A457}  mov      di, 0x70f7                  
  {1A45A}  push     cs                          
  {1A45B}  push     di                          
  {1A45C}  xor      ax, ax                      
  {1A45E}  push     ax                          
  {1A45F}  lcall    0x1c71, 0x701               
  {1A464}  lcall    0x1c71, 0x5dd               
  {1A469}  lcall    0x1c71, 0x291               
  {1A46E}  mov      di, 0x7a2                   
  {1A471}  push     ds                          
  {1A472}  push     di                          
  {1A473}  mov      di, 0x70dd                  
  {1A476}  push     cs                          
  {1A477}  push     di                          
  {1A478}  xor      ax, ax                      
  {1A47A}  push     ax                          
  {1A47B}  lcall    0x1c71, 0x701               
  {1A480}  lcall    0x1c71, 0x5dd               
  {1A485}  lcall    0x1c71, 0x291               
  {1A48A}  cmp      word ptr [0x1d6], 0x2f      
  {1A48F}  je       0x1a49f                     
  {1A491}  cmp      word ptr [0x1d6], 0x34      
  {1A496}  je       0x1a49f                     
  {1A498}  cmp      word ptr [0x1d6], 0x35      
  {1A49D}  jne      0x1a50f                     
  {1A49F}  mov      di, 0x7a2                   
  {1A4A2}  push     ds                          
  {1A4A3}  push     di                          
  {1A4A4}  mov      di, 0x7118                  
  {1A4A7}  push     cs                          
  {1A4A8}  push     di                          
  {1A4A9}  xor      ax, ax                      
  {1A4AB}  push     ax                          
  {1A4AC}  lcall    0x1c71, 0x701               
  {1A4B1}  lcall    0x1c71, 0x5dd               
  {1A4B6}  lcall    0x1c71, 0x291               
  {1A4BB}  mov      di, 0x7a2                   
  {1A4BE}  push     ds                          
  {1A4BF}  push     di                          
  {1A4C0}  mov      di, 0x70f7                  
  {1A4C3}  push     cs                          
  {1A4C4}  push     di                          
  {1A4C5}  xor      ax, ax                      
  {1A4C7}  push     ax                          
  {1A4C8}  lcall    0x1c71, 0x701               
  {1A4CD}  lcall    0x1c71, 0x5dd               
  {1A4D2}  lcall    0x1c71, 0x291               
  {1A4D7}  mov      di, 0x7a2                   
  {1A4DA}  push     ds                          
  {1A4DB}  push     di                          
  {1A4DC}  mov      di, 0x70dd                  
  {1A4DF}  push     cs                          
  {1A4E0}  push     di                          
  {1A4E1}  xor      ax, ax                      
  {1A4E3}  push     ax                          
  {1A4E4}  lcall    0x1c71, 0x701               
  {1A4E9}  lcall    0x1c71, 0x5dd               
  {1A4EE}  lcall    0x1c71, 0x291               
  {1A4F3}  mov      di, 0x7a2                   
  {1A4F6}  push     ds                          
  {1A4F7}  push     di                          
  {1A4F8}  mov      di, 0x70ea                  
  {1A4FB}  push     cs                          
  {1A4FC}  push     di                          
  {1A4FD}  xor      ax, ax                      
  {1A4FF}  push     ax                          
  {1A500}  lcall    0x1c71, 0x701               
  {1A505}  lcall    0x1c71, 0x5dd               
  {1A50A}  lcall    0x1c71, 0x291               
  {1A50F}  cmp      word ptr [0x1d6], 0x38      
  {1A514}  jne      0x1a56a                     
  {1A516}  mov      di, 0x7a2                   
  {1A519}  push     ds                          
  {1A51A}  push     di                          
  {1A51B}  mov      di, 0x7128                  
  {1A51E}  push     cs                          
  {1A51F}  push     di                          
  {1A520}  xor      ax, ax                      
  {1A522}  push     ax                          
  {1A523}  lcall    0x1c71, 0x701               
  {1A528}  lcall    0x1c71, 0x5dd               
  {1A52D}  lcall    0x1c71, 0x291               
  {1A532}  mov      di, 0x7a2                   
  {1A535}  push     ds                          
  {1A536}  push     di                          
  {1A537}  mov      di, 0x70f7                  
  {1A53A}  push     cs                          
  {1A53B}  push     di                          
  {1A53C}  xor      ax, ax                      
  {1A53E}  push     ax                          
  {1A53F}  lcall    0x1c71, 0x701               
  {1A544}  lcall    0x1c71, 0x5dd               
  {1A549}  lcall    0x1c71, 0x291               
  {1A54E}  mov      di, 0x7a2                   
  {1A551}  push     ds                          
  {1A552}  push     di                          
  {1A553}  mov      di, 0x70ea                  
  {1A556}  push     cs                          
  {1A557}  push     di                          
  {1A558}  xor      ax, ax                      
  {1A55A}  push     ax                          
  {1A55B}  lcall    0x1c71, 0x701               
  {1A560}  lcall    0x1c71, 0x5dd               
  {1A565}  lcall    0x1c71, 0x291               
  {1A56A}  cmp      word ptr [0x1d6], 0x39      
  {1A56F}  jne      0x1a5c5                     
  {1A571}  mov      di, 0x7a2                   
  {1A574}  push     ds                          
  {1A575}  push     di                          
  {1A576}  mov      di, 0x7128                  
  {1A579}  push     cs                          
  {1A57A}  push     di                          
  {1A57B}  xor      ax, ax                      
  {1A57D}  push     ax                          
  {1A57E}  lcall    0x1c71, 0x701               
  {1A583}  lcall    0x1c71, 0x5dd               
  {1A588}  lcall    0x1c71, 0x291               
  {1A58D}  mov      di, 0x7a2                   
  {1A590}  push     ds                          
  {1A591}  push     di                          
  {1A592}  mov      di, 0x70f7                  
  {1A595}  push     cs                          
  {1A596}  push     di                          
  {1A597}  xor      ax, ax                      
  {1A599}  push     ax                          
  {1A59A}  lcall    0x1c71, 0x701               
  {1A59F}  lcall    0x1c71, 0x5dd               
  {1A5A4}  lcall    0x1c71, 0x291               
  {1A5A9}  mov      di, 0x7a2                   
  {1A5AC}  push     ds                          
  {1A5AD}  push     di                          
  {1A5AE}  mov      di, 0x70dd                  
  {1A5B1}  push     cs                          
  {1A5B2}  push     di                          
  {1A5B3}  xor      ax, ax                      
  {1A5B5}  push     ax                          
  {1A5B6}  lcall    0x1c71, 0x701               
  {1A5BB}  lcall    0x1c71, 0x5dd               
  {1A5C0}  lcall    0x1c71, 0x291               
  {1A5C5}  mov      di, 0x564                   
  {1A5C8}  push     ds                          
  {1A5C9}  push     di                          
  {1A5CA}  mov      di, 0x713a                  
  {1A5CD}  push     cs                          
  {1A5CE}  push     di                          
  {1A5CF}  lcall    0x1c71, 0x9d7               
  {1A5D4}  jne      0x1a5d9                     
  {1A5D6}  jmp      0x1af1e                     
  {1A5D9}  mov      di, 0x564                   
  {1A5DC}  push     ds                          
  {1A5DD}  push     di                          
  {1A5DE}  mov      di, 0x7142                  
  {1A5E1}  push     cs                          
  {1A5E2}  push     di                          
  {1A5E3}  lcall    0x1c71, 0x9d7               
  {1A5E8}  je       0x1a5ed                     
  {1A5EA}  jmp      0x1a725                     
  {1A5ED}  xor      ax, ax                      
  {1A5EF}  mov      word ptr [0x1d8], ax        
  {1A5F2}  cmp      word ptr [0x1d6], 0x21      
  {1A5F7}  jne      0x1a5ff                     
  {1A5F9}  mov      word ptr [0x1d6], 0x20      
  {1A5FF}  cmp      word ptr [0x1d6], 0x22      
  {1A604}  jne      0x1a60c                     
  {1A606}  mov      word ptr [0x1d6], 0x21      
  {1A60C}  cmp      word ptr [0x1d6], 0x23      
  {1A611}  je       0x1a628                     
  {1A613}  cmp      word ptr [0x1d6], 0x24      
  {1A618}  je       0x1a628                     
  {1A61A}  cmp      word ptr [0x1d6], 0x28      
  {1A61F}  je       0x1a628                     
  {1A621}  cmp      word ptr [0x1d6], 0x29      
  {1A626}  jne      0x1a62e                     
  {1A628}  mov      word ptr [0x1d8], 1         
  {1A62E}  cmp      word ptr [0x1d6], 0x25      
  {1A633}  jne      0x1a63b                     
  {1A635}  mov      word ptr [0x1d6], 0x22      
  {1A63B}  cmp      word ptr [0x1d6], 0x26      
  {1A640}  jne      0x1a648                     
  {1A642}  mov      word ptr [0x1d6], 0x23      
  {1A648}  cmp      word ptr [0x1d6], 0x27      
  {1A64D}  jne      0x1a655                     
  {1A64F}  mov      word ptr [0x1d6], 0x24      
  {1A655}  cmp      word ptr [0x1d6], 0x2a      
  {1A65A}  jne      0x1a662                     
  {1A65C}  mov      word ptr [0x1d6], 0x25      
  {1A662}  cmp      word ptr [0x1d6], 0x2b      
  {1A667}  jne      0x1a66f                     
  {1A669}  mov      word ptr [0x1d6], 0x26      
  {1A66F}  cmp      word ptr [0x1d6], 0x2c      
  {1A674}  jne      0x1a67c                     
  {1A676}  mov      word ptr [0x1d6], 0x27      
  {1A67C}  cmp      word ptr [0x1d6], 0x2d      
  {1A681}  jne      0x1a689                     
  {1A683}  mov      word ptr [0x1d6], 0x28      
  {1A689}  cmp      word ptr [0x1d6], 0x2e      
  {1A68E}  jne      0x1a696                     
  {1A690}  mov      word ptr [0x1d6], 0x29      
  {1A696}  cmp      word ptr [0x1d6], 0x2f      
  {1A69B}  jne      0x1a6a3                     
  {1A69D}  mov      word ptr [0x1d6], 0x2a      
  {1A6A3}  cmp      word ptr [0x1d6], 0x30      
  {1A6A8}  jne      0x1a6b0                     
  {1A6AA}  mov      word ptr [0x1d6], 0x2b      
  {1A6B0}  cmp      word ptr [0x1d6], 0x31      
  {1A6B5}  jne      0x1a6bd                     
  {1A6B7}  mov      word ptr [0x1d6], 0x2c      
  {1A6BD}  cmp      word ptr [0x1d6], 0x32      
  {1A6C2}  jne      0x1a6ca                     
  {1A6C4}  mov      word ptr [0x1d6], 0x2d      
  {1A6CA}  cmp      word ptr [0x1d6], 0x33      
  {1A6CF}  jne      0x1a6d7                     
  {1A6D1}  mov      word ptr [0x1d6], 0x2e      
  {1A6D7}  cmp      word ptr [0x1d6], 0x34      
  {1A6DC}  jne      0x1a6e4                     
  {1A6DE}  mov      word ptr [0x1d6], 0x30      
  {1A6E4}  cmp      word ptr [0x1d6], 0x35      
  {1A6E9}  jne      0x1a6f1                     
  {1A6EB}  mov      word ptr [0x1d6], 0x31      
  {1A6F1}  cmp      word ptr [0x1d6], 0x36      
  {1A6F6}  jne      0x1a6fe                     
  {1A6F8}  mov      word ptr [0x1d6], 0x32      
  {1A6FE}  cmp      word ptr [0x1d6], 0x37      
  {1A703}  jne      0x1a70b                     
  {1A705}  mov      word ptr [0x1d6], 0x33      
  {1A70B}  cmp      word ptr [0x1d6], 0x38      
  {1A710}  jne      0x1a718                     
  {1A712}  mov      word ptr [0x1d6], 0x36      
  {1A718}  cmp      word ptr [0x1d6], 0x39      
  {1A71D}  jne      0x1a725                     
  {1A71F}  mov      word ptr [0x1d6], 0x37      
  {1A725}  mov      di, 0x564                   
  {1A728}  push     ds                          
  {1A729}  push     di                          
  {1A72A}  mov      di, 0x714b                  
  {1A72D}  push     cs                          
  {1A72E}  push     di                          
  {1A72F}  lcall    0x1c71, 0x9d7               
  {1A734}  je       0x1a739                     
  {1A736}  jmp      0x1a9c1                     
  {1A739}  xor      ax, ax                      
  {1A73B}  mov      word ptr [0x1d8], ax        
  {1A73E}  cmp      word ptr [0x1d6], 0x21      
  {1A743}  jne      0x1a751                     
  {1A745}  mov      word ptr [0x1d6], 0x22      
  {1A74B}  mov      word ptr [0x214], 1         
  {1A751}  cmp      word ptr [0x1d6], 0x22      
  {1A756}  jne      0x1a76b                     
  {1A758}  cmp      word ptr [0x214], 0         
  {1A75D}  jne      0x1a76b                     
  {1A75F}  mov      word ptr [0x1d6], 0x25      
  {1A765}  mov      word ptr [0x214], 1         
  {1A76B}  cmp      word ptr [0x1d6], 0x23      
  {1A770}  jne      0x1a785                     
  {1A772}  cmp      word ptr [0x214], 0         
  {1A777}  jne      0x1a785                     
  {1A779}  mov      word ptr [0x1d6], 0x26      
  {1A77F}  mov      word ptr [0x214], 1         
  {1A785}  cmp      word ptr [0x1d6], 0x24      
  {1A78A}  jne      0x1a79f                     
  {1A78C}  cmp      word ptr [0x214], 0         
  {1A791}  jne      0x1a79f                     
  {1A793}  mov      word ptr [0x1d6], 0x27      
  {1A799}  mov      word ptr [0x214], 1         
  {1A79F}  cmp      word ptr [0x1d6], 0x25      
  {1A7A4}  jne      0x1a7b9                     
  {1A7A6}  cmp      word ptr [0x214], 0         
  {1A7AB}  jne      0x1a7b9                     
  {1A7AD}  mov      word ptr [0x1d6], 0x2a      
  {1A7B3}  mov      word ptr [0x214], 1         
  {1A7B9}  cmp      word ptr [0x1d6], 0x26      
  {1A7BE}  jne      0x1a7d3                     
  {1A7C0}  cmp      word ptr [0x214], 0         
  {1A7C5}  jne      0x1a7d3                     
  {1A7C7}  mov      word ptr [0x1d6], 0x2b      
  {1A7CD}  mov      word ptr [0x214], 1         
  {1A7D3}  cmp      word ptr [0x1d6], 0x27      
  {1A7D8}  jne      0x1a7ed                     
  {1A7DA}  cmp      word ptr [0x214], 0         
  {1A7DF}  jne      0x1a7ed                     
  {1A7E1}  mov      word ptr [0x1d6], 0x2c      
  {1A7E7}  mov      word ptr [0x214], 1         
  {1A7ED}  cmp      word ptr [0x1d6], 0x28      
  {1A7F2}  jne      0x1a807                     
  {1A7F4}  cmp      word ptr [0x214], 0         
  {1A7F9}  jne      0x1a807                     
  {1A7FB}  mov      word ptr [0x1d6], 0x2d      
  {1A801}  mov      word ptr [0x214], 1         
  {1A807}  cmp      word ptr [0x1d6], 0x29      
  {1A80C}  jne      0x1a821                     
  {1A80E}  cmp      word ptr [0x214], 0         
  {1A813}  jne      0x1a821                     
  {1A815}  mov      word ptr [0x1d6], 0x2e      
  {1A81B}  mov      word ptr [0x214], 1         
  {1A821}  cmp      word ptr [0x1d6], 0x2a      
  {1A826}  jne      0x1a83b                     
  {1A828}  cmp      word ptr [0x214], 0         
  {1A82D}  jne      0x1a83b                     
  {1A82F}  mov      word ptr [0x1d6], 0x2f      
  {1A835}  mov      word ptr [0x214], 1         
  {1A83B}  cmp      word ptr [0x1d6], 0x2b      
  {1A840}  jne      0x1a855                     
  {1A842}  cmp      word ptr [0x214], 0         
  {1A847}  jne      0x1a855                     
  {1A849}  mov      word ptr [0x1d6], 0x30      
  {1A84F}  mov      word ptr [0x214], 1         
  {1A855}  cmp      word ptr [0x1d6], 0x2c      
  {1A85A}  jne      0x1a86f                     
  {1A85C}  cmp      word ptr [0x214], 0         
  {1A861}  jne      0x1a86f                     
  {1A863}  mov      word ptr [0x1d6], 0x31      
  {1A869}  mov      word ptr [0x214], 1         
  {1A86F}  cmp      word ptr [0x1d6], 0x2d      
  {1A874}  jne      0x1a889                     
  {1A876}  cmp      word ptr [0x214], 0         
  {1A87B}  jne      0x1a889                     
  {1A87D}  mov      word ptr [0x1d6], 0x32      
  {1A883}  mov      word ptr [0x214], 1         
  {1A889}  cmp      word ptr [0x1d6], 0x2e      
  {1A88E}  jne      0x1a8a3                     
  {1A890}  cmp      word ptr [0x214], 0         
  {1A895}  jne      0x1a8a3                     
  {1A897}  mov      word ptr [0x1d6], 0x33      
  {1A89D}  mov      word ptr [0x214], 1         
  {1A8A3}  cmp      word ptr [0x1d6], 0x2f      
  {1A8A8}  jne      0x1a8bd                     
  {1A8AA}  cmp      word ptr [0x214], 0         
  {1A8AF}  jne      0x1a8bd                     
  {1A8B1}  mov      word ptr [0x1d8], 1         
  {1A8B7}  mov      word ptr [0x214], 1         
  {1A8BD}  cmp      word ptr [0x1d6], 0x30      
  {1A8C2}  jne      0x1a8d7                     
  {1A8C4}  cmp      word ptr [0x214], 0         
  {1A8C9}  jne      0x1a8d7                     
  {1A8CB}  mov      word ptr [0x1d6], 0x34      
  {1A8D1}  mov      word ptr [0x214], 1         
  {1A8D7}  cmp      word ptr [0x1d6], 0x31      
  {1A8DC}  jne      0x1a8f1                     
  {1A8DE}  cmp      word ptr [0x214], 0         
  {1A8E3}  jne      0x1a8f1                     
  {1A8E5}  mov      word ptr [0x1d6], 0x35      
  {1A8EB}  mov      word ptr [0x214], 1         
  {1A8F1}  cmp      word ptr [0x1d6], 0x32      
  {1A8F6}  jne      0x1a90b                     
  {1A8F8}  cmp      word ptr [0x214], 0         
  {1A8FD}  jne      0x1a90b                     
  {1A8FF}  mov      word ptr [0x1d6], 0x36      
  {1A905}  mov      word ptr [0x214], 1         
  {1A90B}  cmp      word ptr [0x1d6], 0x33      
  {1A910}  jne      0x1a925                     
  {1A912}  cmp      word ptr [0x214], 0         
  {1A917}  jne      0x1a925                     
  {1A919}  mov      word ptr [0x1d6], 0x37      
  {1A91F}  mov      word ptr [0x214], 1         
  {1A925}  cmp      word ptr [0x1d6], 0x34      
  {1A92A}  jne      0x1a93f                     
  {1A92C}  cmp      word ptr [0x214], 0         
  {1A931}  jne      0x1a93f                     
  {1A933}  mov      word ptr [0x1d8], 1         
  {1A939}  mov      word ptr [0x214], 1         
  {1A93F}  cmp      word ptr [0x1d6], 0x35      
  {1A944}  jne      0x1a959                     
  {1A946}  cmp      word ptr [0x214], 0         
  {1A94B}  jne      0x1a959                     
  {1A94D}  mov      word ptr [0x1d8], 1         
  {1A953}  mov      word ptr [0x214], 1         
  {1A959}  cmp      word ptr [0x1d6], 0x36      
  {1A95E}  jne      0x1a973                     
  {1A960}  cmp      word ptr [0x214], 0         
  {1A965}  jne      0x1a973                     
  {1A967}  mov      word ptr [0x1d6], 0x38      
  {1A96D}  mov      word ptr [0x214], 1         
  {1A973}  cmp      word ptr [0x1d6], 0x37      
  {1A978}  jne      0x1a98d                     
  {1A97A}  cmp      word ptr [0x214], 0         
  {1A97F}  jne      0x1a98d                     
  {1A981}  mov      word ptr [0x1d6], 0x39      
  {1A987}  mov      word ptr [0x214], 1         
  {1A98D}  cmp      word ptr [0x1d6], 0x38      
  {1A992}  jne      0x1a9a7                     
  {1A994}  cmp      word ptr [0x214], 0         
  {1A999}  jne      0x1a9a7                     
  {1A99B}  mov      word ptr [0x1d8], 1         
  {1A9A1}  mov      word ptr [0x214], 1         
  {1A9A7}  cmp      word ptr [0x1d6], 0x39      
  {1A9AC}  jne      0x1a9c1                     
  {1A9AE}  cmp      word ptr [0x214], 0         
  {1A9B3}  jne      0x1a9c1                     
  {1A9B5}  mov      word ptr [0x1d8], 1         
  {1A9BB}  mov      word ptr [0x214], 1         
  {1A9C1}  mov      di, 0x564                   
  {1A9C4}  push     ds                          
  {1A9C5}  push     di                          
  {1A9C6}  mov      di, 0x7152                  
  {1A9C9}  push     cs                          
  {1A9CA}  push     di                          
  {1A9CB}  lcall    0x1c71, 0x9d7               
  {1A9D0}  je       0x1a9d5                     
  {1A9D2}  jmp      0x1ac64                     
  {1A9D5}  xor      ax, ax                      
  {1A9D7}  mov      word ptr [0x1d8], ax        
  {1A9DA}  cmp      word ptr [0x1d6], 0x21      
  {1A9DF}  jne      0x1a9f4                     
  {1A9E1}  cmp      word ptr [0x214], 0         
  {1A9E6}  jne      0x1a9f4                     
  {1A9E8}  mov      word ptr [0x1d6], 0x23      
  {1A9EE}  mov      word ptr [0x214], 1         
  {1A9F4}  cmp      word ptr [0x1d6], 0x22      
  {1A9F9}  jne      0x1aa0e                     
  {1A9FB}  cmp      word ptr [0x214], 0         
  {1AA00}  jne      0x1aa0e                     
  {1AA02}  mov      word ptr [0x1d6], 0x26      
  {1AA08}  mov      word ptr [0x214], 1         
  {1AA0E}  cmp      word ptr [0x1d6], 0x23      
  {1AA13}  jne      0x1aa28                     
  {1AA15}  cmp      word ptr [0x214], 0         
  {1AA1A}  jne      0x1aa28                     
  {1AA1C}  mov      word ptr [0x1d6], 0x28      
  {1AA22}  mov      word ptr [0x214], 1         
  {1AA28}  cmp      word ptr [0x1d6], 0x24      
  {1AA2D}  jne      0x1aa42                     
  {1AA2F}  cmp      word ptr [0x214], 0         
  {1AA34}  jne      0x1aa42                     
  {1AA36}  mov      word ptr [0x1d6], 0x21      
  {1AA3C}  mov      word ptr [0x214], 1         
  {1AA42}  cmp      word ptr [0x1d6], 0x25      
  {1AA47}  jne      0x1aa5c                     
  {1AA49}  cmp      word ptr [0x214], 0         
  {1AA4E}  jne      0x1aa5c                     
  {1AA50}  mov      word ptr [0x1d6], 0x2b      
  {1AA56}  mov      word ptr [0x214], 1         
  {1AA5C}  cmp      word ptr [0x1d6], 0x26      
  {1AA61}  jne      0x1aa76                     
  {1AA63}  cmp      word ptr [0x214], 0         
  {1AA68}  jne      0x1aa76                     
  {1AA6A}  mov      word ptr [0x1d6], 0x2d      
  {1AA70}  mov      word ptr [0x214], 1         
  {1AA76}  cmp      word ptr [0x1d6], 0x27      
  {1AA7B}  jne      0x1aa90                     
  {1AA7D}  cmp      word ptr [0x214], 0         
  {1AA82}  jne      0x1aa90                     
  {1AA84}  mov      word ptr [0x1d6], 0x22      
  {1AA8A}  mov      word ptr [0x214], 1         
  {1AA90}  cmp      word ptr [0x1d6], 0x28      
  {1AA95}  jne      0x1aaaa                     
  {1AA97}  cmp      word ptr [0x214], 0         
  {1AA9C}  jne      0x1aaaa                     
  {1AA9E}  mov      word ptr [0x1d8], 1         
  {1AAA4}  mov      word ptr [0x214], 1         
  {1AAAA}  cmp      word ptr [0x1d6], 0x29      
  {1AAAF}  jne      0x1aac4                     
  {1AAB1}  cmp      word ptr [0x214], 0         
  {1AAB6}  jne      0x1aac4                     
  {1AAB8}  mov      word ptr [0x1d6], 0x24      
  {1AABE}  mov      word ptr [0x214], 1         
  {1AAC4}  cmp      word ptr [0x1d6], 0x2a      
  {1AAC9}  jne      0x1aade                     
  {1AACB}  cmp      word ptr [0x214], 0         
  {1AAD0}  jne      0x1aade                     
  {1AAD2}  mov      word ptr [0x1d6], 0x30      
  {1AAD8}  mov      word ptr [0x214], 1         
  {1AADE}  cmp      word ptr [0x1d6], 0x2b      
  {1AAE3}  jne      0x1aaf8                     
  {1AAE5}  cmp      word ptr [0x214], 0         
  {1AAEA}  jne      0x1aaf8                     
  {1AAEC}  mov      word ptr [0x1d6], 0x32      
  {1AAF2}  mov      word ptr [0x214], 1         
  {1AAF8}  cmp      word ptr [0x1d6], 0x2c      
  {1AAFD}  jne      0x1ab12                     
  {1AAFF}  cmp      word ptr [0x214], 0         
  {1AB04}  jne      0x1ab12                     
  {1AB06}  mov      word ptr [0x1d6], 0x25      
  {1AB0C}  mov      word ptr [0x214], 1         
  {1AB12}  cmp      word ptr [0x1d6], 0x2d      
  {1AB17}  jne      0x1ab2c                     
  {1AB19}  cmp      word ptr [0x214], 0         
  {1AB1E}  jne      0x1ab2c                     
  {1AB20}  mov      word ptr [0x1d8], 1         
  {1AB26}  mov      word ptr [0x214], 1         
  {1AB2C}  cmp      word ptr [0x1d6], 0x2e      
  {1AB31}  jne      0x1ab46                     
  {1AB33}  cmp      word ptr [0x214], 0         
  {1AB38}  jne      0x1ab46                     
  {1AB3A}  mov      word ptr [0x1d6], 0x27      
  {1AB40}  mov      word ptr [0x214], 1         
  {1AB46}  cmp      word ptr [0x1d6], 0x2f      
  {1AB4B}  jne      0x1ab60                     
  {1AB4D}  cmp      word ptr [0x214], 0         
  {1AB52}  jne      0x1ab60                     
  {1AB54}  mov      word ptr [0x1d6], 0x34      
  {1AB5A}  mov      word ptr [0x214], 1         
  {1AB60}  cmp      word ptr [0x1d6], 0x30      
  {1AB65}  jne      0x1ab7a                     
  {1AB67}  cmp      word ptr [0x214], 0         
  {1AB6C}  jne      0x1ab7a                     
  {1AB6E}  mov      word ptr [0x1d6], 0x36      
  {1AB74}  mov      word ptr [0x214], 1         
  {1AB7A}  cmp      word ptr [0x1d6], 0x31      
  {1AB7F}  jne      0x1ab94                     
  {1AB81}  cmp      word ptr [0x214], 0         
  {1AB86}  jne      0x1ab94                     
  {1AB88}  mov      word ptr [0x1d6], 0x2a      
  {1AB8E}  mov      word ptr [0x214], 1         
  {1AB94}  cmp      word ptr [0x1d6], 0x32      
  {1AB99}  jne      0x1abae                     
  {1AB9B}  cmp      word ptr [0x214], 0         
  {1ABA0}  jne      0x1abae                     
  {1ABA2}  mov      word ptr [0x1d8], 1         
  {1ABA8}  mov      word ptr [0x214], 1         
  {1ABAE}  cmp      word ptr [0x1d6], 0x33      
  {1ABB3}  jne      0x1abc8                     
  {1ABB5}  cmp      word ptr [0x214], 0         
  {1ABBA}  jne      0x1abc8                     
  {1ABBC}  mov      word ptr [0x1d6], 0x2c      
  {1ABC2}  mov      word ptr [0x214], 1         
  {1ABC8}  cmp      word ptr [0x1d6], 0x34      
  {1ABCD}  jne      0x1abe2                     
  {1ABCF}  cmp      word ptr [0x214], 0         
  {1ABD4}  jne      0x1abe2                     
  {1ABD6}  mov      word ptr [0x1d6], 0x38      
  {1ABDC}  mov      word ptr [0x214], 1         
  {1ABE2}  cmp      word ptr [0x1d6], 0x35      
  {1ABE7}  jne      0x1abfc                     
  {1ABE9}  cmp      word ptr [0x214], 0         
  {1ABEE}  jne      0x1abfc                     
  {1ABF0}  mov      word ptr [0x1d6], 0x2f      
  {1ABF6}  mov      word ptr [0x214], 1         
  {1ABFC}  cmp      word ptr [0x1d6], 0x36      
  {1AC01}  jne      0x1ac16                     
  {1AC03}  cmp      word ptr [0x214], 0         
  {1AC08}  jne      0x1ac16                     
  {1AC0A}  mov      word ptr [0x1d8], 1         
  {1AC10}  mov      word ptr [0x214], 1         
  {1AC16}  cmp      word ptr [0x1d6], 0x37      
  {1AC1B}  jne      0x1ac30                     
  {1AC1D}  cmp      word ptr [0x214], 0         
  {1AC22}  jne      0x1ac30                     
  {1AC24}  mov      word ptr [0x1d6], 0x31      
  {1AC2A}  mov      word ptr [0x214], 1         
  {1AC30}  cmp      word ptr [0x1d6], 0x38      
  {1AC35}  jne      0x1ac4a                     
  {1AC37}  cmp      word ptr [0x214], 0         
  {1AC3C}  jne      0x1ac4a                     
  {1AC3E}  mov      word ptr [0x1d8], 1         
  {1AC44}  mov      word ptr [0x214], 1         
  {1AC4A}  cmp      word ptr [0x1d6], 0x39      
  {1AC4F}  jne      0x1ac64                     
  {1AC51}  cmp      word ptr [0x214], 0         
  {1AC56}  jne      0x1ac64                     
  {1AC58}  mov      word ptr [0x1d6], 0x35      
  {1AC5E}  mov      word ptr [0x214], 1         
  {1AC64}  mov      di, 0x564                   
  {1AC67}  push     ds                          
  {1AC68}  push     di                          
  {1AC69}  mov      di, 0x7159                  
  {1AC6C}  push     cs                          
  {1AC6D}  push     di                          
  {1AC6E}  lcall    0x1c71, 0x9d7               
  {1AC73}  je       0x1ac78                     
  {1AC75}  jmp      0x1af07                     
  {1AC78}  xor      ax, ax                      
  {1AC7A}  mov      word ptr [0x1d8], ax        
  {1AC7D}  cmp      word ptr [0x1d6], 0x21      
  {1AC82}  jne      0x1ac97                     
  {1AC84}  cmp      word ptr [0x214], 0         
  {1AC89}  jne      0x1ac97                     
  {1AC8B}  mov      word ptr [0x1d6], 0x24      
  {1AC91}  mov      word ptr [0x214], 1         
  {1AC97}  cmp      word ptr [0x1d6], 0x22      
  {1AC9C}  jne      0x1acb1                     
  {1AC9E}  cmp      word ptr [0x214], 0         
  {1ACA3}  jne      0x1acb1                     
  {1ACA5}  mov      word ptr [0x1d6], 0x27      
  {1ACAB}  mov      word ptr [0x214], 1         
  {1ACB1}  cmp      word ptr [0x1d6], 0x23      
  {1ACB6}  jne      0x1accb                     
  {1ACB8}  cmp      word ptr [0x214], 0         
  {1ACBD}  jne      0x1accb                     
  {1ACBF}  mov      word ptr [0x1d6], 0x21      
  {1ACC5}  mov      word ptr [0x214], 1         
  {1ACCB}  cmp      word ptr [0x1d6], 0x24      
  {1ACD0}  jne      0x1ace5                     
  {1ACD2}  cmp      word ptr [0x214], 0         
  {1ACD7}  jne      0x1ace5                     
  {1ACD9}  mov      word ptr [0x1d6], 0x29      
  {1ACDF}  mov      word ptr [0x214], 1         
  {1ACE5}  cmp      word ptr [0x1d6], 0x25      
  {1ACEA}  jne      0x1acff                     
  {1ACEC}  cmp      word ptr [0x214], 0         
  {1ACF1}  jne      0x1acff                     
  {1ACF3}  mov      word ptr [0x1d6], 0x2c      
  {1ACF9}  mov      word ptr [0x214], 1         
  {1ACFF}  cmp      word ptr [0x1d6], 0x26      
  {1AD04}  jne      0x1ad19                     
  {1AD06}  cmp      word ptr [0x214], 0         
  {1AD0B}  jne      0x1ad19                     
  {1AD0D}  mov      word ptr [0x1d6], 0x22      
  {1AD13}  mov      word ptr [0x214], 1         
  {1AD19}  cmp      word ptr [0x1d6], 0x27      
  {1AD1E}  jne      0x1ad33                     
  {1AD20}  cmp      word ptr [0x214], 0         
  {1AD25}  jne      0x1ad33                     
  {1AD27}  mov      word ptr [0x1d6], 0x2e      
  {1AD2D}  mov      word ptr [0x214], 1         
  {1AD33}  cmp      word ptr [0x1d6], 0x28      
  {1AD38}  jne      0x1ad4d                     
  {1AD3A}  cmp      word ptr [0x214], 0         
  {1AD3F}  jne      0x1ad4d                     
  {1AD41}  mov      word ptr [0x1d6], 0x23      
  {1AD47}  mov      word ptr [0x214], 1         
  {1AD4D}  cmp      word ptr [0x1d6], 0x29      
  {1AD52}  jne      0x1ad67                     
  {1AD54}  cmp      word ptr [0x214], 0         
  {1AD59}  jne      0x1ad67                     
  {1AD5B}  mov      word ptr [0x1d8], 1         
  {1AD61}  mov      word ptr [0x214], 1         
  {1AD67}  cmp      word ptr [0x1d6], 0x2a      
  {1AD6C}  jne      0x1ad81                     
  {1AD6E}  cmp      word ptr [0x214], 0         
  {1AD73}  jne      0x1ad81                     
  {1AD75}  mov      word ptr [0x1d6], 0x31      
  {1AD7B}  mov      word ptr [0x214], 1         
  {1AD81}  cmp      word ptr [0x1d6], 0x2b      
  {1AD86}  jne      0x1ad9b                     
  {1AD88}  cmp      word ptr [0x214], 0         
  {1AD8D}  jne      0x1ad9b                     
  {1AD8F}  mov      word ptr [0x1d6], 0x25      
  {1AD95}  mov      word ptr [0x214], 1         
  {1AD9B}  cmp      word ptr [0x1d6], 0x2c      
  {1ADA0}  jne      0x1adb5                     
  {1ADA2}  cmp      word ptr [0x214], 0         
  {1ADA7}  jne      0x1adb5                     
  {1ADA9}  mov      word ptr [0x1d6], 0x33      
  {1ADAF}  mov      word ptr [0x214], 1         
  {1ADB5}  cmp      word ptr [0x1d6], 0x2d      
  {1ADBA}  jne      0x1adcf                     
  {1ADBC}  cmp      word ptr [0x214], 0         
  {1ADC1}  jne      0x1adcf                     
  {1ADC3}  mov      word ptr [0x1d6], 0x26      
  {1ADC9}  mov      word ptr [0x214], 1         
  {1ADCF}  cmp      word ptr [0x1d6], 0x2e      
  {1ADD4}  jne      0x1ade9                     
  {1ADD6}  cmp      word ptr [0x214], 0         
  {1ADDB}  jne      0x1ade9                     
  {1ADDD}  mov      word ptr [0x1d8], 1         
  {1ADE3}  mov      word ptr [0x214], 1         
  {1ADE9}  cmp      word ptr [0x1d6], 0x2f      
  {1ADEE}  jne      0x1ae03                     
  {1ADF0}  cmp      word ptr [0x214], 0         
  {1ADF5}  jne      0x1ae03                     
  {1ADF7}  mov      word ptr [0x1d6], 0x35      
  {1ADFD}  mov      word ptr [0x214], 1         
  {1AE03}  cmp      word ptr [0x1d6], 0x30      
  {1AE08}  jne      0x1ae1d                     
  {1AE0A}  cmp      word ptr [0x214], 0         
  {1AE0F}  jne      0x1ae1d                     
  {1AE11}  mov      word ptr [0x1d6], 0x2a      
  {1AE17}  mov      word ptr [0x214], 1         
  {1AE1D}  cmp      word ptr [0x1d6], 0x31      
  {1AE22}  jne      0x1ae37                     
  {1AE24}  cmp      word ptr [0x214], 0         
  {1AE29}  jne      0x1ae37                     
  {1AE2B}  mov      word ptr [0x1d6], 0x37      
  {1AE31}  mov      word ptr [0x214], 1         
  {1AE37}  cmp      word ptr [0x1d6], 0x32      
  {1AE3C}  jne      0x1ae51                     
  {1AE3E}  cmp      word ptr [0x214], 0         
  {1AE43}  jne      0x1ae51                     
  {1AE45}  mov      word ptr [0x1d6], 0x2b      
  {1AE4B}  mov      word ptr [0x214], 1         
  {1AE51}  cmp      word ptr [0x1d6], 0x33      
  {1AE56}  jne      0x1ae6b                     
  {1AE58}  cmp      word ptr [0x214], 0         
  {1AE5D}  jne      0x1ae6b                     
  {1AE5F}  mov      word ptr [0x1d8], 1         
  {1AE65}  mov      word ptr [0x214], 1         
  {1AE6B}  cmp      word ptr [0x1d6], 0x34      
  {1AE70}  jne      0x1ae85                     
  {1AE72}  cmp      word ptr [0x214], 0         
  {1AE77}  jne      0x1ae85                     
  {1AE79}  mov      word ptr [0x1d6], 0x2f      
  {1AE7F}  mov      word ptr [0x214], 1         
  {1AE85}  cmp      word ptr [0x1d6], 0x35      
  {1AE8A}  jne      0x1ae9f                     
  {1AE8C}  cmp      word ptr [0x214], 0         
  {1AE91}  jne      0x1ae9f                     
  {1AE93}  mov      word ptr [0x1d6], 0x39      
  {1AE99}  mov      word ptr [0x214], 1         
  {1AE9F}  cmp      word ptr [0x1d6], 0x36      
  {1AEA4}  jne      0x1aeb9                     
  {1AEA6}  cmp      word ptr [0x214], 0         
  {1AEAB}  jne      0x1aeb9                     
  {1AEAD}  mov      word ptr [0x1d6], 0x30      
  {1AEB3}  mov      word ptr [0x214], 1         
  {1AEB9}  cmp      word ptr [0x1d6], 0x37      
  {1AEBE}  jne      0x1aed3                     
  {1AEC0}  cmp      word ptr [0x214], 0         
  {1AEC5}  jne      0x1aed3                     
  {1AEC7}  mov      word ptr [0x1d8], 1         
  {1AECD}  mov      word ptr [0x214], 1         
  {1AED3}  cmp      word ptr [0x1d6], 0x38      
  {1AED8}  jne      0x1aeed                     
  {1AEDA}  cmp      word ptr [0x214], 0         
  {1AEDF}  jne      0x1aeed                     
  {1AEE1}  mov      word ptr [0x1d6], 0x34      
  {1AEE7}  mov      word ptr [0x214], 1         
  {1AEED}  cmp      word ptr [0x1d6], 0x39      
  {1AEF2}  jne      0x1af07                     
  {1AEF4}  cmp      word ptr [0x214], 0         
  {1AEF9}  jne      0x1af07                     
  {1AEFB}  mov      word ptr [0x1d8], 1         
  {1AF01}  mov      word ptr [0x214], 1         
  {1AF07}  xor      ax, ax                      
  {1AF09}  mov      word ptr [0x214], ax        
  {1AF0C}  cmp      word ptr [0x1d8], 0         
  {1AF11}  je       0x1af1e                     
  {1AF13}  cmp      word ptr [0x1d6], 0x3e8     
  {1AF19}  je       0x1af1e                     
  {1AF1B}  jmp      0x19c27                     
  {1AF1E}  pop      bp                          
  {1AF1F}  retf                                 
  {1AF20}  adc      byte ptr [bp + si + 0x41], bl
  {1AF23}  inc      dx                          
  {1AF24}  dec      cx                          
  {1AF25}  dec      dx                          
  {1AF26}  and      byte ptr [bx + si + 0x45], dl
  {1AF29}  push     dx                          
  {1AF2A}  dec      bx                          
  {1AF2B}  push     bp                          
  {1AF2C}  push     bx                          
  {1AF2D}  dec      cx                          
  {1AF2E}  push     bx                          
  {1AF2F}  push     sp                          
  {1AF30}  inc      cx                          
  {1AF31}  adc      byte ptr [bp + si + 0x41], bl
  {1AF34}  inc      dx                          
  {1AF35}  dec      cx                          
  {1AF36}  dec      dx                          
  {1AF37}  and      byte ptr [bx + 0x49], al    
  {1AF3A}  push     sp                          
  {1AF3B}  inc      cx                          
  {1AF3C}  push     dx                          
  {1AF3D}  pop      dx                          
  {1AF3E}  pop      cx                          
  {1AF3F}  push     bx                          
  {1AF40}  push     sp                          
  {1AF41}  inc      cx                          
  {1AF42}  or       bx, word ptr [bp + si + 0x41]
  {1AF45}  inc      dx                          
  {1AF46}  dec      cx                          
  {1AF47}  dec      dx                          
  {1AF48}  and      byte ptr [si + 0x49], cl    
  {1AF4B}  push     dx                          
  {1AF4C}  dec      di                          
  {1AF4D}  pop      cx                          
  {1AF4E}  cmp      byte ptr [bx + 0x52], al    
  {1AF51}  inc      cx                          
  {1AF52}  push     sp                          
  {1AF53}  push     bp                          
  {1AF54}  dec      sp                          
  {1AF55}  inc      cx                          
  {1AF56}  inc      bx                          
  {1AF57}  dec      dx                          
  {1AF58}  inc      bp                          
  {1AF59}  and      byte ptr [bx + di], ah      
  {1AF5B}  and      word ptr [bx + di], sp      
  {1AF5D}  and      byte ptr [bp + si + 0x41], bl
  {1AF60}  inc      dx                          
  {1AF61}  dec      cx                          
  {1AF62}  dec      sp                          
  {1AF63}  inc      bp                          
  {1AF64}  push     bx                          
  {1AF65}  and      byte ptr [si + 0x49], cl    
  {1AF68}  push     dx                          
  {1AF69}  dec      di                          
  {1AF6A}  pop      cx                          
  {1AF6B}  inc      cx                          
  {1AF6C}  and      byte ptr [si + 0x4f], al    
  {1AF6F}  push     bx                          
  {1AF70}  push     sp                          
  {1AF71}  inc      cx                          
  {1AF72}  dec      dx                          
  {1AF73}  inc      bp                          
  {1AF74}  push     bx                          
  {1AF75}  pop      dx                          
  {1AF76}  and      byte ptr [bp + si + 0x41], bl
  {1AF79}  and      byte ptr [si + 0x41], al    
  {1AF7C}  push     dx                          
  {1AF7D}  dec      bp                          
  {1AF7E}  dec      di                          
  {1AF7F}  and      byte ptr [bp + di], dh      
  {1AF81}  xor      byte ptr [bx + si], ah      
  {1AF83}  dec      bx                          
  {1AF84}  inc      cx                          
  {1AF85}  push     bx                          
  {1AF86}  pop      cx                          
  {1AF87}  cvtps2pd xmm0, qword ptr [bx + di + 0x42]
  {1AF8B}  dec      cx                          
  {1AF8C}  dec      dx                          
  {1AF8D}  and      byte ptr [bx + 0x52], cl    
  {1AF90}  inc      di                          
  {1AF91}  inc      cx                          
  {1AF92}  dec      si                          
  {1AF93}  dec      cx                          
  {1AF94}  push     bx                          
  {1AF95}  push     sp                          
  {1AF96}  inc      cx                          
  {1AF97}  push     bp                          
  {1AF98}  mov      bp, sp                      
  {1AF9A}  xor      ax, ax                      
  {1AF9C}  lcall    0x1c71, 0x2cd               
  {1AFA1}  mov      di, 0x564                   
  {1AFA4}  push     ds                          
  {1AFA5}  push     di                          
  {1AFA6}  mov      di, 0x8550                  
  {1AFA9}  push     cs                          
  {1AFAA}  push     di                          
  {1AFAB}  lcall    0x1c71, 0x9d7               
  {1AFB0}  jne      0x1afc8                     
  {1AFB2}  mov      ax, word ptr [0x228]        
  {1AFB5}  cmp      ax, word ptr [0x1d6]        
  {1AFB9}  jne      0x1afc8                     
  {1AFBB}  push     cs                          
  {1AFBC}  call     0x13ca4                     
  {1AFBF}  xor      ax, ax                      
  {1AFC1}  mov      word ptr [0x228], ax        
  {1AFC4}  push     cs                          
  {1AFC5}  call     0x15908                     
  {1AFC8}  mov      di, 0x564                   
  {1AFCB}  push     ds                          
  {1AFCC}  push     di                          
  {1AFCD}  mov      di, 0x8561                  
  {1AFD0}  push     cs                          
  {1AFD1}  push     di                          
  {1AFD2}  lcall    0x1c71, 0x9d7               
  {1AFD7}  jne      0x1afef                     
  {1AFD9}  mov      ax, word ptr [0x226]        
  {1AFDC}  cmp      ax, word ptr [0x1d6]        
  {1AFE0}  jne      0x1afef                     
  {1AFE2}  push     cs                          
  {1AFE3}  call     0x13ca4                     
  {1AFE6}  xor      ax, ax                      
  {1AFE8}  mov      word ptr [0x226], ax        
  {1AFEB}  push     cs                          
  {1AFEC}  call     0x15908                     
  {1AFEF}  mov      di, 0x564                   
  {1AFF2}  push     ds                          
  {1AFF3}  push     di                          
  {1AFF4}  mov      di, 0x8572                  
  {1AFF7}  push     cs                          
  {1AFF8}  push     di                          
  {1AFF9}  lcall    0x1c71, 0x9d7               
  {1AFFE}  jne      0x1b06c                     
  {1B000}  mov      ax, word ptr [0x22c]        
  {1B003}  cmp      ax, word ptr [0x1d6]        
  {1B007}  jne      0x1b06c                     
  {1B009}  push     cs                          
  {1B00A}  call     0x13ef3                     
  {1B00D}  cmp      word ptr [0x1d6], 0x2710    
  {1B013}  je       0x1b06c                     
  {1B015}  cmp      word ptr [0x19c], 0         
  {1B01A}  jle      0x1b06c                     
  {1B01C}  cmp      word ptr [0x1d2], 0         
  {1B021}  jne      0x1b06c                     
  {1B023}  mov      di, 0x7a2                   
  {1B026}  push     ds                          
  {1B027}  push     di                          
  {1B028}  mov      di, 0x857e                  
  {1B02B}  push     cs                          
  {1B02C}  push     di                          
  {1B02D}  xor      ax, ax                      
  {1B02F}  push     ax                          
  {1B030}  lcall    0x1c71, 0x701               
  {1B035}  lcall    0x1c71, 0x5dd               
  {1B03A}  lcall    0x1c71, 0x291               
  {1B03F}  mov      ax, word ptr [0x21a]        
  {1B042}  mov      dx, word ptr [0x21c]        
  {1B046}  add      ax, 0x1e                    
  {1B049}  adc      dx, 0                       
  {1B04C}  mov      word ptr [0x21a], ax        
  {1B04F}  mov      word ptr [0x21c], dx        
  {1B053}  push     cs                          
  {1B054}  call     0x15908                     
  {1B057}  cmp      word ptr [0x248], 1         
  {1B05C}  jle      0x1b067                     
  {1B05E}  mov      ax, word ptr [0x24a]        
  {1B061}  sub      ax, 0x96                    
  {1B064}  mov      word ptr [0x24a], ax        
  {1B067}  xor      ax, ax                      
  {1B069}  mov      word ptr [0x22c], ax        
  {1B06C}  mov      di, 0x564                   
  {1B06F}  push     ds                          
  {1B070}  push     di                          
  {1B071}  mov      di, 0x85b7                  
  {1B074}  push     cs                          
  {1B075}  push     di                          
  {1B076}  lcall    0x1c71, 0x9d7               
  {1B07B}  jne      0x1b093                     
  {1B07D}  mov      ax, word ptr [0x22a]        
  {1B080}  cmp      ax, word ptr [0x1d6]        
  {1B084}  jne      0x1b093                     
  {1B086}  push     cs                          
  {1B087}  call     0x13ca4                     
  {1B08A}  xor      ax, ax                      
  {1B08C}  mov      word ptr [0x22a], ax        
  {1B08F}  push     cs                          
  {1B090}  call     0x15908                     
  {1B093}  pop      bp                          
  {1B094}  retf                                 
  {1B095}  or       al, 0x5a                    
  {1B097}  inc      cx                          
  {1B098}  inc      dx                          
  {1B099}  dec      cx                          
  {1B09A}  dec      dx                          
  {1B09B}  and      byte ptr [si + 0x55], al    
  {1B09E}  dec      si                          
  {1B09F}  inc      bx                          
  {1B0A0}  inc      cx                          
  {1B0A1}  dec      si                          
  {1B0A2}  or       al, 0x53                    
  {1B0A4}  inc      bp                          
  {1B0A5}  inc      bx                          
  {1B0A6}  push     dx                          
  {1B0A7}  inc      bp                          
  {1B0A8}  push     sp                          
  {1B0A9}  and      byte ptr [si + 0x49], cl    
  {1B0AC}  push     bx                          
  {1B0AD}  push     sp                          
  {1B0AE}  inc      cx                          
  {1B0AF}  inc      bp                          
  {1B0B0}  dec      di                          
  {1B0B1}  push     sp                          
  {1B0B2}  dec      di                          
  {1B0B3}  and      byte ptr [bp + di + 0x4f], al
  {1B0B6}  and      byte ptr [bx + di + 0x4b], al
  {1B0B9}  push     sp                          
  {1B0BA}  push     bp                          
  {1B0BB}  inc      cx                          
  {1B0BC}  dec      sp                          
  {1B0BD}  dec      si                          
  {1B0BE}  dec      cx                          
  {1B0BF}  inc      bp                          
  {1B0C0}  and      byte ptr [di + 0x41], cl    
  {1B0C3}  dec      bp                          
  {1B0C4}  and      byte ptr [si + 0x4f], al    
  {1B0C7}  and      byte ptr [bp + si + 0x41], bl
  {1B0CA}  dec      di                          
  {1B0CB}  inc      si                          
  {1B0CC}  inc      bp                          
  {1B0CD}  push     dx                          
  {1B0CE}  dec      di                          
  {1B0CF}  push     di                          
  {1B0D0}  inc      cx                          
  {1B0D1}  dec      si                          
  {1B0D2}  dec      cx                          
  {1B0D3}  inc      cx                          
  {1B0D4}  and      byte ptr [bp + si], bh      
  {1B0D6}  and      byte ptr [bx + si + 0x41], dl
  {1B0D9}  dec      bp                          
  {1B0DA}  dec      cx                          
  {1B0DB}  inc      bp                          
  {1B0DC}  push     sp                          
  {1B0DD}  inc      cx                          
  {1B0DE}  dec      dx                          
  {1B0DF}  and      byte ptr [di + 0x20], dl    
  {1B0E2}  dec      bp                          
  {1B0E3}  dec      si                          
  {1B0E4}  dec      cx                          
  {1B0E5}  inc      bp                          
  {1B0E6}  and      byte ptr [si + 0x59], dl    
  {1B0E9}  dec      sp                          
  {1B0EA}  dec      bx                          
  {1B0EB}  dec      di                          
  {1B0EC}  and      byte ptr [bp + di + 0x55], cl
  {1B0EF}  push     ax                          
  {1B0F0}  push     bp                          
  {1B0F1}  dec      dx                          
  {1B0F2}  inc      bp                          
  {1B0F3}  dec      bp                          
  {1B0F4}  pop      cx                          
  {1B0F5}  and      word ptr [di + 0x41], cx    
  {1B0F8}  push     dx                          
  {1B0F9}  inc      bx                          
  {1B0FA}  dec      ax                          
  {1B0FB}  inc      bp                          
  {1B0FC}  push     di                          
  {1B0FD}  dec      bx                          
  {1B0FE}  inc      cx                          
  {1B0FF}  and      byte ptr [bp + si + 0x20], bl
  {1B102}  push     bx                          
  {1B103}  inc      cx                          
  {1B104}  inc      sp                          
  {1B105}  push     bp                          
  {1B106}  and      byte ptr [si + 0x55], al    
  {1B109}  dec      si                          
  {1B10A}  inc      bx                          
  {1B10B}  inc      cx                          
  {1B10C}  dec      si                          
  {1B10D}  inc      cx                          
  {1B10E}  and      byte ptr [bx + si], ah      
  {1B110}  and      byte ptr [bp + si], bh      
  {1B112}  and      byte ptr [bx], dh           
  {1B114}  xor      byte ptr [bx + si], dh      
  {1B116}  xor      byte ptr [bx + di], ah      
  {1B118}  push     ax                          
  {1B119}  push     dx                          
  {1B11A}  pop      dx                          
  {1B11B}  inc      bp                          
  {1B11C}  push     ax                          
  {1B11D}  push     bp                          
  {1B11E}  push     bx                          
  {1B11F}  push     sp                          
  {1B120}  dec      bx                          
  {1B121}  inc      cx                          
  {1B122}  and      byte ptr [bx + di + 0x55], dl
  {1B125}  inc      bp                          
  {1B126}  push     bx                          
  {1B127}  push     sp                          
  {1B128}  sub      ax, 0x414d                  
  {1B12B}  push     bx                          
  {1B12C}  push     sp                          
  {1B12D}  inc      bp                          
  {1B12E}  push     dx                          
  {1B12F}  inc      cx                          
  {1B130}  and      byte ptr [bx + si], ah      
  {1B132}  and      byte ptr [bp + si], bh      
  {1B134}  and      byte ptr [bx + si], ah      
  {1B136}  xor      al, 0x30                    
  {1B138}  xor      byte ptr [bx + di], ah      
  {1B13A}  push     ax                          
  {1B13B}  dec      sp                          
  {1B13C}  inc      bp                          
  {1B13D}  inc      bx                          
  {1B13E}  inc      cx                          
  {1B13F}  dec      bx                          
  {1B140}  and      byte ptr [bx + si], ah      
  {1B142}  and      byte ptr [bx + si], ah      
  {1B144}  and      byte ptr [bx + si], ah      
  {1B146}  and      byte ptr [bx + si], ah      
  {1B148}  and      byte ptr [bx + si], ah      
  {1B14A}  and      byte ptr [bx + si], ah      
  {1B14C}  and      byte ptr [bx + si], ah      
  {1B14E}  and      byte ptr [bx + si], ah      
  {1B150}  and      byte ptr [bx + si], ah      
  {1B152}  and      byte ptr [bx + si], ah      
  {1B154}  and      byte ptr [bp + si], bh      
  {1B156}  and      byte ptr [si], dh           
  {1B158}  cmp      byte ptr [bx + si], dh      
  {1B15A}  xor      byte ptr [si], cl           
  {1B15C}  dec      bx                          
  {1B15D}  push     bp                          
  {1B15E}  push     ax                          
  {1B15F}  and      byte ptr [si + 0x4f], al    
  {1B162}  dec      bx                          
  {1B163}  push     bp                          
  {1B164}  dec      bp                          
  {1B165}  inc      bp                          
  {1B166}  dec      si                          
  {1B167}  push     sp                          
  {1B168}  inc      bp                          
  {1B169}  dec      di                          
  {1B16A}  push     sp                          
  {1B16B}  dec      di                          
  {1B16C}  and      byte ptr [bx + si + 0x4f], dl
  {1B16F}  inc      sp                          
  {1B170}  push     dx                          
  {1B171}  dec      di                          
  {1B172}  inc      dx                          
  {1B173}  dec      cx                          
  {1B174}  dec      di                          
  {1B175}  dec      si                          
  {1B176}  inc      cx                          
  {1B177}  and      byte ptr [bx + si + 0x52], dl
  {1B17A}  pop      dx                          
  {1B17B}  inc      bp                          
  {1B17C}  push     ax                          
  {1B17D}  push     bp                          
  {1B17E}  push     bx                          
  {1B17F}  push     sp                          
  {1B180}  dec      bx                          
  {1B181}  inc      cx                          
  {1B182}  and      byte ptr [bx + si + 0x45], cl
  {1B185}  and      byte ptr [si], ch           
  {1B187}  and      byte ptr [bx + si + 0x45], cl
  {1B18A}  and      byte ptr [bp + 0x41], cl    
  {1B18D}  push     di                          
  {1B18E}  inc      bp                          
  {1B18F}  push     sp                          
  {1B190}  and      byte ptr [bx + di + 0x55], dl
  {1B193}  inc      bp                          
  {1B194}  push     bx                          
  {1B195}  push     sp                          
  {1B196}  sub      ax, 0x414d                  
  {1B199}  push     bx                          
  {1B19A}  push     sp                          
  {1B19B}  inc      bp                          
  {1B19C}  push     dx                          
  {1B19D}  and      byte ptr [bp + di + 0x49], dl
  {1B1A0}  inc      bp                          
  {1B1A1}  and      byte ptr [bp + 0x49], cl    
  {1B1A4}  inc      bp                          
  {1B1A5}  and      byte ptr [bx + si + 0x4f], dl
  {1B1A8}  dec      bx                          
  {1B1A9}  inc      cx                          
  {1B1AA}  push     ax                          
  {1B1AB}  push     bp                          
  {1B1AC}  dec      dx                          
  {1B1AD}  inc      bp                          
  {1B1AE}  or       cl, byte ptr [bp + di + 0x55]
  {1B1B1}  push     ax                          
  {1B1B2}  and      byte ptr [bx + si + 0x4c], dl
  {1B1B5}  inc      bp                          
  {1B1B6}  inc      bx                          
  {1B1B7}  inc      cx                          
  {1B1B8}  dec      bx                          
  {1B1B9}  dec      ax                          
  {1B1BB}  inc      bp                          
  {1B1BC}  and      byte ptr [bx + si + 0x45], cl
  {1B1BF}  and      byte ptr [bx + si + 0x45], cl
  {1B1C2}  and      byte ptr [di + 0x49], cl    
  {1B1C5}  dec      sp                          
  {1B1C6}  dec      di                          
  {1B1C7}  and      byte ptr [bp + di + 0x49], dl
  {1B1CA}  inc      bp                          
  {1B1CB}  and      byte ptr [bp + si + 0x20], bl
  {1B1CE}  push     sp                          
  {1B1CF}  dec      di                          
  {1B1D0}  inc      dx                          
  {1B1D1}  inc      cx                          
  {1B1D2}  and      byte ptr [bp + si + 0x4f], dl
  {1B1D5}  inc      dx                          
  {1B1D6}  dec      cx                          
  {1B1D7}  and      byte ptr [bx + di + 0x4e], cl
  {1B1DA}  push     sp                          
  {1B1DB}  inc      bp                          
  {1B1DC}  push     dx                          
  {1B1DD}  inc      bp                          
  {1B1DE}  push     bx                          
  {1B1DF}  pop      cx                          
  {1B1E0}  adc      byte ptr [bp + si + 0x4f], dl
  {1B1E3}  pop      dx                          
  {1B1E4}  dec      bp                          
  {1B1E5}  inc      cx                          
  {1B1E6}  push     di                          
  {1B1E7}  dec      cx                          
  {1B1E8}  inc      cx                          
  {1B1E9}  dec      dx                          
  {1B1EA}  and      byte ptr [si + 0x55], al    
  {1B1ED}  dec      si                          
  {1B1EE}  inc      bx                          
  {1B1EF}  inc      cx                          
  {1B1F0}  dec      si                          
  {1B1F1}  inc      sp                          
  {1B1F2}  push     bp                          
  {1B1F3}  inc      bx                          
  {1B1F4}  dec      ax                          
  {1B1F5}  and      byte ptr [bx + di + 0x20], al
  {1B1F8}  inc      bx                          
  {1B1F9}  dec      di                          
  {1B1FA}  pop      dx                          
  {1B1FB}  and      byte ptr [si + 0x4f], dl    
  {1B1FE}  and      byte ptr [bp + si + 0x41], bl
  {1B201}  and      byte ptr [bp + di + 0x54], dl
  {1B204}  push     dx                          
  {1B205}  inc      cx                          
  {1B206}  push     bx                          
  {1B207}  pop      dx                          
  {1B208}  dec      si                          
  {1B209}  inc      cx                          
  {1B20A}  and      byte ptr [bp + si + 0x4f], dl
  {1B20D}  push     bx                          
  {1B20E}  dec      sp                          
  {1B20F}  dec      cx                          
  {1B210}  dec      si                          
  {1B211}  inc      cx                          
  {1B212}  and      byte ptr [di], ch           
  {1B214}  and      byte ptr [bx + si + 0x52], dl
  {1B217}  pop      dx                          
  {1B218}  inc      bp                          
  {1B219}  dec      sp                          
  {1B21A}  inc      cx                          
  {1B21B}  dec      bx                          
  {1B21C}  dec      sp                          
  {1B21D}  and      byte ptr [bp + di + 0x49], dl
  {1B220}  inc      bp                          
  {1B221}  and      byte ptr [si + 0x55], al    
  {1B224}  dec      si                          
  {1B225}  inc      bx                          
  {1B226}  inc      cx                          
  {1B227}  dec      si                          
  {1B228}  and      byte ptr [bx + 0x49], dl    
  {1B22B}  inc      sp                          
  {1B22C}  pop      dx                          
  {1B22D}  inc      cx                          
  {1B22E}  inc      bx                          
  {1B22F}  and      byte ptr [bp + di + 0x49], al
  {1B232}  inc      bp                          
  {1B233}  inc      dx                          
  {1B234}  dec      cx                          
  {1B235}  inc      bp                          
  {1B236}  inc      sp                          
  {1B237}  inc      cx                          
  {1B238}  inc      cx                          
  {1B239}  inc      cx                          
  {1B23A}  and      byte ptr [si + 0x4f], dl    
  {1B23D}  and      byte ptr [bp + si + 0x41], cl
  {1B240}  dec      bx                          
  {1B241}  dec      cx                          
  {1B242}  push     bx                          
  {1B243}  and      byte ptr [bx + 0x41], dl    
  {1B246}  dec      sp                          
  {1B247}  and      byte ptr [bx + di + 0x20], al
  {1B24A}  dec      si                          
  {1B24B}  dec      cx                          
  {1B24C}  inc      bp                          
  {1B24D}  and      byte ptr [bp + si + 0x4f], dl
  {1B250}  push     bx                          
  {1B251}  dec      sp                          
  {1B252}  dec      cx                          
  {1B253}  dec      si                          
  {1B254}  inc      cx                          
  {1B255}  and      byte ptr [si], ch           
  {1B257}  and      byte ptr [di + 0x4f], cl    
  {1B25A}  push     di                          
  {1B25B}  dec      cx                          
  {1B25C}  and      byte ptr [bx + si + 0x4f], dl
  {1B25F}  and      byte ptr [bp + di + 0x48], al
  {1B262}  push     di                          
  {1B263}  dec      cx                          
  {1B264}  dec      sp                          
  {1B265}  dec      cx                          
  {1B266}  sub      al, 0x4a                    
  {1B268}  inc      cx                          
  {1B269}  dec      bx                          
  {1B26A}  and      byte ptr [bp + di + 0x49], al
  {1B26D}  and      byte ptr [bp + di + 0x49], dl
  {1B270}  inc      bp                          
  {1B271}  and      byte ptr [bp + 0x55], cl    
  {1B274}  inc      sp                          
  {1B275}  pop      dx                          
  {1B276}  dec      cx                          
  {1B277}  and      byte ptr [si + 0x4f], dl    
  {1B27A}  and      byte ptr [di + 0x4d], cl    
  {1B27D}  dec      di                          
  {1B27E}  pop      dx                          
  {1B27F}  inc      bp                          
  {1B280}  push     bx                          
  {1B281}  pop      dx                          
  {1B282}  and      byte ptr [bx + si + 0x4f], dl
  {1B285}  dec      bp                          
  {1B286}  dec      di                          
  {1B287}  inc      bx                          
  {1B288}  and      byte ptr [di + 0x49], cl    
  {1B28B}  and      byte ptr [bx + 0x59], dl    
  {1B28E}  push     dx                          
  {1B28F}  pop      cx                          
  {1B290}  push     di                          
  {1B291}  inc      cx                          
  {1B292}  inc      bx                          
  {1B293}  and      byte ptr [bp + di + 0x48], al
  {1B296}  push     di                          
  {1B297}  inc      cx                          
  {1B298}  push     bx                          
  {1B299}  push     sp                          
  {1B29A}  pop      cx                          
  {1B29B}  and      byte ptr [si], ch           
  {1B29D}  and      byte ptr [bp + di + 0x5a], dl
  {1B2A0}  inc      bx                          
  {1B2A1}  pop      dx                          
  {1B2A2}  inc      bp                          
  {1B2A3}  inc      di                          
  {1B2A4}  dec      di                          
  {1B2A5}  dec      sp                          
  {1B2A6}  dec      si                          
  {1B2A7}  dec      cx                          
  {1B2A8}  inc      cx                          
  {1B2A9}  and      byte ptr [bp + si + 0x41], bl
  {1B2AC}  inc      dx                          
  {1B2AD}  dec      di                          
  {1B2AE}  dec      dx                          
  {1B2AF}  inc      bx                          
  {1B2B0}  pop      dx                          
  {1B2B1}  inc      cx                          
  {1B2B2}  and      byte ptr [si + 0x4c], al    
  {1B2B5}  inc      cx                          
  {1B2B6}  and      byte ptr [di + 0x4f], cl    
  {1B2B9}  dec      cx                          
  {1B2BA}  inc      bx                          
  {1B2BB}  dec      ax                          
  {1B2BC}  and      byte ptr [di + 0x41], cl    
  {1B2BF}  push     dx                          
  {1B2C0}  inc      bx                          
  {1B2C1}  dec      ax                          
  {1B2C2}  inc      bp                          
  {1B2C3}  push     di                          
  {1B2C4}  inc      bp                          
  {1B2C5}  inc      bx                          
  {1B2C6}  pop      dx                          
  {1B2C7}  inc      bp                          
  {1B2C8}  dec      bx                          
  {1B2C9}  dec      bx                          
  {1B2CA}  dec      dx                          
  {1B2CB}  inc      bp                          
  {1B2CC}  push     bx                          
  {1B2CD}  push     sp                          
  {1B2CE}  and      byte ptr [si + 0x41], dl    
  {1B2D1}  and      byte ptr [bx + 0x52], dl    
  {1B2D4}  inc      bp                          
  {1B2D5}  inc      sp                          
  {1B2D6}  dec      si                          
  {1B2D7}  inc      cx                          
  {1B2D8}  and      byte ptr [bx + si + 0x4f], dl
  {1B2DB}  dec      bx                          
  {1B2DC}  push     dx                          
  {1B2DD}  pop      dx                          
  {1B2DE}  pop      cx                          
  {1B2DF}  push     di                          
  {1B2E0}  inc      cx                          
  {1B2E1}  and      byte ptr [si], ch           
  {1B2E3}  and      byte ptr [bp + di + 0x5a], dl
  {1B2E6}  dec      bx                          
  {1B2E7}  dec      di                          
  {1B2E8}  inc      sp                          
  {1B2E9}  inc      cx                          
  {1B2EA}  and      byte ptr [bp + si + 0x45], bl
  {1B2ED}  and      byte ptr [si + 0x41], dl    
  {1B2F0}  dec      bx                          
  {1B2F1}  and      byte ptr [bp + si + 0x41], cl
  {1B2F4}  dec      bx                          
  {1B2F5}  and      byte ptr [bx + di + 0x4e], cl
  {1B2F8}  dec      si                          
  {1B2F9}  inc      bp                          
  {1B2FA}  and      byte ptr [bx + si + 0x4f], dl
  {1B2FD}  push     sp                          
  {1B2FE}  push     di                          
  {1B2FF}  dec      di                          
  {1B300}  push     dx                          
  {1B301}  pop      cx                          
  {1B302}  and      byte ptr [bp + di + 0x49], dl
  {1B305}  inc      bp                          
  {1B306}  and      byte ptr [bx + 0x44], cl    
  {1B309}  push     dx                          
  {1B30A}  inc      bp                          
  {1B30B}  inc      di                          
  {1B30C}  inc      bp                          
  {1B30D}  dec      si                          
  {1B30E}  inc      bp                          
  {1B30F}  push     dx                          
  {1B310}  dec      di                          
  {1B311}  push     di                          
  {1B312}  push     bp                          
  {1B313}  dec      dx                          
  {1B314}  inc      bp                          
  {1B315}  inc      dx                          
  {1B316}  inc      cx                          
  {1B317}  dec      sp                          
  {1B318}  inc      bp                          
  {1B319}  and      byte ptr [bp + si + 0x41], cl
  {1B31C}  dec      bx                          
  {1B31D}  and      byte ptr [bp + si + 0x41], cl
  {1B320}  and      byte ptr [bp + si + 0x41], bl
  {1B323}  inc      dx                          
  {1B324}  dec      cx                          
  {1B325}  dec      dx                          
  {1B326}  inc      bp                          
  {1B327}  push     bx                          
  {1B328}  pop      dx                          
  {1B329}  and      byte ptr [si], ch           
  {1B32B}  and      byte ptr [bx + si + 0x4f], dl
  {1B32E}  push     di                          
  {1B32F}  dec      cx                          
  {1B330}  inc      bp                          
  {1B331}  inc      sp                          
  {1B332}  pop      dx                          
  {1B333}  dec      bp                          
  {1B334}  pop      cx                          
  {1B335}  and      byte ptr [0x2e2e], ch       
  {1B339}  and      byte ptr [si], dh           
  {1B33B}  and      byte ptr [bp + si + 0x41], dl
  {1B33E}  pop      dx                          
  {1B33F}  pop      cx                          
  {1B340}  and      byte ptr [si + 0x4f], dl    
  {1B343}  and      byte ptr [di + 0x4f], cl    
  {1B346}  pop      dx                          
  {1B347}  inc      bp                          
  {1B348}  and      byte ptr [si + 0x41], al    
  {1B34B}  and      byte ptr [bp + di + 0x4f], dl
  {1B34E}  inc      dx                          
  {1B34F}  dec      cx                          
  {1B350}  inc      bp                          
  {1B351}  and      byte ptr [bp + di + 0x50], dl
  {1B354}  dec      di                          
  {1B355}  dec      bx                          
  {1B356}  dec      di                          
  {1B357}  dec      dx                          
  {1B358}  dec      dx                          
  {1B359}  inc      bx                          
  {1B35A}  dec      di                          
  {1B35B}  and      byte ptr [bp + di + 0x49], al
  {1B35E}  and      byte ptr [si + 0x41], al    
  {1B361}  dec      bp                          
  {1B362}  and      byte ptr [bx + 0x20], dl    
  {1B365}  pop      dx                          
  {1B366}  inc      cx                          
  {1B367}  dec      bp                          
  {1B368}  dec      cx                          
  {1B369}  inc      cx                          
  {1B36A}  dec      si                          
  {1B36B}  and      byte ptr [bx], bh           
  {1B36D}  and      byte ptr [si + 0x52], dl    
  {1B370}  dec      di                          
  {1B371}  inc      bx                          
  {1B372}  dec      ax                          
  {1B373}  inc      bp                          
  {1B374}  and      byte ptr [bp + di + 0x55], cl
  {1B377}  dec      si                          
  {1B378}  push     bx                          
  {1B379}  pop      dx                          
  {1B37A}  push     sp                          
  {1B37B}  push     bp                          
  {1B37C}  and      byte ptr [si], ch           
  {1B37E}  and      byte ptr [bx + di + 0x20], al
  {1B381}  dec      bp                          
  {1B382}  dec      di                          
  {1B383}  dec      dx                          
  {1B384}  and      byte ptr [bp + di + 0x54], dl
  {1B387}  inc      cx                          
  {1B388}  push     dx                          
  {1B389}  pop      cx                          
  {1B38A}  and      byte ptr [bx + si + 0x52], dl
  {1B38D}  inc      cx                          
  {1B38E}  inc      bx                          
  {1B38F}  push     bp                          
  {1B390}  dec      dx                          
  {1B391}  inc      bp                          
  {1B392}  and      byte ptr [bp + 0x41], cl    
  {1B395}  and      byte ptr [bp + di + 0x5a], al
  {1B398}  inc      cx                          
  {1B399}  push     dx                          
  {1B39A}  dec      si                          
  {1B39B}  pop      cx                          
  {1B39C}  dec      bp                          
  {1B39D}  and      byte ptr [bp + si + 0x59], dl
  {1B3A0}  dec      si                          
  {1B3A1}  dec      bx                          
  {1B3A2}  push     bp                          
  {1B3A3}  inc      dx                          
  {1B3A4}  push     sp                          
  {1B3A5}  dec      di                          
  {1B3A6}  and      byte ptr [bp + di + 0x4f], al
  {1B3A9}  and      byte ptr [bp + si + 0x41], bl
  {1B3AC}  inc      dx                          
  {1B3AD}  dec      cx                          
  {1B3AE}  dec      dx                          
  {1B3AF}  inc      bp                          
  {1B3B0}  push     bx                          
  {1B3B1}  pop      dx                          
  {1B3B2}  and      byte ptr [si + 0x45], dl    
  {1B3B5}  and      byte ptr [bp + si + 0x4f], dl
  {1B3B8}  push     bx                          
  {1B3B9}  dec      sp                          
  {1B3BA}  dec      cx                          
  {1B3BB}  dec      si                          
  {1B3BC}  pop      cx                          
  {1B3BD}  and      byte ptr [bp + di + 0x5a], al
  {1B3C0}  pop      cx                          
  {1B3C1}  and      byte ptr [bp + si + 0x45], al
  {1B3C4}  inc      sp                          
  {1B3C5}  pop      dx                          
  {1B3C6}  dec      cx                          
  {1B3C7}  inc      bp                          
  {1B3C8}  dec      bp                          
  {1B3C9}  pop      cx                          
  {1B3CA}  and      byte ptr [si + 0x55], dl    
  {1B3CD}  and      byte ptr [bp + di + 0x54], dl
  {1B3D0}  inc      cx                          
  {1B3D1}  inc      bx                          
  {1B3D2}  and      byte ptr [bp + si + 0x41], cl
  {1B3D5}  dec      bx                          
  {1B3D6}  and      byte ptr [bx + 0x53], cl    
  {1B3D9}  push     sp                          
  {1B3DA}  inc      cx                          
  {1B3DB}  push     sp                          
  {1B3DC}  dec      si                          
  {1B3DD}  dec      cx                          
  {1B3DE}  inc      bp                          
  {1B3DF}  and      byte ptr [si + 0x4f], cl    
  {1B3E2}  push     bx                          
  {1B3E3}  dec      cx                          
  {1B3E4}  inc      bp                          
  {1B3E5}  aas                                  
  {1B3E6}  dec      ax                          
  {1B3E7}  inc      sp                          
  {1B3E8}  pop      dx                          
  {1B3E9}  dec      cx                          
  {1B3EA}  inc      bp                          
  {1B3EB}  dec      bx                          
  {1B3EC}  dec      cx                          
  {1B3ED}  and      byte ptr [si + 0x5a], al    
  {1B3F0}  dec      cx                          
  {1B3F1}  inc      bp                          
  {1B3F2}  dec      bx                          
  {1B3F3}  dec      cx                          
  {1B3F4}  and      byte ptr [si], ch           
  {1B3F6}  and      byte ptr [si + 0x4f], dl    
  {1B3F9}  and      byte ptr [bp + si + 0x59], al
  {1B3FC}  dec      sp                          
  {1B3FD}  inc      cx                          
  {1B3FE}  and      byte ptr [si + 0x4f], al    
  {1B401}  inc      dx                          
  {1B402}  push     dx                          
  {1B403}  inc      cx                          
  {1B404}  and      byte ptr [bp + si + 0x4f], dl
  {1B407}  inc      dx                          
  {1B408}  dec      di                          
  {1B409}  push     sp                          
  {1B40A}  inc      cx                          
  {1B40B}  and      byte ptr [si], ch           
  {1B40D}  and      byte ptr [bx + 0x44], cl    
  {1B410}  and      byte ptr [si + 0x45], dl    
  {1B413}  push     dx                          
  {1B414}  inc      cx                          
  {1B415}  pop      dx                          
  {1B416}  and      byte ptr [di + 0x4f], cl    
  {1B419}  pop      dx                          
  {1B41A}  inc      bp                          
  {1B41B}  push     bx                          
  {1B41C}  pop      dx                          
  {1B41D}  and      byte ptr [bx + si + 0x49], dl
  {1B420}  push     bx                          
  {1B421}  inc      cx                          
  {1B422}  inc      bx                          
  {1B423}  and      byte ptr [bx + si + 0x52], dl
  {1B426}  pop      dx                          
  {1B427}  pop      cx                          
  {1B428}  and      byte ptr [di + 0x4e], cl    
  {1B42B}  dec      cx                          
  {1B42C}  inc      bp                          
  {1B42D}  and      byte ptr [bp + si], bh      
  {1B42F}  cmp      ax, 0x4553                  
  {1B432}  inc      bx                          
  {1B433}  push     dx                          
  {1B434}  inc      bp                          
  {1B435}  push     sp                          
  {1B436}  and      byte ptr [si + 0x49], cl    
  {1B439}  push     bx                          
  {1B43A}  push     sp                          
  {1B43B}  inc      cx                          
  {1B43C}  and      byte ptr [si], ch           
  {1B43E}  and      byte ptr [si + 0x4f], dl    
  {1B441}  and      byte ptr [di + 0x4f], cl    
  {1B444}  pop      dx                          
  {1B445}  inc      bp                          
  {1B446}  and      byte ptr [bx + di + 0x4b], al
  {1B449}  push     bp                          
  {1B44A}  push     dx                          
  {1B44B}  inc      cx                          
  {1B44C}  push     sp                          
  {1B44D}  and      byte ptr [bp + si + 0x45], al
  {1B450}  inc      sp                          
  {1B451}  inc      bp                          
  {1B452}  and      byte ptr [bp + di + 0x4f], al
  {1B455}  push     bx                          
  {1B456}  and      byte ptr [di + 0x49], cl    
  {1B459}  inc      cx                          
  {1B45A}  dec      sp                          
  {1B45B}  and      byte ptr [bp + 0x41], cl    
  {1B45E}  and      byte ptr [bp + si + 0x42], bl
  {1B461}  pop      cx                          
  {1B462}  inc      bx                          
  {1B463}  dec      cx                          
  {1B464}  push     bp                          
  {1B465}  and      byte ptr [si], ch           
  {1B467}  and      byte ptr [bx + di + 0x44], al
  {1B46A}  dec      cx                          
  {1B46B}  dec      di                          
  {1B46C}  push     bx                          
  {1B46D}  aaa                                  
  {1B46E}  sub      ax, 0x2d2d                  
  {1B471}  sub      ax, 0x2d2d                  
  {1B474}  sub      ax, 0x2d2d                  
  {1B477}  and      byte ptr [bp + si + 0x44], bl
  {1B47A}  dec      di                          
  {1B47B}  inc      dx                          
  {1B47C}  pop      cx                          
  {1B47D}  dec      sp                          
  {1B47E}  inc      bp                          
  {1B47F}  push     bx                          
  {1B480}  and      byte ptr [bx + di], dh      
  {1B482}  xor      dh, byte ptr [di]           
  {1B484}  and      byte ptr [bp + di + 0x55], cl
  {1B487}  dec      si                          
  {1B488}  push     bx                          
  {1B489}  pop      dx                          
  {1B48A}  push     sp                          
  {1B48B}  push     bp                          
  {1B48C}  and      byte ptr [di], ch           
  {1B48E}  sub      ax, 0x2d2d                  
  {1B491}  sub      ax, 0x2d2d                  
  {1B494}  sub      ax, 0x2d2d                  
  {1B497}  sub      ax, 0x2d2d                  
  {1B49A}  sub      ax, 0x2d2d                  
  {1B49D}  sub      ax, 0x2d2d                  
  {1B4A0}  sub      ax, 0x2d2d                  
  {1B4A3}  sub      ax, 0xc2d                   
  {1B4A6}  pop      dx                          
  {1B4A7}  inc      cx                          
  {1B4A8}  inc      dx                          
  {1B4A9}  dec      cx                          
  {1B4AA}  dec      dx                          
  {1B4AB}  and      byte ptr [bp + di + 0x5a], dl
  {1B4AE}  inc      bx                          
  {1B4AF}  pop      dx                          
  {1B4B0}  inc      cx                          
  {1B4B1}  push     di                          
  {1B4B2}  cvtps2pd xmm0, qword ptr [bx + di + 0x42]
  {1B4B6}  dec      cx                          
  {1B4B7}  dec      dx                          
  {1B4B8}  and      byte ptr [bp + di + 0x54], dl
  {1B4BB}  dec      di                          
  {1B4BC}  dec      bx                          
  {1B4BD}  push     dx                          
  {1B4BE}  dec      di                          
  {1B4BF}  push     sp                          
  {1B4C0}  dec      bx                          
  {1B4C1}  inc      cx                          
  {1B4C2}  adc      byte ptr [bp + si + 0x41], bl
  {1B4C5}  inc      dx                          
  {1B4C6}  dec      cx                          
  {1B4C7}  dec      dx                          
  {1B4C8}  and      byte ptr [bp + di + 0x4f], cl
  {1B4CB}  dec      si                          
  {1B4CC}  dec      cx                          
  {1B4CD}  inc      bx                          
  {1B4CE}  pop      dx                          
  {1B4CF}  pop      cx                          
  {1B4D0}  dec      si                          
  {1B4D1}  dec      bx                          
  {1B4D2}  inc      cx                          
  {1B4D3}  or       bx, word ptr [bp + si + 0x41]
  {1B4D6}  inc      dx                          
  {1B4D7}  dec      cx                          
  {1B4D8}  dec      dx                          
  {1B4D9}  and      byte ptr [di + 0x4c], cl    
  {1B4DC}  inc      bp                          
  {1B4DD}  inc      bx                          
  {1B4DE}  pop      dx                          
  {1B4DF}  adc      byte ptr [bp + si + 0x41], bl
  {1B4E2}  inc      dx                          
  {1B4E3}  dec      cx                          
  {1B4E4}  dec      dx                          
  {1B4E5}  and      byte ptr [si + 0x4d], al    
  {1B4E8}  push     bp                          
  {1B4E9}  inc      bx                          
  {1B4EA}  dec      ax                          
  {1B4EB}  inc      cx                          
  {1B4EC}  push     di                          
  {1B4ED}  dec      cx                          
  {1B4EE}  inc      bp                          
  {1B4EF}  inc      bx                          
  {1B4F0}  or       bl, byte ptr [bp + si + 0x41]
  {1B4F3}  inc      dx                          
  {1B4F4}  dec      cx                          
  {1B4F5}  dec      dx                          
  {1B4F6}  and      byte ptr [bp + si + 0x4f], dl
  {1B4F9}  pop      dx                          
  {1B4FA}  inc      cx                          
  {1B4FB}  or       bl, byte ptr [bp + si + 0x41]
  {1B4FE}  inc      dx                          
  {1B4FF}  dec      cx                          
  {1B500}  dec      dx                          
  {1B501}  and      byte ptr [bx + 0x53], cl    
  {1B504}  inc      bp                          
  {1B505}  push     sp                          
  {1B506}  or       al, 0x5a                    
  {1B508}  inc      cx                          
  {1B509}  inc      dx                          
  {1B50A}  dec      cx                          
  {1B50B}  dec      dx                          
  {1B50C}  and      byte ptr [di + 0x41], cl    
  {1B50F}  dec      sp                          
  {1B510}  dec      cx                          
  {1B511}  dec      si                          
  {1B512}  inc      cx                          
  {1B513}  or       al, 0x5a                    
  {1B515}  inc      cx                          
  {1B516}  inc      dx                          
  {1B517}  dec      cx                          
  {1B518}  dec      dx                          
  {1B519}  and      byte ptr [bx + di + 0x47], al
  {1B51C}  push     dx                          
  {1B51D}  inc      bp                          
  {1B51E}  push     bx                          
  {1B51F}  push     sp                          
  {1B520}  or       al, 0x5a                    
  {1B522}  inc      cx                          
  {1B523}  inc      dx                          
  {1B524}  dec      cx                          
  {1B525}  dec      dx                          
  {1B526}  and      byte ptr [bp + si + 0x45], cl
  {1B529}  pop      dx                          
  {1B52A}  pop      cx                          
  {1B52B}  dec      si                          
  {1B52C}  inc      cx                          
  {1B52D}  or       bx, word ptr [bp + si + 0x41]
  {1B530}  inc      dx                          
  {1B531}  dec      cx                          
  {1B532}  dec      dx                          
  {1B533}  and      byte ptr [si + 0x52], dl    
  {1B536}  inc      cx                          
  {1B537}  push     di                          
  {1B538}  inc      cx                          
  {1B539}  xor      cx, word ptr [bx + si + 0x41]
  {1B53C}  and      byte ptr [bx + si + 0x41], cl
  {1B53F}  and      byte ptr [bx + si + 0x41], cl
  {1B542}  and      byte ptr [bx + 0x4f], dl    
  {1B545}  dec      sp                          
  {1B546}  inc      cx                          
  {1B547}  dec      dx                          
  {1B548}  inc      cx                          
  {1B549}  and      byte ptr [bp + di + 0x45], dl
  {1B54C}  push     sp                          
  {1B54D}  dec      bx                          
  {1B54E}  dec      cx                          
  {1B54F}  and      byte ptr [si + 0x49], cl    
  {1B552}  push     bx                          
  {1B553}  inc      bx                          
  {1B554}  dec      cx                          
  {1B555}  and      byte ptr [si + 0x52], dl    
  {1B558}  inc      cx                          
  {1B559}  push     di                          
  {1B55A}  pop      cx                          
  {1B55B}  and      byte ptr [di], ch           
  {1B55D}  and      byte ptr [si + 0x4f], dl    
  {1B560}  and      byte ptr [bp + si + 0x45], al
  {1B563}  inc      sp                          
  {1B564}  pop      dx                          
  {1B565}  dec      cx                          
  {1B566}  inc      bp                          
  {1B567}  and      byte ptr [bx + 0x41], dl    
  {1B56A}  dec      sp                          
  {1B56B}  dec      bx                          
  {1B56C}  inc      cx                          
  {1B56D}  dec      cx                          
  {1B56E}  push     bp                          
  {1B56F}  inc      si                          
  {1B570}  inc      si                          
  {1B571}  and      byte ptr [bp + di + 0x54], dl
  {1B574}  push     dx                          
  {1B575}  push     bp                          
  {1B576}  inc      sp                          
  {1B577}  pop      dx                          
  {1B578}  dec      di                          
  {1B579}  dec      si                          
  {1B57A}  pop      cx                          
  {1B57B}  and      byte ptr [bx + si + 0x4f], dl
  {1B57E}  push     bx                          
  {1B57F}  push     sp                          
  {1B580}  inc      cx                          
  {1B581}  dec      si                          
  {1B582}  inc      cx                          
  {1B583}  push     di                          
  {1B584}  dec      cx                          
  {1B585}  inc      cx                          
  {1B586}  push     bx                          
  {1B587}  pop      dx                          
  {1B588}  and      byte ptr [bx + 0x44], cl    
  {1B58B}  push     ax                          
  {1B58C}  dec      di                          
  {1B58D}  inc      bx                          
  {1B58E}  pop      dx                          
  {1B58F}  inc      cx                          
  {1B590}  inc      bx                          
  {1B591}  and      byte ptr [si + 0x59], dl    
  {1B594}  dec      sp                          
  {1B595}  push     bp                          
  {1B596}  and      byte ptr [bx + si + 0x52], dl
  {1B599}  pop      dx                          
  {1B59A}  inc      bp                          
  {1B59B}  inc      bx                          
  {1B59C}  dec      cx                          
  {1B59D}  push     di                          
  {1B59E}  dec      si                          
  {1B59F}  dec      cx                          
  {1B5A0}  dec      bx                          
  {1B5A1}  dec      di                          
  {1B5A2}  push     di                          
  {1B5A3}  and      byte ptr [si + 0x41], al    
  {1B5A6}  push     di                          
  {1B5A7}  dec      si                          
  {1B5A8}  dec      di                          
  {1B5A9}  and      byte ptr [bp + 0x49], cl    
  {1B5AC}  inc      bp                          
  {1B5AD}  and      byte ptr [bx + 0x49], dl    
  {1B5B0}  inc      sp                          
  {1B5B1}  pop      dx                          
  {1B5B2}  dec      cx                          
  {1B5B3}  inc      cx                          
  {1B5B4}  dec      sp                          
  {1B5B5}  inc      bp                          
  {1B5B6}  push     bx                          
  {1B5B7}  push     bp                          
  {1B5B8}  mov      bp, sp                      
  {1B5BA}  xor      ax, ax                      
  {1B5BC}  lcall    0x1c71, 0x2cd               
  {1B5C1}  mov      di, 0x564                   
  {1B5C4}  push     ds                          
  {1B5C5}  push     di                          
  {1B5C6}  mov      di, 0x86c5                  
  {1B5C9}  push     cs                          
  {1B5CA}  push     di                          
  {1B5CB}  lcall    0x1c71, 0x9d7               
  {1B5D0}  jne      0x1b5ec                     
  {1B5D2}  mov      al, byte ptr [0x261]        
  {1B5D5}  cwde                                 
  {1B5D6}  cmp      ax, word ptr [0x1d6]        
  {1B5DA}  jne      0x1b5ec                     
  {1B5DC}  push     cs                          
  {1B5DD}  call     0x13dd0                     
  {1B5E0}  cmp      word ptr [0x1b0], 1         
  {1B5E5}  jge      0x1b5ec                     
  {1B5E7}  mov      byte ptr [0x261], 0         
  {1B5EC}  mov      di, 0x564                   
  {1B5EF}  push     ds                          
  {1B5F0}  push     di                          
  {1B5F1}  mov      di, 0x86d2                  
  {1B5F4}  push     cs                          
  {1B5F5}  push     di                          
  {1B5F6}  lcall    0x1c71, 0x9d7               
  {1B5FB}  jne      0x1b677                     
  {1B5FD}  mov      al, byte ptr [0x261]        
  {1B600}  cwde                                 
  {1B601}  cmp      ax, word ptr [0x1d6]        
  {1B605}  jne      0x1b677                     
  {1B607}  mov      di, 0x7a2                   
  {1B60A}  push     ds                          
  {1B60B}  push     di                          
  {1B60C}  mov      di, 0x86df                  
  {1B60F}  push     cs                          
  {1B610}  push     di                          
  {1B611}  xor      ax, ax                      
  {1B613}  push     ax                          
  {1B614}  lcall    0x1c71, 0x701               
  {1B619}  lcall    0x1c71, 0x5dd               
  {1B61E}  lcall    0x1c71, 0x291               
  {1B623}  mov      di, 0x7a2                   
  {1B626}  push     ds                          
  {1B627}  push     di                          
  {1B628}  mov      di, 0x8725                  
  {1B62B}  push     cs                          
  {1B62C}  push     di                          
  {1B62D}  xor      ax, ax                      
  {1B62F}  push     ax                          
  {1B630}  lcall    0x1c71, 0x701               
  {1B635}  lcall    0x1c71, 0x5dd               
  {1B63A}  lcall    0x1c71, 0x291               
  {1B63F}  mov      di, 0x7a2                   
  {1B642}  push     ds                          
  {1B643}  push     di                          
  {1B644}  mov      di, 0x8747                  
  {1B647}  push     cs                          
  {1B648}  push     di                          
  {1B649}  xor      ax, ax                      
  {1B64B}  push     ax                          
  {1B64C}  lcall    0x1c71, 0x701               
  {1B651}  lcall    0x1c71, 0x5dd               
  {1B656}  lcall    0x1c71, 0x291               
  {1B65B}  mov      di, 0x7a2                   
  {1B65E}  push     ds                          
  {1B65F}  push     di                          
  {1B660}  mov      di, 0x8769                  
  {1B663}  push     cs                          
  {1B664}  push     di                          
  {1B665}  xor      ax, ax                      
  {1B667}  push     ax                          
  {1B668}  lcall    0x1c71, 0x701               
  {1B66D}  lcall    0x1c71, 0x5dd               
  {1B672}  lcall    0x1c71, 0x291               
  {1B677}  mov      di, 0x564                   
  {1B67A}  push     ds                          
  {1B67B}  push     di                          
  {1B67C}  mov      di, 0x878b                  
  {1B67F}  push     cs                          
  {1B680}  push     di                          
  {1B681}  lcall    0x1c71, 0x9d7               
  {1B686}  jne      0x1b6e4                     
  {1B688}  cmp      word ptr [0x21c], 0         
  {1B68D}  jg       0x1b699                     
  {1B68F}  jl       0x1b6e4                     
  {1B691}  cmp      word ptr [0x21a], 0x18f     
  {1B697}  jbe      0x1b6e4                     
  {1B699}  mov      di, 0x7a2                   
  {1B69C}  push     ds                          
  {1B69D}  push     di                          
  {1B69E}  mov      di, 0x8798                  
  {1B6A1}  push     cs                          
  {1B6A2}  push     di                          
  {1B6A3}  xor      ax, ax                      
  {1B6A5}  push     ax                          
  {1B6A6}  lcall    0x1c71, 0x701               
  {1B6AB}  lcall    0x1c71, 0x5dd               
  {1B6B0}  lcall    0x1c71, 0x291               
  {1B6B5}  mov      ax, word ptr [0x21e]        
  {1B6B8}  mov      dx, word ptr [0x220]        
  {1B6BC}  sub      ax, 0xa                     
  {1B6BF}  sbb      dx, 0                       
  {1B6C2}  mov      word ptr [0x21e], ax        
  {1B6C5}  mov      word ptr [0x220], dx        
  {1B6C9}  mov      ax, word ptr [0x21a]        
  {1B6CC}  mov      dx, word ptr [0x21c]        
  {1B6D0}  sub      ax, 0x190                   
  {1B6D3}  sbb      dx, 0                       
  {1B6D6}  mov      word ptr [0x21a], ax        
  {1B6D9}  mov      word ptr [0x21c], dx        
  {1B6DD}  mov      ax, word ptr [0x182]        
  {1B6E0}  inc      ax                          
  {1B6E1}  mov      word ptr [0x182], ax           // PRZEDM.KUNSZT
  {1B6E4}  mov      di, 0x564                   
  {1B6E7}  push     ds                          
  {1B6E8}  push     di                          
  {1B6E9}  mov      di, 0x87de                  
  {1B6EC}  push     cs                          
  {1B6ED}  push     di                          
  {1B6EE}  lcall    0x1c71, 0x9d7               
  {1B6F3}  jne      0x1b751                     
  {1B6F5}  mov      al, byte ptr [0x261]        
  {1B6F8}  cwde                                 
  {1B6F9}  cmp      ax, word ptr [0x1d6]        
  {1B6FD}  jne      0x1b751                     
  {1B6FF}  cmp      word ptr [0x21c], 0         
  {1B704}  jg       0x1b710                     
  {1B706}  jl       0x1b751                     
  {1B708}  cmp      word ptr [0x21a], 0x12bf    
  {1B70E}  jbe      0x1b751                     
  {1B710}  mov      di, 0x7a2                   
  {1B713}  push     ds                          
  {1B714}  push     di                          
  {1B715}  mov      di, 0x87e9                  
  {1B718}  push     cs                          
  {1B719}  push     di                          
  {1B71A}  xor      ax, ax                      
  {1B71C}  push     ax                          
  {1B71D}  lcall    0x1c71, 0x701               
  {1B722}  lcall    0x1c71, 0x5dd               
  {1B727}  lcall    0x1c71, 0x291               
  {1B72C}  mov      ax, word ptr [0x21a]        
  {1B72F}  mov      dx, word ptr [0x21c]        
  {1B733}  sub      ax, 0x12c0                  
  {1B736}  sbb      dx, 0                       
  {1B739}  mov      word ptr [0x21a], ax        
  {1B73C}  mov      word ptr [0x21c], dx        
  {1B740}  mov      al, byte ptr [0x255]        
  {1B743}  cwde                                 
  {1B744}  sub      ax, 0xa                     
  {1B747}  mov      byte ptr [0x255], al        
  {1B74A}  mov      ax, word ptr [0x182]        
  {1B74D}  inc      ax                          
  {1B74E}  mov      word ptr [0x182], ax           // PRZEDM.KUNSZT
  {1B751}  mov      di, 0x564                   
  {1B754}  push     ds                          
  {1B755}  push     di                          
  {1B756}  mov      di, 0x8810                  
  {1B759}  push     cs                          
  {1B75A}  push     di                          
  {1B75B}  lcall    0x1c71, 0x9d7               
  {1B760}  je       0x1b765                     
  {1B762}  jmp      0x1b8b5                     
  {1B765}  mov      al, byte ptr [0x261]        
  {1B768}  cwde                                 
  {1B769}  cmp      ax, word ptr [0x1d6]        
  {1B76D}  je       0x1b772                     
  {1B76F}  jmp      0x1b8b5                     
  {1B772}  cmp      byte ptr [0x262], 0         
  {1B777}  je       0x1b77c                     
  {1B779}  jmp      0x1b829                     
  {1B77C}  mov      di, 0x7a2                   
  {1B77F}  push     ds                          
  {1B780}  push     di                          
  {1B781}  mov      di, 0x8821                  
  {1B784}  push     cs                          
  {1B785}  push     di                          
  {1B786}  xor      ax, ax                      
  {1B788}  push     ax                          
  {1B789}  lcall    0x1c71, 0x701               
  {1B78E}  lcall    0x1c71, 0x5dd               
  {1B793}  lcall    0x1c71, 0x291               
  {1B798}  mov      di, 0x7a2                   
  {1B79B}  push     ds                          
  {1B79C}  push     di                          
  {1B79D}  mov      di, 0x8866                  
  {1B7A0}  push     cs                          
  {1B7A1}  push     di                          
  {1B7A2}  xor      ax, ax                      
  {1B7A4}  push     ax                          
  {1B7A5}  lcall    0x1c71, 0x701               
  {1B7AA}  lcall    0x1c71, 0x5dd               
  {1B7AF}  lcall    0x1c71, 0x291               
  {1B7B4}  mov      di, 0x7a2                   
  {1B7B7}  push     ds                          
  {1B7B8}  push     di                          
  {1B7B9}  mov      di, 0x88ab                  
  {1B7BC}  push     cs                          
  {1B7BD}  push     di                          
  {1B7BE}  xor      ax, ax                      
  {1B7C0}  push     ax                          
  {1B7C1}  lcall    0x1c71, 0x701               
  {1B7C6}  lcall    0x1c71, 0x5dd               
  {1B7CB}  lcall    0x1c71, 0x291               
  {1B7D0}  mov      di, 0x7a2                   
  {1B7D3}  push     ds                          
  {1B7D4}  push     di                          
  {1B7D5}  mov      di, 0x88f9                  
  {1B7D8}  push     cs                          
  {1B7D9}  push     di                          
  {1B7DA}  xor      ax, ax                      
  {1B7DC}  push     ax                          
  {1B7DD}  lcall    0x1c71, 0x701               
  {1B7E2}  lcall    0x1c71, 0x5dd               
  {1B7E7}  lcall    0x1c71, 0x291               
  {1B7EC}  mov      di, 0x7a2                   
  {1B7EF}  push     ds                          
  {1B7F0}  push     di                          
  {1B7F1}  mov      di, 0x8945                  
  {1B7F4}  push     cs                          
  {1B7F5}  push     di                          
  {1B7F6}  xor      ax, ax                      
  {1B7F8}  push     ax                          
  {1B7F9}  lcall    0x1c71, 0x701               
  {1B7FE}  lcall    0x1c71, 0x5dd               
  {1B803}  lcall    0x1c71, 0x291               
  {1B808}  mov      di, 0x7a2                   
  {1B80B}  push     ds                          
  {1B80C}  push     di                          
  {1B80D}  mov      di, 0x8988                  
  {1B810}  push     cs                          
  {1B811}  push     di                          
  {1B812}  xor      ax, ax                      
  {1B814}  push     ax                          
  {1B815}  lcall    0x1c71, 0x701               
  {1B81A}  lcall    0x1c71, 0x5dd               
  {1B81F}  lcall    0x1c71, 0x291               
  {1B824}  mov      byte ptr [0x262], 0x4b      
  {1B829}  cmp      byte ptr [0x262], 0         
  {1B82E}  je       0x1b84c                     
  {1B830}  mov      di, 0x7a2                   
  {1B833}  push     ds                          
  {1B834}  push     di                          
  {1B835}  mov      di, 0x89d3                  
  {1B838}  push     cs                          
  {1B839}  push     di                          
  {1B83A}  xor      ax, ax                      
  {1B83C}  push     ax                          
  {1B83D}  lcall    0x1c71, 0x701               
  {1B842}  lcall    0x1c71, 0x5dd               
  {1B847}  lcall    0x1c71, 0x291               
  {1B84C}  cmp      byte ptr [0x262], 0x83      
  {1B851}  jne      0x1b8b5                     
  {1B853}  mov      di, 0x7a2                   
  {1B856}  push     ds                          
  {1B857}  push     di                          
  {1B858}  mov      di, 0x8a16                  
  {1B85B}  push     cs                          
  {1B85C}  push     di                          
  {1B85D}  xor      ax, ax                      
  {1B85F}  push     ax                          
  {1B860}  lcall    0x1c71, 0x701               
  {1B865}  lcall    0x1c71, 0x5dd               
  {1B86A}  lcall    0x1c71, 0x291               
  {1B86F}  mov      di, 0x7a2                   
  {1B872}  push     ds                          
  {1B873}  push     di                          
  {1B874}  mov      di, 0x8a5f                  
  {1B877}  push     cs                          
  {1B878}  push     di                          
  {1B879}  xor      ax, ax                      
  {1B87B}  push     ax                          
  {1B87C}  lcall    0x1c71, 0x701               
  {1B881}  lcall    0x1c71, 0x5dd               
  {1B886}  lcall    0x1c71, 0x291               
  {1B88B}  mov      byte ptr [0x262], 0         
  {1B890}  mov      ax, word ptr [0x1d4]        
  {1B893}  add      ax, 0x7d                    
  {1B896}  mov      word ptr [0x1d4], ax        
  {1B899}  mov      di, 0x7a2                   
  {1B89C}  push     ds                          
  {1B89D}  push     di                          
  {1B89E}  mov      di, 0x8a9d                  
  {1B8A1}  push     cs                          
  {1B8A2}  push     di                          
  {1B8A3}  xor      ax, ax                      
  {1B8A5}  push     ax                          
  {1B8A6}  lcall    0x1c71, 0x701               
  {1B8AB}  lcall    0x1c71, 0x5dd               
  {1B8B0}  lcall    0x1c71, 0x291               
  {1B8B5}  mov      di, 0x564                   
  {1B8B8}  push     ds                          
  {1B8B9}  push     di                          
  {1B8BA}  mov      di, 0x8ad5                  
  {1B8BD}  push     cs                          
  {1B8BE}  push     di                          
  {1B8BF}  lcall    0x1c71, 0x9d7               
  {1B8C4}  jne      0x1b8d8                     
  {1B8C6}  mov      ax, word ptr [0x232]        
  {1B8C9}  cmp      ax, word ptr [0x1d6]        
  {1B8CD}  jne      0x1b8d8                     
  {1B8CF}  push     cs                          
  {1B8D0}  call     0x13ca4                     
  {1B8D3}  xor      ax, ax                      
  {1B8D5}  mov      word ptr [0x232], ax        
  {1B8D8}  mov      di, 0x564                   
  {1B8DB}  push     ds                          
  {1B8DC}  push     di                          
  {1B8DD}  mov      di, 0x8ae2                  
  {1B8E0}  push     cs                          
  {1B8E1}  push     di                          
  {1B8E2}  lcall    0x1c71, 0x9d7               
  {1B8E7}  jne      0x1b902                     
  {1B8E9}  mov      ax, word ptr [0x234]        
  {1B8EC}  cmp      ax, word ptr [0x1d6]        
  {1B8F0}  jne      0x1b902                     
  {1B8F2}  push     cs                          
  {1B8F3}  call     0x13ca4                     
  {1B8F6}  cmp      word ptr [0x19c], 0         
  {1B8FB}  jle      0x1b902                     
  {1B8FD}  xor      ax, ax                      
  {1B8FF}  mov      word ptr [0x234], ax        
  {1B902}  mov      di, 0x564                   
  {1B905}  push     ds                          
  {1B906}  push     di                          
  {1B907}  mov      di, 0x8af2                  
  {1B90A}  push     cs                          
  {1B90B}  push     di                          
  {1B90C}  lcall    0x1c71, 0x9d7               
  {1B911}  jne      0x1b925                     
  {1B913}  mov      ax, word ptr [0x236]        
  {1B916}  cmp      ax, word ptr [0x1d6]        
  {1B91A}  jne      0x1b925                     
  {1B91C}  push     cs                          
  {1B91D}  call     0x13ca4                     
  {1B920}  xor      ax, ax                      
  {1B922}  mov      word ptr [0x236], ax        
  {1B925}  mov      di, 0x564                   
  {1B928}  push     ds                          
  {1B929}  push     di                          
  {1B92A}  mov      di, 0x8b03                  
  {1B92D}  push     cs                          
  {1B92E}  push     di                          
  {1B92F}  lcall    0x1c71, 0x9d7               
  {1B934}  jne      0x1b948                     
  {1B936}  mov      ax, word ptr [0x238]        
  {1B939}  cmp      ax, word ptr [0x1d6]        
  {1B93D}  jne      0x1b948                     
  {1B93F}  push     cs                          
  {1B940}  call     0x13ca4                     
  {1B943}  xor      ax, ax                      
  {1B945}  mov      word ptr [0x238], ax        
  {1B948}  mov      di, 0x564                   
  {1B94B}  push     ds                          
  {1B94C}  push     di                          
  {1B94D}  mov      di, 0x8b0f                  
  {1B950}  push     cs                          
  {1B951}  push     di                          
  {1B952}  lcall    0x1c71, 0x9d7               
  {1B957}  jne      0x1b96b                     
  {1B959}  mov      ax, word ptr [0x23a]        
  {1B95C}  cmp      ax, word ptr [0x1d6]        
  {1B960}  jne      0x1b96b                     
  {1B962}  push     cs                          
  {1B963}  call     0x13ca4                     
  {1B966}  xor      ax, ax                      
  {1B968}  mov      word ptr [0x23a], ax        
  {1B96B}  mov      di, 0x564                   
  {1B96E}  push     ds                          
  {1B96F}  push     di                          
  {1B970}  mov      di, 0x8b20                  
  {1B973}  push     cs                          
  {1B974}  push     di                          
  {1B975}  lcall    0x1c71, 0x9d7               
  {1B97A}  jne      0x1b995                     
  {1B97C}  mov      ax, word ptr [0x23c]        
  {1B97F}  cmp      ax, word ptr [0x1d6]        
  {1B983}  jne      0x1b995                     
  {1B985}  push     cs                          
  {1B986}  call     0x13dd0                     
  {1B989}  cmp      word ptr [0x19c], 0         
  {1B98E}  jle      0x1b995                     
  {1B990}  xor      ax, ax                      
  {1B992}  mov      word ptr [0x23c], ax        
  {1B995}  mov      di, 0x564                   
  {1B998}  push     ds                          
  {1B999}  push     di                          
  {1B99A}  mov      di, 0x8b2b                  
  {1B99D}  push     cs                          
  {1B99E}  push     di                          
  {1B99F}  lcall    0x1c71, 0x9d7               
  {1B9A4}  jne      0x1b9bf                     
  {1B9A6}  mov      ax, word ptr [0x240]        
  {1B9A9}  cmp      ax, word ptr [0x1d6]        
  {1B9AD}  jne      0x1b9bf                     
  {1B9AF}  push     cs                          
  {1B9B0}  call     0x13dd0                     
  {1B9B3}  cmp      word ptr [0x19c], 0         
  {1B9B8}  jle      0x1b9bf                     
  {1B9BA}  xor      ax, ax                      
  {1B9BC}  mov      word ptr [0x240], ax        
  {1B9BF}  mov      di, 0x564                   
  {1B9C2}  push     ds                          
  {1B9C3}  push     di                          
  {1B9C4}  mov      di, 0x8b36                  
  {1B9C7}  push     cs                          
  {1B9C8}  push     di                          
  {1B9C9}  lcall    0x1c71, 0x9d7               
  {1B9CE}  jne      0x1b9e9                     
  {1B9D0}  mov      ax, word ptr [0x244]        
  {1B9D3}  cmp      ax, word ptr [0x1d6]        
  {1B9D7}  jne      0x1b9e9                     
  {1B9D9}  push     cs                          
  {1B9DA}  call     0x13dd0                     
  {1B9DD}  cmp      word ptr [0x19c], 0         
  {1B9E2}  jle      0x1b9e9                     
  {1B9E4}  xor      ax, ax                      
  {1B9E6}  mov      word ptr [0x244], ax        
  {1B9E9}  mov      di, 0x564                   
  {1B9EC}  push     ds                          
  {1B9ED}  push     di                          
  {1B9EE}  mov      di, 0x8b43                  
  {1B9F1}  push     cs                          
  {1B9F2}  push     di                          
  {1B9F3}  lcall    0x1c71, 0x9d7               
  {1B9F8}  jne      0x1ba13                     
  {1B9FA}  mov      ax, word ptr [0x242]        
  {1B9FD}  cmp      ax, word ptr [0x1d6]        
  {1BA01}  jne      0x1ba13                     
  {1BA03}  push     cs                          
  {1BA04}  call     0x13dd0                     
  {1BA07}  cmp      word ptr [0x19c], 0         
  {1BA0C}  jle      0x1ba13                     
  {1BA0E}  xor      ax, ax                      
  {1BA10}  mov      word ptr [0x242], ax        
  {1BA13}  mov      di, 0x564                   
  {1BA16}  push     ds                          
  {1BA17}  push     di                          
  {1BA18}  mov      di, 0x8b50                  
  {1BA1B}  push     cs                          
  {1BA1C}  push     di                          
  {1BA1D}  lcall    0x1c71, 0x9d7               
  {1BA22}  jne      0x1ba3d                     
  {1BA24}  mov      ax, word ptr [0x23e]        
  {1BA27}  cmp      ax, word ptr [0x1d6]        
  {1BA2B}  jne      0x1ba3d                     
  {1BA2D}  push     cs                          
  {1BA2E}  call     0x13dd0                     
  {1BA31}  cmp      word ptr [0x19c], 0         
  {1BA36}  jle      0x1ba3d                     
  {1BA38}  xor      ax, ax                      
  {1BA3A}  mov      word ptr [0x23e], ax        
  {1BA3D}  mov      di, 0x564                   
  {1BA40}  push     ds                          
  {1BA41}  push     di                          
  {1BA42}  mov      di, 0x8b5d                  
  {1BA45}  push     cs                          
  {1BA46}  push     di                          
  {1BA47}  lcall    0x1c71, 0x9d7               
  {1BA4C}  jne      0x1bac2                     
  {1BA4E}  mov      ax, word ptr [0x246]        
  {1BA51}  cmp      ax, word ptr [0x1d6]        
  {1BA55}  jne      0x1bac2                     
  {1BA57}  mov      di, 0x7a2                   
  {1BA5A}  push     ds                          
  {1BA5B}  push     di                          
  {1BA5C}  mov      di, 0x8b69                  
  {1BA5F}  push     cs                          
  {1BA60}  push     di                          
  {1BA61}  xor      ax, ax                      
  {1BA63}  push     ax                          
  {1BA64}  lcall    0x1c71, 0x701               
  {1BA69}  lcall    0x1c71, 0x5dd               
  {1BA6E}  lcall    0x1c71, 0x291               
  {1BA73}  push     cs                          
  {1BA74}  call     0x13b82                     
  {1BA77}  cmp      word ptr [0x19c], 0         
  {1BA7C}  jle      0x1ba82                     
  {1BA7E}  push     cs                          
  {1BA7F}  call     0x13b82                     
  {1BA82}  cmp      word ptr [0x19c], 0         
  {1BA87}  jle      0x1ba8d                     
  {1BA89}  push     cs                          
  {1BA8A}  call     0x13b82                     
  {1BA8D}  cmp      word ptr [0x19c], 0         
  {1BA92}  jle      0x1ba98                     
  {1BA94}  push     cs                          
  {1BA95}  call     0x13b82                     
  {1BA98}  cmp      word ptr [0x19c], 0         
  {1BA9D}  jle      0x1bac2                     
  {1BA9F}  cmp      word ptr [0x1d2], 0         
  {1BAA4}  jne      0x1bac2                     
  {1BAA6}  mov      di, 0x7a2                   
  {1BAA9}  push     ds                          
  {1BAAA}  push     di                          
  {1BAAB}  mov      di, 0x8b9d                  
  {1BAAE}  push     cs                          
  {1BAAF}  push     di                          
  {1BAB0}  xor      ax, ax                      
  {1BAB2}  push     ax                          
  {1BAB3}  lcall    0x1c71, 0x701               
  {1BAB8}  lcall    0x1c71, 0x5dd               
  {1BABD}  lcall    0x1c71, 0x291               
  {1BAC2}  pop      bp                          
  {1BAC3}  retf                                 
  {1BAC4}  add      dl, byte ptr [bx + si + 0x4e]
  {1BAC7}  push     es                          
  {1BAC8}  push     ax                          
  {1BAC9}  dec      di                          
  {1BACA}  dec      sp                          
  {1BACB}  dec      si                          
  {1BACC}  dec      di                          
  {1BACD}  inc      bx                          
  {1BACE}  add      dl, byte ptr [bx + si + 0x44]
  {1BAD1}  or       byte ptr [bx + si + 0x4f], dl
  {1BAD4}  dec      sp                          
  {1BAD5}  dec      di                          
  {1BAD6}  inc      sp                          
  {1BAD7}  dec      si                          
  {1BAD8}  dec      cx                          
  {1BAD9}  inc      bp                          
  {1BADA}  add      word ptr [bx + 6], dx       
  {1BADD}  push     di                          
  {1BADE}  push     bx                          
  {1BADF}  inc      bx                          
  {1BAE0}  dec      ax                          
  {1BAE1}  dec      di                          
  {1BAE2}  inc      sp                          
  {1BAE3}  add      word ptr [bp + si + 6], bx  
  {1BAE6}  pop      dx                          
  {1BAE7}  inc      cx                          
  {1BAE8}  inc      bx                          
  {1BAE9}  dec      ax                          
  {1BAEA}  dec      di                          
  {1BAEB}  inc      sp                          
  {1BAEC}  add      word ptr [bx + 4], ax       
  {1BAEF}  inc      di                          
  {1BAF0}  dec      di                          
  {1BAF1}  push     dx                          
  {1BAF2}  inc      cx                          
  {1BAF3}  add      word ptr [si + 3], ax       
  {1BAF6}  inc      sp                          
  {1BAF7}  dec      di                          
  {1BAF8}  dec      sp                          
  {1BAF9}  add      word ptr [di + 4], ax       
  {1BAFC}  inc      bp                          
  {1BAFD}  pop      ax                          
  {1BAFE}  dec      cx                          
  {1BAFF}  push     sp                          
  {1BB00}  add      word ptr [di + 4], cx       
  {1BB03}  dec      bp                          
  {1BB04}  dec      di                          
  {1BB05}  inc      sp                          
  {1BB06}  inc      bp                          
  {1BB07}  push     bp                          
  {1BB08}  mov      bp, sp                      
  {1BB0A}  xor      ax, ax                      
  {1BB0C}  lcall    0x1c71, 0x2cd               
  {1BB11}  mov      di, 0x564                   
  {1BB14}  push     ds                          
  {1BB15}  push     di                          
  {1BB16}  mov      di, 0x90f4                  
  {1BB19}  push     cs                          
  {1BB1A}  push     di                          
  {1BB1B}  lcall    0x1c71, 0x9d7               
  {1BB20}  jne      0x1bb35                     
  {1BB22}  mov      di, 0x90f7                  
  {1BB25}  push     cs                          
  {1BB26}  push     di                          
  {1BB27}  mov      di, 0x564                   
  {1BB2A}  push     ds                          
  {1BB2B}  push     di                          
  {1BB2C}  mov      ax, 0xff                    
  {1BB2F}  push     ax                          
  {1BB30}  lcall    0x1c71, 0x900               
  {1BB35}  mov      di, 0x564                   
  {1BB38}  push     ds                          
  {1BB39}  push     di                          
  {1BB3A}  mov      di, 0x90fe                  
  {1BB3D}  push     cs                          
  {1BB3E}  push     di                          
  {1BB3F}  lcall    0x1c71, 0x9d7               
  {1BB44}  jne      0x1bb59                     
  {1BB46}  mov      di, 0x9101                  
  {1BB49}  push     cs                          
  {1BB4A}  push     di                          
  {1BB4B}  mov      di, 0x564                   
  {1BB4E}  push     ds                          
  {1BB4F}  push     di                          
  {1BB50}  mov      ax, 0xff                    
  {1BB53}  push     ax                          
  {1BB54}  lcall    0x1c71, 0x900               
  {1BB59}  mov      di, 0x564                   
  {1BB5C}  push     ds                          
  {1BB5D}  push     di                          
  {1BB5E}  mov      di, 0x910a                  
  {1BB61}  push     cs                          
  {1BB62}  push     di                          
  {1BB63}  lcall    0x1c71, 0x9d7               
  {1BB68}  jne      0x1bb7d                     
  {1BB6A}  mov      di, 0x910c                  
  {1BB6D}  push     cs                          
  {1BB6E}  push     di                          
  {1BB6F}  mov      di, 0x564                   
  {1BB72}  push     ds                          
  {1BB73}  push     di                          
  {1BB74}  mov      ax, 0xff                    
  {1BB77}  push     ax                          
  {1BB78}  lcall    0x1c71, 0x900               
  {1BB7D}  mov      di, 0x564                   
  {1BB80}  push     ds                          
  {1BB81}  push     di                          
  {1BB82}  mov      di, 0x9113                  
  {1BB85}  push     cs                          
  {1BB86}  push     di                          
  {1BB87}  lcall    0x1c71, 0x9d7               
  {1BB8C}  jne      0x1bba1                     
  {1BB8E}  mov      di, 0x9115                  
  {1BB91}  push     cs                          
  {1BB92}  push     di                          
  {1BB93}  mov      di, 0x564                   
  {1BB96}  push     ds                          
  {1BB97}  push     di                          
  {1BB98}  mov      ax, 0xff                    
  {1BB9B}  push     ax                          
  {1BB9C}  lcall    0x1c71, 0x900               
  {1BBA1}  mov      di, 0x564                   
  {1BBA4}  push     ds                          
  {1BBA5}  push     di                          
  {1BBA6}  mov      di, 0x911c                  
  {1BBA9}  push     cs                          
  {1BBAA}  push     di                          
  {1BBAB}  lcall    0x1c71, 0x9d7               
  {1BBB0}  jne      0x1bbc5                     
  {1BBB2}  mov      di, 0x911e                  
  {1BBB5}  push     cs                          
  {1BBB6}  push     di                          
  {1BBB7}  mov      di, 0x564                   
  {1BBBA}  push     ds                          
  {1BBBB}  push     di                          
  {1BBBC}  mov      ax, 0xff                    
  {1BBBF}  push     ax                          
  {1BBC0}  lcall    0x1c71, 0x900               
  {1BBC5}  mov      di, 0x564                   
  {1BBC8}  push     ds                          
  {1BBC9}  push     di                          
  {1BBCA}  mov      di, 0x9123                  
  {1BBCD}  push     cs                          
  {1BBCE}  push     di                          
  {1BBCF}  lcall    0x1c71, 0x9d7               
  {1BBD4}  jne      0x1bbe9                     
  {1BBD6}  mov      di, 0x9125                  
  {1BBD9}  push     cs                          
  {1BBDA}  push     di                          
  {1BBDB}  mov      di, 0x564                   
  {1BBDE}  push     ds                          
  {1BBDF}  push     di                          
  {1BBE0}  mov      ax, 0xff                    
  {1BBE3}  push     ax                          
  {1BBE4}  lcall    0x1c71, 0x900               
  {1BBE9}  mov      di, 0x564                   
  {1BBEC}  push     ds                          
  {1BBED}  push     di                          
  {1BBEE}  mov      di, 0x9129                  
  {1BBF1}  push     cs                          
  {1BBF2}  push     di                          
  {1BBF3}  lcall    0x1c71, 0x9d7               
  {1BBF8}  jne      0x1bc0d                     
  {1BBFA}  mov      di, 0x912b                  
  {1BBFD}  push     cs                          
  {1BBFE}  push     di                          
  {1BBFF}  mov      di, 0x564                   
  {1BC02}  push     ds                          
  {1BC03}  push     di                          
  {1BC04}  mov      ax, 0xff                    
  {1BC07}  push     ax                          
  {1BC08}  lcall    0x1c71, 0x900               
  {1BC0D}  mov      di, 0x564                   
  {1BC10}  push     ds                          
  {1BC11}  push     di                          
  {1BC12}  mov      di, 0x9130                  
  {1BC15}  push     cs                          
  {1BC16}  push     di                          
  {1BC17}  lcall    0x1c71, 0x9d7               
  {1BC1C}  jne      0x1bc31                     
  {1BC1E}  mov      di, 0x9132                  
  {1BC21}  push     cs                          
  {1BC22}  push     di                          
  {1BC23}  mov      di, 0x564                   
  {1BC26}  push     ds                          
  {1BC27}  push     di                          
  {1BC28}  mov      ax, 0xff                    
  {1BC2B}  push     ax                          
  {1BC2C}  lcall    0x1c71, 0x900               
  {1BC31}  pop      bp                          
  {1BC32}  retf                                 
  {1BC33}  push     bp                          
  {1BC34}  mov      bp, sp                      
  {1BC36}  xor      ax, ax                      
  {1BC38}  lcall    0x1c71, 0x2cd               
  {1BC3D}  pop      bp                          
  {1BC3E}  retf                                 
  {1BC3F}  add      byte ptr [bx + si], dl      
  {1BC41}  and      byte ptr [bx + si], ah      
  {1BC43}  and      byte ptr [bx + si], ah      
  {1BC45}  and      byte ptr [bx + si], ah      
  {1BC47}  and      byte ptr [bx + si], ah      
  {1BC49}  and      byte ptr [si + 0x7c], bh    
  {1BC4C}  jl       0x1bcca                     
  {1BC4E}  jl       0x1bccc                     
  {1BC50}  and      byte ptr [bx + di], dh      
  {1BC52}  and      byte ptr [bx + si], ah      
  {1BC54}  and      byte ptr [bx + si], ah      
  {1BC56}  and      byte ptr [bx + si], ah      
  {1BC58}  and      byte ptr [bx + si], ah      
  {1BC5A}  and      byte ptr [si + 0x7c], bh    
  {1BC5D}  jl       0x1bcdb                     
  {1BC5F}  jl       0x1bcdd                     
  {1BC61}  and      byte ptr [bx + si], ah      
  {1BC63}  and      byte ptr [bx + si], ah      
  {1BC65}  and      byte ptr [bx + si], ah      
  {1BC67}  and      byte ptr [bx + si], ah      
  {1BC69}  and      byte ptr [bx + si], ah      
  {1BC6B}  and      byte ptr [bx + si], ah      
  {1BC6D}  and      byte ptr [bx + si], ah      
  {1BC6F}  and      byte ptr [bx + si], ah      
  {1BC71}  and      byte ptr [bx + si], ah      
  {1BC73}  and      byte ptr [bx + si], ah      
  {1BC75}  and      byte ptr [di + 0x26], cl    
  {1BC78}  dec      bp                          
  {1BC79}  cmp      ax, 0x494d                  
  {1BC7C}  dec      sp                          
  {1BC7D}  pop      cx                          
  {1BC7E}  and      byte ptr [di + 0x55], cl    
  {1BC81}  inc      sp                          
  {1BC82}  and      byte ptr [si], dl           
  {1BC84}  and      byte ptr [bx + si], ah      
  {1BC86}  and      byte ptr [bx + si], ah      
  {1BC88}  and      byte ptr [bx + si], ah      
  {1BC8A}  and      byte ptr [bx + si], ah      
  {1BC8C}  and      byte ptr [si + 0x7c], bh    
  {1BC8F}  jl       0x1bd0d                     
  {1BC91}  jl       0x1bd0f                     
  {1BC93}  and      byte ptr [bx + si], ah      
  {1BC95}  and      byte ptr [bx + si], ah      
  {1BC97}  and      byte ptr [di], dh           
  {1BC99}  and      byte ptr [bx], ch           
  {1BC9B}  sub      ax, 0x2d2d                  
  {1BC9E}  sub      ax, 0x2d2d                  
  {1BCA1}  sub      ax, 0x2d2d                  
  {1BCA4}  sub      ax, 0x2d2d                  
  {1BCA7}  sub      ax, 0x2d2d                  
  {1BCAA}  sub      ax, 0x2d2d                  
  {1BCAD}  sub      ax, 0x2d2d                  
  {1BCB0}  sub      ax, 0x5c2d                  
  {1BCB3}  and      byte ptr [bx + si], ah      
  {1BCB5}  and      byte ptr [bx + si], ah      
  {1BCB7}  and      byte ptr [bx + si], ah      
  {1BCB9}  and      byte ptr [bx], ch           
  {1BCBB}  pop      sp                          
  {1BCBC}  and      byte ptr [bx + si], ah      
  {1BCBE}  das                                  
  {1BCBF}  pop      sp                          
  {1BCC0}  and      byte ptr [bx + si], ah      
  {1BCC2}  and      byte ptr [si + 0x20], bh    
  {1BCC5}  jl       0x1bce7                     
  {1BCC7}  and      byte ptr [bx + si], ah      
  {1BCC9}  pop      sp                          
  {1BCCA}  das                                  
  {1BCCC}  and      byte ptr [bx + si], ah      
  {1BCCE}  xor      di, word ptr [si + 0x20]    
  {1BCD1}  and      byte ptr [bx + si], ah      
  {1BCD3}  das                                  
  {1BCD4}  pop      sp                          
  {1BCD5}  and      byte ptr [bx + si], ah      
  {1BCD7}  and      byte ptr [bx + si], ah      
  {1BCD9}  and      byte ptr [bx + si], ah      
  {1BCDB}  and      byte ptr [bx + si], ah      
  {1BCDD}  and      byte ptr [bx + si], ah      
  {1BCDF}  and      byte ptr [bx], ch           
  {1BCE1}  pop      sp                          
  {1BCE2}  and      byte ptr [bx + si], ah      
  {1BCE4}  and      byte ptr [bx + si], ah      
  {1BCE6}  and      byte ptr [bx + si], ah      
  {1BCE8}  and      byte ptr [si + 0x20], bh    
  {1BCEB}  and      byte ptr [bx + si], ah      
  {1BCED}  and      byte ptr [bx + si], ah      
  {1BCEF}  das                                  
  {1BCF0}  and      byte ptr [bx + si], ah      
  {1BCF2}  pop      sp                          
  {1BCF3}  das                                  
  {1BCF4}  and      byte ptr [bx + si], ah      
  {1BCF6}  pop      sp                          
  {1BCF7}  and      byte ptr [bx + si], ah      
  {1BCF9}  jl       0x1bd1b                     
  {1BCFB}  jl       0x1bd5c                     
  {1BCFD}  pop      di                          
  {1BCFE}  and      byte ptr [bx + si], ah      
  {1BD00}  jl       0x1bd22                     
  {1BD02}  sbb      di, word ptr [si + 0x20]    
  {1BD05}  and      byte ptr [bx + si], ah      
  {1BD07}  pop      sp                          
  {1BD08}  das                                  
  {1BD09}  and      byte ptr [bx + si], ah      
  {1BD0B}  and      byte ptr [bx + si], ah      
  {1BD0D}  and      byte ptr [bx + si], ah      
  {1BD0F}  and      byte ptr [bx + si], ah      
  {1BD11}  and      byte ptr [bx + si], ah      
  {1BD13}  and      byte ptr [si + 0x2f], bl    
  {1BD16}  and      byte ptr [bx + si], ah      
  {1BD18}  and      byte ptr [bx + si], ah      
  {1BD1A}  and      byte ptr [bx + si], ah      
  {1BD1C}  and      byte ptr [si + 0x34], bh    
  {1BD1F}  jl       0x1bd41                     
  {1BD21}  and      byte ptr [bx + si], ah      
  {1BD23}  and      byte ptr [bx + si], ah      
  {1BD25}  and      byte ptr [bx + si], ah      
  {1BD27}  and      byte ptr [bx], ch           
  {1BD29}  and      byte ptr [bx + si], ah      
  {1BD2B}  and      byte ptr [bx + si], ah      
  {1BD2D}  and      byte ptr [bx + si], ah      
  {1BD2F}  and      byte ptr [bx + si], ah      
  {1BD31}  and      byte ptr [bx + si], ah      
  {1BD33}  and      byte ptr [bx + si], ah      
  {1BD35}  and      byte ptr [bx + si], ah      
  {1BD37}  and      byte ptr [bx + si], ah      
  {1BD39}  jl       0x1bd5b                     
  {1BD3B}  and      byte ptr [bx + si], ah      
  {1BD3D}  and      byte ptr [bx + si], ah      
  {1BD3F}  das                                  
  {1BD40}  pop      sp                          
  {1BD41}  and      byte ptr [bx + si], ah      
  {1BD43}  das                                  
  {1BD44}  pop      sp                          
  {1BD45}  and      byte ptr [bx + si], ah      
  {1BD47}  and      byte ptr [si + 0x20], bh    
  {1BD4A}  and      byte ptr [bx + si], ah      
  {1BD4C}  jl       0x1bd6e                     
  {1BD4E}  and      byte ptr [si + 0x2d], bh    
  {1BD51}  pop      sp                          
  {1BD52}  and      byte ptr [si], dh           
  {1BD54}  jl       0x1bd76                     
  {1BD56}  pop      sp                          
  {1BD57}  and      byte ptr [bx + si], ah      
  {1BD59}  and      byte ptr [bx + si], ah      
  {1BD5B}  and      byte ptr [bx], ch           
  {1BD5D}  pop      di                          
  {1BD5E}  pop      di                          
  {1BD5F}  pop      di                          
  {1BD60}  sub      word ptr [bx + si], sp      
  {1BD62}  and      byte ptr [bx + si], ah      
  {1BD64}  and      byte ptr [bx + si], ah      
  {1BD66}  and      byte ptr [bx], ch           
  {1BD68}  and      byte ptr [bx + si], ah      
  {1BD6A}  and      byte ptr [bx + si], ah      
  {1BD6C}  and      byte ptr [bx + si], ah      
  {1BD6E}  jl       0x1bd90                     
  {1BD70}  and      byte ptr [bx + si], ah      
  {1BD72}  and      byte ptr [bx], ch           
  {1BD74}  and      byte ptr [bx + si], ah      
  {1BD76}  pop      sp                          
  {1BD77}  das                                  
  {1BD78}  and      byte ptr [bx + si], ah      
  {1BD7A}  pop      sp                          
  {1BD7B}  and      byte ptr [bx + si], ah      
  {1BD7D}  jl       0x1bdde                     
  {1BD7F}  pop      di                          
  {1BD80}  pop      di                          
  {1BD81}  jl       0x1bda3                     
  {1BD83}  and      byte ptr [si + 0x5f], bh    
  {1BD86}  das                                  
  {1BD87}  and      byte ptr [bp + di], bl      
  {1BD89}  jl       0x1bdab                     
  {1BD8B}  and      byte ptr [si + 0x5f], bl    
  {1BD8E}  pop      di                          
  {1BD8F}  pop      di                          
  {1BD90}  pop      di                          
  {1BD91}  pop      di                          
  {1BD92}  pop      di                          
  {1BD93}  pop      di                          
  {1BD94}  pop      di                          
  {1BD95}  pop      di                          
  {1BD96}  pop      di                          
  {1BD97}  pop      di                          
  {1BD98}  pop      di                          
  {1BD99}  pop      di                          
  {1BD9A}  pop      di                          
  {1BD9B}  das                                  
  {1BD9C}  and      byte ptr [bx + si], ah      
  {1BD9E}  and      byte ptr [bx + si], ah      
  {1BDA0}  and      byte ptr [bx + si], ah      
  {1BDA2}  and      byte ptr [si + 0x1b], bh    
  {1BDA5}  jl       0x1bdc7                     
  {1BDA7}  and      byte ptr [bx + si], ah      
  {1BDA9}  pop      sp                          
  {1BDAA}  pop      di                          
  {1BDAB}  pop      di                          
  {1BDAC}  pop      di                          
  {1BDAD}  pop      di                          
  {1BDAE}  pop      di                          
  {1BDAF}  pop      di                          
  {1BDB0}  pop      di                          
  {1BDB1}  pop      di                          
  {1BDB2}  pop      di                          
  {1BDB3}  pop      di                          
  {1BDB4}  pop      di                          
  {1BDB5}  pop      di                          
  {1BDB6}  das                                  
  {1BDB7}  and      byte ptr [bx + si], ah      
  {1BDB9}  and      byte ptr [bx + si], ah      
  {1BDBB}  and      byte ptr [bx + si], ah      
  {1BDBD}  and      byte ptr [bx + si], ah      
  {1BDBF}  jl       0x1bddc                     
  {1BDC1}  pop      sp                          
  {1BDC2}  pop      di                          
  {1BDC3}  pop      di                          
  {1BDC4}  pop      di                          
  {1BDC5}  pop      di                          
  {1BDC6}  pop      di                          
  {1BDC7}  pop      di                          
  {1BDC8}  pop      di                          
  {1BDC9}  pop      di                          
  {1BDCA}  pop      di                          
  {1BDCB}  pop      di                          
  {1BDCC}  pop      di                          
  {1BDCD}  pop      di                          
  {1BDCE}  pop      di                          
  {1BDCF}  pop      di                          
  {1BDD0}  pop      di                          
  {1BDD1}  pop      di                          
  {1BDD2}  pop      di                          
  {1BDD3}  pop      di                          
  {1BDD4}  pop      di                          
  {1BDD5}  pop      di                          
  {1BDD6}  pop      di                          
  {1BDD7}  pop      di                          
  {1BDD8}  pop      di                          
  {1BDD9}  pop      di                          
  {1BDDA}  pop      di                          
  {1BDDB}  das                                  
  {1BDDC}  das                                  
  {1BDDD}  push     si                          
  {1BDDE}  inc      bp                          
  {1BDDF}  push     dx                          
  {1BDE0}  push     bx                          
  {1BDE1}  dec      dx                          
  {1BDE2}  inc      cx                          
  {1BDE3}  and      byte ptr [bp + di + 0x45], al
  {1BDE6}  push     sp                          
  {1BDE7}  inc      cx                          
  {1BDE8}  and      byte ptr [bx + si], dh      
  {1BDEA}  cmp      byte ptr cs:[0x3220], dh    
  {1BDEF}  xor      bp, word ptr [0x3530]       
  {1BDF3}  cmp      word ptr cs:[bx + di], di   
  {1BDF6}  and      byte ptr [di], ch           
  {1BDF8}  and      byte ptr [si + 0x41], cl    
  {1BDFB}  push     bx                          
  {1BDFC}  push     sp                          
  {1BDFD}  and      byte ptr [di + 0x4f], cl    
  {1BE00}  inc      sp                          
  {1BE01}  pop      cx                          
  {1BE02}  inc      si                          
  {1BE03}  dec      cx                          
  {1BE04}  dec      bx                          
  {1BE05}  inc      cx                          
  {1BE06}  inc      bx                          
  {1BE07}  dec      cx                          
  {1BE08}  dec      di                          
  {1BE09}  dec      si                          
  {1BE0A}  inc      bp                          
  {1BE0B}  dec      si                          
  {1BE0C}  sub      cl, byte ptr [bp + 0x41]    
  {1BE0F}  inc      bx                          
  {1BE10}  dec      cx                          
  {1BE11}  push     bx                          
  {1BE12}  dec      si                          
  {1BE13}  dec      cx                          
  {1BE14}  dec      dx                          
  {1BE15}  and      byte ptr [si + 0x4f], al    
  {1BE18}  push     di                          
  {1BE19}  dec      di                          
  {1BE1A}  dec      sp                          
  {1BE1B}  dec      si                          
  {1BE1C}  pop      cx                          
  {1BE1D}  and      byte ptr [bp + di + 0x4c], cl
  {1BE20}  inc      cx                          
  {1BE21}  push     di                          
  {1BE22}  dec      cx                          
  {1BE23}  push     bx                          
  {1BE24}  pop      dx                          
  {1BE25}  and      byte ptr [bx + di + 0x42], al
  {1BE28}  pop      cx                          
  {1BE29}  and      byte ptr [bp + si + 0x4f], dl
  {1BE2C}  pop      dx                          
  {1BE2D}  push     ax                          
  {1BE2E}  dec      di                          
  {1BE2F}  inc      bx                          
  {1BE30}  pop      dx                          
  {1BE31}  inc      cx                          
  {1BE32}  inc      bx                          
  {1BE33}  and      byte ptr [bx + 0x52], al    
  {1BE36}  inc      bp                          
  {1BE37}  sub      cl, byte ptr [bp + di + 0x4f]
  {1BE3A}  push     dx                          
  {1BE3B}  pop      dx                          
  {1BE3C}  pop      cx                          
  {1BE3D}  push     bx                          
  {1BE3E}  push     sp                          
  {1BE3F}  inc      cx                          
  {1BE40}  dec      dx                          
  {1BE41}  and      byte ptr [bp + si + 0x20], bl
  {1BE44}  inc      sp                          
  {1BE45}  push     bp                          
  {1BE46}  pop      dx                          
  {1BE47}  pop      cx                          
  {1BE48}  inc      bx                          
  {1BE49}  dec      ax                          
  {1BE4A}  and      byte ptr [si + 0x49], cl    
  {1BE4D}  push     sp                          
  {1BE4E}  inc      bp                          
  {1BE4F}  push     dx                          
  {1BE50}  and      byte ptr [bx + di], ah      
  {1BE52}  and      word ptr [bx + di], sp      
  {1BE54}  and      word ptr [bx + di], sp      
  {1BE56}  and      word ptr [bx + di], sp      
  {1BE58}  and      word ptr [bx + di], sp      
  {1BE5A}  and      word ptr [bx + di], sp      
  {1BE5C}  and      word ptr [bx + di], sp      
  {1BE5E}  and      word ptr [bx + di], sp      
  {1BE60}  and      word ptr [bx + di], sp      
  {1BE62}  or       byte ptr [si + 0x49], dl    
  {1BE65}  inc      bx                          
  {1BE66}  dec      bx                          
  {1BE67}  and      byte ptr [bx + di], ah      
  {1BE69}  and      word ptr [bx + di], sp      
  {1BE6B}  push     bp                          
  {1BE6C}  mov      bp, sp                      
  {1BE6E}  xor      ax, ax                      
  {1BE70}  lcall    0x1c71, 0x2cd               
  {1BE75}  lcall    0x1c0f, 0x1cc               
  {1BE7A}  mov      word ptr [0x664], 0x32      
  {1BE80}  mov      di, 0x7a2                   
  {1BE83}  push     ds                          
  {1BE84}  push     di                          
  {1BE85}  mov      di, 0                       
  {1BE88}  push     cs                          
  {1BE89}  push     di                          
  {1BE8A}  xor      ax, ax                      
  {1BE8C}  push     ax                          
  {1BE8D}  lcall    0x1c71, 0x701               
  {1BE92}  lcall    0x1c71, 0x5dd               
  {1BE97}  lcall    0x1c71, 0x291               
  {1BE9C}  mov      di, 0x7a2                   
  {1BE9F}  push     ds                          
  {1BEA0}  push     di                          
  {1BEA1}  mov      di, 0x11                    
  {1BEA4}  push     cs                          
  {1BEA5}  push     di                          
  {1BEA6}  xor      ax, ax                      
  {1BEA8}  push     ax                          
  {1BEA9}  lcall    0x1c71, 0x701               
  {1BEAE}  lcall    0x1c71, 0x5dd               
  {1BEB3}  lcall    0x1c71, 0x291               
  {1BEB8}  mov      di, 0x7a2                   
  {1BEBB}  push     ds                          
  {1BEBC}  push     di                          
  {1BEBD}  mov      di, 0x43                    
  {1BEC0}  push     cs                          
  {1BEC1}  push     di                          
  {1BEC2}  xor      ax, ax                      
  {1BEC4}  push     ax                          
  {1BEC5}  lcall    0x1c71, 0x701               
  {1BECA}  lcall    0x1c71, 0x5dd               
  {1BECF}  lcall    0x1c71, 0x291               
  {1BED4}  mov      di, 0x7a2                   
  {1BED7}  push     ds                          
  {1BED8}  push     di                          
  {1BED9}  mov      di, 0x58                    
  {1BEDC}  push     cs                          
  {1BEDD}  push     di                          
  {1BEDE}  xor      ax, ax                      
  {1BEE0}  push     ax                          
  {1BEE1}  lcall    0x1c71, 0x701               
  {1BEE6}  lcall    0x1c71, 0x5dd               
  {1BEEB}  lcall    0x1c71, 0x291               
  {1BEF0}  mov      di, 0x7a2                   
  {1BEF3}  push     ds                          
  {1BEF4}  push     di                          
  {1BEF5}  mov      di, 0x8e                    
  {1BEF8}  push     cs                          
  {1BEF9}  push     di                          
  {1BEFA}  xor      ax, ax                      
  {1BEFC}  push     ax                          
  {1BEFD}  lcall    0x1c71, 0x701               
  {1BF02}  lcall    0x1c71, 0x5dd               
  {1BF07}  lcall    0x1c71, 0x291               
  {1BF0C}  mov      di, 0x7a2                   
  {1BF0F}  push     ds                          
  {1BF10}  push     di                          
  {1BF11}  mov      di, 0xc2                    
  {1BF14}  push     cs                          
  {1BF15}  push     di                          
  {1BF16}  xor      ax, ax                      
  {1BF18}  push     ax                          
  {1BF19}  lcall    0x1c71, 0x701               
  {1BF1E}  lcall    0x1c71, 0x5dd               
  {1BF23}  lcall    0x1c71, 0x291               
  {1BF28}  mov      di, 0x7a2                   
  {1BF2B}  push     ds                          
  {1BF2C}  push     di                          
  {1BF2D}  mov      di, 0xde                    
  {1BF30}  push     cs                          
  {1BF31}  push     di                          
  {1BF32}  xor      ax, ax                      
  {1BF34}  push     ax                          
  {1BF35}  lcall    0x1c71, 0x701               
  {1BF3A}  lcall    0x1c71, 0x5dd               
  {1BF3F}  lcall    0x1c71, 0x291               
  {1BF44}  mov      di, 0x7a2                   
  {1BF47}  push     ds                          
  {1BF48}  push     di                          
  {1BF49}  mov      di, 0x113                   
  {1BF4C}  push     cs                          
  {1BF4D}  push     di                          
  {1BF4E}  xor      ax, ax                      
  {1BF50}  push     ax                          
  {1BF51}  lcall    0x1c71, 0x701               
  {1BF56}  lcall    0x1c71, 0x5dd               
  {1BF5B}  lcall    0x1c71, 0x291               
  {1BF60}  mov      di, 0x7a2                   
  {1BF63}  push     ds                          
  {1BF64}  push     di                          
  {1BF65}  mov      di, 0x148                   
  {1BF68}  push     cs                          
  {1BF69}  push     di                          
  {1BF6A}  xor      ax, ax                      
  {1BF6C}  push     ax                          
  {1BF6D}  lcall    0x1c71, 0x701               
  {1BF72}  lcall    0x1c71, 0x5dd               
  {1BF77}  lcall    0x1c71, 0x291               
  {1BF7C}  mov      di, 0x7a2                   
  {1BF7F}  push     ds                          
  {1BF80}  push     di                          
  {1BF81}  mov      di, 0x164                   
  {1BF84}  push     cs                          
  {1BF85}  push     di                          
  {1BF86}  xor      ax, ax                      
  {1BF88}  push     ax                          
  {1BF89}  lcall    0x1c71, 0x701               
  {1BF8E}  lcall    0x1c71, 0x5dd               
  {1BF93}  lcall    0x1c71, 0x291               
  {1BF98}  mov      di, 0x7a2                   
  {1BF9B}  push     ds                          
  {1BF9C}  push     di                          
  {1BF9D}  mov      di, 0x180                   
  {1BFA0}  push     cs                          
  {1BFA1}  push     di                          
  {1BFA2}  xor      ax, ax                      
  {1BFA4}  push     ax                          
  {1BFA5}  lcall    0x1c71, 0x701               
  {1BFAA}  lcall    0x1c71, 0x5dd               
  {1BFAF}  lcall    0x1c71, 0x291               
  {1BFB4}  mov      di, 0x7a2                   
  {1BFB7}  push     ds                          
  {1BFB8}  push     di                          
  {1BFB9}  mov      di, 0x19c                   
  {1BFBC}  push     cs                          
  {1BFBD}  push     di                          
  {1BFBE}  xor      ax, ax                      
  {1BFC0}  push     ax                          
  {1BFC1}  lcall    0x1c71, 0x701               
  {1BFC6}  lcall    0x1c71, 0x5dd               
  {1BFCB}  lcall    0x1c71, 0x291               
  {1BFD0}  mov      di, 0x7a2                   
  {1BFD3}  push     ds                          
  {1BFD4}  push     di                          
  {1BFD5}  mov      di, 0x1cc                   
  {1BFD8}  push     cs                          
  {1BFD9}  push     di                          
  {1BFDA}  xor      ax, ax                      
  {1BFDC}  push     ax                          
  {1BFDD}  lcall    0x1c71, 0x701               
  {1BFE2}  lcall    0x1c71, 0x5dd               
  {1BFE7}  lcall    0x1c71, 0x291               
  {1BFEC}  mov      di, 0x7a2                   
  {1BFEF}  push     ds                          
  {1BFF0}  push     di                          
  {1BFF1}  mov      di, 0x1f7                   
  {1BFF4}  push     cs                          
  {1BFF5}  push     di                          
  {1BFF6}  xor      ax, ax                      
  {1BFF8}  push     ax                          
  {1BFF9}  lcall    0x1c71, 0x701               
  {1BFFE}  lcall    0x1c71, 0x5dd               
  {1C003}  lcall    0x1c71, 0x291               
  {1C008}  mov      ax, 0x64                    
  {1C00B}  push     ax                          
  {1C00C}  lcall    0x1c0f, 0x2d4               
  {1C011}  mov      ax, 0x64                    
  {1C014}  push     ax                          
  {1C015}  lcall    0x1c0f, 0x2a8               
  {1C01A}  mov      ax, 0xc8                    
  {1C01D}  push     ax                          
  {1C01E}  lcall    0x1c0f, 0x2d4               
  {1C023}  mov      ax, 0x64                    
  {1C026}  push     ax                          
  {1C027}  lcall    0x1c0f, 0x2a8               
  {1C02C}  mov      ax, 0x12c                   
  {1C02F}  push     ax                          
  {1C030}  lcall    0x1c0f, 0x2d4               
  {1C035}  mov      ax, 0x64                    
  {1C038}  push     ax                          
  {1C039}  lcall    0x1c0f, 0x2a8               
  {1C03E}  mov      ax, 0x190                   
  {1C041}  push     ax                          
  {1C042}  lcall    0x1c0f, 0x2d4               
  {1C047}  mov      ax, 0x64                    
  {1C04A}  push     ax                          
  {1C04B}  lcall    0x1c0f, 0x2a8               
  {1C050}  mov      ax, 0x1f4                   
  {1C053}  push     ax                          
  {1C054}  lcall    0x1c0f, 0x2d4               
  {1C059}  mov      ax, 0x64                    
  {1C05C}  push     ax                          
  {1C05D}  lcall    0x1c0f, 0x2a8               
  {1C062}  mov      ax, 0x258                   
  {1C065}  push     ax                          
  {1C066}  lcall    0x1c0f, 0x2d4               
  {1C06B}  mov      ax, 0x64                    
  {1C06E}  push     ax                          
  {1C06F}  lcall    0x1c0f, 0x2a8               
  {1C074}  mov      ax, 0x1f4                   
  {1C077}  push     ax                          
  {1C078}  lcall    0x1c0f, 0x2d4               
  {1C07D}  mov      ax, 0x64                    
  {1C080}  push     ax                          
  {1C081}  lcall    0x1c0f, 0x2a8               
  {1C086}  mov      ax, 0x190                   
  {1C089}  push     ax                          
  {1C08A}  lcall    0x1c0f, 0x2d4               
  {1C08F}  mov      ax, 0x64                    
  {1C092}  push     ax                          
  {1C093}  lcall    0x1c0f, 0x2a8               
  {1C098}  mov      ax, 0x12c                   
  {1C09B}  push     ax                          
  {1C09C}  lcall    0x1c0f, 0x2d4               
  {1C0A1}  mov      ax, 0x64                    
  {1C0A4}  push     ax                          
  {1C0A5}  lcall    0x1c0f, 0x2a8               
  {1C0AA}  mov      ax, 0xc8                    
  {1C0AD}  push     ax                          
  {1C0AE}  lcall    0x1c0f, 0x2d4               
  {1C0B3}  mov      ax, 0x64                    
  {1C0B6}  push     ax                          
  {1C0B7}  lcall    0x1c0f, 0x2a8               
  {1C0BC}  mov      di, 0x7a2                   
  {1C0BF}  push     ds                          
  {1C0C0}  push     di                          
  {1C0C1}  mov      di, 0x222                   
  {1C0C4}  push     cs                          
  {1C0C5}  push     di                          
  {1C0C6}  xor      ax, ax                      
  {1C0C8}  push     ax                          
  {1C0C9}  lcall    0x1c71, 0x701               
  {1C0CE}  lcall    0x1c71, 0x5dd               
  {1C0D3}  lcall    0x1c71, 0x291               
  {1C0D8}  lcall    0x1c0f, 0x308               
  {1C0DD}  or       al, al                      
  {1C0DF}  jne      0x1c0e4                     
  {1C0E1}  jmp      0x1c008                     
  {1C0E4}  lcall    0x1c0f, 0x301               
  {1C0E9}  pop      bp                          
  {1C0EA}  retf                                 
  {1C0EB}  add      byte ptr [bx + si], al      
  {1C0ED}  add      byte ptr [bx + si], al      
  {1C0EF}  add      byte ptr [di - 0x77], dl    
  {1C0F2}  in       ax, 0xb8                    
  {1C0F4}  inc      word ptr [bx + si]          
  {1C0F6}  lcall    0x1c71, 0x116               
  {1C0FB}  pop      bp                          
  {1C0FC}  ret                                  
  {1C0FD}  push     bp                          
  {1C0FE}  mov      bp, sp                      
  {1C100}  call     0x1c12b                     
  {1C103}  mov      di, 0x6a2                   
  {1C106}  push     ds                          
  {1C107}  push     di                          
  {1C108}  push     cs                          
  {1C109}  call     0x1c42c                     
  {1C10C}  mov      di, 0x6a2                   
  {1C10F}  push     ds                          
  {1C110}  push     di                          
  {1C111}  lcall    0x1c71, 0x364               
  {1C116}  mov      di, 0x7a2                   
  {1C119}  push     ds                          
  {1C11A}  push     di                          
  {1C11B}  push     cs                          
  {1C11C}  call     0x1c42c                     
  {1C11F}  mov      di, 0x7a2                   
  {1C122}  push     ds                          
  {1C123}  push     di                          
  {1C124}  lcall    0x1c71, 0x369               
  {1C129}  pop      bp                          
  {1C12A}  retf                                 
  {1C12B}  mov      ah, 0xf                     
  {1C12D}  call     0x1c704                     
  {1C130}  cmp      al, 7                       
  {1C132}  je       0x1c13e                     
  {1C134}  cmp      al, 3                       
  {1C136}  jbe      0x1c13e                     
  {1C138}  mov      ax, 3                       
  {1C13B}  call     0x1c193                     
  {1C13E}  call     0x1c1e0                     
  {1C141}  mov      ah, 8                       
  {1C143}  xor      bh, bh                      
  {1C145}  call     0x1c704                     
  {1C148}  mov      al, ah                      
  {1C14A}  and      al, 0x7f                    
  {1C14C}  mov      byte ptr [0x69e], al        
  {1C14F}  mov      byte ptr [0x694], al        
  {1C152}  xor      ax, ax                      
  {1C154}  mov      byte ptr [0x68f], al        
  {1C157}  mov      byte ptr [0x69f], al        
  {1C15A}  mov      byte ptr [0x6a0], al        
  {1C15D}  inc      ax                          
  {1C15E}  mov      byte ptr [0x68e], al        
  {1C161}  mov      es, word ptr [0x44]         
  {1C165}  mov      di, 0x6c                    
  {1C168}  mov      bl, byte ptr es:[di]        
  {1C16B}  cmp      bl, byte ptr es:[di]        
  {1C16E}  je       0x1c16b                     
  {1C170}  mov      bl, byte ptr es:[di]        
  {1C173}  mov      ax, 0xffe4                  
  {1C176}  cdq                                  
  {1C177}  call     0x1c3b6                     
  {1C17A}  not      ax                          
  {1C17C}  not      dx                          
  {1C17E}  mov      cx, 0x37                    
  {1C181}  div      cx                          
  {1C183}  mov      word ptr [0x69a], ax        
  {1C186}  push     ds                          
  {1C187}  push     cs                          
  {1C188}  pop      ds                          
  {1C189}  mov      dx, 0x138                   
  {1C18C}  mov      ax, 0x251b                  
  {1C18F}  int      0x21                        
  {1C191}  pop      ds                          
  {1C192}  ret                                  
  {1C193}  mov      es, word ptr [0x44]         
  {1C197}  and      byte ptr es:[0x87], 0xfe    
  {1C19D}  cmp      al, 7                       
  {1C19F}  je       0x1c1a7                     
  {1C1A1}  cmp      al, 4                       
  {1C1A3}  jb       0x1c1a7                     
  {1C1A5}  mov      al, 3                       
  {1C1A7}  push     ax                          
  {1C1A8}  mov      ah, 0                       
  {1C1AA}  call     0x1c704                     
  {1C1AD}  pop      ax                          
  {1C1AE}  or       ah, ah                      
  {1C1B0}  je       0x1c1df                     
  {1C1B2}  mov      ax, 0x1112                  
  {1C1B5}  mov      bl, 0                       
  {1C1B7}  call     0x1c704                     
  {1C1BA}  mov      ax, 0x1130                  
  {1C1BD}  mov      bh, 0                       
  {1C1BF}  mov      dl, 0                       
  {1C1C1}  call     0x1c704                     
  {1C1C4}  cmp      dl, 0x2a                    
  {1C1C7}  jne      0x1c1df                     
  {1C1C9}  or       byte ptr es:[0x87], 1       
  {1C1CF}  mov      ax, 0x100                   
  {1C1D2}  mov      cx, 0x600                   
  {1C1D5}  call     0x1c704                     
  {1C1D8}  mov      ah, 0x12                    
  {1C1DA}  mov      bl, 0x20                    
  {1C1DC}  call     0x1c704                     
  {1C1DF}  ret                                  
  {1C1E0}  mov      ah, 0xf                     
  {1C1E2}  call     0x1c704                     
  {1C1E5}  push     ax                          
  {1C1E6}  mov      ax, 0x1130                  
  {1C1E9}  mov      bh, 0                       
  {1C1EB}  mov      dl, 0                       
  {1C1ED}  call     0x1c704                     
  {1C1F0}  pop      ax                          
  {1C1F1}  mov      cl, 0                       
  {1C1F3}  or       dl, dl                      
  {1C1F5}  jne      0x1c1ff                     
  {1C1F7}  mov      dl, 0x18                    
  {1C1F9}  cmp      al, 3                       
  {1C1FB}  ja       0x1c1ff                     
  {1C1FD}  mov      cl, 1                       
  {1C1FF}  mov      dh, dl                      
  {1C201}  mov      dl, ah                      
  {1C203}  dec      dl                          
  {1C205}  mov      ah, 0                       
  {1C207}  cmp      dh, 0x18                    
  {1C20A}  jbe      0x1c20e                     
  {1C20C}  mov      ah, 1                       
  {1C20E}  mov      word ptr [0x692], ax        
  {1C211}  mov      word ptr [0x69c], dx        
  {1C215}  mov      byte ptr [0x691], cl        
  {1C219}  mov      byte ptr [0x690], 1         
  {1C21E}  xor      ax, ax                      
  {1C220}  mov      word ptr [0x696], ax        
  {1C223}  mov      word ptr [0x698], dx        
  {1C227}  ret                                  
  {1C228}  push     ax                          
  {1C229}  push     ds                          
  {1C22A}  mov      ax, 0x1d49                  
  {1C22D}  mov      ds, ax                      
  {1C22F}  cmp      byte ptr [0x68e], 0         
  {1C234}  je       0x1c23b                     
  {1C236}  mov      byte ptr [0x6a0], 1         
  {1C23B}  pop      ds                          
  {1C23C}  pop      ax                          
  {1C23D}  iret                                 
  {1C23E}  cmp      byte ptr [0x6a0], 0         
  {1C243}  jne      0x1c246                     
  {1C245}  ret                                  
  {1C246}  mov      byte ptr [0x6a0], 0         
  {1C24B}  mov      ah, 1                       
  {1C24D}  int      0x16                        
  {1C24F}  je       0x1c257                     
  {1C251}  mov      ah, 0                       
  {1C253}  int      0x16                        
  {1C255}  jmp      0x1c24b                     
  {1C257}  mov      al, 0x5e                    
  {1C259}  call     0x1c579                     
  {1C25C}  mov      al, 0x43                    
  {1C25E}  call     0x1c579                     
  {1C261}  call     0x1c572                     
  {1C264}  jmp      0x1c0f0                     
  {1C267}  mov      bx, sp                      
  {1C269}  mov      ax, word ptr ss:[bx + 4]    
  {1C26D}  call     0x1c193                     
  {1C270}  call     0x1c1e0                     
  {1C273}  mov      al, byte ptr [0x69e]        
  {1C276}  mov      byte ptr [0x694], al        
  {1C279}  retf     2                           
  {1C27C}  mov      bx, sp                      
  {1C27E}  mov      dl, byte ptr ss:[bx + 0xa]  
  {1C282}  mov      dh, byte ptr ss:[bx + 8]    
  {1C286}  mov      cl, byte ptr ss:[bx + 6]    
  {1C28A}  mov      ch, byte ptr ss:[bx + 4]    
  {1C28E}  cmp      dl, cl                      
  {1C290}  ja       0x1c2b9                     
  {1C292}  cmp      dh, ch                      
  {1C294}  ja       0x1c2b9                     
  {1C296}  dec      dl                          
  {1C298}  js       0x1c2b9                     
  {1C29A}  dec      dh                          
  {1C29C}  js       0x1c2b9                     
  {1C29E}  dec      cl                          
  {1C2A0}  cmp      cl, byte ptr [0x69c]        
  {1C2A4}  ja       0x1c2b9                     
  {1C2A6}  dec      ch                          
  {1C2A8}  cmp      ch, byte ptr [0x69d]        
  {1C2AC}  ja       0x1c2b9                     
  {1C2AE}  mov      word ptr [0x696], dx        
  {1C2B2}  mov      word ptr [0x698], cx        
  {1C2B6}  call     0x1c5fa                     
  {1C2B9}  retf     8                           
  {1C2BC}  mov      ax, 0x600                   
  {1C2BF}  mov      bh, byte ptr [0x694]        
  {1C2C3}  mov      cx, word ptr [0x696]        
  {1C2C7}  mov      dx, word ptr [0x698]        
  {1C2CB}  call     0x1c704                     
  {1C2CE}  mov      dx, word ptr [0x696]        
  {1C2D2}  call     0x1c5fa                     
  {1C2D5}  retf                                 
  {1C2D6}  call     0x1c5f3                     
  {1C2D9}  mov      ax, 0x600                   
  {1C2DC}  mov      bh, byte ptr [0x694]        
  {1C2E0}  mov      cx, dx                      
  {1C2E2}  mov      dl, byte ptr [0x698]        
  {1C2E6}  call     0x1c704                     
  {1C2E9}  retf                                 
  {1C2EA}  mov      ax, 0x701                   
  {1C2ED}  jmp      0x1c2f2                     
  {1C2EF}  mov      ax, 0x601                   
  {1C2F2}  push     ax                          
  {1C2F3}  call     0x1c5f3                     
  {1C2F6}  pop      ax                          
  {1C2F7}  mov      bh, byte ptr [0x694]        
  {1C2FB}  mov      cl, byte ptr [0x696]        
  {1C2FF}  mov      ch, dh                      
  {1C301}  mov      dx, word ptr [0x698]        
  {1C305}  cmp      ch, dh                      
  {1C307}  jne      0x1c30b                     
  {1C309}  xor      al, al                      
  {1C30B}  call     0x1c704                     
  {1C30E}  retf                                 
  {1C30F}  mov      bx, sp                      
  {1C311}  mov      dl, byte ptr ss:[bx + 6]    
  {1C315}  mov      dh, byte ptr ss:[bx + 4]    
  {1C319}  dec      dl                          
  {1C31B}  add      dl, byte ptr [0x696]        
  {1C31F}  jb       0x1c338                     
  {1C321}  cmp      dl, byte ptr [0x698]        
  {1C325}  ja       0x1c338                     
  {1C327}  dec      dh                          
  {1C329}  add      dh, byte ptr [0x697]        
  {1C32D}  jb       0x1c338                     
  {1C32F}  cmp      dh, byte ptr [0x699]        
  {1C333}  ja       0x1c338                     
  {1C335}  call     0x1c5fa                     
  {1C338}  retf     4                           
  {1C33B}  call     0x1c5f3                     
  {1C33E}  mov      al, dl                      
  {1C340}  sub      al, byte ptr [0x696]        
  {1C344}  inc      al                          
  {1C346}  retf                                 
  {1C347}  call     0x1c5f3                     
  {1C34A}  mov      al, dh                      
  {1C34C}  sub      al, byte ptr [0x697]        
  {1C350}  inc      al                          
  {1C352}  retf                                 
  {1C353}  mov      bx, sp                      
  {1C355}  mov      al, byte ptr ss:[bx + 4]    
  {1C359}  test     al, 0xf0                    
  {1C35B}  je       0x1c361                     
  {1C35D}  and      al, 0xf                     
  {1C35F}  or       al, 0x80                    
  {1C361}  and      byte ptr [0x694], 0x70      
  {1C366}  or       byte ptr [0x694], al        
  {1C36A}  retf     2                           
  {1C36D}  mov      bx, sp                      
  {1C36F}  mov      al, byte ptr ss:[bx + 4]    
  {1C373}  and      al, 7                       
  {1C375}  mov      cl, 4                       
  {1C377}  shl      al, cl                      
  {1C379}  and      byte ptr [0x694], 0x8f      
  {1C37E}  or       byte ptr [0x694], al        
  {1C382}  retf     2                           
  {1C385}  and      byte ptr [0x694], 0xf7      
  {1C38A}  retf                                 
  {1C38B}  or       byte ptr [0x694], 8         
  {1C390}  retf                                 
  {1C391}  mov      al, byte ptr [0x69e]        
  {1C394}  mov      byte ptr [0x694], al        
  {1C397}  retf                                 
  {1C398}  mov      bx, sp                      
  {1C39A}  mov      cx, word ptr ss:[bx + 4]    
  {1C39E}  jcxz     0x1c3b3                     
  {1C3A0}  mov      es, word ptr [0x44]         
  {1C3A4}  xor      di, di                      
  {1C3A6}  mov      bl, byte ptr es:[di]        
  {1C3A9}  mov      ax, word ptr [0x69a]        
  {1C3AC}  xor      dx, dx                      
  {1C3AE}  call     0x1c3b6                     
  {1C3B1}  loop     0x1c3a9                     
  {1C3B3}  retf     2                           
  {1C3B6}  sub      ax, 1                       
  {1C3B9}  sbb      dx, 0                       
  {1C3BC}  jb       0x1c3c3                     
  {1C3BE}  cmp      bl, byte ptr es:[di]        
  {1C3C1}  je       0x1c3b6                     
  {1C3C3}  ret                                  
  {1C3C4}  mov      bx, sp                      
  {1C3C6}  mov      bx, word ptr ss:[bx + 4]    
  {1C3CA}  mov      ax, 0x34dd                  
  {1C3CD}  mov      dx, 0x12                    
  {1C3D0}  cmp      dx, bx                      
  {1C3D2}  jae      0x1c3ee                     
  {1C3D4}  div      bx                          
  {1C3D6}  mov      bx, ax                      
  {1C3D8}  in       al, 0x61                    
  {1C3DA}  test     al, 3                       
  {1C3DC}  jne      0x1c3e6                     
  {1C3DE}  or       al, 3                       
  {1C3E0}  out      0x61, al                    
  {1C3E2}  mov      al, 0xb6                    
  {1C3E4}  out      0x43, al                    
  {1C3E6}  mov      al, bl                      
  {1C3E8}  out      0x42, al                    
  {1C3EA}  mov      al, bh                      
  {1C3EC}  out      0x42, al                    
  {1C3EE}  retf     2                           
  {1C3F1}  in       al, 0x61                    
  {1C3F3}  and      al, 0xfc                    
  {1C3F5}  out      0x61, al                    
  {1C3F7}  retf                                 
  {1C3F8}  cmp      byte ptr [0x69f], 0         
  {1C3FD}  jne      0x1c407                     
  {1C3FF}  mov      ah, 1                       
  {1C401}  int      0x16                        
  {1C403}  mov      al, 0                       
  {1C405}  je       0x1c409                     
  {1C407}  mov      al, 1                       
  {1C409}  retf                                 
  {1C40A}  mov      al, byte ptr [0x69f]        
  {1C40D}  mov      byte ptr [0x69f], 0         
  {1C412}  or       al, al                      
  {1C414}  jne      0x1c428                     
  {1C416}  xor      ah, ah                      
  {1C418}  int      0x16                        
  {1C41A}  or       al, al                      
  {1C41C}  jne      0x1c428                     
  {1C41E}  mov      byte ptr [0x69f], ah        
  {1C422}  or       ah, ah                      
  {1C424}  jne      0x1c428                     
  {1C426}  mov      al, 3                       
  {1C428}  call     0x1c23e                     
  {1C42B}  retf                                 
  {1C42C}  mov      bx, sp                      
  {1C42E}  push     ds                          
  {1C42F}  lds      di, ptr ss:[bx + 4]         
  {1C433}  mov      word ptr [di + 2], 0xd7b0   
  {1C438}  mov      word ptr [di + 4], 0x80     
  {1C43D}  lea      ax, [di + 0x80]             
  {1C441}  mov      word ptr [di + 0xc], ax     
  {1C444}  mov      word ptr [di + 0xe], ds     
  {1C447}  mov      word ptr [di + 0x10], 0x367 
  {1C44C}  mov      word ptr [di + 0x12], cs    
  {1C44F}  mov      byte ptr [di + 0x30], 0     
  {1C453}  pop      ds                          
  {1C454}  retf     4                           
  {1C457}  mov      bx, sp                      
  {1C459}  push     ds                          
  {1C45A}  lds      di, ptr ss:[bx + 4]         
  {1C45E}  mov      ax, 0x39f                   
  {1C461}  mov      bx, 0x47d                   
  {1C464}  mov      cx, bx                      
  {1C466}  cmp      word ptr [di + 2], 0xd7b1   
  {1C46B}  je       0x1c477                     
  {1C46D}  mov      word ptr [di + 2], 0xd7b2   
  {1C472}  mov      ax, 0x44c                   
  {1C475}  mov      bx, ax                      
  {1C477}  mov      word ptr [di + 0x14], ax    
  {1C47A}  mov      word ptr [di + 0x16], cs    
  {1C47D}  mov      word ptr [di + 0x18], bx    
  {1C480}  mov      word ptr [di + 0x1a], cs    
  {1C483}  mov      word ptr [di + 0x1c], cx    
  {1C486}  mov      word ptr [di + 0x1e], cs    
  {1C489}  xor      ax, ax                      
  {1C48B}  pop      ds                          
  {1C48C}  retf     4                           
  {1C48F}  push     bp                          
  {1C490}  mov      bp, sp                      
  {1C492}  les      di, ptr [bp + 6]            
  {1C495}  mov      dx, word ptr es:[di + 4]    
  {1C499}  dec      dx                          
  {1C49A}  dec      dx                          
  {1C49B}  mov      si, word ptr es:[di + 8]    
  {1C49F}  les      di, ptr es:[di + 0xc]       
  {1C4A3}  xor      bx, bx                      
  {1C4A5}  mov      byte ptr [0x69f], 0         
  {1C4AA}  push     cs                          
  {1C4AB}  call     0x1c40a                     
  {1C4AE}  mov      cx, 1                       
  {1C4B1}  cmp      al, 8                       
  {1C4B3}  je       0x1c4e9                     
  {1C4B5}  cmp      al, 0x13                    
  {1C4B7}  je       0x1c4e9                     
  {1C4B9}  cmp      al, 4                       
  {1C4BB}  je       0x1c501                     
  {1C4BD}  dec      cx                          
  {1C4BE}  cmp      al, 0x1b                    
  {1C4C0}  je       0x1c4e9                     
  {1C4C2}  cmp      al, 1                       
  {1C4C4}  je       0x1c4e9                     
  {1C4C6}  cmp      al, 6                       
  {1C4C8}  je       0x1c501                     
  {1C4CA}  cmp      al, 0x1a                    
  {1C4CC}  je       0x1c514                     
  {1C4CE}  cmp      al, 0xd                     
  {1C4D0}  je       0x1c521                     
  {1C4D2}  cmp      al, 0x20                    
  {1C4D4}  jb       0x1c4a5                     
  {1C4D6}  cmp      bx, dx                      
  {1C4D8}  je       0x1c4a5                     
  {1C4DA}  mov      byte ptr es:[bx + di], al   
  {1C4DD}  inc      bx                          
  {1C4DE}  call     0x1c579                     
  {1C4E1}  cmp      bx, si                      
  {1C4E3}  jbe      0x1c4a5                     
  {1C4E5}  mov      si, bx                      
  {1C4E7}  jmp      0x1c4a5                     
  {1C4E9}  or       bx, bx                      
  {1C4EB}  je       0x1c4a5                     
  {1C4ED}  mov      al, 8                       
  {1C4EF}  call     0x1c579                     
  {1C4F2}  mov      al, 0x20                    
  {1C4F4}  call     0x1c579                     
  {1C4F7}  mov      al, 8                       
  {1C4F9}  call     0x1c579                     
  {1C4FC}  dec      bx                          
  {1C4FD}  loop     0x1c4e9                     
  {1C4FF}  jmp      0x1c4a5                     
  {1C501}  cmp      bx, si                      
  {1C503}  je       0x1c4a5                     
  {1C505}  mov      al, byte ptr es:[bx + di]   
  {1C508}  cmp      al, 0x20                    
  {1C50A}  jb       0x1c4a5                     
  {1C50C}  call     0x1c579                     
  {1C50F}  inc      bx                          
  {1C510}  loop     0x1c501                     
  {1C512}  jmp      0x1c4a5                     
  {1C514}  cmp      byte ptr [0x68f], 0         
  {1C519}  je       0x1c4a5                     
  {1C51B}  mov      byte ptr es:[bx + di], al   
  {1C51E}  inc      bx                          
  {1C51F}  jmp      0x1c52b                     
  {1C521}  call     0x1c572                     
  {1C524}  mov      word ptr es:[bx + di], 0xa0d
  {1C529}  inc      bx                          
  {1C52A}  inc      bx                          
  {1C52B}  les      di, ptr [bp + 6]            
  {1C52E}  xor      ax, ax                      
  {1C530}  mov      word ptr es:[di + 8], ax    
  {1C534}  mov      word ptr es:[di + 0xa], bx  
  {1C538}  pop      bp                          
  {1C539}  retf     4                           
  {1C53C}  mov      bx, sp                      
  {1C53E}  les      di, ptr ss:[bx + 4]         
  {1C542}  mov      cx, word ptr es:[di + 8]    
  {1C546}  sub      word ptr es:[di + 8], cx    
  {1C54A}  jcxz     0x1c565                     
  {1C54C}  les      di, ptr es:[di + 0xc]       
  {1C550}  cmp      byte ptr [0x690], 0         
  {1C555}  jne      0x1c562                     
  {1C557}  mov      al, byte ptr es:[di]        
  {1C55A}  call     0x1c579                     
  {1C55D}  inc      di                          
  {1C55E}  loop     0x1c557                     
  {1C560}  jmp      0x1c565                     
  {1C562}  call     0x1c601                     
  {1C565}  call     0x1c23e                     
  {1C568}  xor      ax, ax                      
  {1C56A}  retf     4                           
  {1C56D}  xor      ax, ax                      
  {1C56F}  retf     4                           
  {1C572}  mov      al, 0xd                     
  {1C574}  call     0x1c579                     
  {1C577}  mov      al, 0xa                     
  {1C579}  push     bx                          
  {1C57A}  push     cx                          
  {1C57B}  push     dx                          
  {1C57C}  push     es                          
  {1C57D}  push     ax                          
  {1C57E}  call     0x1c5f3                     
  {1C581}  pop      ax                          
  {1C582}  cmp      al, 7                       
  {1C584}  je       0x1c5b0                     
  {1C586}  cmp      al, 8                       
  {1C588}  je       0x1c5b7                     
  {1C58A}  cmp      al, 0xd                     
  {1C58C}  je       0x1c5c1                     
  {1C58E}  cmp      al, 0xa                     
  {1C590}  je       0x1c5c7                     
  {1C592}  mov      ah, 9                       
  {1C594}  mov      bl, byte ptr [0x694]        
  {1C598}  xor      bh, bh                      
  {1C59A}  mov      cx, 1                       
  {1C59D}  push     dx                          
  {1C59E}  call     0x1c704                     
  {1C5A1}  pop      dx                          
  {1C5A2}  inc      dl                          
  {1C5A4}  cmp      dl, byte ptr [0x698]        
  {1C5A8}  jbe      0x1c5ca                     
  {1C5AA}  mov      dl, byte ptr [0x696]        
  {1C5AE}  jmp      0x1c5c7                     
  {1C5B0}  mov      ah, 0xe                     
  {1C5B2}  call     0x1c704                     
  {1C5B5}  jmp      0x1c5ca                     
  {1C5B7}  cmp      dl, byte ptr [0x696]        
  {1C5BB}  je       0x1c5ca                     
  {1C5BD}  dec      dl                          
  {1C5BF}  jmp      0x1c5ca                     
  {1C5C1}  mov      dl, byte ptr [0x696]        
  {1C5C5}  jmp      0x1c5ca                     
  {1C5C7}  call     0x1c5d2                     
  {1C5CA}  call     0x1c5fa                     
  {1C5CD}  pop      es                          
  {1C5CE}  pop      dx                          
  {1C5CF}  pop      cx                          
  {1C5D0}  pop      bx                          
  {1C5D1}  ret                                  
  {1C5D2}  inc      dh                          
  {1C5D4}  cmp      dh, byte ptr [0x699]        
  {1C5D8}  jbe      0x1c5f2                     
  {1C5DA}  dec      dh                          
  {1C5DC}  push     cx                          
  {1C5DD}  push     dx                          
  {1C5DE}  mov      ax, 0x601                   
  {1C5E1}  mov      bh, byte ptr [0x694]        
  {1C5E5}  mov      cx, word ptr [0x696]        
  {1C5E9}  mov      dx, word ptr [0x698]        
  {1C5ED}  call     0x1c704                     
  {1C5F0}  pop      dx                          
  {1C5F1}  pop      cx                          
  {1C5F2}  ret                                  
  {1C5F3}  mov      ah, 3                       
  {1C5F5}  xor      bh, bh                      
  {1C5F7}  jmp      0x1c704                     
  {1C5FA}  mov      ah, 2                       
  {1C5FC}  xor      bh, bh                      
  {1C5FE}  jmp      0x1c704                     
  {1C601}  push     ds                          
  {1C602}  mov      ds, word ptr [0x44]         
  {1C606}  mov      dx, word ptr [0x50]         
  {1C60A}  pop      ds                          
  {1C60B}  mov      bx, dx                      
  {1C60D}  mov      si, di                      
  {1C60F}  mov      al, byte ptr es:[di]        
  {1C612}  cmp      al, 7                       
  {1C614}  je       0x1c637                     
  {1C616}  cmp      al, 8                       
  {1C618}  je       0x1c646                     
  {1C61A}  cmp      al, 0xa                     
  {1C61C}  je       0x1c653                     
  {1C61E}  cmp      al, 0xd                     
  {1C620}  je       0x1c65b                     
  {1C622}  inc      di                          
  {1C623}  inc      dl                          
  {1C625}  cmp      dl, byte ptr [0x698]        
  {1C629}  jbe      0x1c667                     
  {1C62B}  call     0x1c69c                     
  {1C62E}  call     0x1c5d2                     
  {1C631}  mov      dl, byte ptr [0x696]        
  {1C635}  jmp      0x1c663                     
  {1C637}  call     0x1c69c                     
  {1C63A}  push     cx                          
  {1C63B}  push     dx                          
  {1C63C}  mov      ax, 0xe07                   
  {1C63F}  call     0x1c704                     
  {1C642}  pop      dx                          
  {1C643}  pop      cx                          
  {1C644}  jmp      0x1c662                     
  {1C646}  call     0x1c69c                     
  {1C649}  cmp      dl, byte ptr [0x696]        
  {1C64D}  je       0x1c662                     
  {1C64F}  dec      dl                          
  {1C651}  jmp      0x1c662                     
  {1C653}  call     0x1c69c                     
  {1C656}  call     0x1c5d2                     
  {1C659}  jmp      0x1c662                     
  {1C65B}  call     0x1c69c                     
  {1C65E}  mov      dl, byte ptr [0x696]        
  {1C662}  inc      di                          
  {1C663}  mov      si, di                      
  {1C665}  mov      bx, dx                      
  {1C667}  loop     0x1c60f                     
  {1C669}  call     0x1c69c                     
  {1C66C}  push     ds                          
  {1C66D}  mov      ds, word ptr [0x44]         
  {1C671}  mov      word ptr [0x50], dx         
  {1C675}  mov      al, dh                      
  {1C677}  mul      byte ptr [0x4a]             
  {1C67B}  xor      dh, dh                      
  {1C67D}  add      ax, dx                      
  {1C67F}  mov      cx, ax                      
  {1C681}  mov      dx, word ptr [0x63]         
  {1C685}  mov      al, 0xe                     
  {1C687}  out      dx, al                      
  {1C688}  jmp      0x1c68a                     
  {1C68A}  mov      al, ch                      
  {1C68C}  inc      dx                          
  {1C68D}  out      dx, al                      
  {1C68E}  jmp      0x1c690                     
  {1C690}  dec      dx                          
  {1C691}  mov      al, 0xf                     
  {1C693}  out      dx, al                      
  {1C694}  jmp      0x1c696                     
  {1C696}  mov      al, cl                      
  {1C698}  inc      dx                          
  {1C699}  out      dx, al                      
  {1C69A}  pop      ds                          
  {1C69B}  ret                                  
  {1C69C}  cmp      si, di                      
  {1C69E}  je       0x1c703                     
  {1C6A0}  push     cx                          
  {1C6A1}  push     dx                          
  {1C6A2}  push     di                          
  {1C6A3}  push     ds                          
  {1C6A4}  push     es                          
  {1C6A5}  mov      cx, di                      
  {1C6A7}  sub      cx, si                      
  {1C6A9}  push     ds                          
  {1C6AA}  mov      ds, word ptr [0x44]         
  {1C6AE}  mov      al, bh                      
  {1C6B0}  mul      byte ptr [0x4a]             
  {1C6B4}  xor      bh, bh                      
  {1C6B6}  add      ax, bx                      
  {1C6B8}  shl      ax, 1                       
  {1C6BA}  mov      di, ax                      
  {1C6BC}  mov      dx, word ptr [0x63]         
  {1C6C0}  add      dx, 6                       
  {1C6C3}  cmp      byte ptr [0x49], 7          
  {1C6C8}  pop      ds                          
  {1C6C9}  mov      ax, word ptr [0x4a]         
  {1C6CC}  jne      0x1c6d1                     
  {1C6CE}  mov      ax, word ptr [0x48]         
  {1C6D1}  mov      bl, byte ptr [0x691]        
  {1C6D5}  mov      bh, byte ptr [0x694]        
  {1C6D9}  push     es                          
  {1C6DA}  pop      ds                          
  {1C6DB}  mov      es, ax                      
  {1C6DD}  cld                                  
  {1C6DE}  or       bl, bl                      
  {1C6E0}  je       0x1c6f8                     
  {1C6E2}  lodsb    al, byte ptr [si]           
  {1C6E3}  mov      bl, al                      
  {1C6E5}  in       al, dx                      
  {1C6E6}  test     al, 1                       
  {1C6E8}  jne      0x1c6e5                     
  {1C6EA}  cli                                  
  {1C6EB}  in       al, dx                      
  {1C6EC}  test     al, 1                       
  {1C6EE}  je       0x1c6eb                     
  {1C6F0}  mov      ax, bx                      
  {1C6F2}  stosw    word ptr es:[di], ax        
  {1C6F3}  sti                                  
  {1C6F4}  loop     0x1c6e2                     
  {1C6F6}  jmp      0x1c6fe                     
  {1C6F8}  mov      ah, bh                      
  {1C6FA}  lodsb    al, byte ptr [si]           
  {1C6FB}  stosw    word ptr es:[di], ax        
  {1C6FC}  loop     0x1c6fa                     
  {1C6FE}  pop      es                          
  {1C6FF}  pop      ds                          
  {1C700}  pop      di                          
  {1C701}  pop      dx                          
  {1C702}  pop      cx                          
  {1C703}  ret                                  
  {1C704}  push     si                          
  {1C705}  push     di                          
  {1C706}  push     bp                          
  {1C707}  push     es                          
  {1C708}  int      0x10                        
  {1C70A}  pop      es                          
  {1C70B}  pop      bp                          
  {1C70C}  pop      di                          
  {1C70D}  pop      si                          
  {1C70E}  ret                                  
  {1C70F}  add      byte ptr [bp + si + 0x1d49], bh
  {1C713}  mov      ds, dx                      
  {1C715}  mov      word ptr [0x38], es         
  {1C719}  xor      bp, bp                      
  {1C71B}  call     0x1d479                     
  {1C71E}  call     0x1c7c1                     
  {1C721}  mov      ax, sp                      
  {1C723}  add      ax, 0x13                    
  {1C726}  mov      cl, 4                       
  {1C728}  shr      ax, cl                      
  {1C72A}  mov      dx, ss                      
  {1C72C}  add      ax, dx                      
  {1C72E}  mov      word ptr [0xa], ax          
  {1C731}  mov      word ptr [0xc], ax          
  {1C734}  add      ax, word ptr [4]            
  {1C738}  mov      word ptr [0xe], ax          
  {1C73B}  mov      word ptr [0x18], ax         
  {1C73E}  mov      word ptr [0x1c], ax         
  {1C741}  mov      word ptr [0x24], ax         
  {1C744}  mov      es, word ptr [0x38]         
  {1C748}  mov      ax, word ptr es:[2]         
  {1C74C}  mov      word ptr [0x20], ax         
  {1C74F}  mov      word ptr [0x2a], 0xd6       
  {1C755}  mov      word ptr [0x2c], cs         
  {1C759}  mov      di, 0x8a2                   
  {1C75C}  mov      si, 0x239                   
  {1C75F}  mov      cx, 0x13                    
  {1C762}  nop                                  
  {1C763}  cld                                  
  {1C764}  lodsb    al, byte ptr cs:[si]        
  {1C766}  mov      ah, 0x35                    
  {1C768}  int      0x21                        
  {1C76A}  mov      word ptr [di], bx           
  {1C76C}  mov      word ptr [di + 2], es       
  {1C76F}  add      di, 4                       
  {1C772}  loop     0x1c763                     
  {1C774}  push     ds                          
  {1C775}  push     cs                          
  {1C776}  pop      ds                          
  {1C777}  mov      dx, 0x10c                   
  {1C77A}  mov      ax, 0x2500                  
  {1C77D}  int      0x21                        
  {1C77F}  mov      dx, 0x113                   
  {1C782}  mov      ax, 0x2523                  
  {1C785}  int      0x21                        
  {1C787}  mov      dx, 0xdb                    
  {1C78A}  mov      ax, 0x2524                  
  {1C78D}  int      0x21                        
  {1C78F}  mov      dx, 0x104                   
  {1C792}  mov      ax, 0x253f                  
  {1C795}  int      0x21                        
  {1C797}  pop      ds                          
  {1C798}  mov      ax, 0x6a2                   
  {1C79B}  push     ds                          
  {1C79C}  push     ax                          
  {1C79D}  push     ds                          
  {1C79E}  push     ax                          
  {1C79F}  mov      ax, 0x263                   
  {1C7A2}  push     cs                          
  {1C7A3}  push     ax                          
  {1C7A4}  push     cs                          
  {1C7A5}  call     0x1c9f6                     
  {1C7A8}  push     cs                          
  {1C7A9}  call     0x1ca74                     
  {1C7AC}  mov      ax, 0x7a2                   
  {1C7AF}  push     ds                          
  {1C7B0}  push     ax                          
  {1C7B1}  push     ds                          
  {1C7B2}  push     ax                          
  {1C7B3}  mov      ax, 0x263                   
  {1C7B6}  push     cs                          
  {1C7B7}  push     ax                          
  {1C7B8}  push     cs                          
  {1C7B9}  call     0x1c9f6                     
  {1C7BC}  push     cs                          
  {1C7BD}  call     0x1ca79                     
  {1C7C0}  retf                                 
  {1C7C1}  xor      ax, ax                      
  {1C7C3}  pushf                                
  {1C7C4}  pop      bx                          
  {1C7C5}  and      bh, 0xf                     
  {1C7C8}  push     bx                          
  {1C7C9}  popf                                 
  {1C7CA}  pushf                                
  {1C7CB}  pop      cx                          
  {1C7CC}  and      ch, 0xf0                    
  {1C7CF}  cmp      ch, 0xf0                    
  {1C7D2}  je       0x1c7e2                     
  {1C7D4}  inc      ax                          
  {1C7D5}  or       bh, 0xf0                    
  {1C7D8}  push     bx                          
  {1C7D9}  popf                                 
  {1C7DA}  pushf                                
  {1C7DB}  pop      cx                          
  {1C7DC}  and      ch, 0xf0                    
  {1C7DF}  je       0x1c7e2                     
  {1C7E1}  inc      ax                          
  {1C7E2}  mov      byte ptr [0x4c], al         
  {1C7E5}  ret                                  
  {1C7E6}  xor      ax, ax                      
  {1C7E8}  retf     2                           
  {1C7EB}  sti                                  
  {1C7EC}  add      sp, 6                       
  {1C7EF}  pop      ax                          
  {1C7F0}  and      di, 0x1f                    
  {1C7F3}  add      di, 0x96                    
  {1C7F7}  cmp      ah, 0x39                    
  {1C7FA}  jae      0x1c7ff                     
  {1C7FC}  mov      di, 0xffff                  
  {1C7FF}  push     di                          
  {1C800}  mov      ah, 0x54                    
  {1C802}  int      0x21                        
  {1C804}  mov      bp, sp                      
  {1C806}  or       byte ptr [bp + 0x16], 1     
  {1C80A}  pop      ax                          
  {1C80B}  pop      bx                          
  {1C80C}  pop      cx                          
  {1C80D}  pop      dx                          
  {1C80E}  pop      si                          
  {1C80F}  pop      di                          
  {1C810}  pop      bp                          
  {1C811}  pop      ds                          
  {1C812}  pop      es                          
  {1C813}  iret                                 
  {1C814}  mov      ax, 0xd0                    
  {1C817}  add      sp, 6                       
  {1C81A}  jmp      0x1c81f                     
  {1C81C}  mov      ax, 0xc8                    
  {1C81F}  pop      cx                          
  {1C820}  pop      bx                          
  {1C821}  jmp      0x1c82a                     
  {1C823}  mov      ax, 0xff                    
  {1C826}  xor      cx, cx                      
  {1C828}  xor      bx, bx                      
  {1C82A}  mov      dx, 0x1d49                  
  {1C82D}  mov      ds, dx                      
  {1C82F}  sti                                  
  {1C830}  mov      word ptr [0x32], ax         
  {1C833}  mov      ax, cx                      
  {1C835}  or       ax, bx                      
  {1C837}  je       0x1c876                     
  {1C839}  mov      ax, word ptr [0x10]         
  {1C83C}  or       ax, ax                      
  {1C83E}  je       0x1c86f                     
  {1C840}  mov      es, ax                      
  {1C842}  mov      ax, word ptr es:[0x10]      
  {1C846}  or       ax, ax                      
  {1C848}  je       0x1c865                     
  {1C84A}  sub      ax, bx                      
  {1C84C}  ja       0x1c865                     
  {1C84E}  neg      ax                          
  {1C850}  cmp      ax, 0x1000                  
  {1C853}  jae      0x1c865                     
  {1C855}  mov      dx, 0x10                    
  {1C858}  mul      dx                          
  {1C85A}  add      ax, cx                      
  {1C85C}  jb       0x1c865                     
  {1C85E}  cmp      ax, word ptr es:[8]         
  {1C863}  jb       0x1c86b                     
  {1C865}  mov      ax, word ptr es:[0x14]      
  {1C869}  jmp      0x1c83c                     
  {1C86B}  mov      cx, ax                      
  {1C86D}  mov      bx, es                      
  {1C86F}  sub      bx, word ptr [0x38]         
  {1C873}  sub      bx, 0x10                    
  {1C876}  mov      word ptr [0x34], cx         
  {1C87A}  mov      word ptr [0x36], bx         
  {1C87E}  les      bx, ptr [0x2e]              
  {1C882}  mov      ax, es                      
  {1C884}  or       ax, bx                      
  {1C886}  je       0x1c89b                     
  {1C888}  xor      ax, ax                      
  {1C88A}  mov      word ptr [0x2e], ax         
  {1C88D}  mov      word ptr [0x30], ax         
  {1C890}  mov      word ptr [0x3c], ax         
  {1C893}  mov      ax, 0x16e                   
  {1C896}  push     cs                          
  {1C897}  push     ax                          
  {1C898}  push     es                          
  {1C899}  push     bx                          
  {1C89A}  retf                                 
  {1C89B}  mov      ax, 0x6a2                   
  {1C89E}  push     ds                          
  {1C89F}  push     ax                          
  {1C8A0}  push     cs                          
  {1C8A1}  call     0x1cace                     
  {1C8A4}  mov      ax, 0x7a2                   
  {1C8A7}  push     ds                          
  {1C8A8}  push     ax                          
  {1C8A9}  push     cs                          
  {1C8AA}  call     0x1cace                     
  {1C8AD}  mov      di, 0x8a2                   
  {1C8B0}  mov      si, 0x239                   
  {1C8B3}  mov      cx, 0x13                    
  {1C8B6}  nop                                  
  {1C8B7}  cld                                  
  {1C8B8}  lodsb    al, byte ptr cs:[si]        
  {1C8BA}  mov      ah, 0x25                    
  {1C8BC}  push     ds                          
  {1C8BD}  lds      dx, ptr [di]                
  {1C8BF}  int      0x21                        
  {1C8C1}  pop      ds                          
  {1C8C2}  add      di, 4                       
  {1C8C5}  loop     0x1c8b7                     
  {1C8C7}  mov      ax, word ptr [0x34]         
  {1C8CA}  or       ax, word ptr [0x36]         
  {1C8CE}  je       0x1c8f9                     
  {1C8D0}  mov      bx, 0x24c                   
  {1C8D3}  call     0x1c900                     
  {1C8D6}  mov      ax, word ptr [0x32]         
  {1C8D9}  call     0x1c90e                     
  {1C8DC}  mov      bx, 0x25b                   
  {1C8DF}  call     0x1c900                     
  {1C8E2}  mov      ax, word ptr [0x36]         
  {1C8E5}  call     0x1c928                     
  {1C8E8}  mov      al, 0x3a                    
  {1C8EA}  call     0x1c942                     
  {1C8ED}  mov      ax, word ptr [0x34]         
  {1C8F0}  call     0x1c928                     
  {1C8F3}  mov      bx, 0x260                   
  {1C8F6}  call     0x1c900                     
  {1C8F9}  mov      ax, word ptr [0x32]         
  {1C8FC}  mov      ah, 0x4c                    
  {1C8FE}  int      0x21                        
  {1C900}  mov      al, byte ptr cs:[bx]        
  {1C903}  or       al, al                      
  {1C905}  je       0x1c90d                     
  {1C907}  call     0x1c942                     
  {1C90A}  inc      bx                          
  {1C90B}  jmp      0x1c900                     
  {1C90D}  ret                                  
  {1C90E}  mov      cl, 0x64                    
  {1C910}  call     0x1c91a                     
  {1C913}  mov      cl, 0xa                     
  {1C915}  call     0x1c91a                     
  {1C918}  jmp      0x1c91e                     
  {1C91A}  xor      ah, ah                      
  {1C91C}  div      cl                          
  {1C91E}  add      al, 0x30                    
  {1C920}  push     ax                          
  {1C921}  call     0x1c942                     
  {1C924}  pop      ax                          
  {1C925}  mov      al, ah                      
  {1C927}  ret                                  
  {1C928}  push     ax                          
  {1C929}  mov      al, ah                      
  {1C92B}  call     0x1c92f                     
  {1C92E}  pop      ax                          
  {1C92F}  push     ax                          
  {1C930}  mov      cl, 4                       
  {1C932}  shr      al, cl                      
  {1C934}  call     0x1c93a                     
  {1C937}  pop      ax                          
  {1C938}  and      al, 0xf                     
  {1C93A}  add      al, 0x30                    
  {1C93C}  cmp      al, 0x3a                    
  {1C93E}  jb       0x1c942                     
  {1C940}  add      al, 7                       
  {1C942}  mov      dl, al                      
  {1C944}  mov      ah, 6                       
  {1C946}  int      0x21                        
  {1C948}  ret                                  
  {1C949}  add      byte ptr [bp + si], al      
  {1C94B}  sbb      sp, word ptr [bx + di]      
  {1C94D}  and      sp, word ptr [si]           
  {1C94F}  xor      al, 0x35                    
  {1C951}  aaa                                  
  {1C953}  cmp      byte ptr [bx + di], bh      
  {1C955}  cmp      bh, byte ptr [bp + di]      
  {1C957}  cmp      al, 0x3d                    
  {1C959}  aas                                  
  {1C95B}  jne      0x1c9af                     
  {1C95D}  jne      0x1c9cd                     
  {1C95F}  je       0x1c9ca                     
  {1C961}  insw     word ptr es:[di], dx        
  {1C962}  and      byte ptr gs:[di + 0x72], ah 
  {1C966}  jb       0x1c9d7                     
  {1C968}  jb       0x1c98a                     
  {1C96A}  add      byte ptr [bx + si], ah      
  {1C96C}  popaw                                
  {1C96D}  je       0x1c98f                     
  {1C96F}  add      byte ptr [0xa0d], ch        
  {1C973}  add      byte ptr [bx + si + 0x6f], dl
  {1C976}  jb       0x1c9ec                     
  {1C978}  imul     bp, word ptr [bx + 0x6e], 0x2073
  {1C97D}  inc      bx                          
  {1C97E}  outsw    dx, word ptr [si]           
  {1C97F}  jo       0x1c9fa                     
  {1C981}  jb       0x1c9ec                     
  {1C983}  push     0x2074                      
  {1C987}  sub      byte ptr [bp + di + 0x29], ah
  {1C98A}  and      byte ptr [bx + di], dh      
  {1C98C}  cmp      word ptr [bx + si], di      
  {1C98E}  xor      bp, word ptr [si]           
  {1C990}  cmp      word ptr [bp + si], si      
  {1C992}  and      byte ptr [bp + si + 0x6f], al
  {1C995}  jb       0x1ca03                     
  {1C997}  popaw                                
  {1C998}  outsb    dx, byte ptr [si]           
  {1C999}  xor      ax, ax                      
  {1C99C}  xchg     word ptr [0x3c], ax         
  {1C9A0}  retf                                 
  {1C9A1}  cmp      word ptr [0x3c], 0          
  {1C9A6}  jne      0x1c9a9                     
  {1C9A8}  retf                                 
  {1C9A9}  mov      ax, word ptr [0x3c]         
  {1C9AC}  jmp      0x1c81f                     
  {1C9AF}  mov      si, sp                      
  {1C9B1}  mov      es, word ptr ss:[si + 2]    
  {1C9B5}  cmp      dx, word ptr es:[di + 2]    
  {1C9B9}  jg       0x1c9c2                     
  {1C9BB}  jl       0x1c9d1                     
  {1C9BD}  cmp      ax, word ptr es:[di]        
  {1C9C0}  jb       0x1c9d1                     
  {1C9C2}  cmp      dx, word ptr es:[di + 6]    
  {1C9C6}  jl       0x1c9d0                     
  {1C9C8}  jg       0x1c9d1                     
  {1C9CA}  cmp      ax, word ptr es:[di + 4]    
  {1C9CE}  ja       0x1c9d1                     
  {1C9D0}  retf                                 
  {1C9D1}  mov      ax, 0xc9                    
  {1C9D4}  jmp      0x1c81f                     
  {1C9D7}  mov      ax, 0xd7                    
  {1C9DA}  jmp      0x1c81f                     
  {1C9DD}  add      ax, 0x200                   
  {1C9E0}  jb       0x1c9ef                     
  {1C9E2}  sub      ax, sp                      
  {1C9E4}  jae      0x1c9ef                     
  {1C9E6}  neg      ax                          
  {1C9E8}  cmp      ax, word ptr [0x3a]         
  {1C9EC}  jb       0x1c9ef                     
  {1C9EE}  retf                                 
  {1C9EF}  mov      ax, 0xca                    
  {1C9F2}  jmp      0x1c81f                     
  {1C9F5}  mov      dx, 0xd233                  
  {1C9F8}  mov      bx, sp                      
  {1C9FA}  push     ds                          
  {1C9FB}  les      di, ptr ss:[bx + 8]         
  {1C9FF}  lds      si, ptr ss:[bx + 4]         
  {1CA03}  cld                                  
  {1CA04}  xor      ax, ax                      
  {1CA06}  stosw    word ptr es:[di], ax        
  {1CA07}  mov      ax, 0xd7b0                  
  {1CA0A}  stosw    word ptr es:[di], ax        
  {1CA0B}  mov      ax, 0x80                    
  {1CA0E}  stosw    word ptr es:[di], ax        
  {1CA0F}  xor      ax, ax                      
  {1CA11}  stosw    word ptr es:[di], ax        
  {1CA12}  stosw    word ptr es:[di], ax        
  {1CA13}  stosw    word ptr es:[di], ax        
  {1CA14}  lea      ax, [di + 0x74]             
  {1CA17}  stosw    word ptr es:[di], ax        
  {1CA18}  mov      ax, es                      
  {1CA1A}  stosw    word ptr es:[di], ax        
  {1CA1B}  mov      ax, 0xafd                   
  {1CA1E}  stosw    word ptr es:[di], ax        
  {1CA1F}  mov      ax, 0x1c71                  
  {1CA22}  stosw    word ptr es:[di], ax        
  {1CA23}  xor      ax, ax                      
  {1CA25}  mov      cx, 0xe                     
  {1CA28}  rep stosw word ptr es:[di], ax        
  {1CA2A}  mov      cx, 0x4f                    
  {1CA2D}  or       dx, dx                      
  {1CA2F}  jne      0x1ca3a                     
  {1CA31}  lodsb    al, byte ptr [si]           
  {1CA32}  cmp      cl, al                      
  {1CA34}  jbe      0x1ca3a                     
  {1CA36}  mov      cl, al                      
  {1CA38}  jcxz     0x1ca42                     
  {1CA3A}  lodsb    al, byte ptr [si]           
  {1CA3B}  or       al, al                      
  {1CA3D}  je       0x1ca42                     
  {1CA3F}  stosb    byte ptr es:[di], al        
  {1CA40}  loop     0x1ca3a                     
  {1CA42}  xor      al, al                      
  {1CA44}  stosb    byte ptr es:[di], al        
  {1CA45}  pop      ds                          
  {1CA46}  retf     8                           
  {1CA49}  mov      bx, sp                      
  {1CA4B}  les      di, ptr ss:[bx + 0xa]       
  {1CA4F}  mov      ax, word ptr ss:[bx + 4]    
  {1CA53}  mov      word ptr es:[di + 4], ax    
  {1CA57}  mov      ax, word ptr ss:[bx + 6]    
  {1CA5B}  mov      word ptr es:[di + 0xc], ax  
  {1CA5F}  mov      ax, word ptr ss:[bx + 8]    
  {1CA63}  mov      word ptr es:[di + 0xe], ax  
  {1CA67}  xor      ax, ax                      
  {1CA69}  mov      word ptr es:[di + 8], ax    
  {1CA6D}  mov      word ptr es:[di + 0xa], ax  
  {1CA71}  retf     0xa                         
  {1CA74}  mov      dx, 0xd7b1                  
  {1CA77}  jmp      0x1ca81                     
  {1CA79}  mov      dx, 0xd7b2                  
  {1CA7C}  jmp      0x1ca81                     
  {1CA7E}  mov      dx, 0xd7b3                  
  {1CA81}  push     bp                          
  {1CA82}  mov      bp, sp                      
  {1CA84}  les      di, ptr [bp + 6]            
  {1CA87}  mov      ax, word ptr es:[di + 2]    
  {1CA8B}  cmp      ax, 0xd7b1                  
  {1CA8E}  je       0x1caa2                     
  {1CA90}  cmp      ax, 0xd7b2                  
  {1CA93}  je       0x1caa2                     
  {1CA95}  cmp      ax, 0xd7b0                  
  {1CA98}  je       0x1caaa                     
  {1CA9A}  mov      word ptr [0x3c], 0x66       
  {1CAA0}  jmp      0x1cac6                     
  {1CAA2}  push     dx                          
  {1CAA3}  push     es                          
  {1CAA4}  push     di                          
  {1CAA5}  push     cs                          
  {1CAA6}  call     0x1cace                     
  {1CAA9}  pop      dx                          
  {1CAAA}  xor      ax, ax                      
  {1CAAC}  mov      word ptr es:[di + 2], dx    
  {1CAB0}  mov      word ptr es:[di + 8], ax    
  {1CAB4}  mov      word ptr es:[di + 0xa], ax  
  {1CAB8}  mov      bx, 0x10                    
  {1CABB}  call     0x1cb0a                     
  {1CABE}  je       0x1cac6                     
  {1CAC0}  mov      word ptr es:[di + 2], 0xd7b0
  {1CAC6}  pop      bp                          
  {1CAC7}  retf     4                           
  {1CACA}  mov      al, 0                       
  {1CACC}  jmp      0x1cad0                     
  {1CACE}  mov      al, 1                       
  {1CAD0}  push     bp                          
  {1CAD1}  mov      bp, sp                      
  {1CAD3}  les      di, ptr [bp + 6]            
  {1CAD6}  cmp      word ptr es:[di + 2], 0xd7b1
  {1CADC}  je       0x1caf6                     
  {1CADE}  cmp      word ptr es:[di + 2], 0xd7b2
  {1CAE4}  je       0x1caee                     
  {1CAE6}  mov      word ptr [0x3c], 0x67       
  {1CAEC}  jmp      0x1cb06                     
  {1CAEE}  push     ax                          
  {1CAEF}  mov      bx, 0x14                    
  {1CAF2}  call     0x1cb0a                     
  {1CAF5}  pop      ax                          
  {1CAF6}  or       al, al                      
  {1CAF8}  je       0x1cb06                     
  {1CAFA}  mov      bx, 0x1c                    
  {1CAFD}  call     0x1cb0a                     
  {1CB00}  mov      word ptr es:[di + 2], 0xd7b0
  {1CB06}  pop      bp                          
  {1CB07}  retf     4                           
  {1CB0A}  push     es                          
  {1CB0B}  push     di                          
  {1CB0C}  push     es                          
  {1CB0D}  push     di                          
  {1CB0E}  lcall    es:[bx + di]                
  {1CB11}  or       ax, ax                      
  {1CB13}  je       0x1cb18                     
  {1CB15}  mov      word ptr [0x3c], ax         
  {1CB18}  pop      di                          
  {1CB19}  pop      es                          
  {1CB1A}  ret                                  
  {1CB1B}  mov      bx, sp                      
  {1CB1D}  push     ds                          
  {1CB1E}  les      di, ptr ss:[bx + 4]         
  {1CB22}  lds      dx, ptr es:[di + 0xc]       
  {1CB26}  mov      cx, word ptr es:[di + 4]    
  {1CB2A}  mov      bx, word ptr es:[di]        
  {1CB2D}  mov      ah, 0x3f                    
  {1CB2F}  int      0x21                        
  {1CB31}  jb       0x1cb43                     
  {1CB33}  mov      word ptr es:[di + 0xa], ax  
  {1CB37}  xor      ax, ax                      
  {1CB39}  mov      word ptr es:[di + 8], 0     
  {1CB3F}  pop      ds                          
  {1CB40}  retf     4                           
  {1CB43}  mov      word ptr es:[di + 0xa], 0   
  {1CB49}  jmp      0x1cb39                     
  {1CB4B}  mov      bx, sp                      
  {1CB4D}  push     ds                          
  {1CB4E}  les      di, ptr ss:[bx + 4]         
  {1CB52}  lds      dx, ptr es:[di + 0xc]       
  {1CB56}  xor      cx, cx                      
  {1CB58}  xchg     word ptr es:[di + 8], cx    
  {1CB5C}  mov      bx, word ptr es:[di]        
  {1CB5F}  mov      ah, 0x40                    
  {1CB61}  int      0x21                        
  {1CB63}  jb       0x1cb6c                     
  {1CB65}  sub      ax, cx                      
  {1CB67}  je       0x1cb6c                     
  {1CB69}  mov      ax, 0x65                    
  {1CB6C}  pop      ds                          
  {1CB6D}  retf     4                           
  {1CB70}  mov      bx, sp                      
  {1CB72}  push     ds                          
  {1CB73}  les      di, ptr ss:[bx + 4]         
  {1CB77}  lds      dx, ptr es:[di + 0xc]       
  {1CB7B}  xor      cx, cx                      
  {1CB7D}  xchg     word ptr es:[di + 8], cx    
  {1CB81}  mov      bx, word ptr es:[di]        
  {1CB84}  mov      ah, 0x40                    
  {1CB86}  int      0x21                        
  {1CB88}  jb       0x1cb8c                     
  {1CB8A}  xor      ax, ax                      
  {1CB8C}  pop      ds                          
  {1CB8D}  retf     4                           
  {1CB90}  mov      bx, sp                      
  {1CB92}  les      di, ptr ss:[bx + 4]         
  {1CB96}  mov      bx, word ptr es:[di]        
  {1CB99}  cmp      bx, 4                       
  {1CB9C}  jbe      0x1cba4                     
  {1CB9E}  mov      ah, 0x3e                    
  {1CBA0}  int      0x21                        
  {1CBA2}  jb       0x1cba6                     
  {1CBA4}  xor      ax, ax                      
  {1CBA6}  retf     4                           
  {1CBA9}  cmp      word ptr [0x3c], 0          
  {1CBAE}  jne      0x1cbe5                     
  {1CBB0}  cmp      word ptr es:[bx + 2], 0xd7b1
  {1CBB6}  jne      0x1cbe6                     
  {1CBB8}  mov      si, word ptr es:[bx + 8]    
  {1CBBC}  cmp      si, word ptr es:[bx + 0xa]  
  {1CBC0}  je       0x1cbed                     
  {1CBC2}  push     ds                          
  {1CBC3}  push     es                          
  {1CBC4}  push     bx                          
  {1CBC5}  push     dx                          
  {1CBC6}  lds      dx, ptr es:[bx + 0xc]       
  {1CBCA}  mov      bx, word ptr es:[bx + 0xa]  
  {1CBCE}  pop      es                          
  {1CBCF}  add      bx, dx                      
  {1CBD1}  add      si, dx                      
  {1CBD3}  cld                                  
  {1CBD4}  call     ax                          
  {1CBD6}  sub      si, dx                      
  {1CBD8}  mov      dx, es                      
  {1CBDA}  pop      bx                          
  {1CBDB}  pop      es                          
  {1CBDC}  pop      ds                          
  {1CBDD}  mov      word ptr es:[bx + 8], si    
  {1CBE1}  or       ax, ax                      
  {1CBE3}  jne      0x1cbed                     
  {1CBE5}  ret                                  
  {1CBE6}  mov      word ptr [0x3c], 0x68       
  {1CBEC}  ret                                  
  {1CBED}  push     ax                          
  {1CBEE}  push     cx                          
  {1CBEF}  push     dx                          
  {1CBF0}  push     di                          
  {1CBF1}  push     es                          
  {1CBF2}  push     bx                          
  {1CBF3}  call     0x1cd29                     
  {1CBF6}  pop      bx                          
  {1CBF7}  pop      es                          
  {1CBF8}  pop      di                          
  {1CBF9}  pop      dx                          
  {1CBFA}  pop      cx                          
  {1CBFB}  pop      ax                          
  {1CBFC}  mov      si, word ptr es:[bx + 8]    
  {1CC00}  cmp      si, word ptr es:[bx + 0xa]  
  {1CC04}  jne      0x1cbc2                     
  {1CC06}  ret                                  
  {1CC07}  cmp      word ptr [0x3c], 0          
  {1CC0C}  jne      0x1cc4e                     
  {1CC0E}  cmp      word ptr es:[bx + 2], 0xd7b2
  {1CC14}  jne      0x1cc4f                     
  {1CC16}  mov      cx, word ptr es:[bx + 4]    
  {1CC1A}  mov      di, word ptr es:[bx + 8]    
  {1CC1E}  sub      cx, di                      
  {1CC20}  sub      dx, cx                      
  {1CC22}  jae      0x1cc28                     
  {1CC24}  add      cx, dx                      
  {1CC26}  xor      dx, dx                      
  {1CC28}  push     es                          
  {1CC29}  les      si, ptr es:[bx + 0xc]       
  {1CC2D}  add      di, si                      
  {1CC2F}  mov      al, 0x20                    
  {1CC31}  cld                                  
  {1CC32}  rep stosb byte ptr es:[di], al        
  {1CC34}  sub      di, si                      
  {1CC36}  pop      es                          
  {1CC37}  mov      word ptr es:[bx + 8], di    
  {1CC3B}  cmp      di, word ptr es:[bx + 4]    
  {1CC3F}  jne      0x1cc4a                     
  {1CC41}  push     dx                          
  {1CC42}  push     es                          
  {1CC43}  push     bx                          
  {1CC44}  call     0x1cd29                     
  {1CC47}  pop      bx                          
  {1CC48}  pop      es                          
  {1CC49}  pop      dx                          
  {1CC4A}  or       dx, dx                      
  {1CC4C}  jne      0x1cc16                     
  {1CC4E}  ret                                  
  {1CC4F}  mov      word ptr [0x3c], 0x69       
  {1CC55}  ret                                  
  {1CC56}  cmp      word ptr [0x3c], 0          
  {1CC5B}  jne      0x1cca5                     
  {1CC5D}  cmp      word ptr es:[bx + 2], 0xd7b2
  {1CC63}  jne      0x1cca6                     
  {1CC65}  mov      cx, word ptr es:[bx + 4]    
  {1CC69}  mov      di, word ptr es:[bx + 8]    
  {1CC6D}  sub      cx, di                      
  {1CC6F}  sub      ax, cx                      
  {1CC71}  jae      0x1cc77                     
  {1CC73}  add      cx, ax                      
  {1CC75}  xor      ax, ax                      
  {1CC77}  push     ds                          
  {1CC78}  push     es                          
  {1CC79}  push     bx                          
  {1CC7A}  mov      ds, dx                      
  {1CC7C}  les      bx, ptr es:[bx + 0xc]       
  {1CC80}  add      di, bx                      
  {1CC82}  cld                                  
  {1CC83}  rep movsb byte ptr es:[di], byte ptr [si]
  {1CC85}  sub      di, bx                      
  {1CC87}  pop      bx                          
  {1CC88}  pop      es                          
  {1CC89}  pop      ds                          
  {1CC8A}  mov      word ptr es:[bx + 8], di    
  {1CC8E}  cmp      di, word ptr es:[bx + 4]    
  {1CC92}  jne      0x1cca1                     
  {1CC94}  push     ax                          
  {1CC95}  push     dx                          
  {1CC96}  push     si                          
  {1CC97}  push     es                          
  {1CC98}  push     bx                          
  {1CC99}  call     0x1cd29                     
  {1CC9C}  pop      bx                          
  {1CC9D}  pop      es                          
  {1CC9E}  pop      si                          
  {1CC9F}  pop      dx                          
  {1CCA0}  pop      ax                          
  {1CCA1}  or       ax, ax                      
  {1CCA3}  jne      0x1cc65                     
  {1CCA5}  ret                                  
  {1CCA6}  mov      word ptr [0x3c], 0x69       
  {1CCAC}  ret                                  
  {1CCAD}  push     bp                          
  {1CCAE}  mov      bp, sp                      
  {1CCB0}  les      bx, ptr [bp + 6]            
  {1CCB3}  mov      ax, 0x5bb                   
  {1CCB6}  xor      dx, dx                      
  {1CCB8}  call     0x1cba9                     
  {1CCBB}  jne      0x1ccc7                     
  {1CCBD}  cmp      word ptr es:[bx + 0x1a], 0  
  {1CCC2}  je       0x1ccc7                     
  {1CCC4}  call     0x1cd37                     
  {1CCC7}  pop      bp                          
  {1CCC8}  retf     4                           
  {1CCCB}  lodsb    al, byte ptr [si]           
  {1CCCC}  cmp      al, 0xd                     
  {1CCCE}  je       0x1ccdc                     
  {1CCD0}  cmp      al, 0x1a                    
  {1CCD2}  je       0x1cce5                     
  {1CCD4}  cmp      si, bx                      
  {1CCD6}  jne      0x1cccb                     
  {1CCD8}  mov      ax, 0x5bb                   
  {1CCDB}  ret                                  
  {1CCDC}  cmp      si, bx                      
  {1CCDE}  je       0x1cce9                     
  {1CCE0}  lodsb    al, byte ptr [si]           
  {1CCE1}  cmp      al, 0xa                     
  {1CCE3}  je       0x1cce6                     
  {1CCE5}  dec      si                          
  {1CCE6}  xor      ax, ax                      
  {1CCE8}  ret                                  
  {1CCE9}  mov      ax, 0x5d0                   
  {1CCEC}  ret                                  
  {1CCED}  push     bp                          
  {1CCEE}  mov      bp, sp                      
  {1CCF0}  les      bx, ptr [bp + 6]            
  {1CCF3}  mov      ax, 2                       
  {1CCF6}  mov      si, 0x50                    
  {1CCF9}  mov      dx, ds                      
  {1CCFB}  call     0x1cc56                     
  {1CCFE}  jne      0x1cd0a                     
  {1CD00}  cmp      word ptr es:[bx + 0x1a], 0  
  {1CD05}  je       0x1cd0a                     
  {1CD07}  call     0x1cd37                     
  {1CD0A}  pop      bp                          
  {1CD0B}  retf     4                           
  {1CD0E}  push     bp                          
  {1CD0F}  mov      bp, sp                      
  {1CD11}  les      bx, ptr [bp + 6]            
  {1CD14}  cmp      word ptr es:[bx + 0x1a], 0  
  {1CD19}  je       0x1cd25                     
  {1CD1B}  cmp      word ptr [0x3c], 0          
  {1CD20}  jne      0x1cd25                     
  {1CD22}  call     0x1cd37                     
  {1CD25}  pop      bp                          
  {1CD26}  retf     4                           
  {1CD29}  push     es                          
  {1CD2A}  push     bx                          
  {1CD2B}  lcall    es:[bx + 0x14]              
  {1CD2F}  or       ax, ax                      
  {1CD31}  je       0x1cd36                     
  {1CD33}  mov      word ptr [0x3c], ax         
  {1CD36}  ret                                  
  {1CD37}  push     es                          
  {1CD38}  push     bx                          
  {1CD39}  lcall    es:[bx + 0x18]              
  {1CD3D}  or       ax, ax                      
  {1CD3F}  je       0x1cd44                     
  {1CD41}  mov      word ptr [0x3c], ax         
  {1CD44}  ret                                  
  {1CD45}  push     bp                          
  {1CD46}  mov      bp, sp                      
  {1CD48}  cmp      word ptr [0x3c], 0          
  {1CD4D}  jne      0x1cd87                     
  {1CD4F}  les      bx, ptr [bp + 6]            
  {1CD52}  cmp      word ptr es:[bx + 2], 0xd7b1
  {1CD58}  jne      0x1cd81                     
  {1CD5A}  mov      di, word ptr es:[bx + 8]    
  {1CD5E}  cmp      di, word ptr es:[bx + 0xa]  
  {1CD62}  jne      0x1cd74                     
  {1CD64}  call     0x1cd29                     
  {1CD67}  les      bx, ptr [bp + 6]            
  {1CD6A}  mov      di, word ptr es:[bx + 8]    
  {1CD6E}  cmp      di, word ptr es:[bx + 0xa]  
  {1CD72}  je       0x1cd87                     
  {1CD74}  inc      word ptr es:[bx + 8]        
  {1CD78}  les      bx, ptr es:[bx + 0xc]       
  {1CD7C}  mov      al, byte ptr es:[bx + di]   
  {1CD7F}  pop      bp                          
  {1CD80}  retf                                 
  {1CD81}  mov      word ptr [0x3c], 0x68       
  {1CD87}  mov      al, 0x1a                    
  {1CD89}  jmp      0x1cd7f                     
  {1CD8B}  push     bp                          
  {1CD8C}  mov      bp, sp                      
  {1CD8E}  les      bx, ptr [bp + 0xa]          
  {1CD91}  mov      dx, word ptr [bp + 6]       
  {1CD94}  dec      dx                          
  {1CD95}  jle      0x1cd9a                     
  {1CD97}  call     0x1cc07                     
  {1CD9A}  cmp      word ptr [0x3c], 0          
  {1CD9F}  jne      0x1cdca                     
  {1CDA1}  cmp      word ptr es:[bx + 2], 0xd7b2
  {1CDA7}  jne      0x1cdce                     
  {1CDA9}  inc      word ptr es:[bx + 8]        
  {1CDAD}  mov      di, word ptr es:[bx + 8]    
  {1CDB1}  mov      dx, word ptr es:[bx + 4]    
  {1CDB5}  les      bx, ptr es:[bx + 0xc]       
  {1CDB9}  mov      al, byte ptr [bp + 8]       
  {1CDBC}  mov      byte ptr es:[bx + di - 1], al
  {1CDC0}  cmp      di, dx                      
  {1CDC2}  jne      0x1cdca                     
  {1CDC4}  les      bx, ptr [bp + 0xa]          
  {1CDC7}  call     0x1cd29                     
  {1CDCA}  pop      bp                          
  {1CDCB}  retf     4                           
  {1CDCE}  mov      word ptr [0x3c], 0x69       
  {1CDD4}  jmp      0x1cdca                     
  {1CDD6}  push     bp                          
  {1CDD7}  mov      bp, sp                      
  {1CDD9}  les      bx, ptr [bp + 0xc]          
  {1CDDC}  mov      ax, 0x6e9                   
  {1CDDF}  mov      cx, word ptr [bp + 6]       
  {1CDE2}  mov      di, word ptr [bp + 8]       
  {1CDE5}  mov      dx, word ptr [bp + 0xa]     
  {1CDE8}  inc      di                          
  {1CDE9}  call     0x1cba9                     
  {1CDEC}  mov      ax, di                      
  {1CDEE}  les      di, ptr [bp + 8]            
  {1CDF1}  sub      ax, di                      
  {1CDF3}  dec      ax                          
  {1CDF4}  stosb    byte ptr es:[di], al        
  {1CDF5}  pop      bp                          
  {1CDF6}  retf     6                           
  {1CDF9}  lodsb    al, byte ptr [si]           
  {1CDFA}  cmp      al, 0xd                     
  {1CDFC}  je       0x1ce0d                     
  {1CDFE}  cmp      al, 0x1a                    
  {1CE00}  je       0x1ce0d                     
  {1CE02}  stosb    byte ptr es:[di], al        
  {1CE03}  cmp      si, bx                      
  {1CE05}  loopne   0x1cdf9                     
  {1CE07}  jcxz     0x1ce0e                     
  {1CE09}  mov      ax, 0x6e9                   
  {1CE0C}  ret                                  
  {1CE0D}  dec      si                          
  {1CE0E}  xor      ax, ax                      
  {1CE10}  ret                                  
  {1CE11}  push     bp                          
  {1CE12}  mov      bp, sp                      
  {1CE14}  les      bx, ptr [bp + 8]            
  {1CE17}  mov      al, byte ptr es:[bx]        
  {1CE1A}  xor      ah, ah                      
  {1CE1C}  les      bx, ptr [bp + 0xc]          
  {1CE1F}  mov      dx, word ptr [bp + 6]       
  {1CE22}  sub      dx, ax                      
  {1CE24}  jle      0x1ce2b                     
  {1CE26}  push     ax                          
  {1CE27}  call     0x1cc07                     
  {1CE2A}  pop      ax                          
  {1CE2B}  or       ax, ax                      
  {1CE2D}  je       0x1ce39                     
  {1CE2F}  mov      si, word ptr [bp + 8]       
  {1CE32}  mov      dx, word ptr [bp + 0xa]     
  {1CE35}  inc      si                          
  {1CE36}  call     0x1cc56                     
  {1CE39}  pop      bp                          
  {1CE3A}  retf     6                           
  {1CE3D}  push     bp                          
  {1CE3E}  mov      bp, sp                      
  {1CE40}  sub      sp, 0x20                    
  {1CE43}  les      bx, ptr [bp + 6]            
  {1CE46}  mov      ax, 0x764                   
  {1CE49}  mov      cx, 0x20                    
  {1CE4C}  lea      di, [bp - 0x20]             
  {1CE4F}  mov      dx, ss                      
  {1CE51}  call     0x1cba9                     
  {1CE54}  mov      cx, di                      
  {1CE56}  lea      di, [bp - 0x20]             
  {1CE59}  sub      cx, di                      
  {1CE5B}  je       0x1ce6c                     
  {1CE5D}  push     ss                          
  {1CE5E}  pop      es                          
  {1CE5F}  call     0x1d3d2                     
  {1CE62}  jb       0x1ce66                     
  {1CE64}  jcxz     0x1ce70                     
  {1CE66}  mov      word ptr [0x3c], 0x6a       
  {1CE6C}  xor      ax, ax                      
  {1CE6E}  mov      dx, ax                      
  {1CE70}  mov      sp, bp                      
  {1CE72}  pop      bp                          
  {1CE73}  retf                                 
  {1CE74}  lodsb    al, byte ptr [si]           
  {1CE75}  cmp      al, 0x20                    

{ BODY-B  para 05DD:1C71  (PRZEDM interaction)   abs=07A41 }
  {07A41}  fld      qword ptr [di]              
  {07A43}  jno      0x7a61                      
  {07A45}  lcall    0x1c71, 0x291               
  {07A4A}  mov      di, 0x7a2                   
  {07A4D}  push     ds                          
  {07A4E}  push     di                          
  {07A4F}  mov      di, 0x679e                  
  {07A52}  push     cs                          
  {07A53}  push     di                          
  {07A54}  xor      ax, ax                      
  {07A56}  push     ax                          
  {07A57}  lcall    0x1c71, 0x701               
  {07A5C}  lcall    0x1c71, 0x5dd               
  {07A61}  lcall    0x1c71, 0x291               
  {07A66}  mov      di, 0x564                   
  {07A69}  push     ds                          
  {07A6A}  push     di                          
  {07A6B}  mov      di, 0x600d                  
  {07A6E}  push     cs                          
  {07A6F}  push     di                          
  {07A70}  lcall    0x1c71, 0x9d7               
  {07A75}  jne      0x7a7a                      
  {07A77}  jmp      0x7d69                      
  {07A7A}  mov      di, 0x564                   
  {07A7D}  push     ds                          
  {07A7E}  push     di                          
  {07A7F}  mov      di, 0x601c                  
  {07A82}  push     cs                          
  {07A83}  push     di                          
  {07A84}  lcall    0x1c71, 0x9d7               
  {07A89}  jne      0x7a91                      
  {07A8B}  mov      word ptr [0x1d6], 0x45      
  {07A91}  mov      di, 0x564                   
  {07A94}  push     ds                          
  {07A95}  push     di                          
  {07A96}  mov      di, 0x6023                  
  {07A99}  push     cs                          
  {07A9A}  push     di                          
  {07A9B}  lcall    0x1c71, 0x9d7               
  {07AA0}  jne      0x7aa8                      
  {07AA2}  mov      word ptr [0x1d6], 0x47      
  {07AA8}  lcall    0x129d, 0x85c7              
  {07AAD}  cmp      word ptr [0x1d6], 0x46      
  {07AB2}  jne      0x7ab7                      
  {07AB4}  jmp      0x798b                      
  {07AB7}  cmp      word ptr [0x1d6], 0x47      
  {07ABC}  je       0x7ac1                      
  {07ABE}  jmp      0x7c2a                      
  {07AC1}  mov      di, 0x7a2                   
  {07AC4}  push     ds                          
  {07AC5}  push     di                          
  {07AC6}  mov      di, 0x67b4                  
  {07AC9}  push     cs                          
  {07ACA}  push     di                          
  {07ACB}  xor      ax, ax                      
  {07ACD}  push     ax                          
  {07ACE}  lcall    0x1c71, 0x701               
  {07AD3}  lcall    0x1c71, 0x5dd               
  {07AD8}  lcall    0x1c71, 0x291               
  {07ADD}  mov      di, 0x7a2                   
  {07AE0}  push     ds                          
  {07AE1}  push     di                          
  {07AE2}  mov      di, 0x67fa                  
  {07AE5}  push     cs                          
  {07AE6}  push     di                          
  {07AE7}  xor      ax, ax                      
  {07AE9}  push     ax                          
  {07AEA}  lcall    0x1c71, 0x701               
  {07AEF}  lcall    0x1c71, 0x5dd               
  {07AF4}  lcall    0x1c71, 0x291               
  {07AF9}  lcall    0x129d, 0x31ff              
  {07AFE}  mov      di, 0x7a2                   
  {07B01}  push     ds                          
  {07B02}  push     di                          
  {07B03}  mov      ax, word ptr [0x19c]        
  {07B06}  cdq                                  
  {07B07}  push     dx                          
  {07B08}  push     ax                          
  {07B09}  xor      ax, ax                      
  {07B0B}  push     ax                          
  {07B0C}  lcall    0x1c71, 0x789               
  {07B11}  mov      di, 0x5fbd                  
  {07B14}  push     cs                          
  {07B15}  push     di                          
  {07B16}  xor      ax, ax                      
  {07B18}  push     ax                          
  {07B19}  lcall    0x1c71, 0x701               
  {07B1E}  mov      ax, word ptr [0x1d4]        
  {07B21}  cdq                                  
  {07B22}  push     dx                          
  {07B23}  push     ax                          
  {07B24}  xor      ax, ax                      
  {07B26}  push     ax                          
  {07B27}  lcall    0x1c71, 0x789               
  {07B2C}  mov      al, 0x3e                    
  {07B2E}  push     ax                          
  {07B2F}  xor      ax, ax                      
  {07B31}  push     ax                          
  {07B32}  lcall    0x1c71, 0x67b               
  {07B37}  lcall    0x1c71, 0x5fe               
  {07B3C}  lcall    0x1c71, 0x291               
  {07B41}  mov      di, 0x6a2                   
  {07B44}  push     ds                          
  {07B45}  push     di                          
  {07B46}  mov      di, 0x564                   
  {07B49}  push     ds                          
  {07B4A}  push     di                          
  {07B4B}  mov      ax, 0xff                    
  {07B4E}  push     ax                          
  {07B4F}  lcall    0x1c71, 0x6c6               
  {07B54}  lcall    0x1c71, 0x59d               
  {07B59}  lcall    0x1c71, 0x291               
  {07B5E}  mov      di, 0x564                   
  {07B61}  push     ds                          
  {07B62}  push     di                          
  {07B63}  mov      di, 0x5fc0                  
  {07B66}  push     cs                          
  {07B67}  push     di                          
  {07B68}  lcall    0x1c71, 0x9d7               
  {07B6D}  jne      0x7b74                      
  {07B6F}  lcall    0x129d, 0x3114              
  {07B74}  mov      di, 0x564                   
  {07B77}  push     ds                          
  {07B78}  push     di                          
  {07B79}  mov      di, 0x5fc5                  
  {07B7C}  push     cs                          
  {07B7D}  push     di                          
  {07B7E}  lcall    0x1c71, 0x9d7               
  {07B83}  jne      0x7bd9                      
  {07B85}  mov      di, 0x7a2                   
  {07B88}  push     ds                          
  {07B89}  push     di                          
  {07B8A}  mov      di, 0x5fca                  
  {07B8D}  push     cs                          
  {07B8E}  push     di                          
  {07B8F}  xor      ax, ax                      
  {07B91}  push     ax                          
  {07B92}  lcall    0x1c71, 0x701               
  {07B97}  lcall    0x1c71, 0x5dd               
  {07B9C}  lcall    0x1c71, 0x291               
  {07BA1}  mov      di, 0x7a2                   
  {07BA4}  push     ds                          
  {07BA5}  push     di                          
  {07BA6}  mov      di, 0x6791                  
  {07BA9}  push     cs                          
  {07BAA}  push     di                          
  {07BAB}  xor      ax, ax                      
  {07BAD}  push     ax                          
  {07BAE}  lcall    0x1c71, 0x701               
  {07BB3}  lcall    0x1c71, 0x5dd               
  {07BB8}  lcall    0x1c71, 0x291               
  {07BBD}  mov      di, 0x7a2                   
  {07BC0}  push     ds                          
  {07BC1}  push     di                          
  {07BC2}  mov      di, 0x663f                  
  {07BC5}  push     cs                          
  {07BC6}  push     di                          
  {07BC7}  xor      ax, ax                      
  {07BC9}  push     ax                          
  {07BCA}  lcall    0x1c71, 0x701               
  {07BCF}  lcall    0x1c71, 0x5dd               
  {07BD4}  lcall    0x1c71, 0x291               
  {07BD9}  mov      di, 0x564                   
  {07BDC}  push     ds                          
  {07BDD}  push     di                          
  {07BDE}  mov      di, 0x600d                  
  {07BE1}  push     cs                          
  {07BE2}  push     di                          
  {07BE3}  lcall    0x1c71, 0x9d7               
  {07BE8}  jne      0x7bed                      
  {07BEA}  jmp      0x7d69                      
  {07BED}  mov      di, 0x564                   
  {07BF0}  push     ds                          
  {07BF1}  push     di                          
  {07BF2}  mov      di, 0x601c                  
  {07BF5}  push     cs                          
  {07BF6}  push     di                          
  {07BF7}  lcall    0x1c71, 0x9d7               
  {07BFC}  jne      0x7c04                      
  {07BFE}  mov      word ptr [0x1d6], 0x46      
  {07C04}  mov      di, 0x564                   
  {07C07}  push     ds                          
  {07C08}  push     di                          
  {07C09}  mov      di, 0x6023                  
  {07C0C}  push     cs                          
  {07C0D}  push     di                          
  {07C0E}  lcall    0x1c71, 0x9d7               
  {07C13}  jne      0x7c1b                      
  {07C15}  mov      word ptr [0x1d6], 0x48      
  {07C1B}  lcall    0x129d, 0x85c7              
  {07C20}  cmp      word ptr [0x1d6], 0x47      
  {07C25}  jne      0x7c2a                      
  {07C27}  jmp      0x7afe                      
  {07C2A}  cmp      word ptr [0x1d6], 0x48      
  {07C2F}  je       0x7c34                      
  {07C31}  jmp      0x7d69                      
  {07C34}  mov      di, 0x7a2                   
  {07C37}  push     ds                          
  {07C38}  push     di                          
  {07C39}  mov      di, 0x6832                  
  {07C3C}  push     cs                          
  {07C3D}  push     di                          
  {07C3E}  xor      ax, ax                      
  {07C40}  push     ax                          
  {07C41}  lcall    0x1c71, 0x701               
  {07C46}  lcall    0x1c71, 0x5dd               
  {07C4B}  lcall    0x1c71, 0x291               
  {07C50}  mov      di, 0x7a2                   
  {07C53}  push     ds                          
  {07C54}  push     di                          
  {07C55}  mov      di, 0x6874                  
  {07C58}  push     cs                          
  {07C59}  push     di                          
  {07C5A}  xor      ax, ax                      
  {07C5C}  push     ax                          
  {07C5D}  lcall    0x1c71, 0x701               
  {07C62}  lcall    0x1c71, 0x5dd               
  {07C67}  lcall    0x1c71, 0x291               
  {07C6C}  lcall    0x129d, 0x31ff              
  {07C71}  mov      di, 0x7a2                   
  {07C74}  push     ds                          
  {07C75}  push     di                          
  {07C76}  mov      ax, word ptr [0x19c]        
  {07C79}  cdq                                  
  {07C7A}  push     dx                          
  {07C7B}  push     ax                          
  {07C7C}  xor      ax, ax                      
  {07C7E}  push     ax                          
  {07C7F}  lcall    0x1c71, 0x789               
  {07C84}  mov      di, 0x5fbd                  
  {07C87}  push     cs                          
  {07C88}  push     di                          
  {07C89}  xor      ax, ax                      
  {07C8B}  push     ax                          
  {07C8C}  lcall    0x1c71, 0x701               
  {07C91}  mov      ax, word ptr [0x1d4]        
  {07C94}  cdq                                  
  {07C95}  push     dx                          
  {07C96}  push     ax                          
  {07C97}  xor      ax, ax                      
  {07C99}  push     ax                          
  {07C9A}  lcall    0x1c71, 0x789               
  {07C9F}  mov      al, 0x3e                    
  {07CA1}  push     ax                          
  {07CA2}  xor      ax, ax                      
  {07CA4}  push     ax                          
  {07CA5}  lcall    0x1c71, 0x67b               
  {07CAA}  lcall    0x1c71, 0x5fe               
  {07CAF}  lcall    0x1c71, 0x291               
  {07CB4}  mov      di, 0x6a2                   
  {07CB7}  push     ds                          
  {07CB8}  push     di                          
  {07CB9}  mov      di, 0x564                   
  {07CBC}  push     ds                          
  {07CBD}  push     di                          
  {07CBE}  mov      ax, 0xff                    
  {07CC1}  push     ax                          
  {07CC2}  lcall    0x1c71, 0x6c6               
  {07CC7}  lcall    0x1c71, 0x59d               
  {07CCC}  lcall    0x1c71, 0x291               
  {07CD1}  mov      di, 0x564                   
  {07CD4}  push     ds                          
  {07CD5}  push     di                          
  {07CD6}  mov      di, 0x5fc0                  
  {07CD9}  push     cs                          
  {07CDA}  push     di                          
  {07CDB}  lcall    0x1c71, 0x9d7               
  {07CE0}  jne      0x7ce7                      
  {07CE2}  lcall    0x129d, 0x3114              
  {07CE7}  mov      di, 0x564                   
  {07CEA}  push     ds                          
  {07CEB}  push     di                          
  {07CEC}  mov      di, 0x5fc5                  
  {07CEF}  push     cs                          
  {07CF0}  push     di                          
  {07CF1}  lcall    0x1c71, 0x9d7               
  {07CF6}  jne      0x7d30                      
  {07CF8}  mov      di, 0x7a2                   
  {07CFB}  push     ds                          
  {07CFC}  push     di                          
  {07CFD}  mov      di, 0x5fca                  
  {07D00}  push     cs                          
  {07D01}  push     di                          
  {07D02}  xor      ax, ax                      
  {07D04}  push     ax                          
  {07D05}  lcall    0x1c71, 0x701               
  {07D0A}  lcall    0x1c71, 0x5dd               
  {07D0F}  lcall    0x1c71, 0x291               
  {07D14}  mov      di, 0x7a2                   
  {07D17}  push     ds                          
  {07D18}  push     di                          
  {07D19}  mov      di, 0x68a8                  
  {07D1C}  push     cs                          
  {07D1D}  push     di                          
  {07D1E}  xor      ax, ax                      
  {07D20}  push     ax                          
  {07D21}  lcall    0x1c71, 0x701               
  {07D26}  lcall    0x1c71, 0x5dd               
  {07D2B}  lcall    0x1c71, 0x291               
  {07D30}  mov      di, 0x564                   
  {07D33}  push     ds                          
  {07D34}  push     di                          
  {07D35}  mov      di, 0x600d                  
  {07D38}  push     cs                          
  {07D39}  push     di                          
  {07D3A}  lcall    0x1c71, 0x9d7               
  {07D3F}  jne      0x7d43                      
  {07D41}  jmp      0x7d69                      
  {07D43}  mov      di, 0x564                   
  {07D46}  push     ds                          
  {07D47}  push     di                          
  {07D48}  mov      di, 0x601c                  
  {07D4B}  push     cs                          
  {07D4C}  push     di                          
  {07D4D}  lcall    0x1c71, 0x9d7               
  {07D52}  jne      0x7d5a                      
  {07D54}  mov      word ptr [0x1d6], 0x47      
  {07D5A}  lcall    0x129d, 0x85c7              
  {07D5F}  cmp      word ptr [0x1d6], 0x48      
  {07D64}  jne      0x7d69                      
  {07D66}  jmp      0x7c71                      
  {07D69}  pop      bp                          
  {07D6A}  ret                                  
  {07D6B}  or       word ptr [bx + si + 0x6c], si
  {07D6E}  imul     bp, word ptr [bp + di + 0x69], 0x742e
  {07D73}  jo       0x7dea                      
  {07D75}  or       dh, byte ptr [bp + di + 0x75]
  {07D78}  arpl     word ptr [bp + di + 0x65], bp
  {07D7B}  insw     word ptr es:[di], dx        
  {07D7C}  popaw                                
  {07D7D}  insb     byte ptr es:[di], dx        
  {07D7E}  insb     byte ptr es:[di], dx        
  {07D7F}  cmp      dl, byte ptr [di - 0x77]    
  {07D82}  in       ax, 0x31                    
  {07D84}  rcr      byte ptr [bp + si + 0x2cd], 0x71
  {07D89}  sbb      al, 0xbf                    
  {07D8B}  mov      byte ptr [0x1e06], al       
  {07D8E}  push     di                          
  {07D8F}  mov      di, 0x564                   
  {07D92}  push     ds                          
  {07D93}  push     di                          
  {07D94}  mov      ax, 0xff                    
  {07D97}  push     ax                          
  {07D98}  lcall    0x1c71, 0x6c6               
  {07D9D}  lcall    0x1c71, 0x59d               
  {07DA2}  lcall    0x1c71, 0x291               
  {07DA7}  mov      di, 0x7e                    
  {07DAA}  push     ds                          
  {07DAB}  push     di                          
  {07DAC}  mov      di, 0x7d6b                  
  {07DAF}  push     cs                          
  {07DB0}  push     di                          
  {07DB1}  lcall    0x1c71, 0x2e6               
  {07DB6}  mov      di, 0x7e                    
  {07DB9}  push     ds                          
  {07DBA}  push     di                          
  {07DBB}  lcall    0x1c71, 0x364               
  {07DC0}  lcall    0x1c71, 0x291               
  {07DC5}  mov      di, 0x7e                    
  {07DC8}  push     ds                          
  {07DC9}  push     di                          
  {07DCA}  lcall    0x1c71, 0x72d               
  {07DCF}  mov      word ptr [0x1ac], ax        
  {07DD2}  lcall    0x1c71, 0x5fe               
  {07DD7}  lcall    0x1c71, 0x291               
  {07DDC}  mov      ax, word ptr [0x1ac]        
  {07DDF}  cdq                                  
  {07DE0}  mov      cx, 4                       
  {07DE3}  idiv     cx                          
  {07DE5}  mov      word ptr [0x1ac], ax        
  {07DE8}  mov      di, 0x7e                    
  {07DEB}  push     ds                          
  {07DEC}  push     di                          
  {07DED}  lcall    0x1c71, 0x72d               
  {07DF2}  mov      byte ptr [0x25c], al        
  {07DF5}  lcall    0x1c71, 0x5fe               
  {07DFA}  lcall    0x1c71, 0x291               
  {07DFF}  mov      al, byte ptr [0x25c]        
  {07E02}  cwde                                 
  {07E03}  sub      ax, 0x17                    
  {07E06}  mov      byte ptr [0x25c], al        
  {07E09}  mov      di, 0x7e                    
  {07E0C}  push     ds                          
  {07E0D}  push     di                          
  {07E0E}  lcall    0x1c71, 0x72d               
  {07E13}  mov      word ptr [0x17e], ax        
  {07E16}  lcall    0x1c71, 0x5fe               
  {07E1B}  lcall    0x1c71, 0x291               
  {07E20}  mov      di, 0x7e                    
  {07E23}  push     ds                          
  {07E24}  push     di                          
  {07E25}  lcall    0x1c71, 0x72d               
  {07E2A}  mov      word ptr [0x18a], ax        
  {07E2D}  lcall    0x1c71, 0x5fe               
  {07E32}  lcall    0x1c71, 0x291               
  {07E37}  mov      di, 0x7e                    
  {07E3A}  push     ds                          
  {07E3B}  push     di                          
  {07E3C}  lcall    0x1c71, 0x72d               
  {07E41}  mov      word ptr [0x188], ax           // PRZEDM.ZWIEJ
  {07E44}  lcall    0x1c71, 0x5fe               
  {07E49}  lcall    0x1c71, 0x291               
  {07E4E}  mov      di, 0x7e                    
  {07E51}  push     ds                          
  {07E52}  push     di                          
  {07E53}  lcall    0x1c71, 0x72d               
  {07E58}  mov      word ptr [0x184], ax           // PRZEDM.PASZOL
  {07E5B}  lcall    0x1c71, 0x5fe               
  {07E60}  lcall    0x1c71, 0x291               
  {07E65}  mov      di, 0x7e                    
  {07E68}  push     ds                          
  {07E69}  push     di                          
  {07E6A}  lcall    0x1c71, 0x72d               
  {07E6F}  mov      word ptr [0x222], ax        
  {07E72}  lcall    0x1c71, 0x5fe               
  {07E77}  lcall    0x1c71, 0x291               
  {07E7C}  mov      di, 0x7e                    
  {07E7F}  push     ds                          
  {07E80}  push     di                          
  {07E81}  lcall    0x1c71, 0x72d               
  {07E86}  mov      word ptr [0x1d4], ax        
  {07E89}  lcall    0x1c71, 0x5fe               
  {07E8E}  lcall    0x1c71, 0x291               
  {07E93}  mov      di, 0x7e                    
  {07E96}  push     ds                          
  {07E97}  push     di                          
  {07E98}  lcall    0x1c71, 0x72d               
  {07E9D}  mov      word ptr [0x19c], ax        
  {07EA0}  lcall    0x1c71, 0x5fe               
  {07EA5}  lcall    0x1c71, 0x291               
  {07EAA}  mov      ax, word ptr [0x19c]        
  {07EAD}  cdq                                  
  {07EAE}  mov      cx, 4                       
  {07EB1}  idiv     cx                          
  {07EB3}  mov      word ptr [0x19c], ax        
  {07EB6}  mov      ax, word ptr [0x19c]        
  {07EB9}  sub      ax, 0x28                    
  {07EBC}  mov      word ptr [0x19c], ax        
  {07EBF}  mov      di, 0x7e                    
  {07EC2}  push     ds                          
  {07EC3}  push     di                          
  {07EC4}  lcall    0x1c71, 0x72d               
  {07EC9}  mov      word ptr [0x180], ax           // PRZEDM.MIECHO
  {07ECC}  lcall    0x1c71, 0x5fe               
  {07ED1}  lcall    0x1c71, 0x291               
  {07ED6}  mov      di, 0x7e                    
  {07ED9}  push     ds                          
  {07EDA}  push     di                          
  {07EDB}  lcall    0x1c71, 0x72d               
  {07EE0}  mov      word ptr [0x190], ax           // PRZEDM.PAR
  {07EE3}  lcall    0x1c71, 0x5fe               
  {07EE8}  lcall    0x1c71, 0x291               
  {07EED}  mov      ax, word ptr [0x190]        
  {07EF0}  sub      ax, 0xc                     
  {07EF3}  mov      word ptr [0x190], ax           // PRZEDM.PAR
  {07EF6}  mov      di, 0x7e                    
  {07EF9}  push     ds                          
  {07EFA}  push     di                          
  {07EFB}  lcall    0x1c71, 0x72d               
  {07F00}  mov      word ptr [0x18e], ax        
  {07F03}  lcall    0x1c71, 0x5fe               
  {07F08}  lcall    0x1c71, 0x291               
  {07F0D}  mov      ax, word ptr [0x18e]        
  {07F10}  add      ax, 0x18                    
  {07F13}  mov      word ptr [0x18e], ax        
  {07F16}  mov      di, 0x7e                    
  {07F19}  push     ds                          
  {07F1A}  push     di                          
  {07F1B}  lcall    0x1c71, 0x72d               
  {07F20}  mov      word ptr [0x18c], ax        
  {07F23}  lcall    0x1c71, 0x5fe               
  {07F28}  lcall    0x1c71, 0x291               
  {07F2D}  mov      di, 0x7e                    
  {07F30}  push     ds                          
  {07F31}  push     di                          
  {07F32}  lcall    0x1c71, 0x72d               
  {07F37}  mov      word ptr [0x194], ax           // PRZEDM.PRO
  {07F3A}  lcall    0x1c71, 0x5fe               
  {07F3F}  lcall    0x1c71, 0x291               
  {07F44}  mov      di, 0x7e                    
  {07F47}  push     ds                          
  {07F48}  push     di                          
  {07F49}  lcall    0x1c71, 0x72d               
  {07F4E}  mov      word ptr [0x6c], ax         
  {07F51}  lcall    0x1c71, 0x5fe               
  {07F56}  lcall    0x1c71, 0x291               
  {07F5B}  mov      di, 0x7e                    
  {07F5E}  push     ds                          
  {07F5F}  push     di                          
  {07F60}  lcall    0x1c71, 0x72d               
  {07F65}  mov      word ptr [0x52], ax         
  {07F68}  lcall    0x1c71, 0x5fe               
  {07F6D}  lcall    0x1c71, 0x291               
  {07F72}  mov      di, 0x7e                    
  {07F75}  push     ds                          
  {07F76}  push     di                          
  {07F77}  lcall    0x1c71, 0x72d               
  {07F7C}  mov      word ptr [0x1b2], ax        
  {07F7F}  lcall    0x1c71, 0x5fe               
  {07F84}  lcall    0x1c71, 0x291               
  {07F89}  mov      di, 0x7e                    
  {07F8C}  push     ds                          
  {07F8D}  push     di                          
  {07F8E}  lcall    0x1c71, 0x72d               
  {07F93}  mov      word ptr [0x21a], ax        
  {07F96}  mov      word ptr [0x21c], dx        
  {07F9A}  lcall    0x1c71, 0x5fe               
  {07F9F}  lcall    0x1c71, 0x291               
  {07FA4}  mov      ax, word ptr [0x18c]        
  {07FA7}  cdq                                  
  {07FA8}  mov      cx, ax                      
  {07FAA}  mov      bx, dx                      
  {07FAC}  mov      ax, word ptr [0x21a]        
  {07FAF}  mov      dx, word ptr [0x21c]        
  {07FB3}  lcall    0x1c71, 0x7fa               
  {07FB8}  mov      word ptr [0x21a], ax        
  {07FBB}  mov      word ptr [0x21c], dx        
  {07FBF}  mov      di, 0x7e                    
  {07FC2}  push     ds                          
  {07FC3}  push     di                          
  {07FC4}  lcall    0x1c71, 0x72d               
  {07FC9}  mov      word ptr [0x212], ax        
  {07FCC}  lcall    0x1c71, 0x5fe               
  {07FD1}  lcall    0x1c71, 0x291               
  {07FD6}  mov      di, 0x7e                    
  {07FD9}  push     ds                          
  {07FDA}  push     di                          
  {07FDB}  lcall    0x1c71, 0x72d               
  {07FE0}  mov      word ptr [0x664], ax        
  {07FE3}  lcall    0x1c71, 0x5fe               
  {07FE8}  lcall    0x1c71, 0x291               
  {07FED}  mov      di, 0x7e                    
  {07FF0}  push     ds                          
  {07FF1}  push     di                          
  {07FF2}  lcall    0x1c71, 0x72d               
  {07FF7}  mov      word ptr [0x62], ax         
  {07FFA}  lcall    0x1c71, 0x5fe               
  {07FFF}  lcall    0x1c71, 0x291               
  {08004}  mov      di, 0x7e                    
  {08007}  push     ds                          
  {08008}  push     di                          
  {08009}  lcall    0x1c71, 0x72d               
  {0800E}  mov      byte ptr [0x25d], al        
  {08011}  lcall    0x1c71, 0x5fe               
  {08016}  lcall    0x1c71, 0x291               
  {0801B}  mov      di, 0x7e                    
  {0801E}  push     ds                          
  {0801F}  push     di                          
  {08020}  lcall    0x1c71, 0x72d               
  {08025}  mov      word ptr [0x1ae], ax        
  {08028}  lcall    0x1c71, 0x5fe               
  {0802D}  lcall    0x1c71, 0x291               
  {08032}  mov      di, 0x7e                    
  {08035}  push     ds                          
  {08036}  push     di                          
  {08037}  lcall    0x1c71, 0x72d               
  {0803C}  mov      word ptr [0x198], ax           // PRZEDM.SZANSA
  {0803F}  lcall    0x1c71, 0x5fe               
  {08044}  lcall    0x1c71, 0x291               
  {08049}  mov      di, 0x7e                    
  {0804C}  push     ds                          
  {0804D}  push     di                          
  {0804E}  lcall    0x1c71, 0x72d               
  {08053}  mov      word ptr [0x19a], ax        
  {08056}  lcall    0x1c71, 0x5fe               
  {0805B}  lcall    0x1c71, 0x291               
  {08060}  mov      di, 0x7e                    
  {08063}  push     ds                          
  {08064}  push     di                          
  {08065}  lcall    0x1c71, 0x72d               
  {0806A}  mov      word ptr [0x196], ax           // PRZEDM.WPYSK
  {0806D}  lcall    0x1c71, 0x5fe               
  {08072}  lcall    0x1c71, 0x291               
  {08077}  mov      di, 0x7e                    
  {0807A}  push     ds                          
  {0807B}  push     di                          
  {0807C}  lcall    0x1c71, 0x72d               
  {08081}  mov      word ptr [0x182], ax           // PRZEDM.KUNSZT
  {08084}  lcall    0x1c71, 0x5fe               
  {08089}  lcall    0x1c71, 0x291               
  {0808E}  mov      di, 0x7e                    
  {08091}  push     ds                          
  {08092}  push     di                          
  {08093}  lcall    0x1c71, 0x72d               
  {08098}  mov      word ptr [0x1c2], ax        
  {0809B}  lcall    0x1c71, 0x5fe               
  {080A0}  lcall    0x1c71, 0x291               
  {080A5}  mov      di, 0x7e                    
  {080A8}  push     ds                          
  {080A9}  push     di                          
  {080AA}  lcall    0x1c71, 0x72d               
  {080AF}  mov      word ptr [0x224], ax        
  {080B2}  lcall    0x1c71, 0x5fe               
  {080B7}  lcall    0x1c71, 0x291               
  {080BC}  mov      di, 0x7e                    
  {080BF}  push     ds                          
  {080C0}  push     di                          
  {080C1}  lcall    0x1c71, 0x72d               
  {080C6}  mov      word ptr [0x54], ax         
  {080C9}  lcall    0x1c71, 0x5fe               
  {080CE}  lcall    0x1c71, 0x291               
  {080D3}  mov      di, 0x7e                    
  {080D6}  push     ds                          
  {080D7}  push     di                          
  {080D8}  lcall    0x1c71, 0x72d               
  {080DD}  mov      word ptr [0x218], ax        
  {080E0}  lcall    0x1c71, 0x5fe               
  {080E5}  lcall    0x1c71, 0x291               
  {080EA}  mov      di, 0x7e                    
  {080ED}  push     ds                          
  {080EE}  push     di                          
  {080EF}  lcall    0x1c71, 0x72d               
  {080F4}  mov      word ptr [0x686], ax        
  {080F7}  lcall    0x1c71, 0x5fe               
  {080FC}  lcall    0x1c71, 0x291               
  {08101}  mov      di, 0x7e                    
  {08104}  push     ds                          
  {08105}  push     di                          
  {08106}  lcall    0x1c71, 0x72d               
  {0810B}  mov      word ptr [0x56], ax         
  {0810E}  lcall    0x1c71, 0x5fe               
  {08113}  lcall    0x1c71, 0x291               
  {08118}  mov      di, 0x7e                    
  {0811B}  push     ds                          
  {0811C}  push     di                          
  {0811D}  lcall    0x1c71, 0x72d               
  {08122}  mov      word ptr [0x58], ax         
  {08125}  lcall    0x1c71, 0x5fe               
  {0812A}  lcall    0x1c71, 0x291               
  {0812F}  mov      di, 0x7e                    
  {08132}  push     ds                          
  {08133}  push     di                          
  {08134}  lcall    0x1c71, 0x72d               
  {08139}  mov      word ptr [0x68c], ax        
  {0813C}  lcall    0x1c71, 0x5fe               
  {08141}  lcall    0x1c71, 0x291               
  {08146}  mov      di, 0x7e                    
  {08149}  push     ds                          
  {0814A}  push     di                          
  {0814B}  lcall    0x1c71, 0x72d               
  {08150}  mov      word ptr [0x5a], ax         
  {08153}  lcall    0x1c71, 0x5fe               
  {08158}  lcall    0x1c71, 0x291               
  {0815D}  mov      di, 0x7e                    
  {08160}  push     ds                          
  {08161}  push     di                          
  {08162}  lcall    0x1c71, 0x72d               
  {08167}  mov      word ptr [0x5c], ax         
  {0816A}  lcall    0x1c71, 0x5fe               
  {0816F}  lcall    0x1c71, 0x291               
  {08174}  mov      di, 0x7e                    
  {08177}  push     ds                          
  {08178}  push     di                          
  {08179}  lcall    0x1c71, 0x72d               
  {0817E}  mov      word ptr [0x5e], ax         
  {08181}  lcall    0x1c71, 0x5fe               
  {08186}  lcall    0x1c71, 0x291               
  {0818B}  mov      di, 0x7e                    
  {0818E}  push     ds                          
  {0818F}  push     di                          
  {08190}  lcall    0x1c71, 0x72d               
  {08195}  mov      word ptr [0x60], ax         
  {08198}  lcall    0x1c71, 0x5fe               
  {0819D}  lcall    0x1c71, 0x291               
  {081A2}  mov      di, 0x7e                    
  {081A5}  push     ds                          
  {081A6}  push     di                          
  {081A7}  lcall    0x1c71, 0x72d               
  {081AC}  mov      word ptr [0x6e], ax         
  {081AF}  lcall    0x1c71, 0x5fe               
  {081B4}  lcall    0x1c71, 0x291               
  {081B9}  mov      di, 0x7e                    
  {081BC}  push     ds                          
  {081BD}  push     di                          
  {081BE}  lcall    0x1c71, 0x72d               
  {081C3}  mov      byte ptr [0x258], al        
  {081C6}  lcall    0x1c71, 0x5fe               
  {081CB}  lcall    0x1c71, 0x291               
  {081D0}  mov      di, 0x7e                    
  {081D3}  push     ds                          
  {081D4}  push     di                          
  {081D5}  lcall    0x1c71, 0x72d               
  {081DA}  mov      word ptr [0x74], ax         
  {081DD}  lcall    0x1c71, 0x5fe               
  {081E2}  lcall    0x1c71, 0x291               
  {081E7}  mov      di, 0x7e                    
  {081EA}  push     ds                          
  {081EB}  push     di                          
  {081EC}  lcall    0x1c71, 0x72d               
  {081F1}  mov      word ptr [0x76], ax         
  {081F4}  lcall    0x1c71, 0x5fe               
  {081F9}  lcall    0x1c71, 0x291               
  {081FE}  mov      di, 0x7e                    
  {08201}  push     ds                          
  {08202}  push     di                          
  {08203}  lcall    0x1c71, 0x72d               
  {08208}  mov      word ptr [0x186], ax           // PRZEDM.WIMP
  {0820B}  lcall    0x1c71, 0x5fe               
  {08210}  lcall    0x1c71, 0x291               
  {08215}  mov      di, 0x7e                    
  {08218}  push     ds                          
  {08219}  push     di                          
  {0821A}  lcall    0x1c71, 0x72d               
  {0821F}  mov      word ptr [0x192], ax           // PRZEDM.ILOSC
  {08222}  lcall    0x1c71, 0x5fe               
  {08227}  lcall    0x1c71, 0x291               
  {0822C}  mov      di, 0x7e                    
  {0822F}  push     ds                          
  {08230}  push     di                          
  {08231}  lcall    0x1c71, 0x72d               
  {08236}  mov      word ptr [0x1a2], ax        
  {08239}  lcall    0x1c71, 0x5fe               
  {0823E}  lcall    0x1c71, 0x291               
  {08243}  mov      di, 0x7e                    
  {08246}  push     ds                          
  {08247}  push     di                          
  {08248}  lcall    0x1c71, 0x72d               
  {0824D}  mov      word ptr [0x1a4], ax        
  {08250}  lcall    0x1c71, 0x5fe               
  {08255}  lcall    0x1c71, 0x291               
  {0825A}  mov      di, 0x7e                    
  {0825D}  push     ds                          
  {0825E}  push     di                          
  {0825F}  lcall    0x1c71, 0x72d               
  {08264}  mov      word ptr [0x1a6], ax        
  {08267}  lcall    0x1c71, 0x5fe               
  {0826C}  lcall    0x1c71, 0x291               
  {08271}  mov      di, 0x7e                    
  {08274}  push     ds                          
  {08275}  push     di                          
  {08276}  lcall    0x1c71, 0x72d               
  {0827B}  mov      word ptr [0x1a8], ax        
  {0827E}  lcall    0x1c71, 0x5fe               
  {08283}  lcall    0x1c71, 0x291               
  {08288}  mov      di, 0x7e                    
  {0828B}  push     ds                          
  {0828C}  push     di                          
  {0828D}  lcall    0x1c71, 0x72d               
  {08292}  mov      word ptr [0x1aa], ax        
  {08295}  lcall    0x1c71, 0x5fe               
  {0829A}  lcall    0x1c71, 0x291               
  {0829F}  mov      di, 0x7e                    
  {082A2}  push     ds                          
  {082A3}  push     di                          
  {082A4}  lcall    0x1c71, 0x72d               
  {082A9}  mov      word ptr [0x1a6], ax        
  {082AC}  lcall    0x1c71, 0x5fe               
  {082B1}  lcall    0x1c71, 0x291               
  {082B6}  mov      di, 0x7e                    
  {082B9}  push     ds                          
  {082BA}  push     di                          
  {082BB}  lcall    0x1c71, 0x72d               
  {082C0}  mov      word ptr [0x1a8], ax        
  {082C3}  lcall    0x1c71, 0x5fe               
  {082C8}  lcall    0x1c71, 0x291               
  {082CD}  mov      di, 0x7e                    
  {082D0}  push     ds                          
  {082D1}  push     di                          
  {082D2}  lcall    0x1c71, 0x72d               
  {082D7}  mov      word ptr [0x1c4], ax        
  {082DA}  lcall    0x1c71, 0x5fe               
  {082DF}  lcall    0x1c71, 0x291               
  {082E4}  mov      di, 0x7e                    
  {082E7}  push     ds                          
  {082E8}  push     di                          
  {082E9}  lcall    0x1c71, 0x72d               
  {082EE}  mov      word ptr [0x1c6], ax        
  {082F1}  lcall    0x1c71, 0x5fe               
  {082F6}  lcall    0x1c71, 0x291               
  {082FB}  mov      di, 0x7e                    
  {082FE}  push     ds                          
  {082FF}  push     di                          
  {08300}  lcall    0x1c71, 0x72d               
  {08305}  mov      word ptr [0x1c8], ax        
  {08308}  lcall    0x1c71, 0x5fe               
  {0830D}  lcall    0x1c71, 0x291               
  {08312}  mov      di, 0x7e                    
  {08315}  push     ds                          
  {08316}  push     di                          
  {08317}  lcall    0x1c71, 0x72d               
  {0831C}  mov      word ptr [0x1ca], ax        
  {0831F}  lcall    0x1c71, 0x5fe               
  {08324}  lcall    0x1c71, 0x291               
  {08329}  mov      di, 0x7e                    
  {0832C}  push     ds                          
  {0832D}  push     di                          
  {0832E}  lcall    0x1c71, 0x72d               
  {08333}  mov      word ptr [0x1cc], ax        
  {08336}  lcall    0x1c71, 0x5fe               
  {0833B}  lcall    0x1c71, 0x291               
  {08340}  mov      di, 0x7e                    
  {08343}  push     ds                          
  {08344}  push     di                          
  {08345}  lcall    0x1c71, 0x72d               
  {0834A}  mov      word ptr [0x1ce], ax        
  {0834D}  lcall    0x1c71, 0x5fe               
  {08352}  lcall    0x1c71, 0x291               
  {08357}  mov      di, 0x7e                    
  {0835A}  push     ds                          
  {0835B}  push     di                          
  {0835C}  lcall    0x1c71, 0x72d               
  {08361}  mov      word ptr [0x1d0], ax        
  {08364}  lcall    0x1c71, 0x5fe               
  {08369}  lcall    0x1c71, 0x291               
  {0836E}  mov      di, 0x7e                    
  {08371}  push     ds                          
  {08372}  push     di                          
  {08373}  lcall    0x1c71, 0x72d               
  {08378}  mov      word ptr [0x1d2], ax        
  {0837B}  lcall    0x1c71, 0x5fe               
  {08380}  lcall    0x1c71, 0x291               
  {08385}  mov      di, 0x7e                    
  {08388}  push     ds                          
  {08389}  push     di                          
  {0838A}  lcall    0x1c71, 0x72d               
  {0838F}  mov      word ptr [0x1d8], ax        
  {08392}  lcall    0x1c71, 0x5fe               
  {08397}  lcall    0x1c71, 0x291               
  {0839C}  mov      di, 0x7e                    
  {0839F}  push     ds                          
  {083A0}  push     di                          
  {083A1}  lcall    0x1c71, 0x72d               
  {083A6}  mov      word ptr [0x216], ax        
  {083A9}  lcall    0x1c71, 0x5fe               
  {083AE}  lcall    0x1c71, 0x291               
  {083B3}  mov      di, 0x7e                    
  {083B6}  push     ds                          
  {083B7}  push     di                          
  {083B8}  lcall    0x1c71, 0x72d               
  {083BD}  mov      word ptr [0x22e], ax        
  {083C0}  lcall    0x1c71, 0x5fe               
  {083C5}  lcall    0x1c71, 0x291               
  {083CA}  mov      di, 0x7e                    
  {083CD}  push     ds                          
  {083CE}  push     di                          
  {083CF}  lcall    0x1c71, 0x72d               
  {083D4}  mov      byte ptr [0x257], al        
  {083D7}  lcall    0x1c71, 0x5fe               
  {083DC}  lcall    0x1c71, 0x291               
  {083E1}  mov      di, 0x7e                    
  {083E4}  push     ds                          
  {083E5}  push     di                          
  {083E6}  lcall    0x1c71, 0x72d               
  {083EB}  mov      word ptr [0x1da], ax        
  {083EE}  lcall    0x1c71, 0x5fe               
  {083F3}  lcall    0x1c71, 0x291               
  {083F8}  mov      di, 0x7e                    
  {083FB}  push     ds                          
  {083FC}  push     di                          
  {083FD}  lcall    0x1c71, 0x72d               
  {08402}  mov      word ptr [0x1dc], ax        
  {08405}  lcall    0x1c71, 0x5fe               
  {0840A}  lcall    0x1c71, 0x291               
  {0840F}  mov      di, 0x7e                    
  {08412}  push     ds                          
  {08413}  push     di                          
  {08414}  lcall    0x1c71, 0x72d               
  {08419}  mov      word ptr [0x1de], ax        
  {0841C}  lcall    0x1c71, 0x5fe               
  {08421}  lcall    0x1c71, 0x291               
  {08426}  mov      di, 0x7e                    
  {08429}  push     ds                          
  {0842A}  push     di                          
  {0842B}  lcall    0x1c71, 0x72d               
  {08430}  mov      word ptr [0x248], ax        
  {08433}  lcall    0x1c71, 0x5fe               
  {08438}  lcall    0x1c71, 0x291               
  {0843D}  mov      di, 0x7e                    
  {08440}  push     ds                          
  {08441}  push     di                          
  {08442}  lcall    0x1c71, 0x72d               
  {08447}  mov      word ptr [0x24a], ax        
  {0844A}  lcall    0x1c71, 0x5fe               
  {0844F}  lcall    0x1c71, 0x291               
  {08454}  mov      di, 0x7e                    
  {08457}  push     ds                          
  {08458}  push     di                          
  {08459}  lcall    0x1c71, 0x72d               
  {0845E}  mov      word ptr [0x1e0], ax        
  {08461}  lcall    0x1c71, 0x5fe               
  {08466}  lcall    0x1c71, 0x291               
  {0846B}  mov      di, 0x7e                    
  {0846E}  push     ds                          
  {0846F}  push     di                          
  {08470}  lcall    0x1c71, 0x72d               
  {08475}  mov      byte ptr [0x25b], al        
  {08478}  lcall    0x1c71, 0x5fe               
  {0847D}  lcall    0x1c71, 0x291               
  {08482}  mov      di, 0x7e                    
  {08485}  push     ds                          
  {08486}  push     di                          
  {08487}  lcall    0x1c71, 0x72d               
  {0848C}  mov      word ptr [0x78], ax         
  {0848F}  lcall    0x1c71, 0x5fe               
  {08494}  lcall    0x1c71, 0x291               
  {08499}  mov      di, 0x7e                    
  {0849C}  push     ds                          
  {0849D}  push     di                          
  {0849E}  lcall    0x1c71, 0x72d               
  {084A3}  mov      byte ptr [0x259], al        
  {084A6}  lcall    0x1c71, 0x5fe               
  {084AB}  lcall    0x1c71, 0x291               
  {084B0}  mov      di, 0x7e                    
  {084B3}  push     ds                          
  {084B4}  push     di                          
  {084B5}  lcall    0x1c71, 0x72d               
  {084BA}  mov      word ptr [0x7c], ax         
  {084BD}  lcall    0x1c71, 0x5fe               
  {084C2}  lcall    0x1c71, 0x291               
  {084C7}  mov      di, 0x7e                    
  {084CA}  push     ds                          
  {084CB}  push     di                          
  {084CC}  lcall    0x1c71, 0x72d               
  {084D1}  mov      word ptr [0x230], ax        
  {084D4}  lcall    0x1c71, 0x5fe               
  {084D9}  lcall    0x1c71, 0x291               
  {084DE}  mov      di, 0x7e                    
  {084E1}  push     ds                          
  {084E2}  push     di                          
  {084E3}  lcall    0x1c71, 0x72d               
  {084E8}  mov      word ptr [0x7a], ax         
  {084EB}  lcall    0x1c71, 0x5fe               
  {084F0}  lcall    0x1c71, 0x291               
  {084F5}  mov      di, 0x7e                    
  {084F8}  push     ds                          
  {084F9}  push     di                          
  {084FA}  lcall    0x1c71, 0x72d               
  {084FF}  mov      word ptr [0x68a], ax        
  {08502}  lcall    0x1c71, 0x5fe               
  {08507}  lcall    0x1c71, 0x291               
  {0850C}  mov      di, 0x7e                    
  {0850F}  push     ds                          
  {08510}  push     di                          
  {08511}  lcall    0x1c71, 0x72d               
  {08516}  mov      byte ptr [0x262], al        
  {08519}  lcall    0x1c71, 0x5fe               
  {0851E}  lcall    0x1c71, 0x291               
  {08523}  mov      di, 0x7e                    
  {08526}  push     ds                          
  {08527}  push     di                          
  {08528}  lcall    0x1c71, 0x72d               
  {0852D}  mov      byte ptr [0x255], al        
  {08530}  lcall    0x1c71, 0x5fe               
  {08535}  lcall    0x1c71, 0x291               
  {0853A}  mov      di, 0x7e                    
  {0853D}  push     ds                          
  {0853E}  push     di                          
  {0853F}  lcall    0x1c71, 0x72d               
  {08544}  mov      byte ptr [0x261], al        
  {08547}  lcall    0x1c71, 0x59d               
  {0854C}  lcall    0x1c71, 0x291               
  {08551}  mov      di, 0x7e                    
  {08554}  push     ds                          
  {08555}  push     di                          
  {08556}  mov      di, 0x264                   
  {08559}  push     ds                          
  {0855A}  push     di                          
  {0855B}  mov      ax, 0xff                    
  {0855E}  push     ax                          
  {0855F}  lcall    0x1c71, 0x6c6               
  {08564}  lcall    0x1c71, 0x5fe               
  {08569}  lcall    0x1c71, 0x291               
  {0856E}  mov      di, 0x7e                    
  {08571}  push     ds                          
  {08572}  push     di                          
  {08573}  lcall    0x1c71, 0x3be               
  {08578}  lcall    0x1c71, 0x291               
  {0857D}  mov      di, 0x7a2                   
  {08580}  push     ds                          
  {08581}  push     di                          
  {08582}  mov      di, 0x7d75                  
  {08585}  push     cs                          
  {08586}  push     di                          
  {08587}  xor      ax, ax                      
  {08589}  push     ax                          
  {0858A}  lcall    0x1c71, 0x701               
  {0858F}  mov      di, 0x264                   
  {08592}  push     ds                          
  {08593}  push     di                          
  {08594}  xor      ax, ax                      
  {08596}  push     ax                          
  {08597}  lcall    0x1c71, 0x701               
  {0859C}  lcall    0x1c71, 0x5dd               
  {085A1}  lcall    0x1c71, 0x291               
  {085A6}  pop      bp                          
  {085A7}  ret                                  
  {085A8}  inc      ax                          
  {085A9}  cmp      al, 0x3c                    
  {085AB}  cmp      al, 0x3c                    
  {085AD}  cmp      al, 0x3c                    
  {085AF}  cmp      al, 0x3c                    
  {085B1}  cmp      al, 0x3d                    
  {085B3}  sub      di, word ptr [di]           
  {085B5}  sub      di, word ptr [di]           
  {085B7}  sub      sp, word ptr [bx + di]      
  {085B9}  and      word ptr [bx + di], sp      
  {085BB}  and      sp, word ptr [bp + di]      
  {085BD}  and      sp, word ptr [bp + di]      
  {085BF}  and      bx, word ptr [bp + si + 0x44]
  {085C2}  dec      di                          
  {085C3}  inc      dx                          
  {085C4}  pop      cx                          
  {085C5}  dec      sp                          
  {085C6}  inc      bp                          
  {085C7}  push     bx                          
  {085C8}  and      byte ptr [si + 0x45], cl    
  {085CB}  push     si                          
  {085CC}  inc      bp                          
  {085CD}  dec      sp                          
  {085CE}  and      sp, word ptr [bp + di]      
  {085D0}  and      sp, word ptr [bp + di]      
  {085D2}  and      sp, word ptr [bx + di]      
  {085D4}  and      word ptr [bx + di], sp      
  {085D6}  sub      di, word ptr [di]           
  {085D8}  sub      di, word ptr [di]           
  {085DA}  sub      di, word ptr [di]           
  {085DC}  cmp      al, 0x3c                    
  {085DE}  cmp      al, 0x3c                    
  {085E0}  cmp      al, 0x3c                    
  {085E2}  cmp      al, 0x3c                    
  {085E4}  cmp      al, 0x3c                    
  {085E6}  cmp      al, 0x3c                    
  {085E8}  cmp      al, 0x15                    
  {085EA}  cmp      al, 0x3c                    
  {085EC}  cmp      al, 0x3c                    
  {085EE}  cmp      al, 0x3c                    
  {085F0}  cmp      al, 0x3c                    
  {085F2}  cmp      al, 0x3c                    
  {085F4}  cmp      al, 0x3c                    
  {085F6}  pop      dx                          
  {085F7}  pop      cx                          
  {085F8}  push     bx                          
  {085F9}  dec      bx                          
  {085FA}  inc      cx                          
  {085FB}  dec      sp                          
  {085FC}  inc      bp                          
  {085FD}  push     bx                          
  {085FE}  and      byte ptr [bx + si], bl      
  {08600}  and      byte ptr [bx + si + 0x52], dl
  {08603}  inc      cx                          
  {08604}  dec      bx                          
  {08605}  push     sp                          
  {08606}  pop      cx                          
  {08607}  dec      bx                          
  {08608}  and      byte ptr [0x3e3e], bh       
  {0860C}  sbb      ax, 0x4d20                  
  {0861B}  inc      cx                          
  {0861C}  pop      ax                          
  {0861D}  dec      cx                          
  {0861E}  dec      bp                          
  {0861F}  push     bp                          
  {08620}  dec      bp                          
  {08621}  and      byte ptr [di + 0x4e], al    
  {08624}  inc      bp                          
  {08625}  push     dx                          
  {08626}  inc      di                          
  {08627}  dec      cx                          
  {08628}  and      byte ptr [0x3e3e], bh       
  {0862C}  pop      ss                          
  {08637}  cmp      al, 0x3c                    
  {08639}  cmp      al, 0x3c                    
  {0863B}  cmp      al, 0x3c                    
  {0863D}  cmp      al, 0x3c                    
  {0863F}  cmp      al, 0x3c                    
  {08641}  cmp      al, 0x3c                    
  {08643}  cmp      al, 0x3c                    
  {08645}  pop      dx                          
  {08646}  pop      cx                          
  {08647}  push     bx                          
  {08648}  dec      bx                          
  {08649}  inc      cx                          
  {0864A}  dec      sp                          
  {0864B}  inc      bp                          
  {0864C}  push     bx                          
  {0864D}  and      byte ptr [0x414d], dl       
  {08651}  dec      si                          
  {08652}  pop      cx                          
  {08653}  and      byte ptr [0x3e3e], bh       
  {08657}  inc      bx                          
  {08666}  dec      ax                          
  {08667}  push     bp                          
  {08668}  push     dx                          
  {08669}  push     dx                          
  {0866A}  push     dx                          
  {0866B}  inc      cx                          
  {0866C}  and      byte ptr [si + 0x4f], dl    
  {0866F}  and      byte ptr [bp + si + 0x55], cl
  {08672}  pop      dx                          
  {08673}  and      byte ptr [si + 0x57], al    
  {08676}  push     bp                          
  {08677}  dec      si                          
  {08678}  inc      cx                          
  {08679}  push     bx                          
  {0867A}  push     sp                          
  {0867B}  pop      cx                          
  {0867C}  and      byte ptr [bx + si + 0x4f], dl
  {0867F}  pop      dx                          
  {08680}  dec      cx                          
  {08681}  dec      di                          
  {08682}  dec      bp                          
  {08683}  and      byte ptr [si], ch           
  {08685}  and      byte ptr [bp + di + 0x5a], al
  {08688}  inc      cx                          
  {08689}  push     bx                          
  {0868A}  and      byte ptr [bx + si + 0x4f], dl
  {0868D}  inc      sp                          
  {0868E}  push     di                          
  {0868F}  pop      cx                          
  {08690}  pop      dx                          
  {08691}  push     bx                          
  {08692}  pop      dx                          
  {08693}  pop      cx                          
  {08694}  inc      bx                          
  {08695}  and      byte ptr [di + 0x41], cl    
  {08698}  pop      ax                          
  {08699}  pop      cx                          
  {0869A}  dec      bp                          
  {0869B}  inc      cx                          
  {0869C}  dec      sp                          
  {0869D}  dec      si                          
  {0869E}  inc      bp                          
  {0869F}  and      byte ptr [bx + si + 0x41], dl
  {086A2}  push     dx                          
  {086A3}  inc      cx                          
  {086A4}  dec      bp                          
  {086A5}  inc      bp                          
  {086A6}  push     sp                          
  {086A7}  push     dx                          
  {086A8}  pop      cx                          
  {086A9}  sbb      al, byte ptr [bp + si]      
  {086AB}  add      al, byte ptr [bp + si]      
  {086AD}  add      al, byte ptr [bp + si]      
  {086AF}  add      al, byte ptr [bp + si]      
  {086B1}  add      al, byte ptr [bp + si]      
  {086B3}  add      al, byte ptr [bp + si]      
  {086B5}  add      al, byte ptr [bp + si]      
  {086B7}  add      ah, byte ptr [bx + si]      
  {086B9}  dec      bp                          
  {086BA}  inc      cx                          
  {086BB}  push     bx                          
  {086BC}  pop      dx                          
  {086BD}  and      byte ptr [si + 0x45], dl    
  {086C0}  push     dx                          
  {086C1}  inc      cx                          
  {086C2}  pop      dx                          
  {086C3}  and      byte ptr [bx], bl           
  {086C5}  and      byte ptr [di + 0x41], cl    
  {086C8}  pop      ax                          
  {086C9}  pop      cx                          
  {086CA}  dec      bp                          
  {086CB}  inc      cx                          
  {086CC}  dec      sp                          
  {086CD}  dec      si                          
  {086CE}  dec      cx                          
  {086CF}  inc      bp                          
  {086D0}  and      byte ptr [bp + di + 0x49], dl
  {086D3}  dec      sp                          
  {086D4}  pop      cx                          
  {086D5}  and      byte ptr [bp + si], al      
  {086D7}  add      al, byte ptr [bp + si]      
  {086D9}  add      al, byte ptr [bp + si]      
  {086DB}  add      al, byte ptr [bp + si]      
  {086DD}  add      al, byte ptr [bp + si]      
  {086DF}  add      al, byte ptr [bp + si]      
  {086E1}  add      al, byte ptr [bp + si]      
  {086E3}  add      ah, byte ptr [di]           
  {086E5}  and      byte ptr [di + 0x41], cl    
  {086E8}  pop      ax                          
  {086E9}  pop      cx                          
  {086EA}  dec      bp                          
  {086EB}  inc      cx                          
  {086EC}  dec      sp                          
  {086ED}  dec      si                          
  {086EE}  dec      cx                          
  {086EF}  inc      bp                          
  {086F0}  and      byte ptr [bp + si + 0x52], bl
  {086F3}  inc      bp                          
  {086F4}  inc      bx                          
  {086F5}  pop      dx                          
  {086F6}  dec      si                          
  {086F7}  dec      di                          
  {086F8}  push     bx                          
  {086F9}  inc      bx                          
  {086FA}  dec      cx                          
  {086FB}  and      byte ptr [bp + si], al      
  {086FD}  add      al, byte ptr [bp + si]      
  {086FF}  add      al, byte ptr [bp + si]      
  {08701}  add      al, byte ptr [bp + si]      
  {08703}  add      al, byte ptr [bp + si]      
  {08705}  add      al, byte ptr [bp + si]      
  {08707}  add      al, byte ptr [bp + si]      
  {08709}  add      ah, byte ptr [bp + di]      
  {0870B}  and      byte ptr [di + 0x41], cl    
  {0870E}  pop      ax                          
  {0870F}  pop      cx                          
  {08710}  dec      bp                          
  {08711}  inc      cx                          
  {08712}  dec      sp                          
  {08713}  dec      si                          
  {08714}  dec      cx                          
  {08715}  inc      bp                          
  {08716}  and      byte ptr [di + 0x41], cl    
  {08719}  inc      sp                          
  {0871A}  push     dx                          
  {0871B}  dec      di                          
  {0871C}  push     bx                          
  {0871D}  inc      bx                          
  {0871E}  dec      cx                          
  {0871F}  and      byte ptr [bp + si], al      
  {08721}  add      al, byte ptr [bp + si]      
  {08723}  add      al, byte ptr [bp + si]      
  {08725}  add      al, byte ptr [bp + si]      
  {08727}  add      al, byte ptr [bp + si]      
  {08729}  add      al, byte ptr [bp + si]      
  {0872B}  add      al, byte ptr [bp + si]      
  {0872D}  add      dl, byte ptr [di - 0x77]    
  {08730}  in       ax, 0x31                    
  {08732}  rcr      byte ptr [bp + si + 0x2cd], 0x71
  {08737}  sbb      al, 0x81                    
  {08739}  aam      1                           
  {0873C}  mov      sp, 0x7c02                  
  {0873F}  pop      es                          
  {08740}  cmp      byte ptr [0x25c], 1         
  {08745}  je       0x87a2                      
  {08747}  cmp      word ptr [0x1d4], 0x2d5     
  {0874D}  jl       0x8756                      
  {0874F}  cmp      byte ptr [0x25c], 2         
  {08754}  je       0x87a2                      
  {08756}  cmp      word ptr [0x1d4], 0x2da     
  {0875C}  jl       0x8765                      
  {0875E}  cmp      byte ptr [0x25c], 3         
  {08763}  je       0x87a2                      
  {08765}  mov      al, byte ptr [0x25c]        
  {08768}  cwde                                 
  {08769}  add      ax, 0x2df                   
  {0876C}  cmp      ax, word ptr [0x1d4]        
  {08770}  jg       0x8780                      
  {08772}  cmp      byte ptr [0x25c], 3         
  {08777}  jle      0x8780                      
  {08779}  cmp      byte ptr [0x25c], 9         
  {0877E}  jl       0x87a2                      
  {08780}  cmp      byte ptr [0x25c], 8         
  {08785}  jg       0x878a                      
  {08787}  jmp      0x8ba2                      
  {0878A}  mov      al, byte ptr [0x25c]        
  {0878D}  cwde                                 
  {0878E}  mov      dx, ax                      
  {08790}  mov      al, byte ptr [0x25c]        
  {08793}  cwde                                 
  {08794}  add      ax, 0x2df                   
  {08797}  add      ax, dx                      
  {08799}  cmp      ax, word ptr [0x1d4]        
  {0879D}  jle      0x87a2                      
  {0879F}  jmp      0x8ba2                      
  {087A2}  mov      di, 0x7a2                   
  {087A5}  push     ds                          
  {087A6}  push     di                          
  {087A7}  mov      di, 0x85a8                  
  {087AA}  push     cs                          
  {087AB}  push     di                          
  {087AC}  xor      ax, ax                      
  {087AE}  push     ax                          
  {087AF}  lcall    0x1c71, 0x701               
  {087B4}  lcall    0x1c71, 0x5dd               
  {087B9}  lcall    0x1c71, 0x291               
  {087BE}  mov      di, 0x7a2                   
  {087C1}  push     ds                          
  {087C2}  push     di                          
  {087C3}  mov      di, 0x85a8                  
  {087C6}  push     cs                          
  {087C7}  push     di                          
  {087C8}  xor      ax, ax                      
  {087CA}  push     ax                          
  {087CB}  lcall    0x1c71, 0x701               
  {087D0}  lcall    0x1c71, 0x5dd               
  {087D5}  lcall    0x1c71, 0x291               
  {087DA}  mov      di, 0x7a2                   
  {087DD}  push     ds                          
  {087DE}  push     di                          
  {087DF}  mov      di, 0x85a8                  
  {087E2}  push     cs                          
  {087E3}  push     di                          
  {087E4}  xor      ax, ax                      
  {087E6}  push     ax                          
  {087E7}  lcall    0x1c71, 0x701               
  {087EC}  lcall    0x1c71, 0x5dd               
  {087F1}  lcall    0x1c71, 0x291               
  {087F6}  mov      di, 0x7a2                   
  {087F9}  push     ds                          
  {087FA}  push     di                          
  {087FB}  mov      di, 0x85a8                  
  {087FE}  push     cs                          
  {087FF}  push     di                          
  {08800}  xor      ax, ax                      
  {08802}  push     ax                          
  {08803}  lcall    0x1c71, 0x701               
  {08808}  lcall    0x1c71, 0x5dd               
  {0880D}  lcall    0x1c71, 0x291               
  {08812}  cmp      byte ptr [0x25c], 1         
  {08817}  jne      0x8822                      
  {08819}  mov      ax, word ptr [0x1d4]        
  {0881C}  sub      ax, 0x2d5                   
  {0881F}  mov      word ptr [0x1d4], ax        
  {08822}  cmp      byte ptr [0x25c], 2         
  {08827}  jne      0x8832                      
  {08829}  mov      ax, word ptr [0x1d4]        
  {0882C}  sub      ax, 0x2da                   
  {0882F}  mov      word ptr [0x1d4], ax        
  {08832}  cmp      byte ptr [0x25c], 3         
  {08837}  jne      0x8842                      
  {08839}  mov      ax, word ptr [0x1d4]        
  {0883C}  sub      ax, 0x2df                   
  {0883F}  mov      word ptr [0x1d4], ax        
  {08842}  cmp      byte ptr [0x25c], 3         
  {08847}  jle      0x8861                      
  {08849}  cmp      byte ptr [0x25c], 9         
  {0884E}  jge      0x8861                      
  {08850}  mov      al, byte ptr [0x25c]        
  {08853}  cwde                                 
  {08854}  mov      dx, ax                      
  {08856}  mov      ax, word ptr [0x1d4]        
  {08859}  sub      ax, 0x2df                   
  {0885C}  sub      ax, dx                      
  {0885E}  mov      word ptr [0x1d4], ax        
  {08861}  cmp      byte ptr [0x25c], 8         
  {08866}  jle      0x887b                      
  {08868}  mov      al, byte ptr [0x25c]        
  {0886B}  cwde                                 
  {0886C}  shl      ax, 1                       
  {0886E}  mov      dx, ax                      
  {08870}  mov      ax, word ptr [0x1d4]        
  {08873}  sub      ax, dx                      
  {08875}  sub      ax, 0x2df                   
  {08878}  mov      word ptr [0x1d4], ax        
  {0887B}  cmp      word ptr [0x18c], 0xb       
  {08880}  jge      0x888b                      
  {08882}  mov      ax, word ptr [0x194]        
  {08885}  add      ax, 3                       
  {08888}  mov      word ptr [0x194], ax           // PRZEDM.PRO
  {0888B}  cmp      word ptr [0x18c], 0xa       
  {08890}  jle      0x88a2                      
  {08892}  cmp      word ptr [0x18c], 0x10      
  {08897}  jge      0x88a2                      
  {08899}  mov      ax, word ptr [0x194]        
  {0889C}  add      ax, 4                       
  {0889F}  mov      word ptr [0x194], ax           // PRZEDM.PRO
  {088A2}  cmp      word ptr [0x18c], 0xf       
  {088A7}  jle      0x88b9                      
  {088A9}  cmp      word ptr [0x18c], 0x17      
  {088AE}  jge      0x88b9                      
  {088B0}  mov      ax, word ptr [0x194]        
  {088B3}  add      ax, 5                       
  {088B6}  mov      word ptr [0x194], ax           // PRZEDM.PRO
  {088B9}  cmp      word ptr [0x18c], 0x16      
  {088BE}  jle      0x88c9                      
  {088C0}  mov      ax, word ptr [0x194]        
  {088C3}  add      ax, 6                       
  {088C6}  mov      word ptr [0x194], ax           // PRZEDM.PRO
  {088C9}  mov      di, 0x7a2                   
  {088CC}  push     ds                          
  {088CD}  push     di                          
  {088CE}  mov      di, 0x85e9                  
  {088D1}  push     cs                          
  {088D2}  push     di                          
  {088D3}  xor      ax, ax                      
  {088D5}  push     ax                          
  {088D6}  lcall    0x1c71, 0x701               
  {088DB}  mov      ax, word ptr [0x194]        
  {088DE}  cdq                                  
  {088DF}  push     dx                          
  {088E0}  push     ax                          
  {088E1}  xor      ax, ax                      
  {088E3}  push     ax                          
  {088E4}  lcall    0x1c71, 0x789               
  {088E9}  mov      di, 0x85ff                  
  {088EC}  push     cs                          
  {088ED}  push     di                          
  {088EE}  xor      ax, ax                      
  {088F0}  push     ax                          
  {088F1}  lcall    0x1c71, 0x701               
  {088F6}  lcall    0x1c71, 0x5dd               
  {088FB}  lcall    0x1c71, 0x291               
  {08900}  cmp      word ptr [0x190], 0xc          // PRZEDM.PAR
  {08905}  jle      0x8912                      
  {08907}  mov      ax, word ptr [0x664]        
  {0890A}  add      ax, 0xb                     
  {0890D}  mov      word ptr [0x664], ax        
  {08910}  jmp      0x891b                      
  {08912}  mov      ax, word ptr [0x664]        
  {08915}  add      ax, 0xa                     
  {08918}  mov      word ptr [0x664], ax        
  {0891B}  cmp      word ptr [0x190], 0x10         // PRZEDM.PAR
  {08920}  jle      0x8929                      
  {08922}  mov      ax, word ptr [0x664]        
  {08925}  inc      ax                          
  {08926}  mov      word ptr [0x664], ax        
  {08929}  cmp      word ptr [0x190], 0x15         // PRZEDM.PAR
  {0892E}  jle      0x8937                      
  {08930}  mov      ax, word ptr [0x664]        
  {08933}  inc      ax                          
  {08934}  mov      word ptr [0x664], ax        
  {08937}  cmp      word ptr [0x190], 0x1a         // PRZEDM.PAR
  {0893C}  jle      0x894c                      
  {0893E}  cmp      word ptr [0x18e], 0x14      
  {08943}  jle      0x894c                      
  {08945}  mov      ax, word ptr [0x664]        
  {08948}  inc      ax                          
  {08949}  mov      word ptr [0x664], ax        
  {0894C}  mov      di, 0x7a2                   
  {0894F}  push     ds                          
  {08950}  push     di                          
  {08951}  mov      di, 0x85e9                  
  {08954}  push     cs                          
  {08955}  push     di                          
  {08956}  xor      ax, ax                      
  {08958}  push     ax                          
  {08959}  lcall    0x1c71, 0x701               
  {0895E}  mov      ax, word ptr [0x664]        
  {08961}  cdq                                  
  {08962}  push     dx                          
  {08963}  push     ax                          
  {08964}  xor      ax, ax                      
  {08966}  push     ax                          
  {08967}  lcall    0x1c71, 0x789               
  {0896C}  mov      di, 0x8618                  
  {0896F}  push     cs                          
  {08970}  push     di                          
  {08971}  xor      ax, ax                      
  {08973}  push     ax                          
  {08974}  lcall    0x1c71, 0x701               
  {08979}  lcall    0x1c71, 0x5dd               
  {0897E}  lcall    0x1c71, 0x291               
  {08983}  mov      ax, word ptr [0x1ae]        
  {08986}  add      ax, word ptr [0x18c]        
  {0898A}  inc      ax                          
  {0898B}  inc      ax                          
  {0898C}  mov      word ptr [0x1ae], ax        
  {0898F}  mov      di, 0x7a2                   
  {08992}  push     ds                          
  {08993}  push     di                          
  {08994}  mov      di, 0x8636                  
  {08997}  push     cs                          
  {08998}  push     di                          
  {08999}  xor      ax, ax                      
  {0899B}  push     ax                          
  {0899C}  lcall    0x1c71, 0x701               
  {089A1}  mov      ax, word ptr [0x18c]        
  {089A4}  inc      ax                          
  {089A5}  inc      ax                          
  {089A6}  cdq                                  
  {089A7}  push     dx                          
  {089A8}  push     ax                          
  {089A9}  xor      ax, ax                      
  {089AB}  push     ax                          
  {089AC}  lcall    0x1c71, 0x789               
  {089B1}  mov      di, 0x864e                  
  {089B4}  push     cs                          
  {089B5}  push     di                          
  {089B6}  xor      ax, ax                      
  {089B8}  push     ax                          
  {089B9}  lcall    0x1c71, 0x701               
  {089BE}  lcall    0x1c71, 0x5dd               
  {089C3}  lcall    0x1c71, 0x291               
  {089C8}  mov      al, byte ptr [0x25c]        
  {089CB}  cwde                                 
  {089CC}  inc      ax                          
  {089CD}  mov      byte ptr [0x25c], al        
  {089D0}  xor      ax, ax                      
  {089D2}  mov      word ptr [0x6c], ax         
  {089D5}  cmp      byte ptr [0x25c], 0xc       
  {089DA}  je       0x89df                      
  {089DC}  jmp      0x8ba2                      
  {089DF}  mov      di, 0x7a2                   
  {089E2}  push     ds                          
  {089E3}  push     di                          
  {089E4}  mov      di, 0x8665                  
  {089E7}  push     cs                          
  {089E8}  push     di                          
  {089E9}  xor      ax, ax                      
  {089EB}  push     ax                          
  {089EC}  lcall    0x1c71, 0x701               
  {089F1}  lcall    0x1c71, 0x5dd               
  {089F6}  lcall    0x1c71, 0x291               
  {089FB}  mov      ax, word ptr [0x18e]        
  {089FE}  cmp      ax, word ptr [0x198]        
  {08A02}  jl       0x8a0d                      
  {08A04}  mov      ax, word ptr [0x198]        
  {08A07}  add      ax, 3                       
  {08A0A}  mov      word ptr [0x198], ax           // PRZEDM.SZANSA
  {08A0D}  mov      ax, word ptr [0x190]        
  {08A10}  cmp      ax, word ptr [0x19a]        
  {08A14}  jl       0x8a1f                      
  {08A16}  mov      ax, word ptr [0x19a]        
  {08A19}  add      ax, 3                       
  {08A1C}  mov      word ptr [0x19a], ax        
  {08A1F}  mov      ax, word ptr [0x18c]        
  {08A22}  cmp      ax, word ptr [0x196]        
  {08A26}  jl       0x8a31                      
  {08A28}  mov      ax, word ptr [0x196]        
  {08A2B}  add      ax, 3                       
  {08A2E}  mov      word ptr [0x196], ax           // PRZEDM.WPYSK
  {08A31}  mov      ax, word ptr [0x18e]        
  {08A34}  cmp      ax, word ptr [0x198]        
  {08A38}  jge      0x8a42                      
  {08A3A}  mov      ax, word ptr [0x198]        
  {08A3D}  inc      ax                          
  {08A3E}  inc      ax                          
  {08A3F}  mov      word ptr [0x198], ax           // PRZEDM.SZANSA
  {08A42}  mov      ax, word ptr [0x190]        
  {08A45}  cmp      ax, word ptr [0x19a]        
  {08A49}  jge      0x8a53                      
  {08A4B}  mov      ax, word ptr [0x19a]        
  {08A4E}  inc      ax                          
  {08A4F}  inc      ax                          
  {08A50}  mov      word ptr [0x19a], ax        
  {08A53}  mov      ax, word ptr [0x18c]        
  {08A56}  cmp      ax, word ptr [0x196]        
  {08A5A}  jge      0x8a64                      
  {08A5C}  mov      ax, word ptr [0x196]        
  {08A5F}  inc      ax                          
  {08A60}  inc      ax                          
  {08A61}  mov      word ptr [0x196], ax           // PRZEDM.WPYSK
  {08A64}  mov      ax, word ptr [0x196]        
  {08A67}  cmp      ax, word ptr [0x198]        
  {08A6B}  jle      0x8a7f                      
  {08A6D}  mov      ax, word ptr [0x196]        
  {08A70}  cmp      ax, word ptr [0x19a]        
  {08A74}  jle      0x8a7f                      
  {08A76}  mov      ax, word ptr [0x196]        
  {08A79}  add      ax, 3                       
  {08A7C}  mov      word ptr [0x196], ax           // PRZEDM.WPYSK
  {08A7F}  mov      ax, word ptr [0x198]        
  {08A82}  cmp      ax, word ptr [0x196]        
  {08A86}  jle      0x8a9a                      
  {08A88}  mov      ax, word ptr [0x198]        
  {08A8B}  cmp      ax, word ptr [0x19a]        
  {08A8F}  jle      0x8a9a                      
  {08A91}  mov      ax, word ptr [0x198]        
  {08A94}  add      ax, 3                       
  {08A97}  mov      word ptr [0x198], ax           // PRZEDM.SZANSA
  {08A9A}  mov      ax, word ptr [0x19a]        
  {08A9D}  cmp      ax, word ptr [0x198]        
  {08AA1}  jle      0x8ab5                      
  {08AA3}  mov      ax, word ptr [0x19a]        
  {08AA6}  cmp      ax, word ptr [0x196]        
  {08AAA}  jle      0x8ab5                      
  {08AAC}  mov      ax, word ptr [0x19a]        
  {08AAF}  add      ax, 3                       
  {08AB2}  mov      word ptr [0x19a], ax        
  {08AB5}  mov      ax, word ptr [0x19a]        
  {08AB8}  cmp      ax, word ptr [0x198]        
  {08ABC}  jne      0x8adc                      
  {08ABE}  mov      ax, word ptr [0x198]        
  {08AC1}  cmp      ax, word ptr [0x196]        
  {08AC5}  jne      0x8adc                      
  {08AC7}  mov      ax, word ptr [0x19a]        
  {08ACA}  inc      ax                          
  {08ACB}  mov      word ptr [0x19a], ax        
  {08ACE}  mov      ax, word ptr [0x196]        
  {08AD1}  inc      ax                          
  {08AD2}  mov      word ptr [0x196], ax           // PRZEDM.WPYSK
  {08AD5}  mov      ax, word ptr [0x198]        
  {08AD8}  inc      ax                          
  {08AD9}  mov      word ptr [0x198], ax           // PRZEDM.SZANSA
  {08ADC}  mov      ax, word ptr [0x19a]        
  {08ADF}  cmp      ax, word ptr [0x196]        
  {08AE3}  jle      0x8afd                      
  {08AE5}  mov      ax, word ptr [0x19a]        
  {08AE8}  cmp      ax, word ptr [0x198]        
  {08AEC}  jne      0x8afd                      
  {08AEE}  mov      ax, word ptr [0x198]        
  {08AF1}  inc      ax                          
  {08AF2}  inc      ax                          
  {08AF3}  mov      word ptr [0x198], ax           // PRZEDM.SZANSA
  {08AF6}  mov      ax, word ptr [0x19a]        
  {08AF9}  inc      ax                          
  {08AFA}  mov      word ptr [0x19a], ax        
  {08AFD}  mov      di, 0x7a2                   
  {08B00}  push     ds                          
  {08B01}  push     di                          
  {08B02}  mov      di, 0x86a9                  
  {08B05}  push     cs                          
  {08B06}  push     di                          
  {08B07}  xor      ax, ax                      
  {08B09}  push     ax                          
  {08B0A}  lcall    0x1c71, 0x701               
  {08B0F}  mov      ax, word ptr [0x198]        
  {08B12}  cdq                                  
  {08B13}  push     dx                          
  {08B14}  push     ax                          
  {08B15}  xor      ax, ax                      
  {08B17}  push     ax                          
  {08B18}  lcall    0x1c71, 0x789               
  {08B1D}  mov      di, 0x86c4                  
  {08B20}  push     cs                          
  {08B21}  push     di                          
  {08B22}  xor      ax, ax                      
  {08B24}  push     ax                          
  {08B25}  lcall    0x1c71, 0x701               
  {08B2A}  lcall    0x1c71, 0x5dd               
  {08B2F}  lcall    0x1c71, 0x291               
  {08B34}  mov      di, 0x7a2                   
  {08B37}  push     ds                          
  {08B38}  push     di                          
  {08B39}  mov      di, 0x86a9                  
  {08B3C}  push     cs                          
  {08B3D}  push     di                          
  {08B3E}  xor      ax, ax                      
  {08B40}  push     ax                          
  {08B41}  lcall    0x1c71, 0x701               
  {08B46}  mov      ax, word ptr [0x19a]        
  {08B49}  cdq                                  
  {08B4A}  push     dx                          
  {08B4B}  push     ax                          
  {08B4C}  xor      ax, ax                      
  {08B4E}  push     ax                          
  {08B4F}  lcall    0x1c71, 0x789               
  {08B54}  mov      di, 0x86e4                  
  {08B57}  push     cs                          
  {08B58}  push     di                          
  {08B59}  xor      ax, ax                      
  {08B5B}  push     ax                          
  {08B5C}  lcall    0x1c71, 0x701               
  {08B61}  lcall    0x1c71, 0x5dd               
  {08B66}  lcall    0x1c71, 0x291               
  {08B6B}  mov      di, 0x7a2                   
  {08B6E}  push     ds                          
  {08B6F}  push     di                          
  {08B70}  mov      di, 0x86a9                  
  {08B73}  push     cs                          
  {08B74}  push     di                          
  {08B75}  xor      ax, ax                      
  {08B77}  push     ax                          
  {08B78}  lcall    0x1c71, 0x701               
  {08B7D}  mov      ax, word ptr [0x196]        
  {08B80}  cdq                                  
  {08B81}  push     dx                          
  {08B82}  push     ax                          
  {08B83}  xor      ax, ax                      
  {08B85}  push     ax                          
  {08B86}  lcall    0x1c71, 0x789               
  {08B8B}  mov      di, 0x870a                  
  {08B8E}  push     cs                          
  {08B8F}  push     di                          
  {08B90}  xor      ax, ax                      
  {08B92}  push     ax                          
  {08B93}  lcall    0x1c71, 0x701               
  {08B98}  lcall    0x1c71, 0x5dd               
  {08B9D}  lcall    0x1c71, 0x291               
  {08BA2}  pop      bp                          
  {08BA3}  ret                                  
  {08BA4}  sbb      ax, 0x454a                  
  {08BA7}  push     bx                          
  {08BA8}  push     sp                          
  {08BA9}  inc      bp                          
  {08BAA}  push     bx                          
  {08BAB}  and      byte ptr [bx + 0x42], cl    
  {08BAE}  dec      sp                          
  {08BAF}  inc      cx                          
  {08BB0}  inc      sp                          
  {08BB1}  dec      di                          
  {08BB2}  push     di                          
  {08BB3}  inc      cx                          
  {08BB4}  dec      si                          
  {08BB5}  pop      cx                          
  {08BB6}  and      byte ptr [bx + di], ah      
  {08BB8}  and      word ptr [bx + di], sp      
  {08BBA}  and      byte ptr [di + 0x41], cl    
  {08BBD}  push     bx                          
  {08BBE}  pop      dx                          
  {08BBF}  and      byte ptr [bx + 0x20], cl    
  {08BC2}  or       byte ptr [bx + si], ah      
  {08BC4}  pop      dx                          
  {08BC5}  inc      cx                          
  {08BC6}  and      byte ptr [si + 0x55], al    
  {08BC9}  pop      dx                          
  {08BCA}  dec      di                          
  {08BCB}  or       byte ptr [si + 0x52], dl    
  {08BCE}  inc      cx                          
  {08BCF}  inc      bx                          
  {08BD0}  dec      cx                          
  {08BD1}  push     bx                          
  {08BD2}  pop      dx                          
  {08BD3}  and      byte ptr [bx + si], cl      
  {08BD5}  and      ax, 0x4520                  
  {08BD8}  dec      si                          
  {08BD9}  inc      bp                          
  {08BDA}  push     dx                          
  {08BDB}  inc      di                          
  {08BDC}  dec      cx                          
  {08BDD}  pop      ss                          
  {08BDE}  dec      dx                          
  {08BDF}  inc      bp                          
  {08BE0}  push     bx                          
  {08BE1}  push     sp                          
  {08BE2}  inc      bp                          
  {08BE3}  push     bx                          
  {08BE4}  and      byte ptr [bp + si + 0x41], bl
  {08BE7}  push     sp                          
  {08BE8}  push     dx                          
  {08BE9}  push     bp                          
  {08BEA}  push     sp                          
  {08BEB}  pop      cx                          
  {08BEC}  and      byte ptr [si + 0x52], dl    
  {08BEF}  inc      cx                          
  {08BF0}  inc      bx                          
  {08BF1}  dec      cx                          
  {08BF2}  push     bx                          
  {08BF3}  pop      dx                          
  {08BF4}  and      byte ptr [bx + di], cl      
  {08BF6}  and      byte ptr [di], ah           
  {08BF8}  and      byte ptr [di + 0x4e], al    
  {08BFB}  inc      bp                          
  {08BFC}  push     dx                          
  {08BFD}  inc      di                          
  {08BFE}  dec      cx                          
  {08BFF}  inc      si                          
  {08C00}  push     sp                          
  {08C01}  inc      bp                          
  {08C02}  dec      si                          
  {08C03}  and      byte ptr [bx + si + 0x4f], dl
  {08C06}  dec      bx                          
  {08C07}  dec      di                          
  {08C08}  dec      dx                          
  {08C09}  and      byte ptr [bp + si + 0x45], cl
  {08C0C}  push     bx                          
  {08C0D}  push     sp                          
  {08C0E}  and      byte ptr [bp + di + 0x41], al
  {08C11}  dec      sp                          
  {08C12}  pop      cx                          
  {08C13}  and      byte ptr [bx + 0x42], cl    
  {08C16}  push     dx                          
  {08C17}  pop      cx                          
  {08C18}  pop      dx                          
  {08C19}  inc      di                          
  {08C1A}  inc      cx                          
  {08C1B}  dec      si                          
  {08C1C}  pop      cx                          
  {08C1D}  and      byte ptr [bp + di + 0x52], cl
  {08C20}  push     di                          
  {08C21}  dec      cx                          
  {08C22}  inc      cx                          
  {08C23}  and      byte ptr [bp + 0x41], cl    
  {08C26}  and      byte ptr [bp + di + 0x43], dl
  {08C29}  dec      cx                          
  {08C2A}  inc      cx                          
  {08C2B}  dec      si                          
  {08C2C}  inc      cx                          
  {08C2D}  inc      bx                          
  {08C2E}  dec      ax                          
  {08C2F}  and      byte ptr [bp + 0x4c], al    
  {08C32}  inc      cx                          
  {08C33}  dec      bx                          
  {08C34}  dec      cx                          
  {08C35}  and      byte ptr [bx + di + 0x20], cl
  {08C38}  dec      bp                          
  {08C39}  dec      di                          
  {08C3A}  pop      dx                          
  {08C3B}  inc      di                          
  {08C3C}  dec      cx                          
  {08C3D}  and      byte ptr [si + 0x4f], cl    
  {08C40}  inc      sp                          
  {08C41}  pop      dx                          
  {08C42}  dec      bx                          
  {08C43}  dec      cx                          
  {08C44}  inc      bp                          
  {08C45}  and      byte ptr [si], ah           
  {08C47}  pop      dx                          
  {08C48}  push     dx                          
  {08C49}  inc      bp                          
  {08C4A}  inc      bx                          
  {08C4B}  pop      dx                          
  {08C4C}  dec      si                          
  {08C4D}  pop      cx                          
  {08C4E}  and      byte ptr [bx + si + 0x4f], dl
  {08C51}  push     sp                          
  {08C52}  push     di                          
  {08C53}  dec      di                          
  {08C54}  push     dx                          
  {08C55}  and      byte ptr [bp + di + 0x4d], dl
  {08C58}  dec      cx                          
  {08C59}  inc      di                          
  {08C5A}  inc      cx                          
  {08C5B}  and      byte ptr [di + 0x49], cl    
  {08C5E}  inc      bp                          
  {08C5F}  inc      sp                          
  {08C60}  pop      dx                          
  {08C61}  pop      cx                          
  {08C62}  and      byte ptr [bp + di + 0x43], dl
  {08C65}  dec      cx                          
  {08C66}  inc      cx                          
  {08C67}  dec      si                          
  {08C68}  inc      cx                          
  {08C69}  dec      bp                          
  {08C6A}  dec      cx                          
  {08C6B}  xor      word ptr [bx + si + 0x41], dx
  {08C6E}  push     dx                          
  {08C6F}  dec      di                          
  {08C70}  dec      dx                          
  {08C71}  inc      cx                          
  {08C72}  inc      bx                          
  {08C73}  inc      bp                          
  {08C74}  and      byte ptr [bx + 0x4e], dl    
  {08C77}  inc      bp                          
  {08C78}  push     sp                          
  {08C79}  push     dx                          
  {08C7A}  pop      dx                          
  {08C7B}  dec      si                          
  {08C7C}  dec      di                          
  {08C7D}  push     bx                          
  {08C7E}  inc      bx                          
  {08C7F}  dec      cx                          
  {08C80}  and      byte ptr [bx + si + 0x4f], dl
  {08C83}  push     sp                          
  {08C84}  push     di                          
  {08C85}  dec      di                          
  {08C86}  push     dx                          
  {08C87}  inc      cx                          
  {08C88}  and      byte ptr [bp + di + 0x4d], dl
  {08C8B}  dec      cx                          
  {08C8C}  inc      bp                          
  {08C8D}  push     dx                          
  {08C8E}  inc      sp                          
  {08C8F}  pop      dx                          
  {08C90}  inc      cx                          
  {08C91}  and      byte ptr [si + 0x4f], al    
  {08C94}  push     bx                          
  {08C95}  pop      cx                          
  {08C96}  inc      bx                          
  {08C97}  and      byte ptr [di + 0x4f], cl    
  {08C9A}  inc      bx                          
  {08C9B}  dec      si                          
  {08C9C}  dec      di                          
  {08C9D}  add      ah, byte ptr [di]           
  {08C9F}  add      al, 0x45                    
  {08CA2}  pop      ax                          
  {08CA3}  dec      cx                          
  {08CA4}  push     sp                          
  {08CA5}  adc      word ptr [si + 0x4f], ax    
  {08CA8}  push     bx                          
  {08CA9}  push     sp                          
  {08CAA}  inc      bp                          
  {08CAB}  push     ax                          
  {08CAC}  dec      si                          
  {08CAD}  inc      bp                          
  {08CAE}  and      byte ptr [bx + 0x59], dl    
  {08CB1}  dec      dx                          
  {08CB2}  push     bx                          
  {08CB3}  inc      bx                          
  {08CB4}  dec      cx                          
  {08CB5}  inc      cx                          
  {08CB6}  cmp      bl, byte ptr [bp + di]      
  {08CB8}  push     ax                          
  {08CB9}  dec      di                          
  {08CBA}  dec      sp                          
  {08CBB}  dec      di                          
  {08CBC}  inc      sp                          
  {08CBD}  dec      si                          
  {08CBE}  dec      cx                          
  {08CBF}  inc      bp                          
  {08CC0}  sub      ax, 0x4c4b                  
  {08CC3}  inc      cx                          
  {08CC4}  push     sp                          
  {08CC5}  dec      bx                          
  {08CC6}  dec      cx                          
  {08CC7}  and      byte ptr [bx + si + 0x45], dl
  {08CCA}  dec      sp                          
  {08CCB}  dec      si                          
  {08CCC}  inc      bp                          
  {08CCD}  and      byte ptr [bx + 0x41], al    
  {08CD0}  dec      dx                          
  {08CD1}  inc      sp                          
  {08CD2}  pop      cx                          
  {08CD3}  add      al, 0x4d                    
  {08CD5}  dec      di                          
  {08CD6}  inc      sp                          
  {08CD7}  inc      bp                          
  {08CD8}  pop      es                          
  {08CD9}  push     di                          
  {08CDA}  pop      cx                          
  {08CDB}  dec      dx                          
  {08CDC}  push     bx                          
  {08CDD}  inc      bx                          
  {08CDE}  dec      cx                          
  {08CDF}  inc      bp                          
  {08CE0}  or       byte ptr [bx + si + 0x4f], dl
  {08CE3}  dec      sp                          
  {08CE4}  dec      di                          
  {08CE5}  inc      sp                          
  {08CE6}  dec      si                          
  {08CE7}  dec      cx                          
  {08CE8}  inc      bp                          
  {08CE9}  or       al, 0x5a                    
  {08CEB}  inc      cx                          
  {08CEC}  inc      dx                          
  {08CED}  dec      cx                          
  {08CEE}  dec      dx                          
  {08CEF}  and      byte ptr [bx + si + 0x4f], dl
  {08CF2}  push     sp                          
  {08CF3}  push     di                          
  {08CF4}  dec      di                          
  {08CF5}  push     dx                          
  {08CF6}  or       dl, byte ptr [bx + 0x59]    
  {08CF9}  inc      bx                          
  {08CFA}  dec      cx                          
  {08CFB}  inc      cx                          
  {08CFC}  inc      di                          
  {08CFD}  inc      cx                          
  {08CFE}  push     bx                          
  {08CFF}  pop      dx                          
  {08D00}  and      byte ptr [0x4d20], dl       
  {08D04}  dec      di                          
  {08D05}  dec      si                          
  {08D06}  inc      bp                          
  {08D07}  push     sp                          
  {08D08}  and      byte ptr [bp + si + 0x20], bl
  {08D0B}  inc      bx                          
  {08D0C}  dec      cx                          
  {08D0D}  inc      cx                          
  {08D0E}  dec      sp                          
  {08D0F}  inc      cx                          
  {08D10}  and      byte ptr [bx + si + 0x4f], dl
  {08D13}  push     sp                          
  {08D14}  push     di                          
  {08D15}  dec      di                          
  {08D16}  push     dx                          
  {08D17}  inc      cx                          
  {08D18}  xor      word ptr [bx + 0x59], dx    
  {08D1B}  inc      bx                          
  {08D1C}  dec      cx                          
  {08D1D}  inc      cx                          
  {08D1E}  inc      di                          
  {08D1F}  inc      cx                          
  {08D20}  push     bx                          
  {08D21}  pop      dx                          
  {08D22}  and      byte ptr [bp + di + 0x54], dl
  {08D25}  inc      cx                          
  {08D26}  push     dx                          
  {08D27}  pop      cx                          
  {08D28}  and      byte ptr [bp + si + 0x41], bl
  {08D2B}  push     dx                          
  {08D2C}  inc      sp                          
  {08D2D}  pop      dx                          
  {08D2E}  inc      bp                          
  {08D2F}  push     di                          
  {08D30}  dec      cx                          
  {08D31}  inc      cx                          
  {08D32}  dec      sp                          
  {08D33}  pop      cx                          
  {08D34}  and      byte ptr [di + 0x49], cl    
  {08D37}  inc      bp                          
  {08D38}  inc      bx                          
  {08D39}  pop      dx                          
  {08D3A}  and      byte ptr [bp + si + 0x20], bl
  {08D3D}  inc      bx                          
  {08D3E}  dec      cx                          
  {08D3F}  inc      cx                          
  {08D40}  dec      sp                          
  {08D41}  inc      cx                          
  {08D42}  and      byte ptr [bx + si + 0x4f], dl
  {08D45}  push     sp                          
  {08D46}  push     di                          
  {08D47}  dec      di                          
  {08D48}  push     dx                          
  {08D49}  inc      cx                          
  {08D4A}  sub      al, 0x57                    
  {08D4C}  pop      cx                          
  {08D4D}  inc      bx                          
  {08D4E}  dec      cx                          
  {08D4F}  inc      cx                          
  {08D50}  inc      di                          
  {08D51}  inc      cx                          
  {08D52}  push     bx                          
  {08D53}  pop      dx                          
  {08D54}  and      byte ptr [bp + si + 0x57], bl
  {08D57}  pop      cx                          
  {08D58}  dec      bx                          
  {08D59}  dec      sp                          
  {08D5A}  inc      cx                          
  {08D5B}  and      byte ptr [di + 0x41], cl    
  {08D5E}  dec      sp                          
  {08D5F}  inc      cx                          
  {08D60}  and      byte ptr [si + 0x41], dl    
  {08D63}  push     dx                          
  {08D64}  inc      bx                          
  {08D65}  pop      dx                          
  {08D66}  inc      cx                          
  {08D67}  and      byte ptr [bp + si + 0x20], bl
  {08D6A}  inc      bx                          
  {08D6B}  dec      cx                          
  {08D6C}  inc      cx                          
  {08D6D}  dec      sp                          
  {08D6E}  inc      cx                          
  {08D6F}  and      byte ptr [bx + si + 0x4f], dl
  {08D72}  push     sp                          
  {08D73}  push     di                          
  {08D74}  dec      di                          
  {08D75}  push     dx                          
  {08D76}  inc      cx                          
  {08D77}  sub      dx, word ptr [bx + 0x59]    
  {08D7A}  inc      bx                          
  {08D7B}  dec      cx                          
  {08D7C}  inc      cx                          
  {08D7D}  inc      di                          
  {08D7E}  inc      cx                          
  {08D7F}  push     bx                          
  {08D80}  pop      dx                          
  {08D81}  and      byte ptr [bp + si + 0x41], bl
  {08D84}  dec      bx                          
  {08D85}  push     dx                          
  {08D86}  push     di                          
  {08D87}  inc      cx                          
  {08D88}  push     di                          
  {08D89}  dec      cx                          
  {08D8A}  dec      di                          
  {08D8B}  dec      si                          
  {08D8C}  inc      bp                          
  {08D8D}  and      byte ptr [bp + di + 0x45], dl
  {08D90}  push     dx                          
  {08D91}  inc      bx                          
  {08D92}  inc      bp                          
  {08D93}  and      byte ptr [bp + si + 0x20], bl
  {08D96}  inc      bx                          
  {08D97}  dec      cx                          
  {08D98}  inc      cx                          
  {08D99}  dec      sp                          
  {08D9A}  inc      cx                          
  {08D9B}  and      byte ptr [bx + si + 0x4f], dl
  {08D9E}  push     sp                          
  {08D9F}  push     di                          
  {08DA0}  dec      di                          
  {08DA1}  push     dx                          
  {08DA2}  inc      cx                          
  {08DA3}  cmp      dx, word ptr [bx + si + 0x4f]
  {08DA6}  push     di                          
  {08DA7}  dec      di                          
  {08DA8}  dec      sp                          
  {08DA9}  dec      si                          
  {08DAA}  pop      cx                          
  {08DAB}  and      byte ptr [bx + di + 0x43], al
  {08DAE}  pop      dx                          
  {08DAF}  and      byte ptr [bx + 0x44], cl    
  {08DB2}  push     ax                          
  {08DB3}  dec      di                          
  {08DB4}  push     dx                          
  {08DB5}  dec      si                          
  {08DB6}  pop      cx                          
  {08DB7}  and      byte ptr [bp + 0x41], cl    
  {08DBA}  and      byte ptr [bp + si + 0x4f], al
  {08DBD}  dec      sp                          
  {08DBE}  and      byte ptr [bx + si + 0x4f], dl
  {08DC1}  push     sp                          
  {08DC2}  push     di                          
  {08DC3}  dec      di                          
  {08DC4}  push     dx                          
  {08DC5}  and      byte ptr [bp + di + 0x50], dl
  {08DC8}  dec      di                          
  {08DC9}  dec      bx                          
  {08DCA}  dec      di                          
  {08DCB}  dec      dx                          
  {08DCC}  dec      si                          
  {08DCD}  dec      cx                          
  {08DCE}  inc      bp                          
  {08DCF}  and      byte ptr [si + 0x45], cl    
  {08DD2}  pop      dx                          
  {08DD3}  pop      cx                          
  {08DD4}  and      byte ptr [bx + si + 0x4f], dl
  {08DD7}  inc      sp                          
  {08DD8}  and      byte ptr [bp + di + 0x43], dl
  {08DDB}  dec      cx                          
  {08DDC}  inc      cx                          
  {08DDD}  dec      si                          
  {08DDE}  inc      cx                          
  {08DDF}  xor      dx, word ptr [bx + si + 0x41]
  {08DE2}  push     dx                          
  {08DE3}  dec      di                          
  {08DE4}  dec      dx                          
  {08DE5}  inc      cx                          
  {08DE6}  inc      bx                          
  {08DE7}  inc      bp                          
  {08DE8}  and      byte ptr [bx + 0x4e], dl    
  {08DEB}  inc      bp                          
  {08DEC}  push     sp                          
  {08DED}  push     dx                          
  {08DEE}  pop      dx                          
  {08DEF}  dec      si                          
  {08DF0}  dec      di                          
  {08DF1}  push     bx                          
  {08DF2}  inc      bx                          
  {08DF3}  dec      cx                          
  {08DF4}  and      byte ptr [bx + si + 0x4f], dl
  {08DF7}  push     sp                          
  {08DF8}  push     di                          
  {08DF9}  dec      di                          
  {08DFA}  push     dx                          
  {08DFB}  inc      cx                          
  {08DFC}  and      byte ptr [bp + di + 0x41], dl
  {08DFF}  and      byte ptr [bp + si + 0x4f], dl
  {08E02}  pop      dx                          
  {08E03}  push     di                          
  {08E04}  dec      sp                          
  {08E05}  inc      bp                          
  {08E06}  inc      bx                          
  {08E07}  pop      dx                          
  {08E08}  dec      di                          
  {08E09}  dec      si                          
  {08E0A}  inc      bp                          
  {08E0B}  and      byte ptr [si + 0x4f], al    
  {08E0E}  dec      di                          
  {08E0F}  dec      bx                          
  {08E10}  dec      di                          
  {08E11}  dec      sp                          
  {08E12}  inc      cx                          
  {08E13}  sbb      word ptr [bx + si + 0x4f], dx
  {08E16}  dec      sp                          
  {08E17}  dec      si                          
  {08E18}  dec      di                          
  {08E19}  inc      bx                          
  {08E1A}  sub      ax, 0x4c4b                  
  {08E1D}  inc      cx                          
  {08E1E}  push     sp                          
  {08E1F}  dec      bx                          
  {08E20}  dec      cx                          
  {08E21}  and      byte ptr [bx + si + 0x45], dl
  {08E24}  dec      sp                          
  {08E25}  dec      si                          
  {08E26}  inc      bp                          
  {08E27}  and      byte ptr [bx + 0x41], al    
  {08E2A}  dec      dx                          
  {08E2B}  inc      sp                          
  {08E2C}  pop      cx                          
  {08E2D}  push     es                          
  {08E2E}  push     ax                          
  {08E2F}  dec      di                          
  {08E30}  dec      sp                          
  {08E31}  dec      si                          
  {08E32}  dec      di                          
  {08E33}  inc      bx                          
  {08E34}  das                                  
  {08E35}  dec      di                          
  {08E36}  inc      di                          
  {08E37}  push     dx                          
  {08E38}  dec      di                          
  {08E39}  dec      bp                          
  {08E3A}  dec      si                          
  {08E3B}  pop      cx                          
  {08E3C}  and      byte ptr [bx + si + 0x4f], dl
  {08E3F}  push     sp                          
  {08E40}  push     di                          
  {08E41}  dec      di                          
  {08E42}  push     dx                          
  {08E43}  and      byte ptr [bx + 0x49], dl    
  {08E46}  inc      sp                          
  {08E47}  pop      dx                          
  {08E48}  inc      cx                          
  {08E49}  inc      bx                          
  {08E4A}  and      byte ptr [di + 0x49], cl    
  {08E4D}  inc      bp                          
  {08E4E}  push     bx                          
  {08E4F}  dec      di                          
  {08E50}  and      byte ptr [bp + si + 0x5a], dl
  {08E53}  push     bp                          
  {08E54}  inc      bx                          
  {08E55}  inc      cx                          
  {08E56}  and      byte ptr [bp + di + 0x49], dl
  {08E59}  inc      bp                          
  {08E5A}  and      byte ptr [bp + 0x41], cl    
  {08E5D}  and      byte ptr [bp + di + 0x49], al
  {08E60}  inc      bp                          
  {08E61}  inc      dx                          
  {08E62}  dec      cx                          
  {08E63}  inc      bp                          
  {08E64}  push     ss                          
  {08E65}  inc      sp                          
  {08E66}  dec      di                          
  {08E67}  dec      sp                          
  {08E68}  sub      ax, 0x4c4b                  
  {08E6B}  inc      cx                          
  {08E6C}  push     sp                          
  {08E6D}  dec      bx                          
  {08E6E}  dec      cx                          
  {08E6F}  and      byte ptr [bx + si + 0x45], dl
  {08E72}  dec      sp                          
  {08E73}  dec      si                          
  {08E74}  inc      bp                          
  {08E75}  and      byte ptr [bx + 0x41], al    
  {08E78}  dec      dx                          
  {08E79}  inc      sp                          
  {08E7A}  pop      cx                          
  {08E7B}  add      ax, word ptr [si + 0x4f]    
  {08E7E}  dec      sp                          
  {08E7F}  dec      dx                          
  {08E81}  inc      bp                          
  {08E82}  push     bx                          
  {08E83}  push     sp                          
  {08E84}  inc      bp                          
  {08E85}  push     bx                          
  {08E86}  and      byte ptr [bx + 0x20], dl    
  {08E89}  push     ax                          
  {08E8A}  dec      di                          
  {08E8B}  dec      bx                          
  {08E8C}  dec      di                          
  {08E8D}  dec      dx                          
  {08E8E}  push     bp                          
  {08E8F}  and      byte ptr [bx + 0x20], dl    
  {08E92}  dec      bx                          
  {08E93}  push     sp                          
  {08E94}  dec      di                          
  {08E95}  push     dx                          
  {08E96}  pop      cx                          
  {08E97}  dec      bp                          
  {08E98}  and      byte ptr [bx + di], ah      
  {08E9A}  dec      dx                          
  {08E9B}  inc      bp                          
  {08E9C}  push     bx                          
  {08E9D}  push     sp                          
  {08E9E}  and      word ptr [bx + si], sp      
  {08EA0}  and      word ptr [bx + si + 0x4c], dx
  {08EA3}  inc      cx                          
  {08EA4}  dec      bx                          
  {08EA5}  inc      cx                          
  {08EA6}  push     sp                          
  {08EA7}  and      byte ptr [bx + si], ch      
  {08EA9}  push     bx                          
  {08EAA}  dec      bp                          
  {08EAB}  dec      cx                          
  {08EAC}  inc      bp                          
  {08EAD}  push     dx                          
  {08EAE}  inc      sp                          
  {08EAF}  pop      dx                          
  {08EB0}  dec      cx                          
  {08EB1}  and      byte ptr [si + 0x55], dl    
  {08EB4}  sub      word ptr [bx + si], sp      
  {08EB6}  pop      ss                          
  {08EB7}  inc      di                          
  {08EB8}  dec      di                          
  {08EB9}  push     dx                          
  {08EBA}  inc      cx                          
  {08EBB}  sub      ax, 0x4c4b                  
  {08EBE}  inc      cx                          
  {08EBF}  push     sp                          
  {08EC0}  dec      bx                          
  {08EC1}  dec      cx                          
  {08EC2}  and      byte ptr [bx + si + 0x45], dl
  {08EC5}  dec      sp                          
  {08EC6}  dec      si                          
  {08EC7}  inc      bp                          
  {08EC8}  and      byte ptr [bx + 0x41], al    
  {08ECB}  dec      dx                          
  {08ECC}  inc      sp                          
  {08ECD}  pop      cx                          
  {08ECE}  cmove    cx, word ptr [bx + 0x4c]    
  {08ED2}  sub      ax, 0x4554                  
  {08ED5}  dec      sp                          
  {08ED6}  inc      bp                          
  {08ED7}  push     ax                          
  {08ED8}  dec      di                          
  {08ED9}  push     dx                          
  {08EDA}  push     sp                          
  {08EDB}  and      word ptr [bx + di], sp      
  {08EDD}  and      word ptr [si], cx           
  {08EDF}  push     ax                          
  {08EE0}  inc      cx                          
  {08EE1}  push     sp                          
  {08EE2}  push     dx                          
  {08EE3}  pop      dx                          
  {08EE4}  and      byte ptr [bx + si + 0x4c], dl
  {08EE7}  inc      cx                          
  {08EE8}  dec      bx                          
  {08EE9}  inc      cx                          
  {08EEA}  push     sp                          
  {08EEB}  adc      cl, byte ptr [bp + 0x41]    
  {08EEE}  and      byte ptr [bx + si + 0x4c], dl
  {08EF1}  inc      cx                          
  {08EF2}  dec      bx                          
  {08EF3}  inc      cx                          
  {08EF4}  inc      bx                          
  {08EF5}  dec      cx                          
  {08EF6}  inc      bp                          
  {08EF7}  and      byte ptr [bx + si + 0x49], dl
  {08EFA}  push     bx                          
  {08EFB}  pop      dx                          
  {08EFC}  inc      bp                          
  {08EFD}  cmp      dh, byte ptr [bp + si]      
  {08EFF}  push     bx                          
  {08F00}  dec      di                          
  {08F01}  push     dx                          
  {08F02}  push     dx                          
  {08F03}  pop      cx                          
  {08F04}  and      byte ptr [bp + si + 0x45], bl
  {08F07}  and      byte ptr [bp + 0x49], cl    
  {08F0A}  inc      bp                          
  {08F0B}  and      byte ptr [di + 0x4d], dl    
  {08F0E}  pop      cx                          
  {08F0F}  dec      sp                          
  {08F10}  inc      bp                          
  {08F11}  dec      bp                          
  {08F12}  and      byte ptr [bx + si + 0x4f], dl
  {08F15}  dec      bx                          
  {08F16}  dec      di                          
  {08F17}  dec      dx                          
  {08F18}  push     bp                          
  {08F19}  and      byte ptr [bx + di + 0x4c], al
  {08F1C}  inc      bp                          
  {08F1D}  and      byte ptr [bp + 0x49], cl    
  {08F20}  inc      bp                          
  {08F21}  and      byte ptr [di + 0x41], cl    
  {08F24}  dec      bp                          
  {08F25}  and      byte ptr [bp + 0x41], cl    
  {08F28}  and      byte ptr [si + 0x4f], dl    
  {08F2B}  and      byte ptr [bp + di + 0x5a], al
  {08F2E}  inc      cx                          
  {08F2F}  push     bx                          
  {08F30}  push     bp                          
  {08F31}  xor      al, 0x4a                    
  {08F33}  inc      bp                          
  {08F34}  pop      dx                          
  {08F35}  inc      bp                          
  {08F36}  dec      sp                          
  {08F37}  dec      cx                          
  {08F38}  and      byte ptr [bp + si + 0x59], al
  {08F3B}  dec      sp                          
  {08F3C}  inc      bp                          
  {08F3D}  push     bx                          
  {08F3E}  and      byte ptr [bx + di + 0x4b], al
  {08F41}  push     sp                          
  {08F42}  pop      cx                          
  {08F43}  push     di                          
  {08F44}  dec      si                          
  {08F45}  pop      cx                          
  {08F46}  and      byte ptr [si + 0x4f], dl    
  {08F49}  and      byte ptr [bx + si + 0x4f], dl
  {08F4C}  push     di                          
  {08F4D}  dec      cx                          
  {08F4E}  dec      si                          
  {08F4F}  dec      cx                          
  {08F50}  inc      bp                          
  {08F51}  dec      si                          
  {08F52}  inc      bp                          
  {08F53}  push     bx                          
  {08F54}  and      byte ptr [si + 0x49], cl    
  {08F57}  inc      bx                          
  {08F58}  pop      dx                          
  {08F59}  pop      cx                          
  {08F5A}  inc      bx                          
  {08F5B}  and      byte ptr [bp + 0x41], cl    
  {08F5E}  and      byte ptr [bp + 0x41], cl    
  {08F61}  inc      di                          
  {08F62}  push     dx                          
  {08F63}  dec      di                          
  {08F64}  inc      sp                          
  {08F65}  inc      bp                          
  {08F66}  cmp      dl, byte ptr [bp + di + 0x50]
  {08F69}  push     dx                          
  {08F6A}  inc      cx                          
  {08F6B}  push     di                          
  {08F6C}  inc      sp                          
  {08F6D}  pop      dx                          
  {08F6E}  and      byte ptr [bp + di + 0x5a], al
  {08F71}  pop      cx                          
  {08F72}  and      byte ptr [si + 0x45], cl    
  {08F75}  pop      dx                          
  {08F76}  pop      cx                          
  {08F77}  and      byte ptr [si + 0x55], dl    
  {08F7A}  and      byte ptr [bp + di + 0x4f], al
  {08F7D}  push     bx                          
  {08F7E}  and      byte ptr [si], ch           
  {08F80}  and      byte ptr [bx + si + 0x4f], dl
  {08F83}  push     sp                          
  {08F84}  inc      bp                          
  {08F85}  dec      bp                          
  {08F86}  and      byte ptr [di + 0x4f], cl    
  {08F89}  pop      dx                          
  {08F8A}  inc      bp                          
  {08F8B}  push     bx                          
  {08F8C}  pop      dx                          
  {08F8D}  and      byte ptr [bp + si + 0x45], bl
  {08F90}  dec      dx                          
  {08F91}  pop      dx                          
  {08F92}  inc      sp                          
  {08F93}  and      byte ptr [si + 0x4f], al    
  {08F96}  and      byte ptr [si + 0x45], dl    
  {08F99}  dec      sp                          
  {08F9A}  inc      bp                          
  {08F9B}  push     ax                          
  {08F9C}  dec      di                          
  {08F9D}  push     dx                          
  {08F9E}  push     sp                          
  {08F9F}  push     bp                          
  {08FA0}  and      byte ptr [si], al           
  {08FA2}  inc      di                          
  {08FA3}  dec      di                          
  {08FA4}  push     dx                          
  {08FA5}  inc      cx                          
  {08FA6}  das                                  
  {08FA7}  inc      dx                          
  {08FA8}  inc      dx                          
  {08FA9}  inc      dx                          
  {08FAA}  inc      dx                          
  {08FAB}  inc      dx                          
  {08FAC}  inc      dx                          
  {08FAD}  inc      dx                          
  {08FAE}  inc      dx                          
  {08FAF}  pop      dx                          
  {08FB0}  inc      dx                          
  {08FB1}  pop      dx                          
  {08FB2}  inc      dx                          
  {08FB3}  pop      dx                          
  {08FB4}  inc      dx                          
  {08FB5}  pop      dx                          
  {08FB6}  inc      dx                          
  {08FB7}  pop      dx                          
  {08FB8}  pop      dx                          
  {08FB9}  pop      dx                          
  {08FBA}  pop      dx                          
  {08FBB}  pop      dx                          
  {08FBC}  pop      dx                          
  {08FBD}  pop      dx                          
  {08FBE}  jp       0x903a                      
  {08FC0}  jp       0x903c                      
  {08FC2}  jp       0x903e                      
  {08FC4}  jp       0x9040                      
  {08FC6}  jp       0x902a                      
  {08FC8}  bound    di, dword ptr [bp + si + 0x62]
  {08FCB}  inc      dx                          
  {08FCC}  bound    di, dword ptr [bp + si + 0x62]
  {08FCF}  jp       0x9033                      
  {08FD1}  jp       0x9015                      
  {08FD3}  pop      dx                          
  {08FD4}  pop      dx                          
  {08FD5}  pop      dx                          
  {08FD6}  inc      bp                          
  {08FD7}  cmp      ax, 0x3d3d                  
  {08FDA}  sub      ax, 0x2d2d                  
  {08FDD}  sub      ax, 0x2d2d                  
  {08FE0}  sub      ax, 0x2e2e                  
  {08FE3}  pop      di                          
  {08FE8}  pop      di                          
  {08FE9}  pop      di                          
  {08FEA}  pop      di                          
  {08FEB}  pop      di                          
  {08FEC}  pop      di                          
  {08FED}  pop      di                          
  {08FEE}  pop      di                          
  {08FEF}  pop      di                          
  {08FF0}  sub      ax, 0x2d2d                  
  {08FF8}  sub      ax, 0x2d2d                  
  {08FFB}  sub      ax, 0x2d2d                  
  {08FFE}  sub      ax, 0x2e2e                  
  {09001}  pop      di                          
  {09005}  pop      di                          
  {09006}  pop      di                          
  {09007}  pop      di                          
  {09008}  pop      di                          
  {09009}  pop      di                          
  {0900A}  pop      di                          
  {0900B}  sub      ax, 0x2d2d                  
  {09012}  sub      ax, 0x2d2d                  
  {09015}  sub      ax, 0x3d3d                  
  {09018}  cmp      ax, 0x3d3d                  
  {0901B}  cmp      ax, 0x544a                  
  {0901E}  sub      ch, byte ptr [bp + si]      
  {09020}  sub      al, byte ptr [di + 0x2a]    
  {09023}  sub      ch, byte ptr [bp + si]      
  {09025}  dec      sp                          
  {09026}  sub      ch, byte ptr [bp + si]      
  {09028}  sub      al, byte ptr [di + 0x2a]    
  {0902B}  sub      ch, byte ptr [bp + si]      
  {0902D}  push     ax                          
  {0902E}  sub      ch, byte ptr [bp + si]      
  {09030}  sub      cl, byte ptr [bx + 0x2a]    
  {09033}  sub      ch, byte ptr [bp + si]      
  {09035}  push     dx                          
  {09036}  sub      ch, byte ptr [bp + si]      
  {09038}  sub      dl, byte ptr [si + 0x2a]    
  {0903B}  sub      ch, byte ptr [bp + si]      
  {0903D}  dec      di                          
  {0903E}  sub      ch, byte ptr [bp + si]      
  {09040}  sub      dl, byte ptr [bx + 0x2a]    
  {09043}  sub      ch, byte ptr [bp + si]      
  {09045}  inc      cx                          
  {09046}  sub      ch, byte ptr [bp + si]      
  {09048}  sub      cl, byte ptr [si + 0x2a]    
  {0904B}  sub      ch, byte ptr [bp + si]      
  {0904D}  inc      bp                          
  {0904E}  sub      ch, byte ptr [bp + si]      
  {09050}  sub      dl, byte ptr [bp + di + 0x2a]
  {09053}  sub      ch, byte ptr [bp + si]      
  {09055}  sub      ch, byte ptr [bp + si]      
  {09057}  and      byte ptr [bp + si], ch      
  {09059}  sub      ch, byte ptr [bp + si]      
  {0905B}  sub      ch, byte ptr [bp + si]      
  {0905D}  push     bx                          
  {0905E}  sub      ch, byte ptr [bp + si]      
  {09060}  sub      cl, byte ptr [bx + di + 0x2a]
  {09063}  sub      ch, byte ptr [bp + si]      
  {09065}  inc      bp                          
  {09066}  and      word ptr [bp + si + 0x3d], cx
  {09069}  cmp      ax, 0x3d3d                  
  {0906C}  cmp      ax, 0x3d3d                  
  {0906F}  cmp      ax, 0x3d3d                  
  {09072}  cmp      ax, 0x3d3d                  
  {09075}  cmp      ax, 0x3d3d                  
  {09078}  cmp      ax, 0x3d3d                  
  {0907B}  cmp      ax, 0x3d3d                  
  {0907E}  cmp      ax, 0x3d3d                  
  {09081}  cmp      ax, 0x3d3d                  
  {09084}  cmp      ax, 0x3d3d                  
  {09087}  cmp      ax, 0x3d3d                  
  {0908A}  cmp      ax, 0x3d3d                  
  {0908D}  cmp      ax, 0x3d3d                  
  {09090}  cmp      ax, 0x3d3d                  
  {09093}  cmp      ax, 0x3d3d                  
  {09096}  cmp      ax, 0x3d3d                  
  {09099}  cmp      ax, 0x3d3d                  
  {0909C}  cmp      ax, 0x3d3d                  
  {0909F}  cmp      ax, 0x3d3d                  
  {090A2}  cmp      ax, 0x3d3d                  
  {090A5}  cmp      ax, 0x3d3d                  
  {090A8}  cmp      ax, 0x3d3d                  
  {090AB}  cmp      ax, 0x3d3d                  
  {090AE}  cmp      ax, 0x3d3d                  
  {090B1}  cmp      ax, 0x4a3d                  
  {090B4}  inc      bp                          
  {090B5}  push     bx                          
  {090B6}  push     sp                          
  {090B7}  inc      bp                          
  {090B8}  push     bx                          
  {090B9}  and      byte ptr [bx + 0x20], dl    
  {090BC}  inc      bx                          
  {090BD}  inc      bp                          
  {090BE}  dec      si                          
  {090BF}  push     sp                          
  {090C0}  push     dx                          
  {090C1}  push     bp                          
  {090C2}  dec      bp                          
  {090C3}  and      byte ptr [di + 0x49], cl    
  {090C6}  inc      cx                          
  {090C7}  push     bx                          
  {090C8}  push     sp                          
  {090C9}  inc      cx                          
  {090CA}  and      byte ptr [bp + si], bh      
  {090CC}  and      byte ptr [bp + 0x41], cl    
  {090CF}  and      byte ptr [bp + di + 0x43], dl
  {090D2}  dec      cx                          
  {090D3}  inc      cx                          
  {090D4}  dec      si                          
  {090D5}  dec      cx                          
  {090D6}  inc      bp                          
  {090D7}  and      byte ptr [bp + si + 0x45], cl
  {090DA}  push     bx                          
  {090DB}  push     sp                          
  {090DC}  and      byte ptr [bx + si + 0x4c], dl
  {090DF}  inc      cx                          
  {090E0}  dec      bx                          
  {090E1}  inc      cx                          
  {090E2}  push     sp                          
  {090E3}  and      byte ptr [bx + si], ch      
  {090E5}  inc      sp                          
  {090E6}  push     bp                          
  {090E7}  pop      dx                          
  {090E8}  pop      cx                          
  {090E9}  and      byte ptr [bp + si + 0x55], dl
  {090EC}  inc      bx                          
  {090ED}  dec      ax                          
  {090EE}  sub      word ptr [bx + si], sp      
  {090F0}  and      byte ptr [si + 0x4f], dl    
  {090F3}  and      byte ptr [bp + si + 0x45], cl
  {090F6}  push     bx                          
  {090F7}  push     sp                          
  {090F8}  and      byte ptr [di + 0x49], cl    
  {090FB}  inc      cx                          
  {090FC}  push     bx                          
  {090FD}  push     sp                          
  {090FE}  dec      di                          
  {090FF}  and      byte ptr [bp + si], bh      
  {09101}  and      byte ptr [bp + si + 0x41], dl
  {09104}  inc      sp                          
  {09105}  pop      dx                          
  {09106}  and      byte ptr [bp + di + 0x4f], dl
  {09109}  inc      dx                          
  {0910A}  dec      cx                          
  {0910B}  inc      bp                          
  {0910C}  and      byte ptr [bp + di + 0x41], dl
  {0910F}  dec      bp                          
  {09110}  and      word ptr [bx + si], bx      
  {09112}  push     ax                          
  {09113}  dec      di                          
  {09114}  dec      sp                          
  {09115}  dec      di                          
  {09116}  inc      sp                          
  {09117}  dec      si                          
  {09118}  dec      cx                          
  {09119}  inc      bp                          
  {0911A}  sub      ax, 0x4f50                  
  {0911D}  dec      bx                          
  {0911E}  dec      di                          
  {0911F}  dec      dx                          
  {09120}  and      byte ptr [bp + di + 0x45], al
  {09123}  dec      si                          
  {09124}  push     sp                          
  {09125}  push     dx                          
  {09126}  inc      cx                          
  {09127}  dec      sp                          
  {09128}  dec      si                          
  {09129}  pop      cx                          
  {0912A}  adc      al, 0x50                    
  {0912C}  dec      di                          
  {0912D}  dec      sp                          
  {0912E}  dec      si                          
  {0912F}  dec      di                          
  {09130}  inc      bx                          
  {09131}  sub      ax, 0x4c55                  
  {09134}  push     bx                          
  {09136}  dec      bx                          
  {09137}  dec      sp                          
  {09138}  inc      bp                          
  {09139}  push     ax                          
  {0913A}  dec      cx                          
  {0913B}  dec      bx                          
  {0913C}  dec      di                          
  {0913D}  push     di                          
  {0913E}  inc      cx                          
  {0913F}  adc      byte ptr [bx + 0x53], dl    
  {09142}  inc      bx                          
  {09143}  dec      ax                          
  {09144}  dec      di                          
  {09145}  inc      sp                          
  {09146}  sub      ax, 0x4c55                  
  {09149}  inc      bx                          
  {0914B}  dec      cx                          
  {0914C}  inc      bp                          
  {0914D}  dec      bp                          
  {0914E}  dec      si                          
  {0914F}  inc      cx                          
  {09150}  cvtps2pd xmm0, qword ptr [bx + di + 0x43]
  {09154}  dec      ax                          
  {09155}  dec      di                          
  {09156}  inc      sp                          
  {09157}  sub      ax, 0x4c55                  
  {0915A}  inc      sp                          
  {0915C}  dec      sp                          
  {0915D}  push     bp                          
  {0915E}  inc      di                          
  {0915F}  inc      cx                          
  {09160}  or       byte ptr [bx + 0x59], dl    
  {09163}  dec      dx                          
  {09164}  push     bx                          
  {09165}  inc      bx                          
  {09166}  xor      byte ptr [bx + di + 0x45], cl
  {09169}  push     es                          
  {0916A}  pop      dx                          
  {0916B}  inc      cx                          
  {0916C}  inc      bx                          
  {0916D}  dec      ax                          
  {0916E}  dec      di                          
  {0916F}  inc      sp                          
  {09170}  push     es                          
  {09171}  push     di                          
  {09172}  push     bx                          
  {09173}  inc      bx                          
  {09174}  dec      ax                          
  {09175}  dec      di                          
  {09176}  inc      sp                          
  {09177}  inc      cx                          
  {09178}  dec      dx                          
  {09179}  inc      bp                          
  {0917A}  push     bx                          
  {0917B}  push     sp                          
  {0917C}  inc      bp                          
  {0917D}  push     bx                          
  {0917E}  and      byte ptr [bx + 0x20], dl    
  {09181}  inc      dx                          
  {09182}  inc      cx                          
  {09183}  push     dx                          
  {09184}  pop      dx                          
  {09185}  inc      bp                          
  {09186}  and      byte ptr [bx + si + 0x4f], dl
  {09189}  inc      sp                          
  {0918A}  and      byte ptr [si + 0x57], al    
  {0918D}  dec      di                          
  {0918E}  dec      bp                          
  {0918F}  inc      cx                          
  {09190}  and      byte ptr [bx + si + 0x45], dl
  {09193}  inc      sp                          
  {09194}  inc      cx                          
  {09195}  dec      sp                          
  {09196}  inc      cx                          
  {09197}  dec      bp                          
  {09198}  dec      cx                          
  {09199}  and      byte ptr [bp + di + 0x48], al
  {0919C}  inc      bx                          
  {0919D}  inc      cx                          
  {0919E}  inc      bx                          
  {0919F}  and      byte ptr [bp + si + 0x4f], dl
  {091A2}  pop      dx                          
  {091A3}  push     di                          
  {091A4}  dec      cx                          
  {091A5}  dec      bx                          
  {091A6}  dec      sp                          
  {091A7}  inc      cx                          
  {091A8}  inc      bx                          
  {091A9}  and      byte ptr [si + 0x41], dl    
  {091AC}  and      byte ptr [si + 0x5a], al    
  {091AF}  dec      cx                          
  {091B0}  push     di                          
  {091B1}  dec      si                          
  {091B2}  inc      cx                          
  {091B3}  and      byte ptr [bp + 0x41], cl    
  {091B6}  pop      dx                          
  {091B7}  push     di                          
  {091B8}  inc      bp                          
  {091B9}  push     ax                          
  {091BB}  pop      cx                          
  {091BC}  push     sp                          
  {091BD}  inc      cx                          
  {091BE}  push     bx                          
  {091BF}  pop      dx                          
  {091C0}  and      byte ptr [bp + di + 0x49], dl
  {091C3}  inc      bp                          
  {091C4}  and      byte ptr [bp + si + 0x41], al
  {091C7}  push     dx                          
  {091C8}  dec      bp                          
  {091C9}  inc      cx                          
  {091CA}  dec      si                          
  {091CB}  inc      cx                          
  {091CC}  and      byte ptr [bp + si], bh      
  {091CE}  and      byte ptr [bx + si + 0x52], dl
  {091D1}  pop      dx                          
  {091D2}  inc      bp                          
  {091D3}  push     ax                          
  {091D4}  push     dx                          
  {091D5}  inc      cx                          
  {091D6}  push     bx                          
  {091D7}  pop      dx                          
  {091D8}  inc      cx                          
  {091D9}  dec      bp                          
  {091DA}  and      byte ptr [si + 0x4c], al    
  {091DD}  inc      cx                          
  {091DE}  inc      bx                          
  {091DF}  pop      dx                          
  {091E0}  inc      bp                          
  {091E1}  inc      di                          
  {091E2}  dec      di                          
  {091E3}  and      byte ptr [si + 0x45], dl    
  {091E6}  dec      si                          
  {091E7}  and      byte ptr [bp + si + 0x41], al
  {091EA}  push     dx                          
  {091EB}  and      byte ptr [bp + 0x41], cl    
  {091EE}  pop      dx                          
  {091EF}  pop      cx                          
  {091F0}  push     di                          
  {091F1}  inc      cx                          
  {091F2}  and      byte ptr [bp + di + 0x49], dl
  {091F5}  inc      bp                          
  {091F6}  and      byte ptr [bx + si], ah      
  {091F8}  aaa                                  
  {091F9}  and      dl, byte ptr [bx + si + 0x4f]
  {091FC}  inc      sp                          
  {091FD}  and      byte ptr [si + 0x57], al    
  {09200}  dec      di                          
  {09201}  dec      bp                          
  {09202}  inc      cx                          
  {09203}  and      byte ptr [bx + si + 0x45], dl
  {09206}  inc      sp                          
  {09207}  inc      cx                          
  {09208}  dec      sp                          
  {09209}  inc      cx                          
  {0920A}  dec      bp                          
  {0920B}  dec      cx                          
  {0920C}  and      bh, byte ptr [bx]           
  {0920E}  and      byte ptr [bx + di + 0x20], al
  {09211}  dec      di                          
  {09212}  dec      si                          
  {09213}  and      byte ptr [bp + 0x41], cl    
  {09216}  and      byte ptr [si + 0x4f], dl    
  {09219}  and      byte ptr [di], ch           
  {0921B}  push     di                          
  {0921C}  dec      sp                          
  {0921D}  inc      cx                          
  {0921E}  push     bx                          
  {0921F}  inc      bx                          
  {09220}  dec      cx                          
  {09221}  push     di                          
  {09222}  dec      cx                          
  {09223}  inc      bp                          
  {09224}  and      byte ptr [si + 0x4f], dl    
  {09227}  and      byte ptr [bp + 0x49], cl    
  {0922A}  inc      bp                          
  {0922B}  and      byte ptr [bx + 0x49], dl    
  {0922E}  inc      bp                          
  {0922F}  dec      bp                          
  {09230}  aaa                                  
  {09231}  and      byte ptr [bx + di + 0x4c], al
  {09234}  inc      bp                          
  {09235}  and      byte ptr [bp + di + 0x50], dl
  {09238}  pop      cx                          
  {09239}  push     sp                          
  {0923A}  inc      cx                          
  {0923B}  dec      bp                          
  {0923C}  and      byte ptr [bp + di + 0x49], dl
  {0923F}  inc      bp                          
  {09240}  and      byte ptr [bp + si + 0x4f], bl
  {09243}  dec      si                          
  {09244}  pop      cx                          
  {09245}  cmp      cl, byte ptr [di + 0x41]    
  {09248}  push     dx                          
  {09249}  inc      bp                          
  {0924A}  inc      bp                          
  {0924B}  inc      bp                          
  {0924C}  dec      bx                          
  {0924D}  and      word ptr [bx + di], sp      
  {0924F}  sub      byte ptr cs:[si + 0x65], dh 
  {09259}  jb       0x92bc                      
  {0925B}  jp       0x927d                      
  {0925D}  push     0x75                        
  {0925F}  mov      si, 0x7720                  
  {09262}  imul     sp, word ptr [di + 0x73], 0x297a
  {09267}  and      byte ptr [di], bh           
  {09269}  dec      bp                          
  {0926A}  inc      cx                          
  {0926B}  inc      bx                          
  {0926C}  dec      cx                          
  {0926D}  inc      bp                          
  {0926E}  dec      bx                          
  {0926F}  and      byte ptr [si], ch           
  {09271}  and      byte ptr [si + 0x55], dl    
  {09274}  push     sp                          
  {09275}  inc      bp                          
  {09276}  dec      dx                          
  {09277}  push     bx                          
  {09278}  pop      dx                          
  {09279}  pop      cx                          
  {0927A}  and      byte ptr [bp + si + 0x41], al
  {0927D}  push     dx                          
  {0927E}  dec      bp                          
  {0927F}  inc      cx                          
  {09280}  dec      si                          
  {09281}  and      byte ptr [bp + di + 0x45], dl
  {09284}  push     dx                          
  {09285}  push     di                          
  {09286}  push     bp                          
  {09287}  dec      dx                          
  {09288}  inc      bp                          
  {09289}  and      byte ptr [si + 0x55], dl    
  {0928C}  push     sp                          
  {0928D}  inc      cx                          
  {0928E}  dec      dx                          
  {0928F}  and      byte ptr [si + 0x52], al    
  {09292}  dec      cx                          
  {09293}  dec      si                          
  {09294}  dec      bx                          
  {09295}  dec      cx                          
  {09296}  and      byte ptr [bx + si], ch      
  {09298}  dec      bp                          
  {09299}  dec      di                          
  {0929A}  pop      dx                          
  {0929B}  dec      sp                          
  {0929C}  dec      cx                          
  {0929D}  push     di                          
  {0929E}  inc      cx                          
  {0929F}  and      byte ptr [si + 0x49], cl    
  {092A2}  push     bx                          
  {092A3}  push     sp                          
  {092A4}  inc      cx                          
  {092A5}  and      word ptr [bx + si], sp      
  {092A7}  and      byte ptr [bx + si + 0x45], dl
  {092AA}  inc      sp                          
  {092AB}  inc      cx                          
  {092AC}  dec      sp                          
  {092AD}  and      byte ptr [bp + di + 0x5a], al
  {092B0}  inc      bp                          
  {092B1}  dec      bx                          
  {092B2}  inc      cx                          
  {092B3}  and      byte ptr [si + 0x55], dl    
  {092B6}  and      byte ptr [bp + 0x41], cl    
  {092B9}  and      byte ptr [si + 0x45], dl    
  {092BC}  inc      di                          
  {092BD}  dec      di                          
  {092BE}  and      byte ptr [bp + si + 0x45], cl
  {092C1}  inc      sp                          
  {092C2}  pop      cx                          
  {092C3}  dec      si                          
  {092C4}  inc      bp                          
  {092C5}  inc      di                          
  {092C6}  dec      di                          
  {092C7}  sub      al, 0x50                    
  {092C9}  inc      cx                          
  {092CA}  push     dx                          
  {092CB}  inc      cx                          
  {092CC}  sub      ax, 0x414a                  
  {092CF}  inc      bx                          
  {092D0}  inc      bp                          
  {092D1}  dec      bx                          
  {092D2}  and      byte ptr [bx + di + 0x20], cl
  {092D5}  dec      dx                          
  {092D6}  push     bp                          
  {092D7}  push     dx                          
  {092D8}  inc      bp                          
  {092D9}  dec      bx                          
  {092DA}  and      byte ptr [bx + 0x42], cl    
  {092DD}  dec      bp                          
  {092DE}  pop      cx                          
  {092DF}  push     bx                          
  {092E0}  dec      sp                          
  {092E1}  inc      cx                          
  {092E2}  dec      dx                          
  {092E3}  inc      cx                          
  {092E4}  and      byte ptr [di + 0x49], cl    
  {092E7}  inc      bp                          
  {092E8}  push     bx                          
  {092E9}  dec      cx                          
  {092EA}  inc      cx                          
  {092EB}  inc      bx                          
  {092EC}  and      byte ptr [di + 0x49], cl    
  {092EF}  dec      di                          
  {092F0}  inc      sp                          
  {092F1}  dec      di                          
  {092F2}  push     di                          
  {092F3}  pop      cx                          
  {092F4}  adc      ax, 0x4f50                  
  {092F7}  dec      sp                          
  {092F8}  dec      di                          
  {092F9}  inc      sp                          
  {092FA}  dec      si                          
  {092FB}  dec      cx                          
  {092FC}  inc      bp                          
  {092FD}  sub      ax, 0x4c55                  
  {09300}  dec      cx                          
  {09301}  inc      bx                          
  {09302}  inc      cx                          
  {09303}  and      byte ptr [bp + di + 0x49], al
  {09306}  inc      bp                          
  {09307}  dec      bp                          
  {09308}  dec      si                          
  {09309}  inc      cx                          
  {0930A}  add      ax, 0x494c                  
  {0930D}  push     bx                          
  {0930E}  push     sp                          
  {0930F}  inc      cx                          
  {09310}  adc      word ptr [si + 0x52], ax    
  {09313}  dec      cx                          
  {09314}  dec      si                          
  {09315}  dec      bx                          
  {09316}  and      byte ptr [bx + si], ah      
  {09318}  and      byte ptr [bx + si], ah      
  {0931A}  and      byte ptr [bx + si], ah      
  {0931C}  and      byte ptr [bx + si], ah      
  {0931E}  inc      bx                          
  {0931F}  inc      bp                          
  {09320}  dec      si                          
  {09321}  inc      cx                          
  {09322}  adc      cl, byte ptr [bx + 0x52]    
  {09325}  inc      cx                          
  {09326}  dec      sp                          
  {09327}  and      byte ptr [si + 0x52], al    
  {0932A}  dec      cx                          
  {0932B}  dec      si                          
  {0932C}  dec      bx                          
  {0932D}  and      byte ptr [bx + si], ah      
  {0932F}  and      byte ptr [bx + si], ah      
  {09331}  and      byte ptr [bx + di], dh      
  {09333}  xor      si, word ptr [bx + si]      
  {09335}  adc      cl, byte ptr [bx + 0x4e]    
  {09338}  inc      cx                          
  {09339}  dec      si                          
  {0933A}  dec      cx                          
  {0933B}  push     bx                          
  {0933C}  dec      di                          
  {0933D}  inc      si                          
  {0933E}  push     sp                          
  {0933F}  and      byte ptr [bx + si], ah      
  {09341}  and      byte ptr [bx + si], ah      
  {09343}  and      byte ptr [bx + si], ah      
  {09345}  xor      word ptr [bx + si], di      
  {09347}  xor      byte ptr [bp + si], dl      
  {09349}  push     ax                          
  {0934A}  inc      bp                          
  {0934B}  inc      sp                          
  {0934C}  inc      cx                          
  {0934D}  dec      sp                          
  {0934E}  push     bx                          
  {09350}  push     ax                          
  {09351}  push     dx                          
  {09352}  pop      dx                          
  {09353}  inc      bp                          
  {09354}  inc      di                          
  {09355}  dec      sp                          
  {09356}  dec      di                          
  {09357}  and      byte ptr [bp + si], dh      
  {09359}  xor      dh, byte ptr [bx + si]      
  {0935B}  or       bx, word ptr [bp + si + 0x41]
  {0935E}  inc      dx                          
  {0935F}  dec      cx                          
  {09360}  dec      dx                          
  {09361}  and      byte ptr [bx + si + 0x45], dl
  {09364}  inc      sp                          
  {09365}  inc      cx                          
  {09366}  dec      sp                          
  {09367}  or       bl, byte ptr [bp + si + 0x41]
  {0936A}  inc      dx                          
  {0936B}  dec      cx                          
  {0936C}  dec      dx                          
  {0936D}  and      byte ptr [bx + si + 0x41], dl
  {09370}  push     dx                          
  {09371}  inc      cx                          
  {09372}  or       al, 0x5a                    
  {09374}  inc      cx                          
  {09375}  inc      dx                          
  {09376}  dec      cx                          
  {09377}  dec      dx                          
  {09378}  and      byte ptr [di + 0x41], cl    
  {0937B}  inc      bx                          
  {0937C}  dec      cx                          
  {0937D}  inc      bp                          
  {0937E}  dec      bx                          
  {0937F}  or       cl, byte ptr [di + 0x41]    
  {09382}  dec      bp                          
  {09383}  and      byte ptr [bx + di], dh      
  {09385}  cmp      byte ptr [bx + si], ah      
  {09387}  dec      sp                          
  {09388}  inc      cx                          
  {09389}  push     sp                          
  {0938A}  sub      cx, word ptr [bx + di + 0x20]
  {0938D}  inc      bx                          
  {0938E}  dec      di                          
  {0938F}  and      byte ptr [bp + si + 0x20], bl
  {09392}  push     sp                          
  {09393}  inc      bp                          
  {09394}  inc      di                          
  {09395}  dec      di                          
  {09396}  and      byte ptr [bx], bh           
  {09398}  aas                                  
  {09399}  aas                                  
  {0939A}  and      byte ptr [bx + di + 0x20], al
  {0939D}  dec      dx                          
  {0939E}  inc      cx                          
  {0939F}  and      byte ptr [di + 0x41], cl    
  {093A2}  dec      bp                          
  {093A3}  and      byte ptr [bx + di], dh      
  {093A5}  xor      byte ptr [bx + si], dh      
  {093A7}  and      byte ptr [si + 0x41], cl    
  {093AA}  push     sp                          
  {093AB}  and      byte ptr [bx + di + 0x20], cl
  {093AE}  pop      dx                          
  {093AF}  pop      cx                          
  {093B0}  dec      dx                          
  {093B1}  inc      bp                          
  {093B2}  and      byte ptr [bx + di], ah      
  {093B4}  and      word ptr [bx + di], sp      
  {093B6}  inc      ax                          
  {093B7}  pop      dx                          
  {093B8}  dec      si                          
  {093B9}  inc      cx                          
  {093BA}  dec      sp                          
  {093BB}  inc      cx                          
  {093BC}  pop      dx                          
  {093BD}  dec      sp                          
  {093BE}  inc      bp                          
  {093BF}  push     bx                          
  {093C0}  and      byte ptr [bp + di + 0x49], dl
  {093C3}  inc      bp                          
  {093C4}  and      byte ptr [bx + 0x53], dl    
  {093C7}  push     dx                          
  {093C8}  dec      di                          
  {093C9}  inc      sp                          
  {093CA}  and      byte ptr [bp + si + 0x4c], al
  {093CD}  push     bp                          
  {093CE}  push     bx                          
  {093CF}  pop      dx                          
  {093D0}  inc      bx                          
  {093D1}  pop      dx                          
  {093D2}  push     bp                          
  {093D3}  and      byte ptr [si], ch           
  {093D5}  and      byte ptr [bx + 0x4f], dl    
  {093D8}  dec      bx                          
  {093D9}  dec      di                          
  {093DA}  dec      sp                          
  {093DB}  dec      di                          
  {093DC}  and      byte ptr [bp + di + 0x49], al
  {093DF}  inc      bp                          
  {093E0}  inc      dx                          
  {093E1}  dec      cx                          
  {093E2}  inc      bp                          
  {093E3}  and      byte ptr [si + 0x41], dl    
  {093E6}  dec      dx                          
  {093E7}  inc      bp                          
  {093E8}  dec      bp                          
  {093E9}  dec      si                          
  {093EA}  dec      cx                          
  {093EB}  inc      bx                          
  {093EC}  pop      dx                          
  {093ED}  inc      bp                          
  {093EE}  and      byte ptr [bp + si + 0x4f], dl
  {093F1}  push     bx                          
  {093F2}  dec      sp                          
  {093F3}  dec      cx                          
  {093F4}  dec      si                          
  {093F5}  pop      cx                          
  {093F6}  and      byte ptr [bx + di], bh      
  {093F8}  dec      bp                          
  {093F9}  push     bp                          
  {093FA}  push     bx                          
  {093FB}  dec      cx                          
  {093FC}  push     bx                          
  {093FD}  pop      dx                          
  {093FE}  and      byte ptr [bp + si + 0x41], al
  {09401}  push     dx                          
  {09402}  inc      sp                          
  {09403}  pop      dx                          
  {09404}  dec      di                          
  {09405}  and      byte ptr [di + 0x57], dl    
  {09408}  inc      cx                          
  {09409}  pop      dx                          
  {0940A}  inc      cx                          
  {0940B}  inc      bx                          
  {0940C}  sub      al, 0x54                    
  {0940E}  push     bp                          
  {0940F}  and      byte ptr [bp + 0x41], cl    
  {09412}  push     di                          
  {09413}  inc      bp                          
  {09414}  push     sp                          
  {09415}  and      byte ptr [bp + di + 0x54], dl
  {09418}  dec      di                          
  {09419}  dec      bx                          
  {0941A}  push     dx                          
  {0941B}  dec      di                          
  {0941C}  push     sp                          
  {0941D}  dec      bx                          
  {0941E}  inc      cx                          
  {0941F}  and      byte ptr [di + 0x4f], cl    
  {09422}  pop      dx                          
  {09423}  inc      bp                          
  {09424}  and      byte ptr [bp + si + 0x59], al
  {09427}  inc      bx                          
  {09428}  and      byte ptr [bp + si + 0x41], bl
  {0942B}  inc      dx                          
  {0942C}  dec      di                          
  {0942D}  dec      dx                          
  {0942E}  inc      bx                          
  {0942F}  pop      dx                          
  {09430}  inc      cx                          
  {09431}  adc      byte ptr [bx + si + 0x4f], dl
  {09434}  dec      sp                          
  {09435}  dec      si                          
  {09436}  dec      di                          
  {09437}  inc      bx                          
  {09438}  sub      ax, 0x4c55                  
  {0943B}  inc      bx                          
  {0943D}  dec      cx                          
  {0943E}  inc      bp                          
  {0943F}  dec      bp                          
  {09440}  dec      si                          
  {09441}  inc      cx                          
  {09442}  push     cs                          
  {09443}  push     di                          
  {09444}  push     bx                          
  {09445}  inc      bx                          
  {09446}  dec      ax                          
  {09447}  dec      di                          
  {09448}  inc      sp                          
  {09449}  sub      ax, 0x4c42                  
  {0944C}  push     bp                          
  {0944D}  push     bx                          
  {0944E}  pop      dx                          
  {0944F}  inc      bx                          
  {09450}  pop      dx                          
  {09451}  push     cs                          
  {09452}  pop      dx                          
  {09453}  inc      cx                          
  {09454}  inc      bx                          
  {09455}  dec      ax                          
  {09456}  dec      di                          
  {09457}  inc      sp                          
  {09458}  sub      ax, 0x4c42                  
  {0945B}  push     bp                          
  {0945C}  push     bx                          
  {0945D}  pop      dx                          
  {0945E}  inc      bx                          
  {0945F}  pop      dx                          
  {09460}  adc      byte ptr [bx + si + 0x4f], dl
  {09463}  dec      sp                          
  {09464}  dec      di                          
  {09465}  inc      sp                          
  {09466}  dec      si                          
  {09467}  dec      cx                          
  {09468}  inc      bp                          
  {09469}  sub      ax, 0x4c42                  
  {0946C}  push     bp                          
  {0946D}  push     bx                          
  {0946E}  pop      dx                          
  {0946F}  inc      bx                          
  {09470}  pop      dx                          
  {09471}  and      dl, byte ptr [bx + 0x53]    
  {09474}  pop      dx                          
  {09475}  inc      bp                          
  {09476}  inc      sp                          
  {09477}  dec      sp                          
  {09478}  inc      bp                          
  {09479}  push     bx                          
  {0947A}  and      byte ptr [bx + 0x20], dl    
  {0947D}  inc      di                          
  {0947E}  inc      cx                          
  {0947F}  push     bx                          
  {09480}  pop      dx                          
  {09481}  inc      bx                          
  {09482}  pop      dx                          
  {09483}  and      byte ptr [bp + si + 0x4f], dl
  {09486}  push     bx                          
  {09487}  dec      sp                          
  {09488}  dec      cx                          
  {09489}  dec      si                          
  {0948A}  and      byte ptr [bx + di + 0x20], cl
  {0948D}  dec      bx                          
  {0948E}  push     di                          
  {0948F}  dec      cx                          
  {09490}  inc      cx                          
  {09491}  push     sp                          
  {09492}  dec      di                          
  {09493}  push     di                          
  {09494}  inc      cx                          
  {09495}  dec      si                          
  {09496}  dec      cx                          
  {09497}  inc      bp                          
  {09498}  and      byte ptr [di + 0x41], cl    
  {0949B}  and      byte ptr [bp + di + 0x4f], al
  {0949E}  and      byte ptr [bx + 0x50], cl    
  {094A1}  dec      cx                          
  {094A2}  push     bx                          
  {094A3}  pop      cx                          
  {094A4}  push     di                          
  {094A5}  inc      cx                          
  {094A6}  inc      bx                          
  {094A7}  and      byte ptr [bx + 0x59], dl    
  {094AA}  push     bx                          
  {094AB}  push     sp                          
  {094AC}  inc      cx                          
  {094AD}  push     dx                          
  {094AE}  inc      bx                          
  {094AF}  pop      dx                          
  {094B0}  pop      cx                          
  {094B1}  and      byte ptr [bx + si + 0x4f], dl
  {094B4}  push     di                          
  {094B5}  dec      cx                          
  {094B6}  inc      bp                          
  {094B7}  inc      sp                          
  {094B8}  pop      dx                          
  {094B9}  dec      cx                          
  {094BA}  inc      bp                          
  {094BB}  inc      bx                          
  {094BC}  and      byte ptr [bp + si + 0x45], bl
  {094BF}  and      byte ptr [bp + si + 0x45], cl
  {094C2}  push     bx                          
  {094C3}  push     sp                          
  {094C4}  and      byte ptr [si + 0x55], dl    
  {094C7}  and      byte ptr [bp + si + 0x59], al
  {094CA}  inc      sp                          
  {094CB}  dec      sp                          
  {094CC}  dec      di                          
  {094CD}  and      byte ptr [bp + di + 0x48], al
  {094D0}  push     di                          
  {094D1}  inc      cx                          
  {094D2}  push     bx                          
  {094D3}  push     sp                          
  {094D4}  dec      di                          
  {094D5}  push     di                          
  {094D6}  cmp      dl, byte ptr [bp + di + 0x4c]
  {094D9}  pop      cx                          
  {094DA}  push     bx                          
  {094DB}  pop      dx                          
  {094DC}  pop      cx                          
  {094DD}  push     bx                          
  {094DE}  pop      dx                          
  {094DF}  and      byte ptr [bx + si + 0x4f], dl
  {094E2}  dec      bx                          
  {094E3}  push     dx                          
  {094E4}  pop      dx                          
  {094E5}  pop      cx                          
  {094E6}  push     di                          
  {094E7}  inc      bp                          
  {094E8}  and      byte ptr [bp + di + 0x54], cl
  {094EB}  dec      di                          
  {094EC}  push     dx                          
  {094ED}  inc      cx                          
  {094EE}  and      byte ptr [bx + si + 0x4f], dl
  {094F1}  pop      dx                          
  {094F2}  inc      bp                          
  {094F3}  push     dx                          
  {094F4}  inc      cx                          
  {094F5}  and      byte ptr [bp + si + 0x45], al
  {094F8}  pop      dx                          
  {094F9}  inc      dx                          
  {094FA}  push     dx                          
  {094FB}  dec      di                          
  {094FC}  dec      si                          
  {094FD}  dec      si                          
  {094FE}  pop      cx                          
  {094FF}  and      byte ptr [bp + di + 0x5a], dl
  {09502}  inc      bx                          
  {09503}  pop      dx                          
  {09504}  inc      cx                          
  {09505}  push     di                          
  {09506}  and      byte ptr [0x2e2e], ch       
  {0950A}  and      byte ptr cs:[bx + 0x48], cl 
  {0950E}  pop      cx                          
  {0950F}  inc      sp                          
  {09510}  inc      cx                          
  {09511}  xor      ax, 0x4f57                  
  {09514}  dec      bx                          
  {09515}  dec      di                          
  {09516}  dec      sp                          
  {09517}  dec      di                          
  {09518}  and      byte ptr [si + 0x41], dl    
  {0951B}  dec      bx                          
  {0951C}  and      byte ptr [bp + di + 0x49], al
  {0951F}  inc      bp                          
  {09520}  dec      bp                          
  {09521}  dec      si                          
  {09522}  dec      di                          
  {09523}  sub      al, 0x5a                    
  {09525}  inc      bp                          
  {09526}  and      byte ptr [bx + 0x44], al    
  {09529}  pop      cx                          
  {0952A}  inc      dx                          
  {0952B}  pop      cx                          
  {0952C}  and      byte ptr [bp + 0x49], cl    
  {0952F}  inc      bp                          
  {09530}  and      byte ptr [bp + si + 0x41], cl
  {09533}  and      byte ptr [bp + si + 0x55], cl
  {09536}  pop      dx                          
  {09537}  and      byte ptr [si + 0x41], al    
  {0953A}  push     di                          
  {0953B}  dec      si                          
  {0953C}  dec      di                          
  {0953D}  and      byte ptr [bp + si + 0x59], al
  {09540}  push     bx                          
  {09541}  and      byte ptr [bp + si + 0x47], bl
  {09544}  dec      cx                          
  {09545}  dec      si                          
  {09546}  inc      cx                          
  {09547}  inc      bx                          
  {09549}  dec      ax                          
  {0954A}  dec      di                          
  {0954B}  inc      bx                          
  {0954C}  and      byte ptr [si + 0x4f], dl    
  {0954F}  and      byte ptr [di + 0x41], cl    
  {09552}  dec      sp                          
  {09553}  dec      di                          
  {09554}  and      byte ptr [bx + si + 0x52], dl
  {09557}  inc      cx                          
  {09558}  push     di                          
  {09559}  inc      sp                          
  {0955A}  dec      di                          
  {0955B}  push     ax                          
  {0955C}  dec      di                          
  {0955D}  inc      sp                          
  {0955E}  dec      di                          
  {0955F}  inc      dx                          
  {09560}  dec      si                          
  {09561}  inc      bp                          
  {09562}  and      byte ptr [si + 0x55], dl    
  {09565}  push     sp                          
  {09566}  inc      cx                          
  {09567}  dec      dx                          
  {09568}  and      byte ptr [bp + si + 0x45], cl
  {0956B}  push     bx                          
  {0956C}  push     sp                          
  {0956D}  and      byte ptr [bp + si + 0x45], cl
  {09570}  push     bx                          
  {09571}  pop      dx                          
  {09572}  inc      bx                          
  {09573}  pop      dx                          
  {09574}  inc      bp                          
  {09575}  and      byte ptr [bp + di + 0x49], al
  {09578}  inc      bp                          
  {09579}  dec      bp                          
  {0957A}  dec      si                          
  {0957B}  dec      cx                          
  {0957C}  inc      bp                          
  {0957D}  dec      dx                          
  {0957E}  aas                                  
  {0957F}  push     ax                          
  {09580}  dec      di                          
  {09581}  dec      si                          
  {09582}  inc      cx                          
  {09583}  inc      sp                          
  {09584}  push     sp                          
  {09585}  dec      di                          
  {09586}  and      byte ptr [bx + 0x20], dl    
  {09589}  dec      si                          
  {0958A}  dec      cx                          
  {0958B}  inc      bp                          
  {0958C}  dec      bx                          
  {0958D}  push     sp                          
  {0958E}  dec      di                          
  {0958F}  push     dx                          
  {09590}  pop      cx                          
  {09591}  inc      bx                          
  {09592}  dec      ax                          
  {09593}  and      byte ptr [di + 0x49], cl    
  {09596}  inc      bp                          
  {09597}  dec      dx                          
  {09598}  push     bx                          
  {09599}  inc      bx                          
  {0959A}  inc      cx                          
  {0959B}  inc      bx                          
  {0959C}  dec      ax                          
  {0959D}  and      byte ptr [bp + si + 0x4e], bl
  {095A0}  inc      cx                          
  {095A1}  dec      dx                          
  {095A2}  inc      sp                          
  {095A3}  push     bp                          
  {095A4}  dec      dx                          
  {095A5}  inc      bp                          
  {095A6}  and      byte ptr [bp + di + 0x49], dl
  {095A9}  inc      bp                          
  {095AA}  and      byte ptr [bp + si + 0x4c], al
  {095AD}  dec      di                          
  {095AE}  push     sp                          
  {095AF}  dec      di                          
  {095B0}  and      byte ptr [bx + di + 0x20], cl
  {095B3}  dec      cx                          
  {095B4}  dec      si                          
  {095B5}  dec      si                          
  {095B6}  inc      bp                          
  {095B7}  and      byte ptr [bp + si + 0x5a], al
  {095BA}  inc      sp                          
  {095BB}  push     bp                          
  {095BC}  push     dx                          
  {095BD}  pop      cx                          
  {095BE}  xor      al, 0x4e                    
  {095C0}  inc      cx                          
  {095C1}  and      byte ptr [bp + di + 0x52], dl
  {095C4}  dec      di                          
  {095C5}  inc      sp                          
  {095C6}  dec      bx                          
  {095C7}  push     bp                          
  {095C8}  and      byte ptr [bp + si + 0x4e], bl
  {095CB}  inc      cx                          
  {095CC}  dec      dx                          
  {095CD}  inc      sp                          
  {095CE}  push     bp                          
  {095CF}  dec      dx                          
  {095D0}  inc      bp                          
  {095D1}  and      byte ptr [bp + di + 0x49], dl
  {095D4}  inc      bp                          
  {095D5}  and      byte ptr [bp + di + 0x54], dl
  {095D8}  push     bp                          
  {095D9}  inc      sp                          
  {095DA}  dec      si                          
  {095DB}  dec      cx                          
  {095DC}  inc      cx                          
  {095DD}  and      byte ptr [bx + di + 0x20], cl
  {095E0}  dec      bp                          
  {095E1}  inc      cx                          
  {095E2}  dec      sp                          
  {095E3}  dec      di                          
  {095E4}  and      byte ptr [bp + di + 0x5a], al
  {095E7}  pop      cx                          
  {095E8}  push     sp                          
  {095E9}  inc      bp                          
  {095EA}  dec      sp                          
  {095EB}  dec      si                          
  {095EC}  pop      cx                          
  {095ED}  and      byte ptr [bp + 0x41], cl    
  {095F0}  push     ax                          
  {095F1}  dec      cx                          
  {095F2}  push     bx                          
  {095F3}  push     cs                          
  {095F4}  push     ax                          
  {095F5}  dec      di                          
  {095F6}  dec      sp                          
  {095F7}  dec      si                          
  {095F8}  dec      di                          
  {095F9}  inc      bx                          
  {095FA}  sub      ax, 0x4c42                  
  {095FD}  push     bp                          
  {095FE}  push     bx                          
  {095FF}  pop      dx                          
  {09600}  inc      bx                          
  {09601}  pop      dx                          
  {09602}  or       dx, word ptr [bx + si + 0x41]
  {09605}  push     sp                          
  {09606}  push     dx                          
  {09607}  pop      dx                          
  {09608}  and      byte ptr [bp + 0x41], cl    
  {0960B}  push     ax                          
  {0960C}  dec      cx                          
  {0960D}  push     bx                          
  {0960E}  cmp      dl, byte ptr [bx + si + 0x49]
  {09611}  push     bx                          
  {09612}  pop      dx                          
  {09613}  inc      bp                          
  {09614}  and      byte ptr [si + 0x55], dl    
  {09617}  push     sp                          
  {09618}  inc      cx                          
  {09619}  dec      dx                          
  {0961A}  and      byte ptr [bp + si], bh      
  {0961C}  and      byte ptr [bp + si], al      
  {0961E}  inc      cx                          
  {0961F}  add      dl, byte ptr [bp + si + 0x5a]
  {09622}  pop      cx                          
  {09623}  add      ah, byte ptr [bx + si]      
  {09625}  inc      sp                          
  {09626}  add      ah, byte ptr [bx + si]      
  {09628}  push     bx                          
  {09629}  add      dl, byte ptr [di + 0x44]    
  {0962C}  dec      si                          
  {0962D}  add      ah, byte ptr [bx + si]      
  {0962F}  sub      byte ptr [di + 0x4f], cl    
  {09632}  push     di                          
  {09633}  dec      cx                          
  {09634}  dec      sp                          
  {09635}  inc      bp                          
  {09636}  dec      bp                          
  {09637}  and      byte ptr [bp + si + 0x45], bl
  {0963A}  and      byte ptr [di + 0x41], cl    
  {0963D}  dec      sp                          
  {0963E}  dec      di                          
  {0963F}  and      byte ptr [bp + di + 0x5a], al
  {09642}  pop      cx                          
  {09643}  push     sp                          
  {09644}  inc      bp                          
  {09645}  dec      sp                          
  {09646}  dec      si                          
  {09647}  pop      cx                          
  {09648}  sub      word ptr [di], cx           
  {0964A}  push     ax                          
  {0964B}  inc      cx                          
  {0964C}  push     sp                          
  {0964D}  push     dx                          
  {0964E}  pop      dx                          
  {0964F}  and      byte ptr [bp + di + 0x54], dl
  {09652}  push     bp                          
  {09653}  inc      sp                          
  {09654}  dec      si                          
  {09655}  dec      cx                          
  {09656}  inc      cx                          
  {09657}  xor      bl, byte ptr [bp + si + 0x41]
  {0965A}  inc      di                          
  {0965B}  dec      sp                          
  {0965C}  inc      cx                          
  {0965D}  inc      sp                          
  {0965E}  inc      cx                          
  {0965F}  push     bx                          
  {09660}  pop      dx                          
  {09661}  and      byte ptr [si + 0x4f], al    
  {09664}  and      byte ptr [bp + di + 0x52], dl
  {09667}  dec      di                          
  {09668}  inc      sp                          
  {09669}  dec      bx                          
  {0966A}  inc      cx                          
  {0966B}  and      byte ptr [bp + di + 0x54], dl
  {0966E}  push     bp                          
  {0966F}  inc      sp                          
  {09670}  dec      si                          
  {09671}  dec      cx                          
  {09672}  sub      al, 0x43                    
  {09674}  dec      di                          
  {09675}  push     bx                          
  {09676}  and      byte ptr [si + 0x41], dl    
  {09679}  dec      bp                          
  {0967A}  and      byte ptr [bp + si + 0x45], cl
  {0967D}  push     bx                          
  {0967E}  push     sp                          
  {0967F}  sub      al, 0x57                    
  {09681}  pop      cx                          
  {09682}  inc      bx                          
  {09683}  dec      cx                          
  {09684}  movsb    byte ptr es:[di], byte ptr [si]
  {09685}  inc      di                          
  {09686}  inc      cx                          
  {09687}  push     bx                          
  {09688}  pop      dx                          
  {09689}  and      byte ptr [bx], al           
  {0968B}  and      byte ptr [di + 0x4f], cl    
  {0968E}  dec      si                          
  {0968F}  inc      bp                          
  {09690}  push     sp                          
  {09691}  and      word ptr [0x414a], si       
  {09695}  dec      bx                          
  {09696}  and      byte ptr [bp + di + 0x4d], dl
  {09699}  dec      cx                          
  {0969A}  inc      bp                          
  {0969B}  push     bx                          
  {0969C}  pop      dx                          
  {0969D}  and      byte ptr [bx + si + 0x4f], dl
  {096A0}  inc      sp                          
  {096A1}  inc      dx                          
  {096A2}  dec      cx                          
  {096A3}  inc      bp                          
  {096A4}  push     dx                          
  {096A5}  inc      cx                          
  {096A6}  inc      bx                          
  {096A7}  and      byte ptr [di + 0x4f], cl    
  {096AA}  dec      dx                          
  {096AB}  inc      bp                          
  {096AC}  and      byte ptr [bp + di + 0x57], dl
  {096AF}  dec      cx                          
  {096B0}  inc      bp                          
  {096B1}  push     sp                          
  {096B2}  dec      di                          
  {096B3}  push     bx                          
  {096B4}  inc      bx                          
  {096B5}  dec      cx                          
  {096B6}  and      byte ptr [si], ch           
  {096B8}  and      byte ptr [bx + 0x49], al    
  {096BB}  dec      si                          
  {096BC}  and      byte ptr [bp + di + 0x48], al
  {096BF}  inc      cx                          
  {096C0}  dec      bp                          
  {096C1}  dec      cx                          
  {096C2}  inc      bp                          
  {096C3}  and      byte ptr [si], ch           
  {096C5}  and      byte ptr [bx + 0x49], al    
  {096C8}  dec      si                          
  {096C9}  sbb      cl, byte ptr [bx + 0x44]    
  {096CC}  inc      sp                          
  {096CD}  inc      cx                          
  {096CE}  push     di                          
  {096CF}  inc      cx                          
  {096D0}  dec      dx                          
  {096D1}  and      byte ptr [di + 0x4f], cl    
  {096D4}  dec      dx                          
  {096D5}  inc      bp                          
  {096D6}  and      byte ptr [bx + si + 0x49], dl
  {096D9}  inc      bp                          
  {096DA}  dec      si                          
  {096DB}  dec      cx                          
  {096DC}  inc      cx                          
  {096DD}  inc      sp                          
  {096DE}  pop      dx                          
  {096DF}  inc      bp                          
  {096E0}  and      byte ptr [bx + di], ah      
  {096E2}  and      word ptr [bx + di], sp      
  {096E4}  xor      ax, 0x5250                  
  {096E7}  pop      dx                          
  {096E8}  inc      bp                          
  {096E9}  inc      sp                          
  {096EA}  pop      dx                          
  {096EB}  dec      cx                          
  {096EC}  inc      bp                          
  {096ED}  push     dx                          
  {096EE}  inc      cx                          
  {096EF}  push     bx                          
  {096F0}  pop      dx                          
  {096F1}  and      byte ptr [bp + di + 0x49], dl
  {096F4}  inc      bp                          
  {096F5}  and      byte ptr [bx + si + 0x52], dl
  {096F8}  pop      dx                          
  {096F9}  inc      bp                          
  {096FA}  pop      dx                          
  {096FB}  and      byte ptr [bp + di + 0x41], al
  {096FE}  dec      sp                          
  {096FF}  pop      cx                          
  {09700}  and      byte ptr [si + 0x45], dl    
  {09703}  dec      si                          
  {09704}  and      byte ptr [bp + di + 0x59], dl
  {09707}  inc      si                          
  {09708}  and      byte ptr [bx + di + 0x20], cl
  {0970B}  dec      si                          
  {0970C}  inc      cx                          
  {0970D}  dec      dx                          
  {0970E}  inc      bx                          
  {0970F}  dec      ax                          
  {09710}  inc      bp                          
  {09711}  push     sp                          
  {09712}  dec      si                          
  {09713}  dec      cx                          
  {09714}  inc      bp                          
  {09715}  dec      dx                          
  {09716}  and      byte ptr [bp + si + 0x59], al
  {09719}  push     bx                          
  {0971A}  push     sp                          
  {0971C}  inc      bp                          
  {0971D}  push     dx                          
  {0971E}  inc      cx                          
  {0971F}  pop      dx                          
  {09720}  and      byte ptr [bx + si + 0x4f], dl
  {09723}  push     dx                          
  {09724}  pop      dx                          
  {09725}  pop      cx                          
  {09726}  inc      bx                          
  {09727}  pop      dx                          
  {09728}  pop      cx                          
  {09729}  popf                                 
  {0972A}  and      byte ptr [bp + di + 0x4f], cl
  {0972D}  push     bx                          
  {0972E}  dec      cx                          
  {0972F}  inc      cx                          
  {09730}  push     dx                          
  {09731}  dec      bx                          
  {09732}  dec      cx                          
  {09733}  and      byte ptr [bx + 0x44], cl    
  {09736}  and      byte ptr [bp + di + 0x57], dl
  {09739}  inc      bp                          
  {0973A}  inc      di                          
  {0973B}  dec      di                          
  {0973C}  and      byte ptr [bp + di + 0x4f], cl
  {0973F}  dec      sp                          
  {09740}  inc      bp                          
  {09741}  inc      di                          
  {09742}  dec      cx                          
  {09743}  and      byte ptr [si + 0x4f], dl    
  {09746}  dec      bp                          
  {09747}  dec      bx                          
  {09748}  inc      cx                          
  {09749}  inc      sp                          
  {0974A}  push     di                          
  {0974B}  and      byte ptr [si + 0x45], dl    
  {0974E}  dec      dx                          
  {0974F}  and      byte ptr [bp + di + 0x4f], cl
  {09752}  dec      bp                          
  {09753}  dec      si                          
  {09754}  inc      cx                          
  {09755}  inc      bx                          
  {09756}  dec      cx                          
  {09757}  inc      bp                          
  {09758}  and      byte ptr [bp + si + 0x45], cl
  {0975B}  push     bx                          
  {0975C}  push     sp                          
  {0975D}  and      byte ptr [bp + si + 0x4e], bl
  {09760}  inc      cx                          
  {09761}  inc      bx                          
  {09762}  pop      dx                          
  {09763}  dec      si                          
  {09764}  dec      cx                          
  {09765}  inc      bp                          
  {09766}  and      byte ptr [bp + si + 0x41], cl
  {09769}  push     bx                          
  {0976A}  dec      si                          
  {0976B}  dec      cx                          
  {0976C}  inc      bp                          
  {0976D}  dec      dx                          
  {0976E}  and      byte ptr [bx + di + 0x20], al
  {09771}  push     sp                          
  {09772}  dec      di                          
  {09773}  and      byte ptr [si + 0x4c], al    
  {09776}  inc      cx                          
  {09777}  push     sp                          
  {09778}  inc      bp                          
  {09779}  inc      di                          
  {0977A}  dec      di                          
  {0977B}  and      byte ptr [bp + si + 0x45], bl
  {0977E}  and      byte ptr [bp + 0x41], cl    
  {09781}  push     ax                          
  {09782}  push     dx                          
  {09783}  dec      di                          
  {09784}  dec      bp                          
  {09785}  dec      cx                          
  {09786}  inc      bp                          
  {09787}  dec      si                          
  {09788}  dec      cx                          
  {09789}  dec      di                          
  {0978A}  push     di                          
  {0978B}  inc      cx                          
  {0978C}  dec      si                          
  {0978D}  inc      bp                          
  {0978E}  daa                                  
  {0978F}  dec      cx                          
  {09790}  and      byte ptr [bp + si + 0x4d], bl
  {09793}  push     bp                          
  {09794}  push     sp                          
  {09795}  dec      di                          
  {09796}  push     di                          
  {09797}  inc      cx                          
  {09798}  dec      si                          
  {09799}  inc      bp                          
  {0979A}  and      byte ptr [bp + si + 0x4f], dl
  {0979D}  push     bx                          
  {0979E}  dec      sp                          
  {0979F}  dec      cx                          
  {097A0}  dec      si                          
  {097A1}  pop      cx                          
  {097A2}  and      byte ptr [bx + di + 0x44], cl
  {097A5}  movsb    byte ptr es:[di], byte ptr [si]
  {097A6}  and      byte ptr [bx + 0x20], dl    
  {097A9}  push     sp                          
  {097AA}  push     di                          
  {097AB}  pop      cx                          
  {097AC}  dec      bp                          
  {097AD}  and      byte ptr [bp + di + 0x49], cl
  {097B0}  inc      bp                          
  {097B1}  push     dx                          
  {097B2}  push     bp                          
  {097B3}  dec      si                          
  {097B4}  dec      bx                          
  {097B5}  push     bp                          
  {097B6}  inc      dx                          
  {097B7}  push     sp                          
  {097B8}  dec      di                          
  {097B9}  and      byte ptr [bp + di + 0x49], al
  {097BC}  inc      bp                          
  {097BD}  dec      bx                          
  {097BE}  inc      cx                          
  {097BF}  push     di                          
  {097C0}  inc      bp                          
  {097C1}  and      byte ptr [bp + si + 0x45], bl
  {097C4}  and      byte ptr [bx + 0x43], dl    
  {097C7}  pop      dx                          
  {097C8}  inc      bp                          
  {097C9}  push     bx                          
  {097CA}  dec      si                          
  {097CB}  dec      cx                          
  {097CC}  inc      bp                          
  {097CD}  dec      dx                          
  {097CE}  and      byte ptr [bp + 0x49], cl    
  {097D1}  inc      bp                          
  {097D2}  and      byte ptr [bp + si + 0x41], bl
  {097D5}  push     bp                          
  {097D6}  push     di                          
  {097D7}  inc      cx                          
  {097D8}  pop      dx                          
  {097D9}  pop      cx                          
  {097DA}  dec      sp                          
  {097DB}  inc      bp                          
  {097DC}  push     bx                          
  {097DD}  and      byte ptr [si + 0x59], dl    
  {097E0}  inc      bx                          
  {097E1}  dec      ax                          
  {097E2}  and      byte ptr [bp + di + 0x52], cl
  {097E5}  inc      cx                          
  {097E6}  push     dx                          
  {097E7}  pop      dx                          
  {097E8}  inc      cx                          
  {097E9}  dec      bx                          
  {097EA}  dec      di                          
  {097EB}  push     di                          
  {097EC}  and      byte ptr [bx + si + 0x52], dl
  {097EF}  pop      dx                          
  {097F0}  inc      bp                          
  {097F1}  inc      sp                          
  {097F2}  pop      dx                          
  {097F3}  dec      cx                          
  {097F4}  inc      bp                          
  {097F5}  push     dx                          
  {097F6}  inc      cx                          
  {097F7}  push     bx                          
  {097F8}  pop      dx                          
  {097F9}  push     bx                          
  {097FB}  dec      cx                          
  {097FC}  inc      bp                          
  {097FD}  and      byte ptr [bx + si + 0x52], dl
  {09800}  pop      dx                          
  {09801}  inc      bp                          
  {09802}  pop      dx                          
  {09803}  and      byte ptr [bx + di + 0x43], cl
  {09806}  dec      ax                          
  {09807}  and      byte ptr [bx + 0x41], al    
  {0980A}  push     bx                          
  {0980B}  pop      dx                          
  {0980C}  inc      bx                          
  {0980D}  pop      dx                          
  {0980E}  and      byte ptr [bx + 0x59], dl    
  {09811}  inc      di                          
  {09812}  dec      sp                          
  {09813}  inc      cx                          
  {09814}  inc      sp                          
  {09815}  inc      cx                          
  {09816}  and      byte ptr [si + 0x4f], dl    
  {09819}  and      byte ptr [bp + 0x41], cl    
  {0981C}  and      byte ptr [bp + 0x49], cl    
  {0981F}  inc      bp                          
  {09820}  pop      dx                          
  {09821}  inc      dx                          
  {09822}  pop      cx                          
  {09823}  push     sp                          
  {09824}  and      byte ptr [di + 0x49], cl    
  {09827}  dec      sp                          
  {09828}  inc      cx                          
  {09829}  and      byte ptr [bp + di + 0x52], cl
  {0982C}  inc      cx                          
  {0982D}  dec      cx                          
  {0982E}  dec      si                          
  {0982F}  inc      bp                          
  {09830}  dec      ax                          
  {09831}  inc      sp                          
  {09832}  inc      cx                          
  {09833}  dec      sp                          
  {09834}  inc      bp                          
  {09835}  push     bx                          
  {09836}  and      byte ptr [bp + 0x41], cl    
  {09839}  and      byte ptr [bp + si + 0x41], bl
  {0983C}  inc      bx                          
  {0983D}  dec      ax                          
  {0983E}  dec      di                          
  {0983F}  inc      sp                          
  {09840}  and      byte ptr [bx + 0x49], dl    
  {09843}  inc      sp                          
  {09844}  pop      dx                          
  {09845}  dec      cx                          
  {09846}  push     bx                          
  {09847}  pop      dx                          
  {09848}  and      byte ptr [bp + si + 0x41], cl
  {0984B}  dec      bx                          
  {0984C}  dec      cx                          
  {0984D}  inc      bp                          
  {0984E}  push     bx                          
  {0984F}  and      byte ptr [bx + si + 0x4f], dl
  {09852}  inc      sp                          
  {09853}  inc      bp                          
  {09854}  dec      dx                          
  {09855}  push     dx                          
  {09856}  pop      dx                          
  {09857}  inc      cx                          
  {09858}  dec      si                          
  {09859}  inc      bp                          
  {0985A}  and      byte ptr [bp + si + 0x55], al
  {0985D}  inc      sp                          
  {0985E}  dec      di                          
  {0985F}  push     di                          
  {09860}  dec      sp                          
  {09861}  inc      bp                          
  {09862}  and      byte ptr [si], ch           
  {09864}  and      byte ptr [bx + di + 0x20], al
  {09867}  dec      si                          
  {09868}  inc      cx                          
  {09869}  and      byte ptr [bx + si + 0x4f], dl
  {0986C}  dec      sp                          
  {0986D}  dec      di                          
  {0986E}  inc      sp                          
  {0986F}  dec      si                          
  {09870}  dec      cx                          
  {09871}  inc      bp                          
  {09872}  and      byte ptr [bp + si + 0x52], al
  {09875}  push     dx                          
  {09876}  push     dx                          
  {09877}  push     dx                          
  {09878}  dec      bx                          
  {0987A}  dec      si                          
  {0987B}  inc      cx                          
  {0987C}  and      byte ptr [bx + si + 0x4f], dl
  {0987F}  dec      sp                          
  {09880}  dec      di                          
  {09881}  inc      sp                          
  {09882}  dec      si                          
  {09883}  dec      cx                          
  {09884}  inc      bp                          
  {09885}  and      byte ptr [bp + si + 0x41], cl
  {09888}  dec      bx                          
  {09889}  and      byte ptr [bx + 0x44], al    
  {0988C}  pop      cx                          
  {0988D}  inc      dx                          
  {0988E}  pop      cx                          
  {0988F}  and      byte ptr [bp + di + 0x54], cl
  {09892}  dec      di                          
  {09893}  push     bx                          
  {09894}  and      byte ptr [bp + di + 0x49], dl
  {09897}  inc      bp                          
  {09898}  and      byte ptr [bx + 0x42], cl    
  {0989B}  pop      dx                          
  {0989C}  inc      bp                          
  {0989D}  push     dx                          
  {0989E}  inc      cx                          
  {0989F}  dec      sp                          
  {098A0}  and      byte ptr [si], ch           
  {098A2}  and      byte ptr [bx + di + 0x4c], al
  {098A5}  inc      bp                          
  {098A6}  and      byte ptr [bp + si + 0x41], al
  {098A9}  push     dx                          
  {098AA}  inc      sp                          
  {098AB}  pop      dx                          
  {098AC}  dec      di                          
  {098AD}  and      byte ptr [bx + 0x4c], al    
  {098B0}  dec      di                          
  {098B1}  push     bx                          
  {098B2}  dec      si                          
  {098B3}  dec      di                          
  {098B4}  and      byte ptr [bx + di + 0x20], cl
  {098B7}  dec      si                          
  {098B8}  dec      cx                          
  {098B9}  inc      bp                          
  {098BA}  inc      dx                          
  {098BB}  inc      bp                          
  {098BC}  pop      dx                          
  {098BD}  push     ax                          
  {098BE}  dec      cx                          
  {098BF}  inc      bp                          
  {098C0}  inc      bx                          
  {098C1}  pop      dx                          
  {098C2}  dec      si                          
  {098C3}  dec      cx                          
  {098C4}  inc      bp                          
  {098C5}  push     cs                          
  {098C6}  pop      dx                          
  {098C7}  inc      cx                          
  {098C8}  inc      bx                          
  {098C9}  dec      ax                          
  {098CA}  dec      di                          
  {098CB}  inc      sp                          
  {098CC}  sub      ax, 0x5542                  
  {098CF}  inc      sp                          
  {098D0}  pop      cx                          
  {098D1}  dec      si                          
  {098D2}  inc      bp                          
  {098D3}  dec      bx                          
  {098D4}  sbb      dl, byte ptr [bx + si + 0x4f]
  {098D7}  dec      sp                          
  {098D8}  dec      di                          
  {098D9}  inc      sp                          
  {098DA}  dec      si                          
  {098DB}  dec      cx                          
  {098DC}  inc      bp                          
  {098DD}  sub      ax, 0x4557                  
  {098E0}  dec      dx                          
  {098E1}  push     bx                          
  {098E2}  inc      bx                          
  {098E3}  dec      cx                          
  {098E4}  inc      bp                          
  {098E5}  and      byte ptr [si + 0x4f], al    
  {098E8}  and      byte ptr [bx + 0x52], al    
  {098EB}  dec      di                          
  {098EC}  push     sp                          
  {098ED}  pop      cx                          
  {098EE}  and      byte ptr [bp + di + 0x4d], al
  {098F1}  dec      sp                          
  {098F2}  inc      cx                          
  {098F3}  push     bx                          
  {098F4}  dec      bx                          
  {098F5}  and      byte ptr [si], ch           
  {098F7}  and      byte ptr [di + 0x4c], cl    
  {098FA}  inc      cx                          
  {098FB}  push     bx                          
  {098FC}  dec      bx                          
  {098FD}  and      byte ptr [bp + di + 0x54], cl
  {09900}  dec      di                          
  {09901}  push     bx                          
  {09902}  and      byte ptr [bp + si + 0x5a], dl
  {09905}  inc      bp                          
  {09906}  inc      bx                          
  {09907}  pop      dx                          
  {09908}  pop      cx                          
  {09909}  push     di                          
  {0990A}  dec      cx                          
  {0990B}  push     bx                          
  {0990C}  inc      bx                          
  {0990D}  dec      cx                          
  {0990E}  inc      bp                          
  {0990F}  and      byte ptr [bp + di + 0x49], dl
  {09912}  inc      bp                          
  {09913}  and      byte ptr [bx + 0x42], cl    
  {09916}  pop      dx                          
  {09917}  inc      bp                          
  {09918}  push     dx                          
  {09919}  inc      cx                          
  {0991A}  and      byte ptr [bp + di + 0x5a], al
  {0991D}  pop      cx                          
  {0991E}  and      byte ptr [bp + si + 0x45], cl
  {09921}  push     bx                          
  {09922}  push     sp                          
  {09923}  inc      bp                          
  {09924}  push     bx                          
  {09925}  and      byte ptr [bx + di], dh      
  {09927}  xor      byte ptr [bx + si], dh      
  {09929}  and      ax, 0x5020                  
  {0992C}  inc      bp                          
  {0992D}  push     di                          
  {0992E}  dec      si                          
  {0992F}  pop      cx                          
  {09930}  and      byte ptr [bx + di + 0x5a], cl
  {09933}  dec      cx                          
  {09934}  inc      bx                          
  {09935}  dec      ax                          
  {09936}  inc      bx                          
  {09937}  inc      bp                          
  {09938}  push     bx                          
  {09939}  pop      dx                          
  {0993A}  and      byte ptr [bp + di + 0x49], dl
  {0993D}  inc      bp                          
  {0993E}  and      byte ptr [bp + si + 0x41], bl
  {09941}  inc      di                          
  {09942}  dec      sp                          
  {09943}  inc      bp                          
  {09944}  inc      dx                          
  {09945}  dec      cx                          
  {09946}  inc      bx                          
  {09947}  and      byte ptr [bx + 0x20], dl    
  {0994A}  push     sp                          
  {0994B}  inc      bp                          
  {0994C}  and      byte ptr [bp + 0x49], cl    
  {0994F}  inc      bp                          
  {09950}  inc      dx                          
  {09951}  inc      cx                          
  {09952}  inc      sp                          
  {09953}  inc      cx                          
  {09954}  dec      si                          
  {09955}  inc      bp                          
  {09956}  and      byte ptr [bp + di + 0x5a], al
  {09959}  inc      bp                          
  {0995A}  dec      sp                          
  {0995B}  push     bp                          
  {0995C}  push     bx                          
  {0995D}  inc      bx                          
  {0995E}  dec      cx                          
  {0995F}  inc      bp                          
  {09960}  and      byte ptr [bx + si + 0x49], dl
  {09963}  inc      bp                          
  {09964}  dec      bx                          
  {09965}  dec      cx                          
  {09966}  inc      bp                          
  {09967}  dec      sp                          
  {09968}  dec      si                          
  {09969}  inc      bp                          
  {0996A}  aas                                  
  {0996B}  sub      al, 0x20                    
  {0996D}  dec      bp                          
  {0996E}  dec      di                          
  {0996F}  pop      dx                          
  {09970}  inc      bp                          
  {09971}  and      byte ptr [si + 0x45], cl    
  {09974}  push     ax                          
  {09975}  dec      cx                          
  {09976}  inc      bp                          
  {09977}  dec      dx                          
  {09978}  and      byte ptr [bx + 0x52], dl    
  {0997B}  dec      di                          
  {0997C}  inc      bx                          
  {0997D}  dec      ax                          
  {0997E}  dec      si                          
  {0997F}  dec      di                          
  {09980}  and      byte ptr [bx + si + 0x49], dl
  {09983}  inc      bp                          
  {09984}  dec      bx                          
  {09985}  dec      si                          
  {09986}  dec      cx                          
  {09987}  inc      bp                          
  {09988}  and      byte ptr [bx + 0x4c], dl    
  {0998B}  inc      cx                          
  {0998C}  pop      dx                          
  {0998D}  dec      sp                          
  {0998E}  inc      bp                          
  {0998F}  push     bx                          
  {09990}  and      byte ptr [bx + 0x20], dl    
  {09993}  dec      dx                          
  {09994}  inc      cx                          
  {09995}  dec      bx                          
  {09996}  dec      cx                          
  {09997}  inc      bp                          
  {09998}  push     bx                          
  {09999}  and      byte ptr [si + 0x4f], dl    
  {0999C}  dec      bx                          
  {0999D}  push     bx                          
  {0999E}  pop      cx                          
  {0999F}  inc      bx                          
  {099A0}  pop      dx                          
  {099A1}  dec      si                          
  {099A2}  inc      bp                          
  {099A3}  and      byte ptr [bp + di + 0x55], dl
  {099A6}  inc      dx                          
  {099A7}  push     bx                          
  {099A8}  push     sp                          
  {099A9}  inc      cx                          
  {099AA}  dec      si                          
  {099AB}  inc      bx                          
  {099AC}  dec      dx                          
  {099AD}  inc      bp                          
  {099AE}  and      byte ptr [si], ch           
  {099B0}  inc      cx                          
  {099B1}  inc      cx                          
  {099B2}  inc      cx                          
  {099B3}  sub      al, 0x20                    
  {099B5}  push     sp                          
  {099B6}  dec      di                          
  {099B7}  and      byte ptr [bx + si + 0x41], dl
  {099BA}  push     dx                          
  {099BB}  pop      dx                          
  {099BC}  pop      cx                          
  {099BD}  and      byte ptr [si + 0x52], dl    
  {099C0}  inc      cx                          
  {099C1}  inc      bx                          
  {099C2}  dec      cx                          
  {099C3}  push     bx                          
  {099C4}  pop      dx                          
  {099C5}  and      byte ptr [0x4f50], cl       
  {099C9}  dec      sp                          
  {099CA}  dec      di                          
  {099CB}  inc      sp                          
  {099CC}  dec      si                          
  {099CD}  dec      cx                          
  {099CE}  inc      bp                          
  {099CF}  sub      ax, 0x5247                  
  {099D2}  dec      di                          
  {099D3}  push     sp                          
  {099D4}  inc      cx                          
  {099D5}  sbb      byte ptr [bx + si + 0x4f], dl
  {099D8}  dec      sp                          
  {099D9}  dec      si                          
  {099DA}  dec      di                          
  {099DB}  inc      bx                          
  {099DC}  sub      ax, 0x4f50                  
  {099DF}  inc      sp                          
  {099E0}  inc      bp                          
  {099E1}  dec      dx                          
  {099E2}  push     dx                          
  {099E3}  pop      dx                          
  {099E4}  inc      cx                          
  {099E5}  dec      si                          
  {099E6}  inc      bp                          
  {099E7}  and      byte ptr [bp + di + 0x52], cl
  {099EA}  pop      dx                          
  {099EB}  inc      cx                          
  {099EC}  dec      bx                          
  {099ED}  dec      cx                          
  {099EE}  dec      sp                          
  {099EF}  dec      bp                          
  {099F0}  dec      di                          
  {099F1}  dec      dx                          
  {099F2}  and      byte ptr [bp + si + 0x4f], al
  {099F5}  pop      dx                          
  {099F6}  inc      bp                          
  {099F7}  and      byte ptr [si], ch           
  {099F9}  and      byte ptr [bp + di + 0x4f], al
  {099FC}  pop      dx                          
  {099FD}  and      byte ptr [si + 0x4f], dl    
  {09A00}  and      byte ptr [bp + si + 0x45], cl
  {09A03}  push     bx                          
  {09A04}  push     sp                          
  {09A05}  and      byte ptr [si], ch           
  {09A07}  and      byte ptr [bp + 0x41], cl    
  {09A0A}  and      byte ptr [si + 0x52], dl    
  {09A0D}  dec      di                          
  {09A0E}  dec      si                          
  {09A0F}  dec      cx                          
  {09A10}  inc      bp                          
  {09A11}  and      byte ptr [bp + di + 0x49], dl
  {09A14}  inc      bp                          
  {09A15}  inc      sp                          
  {09A16}  pop      dx                          
  {09A17}  dec      cx                          
  {09A18}  and      byte ptr [bp + si], dh      
  {09A1A}  xor      byte ptr [bx + si], ah      
  {09A1C}  push     dx                          
  {09A1D}  inc      cx                          
  {09A1E}  pop      dx                          
  {09A1F}  pop      cx                          
  {09A20}  and      byte ptr [bx + 0x49], dl    
  {09A23}  inc      bp                          
  {09A24}  dec      bx                          
  {09A25}  push     bx                          
  {09A26}  pop      dx                          
  {09A27}  inc      cx                          
  {09A28}  and      byte ptr [bx + 0x44], cl    
  {09A2B}  and      byte ptr [bp + di + 0x49], al
  {09A2E}  inc      bp                          
  {09A2F}  inc      dx                          
  {09A30}  dec      cx                          
  {09A31}  inc      bp                          
  {09A32}  and      byte ptr [bx + si + 0x4f], dl
  {09A35}  dec      bx                          
  {09A36}  push     dx                          
  {09A37}  pop      dx                          
  {09A38}  pop      cx                          
  {09A39}  push     di                          
  {09A3A}  inc      cx                          
  {09A3B}  inc      dx                          
  {09A3C}  push     di                          
  {09A3D}  dec      di                          
  {09A3E}  dec      bx                          
  {09A3F}  dec      di                          
  {09A40}  dec      sp                          
  {09A41}  and      byte ptr [bp + 0x49], cl    
  {09A44}  inc      bp                          
  {09A45}  dec      dx                          
  {09A46}  and      byte ptr [di + 0x57], dl    
  {09A49}  dec      cx                          
  {09A4A}  dec      dx                          
  {09A4B}  inc      cx                          
  {09A4C}  dec      dx                          
  {09A4D}  inc      cx                          
  {09A4E}  and      byte ptr [bp + di + 0x49], dl
  {09A51}  inc      bp                          
  {09A52}  and      byte ptr [bx + si + 0x52], dl
  {09A55}  inc      cx                          
  {09A56}  inc      bx                          
  {09A57}  dec      di                          
  {09A58}  push     di                          
  {09A59}  dec      cx                          
  {09A5A}  push     sp                          
  {09A5B}  inc      bp                          
  {09A5C}  and      byte ptr [di + 0x4c], cl    
  {09A5F}  inc      bp                          
  {09A60}  inc      bx                          
  {09A61}  pop      dx                          
  {09A62}  inc      bp                          
  {09A63}  and      byte ptr [si + 0x4f], al    
  {09A66}  push     bx                          
  {09A67}  push     sp                          
  {09A68}  inc      cx                          
  {09A69}  push     dx                          
  {09A6A}  inc      bx                          
  {09A6B}  pop      dx                          
  {09A6C}  inc      cx                          
  {09A6D}  dec      dx                          
  {09A6E}  inc      cx                          
  {09A6F}  inc      bx                          
  {09A70}  and      byte ptr [bp + si + 0x45], cl
  {09A73}  dec      dx                          
  {09A74}  and      byte ptr [bp + di + 0x57], dl
  {09A77}  dec      cx                          
  {09A78}  inc      bp                          
  {09A79}  pop      dx                          
  {09A7A}  inc      bp                          
  {09A7B}  inc      di                          
  {09A7C}  dec      di                          
  {09A7D}  and      byte ptr [bp + si + 0x4d], cl
  {09A80}  dec      cx                          
  {09A81}  inc      bp                          
  {09A82}  push     bx                          
  {09A83}  inc      cx                          
  {09A84}  and      byte ptr [si + 0x55], cl    
  {09A87}  inc      sp                          
  {09A88}  pop      dx                          
  {09A89}  dec      bx                          
  {09A8A}  dec      cx                          
  {09A8B}  inc      bp                          
  {09A8C}  inc      di                          
  {09A8D}  dec      di                          
  {09A8E}  and      byte ptr [bx + di], ah      
  {09A90}  and      word ptr [bx + di], sp      
  {09A92}  and      byte ptr [si], ch           
  {09A94}  and      byte ptr [di + 0x57], dl    
  {09A97}  dec      cx                          
  {09A98}  inc      bp                          
  {09A99}  dec      sp                          
  {09A9A}  inc      dx                          
  {09A9B}  dec      cx                          
  {09A9C}  inc      cx                          
  {09A9D}  and      byte ptr [bx + 0x4e], cl    
  {09AA0}  inc      cx                          
  {09AA1}  and      byte ptr [di + 0x4f], cl    
  {09AA4}  pop      dx                          
  {09AA5}  inc      di                          
  {09AA6}  dec      cx                          
  {09AA7}  and      byte ptr [bp + di + 0x54], cl
  {09AAA}  dec      di                          
  {09AAB}  push     dx                          
  {09AAC}  inc      bp                          
  {09AAD}  and      byte ptr [bx + 0x59], dl    
  {09AB0}  push     bx                          
  {09AB1}  push     bx                          
  {09AB2}  pop      cx                          
  {09AB3}  push     bx                          
  {09AB4}  inc      cx                          
  {09AB5}  and      byte ptr [bp + si + 0x41], cl
  {09AB8}  dec      bx                          
  {09AB9}  and      byte ptr [bx + si + 0x59], dl
  {09ABC}  push     bx                          
  {09ABD}  pop      dx                          
  {09ABE}  dec      si                          
  {09ABF}  pop      cx                          
  {09AC0}  and      byte ptr [bx + si + 0x55], dl
  {09AC3}  inc      sp                          
  {09AC4}  inc      sp                          
  {09AC5}  dec      cx                          
  {09AC6}  dec      si                          
  {09AC7}  inc      di                          
  {09AC8}  and      byte ptr [di + 0x57], cl    
  {09ACB}  and      byte ptr [bx + si + 0x45], dl
  {09ACE}  push     di                          
  {09ACF}  dec      si                          
  {09AD0}  pop      cx                          
  {09AD1}  dec      bp                          
  {09AD2}  and      byte ptr [di + 0x4f], cl    
  {09AD5}  dec      bp                          
  {09AD6}  inc      bp                          
  {09AD7}  inc      bx                          
  {09AD8}  dec      cx                          
  {09AD9}  inc      bp                          
  {09ADA}  and      byte ptr [bp + si + 0x41], bl
  {09ADD}  push     bp                          
  {09ADE}  push     di                          
  {09ADF}  inc      cx                          
  {09AE0}  pop      dx                          
  {09AE1}  inc      cx                          
  {09AE2}  and      byte ptr [bp + di + 0x49], al
  {09AE5}  inc      bp                          
  {09AE6}  inc      dx                          
  {09AE7}  dec      cx                          
  {09AE8}  inc      bp                          
  {09AE9}  and      byte ptr [di], ch           
  {09AEB}  and      byte ptr [bx + 0x49], dl    
  {09AEE}  push     sp                          
  {09AEF}  inc      cx                          
  {09AF0}  dec      dx                          
  {09AF1}  and      byte ptr [bx + 0x45], dl    
  {09AF4}  inc      sp                          
  {09AF5}  push     dx                          
  {09AF6}  dec      di                          
  {09AF7}  push     di                          
  {09AF8}  inc      bx                          
  {09AF9}  pop      dx                          
  {09AFA}  inc      bp                          
  {09AFB}  and      byte ptr [bx + si + 0x4f], dl
  {09AFE}  inc      sp                          
  {09AFF}  dec      di                          
  {09B00}  inc      dx                          
  {09B01}  inc      cx                          
  {09B02}  dec      bp                          
  {09B03}  and      byte ptr [bp + di + 0x49], al
  {09B06}  and      byte ptr [bp + di + 0x49], dl
  {09B09}  inc      bp                          
  {09B0A}  aas                                  
  {09B0B}  and      byte ptr [di], ch           
  {09B0D}  and      byte ptr [bx + si], ch      
  {09B0F}  push     sp                          
  {09B10}  inc      cx                          
  {09B11}  dec      bx                          
  {09B12}  sub      al, 0x4e                    
  {09B14}  dec      cx                          
  {09B15}  inc      bp                          
  {09B16}  sub      word ptr [di], cx           
  {09B18}  push     sp                          
  {09B19}  inc      cx                          
  {09B1A}  dec      bx                          
  {09B1B}  and      byte ptr [si + 0x75], ch    
  {09B1E}  bound    sp, dword ptr [bx + si]     
  {09B20}  dec      si                          
  {09B21}  dec      cx                          
  {09B22}  inc      bp                          
  {09B23}  and      byte ptr [0x4e0c], bh       
  {09B27}  dec      di                          
  {09B28}  and      byte ptr [si + 0x4f], dl    
  {09B2B}  and      byte ptr [bx + 0x49], al    
  {09B2E}  dec      si                          
  {09B2F}  and      word ptr [bx + di], sp      
  {09B31}  and      word ptr [si + 0x55], cx    
  {09B34}  inc      si                          
  {09B35}  inc      si                          
  {09B36}  inc      si                          
  {09B37}  sub      al, 0x54                    
  {09B39}  dec      di                          
  {09B3A}  and      byte ptr [bp + si + 0x59], al
  {09B3D}  dec      sp                          
  {09B3E}  inc      cx                          
  {09B3F}  and      byte ptr [bx + si + 0x52], dl
  {09B42}  pop      dx                          
  {09B43}  pop      cx                          
  {09B44}  inc      di                          
  {09B45}  dec      di                          
  {09B46}  inc      sp                          
  {09B47}  inc      cx                          
  {09B48}  sub      al, 0x57                    
  {09B4A}  dec      di                          
  {09B4B}  dec      bx                          
  {09B4C}  dec      di                          
  {09B4D}  dec      sp                          
  {09B4E}  and      byte ptr [bx + 0x52], al    
  {09B51}  dec      di                          
  {09B52}  dec      bp                          
  {09B53}  inc      cx                          
  {09B54}  inc      sp                          
  {09B55}  pop      dx                          
  {09B56}  dec      cx                          
  {09B57}  dec      sp                          
  {09B58}  pop      cx                          
  {09B59}  and      byte ptr [bp + di + 0x49], dl
  {09B5C}  inc      bp                          
  {09B5D}  and      byte ptr [bp + di + 0x45], dl
  {09B60}  push     sp                          
  {09B61}  dec      bx                          
  {09B62}  dec      cx                          
  {09B63}  and      byte ptr [di + 0x4c], cl    
  {09B66}  inc      bp                          
  {09B67}  inc      bx                          
  {09B68}  pop      dx                          
  {09B69}  dec      di                          
  {09B6A}  push     di                          
  {09B6B}  and      byte ptr [di], ch           
  {09B6D}  and      byte ptr [bp + 0x49], cl    
  {09B70}  inc      bp                          
  {09B71}  and      byte ptr [di + 0x49], cl    
  {09B74}  inc      cx                          
  {09B75}  dec      sp                          
  {09B76}  inc      dx                          
  {09B77}  pop      cx                          
  {09B78}  push     bx                          
  {09B79}  and      byte ptr [bp + di + 0x5a], dl
  {09B7C}  inc      cx                          
  {09B7D}  dec      si                          
  {09B7E}  push     bx                          
  {09B7F}  sbb      word ptr [bx + si + 0x4f], dx
  {09B82}  dec      sp                          
  {09B83}  dec      di                          
  {09B84}  inc      sp                          
  {09B85}  dec      si                          
  {09B86}  dec      cx                          
  {09B87}  inc      bp                          
  {09B88}  sub      ax, 0x4557                  
  {09B8B}  dec      dx                          
  {09B8C}  push     bx                          
  {09B8D}  inc      bx                          
  {09B8E}  dec      cx                          
  {09B8F}  inc      bp                          
  {09B90}  and      byte ptr [si + 0x4f], al    
  {09B93}  and      byte ptr [bx + 0x52], al    
  {09B96}  dec      di                          
  {09B97}  push     sp                          
  {09B98}  pop      cx                          
  {09B99}  xor      ax, 0x4f44                  
  {09B9C}  and      byte ptr [si + 0x4f], al    
  {09B9F}  inc      dx                          
  {09BA0}  push     dx                          
  {09BA1}  inc      cx                          
  {09BA2}  and      byte ptr [bx + 0x59], dl    
  {09BA5}  inc      di                          
  {09BA6}  dec      sp                          
  {09BA7}  inc      cx                          
  {09BA8}  inc      sp                          
  {09BA9}  inc      cx                          
  {09BAA}  and      byte ptr [si + 0x4f], dl    
  {09BAD}  and      byte ptr [bp + 0x41], cl    
  {09BB0}  and      byte ptr [bp + si + 0x41], cl
  {09BB3}  dec      bx                          
  {09BB4}  dec      cx                          
  {09BB5}  push     bx                          
  {09BB6}  and      byte ptr [si + 0x4f], al    
  {09BB9}  dec      bp                          
  {09BBA}  and      byte ptr [si], ch           
  {09BBC}  and      byte ptr [bx + 0x45], dl    
  {09BBF}  dec      dx                          
  {09BC0}  inc      sp                          
  {09BC1}  pop      dx                          
  {09BC2}  dec      bp                          
  {09BC3}  pop      cx                          
  {09BC4}  and      byte ptr [si + 0x4f], al    
  {09BC7}  and      byte ptr [bp + di + 0x52], dl
  {09BCA}  dec      di                          
  {09BCB}  inc      sp                          
  {09BCC}  dec      bx                          
  {09BCD}  inc      cx                          
  {09BCE}  and      byte ptr [bp + 0x47], al    
  {09BD1}  dec      di                          
  {09BD2}  inc      sp                          
  {09BD3}  and      byte ptr [si + 0x41], al    
  {09BD6}  dec      bp                          
  {09BD7}  dec      si                          
  {09BD8}  and      byte ptr [si], ch           
  {09BDA}  and      byte ptr [bx + di + 0x20], al
  {09BDD}  dec      si                          
  {09BDE}  dec      cx                          
  {09BDF}  inc      bp                          
  {09BE0}  inc      bx                          
  {09BE1}  dec      ax                          
  {09BE2}  and      byte ptr [di + 0x4e], cl    
  {09BE5}  dec      cx                          
  {09BE6}  inc      bp                          
  {09BE7}  and      byte ptr [di + 0x41], cl    
  {09BEA}  and      byte ptr [di + 0x41], cl    
  {09BED}  push     sp                          
  {09BEE}  inc      bp                          
  {09BEF}  push     bp                          
  {09BF0}  push     bx                          
  {09BF1}  pop      dx                          
  {09BF2}  and      byte ptr [bx + 0x20], dl    
  {09BF5}  push     bx                          
  {09BF6}  push     di                          
  {09BF7}  dec      di                          
  {09BF8}  dec      dx                          
  {09BF9}  inc      bp                          
  {09BFA}  dec      dx                          
  {09BFB}  and      byte ptr [bx + 0x50], cl    
  {09BFE}  dec      cx                          
  {09BFF}  inc      bp                          
  {09C00}  inc      bx                          
  {09C01}  inc      bp                          
  {09C02}  and      byte ptr [si], ch           
  {09C04}  and      byte ptr [si + 0x45], dl    
  {09C07}  and      byte ptr [si + 0x52], al    
  {09C0A}  pop      dx                          
  {09C0B}  push     di                          
  {09C0C}  dec      cx                          
  {09C0D}  and      byte ptr [bp + si + 0x59], bl
  {09C10}  dec      dx                          
  {09C11}  inc      cx                          
  {09C12}  and      byte ptr [bx + di], ah      
  {09C14}  and      word ptr [bx + di], sp      
  {09C16}  dec      ax                          
  {09C17}  inc      sp                          
  {09C18}  push     dx                          
  {09C19}  pop      dx                          
  {09C1A}  push     di                          
  {09C1B}  dec      cx                          
  {09C1C}  and      byte ptr [bx + 0x59], dl    
  {09C1F}  inc      bx                          
  {09C20}  dec      cx                          
  {09C21}  inc      cx                          
  {09C22}  inc      di                          
  {09C23}  inc      cx                          
  {09C24}  dec      dx                          
  {09C25}  inc      cx                          
  {09C26}  and      byte ptr [bp + di + 0x57], dl
  {09C29}  inc      bp                          
  {09C2A}  and      byte ptr [si + 0x52], al    
  {09C2D}  inc      bp                          
  {09C2E}  push     di                          
  {09C2F}  dec      si                          
  {09C30}  dec      cx                          
  {09C31}  inc      cx                          
  {09C32}  dec      si                          
  {09C33}  inc      bp                          
  {09C34}  and      byte ptr [bp + si + 0x45], dl
  {09C37}  inc      bx                          
  {09C38}  inc      bp                          
  {09C39}  and      byte ptr [bx + 0x20], dl    
  {09C3C}  push     sp                          
  {09C3D}  push     di                          
  {09C3E}  pop      cx                          
  {09C3F}  dec      bp                          
  {09C40}  and      byte ptr [bp + di + 0x49], cl
  {09C43}  inc      bp                          
  {09C44}  push     dx                          
  {09C45}  push     bp                          
  {09C46}  dec      si                          
  {09C47}  dec      bx                          
  {09C48}  push     bp                          
  {09C49}  and      byte ptr [di + 0x4f], cl    
  {09C4C}  push     di                          
  {09C4D}  dec      cx                          
  {09C4E}  inc      cx                          
  {09C4F}  inc      bx                          
  {09C50}  and      byte ptr [bp + si], bh      
  {09C52}  and      byte ptr [bp + 0x49], cl    
  {09C55}  inc      bp                          
  {09C56}  and      byte ptr [bx + 0x50], dl    
  {09C59}  push     bp                          
  {09C5A}  push     bx                          
  {09C5B}  pop      dx                          
  {09C5C}  inc      bx                          
  {09C5D}  pop      dx                          
  {09C5E}  inc      bp                          
  {09C5F}  or       bx, word ptr [bp + si + 0x41]
  {09C62}  inc      dx                          
  {09C63}  dec      cx                          
  {09C64}  dec      dx                          
  {09C65}  and      byte ptr [si + 0x52], al    
  {09C68}  pop      dx                          
  {09C69}  push     di                          
  {09C6A}  dec      cx                          
  {09C6B}  sbb      byte ptr [bx + 0x53], dl    
  {09C6E}  inc      bx                          
  {09C6F}  dec      ax                          
  {09C70}  dec      di                          
  {09C71}  inc      sp                          
  {09C72}  sub      ax, 0x4f50                  
  {09C75}  inc      sp                          
  {09C76}  inc      bp                          
  {09C77}  dec      dx                          
  {09C78}  push     dx                          
  {09C79}  pop      dx                          
  {09C7A}  inc      cx                          
  {09C7B}  dec      si                          
  {09C7C}  inc      bp                          
  {09C7D}  and      byte ptr [bp + di + 0x52], cl
  {09C80}  pop      dx                          
  {09C81}  inc      cx                          
  {09C82}  dec      bx                          
  {09C83}  dec      cx                          
  {09C84}  daa                                  
  {09C85}  pop      dx                          
  {09C86}  inc      cx                          
  {09C87}  inc      bx                          
  {09C88}  dec      ax                          
  {09C89}  dec      di                          
  {09C8A}  inc      sp                          
  {09C8B}  sub      ax, 0x4447                  
  {09C8E}  pop      cx                          
  {09C8F}  inc      dx                          
  {09C90}  pop      cx                          
  {09C91}  and      byte ptr [bp + 0x49], cl    
  {09C94}  inc      bp                          
  {09C95}  and      byte ptr [si + 0x45], dl    
  {09C98}  and      byte ptr [bp + di + 0x48], al
  {09C9B}  dec      di                          
  {09C9C}  dec      sp                          
  {09C9D}  inc      bp                          
  {09C9E}  push     dx                          
  {09C9F}  dec      si                          
  {09CA0}  inc      bp                          
  {09CA1}  and      byte ptr [si + 0x52], al    
  {09CA4}  pop      dx                          
  {09CA5}  push     di                          
  {09CA6}  dec      cx                          
  {09CA7}  and      byte ptr [0x2e2e], ch       
  {09CAB}  and      byte ptr [bx], dl           
  {09CAD}  pop      dx                          
  {09CAE}  inc      cx                          
  {09CAF}  inc      bx                          
  {09CB0}  dec      ax                          
  {09CB1}  dec      di                          
  {09CB2}  inc      sp                          
  {09CB3}  sub      ax, 0x4557                  
  {09CB6}  dec      dx                          
  {09CB7}  push     bx                          
  {09CB8}  inc      bx                          
  {09CB9}  dec      cx                          
  {09CBA}  inc      bp                          
  {09CBB}  and      byte ptr [si + 0x4f], al    
  {09CBE}  and      byte ptr [si + 0x4f], al    
  {09CC1}  dec      bp                          
  {09CC2}  dec      bx                          
  {09CC3}  push     bp                          
  {09CC4}  dec      si                          
  {09CC5}  push     bx                          
  {09CC6}  push     ax                          
  {09CC7}  push     dx                          
  {09CC8}  dec      di                          
  {09CC9}  inc      dx                          
  {09CCA}  dec      di                          
  {09CCB}  dec      dx                          
  {09CCC}  and      byte ptr [bx + 0x4d], cl    
  {09CCF}  dec      cx                          
  {09CD0}  dec      si                          
  {09CD1}  inc      cx                          
  {09CD2}  inc      bx                          
  {09CD3}  and      byte ptr [si + 0x45], dl    
  {09CD6}  and      byte ptr [di + 0x45], cl    
  {09CD9}  inc      di                          
  {09CDA}  inc      cx                          
  {09CDB}  sub      ax, 0x5250                  
  {09CDE}  pop      dx                          
  {09CDF}  pop      cx                          
  {09CE0}  push     ax                          
  {09CE1}  inc      cx                          
  {09CE2}  dec      bx                          
  {09CE3}  dec      di                          
  {09CE4}  push     di                          
  {09CE5}  inc      cx                          
  {09CE6}  dec      si                          
  {09CE7}  inc      bp                          
  {09CE8}  and      byte ptr [si + 0x52], al    
  {09CEB}  pop      dx                          
  {09CEC}  push     di                          
  {09CED}  dec      cx                          
  {09CEE}  and      byte ptr [bp + di + 0x54], cl
  {09CF1}  dec      di                          
  {09CF2}  push     dx                          
  {09CF3}  pop      cx                          
  {09CF4}  inc      bx                          
  {09CF5}  dec      ax                          
  {09CF6}  and      byte ptr [bp + si + 0x59], al
  {09CF9}  and      byte ptr [bp + di + 0x49], dl
  {09CFC}  inc      bp                          
  {09CFD}  and      byte ptr [bx + si + 0x45], cl
  {09D00}  sub      ax, 0x414d                  
  {09D03}  dec      si                          
  {09D04}  and      byte ptr [bp + 0x49], cl    
  {09D07}  inc      bp                          
  {09D08}  and      byte ptr [bx + si + 0x4f], dl
  {09D0B}  push     di                          
  {09D0C}  push     bx                          
  {09D0D}  push     sp                          
  {09D0E}  pop      cx                          
  {09D0F}  inc      sp                          
  {09D10}  pop      dx                          
  {09D11}  dec      cx                          
  {09D12}  dec      sp                          
  {09D13}  dec      bp                          
  {09D14}  inc      sp                          
  {09D15}  dec      di                          
  {09D16}  inc      dx                          
  {09D17}  push     dx                          
  {09D18}  inc      cx                          
  {09D19}  and      byte ptr [bp + si + 0x45], cl
  {09D1C}  push     bx                          
  {09D1D}  push     sp                          
  {09D1E}  inc      bp                          
  {09D1F}  push     bx                          
  {09D20}  and      byte ptr [bx + 0x20], dl    
  {09D23}  push     bx                          
  {09D24}  push     dx                          
  {09D25}  dec      di                          
  {09D26}  inc      sp                          
  {09D27}  dec      bx                          
  {09D28}  push     bp                          
  {09D29}  and      byte ptr [bp + si + 0x52], al
  {09D2C}  inc      cx                          
  {09D2D}  dec      bx                          
  {09D2E}  and      byte ptr [bx + 0x53], cl    
  {09D31}  push     di                          
  {09D32}  dec      cx                          
  {09D33}  inc      bp                          
  {09D34}  push     sp                          
  {09D35}  dec      sp                          
  {09D36}  inc      bp                          
  {09D37}  dec      si                          
  {09D38}  dec      cx                          
  {09D39}  inc      cx                          
  {09D3A}  and      byte ptr [bp + di + 0x49], al
  {09D3D}  inc      bp                          
  {09D3E}  and      byte ptr [bp + 0x49], cl    
  {09D41}  inc      bp                          
  {09D42}  and      byte ptr [bx + 0x5a], dl    
  {09D45}  push     dx                          
  {09D46}  push     bp                          
  {09D47}  push     bx                          
  {09D48}  pop      dx                          
  {09D49}  inc      cx                          
  {09D4A}  and      byte ptr [si], ch           
  {09D4C}  and      byte ptr [si + 0x4f], al    
  {09D4F}  dec      di                          
  {09D50}  dec      bx                          
  {09D51}  dec      di                          
  {09D52}  dec      sp                          
  {09D53}  inc      cx                          
  {09D54}  and      byte ptr [bp + si + 0x4f], dl
  {09D57}  pop      dx                          
  {09D58}  dec      si                          
  {09D59}  inc      bp                          
  {09D5A}  and      byte ptr [bx + 0x41], al    
  {09D5D}  push     dx                          
  {09D5E}  dec      si                          
  {09D5F}  dec      bx                          
  {09D60}  dec      cx                          
  {09D61}  xor      ax, 0x2057                  
  {09D64}  push     dx                          
  {09D65}  dec      di                          
  {09D66}  inc      di                          
  {09D67}  push     bp                          
  {09D68}  and      byte ptr [bp + si + 0x41], bl
  {09D6B}  push     bp                          
  {09D6C}  push     di                          
  {09D6D}  inc      cx                          
  {09D6E}  pop      dx                          
  {09D6F}  inc      cx                          
  {09D70}  push     bx                          
  {09D71}  pop      dx                          
  {09D72}  and      byte ptr [di + 0x41], cl    
  {09D75}  dec      sp                          
  {09D76}  inc      bp                          
  {09D77}  inc      di                          
  {09D78}  dec      di                          
  {09D79}  and      byte ptr [bx + 0x59], dl    
  {09D7C}  inc      di                          
  {09D7D}  dec      sp                          
  {09D7E}  dec      di                          
  {09D7F}  inc      sp                          
  {09D80}  pop      dx                          
  {09D81}  dec      di                          
  {09D82}  dec      si                          
  {09D83}  inc      bp                          
  {09D84}  inc      di                          
  {09D85}  dec      di                          
  {09D86}  and      byte ptr [di + 0x4c], al    
  {09D89}  inc      si                          
  {09D8A}  dec      cx                          
  {09D8B}  inc      bp                          
  {09D8C}  inc      di                          
  {09D8D}  dec      di                          
  {09D8E}  and      byte ptr [bp + di + 0x54], dl
  {09D91}  inc      cx                          
  {09D92}  push     dx                          
  {09D93}  push     bp                          
  {09D94}  inc      bx                          
  {09D95}  dec      ax                          
  {09D96}  inc      cx                          
  {09D97}  push     di                          
  {09D99}  dec      cx                          
  {09D9A}  inc      sp                          
  {09D9B}  pop      dx                          
  {09D9C}  dec      cx                          
  {09D9D}  push     bx                          
  {09D9E}  pop      dx                          
  {09D9F}  and      byte ptr [si + 0x55], dl    
  {09DA2}  and      byte ptr [si + 0x59], dl    
  {09DA5}  dec      sp                          
  {09DA6}  dec      bx                          
  {09DA7}  dec      di                          
  {09DA8}  and      byte ptr [bx + si + 0x4c], dl
  {09DAB}  inc      cx                          
  {09DAC}  push     bx                          
  {09DAD}  pop      dx                          
  {09DAE}  inc      bx                          
  {09DAF}  pop      dx                          
  {09DB0}  and      byte ptr [bx + si + 0x4f], dl
  {09DB3}  and      byte ptr [bp + di + 0x54], dl
  {09DB6}  inc      cx                          
  {09DB7}  push     dx                          
  {09DB8}  push     bp                          
  {09DB9}  inc      bx                          
  {09DBA}  dec      ax                          
  {09DBB}  push     bp                          
  {09DBC}  and      byte ptr [bp + di + 0x54], cl
  {09DBF}  dec      di                          
  {09DC0}  push     dx                          
  {09DC1}  pop      cx                          
  {09DC2}  and      byte ptr [bp + si + 0x4e], bl
  {09DC5}  dec      cx                          
  {09DC6}  dec      bx                          
  {09DC7}  dec      si                          
  {09DC8}  inc      cx                          
  {09DC9}  and      byte ptr [bx + 0x20], dl    
  {09DCC}  push     ax                          
  {09DCD}  push     dx                          
  {09DCE}  pop      dx                          
  {09DCF}  inc      bp                          
  {09DD0}  push     bx                          
  {09DD1}  push     sp                          
  {09DD2}  push     dx                          
  {09DD3}  pop      dx                          
  {09DD4}  inc      bp                          
  {09DD5}  dec      si                          
  {09DD6}  or       al, 0x44                    
  {09DD8}  inc      cx                          
  {09DD9}  push     di                          
  {09DDA}  inc      cx                          
  {09DDB}  dec      dx                          
  {09DDC}  and      byte ptr [bp + di + 0x55], cl
  {09DDF}  dec      si                          
  {09DE0}  push     bx                          
  {09DE1}  pop      dx                          
  {09DE2}  push     sp                          
  {09DE3}  or       al, 0x50                    
  {09DE5}  inc      cx                          
  {09DE6}  push     sp                          
  {09DE7}  push     dx                          
  {09DE8}  pop      dx                          
  {09DE9}  and      byte ptr [bx + 0x41], al    
  {09DEC}  push     dx                          
  {09DED}  dec      si                          
  {09DEE}  dec      bx                          
  {09DEF}  dec      cx                          
  {09DF0}  inc      ax                          
  {09DF1}  pop      dx                          
  {09DF2}  and      byte ptr [bp + si + 0x45], cl
  {09DF5}  pop      dx                          
  {09DF6}  dec      di                          
  {09DF7}  push     dx                          
  {09DF8}  inc      bp                          
  {09DF9}  dec      bp                          
  {09DFA}  and      byte ptr [bp + 0x41], cl    
  {09DFD}  and      byte ptr [bx + 0x49], dl    
  {09E00}  inc      bp                          
  {09E01}  push     dx                          
  {09E02}  pop      dx                          
  {09E03}  inc      bx                          
  {09E04}  dec      ax                          
  {09E05}  push     bp                          
  {09E06}  and      byte ptr [bx + si + 0x41], dl
  {09E09}  push     sp                          
  {09E0A}  push     dx                          
  {09E0B}  pop      dx                          
  {09E0C}  pop      cx                          
  {09E0D}  push     bx                          
  {09E0E}  pop      dx                          
  {09E0F}  and      byte ptr [si + 0x4f], al    
  {09E12}  and      byte ptr [bx + 0x41], al    
  {09E15}  push     dx                          
  {09E16}  dec      si                          
  {09E17}  dec      bx                          
  {09E18}  dec      di                          
  {09E19}  push     di                          
  {09E1A}  and      byte ptr [si + 0x45], cl    
  {09E1D}  inc      bx                          
  {09E1E}  pop      dx                          
  {09E1F}  and      byte ptr [bp + 0x49], cl    
  {09E22}  inc      bx                          
  {09E23}  and      byte ptr [bx + 0x20], dl    
  {09E26}  dec      si                          
  {09E27}  dec      cx                          
  {09E28}  inc      bx                          
  {09E29}  dec      ax                          
  {09E2A}  and      byte ptr [bp + 0x49], cl    
  {09E2D}  inc      bp                          
  {09E2E}  and      byte ptr [di + 0x41], cl    
  {09E31}  adc      word ptr [bp + si + 0x4f], dx
  {09E34}  pop      dx                          
  {09E35}  dec      bp                          
  {09E36}  inc      cx                          
  {09E37}  push     di                          
  {09E38}  dec      cx                          
  {09E39}  inc      cx                          
  {09E3A}  dec      dx                          
  {09E3B}  and      byte ptr [bp + di + 0x54], dl
  {09E3E}  inc      cx                          
  {09E3F}  push     dx                          
  {09E40}  push     bp                          
  {09E41}  inc      bx                          
  {09E42}  dec      ax                          
  {09E43}  dec      di                          
  {09E44}  push     bx                          
  {09E45}  push     sp                          
  {09E46}  inc      cx                          
  {09E47}  push     dx                          
  {09E48}  push     bp                          
  {09E49}  inc      bx                          
  {09E4A}  dec      ax                          
  {09E4B}  and      byte ptr [di + 0x4f], cl    
  {09E4E}  push     di                          
  {09E4F}  dec      cx                          
  {09E50}  and      byte ptr [bp + di + 0x49], al
  {09E53}  and      byte ptr [bp + si], bh      
  {09E55}  and      byte ptr [bx + si + 0x45], cl
  {09E58}  dec      dx                          
  {09E59}  and      byte ptr [bp + di + 0x54], cl
  {09E5C}  dec      di                          
  {09E5D}  and      byte ptr [si + 0x59], dl    
  {09E60}  and      byte ptr [bp + si + 0x45], cl
  {09E63}  push     bx                          
  {09E64}  push     sp                          
  {09E65}  inc      bp                          
  {09E66}  push     bx                          
  {09E67}  and      byte ptr [bp + di + 0x5a], al
  {09E6A}  pop      cx                          
  {09E6B}  and      byte ptr [bp + si + 0x45], bl
  {09E6E}  and      byte ptr [di + 0x41], cl    
  {09E71}  inc      di                          
  {09E72}  dec      cx                          
  {09E73}  inc      bx                          
  {09E74}  pop      dx                          
  {09E75}  dec      si                          
  {09E76}  inc      bp                          
  {09E77}  and      byte ptr [si + 0x52], al    
  {09E7A}  pop      dx                          
  {09E7B}  push     di                          
  {09E7C}  dec      cx                          
  {09E7D}  and      byte ptr [bp + 0x49], cl    
  {09E80}  inc      bp                          
  {09E81}  and      byte ptr [bx + si + 0x4f], dl
  {09E84}  push     di                          
  {09E85}  push     bx                          
  {09E86}  push     sp                          
  {09E87}  push     dx                          
  {09E88}  pop      dx                          
  {09E89}  pop      cx                          
  {09E8A}  dec      bp                          
  {09E8B}  inc      cx                          
  {09E8C}  dec      sp                          
  {09E8D}  pop      cx                          
  {09E8E}  and      byte ptr [bp + di + 0x49], al
  {09E91}  inc      bp                          
  {09E92}  aas                                  
  {09E93}  dec      si                          
  {09E94}  dec      bp                          
  {09E95}  push     bp                          
  {09E96}  push     bx                          
  {09E97}  dec      cx                          
  {09E98}  push     bx                          
  {09E99}  pop      dx                          
  {09E9A}  and      byte ptr [bp + si + 0x59], al
  {09E9D}  inc      bx                          
  {09E9E}  and      byte ptr [bp + 0x49], cl    
  {09EA1}  inc      bp                          
  {09EA2}  pop      dx                          
  {09EA3}  dec      sp                          
  {09EA4}  pop      cx                          
  {09EA5}  dec      bp                          
  {09EA6}  and      byte ptr [bx + 0x4f], dl    
  {09EA9}  dec      dx                          
  {09EAA}  dec      di                          
  {09EAB}  push     di                          
  {09EAC}  dec      si                          
  {09EAD}  dec      cx                          
  {09EAE}  dec      bx                          
  {09EAF}  dec      cx                          
  {09EB0}  inc      bp                          
  {09EB1}  dec      bp                          
  {09EB2}  and      byte ptr [si], ch           
  {09EB4}  push     bx                          
  {09EB5}  push     ax                          
  {09EB6}  dec      di                          
  {09EB7}  pop      ax                          
  {09EB8}  dec      di                          
  {09EB9}  dec      sp                          
  {09EBA}  inc      cx                          
  {09EBB}  dec      si                          
  {09EBC}  inc      sp                          
  {09EBD}  dec      cx                          
  {09EBE}  inc      cx                          
  {09EBF}  sub      al, 0x20                    
  {09EC1}  inc      di                          
  {09EC2}  dec      sp                          
  {09EC3}  dec      di                          
  {09EC4}  inc      sp                          
  {09EC5}  dec      si                          
  {09EC6}  pop      cx                          
  {09EC7}  and      byte ptr [bp + si + 0x45], cl
  {09ECA}  push     bx                          
  {09ECB}  push     sp                          
  {09ECC}  inc      bp                          
  {09ECD}  dec      bp                          
  {09ECE}  and      byte ptr [bx + si + 0x52], dl
  {09ED1}  pop      dx                          
  {09ED2}  pop      cx                          
  {09ED3}  dec      si                          
  {09ED4}  dec      cx                          
  {09ED5}  inc      bp                          
  {09ED6}  push     bx                          
  {09ED7}  and      byte ptr [di + 0x49], cl    
  {09EDA}  and      byte ptr [si], dh           
  {09EDC}  and      byte ptr [bx + 0x45], dl    
  {09EDF}  dec      bx                          
  {09EE0}  dec      cx                          
  {09EE1}  and      byte ptr [bx + di + 0x4f], cl
  {09EE4}  push     dx                          
  {09EE5}  inc      cx                          
  {09EE6}  pop      dx                          
  {09EE7}  and      byte ptr [bx + 0x4b], cl    
  {09EEA}  dec      di                          
  {09EEB}  dec      sp                          
  {09EEC}  dec      di                          
  {09EED}  and      byte ptr [bp + si], dh      
  {09EEF}  xor      byte ptr [bx + si], dh      
  {09EF1}  and      byte ptr [bp + di + 0x41], cl
  {09EF4}  push     bx                          
  {09EF5}  pop      cx                          
  {09EF6}  and      byte ptr [si], ch           
  {09EF8}  and      byte ptr [bx + di + 0x20], al
  {09EFB}  inc      sp                          
  {09EFC}  inc      cx                          
  {09EFD}  dec      bp                          
  {09EFE}  and      byte ptr [bp + di + 0x49], al
  {09F01}  and      byte ptr [si + 0x41], dl    
  {09F04}  dec      bx                          
  {09F05}  dec      cx                          
  {09F06}  inc      bp                          
  {09F07}  and      byte ptr [bp + 0x55], cl    
  {09F0A}  dec      bp                          
  {09F0B}  inc      bp                          
  {09F0C}  push     dx                          
  {09F0D}  pop      cx                          
  {09F0E}  and      byte ptr [bx + 0x20], cl    
  {09F11}  dec      dx                          
  {09F12}  inc      cx                          
  {09F13}  dec      bx                          
  {09F14}  dec      cx                          
  {09F15}  inc      bx                          
  {09F16}  dec      ax                          
  {09F17}  and      byte ptr [bp + di + 0x49], al
  {09F1A}  and      byte ptr [bp + di + 0x49], dl
  {09F1D}  inc      bp                          
  {09F1E}  and      byte ptr [bp + 0x49], cl    
  {09F21}  inc      bp                          
  {09F22}  and      byte ptr [bp + di + 0x4e], dl
  {09F25}  dec      cx                          
  {09F26}  dec      sp                          
  {09F27}  dec      di                          
  {09F28}  dec      dx                          
  {09F2D}  push     bx                          
  {09F2E}  push     sp                          
  {09F2F}  inc      cx                          
  {09F30}  push     dx                          
  {09F31}  push     bp                          
  {09F32}  inc      bx                          
  {09F33}  dec      ax                          
  {09F34}  and      byte ptr [di + 0x4f], cl    
  {09F37}  push     di                          
  {09F38}  dec      cx                          
  {09F39}  and      byte ptr [bp + di + 0x49], al
  {09F3C}  and      byte ptr [bp + si], bh      
  {09F3E}  and      byte ptr [bx + 0x4f], cl    
  {09F41}  dec      di                          
  {09F42}  and      byte ptr [bp + si + 0x41], cl
  {09F45}  dec      bx                          
  {09F46}  inc      cx                          
  {09F47}  and      byte ptr [bx + si + 0x49], dl
  {09F4A}  inc      bp                          
  {09F4B}  dec      bx                          
  {09F4C}  dec      si                          
  {09F4D}  inc      cx                          
  {09F4E}  and      byte ptr [bx + 0x45], dl    
  {09F51}  dec      bx                          
  {09F52}  inc      cx                          
  {09F53}  and      byte ptr [0x2e2e], ch       
  {09F57}  and      byte ptr [di + 0x4e], cl    
  {09F5A}  dec      cx                          
  {09F5B}  inc      cx                          
  {09F5C}  dec      bp                          
  {09F5D}  and      byte ptr [bx + di + 0x20], cl
  {09F60}  inc      sp                          
  {09F61}  push     dx                          
  {09F62}  push     bp                          
  {09F63}  inc      di                          
  {09F64}  inc      cx                          
  {09F65}  and      byte ptr [si + 0x52], dl    
  {09F68}  pop      dx                          
  {09F69}  inc      bp                          
  {09F6A}  inc      bx                          
  {09F6B}  dec      cx                          
  {09F6C}  inc      cx                          
  {09F6D}  and      byte ptr [bx + di + 0x20], cl
  {09F70}  inc      bx                          
  {09F71}  pop      dx                          
  {09F72}  push     di                          
  {09F73}  inc      cx                          
  {09F74}  push     dx                          
  {09F75}  push     sp                          
  {09F76}  inc      cx                          
  {09F77}  dec      dx                          
  {09F78}  push     sp                          
  {09F79}  dec      di                          
  {09F7A}  and      byte ptr [bp + si + 0x59], al
  {09F7D}  dec      sp                          
  {09F7E}  dec      di                          
  {09F7F}  and      byte ptr [si + 0x4f], al    
  {09F82}  inc      dx                          
  {09F83}  push     dx                          
  {09F84}  inc      bp                          
  {09F85}  and      byte ptr [bp + si + 0x41], bl
  {09F88}  push     dx                          
  {09F89}  inc      bx                          
  {09F8A}  dec      cx                          
  {09F8B}  inc      bp                          
  {09F8C}  and      byte ptr [bx + di], ah      
  {09F8E}  and      word ptr [bx + di], sp      
  {09F90}  and      byte ptr [si], ch           
  {09F92}  and      byte ptr [si + 0x41], al    
  {09F95}  push     di                          
  {09F96}  inc      cx                          
  {09F97}  dec      dx                          
  {09F98}  and      byte ptr [bp + di + 0x41], cl
  {09F9B}  push     bx                          
  {09F9C}  inc      bp                          
  {09F9D}  and      byte ptr [si], ch           
  {09F9F}  and      byte ptr [bx + si + 0x49], dl
  {09FA2}  inc      bp                          
  {09FA3}  dec      si                          
  {09FA4}  dec      cx                          
  {09FA5}  inc      cx                          
  {09FA6}  inc      sp                          
  {09FA7}  pop      dx                          
  {09FA8}  inc      bp                          
  {09FA9}  and      byte ptr [bx + di], ah      
  {09FAB}  and      word ptr [bx + di], sp      
  {09FAD}  and      byte ptr [si], ch           
  {09FAF}  and      byte ptr [bp + di + 0x4f], al
  {09FB2}  and      byte ptr [bp + di + 0x49], dl
  {09FB5}  inc      bp                          
  {09FB6}  and      byte ptr [si + 0x41], dl    
  {09FB9}  dec      bx                          
  {09FBA}  and      byte ptr [bx + 0x41], al    
  {09FBD}  push     ax                          
  {09FBE}  dec      cx                          
  {09FBF}  push     bx                          
  {09FC0}  pop      dx                          
  {09FC1}  aas                                  
  {09FC2}  inc      dx                          
  {09FC3}  push     di                          
  {09FC4}  pop      cx                          
  {09FC5}  dec      si                          
  {09FC6}  dec      di                          
  {09FC7}  inc      bx                          
  {09FC8}  dec      ax                          
  {09FC9}  inc      cx                          
  {09FCA}  and      byte ptr [bp + di + 0x54], dl
  {09FCD}  inc      cx                          
  {09FCE}  inc      sp                          
  {09FCF}  and      byte ptr [bx + di], ah      
  {09FD1}  and      word ptr [bx + di], sp      
  {09FD3}  and      byte ptr [di + 0x52], cl    
  {09FD6}  inc      cx                          
  {09FD7}  dec      bp                          
  {09FD8}  dec      bp                          
  {09FD9}  dec      bp                          
  {09FDA}  inc      cx                          
  {09FDB}  push     dx                          
  {09FDC}  inc      cx                          
  {09FDD}  dec      bp                          
  {09FDE}  dec      bp                          
  {09FDF}  inc      cx                          
  {09FE0}  push     dx                          
  {09FE1}  inc      cx                          
  {09FE2}  dec      bp                          
  {09FE3}  inc      cx                          
  {09FE4}  inc      cx                          
  {09FE5}  dec      bp                          
  {09FE6}  dec      bp                          
  {09FE7}  inc      cx                          
  {09FE8}  push     dx                          
  {09FE9}  inc      cx                          
  {09FEA}  dec      bp                          
  {09FEB}  and      byte ptr [bp + si + 0x55], al
  {09FEE}  dec      bp                          
  {09FEF}  and      byte ptr [bx + di], ah      
  {09FF1}  and      word ptr [bx + si], sp      
  {09FF3}  sub      ax, 0x2d54                  
  {09FF6}  inc      bp                          
  {09FF7}  sub      ax, 0x2d4c                  
  {09FFA}  inc      bp                          
  {09FFB}  sub      ax, 0x2d50                  
  {09FFE}  dec      di                          
  {09FFF}  sub      ax, 0x2d52                  
  {0A002}  push     sp                          
  {0A003}  sub      ax, 0x4b59                  
  {0A006}  push     di                          
  {0A007}  pop      cx                          
  {0A008}  inc      di                          
  {0A009}  dec      sp                          
  {0A00A}  inc      cx                          
  {0A00B}  inc      sp                          
  {0A00C}  inc      cx                          
  {0A00D}  and      byte ptr [bp + si + 0x45], bl
  {0A010}  and      byte ptr [bp + si + 0x52], bl
  {0A013}  dec      di                          
  {0A014}  inc      dx                          
  {0A015}  dec      cx                          
  {0A016}  dec      sp                          
  {0A017}  and      byte ptr [bp + di + 0x49], al
  {0A01A}  inc      bp                          
  {0A01B}  and      byte ptr [bx + 0x20], dl    
  {0A01E}  inc      dx                          
  {0A01F}  push     bp                          
  {0A020}  inc      bx                          
  {0A021}  inc      cx                          
  {0A022}  and      byte ptr [si], ch           
  {0A024}  and      byte ptr [bx + di + 0x20], al
  {0A027}  dec      bp                          
  {0A028}  dec      di                          
  {0A029}  pop      dx                          
  {0A02A}  inc      bp                          
  {0A02B}  and      byte ptr [bp + si + 0x45], cl
  {0A02E}  inc      sp                          
  {0A02F}  dec      si                          
  {0A030}  inc      cx                          
  {0A031}  dec      bx                          
  {0A032}  and      byte ptr [bp + 0x49], cl    
  {0A035}  inc      bp                          
  {0A036}  and      byte ptr [si], ch           
  {0A038}  and      byte ptr [bp + di + 0x4f], al
  {0A03B}  and      byte ptr [si + 0x4f], dl    
  {0A03E}  and      byte ptr [bx], bh           
  {0A040}  and      byte ptr [si], ch           
  {0A042}  and      byte ptr [bp + di + 0x43], dl
  {0A045}  push     dx                          
  {0A046}  dec      di                          
  {0A047}  dec      sp                          
  {0A048}  dec      sp                          
  {0A049}  and      byte ptr [bx + si + 0x4f], dl
  {0A04C}  push     di                          
  {0A04D}  push     dx                          
  {0A04E}  dec      di                          
  {0A04F}  push     sp                          
  {0A050}  push     bp                          
  {0A051}  dec      dx                          
  {0A052}  dec      cx                          
  {0A053}  and      byte ptr [bx + si + 0x49], dl
  {0A056}  push     di                          
  {0A057}  push     bx                          
  {0A058}  dec      bx                          
  {0A059}  dec      di                          
  {0A05A}  and      byte ptr [bp + 0x41], cl    
  {0A05D}  and      byte ptr [bx + 0x53], cl    
  {0A060}  dec      sp                          
  {0A061}  dec      di                          
  {0A062}  inc      sp                          
  {0A063}  pop      dx                          
  {0A064}  inc      bp                          
  {0A065}  dec      si                          
  {0A066}  dec      cx                          
  {0A067}  inc      bp                          
  {0A068}  and      byte ptr [bp + si + 0x59], bl
  {0A06B}  inc      bx                          
  {0A06C}  dec      cx                          
  {0A06D}  inc      cx                          
  {0A06E}  and      byte ptr [si], ch           
  {0A070}  and      byte ptr [bp + 0x4f], cl    
  {0A073}  and      byte ptr [si + 0x52], dl    
  {0A076}  push     bp                          
  {0A077}  inc      sp                          
  {0A078}  dec      si                          
  {0A079}  dec      di                          
  {0A07A}  and      byte ptr [bx + si + 0x52], dl
  {0A07D}  pop      dx                          
  {0A07E}  pop      cx                          
  {0A07F}  dec      si                          
  {0A080}  inc      cx                          
  {0A081}  dec      dx                          
  {0A082}  dec      bp                          
  {0A083}  dec      si                          
  {0A084}  dec      cx                          
  {0A085}  inc      bp                          
  {0A086}  dec      dx                          
  {0A087}  and      byte ptr [bp + di + 0x5a], al
  {0A08A}  inc      bp                          
  {0A08B}  inc      di                          
  {0A08C}  dec      di                          
  {0A08D}  push     bx                          
  {0A08E}  and      byte ptr [bp + di + 0x49], dl
  {0A091}  inc      bp                          
  {0A092}  and      byte ptr [bp + 0x41], cl    
  {0A095}  push     bp                          
  {0A096}  inc      bx                          
  {0A097}  pop      dx                          
  {0A098}  pop      cx                          
  {0A099}  dec      sp                          
  {0A09A}  inc      bp                          
  {0A09B}  push     bx                          
  {0A09C}  and      al, 0x41                    
  {0A09E}  inc      cx                          
  {0A09F}  inc      cx                          
  {0A0A0}  inc      cx                          
  {0A0A1}  and      byte ptr [bp + di + 0x50], dl
  {0A0A4}  inc      cx                          
  {0A0A5}  inc      sp                          
  {0A0A6}  inc      cx                          
  {0A0A7}  dec      dx                          
  {0A0A8}  and      byte ptr [bp + di + 0x54], dl
  {0A0AB}  inc      cx                          
  {0A0AC}  inc      sp                          
  {0A0AD}  and      byte ptr [bp + si + 0x4f], al
  {0A0B0}  and      byte ptr [bp + di + 0x49], al
  {0A0B3}  and      byte ptr [bp + di + 0x4f], cl
  {0A0B6}  push     bx                          
  {0A0B7}  inc      bx                          
  {0A0B8}  dec      cx                          
  {0A0B9}  and      byte ptr [bx + si + 0x4f], dl
  {0A0BC}  dec      sp                          
  {0A0BD}  inc      cx                          
  {0A0BE}  dec      bp                          
  {0A0BF}  dec      cx                          
  {0A0C0}  inc      bp                          
  {0A0C1}  or       ax, 0x415a                  
  {0A0C4}  inc      dx                          
  {0A0C5}  dec      cx                          
  {0A0C6}  dec      dx                          
  {0A0C7}  and      byte ptr [bp + di + 0x54], dl
  {0A0CA}  inc      cx                          
  {0A0CB}  push     dx                          
  {0A0CC}  push     bp                          
  {0A0CD}  inc      bx                          
  {0A0CE}  dec      ax                          
  {0A0CF}  inc      sp                          
  {0A0D0}  dec      ax                          
  {0A0D1}  dec      bp                          
  {0A0D2}  dec      bp                          
  {0A0D3}  dec      bp                          
  {0A0D4}  and      byte ptr [di + 0x42], dl    
  {0A0D7}  push     dx                          
  {0A0D8}  inc      cx                          
  {0A0D9}  dec      si                          
  {0A0DA}  dec      cx                          
  {0A0DB}  inc      bp                          
  {0A0DC}  and      byte ptr [bp + si + 0x45], cl
  {0A0DF}  push     bx                          
  {0A0E0}  push     sp                          
  {0A0E1}  and      byte ptr [si], ch           
  {0A0E3}  and      byte ptr [bx + di + 0x4c], al
  {0A0E6}  inc      bp                          
  {0A0E7}  and      byte ptr [bp + di + 0x49], al
  {0A0EA}  inc      cx                          
  {0A0EB}  dec      sp                          
  {0A0EC}  dec      di                          
  {0A0ED}  and      byte ptr [bx + 0x44], al    
  {0A0F0}  pop      dx                          
  {0A0F1}  dec      cx                          
  {0A0F2}  inc      bp                          
  {0A0F3}  push     bx                          
  {0A0F4}  and      byte ptr [bp + si + 0x4e], bl
  {0A0F7}  dec      cx                          
  {0A0F8}  dec      bx                          
  {0A0F9}  dec      si                          
  {0A0FA}  inc      bp                          
  {0A0FB}  dec      sp                          
  {0A0FC}  dec      di                          
  {0A0FD}  and      byte ptr [si], ch           
  {0A0FF}  and      byte ptr [bx + 0x54], dl    
  {0A102}  inc      bp                          
  {0A103}  dec      bp                          
  {0A104}  and      byte ptr [bp + di + 0x4c], dl
  {0A107}  pop      cx                          
  {0A108}  push     bx                          
  {0A109}  pop      dx                          
  {0A10A}  pop      cx                          
  {0A10B}  push     bx                          
  {0A10C}  pop      dx                          
  {0A10D}  and      byte ptr [bx + 0x4c], al    
  {0A110}  dec      di                          
  {0A111}  push     bx                          
  {0A112}  and      byte ptr [bp + si], bh      
  {0A114}  inc      di                          
  {0A115}  sub      ax, 0x2d2d                  
  {0A118}  and      byte ptr [si + 0x4f], dl    
  {0A11B}  and      byte ptr [bp + si + 0x59], al
  {0A11E}  dec      sp                          
  {0A11F}  and      byte ptr [si + 0x57], dl    
  {0A122}  dec      di                          
  {0A123}  dec      dx                          
  {0A124}  and      byte ptr [bp + si + 0x4c], al
  {0A127}  inc      cx                          
  {0A128}  inc      sp                          
  {0A129}  and      byte ptr [di], ch           
  {0A12B}  sub      ax, 0x202d                  
  {0A12E}  sub      al, 0x20                    
  {0A130}  inc      sp                          
  {0A131}  dec      di                          
  {0A132}  push     bx                          
  {0A133}  push     sp                          
  {0A134}  inc      cx                          
  {0A135}  dec      dx                          
  {0A136}  inc      bp                          
  {0A137}  push     bx                          
  {0A138}  pop      dx                          
  {0A139}  and      byte ptr [bx + 0x43], cl    
  {0A13C}  dec      bp                          
  {0A13D}  dec      cx                          
  {0A13E}  inc      bp                          
  {0A13F}  dec      si                          
  {0A140}  dec      cx                          
  {0A141}  inc      cx                          
  {0A142}  and      byte ptr [si + 0x45], cl    
  {0A145}  inc      bx                          
  {0A146}  pop      dx                          
  {0A147}  and      byte ptr [bp + 0x49], cl    
  {0A14A}  inc      bp                          
  {0A14B}  and      byte ptr [bx + 0x49], dl    
  {0A14E}  inc      bp                          
  {0A14F}  push     bx                          
  {0A150}  pop      dx                          
  {0A151}  and      byte ptr [bp + di + 0x4f], al
  {0A154}  and      byte ptr [si + 0x4f], dl    
  {0A157}  and      byte ptr [bp + si + 0x59], al
  {0A15A}  dec      sp                          
  {0A15B}  dec      di                          
  {0A15C}  push     cs                          
  {0A15D}  push     di                          
  {0A15E}  push     bx                          
  {0A15F}  inc      bx                          
  {0A160}  dec      ax                          
  {0A161}  dec      di                          
  {0A162}  inc      sp                          
  {0A163}  sub      ax, 0x5542                  
  {0A166}  inc      sp                          
  {0A167}  pop      cx                          
  {0A168}  dec      si                          
  {0A169}  inc      bp                          
  {0A16A}  dec      bx                          
  {0A16B}  inc      ax                          
  {0A16C}  dec      dx                          
  {0A16D}  inc      bp                          
  {0A16E}  push     bx                          
  {0A16F}  push     sp                          
  {0A170}  inc      bp                          
  {0A171}  push     bx                          
  {0A172}  and      byte ptr [bp + 0x41], cl    
  {0A175}  and      byte ptr [di + 0x4c], dl    
  {0A178}  dec      cx                          
  {0A179}  inc      bx                          
  {0A17A}  pop      cx                          
  {0A17B}  and      byte ptr [bp + 0x41], cl    
  {0A17E}  and      byte ptr [di + 0x4c], dl    
  {0A181}  dec      cx                          
  {0A182}  inc      bx                          
  {0A183}  pop      cx                          
  {0A184}  and      byte ptr [bp + di + 0x4b], dl
  {0A187}  dec      sp                          
  {0A188}  inc      bp                          
  {0A189}  push     ax                          
  {0A18A}  dec      cx                          
  {0A18B}  dec      bx                          
  {0A18C}  dec      di                          
  {0A18D}  push     di                          
  {0A18E}  inc      bp                          
  {0A18F}  dec      dx                          
  {0A190}  and      byte ptr [di], ch           
  {0A192}  and      byte ptr [bp + si + 0x41], cl
  {0A195}  dec      bx                          
  {0A196}  and      byte ptr [bp + di + 0x41], dl
  {0A199}  dec      bp                          
  {0A19A}  inc      cx                          
  {0A19B}  and      byte ptr [bp + 0x41], cl    
  {0A19E}  pop      dx                          
  {0A19F}  push     di                          
  {0A1A0}  inc      cx                          
  {0A1A1}  and      byte ptr [bx + 0x5a], dl    
  {0A1A4}  dec      bx                          
  {0A1A5}  inc      cx                          
  {0A1A6}  pop      dx                          
  {0A1A7}  push     bp                          
  {0A1A8}  dec      dx                          
  {0A1A9}  inc      bp                          
  {0A1AA}  and      byte ptr [bx + si], ah      
  {0A1AC}  dec      dx                          
  {0A1AE}  inc      bp                          
  {0A1AF}  push     bx                          
  {0A1B0}  push     sp                          
  {0A1B1}  and      byte ptr [si + 0x55], dl    
  {0A1B4}  and      byte ptr [bx + si + 0x41], dl
  {0A1B7}  push     dx                          
  {0A1B8}  inc      bp                          
  {0A1B9}  and      byte ptr [bp + di + 0x4b], dl
  {0A1BC}  dec      sp                          
  {0A1BD}  inc      bp                          
  {0A1BE}  push     ax                          
  {0A1BF}  dec      cx                          
  {0A1C0}  dec      bx                          
  {0A1C1}  dec      di                          
  {0A1C2}  push     di                          
  {0A1C3}  and      byte ptr [bp + di + 0x54], cl
  {0A1C6}  dec      di                          
  {0A1C7}  push     dx                          
  {0A1C8}  inc      bp                          
  {0A1C9}  and      byte ptr [bp + si + 0x59], al
  {0A1CC}  inc      bx                          
  {0A1CD}  and      byte ptr [di + 0x4f], cl    
  {0A1D0}  pop      dx                          
  {0A1D1}  inc      bp                          
  {0A1D2}  and      byte ptr [bp + di + 0x49], al
  {0A1D5}  and      byte ptr [bp + di + 0x49], dl
  {0A1D8}  inc      bp                          
  {0A1D9}  and      byte ptr [bx + si + 0x52], dl
  {0A1DC}  pop      dx                          
  {0A1DD}  pop      cx                          
  {0A1DE}  inc      sp                          
  {0A1DF}  inc      cx                          
  {0A1E0}  inc      sp                          
  {0A1E1}  pop      dx                          
  {0A1E2}  inc      cx                          
  {0A1E3}  pop      ss                          
  {0A1E4}  push     ax                          
  {0A1E5}  dec      di                          
  {0A1E6}  dec      sp                          
  {0A1E7}  dec      di                          
  {0A1E8}  inc      sp                          
  {0A1E9}  dec      si                          
  {0A1EA}  dec      cx                          
  {0A1EB}  inc      bp                          
  {0A1EC}  sub      ax, 0x4543                  
  {0A1EF}  dec      si                          
  {0A1F0}  push     sp                          
  {0A1F1}  push     dx                          
  {0A1F2}  push     bp                          
  {0A1F3}  dec      bp                          
  {0A1F4}  and      byte ptr [di + 0x49], cl    
  {0A1F7}  inc      cx                          
  {0A1F8}  push     bx                          
  {0A1F9}  push     sp                          
  {0A1FA}  inc      cx                          
  {0A1FB}  adc      byte ptr [bx + 0x53], dl    
  {0A1FE}  inc      bx                          
  {0A1FF}  dec      ax                          
  {0A200}  dec      di                          
  {0A201}  inc      sp                          
  {0A202}  sub      ax, 0x4950                  
  {0A205}  inc      bp                          
  {0A206}  dec      bx                          
  {0A207}  inc      cx                          
  {0A208}  push     dx                          
  {0A209}  dec      si                          
  {0A20A}  dec      cx                          
  {0A20B}  inc      cx                          
  {0A20C}  adc      word ptr [bp + si + 0x41], bx
  {0A20F}  inc      bx                          
  {0A210}  dec      ax                          
  {0A211}  dec      di                          
  {0A212}  inc      sp                          
  {0A213}  sub      ax, 0x425a                  
  {0A216}  push     dx                          
  {0A217}  dec      di                          
  {0A218}  dec      dx                          
  {0A219}  dec      di                          
  {0A21A}  push     di                          
  {0A21B}  dec      si                          
  {0A21C}  dec      cx                          
  {0A21D}  inc      cx                          
  {0A21E}  cmp      byte ptr [bp + di + 0x49], al
  {0A221}  inc      cx                          
  {0A222}  inc      di                          
  {0A223}  dec      si                          
  {0A224}  dec      cx                          
  {0A225}  inc      bp                          
  {0A226}  and      byte ptr [bp + di + 0x49], dl
  {0A229}  inc      bp                          
  {0A22A}  and      byte ptr [si + 0x45], dl    
  {0A22D}  inc      sp                          
  {0A22E}  pop      cx                          
  {0A22F}  and      byte ptr [di + 0x4c], dl    
  {0A232}  dec      cx                          
  {0A233}  inc      bx                          
  {0A234}  inc      cx                          
  {0A235}  and      byte ptr [bp + di + 0x4b], dl
  {0A238}  dec      sp                          
  {0A239}  inc      bp                          
  {0A23A}  push     ax                          
  {0A23B}  dec      cx                          
  {0A23C}  dec      bx                          
  {0A23D}  dec      di                          
  {0A23E}  push     di                          
  {0A23F}  inc      cx                          
  {0A240}  and      byte ptr [bp + si + 0x45], cl
  {0A243}  push     bx                          
  {0A244}  push     sp                          
  {0A245}  and      byte ptr [si + 0x55], dl    
  {0A248}  and      byte ptr [bp + si + 0x45], cl
  {0A24B}  push     bx                          
  {0A24C}  pop      dx                          
  {0A24D}  inc      bx                          
  {0A24E}  pop      dx                          
  {0A24F}  inc      bp                          
  {0A250}  and      byte ptr [bx + si + 0x41], dl
  {0A253}  push     dx                          
  {0A254}  inc      bp                          
  {0A255}  and      byte ptr [bx + si], ah      
  {0A257}  cmp      byte ptr [bx + di + 0x4e], cl
  {0A25A}  push     sp                          
  {0A25B}  inc      bp                          
  {0A25C}  push     dx                          
  {0A25D}  inc      bp                          
  {0A25E}  push     bx                          
  {0A25F}  push     bp                          
  {0A260}  dec      dx                          
  {0A261}  inc      cx                          
  {0A262}  inc      bx                          
  {0A263}  pop      cx                          
  {0A264}  inc      bx                          
  {0A265}  dec      ax                          
  {0A266}  and      byte ptr [bp + di + 0x4b], dl
  {0A269}  dec      sp                          
  {0A26A}  inc      bp                          
  {0A26B}  push     ax                          
  {0A26C}  dec      di                          
  {0A26D}  push     di                          
  {0A26E}  and      byte ptr cs:[si + 0x41], al 
  {0A272}  dec      sp                          
  {0A273}  inc      bp                          
  {0A274}  dec      dx                          
  {0A275}  and      byte ptr [bp + di + 0x49], al
  {0A278}  inc      cx                          
  {0A279}  inc      di                          
  {0A27A}  dec      si                          
  {0A27B}  dec      cx                          
  {0A27C}  inc      bp                          
  {0A27D}  and      byte ptr [bp + di + 0x49], dl
  {0A280}  inc      bp                          
  {0A281}  and      byte ptr [bp + di + 0x49], cl
  {0A284}  dec      sp                          
  {0A285}  dec      bx                          
  {0A286}  inc      cx                          
  {0A287}  and      byte ptr [di + 0x4c], dl    
  {0A28A}  dec      cx                          
  {0A28B}  inc      bx                          
  {0A28C}  push     ss                          
  {0A291}  push     ax                          
  {0A292}  dec      di                          
  {0A293}  dec      sp                          
  {0A294}  dec      di                          
  {0A295}  inc      sp                          
  {0A296}  dec      si                          
  {0A297}  dec      cx                          
  {0A298}  inc      bp                          
  {0A299}  sub      ax, 0x4c55                  
  {0A29C}  push     bx                          
  {0A29E}  dec      bx                          
  {0A29F}  dec      sp                          
  {0A2A0}  inc      bp                          
  {0A2A1}  push     ax                          
  {0A2A2}  dec      cx                          
  {0A2A3}  dec      bx                          
  {0A2A4}  dec      di                          
  {0A2A5}  push     di                          
  {0A2A6}  inc      cx                          
  {0A2A7}  .byte    0x0f                        
  {0A2A8}  push     ax                          
  {0A2A9}  dec      di                          
  {0A2AA}  dec      sp                          
  {0A2AB}  dec      si                          
  {0A2AC}  dec      di                          
  {0A2AD}  inc      bx                          
  {0A2AE}  sub      ax, 0x4f52                  
  {0A2B1}  pop      dx                          
  {0A2B2}  dec      dx                          
  {0A2B3}  inc      cx                          
  {0A2B4}  pop      dx                          
  {0A2B5}  inc      sp                          
  {0A2B6}  and      word ptr [bp + si], bx      
  {0A2B8}  push     di                          
  {0A2B9}  push     bx                          
  {0A2BA}  inc      bx                          
  {0A2BB}  dec      ax                          
  {0A2BC}  dec      di                          
  {0A2BD}  inc      sp                          
  {0A2BE}  sub      ax, 0x4b53                  
  {0A2C1}  dec      sp                          
  {0A2C2}  inc      bp                          
  {0A2C3}  push     ax                          
  {0A2C4}  and      byte ptr [bx + 0x49], dl    
  {0A2C7}  inc      bp                          
  {0A2C8}  dec      sp                          
  {0A2C9}  dec      di                          
  {0A2CA}  inc      dx                          
  {0A2CB}  push     dx                          
  {0A2CC}  inc      cx                          
  {0A2CD}  dec      si                          
  {0A2CE}  pop      dx                          
  {0A2CF}  dec      di                          
  {0A2D0}  push     di                          
  {0A2D1}  pop      cx                          
  {0A2D2}  pop      ss                          
  {0A2D3}  pop      dx                          
  {0A2D4}  inc      cx                          
  {0A2D5}  inc      bx                          
  {0A2D6}  dec      ax                          
  {0A2D7}  dec      di                          
  {0A2D8}  inc      sp                          
  {0A2D9}  sub      ax, 0x4b53                  
  {0A2DC}  dec      sp                          
  {0A2DD}  inc      bp                          
  {0A2DE}  push     ax                          
  {0A2DF}  and      byte ptr [di + 0x41], cl    
  {0A2E2}  inc      di                          
  {0A2E3}  dec      cx                          
  {0A2E4}  inc      bx                          
  {0A2E5}  pop      dx                          
  {0A2E6}  dec      si                          
  {0A2E7}  pop      cx                          
  {0A2E8}  and      byte ptr [bx + si], ah      
  {0A2EA}  inc      bp                          
  {0A2EB}  dec      cx                          
  {0A2EC}  inc      sp                          
  {0A2ED}  pop      dx                          
  {0A2EE}  dec      cx                          
  {0A2EF}  inc      bp                          
  {0A2F0}  push     bx                          
  {0A2F1}  pop      dx                          
  {0A2F2}  and      byte ptr [si + 0x52], al    
  {0A2F5}  dec      di                          
  {0A2F6}  inc      di                          
  {0A2F7}  inc      cx                          
  {0A2F8}  and      byte ptr [si], ch           
  {0A2FA}  and      byte ptr [di + 0x49], cl    
  {0A2FD}  inc      cx                          
  {0A2FE}  push     bx                          
  {0A2FF}  push     sp                          
  {0A300}  inc      cx                          
  {0A301}  and      byte ptr [bx + si + 0x4f], dl
  {0A304}  and      byte ptr [si + 0x52], al    
  {0A307}  dec      di                          
  {0A308}  inc      sp                          
  {0A309}  pop      dx                          
  {0A30A}  inc      bp                          
  {0A30B}  and      byte ptr [di + 0x49], cl    
  {0A30E}  dec      dx                          
  {0A30F}  inc      cx                          
  {0A310}  push     bx                          
  {0A311}  pop      dx                          
  {0A312}  and      byte ptr [si + 0x52], al    
  {0A315}  dec      di                          
  {0A316}  inc      di                          
  {0A317}  dec      di                          
  {0A318}  push     di                          
  {0A319}  push     bx                          
  {0A31A}  dec      bx                          
  {0A31B}  inc      cx                          
  {0A31C}  pop      dx                          
  {0A31D}  and      byte ptr [0x4a20], ch       
  {0A321}  inc      bp                          
  {0A322}  push     bx                          
  {0A323}  push     sp                          
  {0A324}  and      byte ptr [si + 0x55], dl    
  {0A327}  and      byte ptr [bx + 0x20], cl    
  {0A32A}  push     di                          
  {0A32B}  dec      cx                          
  {0A32C}  inc      bp                          
  {0A32D}  dec      sp                          
  {0A32E}  inc      bp                          
  {0A32F}  and      byte ptr [bp + di + 0x4e], al
  {0A332}  dec      cx                          
  {0A333}  inc      bp                          
  {0A334}  inc      dx                          
  {0A335}  inc      bp                          
  {0A336}  pop      dx                          
  {0A337}  push     ax                          
  {0A338}  dec      cx                          
  {0A339}  inc      bp                          
  {0A33A}  inc      bx                          
  {0A33B}  pop      dx                          
  {0A33C}  dec      si                          
  {0A33D}  dec      cx                          
  {0A33E}  inc      bp                          
  {0A33F}  dec      dx                          
  {0A340}  and      byte ptr [bp + 0x49], cl    
  {0A343}  pop      dx                          
  {0A344}  and      byte ptr [bx + 0x20], dl    
  {0A347}  dec      bp                          
  {0A348}  dec      cx                          
  {0A349}  inc      bp                          
  {0A34A}  push     bx                          
  {0A34B}  inc      bx                          
  {0A34C}  dec      cx                          
  {0A34D}  inc      bp                          
  {0A34E}  and      byte ptr [bx + si + 0x45], dl
  {0A351}  dec      sp                          
  {0A352}  dec      si                          
  {0A353}  dec      di                          
  {0A354}  and      byte ptr [si + 0x55], dl    
  {0A357}  and      byte ptr [bp + si + 0x45], bl
  {0A35A}  pop      dx                          
  {0A35B}  dec      cx                          
  {0A35C}  dec      bp                          
  {0A35D}  dec      cx                          
  {0A35E}  inc      bp                          
  {0A35F}  push     dx                          
  {0A360}  pop      dx                          
  {0A361}  dec      bx                          
  {0A362}  dec      di                          
  {0A363}  push     di                          
  {0A364}  and      byte ptr [bp + si + 0x4f], dl
  {0A367}  pop      dx                          
  {0A368}  dec      si                          
  {0A369}  inc      bp                          
  {0A36A}  inc      di                          
  {0A36B}  dec      di                          
  {0A36C}  and      byte ptr [bp + si + 0x4f], dl
  {0A36F}  inc      sp                          
  {0A370}  pop      dx                          
  {0A371}  inc      cx                          
  {0A372}  dec      dx                          
  {0A373}  push     bp                          
  {0A374}  inc      cx                          
  {0A375}  dec      dx                          
  {0A376}  inc      bp                          
  {0A377}  push     bx                          
  {0A378}  dec      sp                          
  {0A379}  dec      cx                          
  {0A37A}  and      byte ptr [bp + 0x49], cl    
  {0A37D}  inc      bp                          
  {0A37E}  and      byte ptr [bp + di + 0x48], al
  {0A381}  inc      bx                          
  {0A382}  inc      bp                          
  {0A383}  push     bx                          
  {0A384}  pop      dx                          
  {0A385}  and      byte ptr [di + 0x49], cl    
  {0A388}  inc      bp                          
  {0A389}  inc      bx                          
  {0A38A}  and      byte ptr [bp + di + 0x4c], cl
  {0A38D}  dec      di                          
  {0A38E}  push     ax                          
  {0A38F}  dec      di                          
  {0A390}  push     sp                          
  {0A391}  dec      di                          
  {0A392}  push     di                          
  {0A393}  and      byte ptr [si + 0x45], cl    
  {0A396}  push     ax                          
  {0A397}  dec      cx                          
  {0A398}  inc      bp                          
  {0A399}  dec      dx                          
  {0A39A}  and      byte ptr [si + 0x4f], al    
  {0A39D}  inc      dx                          
  {0A39E}  push     dx                          
  {0A39F}  pop      dx                          
  {0A3A0}  inc      bp                          
  {0A3A1}  and      byte ptr [si + 0x52], dl    
  {0A3A4}  pop      cx                          
  {0A3A5}  dec      bp                          
  {0A3A6}  inc      cx                          
  {0A3A7}  dec      dx                          
  {0A3A8}  and      byte ptr [bp + di + 0x49], dl
  {0A3AB}  inc      bp                          
  {0A3AC}  and      byte ptr [si + 0x52], al    
  {0A3AF}  dec      di                          
  {0A3B0}  inc      di                          
  {0A3B1}  dec      cx                          
  {0A3B2}  xorps    xmm2, xmmword ptr cs:[bp + di + 0x43]
  {0A3BA}  dec      ax                          
  {0A3BB}  dec      di                          
  {0A3BC}  inc      sp                          
  {0A3BD}  sub      ax, 0x4f52                  
  {0A3C0}  pop      dx                          
  {0A3C1}  dec      dx                          
  {0A3C2}  inc      cx                          
  {0A3C3}  pop      dx                          
  {0A3C4}  inc      sp                          
  {0A3C5}  and      word ptr [si], cx           
  {0A3C7}  pop      dx                          
  {0A3C8}  inc      cx                          
  {0A3C9}  inc      bx                          
  {0A3CA}  dec      ax                          
  {0A3CB}  dec      di                          
  {0A3CC}  inc      sp                          
  {0A3CD}  sub      ax, 0x5244                  
  {0A3D0}  dec      di                          
  {0A3D1}  inc      di                          
  {0A3D2}  inc      cx                          
  {0A3D3}  or       dl, byte ptr [bx + si + 0x4f]
  {0A3D6}  dec      sp                          
  {0A3D7}  dec      si                          
  {0A3D8}  dec      di                          
  {0A3D9}  inc      bx                          
  {0A3DA}  sub      ax, 0x414c                  
  {0A3DD}  push     bx                          
  {0A3DE}  or       al, 0x50                    
  {0A3E0}  dec      di                          
  {0A3E1}  dec      sp                          
  {0A3E2}  dec      di                          
  {0A3E3}  inc      sp                          
  {0A3E4}  dec      si                          
  {0A3E5}  dec      cx                          
  {0A3E6}  inc      bp                          
  {0A3E7}  sub      ax, 0x414c                  
  {0A3EA}  push     bx                          
  {0A3EB}  adc      byte ptr [bx + si + 0x41], dl
  {0A3EE}  push     sp                          
  {0A3EF}  push     dx                          
  {0A3F0}  pop      dx                          
  {0A3F1}  and      byte ptr [si + 0x52], al    
  {0A3F4}  dec      di                          
  {0A3F5}  inc      di                          
  {0A3F6}  dec      di                          
  {0A3F7}  push     di                          
  {0A3F8}  push     bx                          
  {0A3F9}  dec      bx                          
  {0A3FA}  inc      cx                          
  {0A3FB}  pop      dx                          
  {0A3FC}  sub      byte ptr [bx + 0x53], dl    
  {0A3FF}  inc      bx                          
  {0A400}  dec      ax                          
  {0A401}  dec      di                          
  {0A402}  inc      sp                          
  {0A403}  and      byte ptr [di], ch           
  {0A405}  and      byte ptr [di + 0x49], cl    
  {0A408}  inc      cx                          
  {0A409}  push     bx                          
  {0A40A}  push     sp                          
  {0A40B}  dec      di                          
  {0A40C}  and      byte ptr [si], ch           
  {0A40E}  and      byte ptr [bp + si + 0x41], bl
  {0A411}  inc      bx                          
  {0A412}  dec      ax                          
  {0A413}  dec      di                          
  {0A414}  inc      sp                          
  {0A415}  and      byte ptr [di], ch           
  {0A417}  and      byte ptr [bp + di + 0x48], dl
  {0A41A}  dec      cx                          
  {0A41B}  inc      di                          
  {0A41C}  inc      di                          
  {0A41D}  dec      ax                          
  {0A41E}  dec      sp                          
  {0A41F}  inc      bp                          
  {0A420}  push     dx                          
  {0A421}  inc      cx                          
  {0A422}  push     sp                          
  {0A423}  dec      ax                          
  {0A424}  push     dx                          
  {0A425}  dec      dx                          
  {0A426}  dec      cx                          
  {0A427}  inc      sp                          
  {0A428}  pop      dx                          
  {0A429}  dec      cx                          
  {0A42A}  inc      bp                          
  {0A42B}  push     bx                          
  {0A42C}  pop      dx                          
  {0A42D}  and      byte ptr [si + 0x41], al    
  {0A430}  dec      sp                          
  {0A431}  inc      bp                          
  {0A432}  dec      dx                          
  {0A433}  and      byte ptr [bp + di + 0x41], cl
  {0A436}  dec      bp                          
  {0A437}  dec      cx                          
  {0A438}  inc      bp                          
  {0A439}  dec      si                          
  {0A43A}  dec      cx                          
  {0A43B}  push     bx                          
  {0A43C}  push     sp                          
  {0A43D}  inc      cx                          
  {0A43E}  and      byte ptr [si + 0x52], al    
  {0A441}  dec      di                          
  {0A442}  inc      di                          
  {0A443}  inc      cx                          
  {0A444}  and      byte ptr [si], ch           
  {0A446}  and      byte ptr [bp + si + 0x52], al
  {0A449}  pop      dx                          
  {0A44A}  pop      cx                          
  {0A44B}  inc      sp                          
  {0A44C}  inc      cx                          
  {0A44D}  dec      sp                          
  {0A44E}  inc      cx                          
  {0A44F}  and      byte ptr [bp + si + 0x49], al
  {0A452}  and      byte ptr [bp + di + 0x49], al
  {0A455}  and      byte ptr [bp + di + 0x49], dl
  {0A458}  inc      bp                          
  {0A459}  and      byte ptr [bp + si + 0x41], cl
  {0A45C}  dec      bx                          
  {0A45D}  inc      cx                          
  {0A45E}  and      byte ptr [bp + si + 0x52], al
  {0A461}  pop      cx                          
  {0A462}  inc      bx                          
  {0A463}  pop      dx                          
  {0A464}  dec      bx                          
  {0A465}  inc      cx                          
  {0A466}  and      byte ptr [bp + 0x41], cl    
  {0A469}  dec      sp                          
  {0A46A}  inc      bp                          
  {0A46B}  push     ax                          
  {0A46C}  dec      cx                          
  {0A46D}  inc      bp                          
  {0A46E}  dec      dx                          
  {0A46F}  and      byte ptr [si], bh           
  {0A471}  dec      bp                          
  {0A472}  dec      di                          
  {0A473}  inc      sp                          
  {0A474}  inc      bp                          
  {0A475}  dec      sp                          
  {0A476}  and      byte ptr [bp + di + 0x5a], dl
  {0A479}  dec      bx                          
  {0A47A}  inc      cx                          
  {0A47B}  push     ax                          
  {0A47C}  inc      cx                          
  {0A47D}  and      byte ptr [bp + si], dh      
  {0A47F}  xor      byte ptr [bx + si], dh      
  {0A481}  xor      byte ptr [bx + si], ah      
  {0A483}  sub      al, 0x20                    
  {0A485}  inc      cx                          
  {0A486}  dec      sp                          
  {0A487}  inc      bp                          
  {0A488}  and      byte ptr [bp + di + 0x4f], al
  {0A48B}  pop      dx                          
  {0A48C}  and      byte ptr [bp + di + 0x4f], cl
  {0A48F}  dec      si                          
  {0A490}  dec      cx                          
  {0A491}  inc      bp                          
  {0A492}  and      byte ptr [bp + di + 0x41], dl
  {0A495}  and      byte ptr [si + 0x59], dl    
  {0A498}  dec      sp                          
  {0A499}  dec      bx                          
  {0A49A}  dec      di                          
  {0A49B}  and      byte ptr [si + 0x4c], al    
  {0A49E}  inc      cx                          
  {0A49F}  and      byte ptr [bp + 0x41], cl    
  {0A4A2}  dec      dx                          
  {0A4A3}  inc      dx                          
  {0A4A4}  dec      di                          
  {0A4A5}  inc      di                          
  {0A4A6}  inc      cx                          
  {0A4A7}  push     sp                          
  {0A4A8}  push     bx                          
  {0A4A9}  pop      dx                          
  {0A4AA}  pop      cx                          
  {0A4AB}  inc      bx                          
  {0A4AC}  dec      ax                          
  {0A4AD}  or       al, 0x57                    
  {0A4AF}  push     bx                          
  {0A4B0}  inc      bx                          
  {0A4B1}  dec      ax                          
  {0A4B2}  dec      di                          
  {0A4B3}  inc      sp                          
  {0A4B4}  sub      ax, 0x5244                  
  {0A4B7}  dec      di                          
  {0A4B8}  inc      di                          
  {0A4B9}  inc      cx                          
  {0A4BA}  inc      bx                          
  {0A4BB}  inc      bx                          
  {0A4BC}  dec      di                          
  {0A4BD}  and      byte ptr [si + 0x4f], dl    
  {0A4C0}  and      byte ptr [bp + si + 0x41], bl
  {0A4C3}  and      byte ptr [bx + 0x4c], al    
  {0A4C6}  push     bp                          
  {0A4C7}  push     ax                          
  {0A4C8}  dec      di                          
  {0A4C9}  push     sp                          
  {0A4CA}  inc      cx                          
  {0A4CB}  and      byte ptr [bx], bh           
  {0A4CD}  and      byte ptr [si + 0x52], al    
  {0A4D0}  dec      di                          
  {0A4D1}  inc      di                          
  {0A4D2}  inc      cx                          
  {0A4D3}  and      byte ptr [bp + di + 0x4b], dl
  {0A4D6}  push     dx                          
  {0A4D7}  inc      bp                          
  {0A4D8}  inc      bx                          
  {0A4D9}  inc      cx                          
  {0A4DA}  and      byte ptr [si + 0x52], dl    
  {0A4DD}  dec      di                          
  {0A4DE}  inc      bx                          
  {0A4DF}  dec      ax                          
  {0A4E0}  inc      bp                          
  {0A4E1}  and      byte ptr [bx + 0x20], dl    
  {0A4E4}  dec      sp                          
  {0A4E5}  inc      bp                          
  {0A4E6}  push     di                          
  {0A4E7}  dec      di                          
  {0A4E8}  and      byte ptr [si], ch           
  {0A4EA}  and      byte ptr [si + 0x52], dl    
  {0A4ED}  dec      di                          
  {0A4EE}  inc      bx                          
  {0A4EF}  dec      ax                          
  {0A4F0}  inc      bp                          
  {0A4F1}  and      byte ptr [bx + 0x20], dl    
  {0A4F4}  push     ax                          
  {0A4F5}  push     dx                          
  {0A4F6}  inc      cx                          
  {0A4F7}  push     di                          
  {0A4F8}  dec      di                          
  {0A4F9}  and      byte ptr [bx + di + 0x4c], al
  {0A4FC}  inc      bp                          
  {0A4FD}  and      byte ptr [bx + si + 0x50], cl
  {0A500}  push     dx                          
  {0A501}  pop      dx                          
  {0A502}  inc      bp                          
  {0A503}  inc      bx                          
  {0A504}  dec      cx                          
  {0A505}  inc      bp                          
  {0A506}  pop      dx                          
  {0A507}  and      byte ptr [bp + si + 0x4f], dl
  {0A50A}  push     di                          
  {0A50B}  dec      si                          
  {0A50C}  dec      cx                          
  {0A50D}  inc      bp                          
  {0A50E}  and      byte ptr [si + 0x4f], al    
  {0A511}  inc      dx                          
  {0A512}  push     dx                          
  {0A513}  pop      dx                          
  {0A514}  inc      bp                          
  {0A515}  and      byte ptr [di + 0x4f], cl    
  {0A518}  inc      di                          
  {0A519}  dec      sp                          
  {0A51A}  inc      cx                          
  {0A51B}  and      byte ptr [bp + si + 0x59], al
  {0A51E}  and      byte ptr [bx + di + 0x53], cl
  {0A521}  inc      bx                          
  {0A522}  and      byte ptr [bp + di + 0x52], dl
  {0A525}  dec      di                          
  {0A526}  inc      sp                          
  {0A527}  dec      bx                          
  {0A528}  dec      cx                          
  {0A529}  inc      bp                          
  {0A52A}  dec      bp                          
  {0A52B}  and      byte ptr [si], ch           
  {0A52D}  and      byte ptr [bp + si + 0x59], bl
  {0A530}  push     bx                          
  {0A531}  dec      bx                          
  {0A532}  inc      cx                          
  {0A533}  dec      sp                          
  {0A534}  dec      cx                          
  {0A535}  and      byte ptr [bp + si + 0x59], al
  {0A538}  and      byte ptr [bp + 0x41], cl    
  {0A53B}  and      byte ptr [si + 0x59], dl    
  {0A53E}  dec      bp                          
  {0A53F}  and      byte ptr [bx + 0x53], dl    
  {0A542}  pop      dx                          
  {0A543}  pop      cx                          
  {0A544}  push     bx                          
  {0A545}  inc      bx                          
  {0A546}  pop      cx                          
  {0A547}  inc      dx                          
  {0A548}  inc      cx                          
  {0A549}  and      byte ptr [bp + di + 0x5a], dl
  {0A54C}  inc      bx                          
  {0A54D}  pop      dx                          
  {0A54E}  inc      bp                          
  {0A54F}  inc      di                          
  {0A550}  dec      di                          
  {0A551}  dec      sp                          
  {0A552}  dec      si                          
  {0A553}  dec      cx                          
  {0A554}  inc      bp                          
  {0A555}  and      byte ptr [si + 0x59], dl    
  {0A558}  and      byte ptr [si], ch           
  {0A55A}  and      byte ptr [bx + si], ah      
  {0A55C}  inc      dx                          
  {0A55D}  dec      di                          
  {0A55E}  and      byte ptr [bp + si + 0x4f], al
  {0A561}  dec      sp                          
  {0A562}  inc      cx                          
  {0A563}  and      byte ptr [bp + di + 0x49], al
  {0A566}  inc      bp                          
  {0A567}  and      byte ptr [bp + 0x4f], cl    
  {0A56A}  inc      di                          
  {0A56B}  dec      cx                          
  {0A56C}  and      byte ptr [bx + 0x44], cl    
  {0A56F}  and      byte ptr [si + 0x45], dl    
  {0A572}  inc      di                          
  {0A573}  dec      di                          
  {0A574}  and      byte ptr [bp + di + 0x48], al
  {0A577}  dec      di                          
  {0A578}  inc      sp                          
  {0A579}  pop      dx                          
  {0A57A}  inc      bp                          
  {0A57B}  dec      si                          
  {0A57C}  dec      cx                          
  {0A57D}  inc      cx                          
  {0A57E}  and      byte ptr [bp + 0x49], cl    
  {0A581}  inc      bp                          
  {0A582}  dec      bp                          
  {0A583}  dec      di                          
  {0A584}  pop      dx                          
  {0A585}  inc      bp                          
  {0A586}  inc      dx                          
  {0A587}  dec      si                          
  {0A588}  dec      cx                          
  {0A589}  inc      bp                          
  {0A58A}  dec      si                          
  {0A58B}  push     bp                          
  {0A58C}  push     ax                          
  {0A58D}  push     bx                          
  {0A58E}  and      byte ptr [si + 0x52], al    
  {0A591}  dec      di                          
  {0A592}  inc      di                          
  {0A593}  inc      cx                          
  {0A594}  and      byte ptr [bp + di + 0x49], dl
  {0A597}  inc      bp                          
  {0A598}  and      byte ptr [bp + di + 0x4f], cl
  {0A59B}  dec      si                          
  {0A59C}  inc      bx                          
  {0A59D}  pop      dx                          
  {0A59E}  pop      cx                          
  {0A59F}  and      byte ptr [bp + 0x41], cl    
  {0A5A2}  and      byte ptr [si + 0x45], dl    
  {0A5A5}  dec      dx                          
  {0A5A6}  and      byte ptr [bp + 0x49], cl    
  {0A5A9}  inc      bp                          
  {0A5AA}  push     ax                          
  {0A5AB}  push     dx                          
  {0A5AC}  pop      dx                          
  {0A5AD}  inc      bp                          
  {0A5AE}  push     ax                          
  {0A5AF}  inc      cx                          
  {0A5B0}  push     bx                          
  {0A5B1}  push     sp                          
  {0A5B2}  dec      si                          
  {0A5B3}  inc      bp                          
  {0A5B4}  dec      dx                          
  {0A5B5}  and      byte ptr [bp + si + 0x5a], dl
  {0A5B8}  inc      bp                          
  {0A5B9}  inc      bx                          
  {0A5BA}  inc      bp                          
  {0A5BB}  and      byte ptr [bx + 0x20], cl    
  {0A5BE}  inc      sp                          
  {0A5BF}  inc      cx                          
  {0A5C0}  dec      sp                          
  {0A5C1}  push     bx                          
  {0A5C2}  pop      dx                          
  {0A5C3}  inc      bp                          
  {0A5C4}  dec      dx                          
  {0A5C5}  and      byte ptr [bx + si + 0x4f], dl
  {0A5C8}  inc      sp                          
  {0A5C9}  push     dx                          
  {0A5CA}  dec      di                          
  {0A5CB}  pop      dx                          
  {0A5CC}  pop      cx                          
  {0A5CD}  and      byte ptr [bp + 0x49], cl    
  {0A5D0}  inc      bp                          
  {0A5D1}  and      byte ptr [di + 0x41], cl    
  {0A5D4}  and      byte ptr [di + 0x4f], cl    
  {0A5D7}  push     di                          
  {0A5D8}  pop      cx                          
  {0A5D9}  dec      ax                          
  {0A5DA}  dec      dx                          
  {0A5DB}  inc      bp                          
  {0A5DC}  push     bx                          
  {0A5DD}  push     sp                          
  {0A5DE}  inc      bp                          
  {0A5DF}  push     bx                          
  {0A5E0}  and      byte ptr [bx + 0x20], dl    
  {0A5E3}  push     ax                          
  {0A5E4}  dec      cx                          
  {0A5E5}  inc      bp                          
  {0A5E6}  dec      bx                          
  {0A5E7}  inc      cx                          
  {0A5E8}  push     dx                          
  {0A5E9}  dec      si                          
  {0A5EA}  dec      cx                          
  {0A5EB}  and      byte ptr [si], ch           
  {0A5ED}  and      byte ptr [bp + di + 0x4b], dl
  {0A5F0}  dec      sp                          
  {0A5F1}  inc      bp                          
  {0A5F2}  push     ax                          
  {0A5F3}  and      byte ptr [bx + si + 0x52], dl
  {0A5F6}  pop      dx                          
  {0A5F7}  inc      bp                          
  {0A5F8}  push     bx                          
  {0A5F9}  dec      cx                          
  {0A5FA}  inc      cx                          
  {0A5FB}  dec      bx                          
  {0A5FC}  dec      si                          
  {0A5FD}  dec      cx                          
  {0A5FE}  inc      bp                          
  {0A5FF}  push     sp                          
  {0A600}  pop      cx                          
  {0A601}  and      byte ptr [bp + si + 0x45], cl
  {0A604}  push     bx                          
  {0A605}  push     sp                          
  {0A606}  and      byte ptr [bx + si + 0x52], dl
  {0A609}  pop      dx                          
  {0A60A}  pop      cx                          
  {0A60B}  dec      dx                          
  {0A60C}  inc      bp                          
  {0A60D}  dec      bp                          
  {0A60E}  dec      si                          
  {0A60F}  pop      cx                          
  {0A610}  dec      bp                          
  {0A611}  and      byte ptr [bp + si + 0x41], bl
  {0A614}  push     ax                          
  {0A615}  inc      cx                          
  {0A616}  inc      bx                          
  {0A617}  dec      ax                          
  {0A618}  inc      bp                          
  {0A619}  dec      bp                          
  {0A61A}  and      byte ptr [bp + di + 0x48], al
  {0A61D}  dec      sp                          
  {0A61E}  inc      bp                          
  {0A61F}  inc      dx                          
  {0A620}  inc      cx                          
  {0A621}  and      byte ptr [bp + si], bh      
  {0A623}  push     ax                          
  {0A624}  dec      cx                          
  {0A625}  inc      bp                          
  {0A626}  dec      bx                          
  {0A627}  inc      cx                          
  {0A628}  push     dx                          
  {0A629}  pop      dx                          
  {0A62A}  and      byte ptr [di + 0x49], cl    
  {0A62D}  dec      sp                          
  {0A62E}  dec      di                          
  {0A62F}  and      byte ptr [bp + di + 0x49], dl
  {0A632}  inc      bp                          
  {0A633}  and      byte ptr [bp + 0x41], cl    
  {0A636}  and      byte ptr [bp + di + 0x49], al
  {0A639}  inc      bp                          
  {0A63A}  inc      dx                          
  {0A63B}  dec      cx                          
  {0A63C}  inc      bp                          
  {0A63D}  and      byte ptr [bx + si + 0x41], dl
  {0A640}  push     sp                          
  {0A641}  push     dx                          
  {0A642}  pop      dx                          
  {0A643}  pop      cx                          
  {0A644}  and      byte ptr [bx + 0x59], dl    
  {0A647}  inc      bx                          
  {0A648}  dec      cx                          
  {0A649}  inc      bp                          
  {0A64A}  push     dx                          
  {0A64B}  inc      cx                          
  {0A64C}  dec      dx                          
  {0A64D}  inc      cx                          
  {0A64E}  inc      bx                          
  {0A64F}  and      byte ptr [di + 0x41], cl    
  {0A652}  dec      bx                          
  {0A653}  inc      bp                          
  {0A654}  and      byte ptr [bp + si + 0x20], bl
  {0A657}  push     sp                          
  {0A658}  push     di                          
  {0A659}  inc      cx                          
  {0A65A}  push     dx                          
  {0A65B}  pop      dx                          
  {0A65C}  pop      cx                          
  {0A65D}  and      cx, word ptr [bp + 0x41]    
  {0A660}  and      byte ptr [bp + di + 0x43], dl
  {0A663}  dec      cx                          
  {0A664}  inc      cx                          
  {0A665}  dec      si                          
  {0A666}  dec      cx                          
  {0A667}  inc      bp                          
  {0A668}  and      byte ptr [bx + si], ah      
  {0A66A}  dec      dx                          
  {0A66B}  inc      bp                          
  {0A66C}  push     bx                          
  {0A66D}  push     sp                          
  {0A66E}  and      byte ptr [bx + si + 0x4c], dl
  {0A671}  inc      cx                          
  {0A672}  dec      bx                          
  {0A673}  inc      cx                          
  {0A674}  push     sp                          
  {0A675}  and      byte ptr [bp + di + 0x41], al
  {0A678}  dec      sp                          
  {0A679}  pop      cx                          
  {0A67A}  and      byte ptr [bx + 0x20], dl    
  {0A67D}  dec      bp                          
  {0A67E}  inc      cx                          
  {0A67F}  inc      bx                          
  {0A680}  inc      bp                          
  {0A681}  cmp      cl, byte ptr [si + 0x49]    
  {0A684}  push     bx                          
  {0A685}  push     sp                          
  {0A686}  inc      cx                          
  {0A687}  sub      ax, 0x494c                  
  {0A68A}  push     bx                          
  {0A68B}  push     sp                          
  {0A68C}  inc      cx                          
  {0A68D}  and      byte ptr [si + 0x4f], al    
  {0A690}  push     bx                          
  {0A691}  push     sp                          
  {0A692}  inc      bp                          
  {0A693}  push     ax                          
  {0A694}  dec      si                          
  {0A695}  pop      cx                          
  {0A696}  inc      bx                          
  {0A697}  dec      ax                          
  {0A698}  and      byte ptr [bp + si + 0x5a], dl
  {0A69B}  inc      bp                          
  {0A69C}  inc      bx                          
  {0A69D}  pop      dx                          
  {0A69E}  pop      cx                          
  {0A69F}  sub      al, 0x4b                    
  {0A6A1}  push     bp                          
  {0A6A2}  push     ax                          
  {0A6A3}  and      byte ptr [bx + si], ch      
  {0A6A5}  push     ax                          
  {0A6A6}  push     dx                          
  {0A6A7}  pop      dx                          
  {0A6A8}  inc      bp                          
  {0A6A9}  inc      sp                          
  {0A6AA}  dec      bp                          
  {0A6AB}  dec      cx                          
  {0A6AC}  dec      di                          
  {0A6AD}  push     sp                          
  {0A6AE}  sub      word ptr [di], bp           
  {0A6B0}  dec      bx                          
  {0A6B1}  push     bp                          
  {0A6B2}  push     ax                          
  {0A6B3}  push     bp                          
  {0A6B4}  dec      dx                          
  {0A6B5}  inc      bp                          
  {0A6B6}  push     bx                          
  {0A6B7}  pop      dx                          
  {0A6B8}  and      byte ptr [bx + 0x4f], al    
  {0A6BB}  and      byte ptr [bx + di], dh      
  {0A6BD}  push     ax                          
  {0A6BE}  dec      di                          
  {0A6BF}  and      byte ptr [bx + 0x44], cl    
  {0A6C2}  inc      bp                          
  {0A6C3}  dec      dx                          
  {0A6C4}  push     bx                          
  {0A6C5}  inc      bx                          
  {0A6C6}  dec      cx                          
  {0A6C7}  push     bp                          
  {0A6C8}  and      byte ptr [bx + 0x44], cl    
  {0A6CB}  and      byte ptr [si + 0x41], cl    
  {0A6CE}  inc      sp                          
  {0A6CF}  pop      cx                          
  {0A6D0}  and      byte ptr [bp + si + 0x45], dl
  {0A6D3}  dec      bx                          
  {0A6D4}  dec      sp                          
  {0A6D5}  inc      cx                          
  {0A6D6}  dec      bp                          
  {0A6D7}  inc      cx                          
  {0A6D8}  inc      bx                          
  {0A6D9}  dec      dx                          
  {0A6DA}  dec      cx                          
  {0A6DB}  and      byte ptr [bp + 0x49], cl    
  {0A6DE}  inc      bp                          
  {0A6DF}  and      byte ptr [di + 0x57], dl    
  {0A6E2}  pop      dx                          
  {0A6E3}  inc      di                          
  {0A6E4}  dec      sp                          
  {0A6E5}  inc      bp                          
  {0A6E6}  inc      sp                          
  {0A6E7}  dec      si                          
  {0A6E8}  dec      cx                          
  {0A6E9}  inc      cx                          
  {0A6EA}  and      byte ptr [bp + di + 0x49], dl
  {0A6ED}  inc      bp                          
  {0A6EE}  pop      ss                          
  {0A6EF}  pop      dx                          
  {0A6F0}  inc      cx                          
  {0A6F1}  inc      bx                          
  {0A6F2}  dec      ax                          
  {0A6F3}  dec      di                          
  {0A6F4}  inc      sp                          
  {0A6F5}  sub      ax, 0x4c55                  
  {0A6F8}  dec      cx                          
  {0A6F9}  inc      bx                          
  {0A6FA}  inc      cx                          
  {0A6FB}  and      byte ptr [bp + di + 0x4b], dl
  {0A6FE}  dec      sp                          
  {0A6FF}  inc      bp                          
  {0A700}  push     ax                          
  {0A701}  dec      cx                          
  {0A702}  dec      bx                          
  {0A703}  dec      di                          
  {0A704}  push     di                          
  {0A705}  inc      cx                          
  {0A706}  xor      cl, byte ptr [bp + si + 0x45]
  {0A709}  push     bx                          
  {0A70A}  push     sp                          
  {0A70B}  inc      bp                          
  {0A70C}  push     bx                          
  {0A70D}  and      byte ptr [bx + 0x20], dl    
  {0A710}  pop      dx                          
  {0A711}  inc      dx                          
  {0A712}  push     dx                          
  {0A713}  dec      di                          
  {0A714}  dec      dx                          
  {0A715}  dec      di                          
  {0A716}  push     di                          
  {0A717}  dec      si                          
  {0A718}  dec      cx                          
  {0A719}  and      byte ptr [di], ch           
  {0A71B}  and      byte ptr [bp + di + 0x4b], dl
  {0A71E}  dec      sp                          
  {0A71F}  inc      bp                          
  {0A720}  push     ax                          
  {0A721}  and      byte ptr [bp + 0x49], cl    
  {0A724}  inc      bp                          
  {0A725}  inc      sp                          
  {0A726}  inc      cx                          
  {0A727}  push     di                          
  {0A728}  dec      si                          
  {0A729}  dec      di                          
  {0A72A}  and      byte ptr [bp + si + 0x4f], bl
  {0A72D}  push     bx                          
  {0A72E}  push     sp                          
  {0A72F}  inc      cx                          
  {0A730}  dec      sp                          
  {0A731}  and      byte ptr [bx + 0x54], cl    
  {0A734}  push     di                          
  {0A735}  inc      cx                          
  {0A736}  push     dx                          
  {0A737}  push     sp                          
  {0A738}  pop      cx                          
  {0A739}  cmp      dl, byte ptr [bp + di + 0x50]
  {0A73C}  push     dx                          
  {0A73D}  pop      dx                          
  {0A73E}  inc      bp                          
  {0A73F}  inc      sp                          
  {0A740}  inc      cx                          
  {0A741}  push     di                          
  {0A742}  inc      bx                          
  {0A743}  inc      cx                          
  {0A744}  sub      byte ptr [bp + si + 0x52], al
  {0A747}  pop      dx                          
  {0A748}  pop      cx                          
  {0A749}  inc      sp                          
  {0A74A}  dec      bx                          
  {0A74B}  inc      cx                          
  {0A74C}  and      byte ptr [bx + di + 0x55], al
  {0A74F}  push     dx                          
  {0A750}  inc      cx                          
  {0A751}  sub      word ptr [bx + si], sp      
  {0A753}  push     bx                          
  {0A754}  push     sp                          
  {0A755}  inc      cx                          
  {0A756}  push     dx                          
  {0A757}  inc      cx                          
  {0A758}  and      byte ptr [bp + di + 0x49], dl
  {0A75B}  inc      bp                          
  {0A75C}  and      byte ptr [bx + 0x43], dl    
  {0A75F}  dec      cx                          
  {0A760}  push     bx                          
  {0A761}  dec      si                          
  {0A762}  inc      cx                          
  {0A763}  inc      bx                          
  {0A764}  and      byte ptr [bp + di + 0x49], al
  {0A767}  and      byte ptr [bp + si + 0x41], cl
  {0A76A}  dec      bx                          
  {0A76B}  dec      cx                          
  {0A76C}  push     bx                          
  {0A76D}  and      byte ptr [si + 0x4f], dl    
  {0A770}  push     di                          
  {0A771}  inc      cx                          
  {0A772}  push     dx                          
  {0A773}  and      byte ptr [0x414e], dl       
  {0A777}  and      byte ptr [bp + di + 0x43], dl
  {0A77A}  dec      cx                          
  {0A77B}  inc      cx                          
  {0A77C}  dec      si                          
  {0A77D}  dec      cx                          
  {0A77E}  inc      bp                          
  {0A77F}  and      byte ptr [bx + 0x49], dl    
  {0A782}  push     bx                          
  {0A783}  dec      cx                          
  {0A784}  and      byte ptr [bx + si + 0x4c], dl
  {0A787}  inc      cx                          
  {0A788}  dec      bx                          
  {0A789}  inc      cx                          
  {0A78A}  push     sp                          
  {0A78B}  pop      ss                          
  {0A78C}  push     di                          
  {0A78D}  push     bx                          
  {0A78E}  inc      bx                          
  {0A78F}  dec      ax                          
  {0A790}  dec      di                          
  {0A791}  inc      sp                          
  {0A792}  sub      ax, 0x4c55                  
  {0A795}  dec      cx                          
  {0A796}  inc      bx                          
  {0A797}  inc      cx                          
  {0A798}  and      byte ptr [bp + di + 0x4b], dl
  {0A79B}  dec      sp                          
  {0A79C}  inc      bp                          
  {0A79D}  push     ax                          
  {0A79E}  dec      cx                          
  {0A79F}  dec      bx                          
  {0A7A0}  dec      di                          
  {0A7A1}  push     di                          
  {0A7A2}  inc      cx                          
  {0A7A3}  cmp      al, 0x4c                    
  {0A7A5}  dec      cx                          
  {0A7A6}  push     bx                          
  {0A7A7}  push     sp                          
  {0A7A8}  inc      cx                          
  {0A7A9}  sub      al, 0x4b                    
  {0A7AB}  push     bp                          
  {0A7AC}  push     ax                          
  {0A7AD}  and      byte ptr [bx + si + 0x58], bl
  {0A7B0}  pop      ax                          
  {0A7B1}  and      byte ptr [bx + di + 0x20], cl
  {0A7B4}  push     bx                          
  {0A7B5}  push     ax                          
  {0A7B6}  push     dx                          
  {0A7B7}  pop      dx                          
  {0A7B8}  inc      bp                          
  {0A7B9}  inc      sp                          
  {0A7BA}  inc      cx                          
  {0A7BB}  dec      dx                          
  {0A7BC}  and      byte ptr [bx + si + 0x58], bl
  {0A7BF}  pop      ax                          
  {0A7C0}  and      byte ptr [si + 0x4f], dl    
  {0A7C3}  and      byte ptr [bp + si + 0x45], cl
  {0A7C6}  push     bx                          
  {0A7C7}  push     sp                          
  {0A7C8}  and      byte ptr [si + 0x4f], al    
  {0A7CB}  push     bx                          
  {0A7CC}  push     sp                          
  {0A7CD}  inc      bp                          
  {0A7CE}  push     ax                          
  {0A7CF}  dec      si                          
  {0A7D0}  inc      bp                          
  {0A7D1}  and      byte ptr [bx + 0x20], dl    
  {0A7D4}  push     sp                          
  {0A7D5}  pop      cx                          
  {0A7D6}  dec      bp                          
  {0A7D7}  and      byte ptr [bp + di + 0x4b], dl
  {0A7DA}  dec      sp                          
  {0A7DB}  inc      bp                          
  {0A7DC}  push     ax                          
  {0A7DD}  dec      cx                          
  {0A7DE}  inc      bp                          
  {0A7DF}  and      byte ptr [bp + si + 0x57], al
  {0A7E2}  push     bx                          
  {0A7E3}  pop      dx                          
  {0A7E4}  inc      bp                          
  {0A7E5}  inc      sp                          
  {0A7E6}  dec      sp                          
  {0A7E7}  inc      bp                          
  {0A7E8}  push     bx                          
  {0A7E9}  and      byte ptr [si + 0x4f], al    
  {0A7EC}  and      byte ptr [bp + di + 0x4b], dl
  {0A7EF}  dec      sp                          
  {0A7F0}  inc      bp                          
  {0A7F1}  push     ax                          
  {0A7F2}  push     bp                          
  {0A7F3}  and      byte ptr [bx + 0x49], dl    
  {0A7F6}  inc      bp                          
  {0A7F7}  dec      sp                          
  {0A7F8}  dec      di                          
  {0A7F9}  inc      dx                          
  {0A7FA}  push     dx                          
  {0A7FB}  inc      cx                          
  {0A7FC}  dec      si                          
  {0A7FD}  pop      dx                          
  {0A7FE}  dec      di                          
  {0A7FF}  push     di                          
  {0A800}  inc      bp                          
  {0A801}  inc      di                          
  {0A802}  dec      di                          
  {0A803}  sub      al, 0x53                    
  {0A805}  push     sp                          
  {0A806}  push     di                          
  {0A807}  dec      cx                          
  {0A808}  inc      bp                          
  {0A809}  push     dx                          
  {0A80A}  inc      sp                          
  {0A80B}  pop      dx                          
  {0A80C}  inc      cx                          
  {0A80D}  push     bx                          
  {0A80E}  pop      dx                          
  {0A80F}  and      byte ptr [bx + 0x42], cl    
  {0A812}  inc      bp                          
  {0A813}  inc      bx                          
  {0A814}  dec      si                          
  {0A815}  dec      di                          
  {0A816}  push     bx                          
  {0A817}  inc      bx                          
  {0A818}  and      byte ptr [bp + di + 0x50], dl
  {0A81B}  push     dx                          
  {0A81C}  pop      dx                          
  {0A81D}  inc      bp                          
  {0A81E}  inc      sp                          
  {0A81F}  inc      cx                          
  {0A820}  push     di                          
  {0A821}  inc      bx                          
  {0A822}  pop      cx                          
  {0A823}  sub      byte ptr [bp + 0x41], cl    
  {0A826}  and      byte ptr [si + 0x52], al    
  {0A829}  pop      dx                          
  {0A82A}  push     di                          
  {0A82B}  dec      cx                          
  {0A82C}  inc      cx                          
  {0A82D}  inc      bx                          
  {0A82E}  dec      ax                          
  {0A82F}  and      byte ptr [bp + si + 0x4f], bl
  {0A832}  push     bx                          
  {0A833}  push     sp                          
  {0A834}  inc      cx                          
  {0A835}  dec      sp                          
  {0A836}  inc      cx                          
  {0A837}  and      byte ptr [bx + 0x59], dl    
  {0A83A}  push     di                          
  {0A83B}  dec      cx                          
  {0A83C}  inc      bp                          
  {0A83D}  push     bx                          
  {0A83E}  pop      dx                          
  {0A83F}  dec      di                          
  {0A840}  dec      si                          
  {0A841}  inc      cx                          
  {0A842}  and      byte ptr [bx + 0x59], dl    
  {0A845}  push     di                          
  {0A846}  dec      cx                          
  {0A847}  inc      bp                          
  {0A848}  push     bx                          
  {0A849}  pop      dx                          
  {0A84A}  dec      bx                          
  {0A84B}  inc      cx                          
  {0A84C}  .byte    0x0f                        
  {0A84D}  push     ax                          
  {0A84E}  inc      cx                          
  {0A84F}  push     sp                          
  {0A850}  push     dx                          
  {0A851}  pop      dx                          
  {0A852}  and      byte ptr [bx + 0x59], dl    
  {0A855}  push     di                          
  {0A856}  dec      cx                          
  {0A857}  inc      bp                          
  {0A858}  push     bx                          
  {0A859}  pop      dx                          
  {0A85A}  dec      bx                          
  {0A85B}  inc      cx                          
  {0A85C}  push     ds                          
  {0A85D}  sub      ah, byte ptr [bx + si]      
  {0A85F}  push     bx                          
  {0A860}  dec      bx                          
  {0A861}  dec      sp                          
  {0A862}  inc      bp                          
  {0A863}  push     ax                          
  {0A864}  and      byte ptr [bx + 0x54], cl    
  {0A867}  push     di                          
  {0A868}  inc      cx                          
  {0A869}  push     dx                          
  {0A86A}  push     sp                          
  {0A86B}  pop      cx                          
  {0A86C}  and      byte ptr [si + 0x4f], al    
  {0A86F}  and      byte ptr [bx + 0x44], cl    
  {0A872}  push     di                          
  {0A873}  dec      di                          
  {0A874}  dec      sp                          
  {0A875}  inc      cx                          
  {0A876}  dec      si                          
  {0A877}  dec      cx                          
  {0A878}  inc      cx                          
  {0A879}  and      byte ptr [bp + si], ch      
  {0A87B}  dec      ax                          
  {0A87C}  push     di                          
  {0A87D}  inc      bx                          
  {0A87E}  dec      ax                          
  {0A87F}  dec      di                          
  {0A880}  inc      sp                          
  {0A881}  pop      dx                          
  {0A882}  dec      cx                          
  {0A883}  push     bx                          
  {0A884}  pop      dx                          
  {0A885}  and      byte ptr [si + 0x4f], al    
  {0A888}  and      byte ptr [bp + di + 0x4b], dl
  {0A88B}  dec      sp                          
  {0A88C}  inc      bp                          
  {0A88D}  push     ax                          
  {0A88E}  push     bp                          
  {0A88F}  and      byte ptr [bx + di + 0x4c], al
  {0A892}  inc      bp                          
  {0A893}  and      byte ptr [bp + 0x49], cl    
  {0A896}  inc      bx                          
  {0A897}  pop      dx                          
  {0A898}  inc      bp                          
  {0A899}  inc      di                          
  {0A89A}  dec      di                          
  {0A89B}  and      byte ptr [si + 0x55], dl    
  {0A89E}  and      byte ptr [bp + 0x49], cl    
  {0A8A1}  inc      bp                          
  {0A8A2}  and      byte ptr [di + 0x41], cl    
  {0A8A5}  and      byte ptr [bx + si + 0x4f], dl
  {0A8A8}  pop      dx                          
  {0A8A9}  inc      cx                          
  {0A8AA}  and      byte ptr [bp + di + 0x50], dl
  {0A8AD}  push     dx                          
  {0A8AE}  pop      dx                          
  {0A8AF}  inc      bp                          
  {0A8B0}  inc      sp                          
  {0A8B1}  inc      cx                          
  {0A8B2}  push     di                          
  {0A8B3}  inc      bx                          
  {0A8B4}  inc      cx                          
  {0A8B5}  and      byte ptr [bx + di + 0x20], cl
  {0A8B8}  dec      dx                          
  {0A8B9}  inc      bp                          
  {0A8BA}  inc      di                          
  {0A8BB}  dec      di                          
  {0A8BC}  and      byte ptr [si + 0x4f], dl    
  {0A8BF}  push     di                          
  {0A8C0}  inc      cx                          
  {0A8C1}  push     dx                          
  {0A8C2}  inc      bp                          
  {0A8C3}  dec      bp                          
  {0A8C4}  sbb      al, 0x2a                    
  {0A8C6}  and      byte ptr [bx + 0x54], cl    
  {0A8C9}  push     di                          
  {0A8CA}  inc      cx                          
  {0A8CB}  push     dx                          
  {0A8CC}  push     sp                          
  {0A8CD}  inc      bp                          
  {0A8CE}  and      byte ptr [bp + si + 0x20], bl
  {0A8D1}  push     ax                          
  {0A8D2}  dec      di                          
  {0A8D3}  push     di                          
  {0A8D4}  dec      di                          
  {0A8D5}  inc      sp                          
  {0A8D6}  push     bp                          
  {0A8D7}  and      byte ptr [bp + di + 0x48], al
  {0A8DA}  dec      di                          
  {0A8DB}  push     dx                          
  {0A8DC}  dec      di                          
  {0A8DD}  inc      dx                          
  {0A8DE}  pop      cx                          
  {0A8DF}  and      byte ptr [bp + si], ch      
  {0A8E1}  aaa                                  
  {0A8E2}  dec      cx                          
  {0A8E3}  inc      sp                          
  {0A8E4}  inc      cx                          
  {0A8E5}  inc      bx                          
  {0A8E6}  and      byte ptr [di + 0x4c], dl    
  {0A8E9}  dec      cx                          
  {0A8EA}  inc      bx                          
  {0A8EB}  inc      cx                          
  {0A8EC}  and      byte ptr [si + 0x4c], al    
  {0A8EF}  push     bp                          
  {0A8F0}  inc      di                          
  {0A8F1}  inc      cx                          
  {0A8F2}  and      byte ptr [bp + 0x41], cl    
  {0A8F5}  and      byte ptr [bx + si + 0x4f], dl
  {0A8F8}  dec      sp                          
  {0A8F9}  dec      si                          
  {0A8FA}  dec      di                          
  {0A8FB}  inc      bx                          
  {0A8FC}  and      byte ptr [bp + di + 0x50], dl
  {0A8FF}  dec      di                          
  {0A900}  push     bx                          
  {0A901}  push     sp                          
  {0A902}  push     dx                          
  {0A903}  pop      dx                          
  {0A904}  inc      bp                          
  {0A905}  inc      di                          
  {0A906}  inc      cx                          
  {0A907}  push     bx                          
  {0A908}  pop      dx                          
  {0A909}  and      byte ptr [si + 0x4f], al    
  {0A90C}  dec      sp                          
  {0A90D}  dec      cx                          
  {0A90E}  dec      si                          
  {0A90F}  inc      bp                          
  {0A910}  and      byte ptr [bp + si + 0x4f], dl
  {0A913}  pop      dx                          
  {0A914}  push     dx                          
  {0A915}  pop      cx                          
  {0A916}  push     di                          
  {0A917}  inc      bp                          
  {0A918}  dec      bx                          
  {0A919}  and      ax, 0x2041                  
  {0A91C}  dec      si                          
  {0A91D}  inc      cx                          
  {0A91E}  and      byte ptr [bx + si + 0x4f], dl
  {0A921}  dec      sp                          
  {0A922}  dec      di                          
  {0A923}  inc      sp                          
  {0A924}  dec      si                          
  {0A925}  dec      cx                          
  {0A926}  inc      bp                          
  {0A927}  and      byte ptr [bp + si + 0x41], al
  {0A92A}  push     bx                          
  {0A92B}  dec      si                          
  {0A92C}  dec      cx                          
  {0A92D}  dec      di                          
  {0A92E}  push     di                          
  {0A92F}  pop      cx                          
  {0A930}  and      byte ptr [bx + 0x41], al    
  {0A933}  dec      dx                          
  {0A934}  adc      dl, byte ptr cs:[bx + 0x53] 
  {0A942}  inc      bx                          
  {0A943}  dec      ax                          
  {0A944}  dec      di                          
  {0A945}  inc      sp                          
  {0A946}  sub      ax, 0x4c55                  
  {0A949}  dec      cx                          
  {0A94A}  inc      bx                          
  {0A94B}  inc      cx                          
  {0A94C}  and      byte ptr [si + 0x4c], al    
  {0A94F}  push     bp                          
  {0A950}  inc      di                          
  {0A951}  inc      cx                          
  {0A952}  push     ss                          
  {0A953}  push     ax                          
  {0A954}  dec      di                          
  {0A955}  dec      sp                          
  {0A956}  dec      si                          
  {0A957}  dec      di                          
  {0A958}  inc      bx                          
  {0A959}  sub      ax, 0x4f44                  
  {0A95C}  dec      sp                          
  {0A95D}  dec      cx                          
  {0A95E}  dec      si                          
  {0A95F}  inc      cx                          
  {0A960}  and      byte ptr [bp + si + 0x4f], dl
  {0A963}  pop      dx                          
  {0A964}  push     dx                          
  {0A965}  pop      cx                          
  {0A966}  push     di                          
  {0A967}  inc      bp                          
  {0A968}  dec      bx                          
  {0A969}  cmp      ax, word ptr [bp + di + 0x5a]
  {0A96C}  inc      bp                          
  {0A96D}  push     bx                          
  {0A96E}  inc      bx                          
  {0A96F}  and      byte ptr [si + 0x4f], dl    
  {0A972}  and      byte ptr [bx + di + 0x52], al
  {0A975}  inc      bp                          
  {0A976}  dec      si                          
  {0A977}  inc      cx                          
  {0A978}  and      byte ptr [bx + si + 0x52], dl
  {0A97B}  pop      dx                          
  {0A97C}  pop      cx                          
  {0A97D}  inc      bx                          
  {0A97E}  dec      ax                          
  {0A97F}  dec      di                          
  {0A980}  inc      sp                          
  {0A981}  pop      dx                          
  {0A982}  inc      cx                          
  {0A983}  and      byte ptr [si + 0x55], dl    
  {0A986}  and      byte ptr [si + 0x41], dl    
  {0A989}  inc      bx                          
  {0A98A}  pop      cx                          
  {0A98B}  and      byte ptr [bp + si + 0x41], cl
  {0A98E}  dec      bx                          
  {0A98F}  and      byte ptr [si + 0x59], dl    
  {0A992}  and      byte ptr [bx + si + 0x4f], dl
  {0A995}  and      byte ptr [si + 0x4f], dl    
  {0A998}  and      byte ptr [bx + di + 0x42], al
  {0A99B}  pop      cx                          
  {0A99C}  and      byte ptr [di + 0x4f], cl    
  {0A99F}  push     dx                          
  {0A9A0}  inc      sp                          
  {0A9A1}  dec      di                          
  {0A9A2}  push     di                          
  {0A9A3}  inc      cx                          
  {0A9A4}  inc      bx                          
  {0A9A5}  dec      cx                          
  {0A9A6}  and      word ptr [bx + di], sp      
  {0A9A8}  and      word ptr [bx + di], sp      
  {0A9AA}  and      word ptr [bx + 0x20], cx    
  {0A9AD}  dec      si                          
  {0A9AE}  dec      cx                          
  {0A9AF}  inc      bp                          
  {0A9B0}  and      word ptr [bx + di], sp      
  {0A9B2}  and      word ptr [bx + di], sp      
  {0A9B4}  and      word ptr [bx + di], sp      
  {0A9B6}  and      word ptr [bx + di], sp      
  {0A9B8}  and      byte ptr [si + 0x4f], dl    
  {0A9BB}  and      byte ptr [bp + di + 0x54], dl
  {0A9BE}  push     dx                          
  {0A9BF}  inc      cx                          
  {0A9C0}  push     bx                          
  {0A9C1}  pop      dx                          
  {0A9C2}  dec      si                          
  {0A9C3}  inc      bp                          
  {0A9C4}  and      word ptr [bx + di], sp      
  {0A9C6}  and      word ptr [bx + si], sp      
  {0A9C8}  sub      byte ptr [bx + si], ah      
  {0A9CA}  push     bx                          
  {0A9CB}  dec      cx                          
  {0A9CC}  inc      bp                          
  {0A9CD}  and      byte ptr [si + 0x41], al    
  {0A9D0}  dec      sp                          
  {0A9D1}  and      byte ptr [bp + 0x41], cl    
  {0A9D4}  inc      dx                          
  {0A9D5}  push     dx                          
  {0A9D6}  inc      cx                          
  {0A9D7}  inc      bx                          
  {0A9D8}  and      byte ptr [bx + di], ch      
  {0A9DA}  and      byte ptr [bx + si], ch      
  {0A9DC}  dec      si                          
  {0A9DD}  inc      cx                          
  {0A9DE}  push     ax                          
  {0A9DF}  dec      cx                          
  {0A9E0}  push     bx                          
  {0A9E1}  pop      dx                          
  {0A9E2}  and      byte ptr [bx + si + 0x41], dl
  {0A9E5}  push     sp                          
  {0A9E6}  push     dx                          
  {0A9E7}  pop      dx                          
  {0A9E8}  and      byte ptr [bx + si + 0x4c], dl
  {0A9EB}  inc      cx                          
  {0A9EC}  dec      bx                          
  {0A9ED}  inc      cx                          
  {0A9EE}  push     sp                          
  {0A9EF}  adc      word ptr [bp + 0x41], cx    
  {0A9F2}  and      byte ptr [bx + si + 0x4c], dl
  {0A9F5}  inc      cx                          
  {0A9F6}  dec      bx                          
  {0A9F7}  inc      cx                          
  {0A9F8}  inc      bx                          
  {0A9F9}  dec      cx                          
  {0A9FA}  inc      bp                          
  {0A9FB}  and      byte ptr [bx + si + 0x49], dl
  {0A9FE}  push     bx                          
  {0A9FF}  pop      dx                          
  {0AA00}  inc      bp                          
  {0AA01}  inc      si                          
  {0AA02}  dec      si                          
  {0AA03}  dec      cx                          
  {0AA04}  inc      bp                          
  {0AA05}  and      byte ptr [bx + di + 0x54], al
  {0AA08}  inc      cx                          
  {0AA09}  dec      bx                          
  {0AA0A}  push     bp                          
  {0AA0B}  dec      dx                          
  {0AA0C}  and      byte ptr [si + 0x55], cl    
  {0AA0F}  inc      sp                          
  {0AA10}  pop      dx                          
  {0AA11}  dec      cx                          
  {0AA12}  and      byte ptr [bx + di + 0x20], cl
  {0AA15}  pop      dx                          
  {0AA16}  push     di                          
  {0AA17}  dec      cx                          
  {0AA18}  inc      bp                          
  {0AA19}  push     dx                          
  {0AA1A}  pop      dx                          
  {0AA1B}  inc      cx                          
  {0AA1C}  push     sp                          
  {0AA1D}  and      byte ptr [bp + si + 0x20], bl
  {0AA20}  pop      dx                          
  {0AA21}  dec      di                          
  {0AA22}  dec      di                          
  {0AA23}  and      byte ptr [bp + di + 0x48], al
  {0AA26}  pop      cx                          
  {0AA27}  inc      dx                          
  {0AA28}  inc      cx                          
  {0AA29}  and      byte ptr [bp + si + 0x45], bl
  {0AA2C}  and      byte ptr [di + 0x41], cl    
  {0AA2F}  push     bx                          
  {0AA30}  pop      dx                          
  {0AA31}  and      byte ptr [bp + di], dh      
  {0AA33}  and      byte ptr [si + 0x45], cl    
  {0AA36}  push     si                          
  {0AA37}  inc      bp                          
  {0AA38}  dec      sp                          
  {0AA39}  sub      byte ptr [bx + si], ah      
  {0AA3B}  dec      sp                          
  {0AA3C}  push     bp                          
  {0AA3D}  inc      dx                          
  {0AA3E}  and      byte ptr [bx + 0x59], dl    
  {0AA41}  pop      dx                          
  {0AA42}  inc      bp                          
  {0AA43}  dec      dx                          
  {0AA44}  and      byte ptr [bp + si], bh      
  {0AA46}  push     ax                          
  {0AA47}  sub      word ptr [si], dx           
  {0AA49}  push     ax                          
  {0AA4A}  dec      di                          
  {0AA4B}  dec      sp                          
  {0AA4C}  dec      di                          
  {0AA4D}  inc      sp                          
  {0AA4E}  dec      si                          
  {0AA4F}  dec      cx                          
  {0AA50}  inc      bp                          
  {0AA51}  sub      ax, 0x4c55                  
  {0AA54}  dec      cx                          
  {0AA55}  inc      bx                          
  {0AA56}  inc      cx                          
  {0AA57}  and      byte ptr [si + 0x4c], al    
  {0AA5A}  push     bp                          
  {0AA5B}  inc      di                          
  {0AA5C}  inc      cx                          
  {0AA5D}  or       al, 0x50                    
  {0AA5F}  dec      di                          
  {0AA60}  dec      sp                          
  {0AA61}  dec      si                          
  {0AA62}  dec      di                          
  {0AA63}  inc      bx                          
  {0AA64}  sub      ax, 0x5241                  
  {0AA67}  inc      bp                          
  {0AA68}  dec      si                          
  {0AA69}  inc      cx                          
  {0AA6A}  sub      al, 0x57                    
  {0AA6C}  and      byte ptr [si + 0x57], dl    
  {0AA6F}  pop      cx                          
  {0AA70}  dec      bp                          
  {0AA71}  and      byte ptr [bx + si + 0x4f], dl
  {0AA74}  dec      bx                          
  {0AA75}  dec      di                          
  {0AA76}  dec      dx                          
  {0AA77}  push     bp                          
  {0AA78}  and      byte ptr [si + 0x45], cl    
  {0AA7B}  pop      dx                          
  {0AA7C}  pop      cx                          
  {0AA7D}  and      byte ptr [bx + di], ah      
  {0AA7F}  push     bx                          
  {0AA80}  push     sp                          
  {0AA81}  inc      cx                          
  {0AA82}  push     dx                          
  {0AA83}  pop      cx                          
  {0AA84}  and      word ptr [bx + si], sp      
  {0AA86}  pop      dx                          
  {0AA87}  inc      cx                          
  {0AA88}  push     dx                          
  {0AA89}  inc      sp                          
  {0AA8A}  pop      dx                          
  {0AA8B}  inc      bp                          
  {0AA8C}  push     di                          
  {0AA8D}  dec      cx                          
  {0AA8E}  inc      cx                          
  {0AA8F}  dec      sp                          
  {0AA90}  pop      cx                          
  {0AA91}  and      byte ptr [di + 0x49], cl    
  {0AA94}  inc      bp                          
  {0AA95}  inc      bx                          
  {0AA96}  pop      dx                          
  {0AA97}  daa                                  
  {0AA98}  push     di                          
  {0AA99}  and      byte ptr [si + 0x59], dl    
  {0AA9C}  dec      bp                          
  {0AA9D}  and      byte ptr [bx + si + 0x4f], dl
  {0AAA0}  dec      bx                          
  {0AAA1}  dec      di                          
  {0AAA2}  dec      dx                          
  {0AAA3}  push     bp                          
  {0AAA4}  and      byte ptr [bp + si + 0x4e], bl
  {0AAA7}  inc      cx                          
  {0AAA8}  dec      dx                          
  {0AAA9}  inc      sp                          
  {0AAAA}  push     bp                          
  {0AAAB}  dec      dx                          
  {0AAAC}  inc      bp                          
  {0AAAD}  and      byte ptr [bp + di + 0x49], dl
  {0AAB0}  inc      bp                          
  {0AAB1}  and      byte ptr [bx + di], ah      
  {0AAB3}  dec      bp                          
  {0AAB4}  inc      cx                          
  {0AAB5}  dec      sp                          
  {0AAB6}  inc      cx                          
  {0AAB7}  and      word ptr [bx + si], sp      
  {0AAB9}  push     sp                          
  {0AABA}  inc      cx                          
  {0AABB}  push     dx                          
  {0AABC}  inc      bx                          
  {0AABD}  pop      dx                          
  {0AABE}  inc      cx                          
  {0AABF}  sub      ax, 0x2057                  
  {0AAC2}  push     sp                          
  {0AAC3}  pop      cx                          
  {0AAC4}  dec      bp                          
  {0AAC5}  and      byte ptr [bx + si + 0x4f], dl
  {0AAC8}  dec      bx                          
  {0AAC9}  dec      di                          
  {0AACA}  dec      dx                          
  {0AACB}  push     bp                          
  {0AACC}  and      byte ptr [bp + si + 0x4e], bl
  {0AACF}  inc      cx                          
  {0AAD0}  dec      dx                          
  {0AAD1}  inc      sp                          
  {0AAD2}  push     bp                          
  {0AAD3}  dec      dx                          
  {0AAD4}  inc      bp                          
  {0AAD5}  and      byte ptr [bp + di + 0x49], dl
  {0AAD8}  inc      bp                          
  {0AAD9}  and      byte ptr [bp + si + 0x41], bl
  {0AADC}  dec      bx                          
  {0AADD}  push     dx                          
  {0AADE}  push     di                          
  {0AADF}  inc      cx                          
  {0AAE0}  push     di                          
  {0AAE1}  dec      cx                          
  {0AAE2}  dec      di                          
  {0AAE3}  dec      si                          
  {0AAE4}  inc      bp                          
  {0AAE5}  and      byte ptr [bx + di], ah      
  {0AAE7}  push     bx                          
  {0AAE8}  inc      bp                          
  {0AAE9}  push     dx                          
  {0AAEA}  inc      bx                          
  {0AAEB}  inc      bp                          
  {0AAEC}  and      word ptr [di], bp           
  {0AAEE}  push     di                          
  {0AAEF}  and      byte ptr [si + 0x59], dl    
  {0AAF2}  dec      bp                          
  {0AAF3}  and      byte ptr [bx + si + 0x4f], dl
  {0AAF6}  dec      bx                          
  {0AAF7}  dec      di                          
  {0AAF8}  dec      dx                          
  {0AAF9}  push     bp                          
  {0AAFA}  and      byte ptr [bp + si + 0x4e], bl
  {0AAFD}  inc      cx                          
  {0AAFE}  dec      dx                          
  {0AAFF}  inc      sp                          
  {0AB00}  push     bp                          
  {0AB01}  dec      dx                          
  {0AB02}  inc      bp                          
  {0AB03}  and      byte ptr [bp + di + 0x49], dl
  {0AB06}  inc      bp                          
  {0AB07}  and      byte ptr [bx + di], ah      
  {0AB09}  inc      sp                          
  {0AB0A}  pop      cx                          
  {0AB0B}  push     ax                          
  {0AB0C}  dec      sp                          
  {0AB0D}  dec      di                          
  {0AB0E}  dec      bp                          
  {0AB0F}  and      word ptr [bx + si], sp      
  {0AB11}  dec      bp                          
  {0AB12}  push     bp                          
  {0AB13}  inc      sp                          
  {0AB14}  and      byte ptr [bp + di + 0x5a], dl
  {0AB17}  dec      bx                          
  {0AB18}  dec      di                          
  {0AB19}  dec      sp                          
  {0AB1A}  pop      cx                          
  {0AB1B}  andps    xmm2, xmmword ptr [di + 0x20]
  {0AB1F}  dec      sp                          
  {0AB20}  inc      bp                          
  {0AB21}  pop      dx                          
  {0AB22}  pop      cx                          
  {0AB23}  and      byte ptr [bx + di], ah      
  {0AB25}  inc      si                          
  {0AB26}  inc      cx                          
  {0AB27}  dec      dx                          
  {0AB28}  dec      bx                          
  {0AB29}  inc      cx                          
  {0AB2A}  and      word ptr [bx + si], cx      
  {0AB2C}  push     ax                          
  {0AB2D}  inc      cx                          
  {0AB2E}  dec      bp                          
  {0AB2F}  dec      cx                          
  {0AB30}  inc      bp                          
  {0AB31}  push     sp                          
  {0AB32}  inc      cx                          
  {0AB33}  dec      dx                          
  {0AB34}  add      al, 0x53                    
  {0AB36}  inc      bx                          
  {0AB37}  inc      cx                          
  {0AB38}  dec      si                          
  {0AB39}  inc      ax                          
  {0AB3A}  inc      si                          
  {0AB3B}  push     bp                          
  {0AB3C}  dec      si                          
  {0AB3D}  dec      bx                          
  {0AB3E}  inc      bx                          
  {0AB3F}  dec      dx                          
  {0AB40}  inc      cx                          
  {0AB41}  and      byte ptr [bp + si + 0x45], al
  {0AB44}  inc      sp                          
  {0AB45}  pop      dx                          
  {0AB46}  dec      cx                          
  {0AB47}  inc      bp                          
  {0AB48}  and      byte ptr [si + 0x4f], al    
  {0AB4B}  push     bx                          
  {0AB4C}  push     sp                          
  {0AB4D}  inc      bp                          
  {0AB4E}  push     ax                          
  {0AB4F}  dec      si                          
  {0AB50}  inc      cx                          
  {0AB51}  and      byte ptr [bp + si + 0x41], bl
  {0AB54}  and      byte ptr [si + 0x57], al    
  {0AB57}  inc      cx                          
  {0AB58}  and      byte ptr [si + 0x41], cl    
  {0AB5B}  push     sp                          
  {0AB5C}  inc      cx                          
  {0AB5D}  and      byte ptr [si], ch           
  {0AB5F}  and      byte ptr [bx + di + 0x20], cl
  {0AB62}  push     sp                          
  {0AB63}  inc      cx                          
  {0AB64}  dec      bx                          
  {0AB65}  and      byte ptr [bp + si + 0x47], bl
  {0AB68}  dec      cx                          
  {0AB69}  dec      si                          
  {0AB6A}  dec      cx                          
  {0AB6B}  inc      bp                          
  {0AB6C}  push     bx                          
  {0AB6D}  pop      dx                          
  {0AB6E}  and      byte ptr [si], ch           
  {0AB70}  and      byte ptr [bx + di + 0x20], cl
  {0AB73}  push     sp                          
  {0AB74}  inc      cx                          
  {0AB75}  dec      bx                          
  {0AB76}  and      byte ptr [bp + si], bh      
  {0AB78}  sub      word ptr [bx + si], sp      
  {0AB7A}  or       ax, word ptr [bp + di + 0x5a]
  {0AB7D}  pop      cx                          
  {0AB7E}  push     bx                          
  {0AB7F}  inc      bx                          
  {0AB80}  and      byte ptr [di + 0x4b], al    
  {0AB83}  push     dx                          
  {0AB84}  inc      cx                          
  {0AB85}  dec      si                          
  {0AB86}  or       byte ptr [si + 0x41], al    
  {0AB89}  push     di                          
  {0AB8A}  inc      cx                          
  {0AB8B}  dec      dx                          
  {0AB8C}  and      byte ptr [di + 0x4e], al    
  {0AB8F}  or       ax, 0x415a                  
  {0AB92}  inc      dx                          
  {0AB93}  dec      cx                          
  {0AB94}  inc      bp                          
  {0AB95}  push     dx                          
  {0AB96}  inc      cx                          
  {0AB97}  dec      dx                          
  {0AB98}  and      byte ptr [bp + di + 0x41], cl
  {0AB9B}  push     bx                          
  {0AB9C}  inc      bp                          
  {0AB9D}  or       byte ptr [di + 0x53], dl    
  {0ABA0}  push     sp                          
  {0ABA1}  inc      cx                          
  {0ABA2}  push     di                          
  {0ABA3}  and      byte ptr [bp + di + 0x5a], dl
  {0ABA6}  pop      es                          
  {0ABA7}  pop      dx                          
  {0ABA8}  inc      sp                          
  {0ABA9}  inc      bp                          
  {0ABAA}  dec      dx                          
  {0ABAB}  dec      bp                          
  {0ABAC}  push     bp                          
  {0ABAD}  dec      dx                          
  {0ABAE}  push     cs                          
  {0ABAF}  dec      si                          
  {0ABB0}  inc      cx                          
  {0ABB1}  push     ax                          
  {0ABB2}  dec      cx                          
  {0ABB3}  push     bx                          
  {0ABB4}  pop      dx                          
  {0ABB5}  and      byte ptr [di + 0x4e], dl    
  {0ABB8}  dec      bp                          
  {0ABB9}  dec      di                          
  {0ABBA}  inc      sp                          
  {0ABBB}  inc      bp                          
  {0ABBC}  and      byte ptr [bp + si], al      
  {0ABBE}  dec      dx                          
  {0ABBF}  inc      cx                          
  {0ABC0}  or       word ptr [bp + si + 0x44], bx
  {0ABC3}  dec      di                          
  {0ABC4}  dec      sp                          
  {0ABC5}  dec      si                          
  {0ABC6}  dec      di                          
  {0ABC7}  push     bx                          
  {0ABC8}  inc      bx                          
  {0ABC9}  dec      cx                          
  {0ABCA}  or       byte ptr [bx + si], ah      
  {0ABCC}  dec      bp                          
  {0ABCD}  dec      cx                          
  {0ABCE}  inc      bp                          
  {0ABCF}  inc      bx                          
  {0ABD0}  dec      ax                          
  {0ABD1}  dec      di                          
  {0ABD2}  and      word ptr [bx + di], cx      
  {0ABD4}  push     bp                          
  {0ABD5}  pop      dx                          
  {0ABD6}  pop      cx                          
  {0ABD7}  dec      dx                          
  {0ABD8}  and      byte ptr [bx + si + 0x49], dl
  {0ABDB}  push     di                          
  {0ABDC}  dec      di                          
  {0ABDD}  dec      bx                          
  {0ABDE}  inc      di                          
  {0ABDF}  inc      sp                          
  {0ABE0}  pop      cx                          
  {0ABE1}  and      byte ptr [bx + si + 0x4f], dl
  {0ABE4}  inc      bx                          
  {0ABE5}  pop      dx                          
  {0ABE6}  push     bp                          
  {0ABE7}  dec      sp                          
  {0ABE8}  inc      bp                          
  {0ABE9}  push     bx                          
  {0ABEA}  and      byte ptr [bx + di + 0x4d], al
  {0ABED}  inc      dx                          
  {0ABEE}  push     dx                          
  {0ABEF}  dec      di                          
  {0ABF0}  pop      dx                          
  {0ABF1}  dec      dx                          
  {0ABF2}  inc      bp                          
  {0ABF3}  and      byte ptr [bx + 0x20], dl    
  {0ABF6}  push     bp                          
  {0ABF7}  push     bx                          
  {0ABF8}  push     sp                          
  {0ABF9}  inc      cx                          
  {0ABFA}  inc      bx                          
  {0ABFB}  dec      ax                          
  {0ABFC}  and      byte ptr [bx + 0x44], cl    
  {0ABFF}  pop      dx                          
  {0AC00}  pop      cx                          
  {0AC01}  push     bx                          
  {0AC02}  dec      bx                          
  {0AC03}  inc      cx                          
  {0AC04}  dec      sp                          
  {0AC05}  inc      bp                          
  {0AC06}  push     bx                          
  {0AC07}  and      byte ptr [bx + di], dh      
  {0AC09}  xor      byte ptr [bx + si], ah      
  {0AC0B}  dec      bp                          
  {0AC0C}  inc      cx                          
  {0AC0D}  dec      si                          
  {0AC0E}  pop      cx                          
  {0AC0F}  and      byte ptr [bp + si + 0x41], bl
  {0AC12}  push     bx                          
  {0AC13}  and      byte ptr [bx + 0x44], al    
  {0AC16}  pop      cx                          
  {0AC17}  and      byte ptr [bx + 0x4f], al    
  {0AC1A}  and      byte ptr [bx + 0x59], dl    
  {0AC1D}  push     ax                          
  {0AC1E}  dec      cx                          
  {0AC1F}  dec      sp                          
  {0AC20}  inc      bp                          
  {0AC21}  push     bx                          
  {0AC22}  and      byte ptr [bx + di], dh      
  {0AC24}  xor      byte ptr [di], ah           
  {0AC26}  and      byte ptr [di + 0x2e], al    
  {0AC29}  or       dl, byte ptr [di + 0x5a]    
  {0AC2C}  pop      cx                          
  {0AC2D}  dec      dx                          
  {0AC2E}  and      byte ptr [bp + di + 0x54], dl
  {0AC31}  inc      cx                          
  {0AC32}  push     dx                          
  {0AC33}  pop      cx                          
  {0AC34}  das                                  
  {0AC35}  push     bp                          
  {0AC36}  pop      dx                          
  {0AC37}  pop      cx                          
  {0AC38}  push     di                          
  {0AC39}  inc      cx                          
  {0AC3A}  push     bx                          
  {0AC3B}  pop      dx                          
  {0AC3C}  and      byte ptr [bp + di + 0x54], dl
  {0AC3F}  inc      cx                          
  {0AC40}  push     dx                          
  {0AC41}  inc      bp                          
  {0AC42}  inc      di                          
  {0AC43}  dec      di                          
  {0AC44}  and      byte ptr [bp + si + 0x41], bl
  {0AC47}  push     dx                          
  {0AC48}  inc      sp                          
  {0AC49}  pop      dx                          
  {0AC4A}  inc      bp                          
  {0AC4B}  push     di                          
  {0AC4C}  dec      cx                          
  {0AC4D}  inc      cx                          
  {0AC4E}  dec      sp                          
  {0AC4F}  inc      bp                          
  {0AC50}  inc      di                          
  {0AC51}  dec      di                          
  {0AC52}  and      byte ptr [di + 0x49], cl    
  {0AC55}  inc      bp                          
  {0AC56}  inc      bx                          
  {0AC57}  pop      dx                          
  {0AC58}  inc      cx                          
  {0AC59}  and      byte ptr [bp + si + 0x41], cl
  {0AC5C}  dec      bx                          
  {0AC5D}  dec      di                          
  {0AC5E}  and      byte ptr [bp + si + 0x52], al
  {0AC61}  dec      di                          
  {0AC62}  dec      si                          
  {0AC63}  dec      cx                          
  {0AC64}  or       cx, word ptr [bx + 0x44]    
  {0AC67}  dec      sp                          
  {0AC68}  dec      di                          
  {0AC69}  pop      dx                          
  {0AC6A}  and      byte ptr [bp + di + 0x54], dl
  {0AC6D}  inc      cx                          
  {0AC6E}  push     dx                          
  {0AC6F}  pop      cx                          
  {0AC70}  cmp      ax, word ptr [bp + di + 0x48]
  {0AC73}  dec      di                          
  {0AC74}  push     di                          
  {0AC75}  inc      cx                          
  {0AC76}  push     bx                          
  {0AC77}  pop      dx                          
  {0AC78}  and      byte ptr [bp + di + 0x54], dl
  {0AC7B}  inc      cx                          
  {0AC7C}  push     dx                          
  {0AC7D}  pop      cx                          
  {0AC7E}  and      byte ptr [bp + si + 0x41], bl
  {0AC81}  push     dx                          
  {0AC82}  inc      sp                          
  {0AC83}  pop      dx                          
  {0AC84}  inc      bp                          
  {0AC85}  push     di                          
  {0AC86}  dec      cx                          
  {0AC87}  inc      cx                          
  {0AC88}  dec      sp                          
  {0AC89}  pop      cx                          
  {0AC8A}  and      byte ptr [di + 0x49], cl    
  {0AC8D}  inc      bp                          
  {0AC8E}  inc      bx                          
  {0AC8F}  pop      dx                          
  {0AC90}  and      byte ptr [bx + di + 0x20], cl
  {0AC93}  dec      si                          
  {0AC94}  dec      cx                          
  {0AC95}  inc      bp                          
  {0AC96}  and      byte ptr [di + 0x5a], dl    
  {0AC99}  pop      cx                          
  {0AC9A}  push     di                          
  {0AC9B}  inc      cx                          
  {0AC9C}  push     bx                          
  {0AC9D}  pop      dx                          
  {0AC9E}  and      byte ptr [bx + 0x4f], al    
  {0ACA1}  and      byte ptr [bp + si + 0x41], cl
  {0ACA4}  dec      bx                          
  {0ACA5}  dec      di                          
  {0ACA6}  and      byte ptr [bp + si + 0x52], al
  {0ACA9}  dec      di                          
  {0ACAA}  dec      si                          
  {0ACAB}  dec      cx                          
  {0ACAC}  or       word ptr [di + 0x5a], dx    
  {0ACAF}  pop      cx                          
  {0ACB0}  dec      dx                          
  {0ACB1}  and      byte ptr [di + 0x41], cl    
  {0ACB4}  dec      sp                          
  {0ACB5}  inc      cx                          
  {0ACB6}  and      byte ptr [di + 0x5a], dl    
  {0ACB9}  pop      cx                          
  {0ACBA}  push     di                          
  {0ACBB}  inc      cx                          
  {0ACBC}  push     bx                          
  {0ACBD}  pop      dx                          
  {0ACBE}  and      byte ptr [di + 0x41], cl    
  {0ACC1}  dec      sp                          
  {0ACC2}  inc      bp                          
  {0ACC3}  dec      dx                          
  {0ACC4}  and      byte ptr [si + 0x41], dl    
  {0ACC7}  push     dx                          
  {0ACC8}  inc      bx                          
  {0ACC9}  pop      dx                          
  {0ACCA}  pop      cx                          
  {0ACCB}  and      byte ptr [bp + si + 0x41], cl
  {0ACCE}  dec      bx                          
  {0ACCF}  dec      di                          
  {0ACD0}  and      byte ptr [si + 0x41], dl    
  {0ACD3}  push     dx                          
  {0ACD4}  inc      bx                          
  {0ACD5}  pop      dx                          
  {0ACD6}  pop      cx                          
  {0ACD7}  or       cl, byte ptr [bx + 0x44]    
  {0ACDA}  dec      sp                          
  {0ACDB}  dec      di                          
  {0ACDC}  pop      dx                          
  {0ACDD}  and      byte ptr [di + 0x41], cl    
  {0ACE0}  dec      sp                          
  {0ACE1}  inc      cx                          
  {0ACE2}  sub      byte ptr [bp + si + 0x55], cl
  {0ACE5}  pop      dx                          
  {0ACE6}  and      byte ptr [bp + 0x49], cl    
  {0ACE9}  inc      bp                          
  {0ACEA}  and      byte ptr [di + 0x5a], dl    
  {0ACED}  pop      cx                          
  {0ACEE}  push     di                          
  {0ACEF}  inc      cx                          
  {0ACF0}  push     bx                          
  {0ACF1}  pop      dx                          
  {0ACF2}  and      byte ptr [di + 0x41], cl    
  {0ACF5}  dec      sp                          
  {0ACF6}  inc      bp                          
  {0ACF7}  dec      dx                          
  {0ACF8}  and      byte ptr [si + 0x41], dl    
  {0ACFB}  push     dx                          
  {0ACFC}  inc      bx                          
  {0ACFD}  pop      dx                          
  {0ACFE}  pop      cx                          
  {0ACFF}  and      byte ptr [bp + si + 0x41], cl
  {0AD02}  dec      bx                          
  {0AD03}  dec      di                          
  {0AD04}  and      byte ptr [si + 0x41], dl    
  {0AD07}  push     dx                          
  {0AD08}  inc      bx                          
  {0AD09}  pop      dx                          
  {0AD0A}  pop      cx                          
  {0AD0B}  add      ax, 0x575a                  
  {0AD0E}  dec      cx                          
  {0AD0F}  inc      bp                          
  {0AD10}  dec      dx                          
  {0AD11}  and      dx, word ptr [bx + si + 0x4f]
  {0AD14}  dec      si                          
  {0AD15}  dec      cx                          
  {0AD16}  pop      dx                          
  {0AD17}  inc      bp                          
  {0AD18}  dec      dx                          
  {0AD19}  and      byte ptr [bx + di + 0x4c], cl
  {0AD1C}  push     bp                          
  {0AD1D}  and      byte ptr [di + 0x4e], al    
  {0AD20}  inc      bp                          
  {0AD21}  push     dx                          
  {0AD22}  inc      di                          
  {0AD23}  dec      cx                          
  {0AD24}  dec      cx                          
  {0AD25}  and      byte ptr [bp + di + 0x48], al
  {0AD28}  inc      bx                          
  {0AD29}  inc      bp                          
  {0AD2A}  push     bx                          
  {0AD2B}  pop      dx                          
  {0AD2C}  and      byte ptr [di + 0x43], dl    
  {0AD2F}  dec      cx                          
  {0AD30}  inc      bp                          
  {0AD31}  dec      bx                          
  {0AD32}  inc      cx                          
  {0AD33}  inc      bx                          
  {0AD34}  aas                                  
  {0AD35}  add      al, 0x53                    
  {0AD37}  push     ax                          
  {0AD38}  dec      cx                          
  {0AD39}  dec      dx                          
  {0AD3A}  or       dl, byte ptr [bp + di + 0x50]
  {0AD3D}  dec      cx                          
  {0AD3E}  push     bx                          
  {0AD3F}  pop      dx                          
  {0AD40}  and      byte ptr [bp + si + 0x55], cl
  {0AD43}  pop      dx                          
  {0AD44}  and      byte ptr [bx], al           
  {0AD46}  and      byte ptr [bx + 0x4f], al    
  {0AD49}  inc      sp                          
  {0AD4A}  pop      dx                          
  {0AD4B}  dec      cx                          
  {0AD4C}  dec      si                          
  {0AD4D}  push     ax                          
  {0AD4F}  dec      di                          
  {0AD50}  and      byte ptr [bx + 0x42], cl    
  {0AD53}  push     bp                          
  {0AD54}  inc      sp                          
  {0AD55}  pop      dx                          
  {0AD56}  inc      bp                          
  {0AD57}  dec      si                          
  {0AD58}  dec      cx                          
  {0AD59}  push     bp                          
  {0AD5A}  and      byte ptr [bp + di + 0x54], dl
  {0AD5D}  push     di                          
  {0AD5E}  dec      cx                          
  {0AD5F}  inc      bp                          
  {0AD60}  push     dx                          
  {0AD61}  inc      sp                          
  {0AD62}  pop      dx                          
  {0AD63}  dec      cx                          
  {0AD64}  dec      sp                          
  {0AD65}  inc      bp                          
  {0AD66}  push     bx                          
  {0AD67}  and      byte ptr [bp + si + 0x45], bl
  {0AD6A}  and      byte ptr [bp + si + 0x59], bl
  {0AD6D}  push     bx                          
  {0AD6E}  dec      bx                          
  {0AD6F}  inc      cx                          
  {0AD70}  dec      sp                          
  {0AD71}  inc      bp                          
  {0AD72}  push     bx                          
  {0AD73}  and      byte ptr [si], dl           
  {0AD75}  and      byte ptr [di + 0x4e], al    
  {0AD78}  inc      bp                          
  {0AD79}  push     dx                          
  {0AD7A}  inc      di                          
  {0AD7B}  dec      cx                          
  {0AD7C}  and      byte ptr [bx + di + 0x20], cl
  {0AD7F}  push     bx                          
  {0AD80}  push     sp                          
  {0AD81}  push     dx                          
  {0AD82}  inc      cx                          
  {0AD83}  inc      bx                          
  {0AD84}  dec      cx                          
  {0AD85}  dec      sp                          
  {0AD86}  inc      bp                          
  {0AD87}  push     bx                          
  {0AD88}  and      byte ptr [bx + si], cl      
  {0AD8A}  and      byte ptr [bp + di + 0x55], cl
  {0AD8D}  dec      si                          
  {0AD8E}  push     bx                          
  {0AD8F}  pop      dx                          
  {0AD90}  push     sp                          
  {0AD91}  push     bp                          
  {0AD92}  xor      al, 0x44                    
  {0AD94}  dec      sp                          
  {0AD95}  push     bp                          
  {0AD96}  inc      di                          
  {0AD97}  dec      cx                          
  {0AD98}  and      byte ptr [bp + di + 0x45], dl
  {0AD9B}  dec      si                          
  {0AD9C}  and      byte ptr [si + 0x4f], al    
  {0AD9F}  inc      sp                          
  {0ADA0}  inc      cx                          
  {0ADA1}  push     sp                          
  {0ADA2}  dec      bx                          
  {0ADA3}  dec      di                          
  {0ADA4}  push     di                          
  {0ADA5}  dec      di                          
  {0ADA6}  and      byte ptr [bx + si + 0x4f], dl
  {0ADA9}  pop      dx                          
  {0ADAA}  push     di                          
  {0ADAB}  dec      di                          
  {0ADAC}  dec      sp                          
  {0ADAD}  dec      cx                          
  {0ADAE}  dec      sp                          
  {0ADAF}  and      byte ptr [bp + di + 0x49], al
  {0ADB2}  and      byte ptr [bx + 0x44], cl    
  {0ADB5}  push     ax                          
  {0ADB6}  dec      di                          
  {0ADB7}  inc      bx                          
  {0ADB8}  pop      dx                          
  {0ADB9}  inc      cx                          
  {0ADBA}  inc      bx                          
  {0ADBB}  and      byte ptr [bp + si], bh      
  {0ADBD}  and      byte ptr [bp + si + 0x59], bl
  {0ADC0}  push     bx                          
  {0ADC1}  dec      bx                          
  {0ADC2}  inc      cx                          
  {0ADC3}  dec      sp                          
  {0ADC4}  inc      bp                          
  {0ADC5}  push     bx                          
  {0ADC6}  and      byte ptr [0x4e45], al       
  {0ADCA}  inc      bp                          
  {0ADCB}  push     dx                          
  {0ADCC}  inc      di                          
  {0ADCD}  dec      cx                          
  {0ADCE}  sub      ax, 0x4550                  
  {0ADD1}  dec      sp                          
  {0ADD2}  dec      si                          
  {0ADD3}  dec      di                          
  {0ADD4}  push     di                          
  {0ADD5}  inc      cx                          
  {0ADD6}  push     dx                          
  {0ADD7}  push     sp                          
  {0ADD8}  dec      di                          
  {0ADD9}  push     bx                          
  {0ADDA}  inc      bx                          
  {0ADDB}  dec      cx                          
  {0ADDC}  dec      di                          
  {0ADDD}  push     di                          
  {0ADDE}  pop      cx                          
  {0ADDF}  and      byte ptr [bp + di + 0x45], dl
  {0ADE2}  dec      si                          
  {0ADE3}  and      byte ptr [bp + di + 0x50], dl
  {0ADE6}  dec      di                          
  {0ADE7}  push     di                          
  {0ADE8}  dec      di                          
  {0ADE9}  inc      sp                          
  {0ADEA}  dec      di                          
  {0ADEB}  push     di                          
  {0ADEC}  inc      cx                          
  {0ADED}  dec      sp                          
  {0ADEE}  and      byte ptr [bp + di + 0x55], dl
  {0ADF1}  push     ax                          
  {0ADF2}  inc      bp                          
  {0ADF3}  push     dx                          
  {0ADF4}  and      byte ptr [bp + si + 0x59], bl
  {0ADF7}  push     bx                          
  {0ADF8}  dec      bx                          
  {0ADF9}  and      byte ptr [bp + si], bh      
  {0ADFB}  and      byte ptr [bx + si], cl      
  {0ADFD}  push     ax                          
  {0ADFE}  dec      di                          
  {0ADFF}  push     dx                          
  {0AE00}  dec      di                          
  {0AE01}  push     di                          
  {0AE02}  dec      si                          
  {0AE03}  inc      cx                          
  {0AE04}  dec      dx                          
  {0AE05}  xor      al, 0x50                    
  {0AE07}  dec      di                          
  {0AE08}  push     ax                          
  {0AE09}  inc      bp                          
  {0AE0A}  dec      sp                          
  {0AE0B}  dec      si                          
  {0AE0C}  dec      cx                          
  {0AE0D}  dec      sp                          
  {0AE0E}  inc      bp                          
  {0AE0F}  push     bx                          
  {0AE10}  and      byte ptr [bx + si + 0x45], dl
  {0AE13}  push     di                          
  {0AE14}  dec      si                          
  {0AE15}  inc      bp                          
  {0AE16}  and      byte ptr [bp + si + 0x4c], al
  {0AE19}  inc      bp                          
  {0AE1A}  inc      sp                          
  {0AE1B}  pop      cx                          
  {0AE1C}  and      byte ptr [bx + di + 0x20], cl
  {0AE1F}  dec      si                          
  {0AE20}  dec      cx                          
  {0AE21}  inc      bp                          
  {0AE22}  and      byte ptr [di + 0x44], dl    
  {0AE25}  inc      cx                          
  {0AE26}  dec      sp                          
  {0AE27}  dec      di                          
  {0AE28}  and      byte ptr [bp + di + 0x49], dl
  {0AE2B}  inc      bp                          
  {0AE2C}  and      byte ptr [bx + 0x59], dl    
  {0AE2F}  dec      bx                          
  {0AE30}  dec      di                          
  {0AE31}  dec      si                          
  {0AE32}  inc      cx                          
  {0AE33}  inc      bx                          
  {0AE34}  and      byte ptr [bp + di + 0x5a], al
  {0AE37}  inc      cx                          
  {0AE38}  push     dx                          
  {0AE39}  push     bp                          
  {0AE3A}  or       al, byte ptr [si + 0x41]    
  {0AE3D}  push     di                          
  {0AE3E}  inc      cx                          
  {0AE3F}  dec      dx                          
  {0AE40}  and      byte ptr [bp + di + 0x41], cl
  {0AE43}  push     bx                          
  {0AE44}  inc      bp                          
  {0AE45}  or       ax, 0x444f                  
  {0AE48}  push     dx                          
  {0AE49}  pop      dx                          
  {0AE4A}  push     bp                          
  {0AE4B}  inc      bx                          
  {0AE4C}  and      byte ptr [bx + si + 0x41], dl
  {0AE4F}  inc      bx                          
  {0AE50}  pop      dx                          
  {0AE51}  inc      bp                          
  {0AE52}  dec      bx                          
  {0AE53}  push     cs                          
  {0AE54}  dec      di                          
  {0AE55}  inc      sp                          
  {0AE56}  push     dx                          
  {0AE57}  pop      dx                          
  {0AE58}  push     bp                          
  {0AE59}  inc      bx                          
  {0AE5A}  and      byte ptr [bp + di + 0x49], al
  {0AE5D}  inc      cx                          
  {0AE5E}  push     bx                          
  {0AE5F}  push     sp                          
  {0AE60}  dec      bx                          
  {0AE61}  dec      di                          
  {0AE62}  adc      cl, byte ptr [bx + 0x44]    
  {0AE65}  push     dx                          
  {0AE66}  pop      dx                          
  {0AE67}  push     bp                          
  {0AE68}  inc      bx                          
  {0AE69}  and      byte ptr [bp + di + 0x55], dl
  {0AE6C}  inc      bx                          
  {0AE6D}  dec      ax                          
  {0AE6E}  inc      cx                          
  {0AE6F}  and      byte ptr [bp + si + 0x41], dl
  {0AE72}  inc      bx                          
  {0AE73}  dec      dx                          
  {0AE74}  inc      cx                          
  {0AE75}  or       al, 0x4f                    
  {0AE77}  inc      sp                          
  {0AE78}  push     dx                          
  {0AE79}  pop      dx                          
  {0AE7A}  push     bp                          
  {0AE7B}  inc      bx                          
  {0AE7C}  and      byte ptr [bp + si + 0x55], al
  {0AE7F}  dec      sp                          
  {0AE80}  dec      bx                          
  {0AE81}  inc      cx                          
  {0AE82}  or       al, 0x4f                    
  {0AE84}  inc      sp                          
  {0AE85}  push     dx                          
  {0AE86}  pop      dx                          
  {0AE87}  push     bp                          
  {0AE88}  inc      bx                          
  {0AE89}  and      byte ptr [bp + di + 0x48], al
  {0AE8C}  dec      sp                          
  {0AE8D}  inc      bp                          
  {0AE8E}  inc      dx                          
  {0AE8F}  or       cx, word ptr [bx + 0x44]    
  {0AE92}  push     dx                          
  {0AE93}  pop      dx                          
  {0AE94}  push     bp                          
  {0AE95}  inc      bx                          
  {0AE96}  and      byte ptr [bx + 0x45], dl    
  {0AE99}  dec      bx                          
  {0AE9A}  inc      cx                          
  {0AE9B}  or       al, 0x4f                    
  {0AE9D}  inc      sp                          
  {0AE9E}  push     dx                          
  {0AE9F}  pop      dx                          
  {0AEA0}  push     bp                          
  {0AEA1}  inc      bx                          
  {0AEA2}  and      byte ptr [bp + di + 0x45], dl
  {0AEA5}  push     dx                          
  {0AEA6}  inc      bx                          
  {0AEA7}  inc      bp                          
  {0AEA8}  or       al, 0x4f                    
  {0AEAA}  inc      sp                          
  {0AEAB}  push     dx                          
  {0AEAC}  pop      dx                          
  {0AEAD}  push     bp                          
  {0AEAE}  inc      bx                          
  {0AEAF}  and      byte ptr [bp + si + 0x49], al
  {0AEB2}  inc      di                          
  {0AEB3}  dec      di                          
  {0AEB4}  push     bx                          
  {0AEB5}  inc      si                          
  {0AEB6}  dec      dx                          
  {0AEB7}  inc      cx                          
  {0AEB8}  dec      bx                          
  {0AEB9}  and      byte ptr [bp + di + 0x4d], dl
  {0AEBC}  dec      cx                          
  {0AEBD}  inc      bp                          
  {0AEBE}  push     bx                          
  {0AEBF}  pop      dx                          
  {0AEC0}  and      byte ptr [bx + 0x59], dl    
  {0AEC3}  push     dx                          
  {0AEC4}  pop      dx                          
  {0AEC5}  push     bp                          
  {0AEC6}  inc      bx                          
  {0AEC7}  inc      cx                          
  {0AEC8}  inc      bx                          
  {0AEC9}  and      byte ptr [bp + si + 0x45], cl
  {0AECC}  inc      sp                          
  {0AECD}  pop      dx                          
  {0AECE}  inc      bp                          
  {0AECF}  dec      si                          
  {0AED0}  dec      cx                          
  {0AED1}  inc      bp                          
  {0AED2}  and      word ptr [bx + di], sp      
  {0AED4}  and      word ptr [bx + si], sp      
  {0AED6}  push     di                          
  {0AED7}  push     bx                          
  {0AED8}  push     sp                          
  {0AED9}  pop      cx                          
  {0AEDA}  inc      sp                          
  {0AEDB}  and      byte ptr [di + 0x49], cl    
  {0AEDE}  and      byte ptr [bp + si + 0x41], bl
  {0AEE1}  and      byte ptr [bp + di + 0x49], al
  {0AEE4}  inc      bp                          
  {0AEE5}  inc      dx                          
  {0AEE6}  dec      cx                          
  {0AEE7}  inc      bp                          
  {0AEE8}  and      byte ptr [bx + di], ah      
  {0AEEA}  and      word ptr [bx + di], sp      
  {0AEEC}  and      byte ptr [bp + 0x49], cl    
  {0AEEF}  inc      bp                          
  {0AEF0}  and      byte ptr [bx + si + 0x4f], dl
  {0AEF3}  pop      dx                          
  {0AEF4}  push     di                          
  {0AEF5}  dec      di                          
  {0AEF6}  dec      sp                          
  {0AEF7}  inc      bp                          
  {0AEF8}  and      byte ptr [bx + di], ah      
  {0AEFA}  and      word ptr [bx + di], sp      
  {0AEFC}  push     es                          
  {0AEFD}  push     ax                          
  {0AEFE}  dec      di                          
  {0AEFF}  push     di                          
  {0AF00}  push     dx                          
  {0AF01}  dec      di                          
  {0AF02}  push     sp                          
  {0AF03}  adc      dl, byte ptr [di + 0x5a]    
  {0AF06}  pop      cx                          
  {0AF07}  dec      dx                          
  {0AF08}  and      byte ptr [bp + di + 0x43], dl
  {0AF0B}  push     dx                          
  {0AF0C}  dec      di                          
  {0AF0D}  dec      sp                          
  {0AF0E}  dec      sp                          
  {0AF0F}  and      byte ptr [bx + si + 0x4f], dl
  {0AF12}  push     di                          
  {0AF13}  push     dx                          
  {0AF14}  dec      di                          
  {0AF15}  push     sp                          
  {0AF16}  dec      di                          
  {0AF18}  push     sp                          
  {0AF19}  push     di                          
  {0AF1A}  dec      cx                          
  {0AF1B}  inc      bp                          
  {0AF1C}  push     dx                          
  {0AF1D}  inc      cx                          
  {0AF1E}  push     bx                          
  {0AF1F}  pop      dx                          
  {0AF20}  and      byte ptr [di + 0x41], cl    
  {0AF23}  inc      di                          
  {0AF24}  dec      cx                          
  {0AF25}  inc      bx                          
  {0AF26}  pop      dx                          
  {0AF27}  dec      si                          
  {0AF28}  pop      cx                          
  {0AF29}  and      byte ptr [bx + si + 0x4f], dl
  {0AF2C}  push     dx                          
  {0AF2D}  push     sp                          
  {0AF2E}  inc      cx                          
  {0AF2F}  dec      sp                          
  {0AF30}  and      byte ptr [bp + di + 0x54], cl
  {0AF33}  dec      di                          
  {0AF34}  push     dx                          
  {0AF35}  pop      cx                          
  {0AF36}  and      byte ptr [bx + si + 0x52], dl
  {0AF39}  pop      dx                          
  {0AF3A}  inc      bp                          
  {0AF3B}  dec      si                          
  {0AF3C}  dec      di                          
  {0AF3D}  push     bx                          
  {0AF3E}  dec      cx                          
  {0AF3F}  and      byte ptr [bp + di + 0x49], al
  {0AF42}  inc      bp                          
  {0AF43}  and      byte ptr [si + 0x4f], al    
  {0AF46}  and      byte ptr [di + 0x49], cl    
  {0AF49}  inc      cx                          
  {0AF4A}  push     bx                          
  {0AF4B}  push     sp                          
  {0AF4C}  inc      cx                          
  {0AF4D}  sub      al, 0x4e                    
  {0AF4F}  dec      cx                          
  {0AF50}  inc      bp                          
  {0AF51}  and      byte ptr [di + 0x44], dl    
  {0AF54}  inc      cx                          
  {0AF55}  dec      dx                          
  {0AF56}  inc      bp                          
  {0AF57}  and      byte ptr [bp + di + 0x49], al
  {0AF5A}  and      byte ptr [bp + di + 0x49], dl
  {0AF5D}  inc      bp                          
  {0AF5E}  and      byte ptr [bx + 0x54], cl    
  {0AF61}  push     di                          
  {0AF62}  dec      di                          
  {0AF63}  push     dx                          
  {0AF64}  pop      dx                          
  {0AF65}  pop      cx                          
  {0AF66}  inc      bx                          
  {0AF67}  and      byte ptr [di + 0x41], cl    
  {0AF6A}  inc      di                          
  {0AF6B}  dec      cx                          
  {0AF6C}  inc      bx                          
  {0AF6D}  pop      dx                          
  {0AF6E}  dec      si                          
  {0AF6F}  inc      bp                          
  {0AF70}  inc      di                          
  {0AF71}  dec      di                          
  {0AF72}  and      byte ptr [bx + si + 0x4f], dl
  {0AF75}  push     dx                          
  {0AF76}  push     sp                          
  {0AF77}  inc      cx                          
  {0AF78}  dec      sp                          
  {0AF79}  push     bp                          
  {0AF7A}  inc      bp                          
  {0AF7B}  dec      di                          
  {0AF7C}  push     sp                          
  {0AF7D}  push     di                          
  {0AF7E}  dec      cx                          
  {0AF7F}  inc      bp                          
  {0AF80}  push     dx                          
  {0AF81}  inc      cx                          
  {0AF82}  push     bx                          
  {0AF83}  pop      dx                          
  {0AF84}  and      byte ptr [di + 0x41], cl    
  {0AF87}  inc      di                          
  {0AF88}  dec      cx                          
  {0AF89}  inc      bx                          
  {0AF8A}  pop      dx                          
  {0AF8B}  dec      si                          
  {0AF8C}  pop      cx                          
  {0AF8D}  and      byte ptr [bx + si + 0x4f], dl
  {0AF90}  push     dx                          
  {0AF91}  push     sp                          
  {0AF92}  inc      cx                          
  {0AF93}  dec      sp                          
  {0AF94}  and      byte ptr [bp + di + 0x54], cl
  {0AF97}  dec      di                          
  {0AF98}  push     dx                          
  {0AF99}  pop      cx                          
  {0AF9A}  and      byte ptr [bp + si + 0x45], cl
  {0AF9D}  inc      sp                          
  {0AF9E}  dec      si                          
  {0AF9F}  inc      cx                          
  {0AFA0}  dec      bx                          
  {0AFA1}  and      byte ptr [bx + si + 0x52], dl
  {0AFA4}  pop      dx                          
  {0AFA5}  inc      bp                          
  {0AFA6}  dec      si                          
  {0AFA7}  dec      di                          
  {0AFA8}  push     bx                          
  {0AFA9}  dec      cx                          
  {0AFAA}  and      byte ptr [bp + di + 0x49], al
  {0AFAD}  inc      bp                          
  {0AFAE}  and      byte ptr [si + 0x4f], al    
  {0AFB1}  and      byte ptr [bx + di + 0x4e], cl
  {0AFB4}  dec      si                          
  {0AFB5}  inc      bp                          
  {0AFB6}  inc      di                          
  {0AFB7}  dec      di                          
  {0AFB8}  and      byte ptr [di + 0x49], cl    
  {0AFBB}  inc      bp                          
  {0AFBC}  dec      dx                          
  {0AFBD}  push     bx                          
  {0AFBE}  inc      bx                          
  {0AFBF}  inc      cx                          
  {0AFC0}  sbb      byte ptr [di + 0x5a], dl    
  {0AFC3}  pop      cx                          
  {0AFC4}  dec      dx                          
  {0AFC5}  and      byte ptr [bp + di + 0x43], dl
  {0AFC8}  push     dx                          
  {0AFC9}  dec      di                          
  {0AFCA}  dec      sp                          
  {0AFCB}  dec      sp                          
  {0AFCC}  and      byte ptr [bx + si + 0x4f], dl
  {0AFCF}  push     dx                          
  {0AFD0}  dec      di                          
  {0AFD1}  push     di                          
  {0AFD2}  dec      si                          
  {0AFD3}  pop      cx                          
  {0AFD4}  push     di                          
  {0AFD5}  inc      cx                          
  {0AFD6}  dec      si                          
  {0AFD7}  dec      cx                          
  {0AFD8}  inc      bp                          
  {0AFD9}  add      cx, word ptr [bp + di + 0x4f]
  {0AFDC}  push     ax                          
  {0AFDD}  adc      al, 0x5a                    
  {0AFDF}  inc      cx                          
  {0AFE0}  inc      sp                          
  {0AFE1}  inc      cx                          
  {0AFE2}  dec      bp                          
  {0AFE3}  and      byte ptr [bp + di + 0x49], al
  {0AFE6}  and      byte ptr [bx + si + 0x41], dl
  {0AFE9}  push     dx                          
  {0AFEA}  inc      bp                          
  {0AFEB}  and      byte ptr [bx + si + 0x59], dl
  {0AFEE}  push     sp                          
  {0AFEF}  inc      cx                          
  {0AFF0}  dec      si                          
  {0AFF1}  cmp      ch, byte ptr [bp + di]      
  {0AFF3}  xor      word ptr [bx + di], bp      
  {0AFF5}  push     ax                          
  {0AFF6}  dec      di                          
  {0AFF7}  dec      si                          
  {0AFF8}  dec      cx                          
  {0AFF9}  pop      dx                          
  {0AFFA}  inc      bp                          
  {0AFFB}  dec      dx                          
  {0AFFC}  and      byte ptr [bp + si + 0x41], cl
  {0AFFF}  dec      bx                          
  {0B000}  dec      cx                          
  {0B001}  inc      bp                          
  {0B002}  dec      dx                          
  {0B003}  and      byte ptr [di + 0x4e], al    
  {0B006}  inc      bp                          
  {0B007}  push     dx                          
  {0B008}  inc      di                          
  {0B009}  dec      cx                          
  {0B00A}  and      byte ptr [bp + di + 0x48], al
  {0B00D}  inc      bx                          
  {0B00E}  inc      bp                          
  {0B00F}  push     bx                          
  {0B010}  pop      dx                          
  {0B011}  and      byte ptr [bp + si + 0x41], bl
  {0B014}  inc      bx                          
  {0B015}  pop      dx                          
  {0B016}  inc      cx                          
  {0B017}  inc      bx                          
  {0B018}  and      byte ptr [bp + di + 0x4f], cl
  {0B01B}  push     ax                          
  {0B01C}  inc      cx                          
  {0B01D}  inc      bx                          
  {0B01E}  and      ax, 0x2932                  
  {0B021}  inc      sp                          
  {0B022}  dec      di                          
  {0B023}  and      byte ptr [bp + si + 0x41], cl
  {0B026}  dec      bx                          
  {0B027}  dec      cx                          
  {0B028}  inc      bp                          
  {0B029}  inc      bx                          
  {0B02A}  dec      ax                          
  {0B02B}  and      byte ptr [bx + di + 0x4c], cl
  {0B02E}  dec      di                          
  {0B02F}  push     bx                          
  {0B030}  inc      bx                          
  {0B031}  dec      cx                          
  {0B032}  and      byte ptr [di + 0x41], cl    
  {0B035}  dec      si                          
  {0B036}  inc      cx                          
  {0B037}  and      byte ptr [bp + di + 0x48], al
  {0B03A}  inc      bx                          
  {0B03B}  inc      bp                          
  {0B03C}  push     bx                          
  {0B03D}  pop      dx                          
  {0B03E}  and      byte ptr [bp + di + 0x4f], cl
  {0B041}  push     ax                          
  {0B042}  inc      cx                          
  {0B043}  inc      bx                          
  {0B044}  or       ax, 0x454a                  
  {0B047}  push     bx                          
  {0B048}  push     sp                          
  {0B049}  inc      bp                          
  {0B04A}  dec      bp                          
  {0B04B}  and      byte ptr [bp + di + 0x50], dl
  {0B04E}  inc      bp                          
  {0B04F}  inc      bp                          
  {0B050}  inc      sp                          
  {0B051}  inc      bp                          
  {0B052}  adc      byte ptr [bp + di + 0x4f], cl
  {0B055}  push     ax                          
  {0B056}  inc      cx                          
  {0B057}  dec      si                          
  {0B058}  dec      cx                          
  {0B059}  inc      bp                          
  {0B05A}  and      byte ptr [bx + si], ah      
  {0B05C}  and      byte ptr [bx + si], ah      
  {0B05E}  and      byte ptr [bx + si], ah      
  {0B060}  and      byte ptr [di], ch           
  {0B062}  and      byte ptr [bx + si], dl      
  {0B064}  push     bp                          
  {0B065}  inc      bx                          
  {0B066}  dec      cx                          
  {0B067}  inc      bp                          
  {0B068}  dec      bx                          
  {0B069}  inc      cx                          
  {0B06A}  dec      si                          
  {0B06B}  dec      cx                          
  {0B06C}  inc      bp                          
  {0B06D}  and      byte ptr [bx + si], ah      
  {0B06F}  and      byte ptr [bx + si], ah      
  {0B071}  and      byte ptr [di], ch           
  {0B073}  and      byte ptr [bx + si], dl      
  {0B075}  push     ax                          
  {0B076}  inc      cx                          
  {0B077}  push     dx                          
  {0B078}  dec      di                          
  {0B079}  push     di                          
  {0B07A}  inc      cx                          
  {0B07B}  dec      si                          
  {0B07C}  dec      cx                          
  {0B07D}  inc      bp                          
  {0B07E}  and      byte ptr [bx + si], ah      
  {0B080}  and      byte ptr [bx + si], ah      
  {0B082}  and      byte ptr [di], ch           
  {0B084}  and      byte ptr [bx + si], dl      
  {0B086}  push     ax                          
  {0B087}  dec      di                          
  {0B088}  push     dx                          
  {0B089}  dec      di                          
  {0B08A}  push     di                          
  {0B08B}  dec      si                          
  {0B08C}  pop      cx                          
  {0B08D}  push     di                          
  {0B08E}  inc      cx                          
  {0B08F}  dec      si                          
  {0B090}  dec      cx                          
  {0B091}  inc      bp                          
  {0B092}  and      byte ptr [bx + si], ah      
  {0B094}  sub      ax, 0x1020                  
  {0B097}  push     ax                          
  {0B098}  dec      di                          
  {0B099}  push     sp                          
  {0B09A}  push     dx                          
  {0B09B}  inc      cx                          
  {0B09C}  push     di                          
  {0B09D}  dec      bx                          
  {0B09E}  dec      cx                          
  {0B09F}  and      byte ptr [bx + si], ah      
  {0B0A1}  and      byte ptr [bx + si], ah      
  {0B0A3}  and      byte ptr [bx + si], ah      
  {0B0A5}  sub      ax, 0x1020                  
  {0B0A8}  push     ax                          
  {0B0A9}  dec      di                          
  {0B0AA}  push     di                          
  {0B0AB}  push     dx                          
  {0B0AC}  dec      di                          
  {0B0AD}  push     sp                          
  {0B0AE}  and      byte ptr [bx + si], ah      
  {0B0B0}  and      byte ptr [bx + si], ah      
  {0B0B2}  and      byte ptr [bx + si], ah      
  {0B0B4}  and      byte ptr [bx + si], ah      
  {0B0B6}  sub      ax, 0xc20                   
  {0B0B9}  push     di                          
  {0B0BA}  dec      sp                          
  {0B0BB}  inc      cx                          
  {0B0BC}  inc      bx                          
  {0B0BD}  pop      dx                          
  {0B0BE}  and      byte ptr [bx + si + 0x4f], dl
  {0B0C1}  push     bx                          
  {0B0C2}  push     sp                          
  {0B0C3}  inc      cx                          
  {0B0C4}  inc      bx                          
  {0B0C5}  push     es                          
  {0B0C6}  push     bp                          
  {0B0C7}  dec      si                          
  {0B0C8}  dec      bp                          
  {0B0C9}  dec      di                          
  {0B0CA}  inc      sp                          
  {0B0CB}  inc      bp                          
  {0B0CC}  add      dl, byte ptr [di + 0x4d]    
  {0B0CF}  lcall    0x1c71, 0                   
  {0B0D4}  lcall    0x1c0f, 0xd                 
  {0B0D9}  push     bp                          
  {0B0DA}  mov      bp, sp                      
  {0B0DC}  xor      ax, ax                      
  {0B0DE}  lcall    0x1c71, 0x2cd               
  {0B0E3}  lcall    0x1c71, 0xc79               
  {0B0E8}  call     0x116ef                     
  {0B0EB}  lcall    0x1c0f, 0x31a               
  {0B0F0}  call     0x51c3                      
  {0B0F3}  call     0x872e                      
  {0B0F6}  mov      ax, word ptr [0x182]        
  {0B0F9}  cmp      ax, word ptr [0x62]         
  {0B0FD}  jg       0xb102                      
  {0B0FF}  jmp      0xb193                      
  {0B102}  mov      di, 0x7a2                   
  {0B105}  push     ds                          
  {0B106}  push     di                          
  {0B107}  mov      di, 0x8ba4                  
  {0B10A}  push     cs                          
  {0B10B}  push     di                          
  {0B10C}  xor      ax, ax                      
  {0B10E}  push     ax                          
  {0B10F}  lcall    0x1c71, 0x701               
  {0B114}  mov      ax, word ptr [0x182]        
  {0B117}  sub      ax, word ptr [0x62]         
  {0B11B}  cdq                                  
  {0B11C}  push     dx                          
  {0B11D}  push     ax                          
  {0B11E}  xor      ax, ax                      
  {0B120}  push     ax                          
  {0B121}  lcall    0x1c71, 0x789               
  {0B126}  mov      di, 0x8bc2                  
  {0B129}  push     cs                          
  {0B12A}  push     di                          
  {0B12B}  xor      ax, ax                      
  {0B12D}  push     ax                          
  {0B12E}  lcall    0x1c71, 0x701               
  {0B133}  lcall    0x1c71, 0x5dd               
  {0B138}  lcall    0x1c71, 0x291               
  {0B13D}  mov      di, 0x7a2                   
  {0B140}  push     ds                          
  {0B141}  push     di                          
  {0B142}  mov      di, 0x8bcb                  
  {0B145}  push     cs                          
  {0B146}  push     di                          
  {0B147}  xor      ax, ax                      
  {0B149}  push     ax                          
  {0B14A}  lcall    0x1c71, 0x701               
  {0B14F}  mov      ax, word ptr [0x182]        
  {0B152}  sub      ax, word ptr [0x62]         
  {0B156}  mov      dx, 0xa                     
  {0B159}  mul      dx                          
  {0B15B}  cdq                                  
  {0B15C}  push     dx                          
  {0B15D}  push     ax                          
  {0B15E}  xor      ax, ax                      
  {0B160}  push     ax                          
  {0B161}  lcall    0x1c71, 0x789               
  {0B166}  mov      di, 0x8bd4                  
  {0B169}  push     cs                          
  {0B16A}  push     di                          
  {0B16B}  xor      ax, ax                      
  {0B16D}  push     ax                          
  {0B16E}  lcall    0x1c71, 0x701               
  {0B173}  lcall    0x1c71, 0x5dd               
  {0B178}  lcall    0x1c71, 0x291               
  {0B17D}  mov      ax, word ptr [0x182]        
  {0B180}  sub      ax, word ptr [0x62]         
  {0B184}  mov      dx, 0xa                     
  {0B187}  mul      dx                          
  {0B189}  mov      dx, ax                      
  {0B18B}  mov      ax, word ptr [0x19c]        
  {0B18E}  sub      ax, dx                      
  {0B190}  mov      word ptr [0x19c], ax        
  {0B193}  cmp      byte ptr [0x260], 0         
  {0B198}  jle      0xb1e5                      
  {0B19A}  mov      ax, 5                       
  {0B19D}  push     ax                          
  {0B19E}  lcall    0x1c71, 0xbe4               
  {0B1A3}  mov      word ptr [0x19e], ax        
  {0B1A6}  mov      di, 0x7a2                   
  {0B1A9}  push     ds                          
  {0B1AA}  push     di                          
  {0B1AB}  mov      di, 0x8bdd                  
  {0B1AE}  push     cs                          
  {0B1AF}  push     di                          
  {0B1B0}  xor      ax, ax                      
  {0B1B2}  push     ax                          
  {0B1B3}  lcall    0x1c71, 0x701               
  {0B1B8}  mov      ax, word ptr [0x19e]        
  {0B1BB}  cdq                                  
  {0B1BC}  push     dx                          
  {0B1BD}  push     ax                          
  {0B1BE}  xor      ax, ax                      
  {0B1C0}  push     ax                          
  {0B1C1}  lcall    0x1c71, 0x789               
  {0B1C6}  mov      di, 0x8bf5                  
  {0B1C9}  push     cs                          
  {0B1CA}  push     di                          
  {0B1CB}  xor      ax, ax                      
  {0B1CD}  push     ax                          
  {0B1CE}  lcall    0x1c71, 0x701               
  {0B1D3}  lcall    0x1c71, 0x5dd               
  {0B1D8}  lcall    0x1c71, 0x291               
  {0B1DD}  mov      al, byte ptr [0x260]        
  {0B1E0}  cwde                                 
  {0B1E1}  dec      ax                          
  {0B1E2}  mov      byte ptr [0x260], al        
  {0B1E5}  cmp      word ptr [0x1d6], 0         
  {0B1EA}  jne      0xb1f1                      
  {0B1EC}  lcall    0xf5d, 0x48f                
  {0B1F1}  cmp      word ptr [0x1d6], 1         
  {0B1F6}  jne      0xb1fd                      
  {0B1F8}  lcall    0xf5d, 0x90f                
  {0B1FD}  cmp      word ptr [0x1d6], 2         
  {0B202}  jne      0xb207                      
  {0B204}  call     0x548a                      
  {0B207}  cmp      word ptr [0x1d6], 3         
  {0B20C}  jne      0xb211                      
  {0B20E}  call     0x571e                      
  {0B211}  cmp      word ptr [0x1d6], 4         
  {0B216}  jne      0xb21d                      
  {0B218}  lcall    0xf5d, 0xe77                
  {0B21D}  cmp      word ptr [0x1d6], 5         
  {0B222}  jne      0xb229                      
  {0B224}  lcall    0xf5d, 0x196                
  {0B229}  lcall    0xf5d, 0x15bd               
  {0B22E}  cmp      word ptr [0x1d6], 9         
  {0B233}  jne      0xb238                      
  {0B235}  call     0x5923                      
  {0B238}  cmp      word ptr [0x1d6], 0xb       
  {0B23D}  jne      0xb244                      
  {0B23F}  lcall    0xf5d, 0x1c91               
  {0B244}  cmp      word ptr [0x1d6], 0xc       
  {0B249}  jne      0xb24e                      
  {0B24B}  call     0x5c36                      
  {0B24E}  cmp      word ptr [0x1d6], 0xd       
  {0B253}  jne      0xb25a                      
  {0B255}  lcall    0xf5d, 0x1233               
  {0B25A}  cmp      word ptr [0x1d6], 0xe       
  {0B25F}  je       0xb264                      
  {0B261}  jmp      0xb521                      
  {0B264}  mov      di, 0x7a2                   
  {0B267}  push     ds                          
  {0B268}  push     di                          
  {0B269}  mov      di, 0x8bff                  
  {0B26C}  push     cs                          
  {0B26D}  push     di                          
  {0B26E}  xor      ax, ax                      
  {0B270}  push     ax                          
  {0B271}  lcall    0x1c71, 0x701               
  {0B276}  lcall    0x1c71, 0x5dd               
  {0B27B}  lcall    0x1c71, 0x291               
  {0B280}  cmp      word ptr [0x5a], 0xe        
  {0B285}  jne      0xb2a3                      
  {0B287}  mov      di, 0x7a2                   
  {0B28A}  push     ds                          
  {0B28B}  push     di                          
  {0B28C}  mov      di, 0x8c46                  
  {0B28F}  push     cs                          
  {0B290}  push     di                          
  {0B291}  xor      ax, ax                      
  {0B293}  push     ax                          
  {0B294}  lcall    0x1c71, 0x701               
  {0B299}  lcall    0x1c71, 0x5dd               
  {0B29E}  lcall    0x1c71, 0x291               
  {0B2A3}  cmp      word ptr [0x5a], 0          
  {0B2A8}  jne      0xb2c6                      
  {0B2AA}  mov      di, 0x7a2                   
  {0B2AD}  push     ds                          
  {0B2AE}  push     di                          
  {0B2AF}  mov      di, 0x8c6b                  
  {0B2B2}  push     cs                          
  {0B2B3}  push     di                          
  {0B2B4}  xor      ax, ax                      
  {0B2B6}  push     ax                          
  {0B2B7}  lcall    0x1c71, 0x701               
  {0B2BC}  lcall    0x1c71, 0x5dd               
  {0B2C1}  lcall    0x1c71, 0x291               
  {0B2C6}  mov      di, 0x7a2                   
  {0B2C9}  push     ds                          
  {0B2CA}  push     di                          
  {0B2CB}  mov      ax, word ptr [0x19c]        
  {0B2CE}  cdq                                  
  {0B2CF}  push     dx                          
  {0B2D0}  push     ax                          
  {0B2D1}  xor      ax, ax                      
  {0B2D3}  push     ax                          
  {0B2D4}  lcall    0x1c71, 0x789               
  {0B2D9}  mov      di, 0x8c9d                  
  {0B2DC}  push     cs                          
  {0B2DD}  push     di                          
  {0B2DE}  xor      ax, ax                      
  {0B2E0}  push     ax                          
  {0B2E1}  lcall    0x1c71, 0x701               
  {0B2E6}  mov      ax, word ptr [0x1d4]        
  {0B2E9}  cdq                                  
  {0B2EA}  push     dx                          
  {0B2EB}  push     ax                          
  {0B2EC}  xor      ax, ax                      
  {0B2EE}  push     ax                          
  {0B2EF}  lcall    0x1c71, 0x789               
  {0B2F4}  mov      al, 0x3e                    
  {0B2F6}  push     ax                          
  {0B2F7}  xor      ax, ax                      
  {0B2F9}  push     ax                          
  {0B2FA}  lcall    0x1c71, 0x67b               
  {0B2FF}  lcall    0x1c71, 0x5fe               
  {0B304}  lcall    0x1c71, 0x291               
  {0B309}  mov      di, 0x6a2                   
  {0B30C}  push     ds                          
  {0B30D}  push     di                          
  {0B30E}  mov      di, 0x564                   
  {0B311}  push     ds                          
  {0B312}  push     di                          
  {0B313}  mov      ax, 0xff                    
  {0B316}  push     ax                          
  {0B317}  lcall    0x1c71, 0x6c6               
  {0B31C}  lcall    0x1c71, 0x59d               
  {0B321}  lcall    0x1c71, 0x291               
  {0B326}  mov      di, 0x564                   
  {0B329}  push     ds                          
  {0B32A}  push     di                          
  {0B32B}  mov      di, 0x8ca0                  
  {0B32E}  push     cs                          
  {0B32F}  push     di                          
  {0B330}  lcall    0x1c71, 0x9d7               
  {0B335}  jne      0xb36f                      
  {0B337}  mov      di, 0x7a2                   
  {0B33A}  push     ds                          
  {0B33B}  push     di                          
  {0B33C}  mov      di, 0x8ca5                  
  {0B33F}  push     cs                          
  {0B340}  push     di                          
  {0B341}  xor      ax, ax                      
  {0B343}  push     ax                          
  {0B344}  lcall    0x1c71, 0x701               
  {0B349}  lcall    0x1c71, 0x5dd               
  {0B34E}  lcall    0x1c71, 0x291               
  {0B353}  mov      di, 0x7a2                   
  {0B356}  push     ds                          
  {0B357}  push     di                          
  {0B358}  mov      di, 0x8cb7                  
  {0B35B}  push     cs                          
  {0B35C}  push     di                          
  {0B35D}  xor      ax, ax                      
  {0B35F}  push     ax                          
  {0B360}  lcall    0x1c71, 0x701               
  {0B365}  lcall    0x1c71, 0x5dd               
  {0B36A}  lcall    0x1c71, 0x291               
  {0B36F}  mov      di, 0x564                   
  {0B372}  push     ds                          
  {0B373}  push     di                          
  {0B374}  mov      di, 0x8cd3                  
  {0B377}  push     cs                          
  {0B378}  push     di                          
  {0B379}  lcall    0x1c71, 0x9d7               
  {0B37E}  jne      0xb385                      
  {0B380}  lcall    0x129d, 0x3114              
  {0B385}  mov      di, 0x564                   
  {0B388}  push     ds                          
  {0B389}  push     di                          
  {0B38A}  mov      di, 0x8cd8                  
  {0B38D}  push     cs                          
  {0B38E}  push     di                          
  {0B38F}  lcall    0x1c71, 0x9d7               
  {0B394}  jne      0xb399                      
  {0B396}  jmp      0xf5c2                      
  {0B399}  mov      di, 0x564                   
  {0B39C}  push     ds                          
  {0B39D}  push     di                          
  {0B39E}  mov      di, 0x8ce0                  
  {0B3A1}  push     cs                          
  {0B3A2}  push     di                          
  {0B3A3}  lcall    0x1c71, 0x9d7               
  {0B3A8}  jne      0xb3b0                      
  {0B3AA}  mov      word ptr [0x1d6], 0xb       
  {0B3B0}  mov      di, 0x564                   
  {0B3B3}  push     ds                          
  {0B3B4}  push     di                          
  {0B3B5}  mov      di, 0x8ce9                  
  {0B3B8}  push     cs                          
  {0B3B9}  push     di                          
  {0B3BA}  lcall    0x1c71, 0x9d7               
  {0B3BF}  je       0xb3c4                      
  {0B3C1}  jmp      0xb517                      
  {0B3C4}  cmp      word ptr [0x5a], 0xe        
  {0B3C9}  je       0xb3ce                      
  {0B3CB}  jmp      0xb517                      
  {0B3CE}  mov      word ptr [0x1b0], 0x14      
  {0B3D4}  mov      word ptr [0x1b8], 0x1e      
  {0B3DA}  mov      word ptr [0x1b6], 3         
  {0B3E0}  lcall    0x129d, 0x44a6              
  {0B3E5}  cmp      word ptr [0x1d2], 0         
  {0B3EA}  je       0xb3ef                      
  {0B3EC}  jmp      0xb512                      
  {0B3EF}  xor      ax, ax                      
  {0B3F1}  mov      word ptr [0x5a], ax         
  {0B3F4}  mov      ax, 0xf                     
  {0B3F7}  push     ax                          
  {0B3F8}  lcall    0x1c71, 0xbe4               
  {0B3FD}  mov      word ptr [0x212], ax        
  {0B400}  mov      di, 0x7a2                   
  {0B403}  push     ds                          
  {0B404}  push     di                          
  {0B405}  mov      di, 0x8cf6                  
  {0B408}  push     cs                          
  {0B409}  push     di                          
  {0B40A}  xor      ax, ax                      
  {0B40C}  push     ax                          
  {0B40D}  lcall    0x1c71, 0x701               
  {0B412}  mov      ax, word ptr [0x212]        
  {0B415}  cdq                                  
  {0B416}  push     dx                          
  {0B417}  push     ax                          
  {0B418}  xor      ax, ax                      
  {0B41A}  push     ax                          
  {0B41B}  lcall    0x1c71, 0x789               
  {0B420}  mov      di, 0x8d01                  
  {0B423}  push     cs                          
  {0B424}  push     di                          
  {0B425}  xor      ax, ax                      
  {0B427}  push     ax                          
  {0B428}  lcall    0x1c71, 0x701               
  {0B42D}  lcall    0x1c71, 0x5dd               
  {0B432}  lcall    0x1c71, 0x291               
  {0B437}  mov      ax, word ptr [0x212]        
  {0B43A}  cdq                                  
  {0B43B}  add      ax, word ptr [0x21a]        
  {0B43F}  adc      dx, word ptr [0x21c]        
  {0B443}  mov      word ptr [0x21a], ax        
  {0B446}  mov      word ptr [0x21c], dx        
  {0B44A}  cmp      word ptr [0x17e], 0         
  {0B44F}  jne      0xb48c                      
  {0B451}  mov      ax, 0x14                    
  {0B454}  push     ax                          
  {0B455}  lcall    0x1c71, 0xbe4               
  {0B45A}  mov      word ptr [0x19e], ax        
  {0B45D}  cmp      word ptr [0x19e], 7         
  {0B462}  jge      0xb48c                      
  {0B464}  mov      ax, word ptr [0x1d6]        
  {0B467}  mov      word ptr [0x17e], ax        
  {0B46A}  mov      di, 0x7a2                   
  {0B46D}  push     ds                          
  {0B46E}  push     di                          
  {0B46F}  mov      di, 0x8d18                  
  {0B472}  push     cs                          
  {0B473}  push     di                          
  {0B474}  xor      ax, ax                      
  {0B476}  push     ax                          
  {0B477}  lcall    0x1c71, 0x701               
  {0B47C}  lcall    0x1c71, 0x5dd               
  {0B481}  lcall    0x1c71, 0x291               
  {0B486}  mov      word ptr [0x66], 0x1f4      
  {0B48C}  cmp      word ptr [0x184], 0            // PRZEDM.PASZOL
  {0B491}  jne      0xb4ce                      
  {0B493}  mov      ax, 0x14                    
  {0B496}  push     ax                          
  {0B497}  lcall    0x1c71, 0xbe4               
  {0B49C}  mov      word ptr [0x19e], ax        
  {0B49F}  cmp      word ptr [0x19e], 7         
  {0B4A4}  jge      0xb4ce                      
  {0B4A6}  mov      ax, word ptr [0x1d6]        
  {0B4A9}  mov      word ptr [0x184], ax           // PRZEDM.PASZOL
  {0B4AC}  mov      di, 0x7a2                   
  {0B4AF}  push     ds                          
  {0B4B0}  push     di                          
  {0B4B1}  mov      di, 0x8d4a                  
  {0B4B4}  push     cs                          
  {0B4B5}  push     di                          
  {0B4B6}  xor      ax, ax                      
  {0B4B8}  push     ax                          
  {0B4B9}  lcall    0x1c71, 0x701               
  {0B4BE}  lcall    0x1c71, 0x5dd               
  {0B4C3}  lcall    0x1c71, 0x291               
  {0B4C8}  mov      word ptr [0x68], 0x12c      
  {0B4CE}  cmp      word ptr [0x186], 0            // PRZEDM.WIMP
  {0B4D3}  jne      0xb510                      
  {0B4D5}  mov      ax, 0x14                    
  {0B4D8}  push     ax                          
  {0B4D9}  lcall    0x1c71, 0xbe4               
  {0B4DE}  mov      word ptr [0x19e], ax        
  {0B4E1}  cmp      word ptr [0x19e], 6         
  {0B4E6}  jge      0xb510                      
  {0B4E8}  mov      ax, word ptr [0x1d6]        
  {0B4EB}  mov      word ptr [0x186], ax           // PRZEDM.WIMP
  {0B4EE}  mov      di, 0x7a2                   
  {0B4F1}  push     ds                          
  {0B4F2}  push     di                          
  {0B4F3}  mov      di, 0x8d77                  
  {0B4F6}  push     cs                          
  {0B4F7}  push     di                          
  {0B4F8}  xor      ax, ax                      
  {0B4FA}  push     ax                          
  {0B4FB}  lcall    0x1c71, 0x701               
  {0B500}  lcall    0x1c71, 0x5dd               
  {0B505}  lcall    0x1c71, 0x291               
  {0B50A}  mov      word ptr [0x6a], 0x32       
  {0B510}  jmp      0xb517                      
  {0B512}  xor      ax, ax                      
  {0B514}  mov      word ptr [0x1d2], ax        
  {0B517}  cmp      word ptr [0x1d6], 0xe       
  {0B51C}  jne      0xb521                      
  {0B51E}  jmp      0xb2c6                      
  {0B521}  cmp      word ptr [0x1d6], 0xf       
  {0B526}  je       0xb52b                      
  {0B528}  jmp      0xb7e8                      
  {0B52B}  mov      di, 0x7a2                   
  {0B52E}  push     ds                          
  {0B52F}  push     di                          
  {0B530}  mov      di, 0x8bff                  
  {0B533}  push     cs                          
  {0B534}  push     di                          
  {0B535}  xor      ax, ax                      
  {0B537}  push     ax                          
  {0B538}  lcall    0x1c71, 0x701               
  {0B53D}  lcall    0x1c71, 0x5dd               
  {0B542}  lcall    0x1c71, 0x291               
  {0B547}  cmp      word ptr [0x5c], 0xf        
  {0B54C}  jne      0xb56a                      
  {0B54E}  mov      di, 0x7a2                   
  {0B551}  push     ds                          
  {0B552}  push     di                          
  {0B553}  mov      di, 0x8da3                  
  {0B556}  push     cs                          
  {0B557}  push     di                          
  {0B558}  xor      ax, ax                      
  {0B55A}  push     ax                          
  {0B55B}  lcall    0x1c71, 0x701               
  {0B560}  lcall    0x1c71, 0x5dd               
  {0B565}  lcall    0x1c71, 0x291               
  {0B56A}  cmp      word ptr [0x5c], 0          
  {0B56F}  jne      0xb58d                      
  {0B571}  mov      di, 0x7a2                   
  {0B574}  push     ds                          
  {0B575}  push     di                          
  {0B576}  mov      di, 0x8ddf                  
  {0B579}  push     cs                          
  {0B57A}  push     di                          
  {0B57B}  xor      ax, ax                      
  {0B57D}  push     ax                          
  {0B57E}  lcall    0x1c71, 0x701               
  {0B583}  lcall    0x1c71, 0x5dd               
  {0B588}  lcall    0x1c71, 0x291               
  {0B58D}  mov      di, 0x7a2                   
  {0B590}  push     ds                          
  {0B591}  push     di                          
  {0B592}  mov      ax, word ptr [0x19c]        
  {0B595}  cdq                                  
  {0B596}  push     dx                          
  {0B597}  push     ax                          
  {0B598}  xor      ax, ax                      
  {0B59A}  push     ax                          
  {0B59B}  lcall    0x1c71, 0x789               
  {0B5A0}  mov      di, 0x8c9d                  
  {0B5A3}  push     cs                          
  {0B5A4}  push     di                          
  {0B5A5}  xor      ax, ax                      
  {0B5A7}  push     ax                          
  {0B5A8}  lcall    0x1c71, 0x701               
  {0B5AD}  mov      ax, word ptr [0x1d4]        
  {0B5B0}  cdq                                  
  {0B5B1}  push     dx                          
  {0B5B2}  push     ax                          
  {0B5B3}  xor      ax, ax                      
  {0B5B5}  push     ax                          
  {0B5B6}  lcall    0x1c71, 0x789               
  {0B5BB}  mov      al, 0x3e                    
  {0B5BD}  push     ax                          
  {0B5BE}  xor      ax, ax                      
  {0B5C0}  push     ax                          
  {0B5C1}  lcall    0x1c71, 0x67b               
  {0B5C6}  lcall    0x1c71, 0x5fe               
  {0B5CB}  lcall    0x1c71, 0x291               
  {0B5D0}  mov      di, 0x6a2                   
  {0B5D3}  push     ds                          
  {0B5D4}  push     di                          
  {0B5D5}  mov      di, 0x564                   
  {0B5D8}  push     ds                          
  {0B5D9}  push     di                          
  {0B5DA}  mov      ax, 0xff                    
  {0B5DD}  push     ax                          
  {0B5DE}  lcall    0x1c71, 0x6c6               
  {0B5E3}  lcall    0x1c71, 0x59d               
  {0B5E8}  lcall    0x1c71, 0x291               
  {0B5ED}  mov      di, 0x564                   
  {0B5F0}  push     ds                          
  {0B5F1}  push     di                          
  {0B5F2}  mov      di, 0x8ca0                  
  {0B5F5}  push     cs                          
  {0B5F6}  push     di                          
  {0B5F7}  lcall    0x1c71, 0x9d7               
  {0B5FC}  jne      0xb636                      
  {0B5FE}  mov      di, 0x7a2                   
  {0B601}  push     ds                          
  {0B602}  push     di                          
  {0B603}  mov      di, 0x8ca5                  
  {0B606}  push     cs                          
  {0B607}  push     di                          
  {0B608}  xor      ax, ax                      
  {0B60A}  push     ax                          
  {0B60B}  lcall    0x1c71, 0x701               
  {0B610}  lcall    0x1c71, 0x5dd               
  {0B615}  lcall    0x1c71, 0x291               
  {0B61A}  mov      di, 0x7a2                   
  {0B61D}  push     ds                          
  {0B61E}  push     di                          
  {0B61F}  mov      di, 0x8e13                  
  {0B622}  push     cs                          
  {0B623}  push     di                          
  {0B624}  xor      ax, ax                      
  {0B626}  push     ax                          
  {0B627}  lcall    0x1c71, 0x701               
  {0B62C}  lcall    0x1c71, 0x5dd               
  {0B631}  lcall    0x1c71, 0x291               
  {0B636}  mov      di, 0x564                   
  {0B639}  push     ds                          
  {0B63A}  push     di                          
  {0B63B}  mov      di, 0x8cd3                  
  {0B63E}  push     cs                          
  {0B63F}  push     di                          
  {0B640}  lcall    0x1c71, 0x9d7               
  {0B645}  jne      0xb64c                      
  {0B647}  lcall    0x129d, 0x3114              
  {0B64C}  mov      di, 0x564                   
  {0B64F}  push     ds                          
  {0B650}  push     di                          
  {0B651}  mov      di, 0x8cd8                  
  {0B654}  push     cs                          
  {0B655}  push     di                          
  {0B656}  lcall    0x1c71, 0x9d7               
  {0B65B}  jne      0xb660                      
  {0B65D}  jmp      0xf5c2                      
  {0B660}  mov      di, 0x564                   
  {0B663}  push     ds                          
  {0B664}  push     di                          
  {0B665}  mov      di, 0x8e2d                  
  {0B668}  push     cs                          
  {0B669}  push     di                          
  {0B66A}  lcall    0x1c71, 0x9d7               
  {0B66F}  jne      0xb677                      
  {0B671}  mov      word ptr [0x1d6], 0xb       
  {0B677}  mov      di, 0x564                   
  {0B67A}  push     ds                          
  {0B67B}  push     di                          
  {0B67C}  mov      di, 0x8ce9                  
  {0B67F}  push     cs                          
  {0B680}  push     di                          
  {0B681}  lcall    0x1c71, 0x9d7               
  {0B686}  je       0xb68b                      
  {0B688}  jmp      0xb7de                      
  {0B68B}  cmp      word ptr [0x5c], 0xf        
  {0B690}  je       0xb695                      
  {0B692}  jmp      0xb7de                      
  {0B695}  mov      word ptr [0x1b0], 0x28      
  {0B69B}  mov      word ptr [0x1b8], 3         
  {0B6A1}  mov      word ptr [0x1b6], 3         
  {0B6A7}  lcall    0x129d, 0x44a6              
  {0B6AC}  cmp      word ptr [0x1d2], 0         
  {0B6B1}  je       0xb6b6                      
  {0B6B3}  jmp      0xb7d9                      
  {0B6B6}  xor      ax, ax                      
  {0B6B8}  mov      word ptr [0x5c], ax         
  {0B6BB}  mov      ax, 0xf                     
  {0B6BE}  push     ax                          
  {0B6BF}  lcall    0x1c71, 0xbe4               
  {0B6C4}  mov      word ptr [0x212], ax        
  {0B6C7}  mov      di, 0x7a2                   
  {0B6CA}  push     ds                          
  {0B6CB}  push     di                          
  {0B6CC}  mov      di, 0x8cf6                  
  {0B6CF}  push     cs                          
  {0B6D0}  push     di                          
  {0B6D1}  xor      ax, ax                      
  {0B6D3}  push     ax                          
  {0B6D4}  lcall    0x1c71, 0x701               
  {0B6D9}  mov      ax, word ptr [0x212]        
  {0B6DC}  cdq                                  
  {0B6DD}  push     dx                          
  {0B6DE}  push     ax                          
  {0B6DF}  xor      ax, ax                      
  {0B6E1}  push     ax                          
  {0B6E2}  lcall    0x1c71, 0x789               
  {0B6E7}  mov      di, 0x8d01                  
  {0B6EA}  push     cs                          
  {0B6EB}  push     di                          
  {0B6EC}  xor      ax, ax                      
  {0B6EE}  push     ax                          
  {0B6EF}  lcall    0x1c71, 0x701               
  {0B6F4}  lcall    0x1c71, 0x5dd               
  {0B6F9}  lcall    0x1c71, 0x291               
  {0B6FE}  mov      ax, word ptr [0x212]        
  {0B701}  cdq                                  
  {0B702}  add      ax, word ptr [0x21a]        
  {0B706}  adc      dx, word ptr [0x21c]        
  {0B70A}  mov      word ptr [0x21a], ax        
  {0B70D}  mov      word ptr [0x21c], dx        
  {0B711}  cmp      word ptr [0x17e], 0         
  {0B716}  jne      0xb753                      
  {0B718}  mov      ax, 0x14                    
  {0B71B}  push     ax                          
  {0B71C}  lcall    0x1c71, 0xbe4               
  {0B721}  mov      word ptr [0x19e], ax        
  {0B724}  cmp      word ptr [0x19e], 7         
  {0B729}  jge      0xb753                      
  {0B72B}  mov      ax, word ptr [0x1d6]        
  {0B72E}  mov      word ptr [0x17e], ax        
  {0B731}  mov      di, 0x7a2                   
  {0B734}  push     ds                          
  {0B735}  push     di                          
  {0B736}  mov      di, 0x8d18                  
  {0B739}  push     cs                          
  {0B73A}  push     di                          
  {0B73B}  xor      ax, ax                      
  {0B73D}  push     ax                          
  {0B73E}  lcall    0x1c71, 0x701               
  {0B743}  lcall    0x1c71, 0x5dd               
  {0B748}  lcall    0x1c71, 0x291               
  {0B74D}  mov      word ptr [0x66], 0x1f4      
  {0B753}  cmp      word ptr [0x184], 0            // PRZEDM.PASZOL
  {0B758}  jne      0xb795                      
  {0B75A}  mov      ax, 0x14                    
  {0B75D}  push     ax                          
  {0B75E}  lcall    0x1c71, 0xbe4               
  {0B763}  mov      word ptr [0x19e], ax        
  {0B766}  cmp      word ptr [0x19e], 7         
  {0B76B}  jge      0xb795                      
  {0B76D}  mov      ax, word ptr [0x1d6]        
  {0B770}  mov      word ptr [0x184], ax           // PRZEDM.PASZOL
  {0B773}  mov      di, 0x7a2                   
  {0B776}  push     ds                          
  {0B777}  push     di                          
  {0B778}  mov      di, 0x8d4a                  
  {0B77B}  push     cs                          
  {0B77C}  push     di                          
  {0B77D}  xor      ax, ax                      
  {0B77F}  push     ax                          
  {0B780}  lcall    0x1c71, 0x701               
  {0B785}  lcall    0x1c71, 0x5dd               
  {0B78A}  lcall    0x1c71, 0x291               
  {0B78F}  mov      word ptr [0x68], 0x12c      
  {0B795}  cmp      word ptr [0x186], 0            // PRZEDM.WIMP
  {0B79A}  jne      0xb7d7                      
  {0B79C}  mov      ax, 0x14                    
  {0B79F}  push     ax                          
  {0B7A0}  lcall    0x1c71, 0xbe4               
  {0B7A5}  mov      word ptr [0x19e], ax        
  {0B7A8}  cmp      word ptr [0x19e], 6         
  {0B7AD}  jge      0xb7d7                      
  {0B7AF}  mov      ax, word ptr [0x1d6]        
  {0B7B2}  mov      word ptr [0x186], ax           // PRZEDM.WIMP
  {0B7B5}  mov      di, 0x7a2                   
  {0B7B8}  push     ds                          
  {0B7B9}  push     di                          
  {0B7BA}  mov      di, 0x8d77                  
  {0B7BD}  push     cs                          
  {0B7BE}  push     di                          
  {0B7BF}  xor      ax, ax                      
  {0B7C1}  push     ax                          
  {0B7C2}  lcall    0x1c71, 0x701               
  {0B7C7}  lcall    0x1c71, 0x5dd               
  {0B7CC}  lcall    0x1c71, 0x291               
  {0B7D1}  mov      word ptr [0x6a], 0x32       
  {0B7D7}  jmp      0xb7de                      
  {0B7D9}  xor      ax, ax                      
  {0B7DB}  mov      word ptr [0x1d2], ax        
  {0B7DE}  cmp      word ptr [0x1d6], 0xf       
  {0B7E3}  jne      0xb7e8                      
  {0B7E5}  jmp      0xb58d                      
  {0B7E8}  cmp      word ptr [0x1d6], 0x10      
  {0B7ED}  je       0xb7f2                      
  {0B7EF}  jmp      0xbaa1                      
  {0B7F2}  mov      di, 0x7a2                   
  {0B7F5}  push     ds                          
  {0B7F6}  push     di                          
  {0B7F7}  mov      di, 0x8bff                  
  {0B7FA}  push     cs                          
  {0B7FB}  push     di                          
  {0B7FC}  xor      ax, ax                      
  {0B7FE}  push     ax                          
  {0B7FF}  lcall    0x1c71, 0x701               
  {0B804}  lcall    0x1c71, 0x5dd               
  {0B809}  lcall    0x1c71, 0x291               
  {0B80E}  cmp      word ptr [0x5e], 0x10       
  {0B813}  jne      0xb831                      
  {0B815}  mov      di, 0x7a2                   
  {0B818}  push     ds                          
  {0B819}  push     di                          
  {0B81A}  mov      di, 0x8e34                  
  {0B81D}  push     cs                          
  {0B81E}  push     di                          
  {0B81F}  xor      ax, ax                      
  {0B821}  push     ax                          
  {0B822}  lcall    0x1c71, 0x701               
  {0B827}  lcall    0x1c71, 0x5dd               
  {0B82C}  lcall    0x1c71, 0x291               
  {0B831}  cmp      word ptr [0x5e], 0          
  {0B836}  jne      0xb854                      
  {0B838}  mov      di, 0x7a2                   
  {0B83B}  push     ds                          
  {0B83C}  push     di                          
  {0B83D}  mov      di, 0x8ddf                  
  {0B840}  push     cs                          
  {0B841}  push     di                          
  {0B842}  xor      ax, ax                      
  {0B844}  push     ax                          
  {0B845}  lcall    0x1c71, 0x701               
  {0B84A}  lcall    0x1c71, 0x5dd               
  {0B84F}  lcall    0x1c71, 0x291               
  {0B854}  cmp      word ptr [0x5e], 0x10       
  {0B859}  je       0xb85e                      
  {0B85B}  jmp      0xb9ad                      
  {0B85E}  mov      word ptr [0x1b0], 0x28      
  {0B864}  mov      word ptr [0x1b8], 0xb       
  {0B86A}  mov      word ptr [0x1b6], 0xa       
  {0B870}  lcall    0x129d, 0x44a6              
  {0B875}  cmp      word ptr [0x1d2], 0         
  {0B87A}  je       0xb87f                      
  {0B87C}  jmp      0xb9a2                      
  {0B87F}  xor      ax, ax                      
  {0B881}  mov      word ptr [0x5e], ax         
  {0B884}  mov      ax, 0x1e                    
  {0B887}  push     ax                          
  {0B888}  lcall    0x1c71, 0xbe4               
  {0B88D}  mov      word ptr [0x212], ax        
  {0B890}  mov      di, 0x7a2                   
  {0B893}  push     ds                          
  {0B894}  push     di                          
  {0B895}  mov      di, 0x8cf6                  
  {0B898}  push     cs                          
  {0B899}  push     di                          
  {0B89A}  xor      ax, ax                      
  {0B89C}  push     ax                          
  {0B89D}  lcall    0x1c71, 0x701               
  {0B8A2}  mov      ax, word ptr [0x212]        
  {0B8A5}  cdq                                  
  {0B8A6}  push     dx                          
  {0B8A7}  push     ax                          
  {0B8A8}  xor      ax, ax                      
  {0B8AA}  push     ax                          
  {0B8AB}  lcall    0x1c71, 0x789               
  {0B8B0}  mov      di, 0x8d01                  
  {0B8B3}  push     cs                          
  {0B8B4}  push     di                          
  {0B8B5}  xor      ax, ax                      
  {0B8B7}  push     ax                          
  {0B8B8}  lcall    0x1c71, 0x701               
  {0B8BD}  lcall    0x1c71, 0x5dd               
  {0B8C2}  lcall    0x1c71, 0x291               
  {0B8C7}  mov      ax, word ptr [0x212]        
  {0B8CA}  cdq                                  
  {0B8CB}  add      ax, word ptr [0x21a]        
  {0B8CF}  adc      dx, word ptr [0x21c]        
  {0B8D3}  mov      word ptr [0x21a], ax        
  {0B8D6}  mov      word ptr [0x21c], dx        
  {0B8DA}  cmp      word ptr [0x17e], 0         
  {0B8DF}  jne      0xb91c                      
  {0B8E1}  mov      ax, 0x14                    
  {0B8E4}  push     ax                          
  {0B8E5}  lcall    0x1c71, 0xbe4               
  {0B8EA}  mov      word ptr [0x19e], ax        
  {0B8ED}  cmp      word ptr [0x19e], 0xa       
  {0B8F2}  jge      0xb91c                      
  {0B8F4}  mov      ax, word ptr [0x1d6]        
  {0B8F7}  mov      word ptr [0x17e], ax        
  {0B8FA}  mov      di, 0x7a2                   
  {0B8FD}  push     ds                          
  {0B8FE}  push     di                          
  {0B8FF}  mov      di, 0x8d18                  
  {0B902}  push     cs                          
  {0B903}  push     di                          
  {0B904}  xor      ax, ax                      
  {0B906}  push     ax                          
  {0B907}  lcall    0x1c71, 0x701               
  {0B90C}  lcall    0x1c71, 0x5dd               
  {0B911}  lcall    0x1c71, 0x291               
  {0B916}  mov      word ptr [0x66], 0x1f4      
  {0B91C}  cmp      word ptr [0x184], 0            // PRZEDM.PASZOL
  {0B921}  jne      0xb95e                      
  {0B923}  mov      ax, 0x14                    
  {0B926}  push     ax                          
  {0B927}  lcall    0x1c71, 0xbe4               
  {0B92C}  mov      word ptr [0x19e], ax        
  {0B92F}  cmp      word ptr [0x19e], 0xa       
  {0B934}  jge      0xb95e                      
  {0B936}  mov      ax, word ptr [0x1d6]        
  {0B939}  mov      word ptr [0x184], ax           // PRZEDM.PASZOL
  {0B93C}  mov      di, 0x7a2                   
  {0B93F}  push     ds                          
  {0B940}  push     di                          
  {0B941}  mov      di, 0x8d4a                  
  {0B944}  push     cs                          
  {0B945}  push     di                          
  {0B946}  xor      ax, ax                      
  {0B948}  push     ax                          
  {0B949}  lcall    0x1c71, 0x701               
  {0B94E}  lcall    0x1c71, 0x5dd               
  {0B953}  lcall    0x1c71, 0x291               
  {0B958}  mov      word ptr [0x68], 0x12c      
  {0B95E}  cmp      word ptr [0x186], 0            // PRZEDM.WIMP
  {0B963}  jne      0xb9a0                      
  {0B965}  mov      ax, 0x14                    
  {0B968}  push     ax                          
  {0B969}  lcall    0x1c71, 0xbe4               
  {0B96E}  mov      word ptr [0x19e], ax        
  {0B971}  cmp      word ptr [0x19e], 6         
  {0B976}  jge      0xb9a0                      
  {0B978}  mov      ax, word ptr [0x1d6]        
  {0B97B}  mov      word ptr [0x186], ax           // PRZEDM.WIMP
  {0B97E}  mov      di, 0x7a2                   
  {0B981}  push     ds                          
  {0B982}  push     di                          
  {0B983}  mov      di, 0x8d77                  
  {0B986}  push     cs                          
  {0B987}  push     di                          
  {0B988}  xor      ax, ax                      
  {0B98A}  push     ax                          
  {0B98B}  lcall    0x1c71, 0x701               
  {0B990}  lcall    0x1c71, 0x5dd               
  {0B995}  lcall    0x1c71, 0x291               
  {0B99A}  mov      word ptr [0x6a], 0x32       
  {0B9A0}  jmp      0xb9ad                      
  {0B9A2}  xor      ax, ax                      
  {0B9A4}  mov      word ptr [0x1d2], ax        
  {0B9A7}  mov      word ptr [0x1d6], 0xb       
  {0B9AD}  mov      di, 0x7a2                   
  {0B9B0}  push     ds                          
  {0B9B1}  push     di                          
  {0B9B2}  mov      ax, word ptr [0x19c]        
  {0B9B5}  cdq                                  
  {0B9B6}  push     dx                          
  {0B9B7}  push     ax                          
  {0B9B8}  xor      ax, ax                      
  {0B9BA}  push     ax                          
  {0B9BB}  lcall    0x1c71, 0x789               
  {0B9C0}  mov      di, 0x8c9d                  
  {0B9C3}  push     cs                          
  {0B9C4}  push     di                          
  {0B9C5}  xor      ax, ax                      
  {0B9C7}  push     ax                          
  {0B9C8}  lcall    0x1c71, 0x701               
  {0B9CD}  mov      ax, word ptr [0x1d4]        
  {0B9D0}  cdq                                  
  {0B9D1}  push     dx                          
  {0B9D2}  push     ax                          
  {0B9D3}  xor      ax, ax                      
  {0B9D5}  push     ax                          
  {0B9D6}  lcall    0x1c71, 0x789               
  {0B9DB}  mov      al, 0x3e                    
  {0B9DD}  push     ax                          
  {0B9DE}  xor      ax, ax                      
  {0B9E0}  push     ax                          
  {0B9E1}  lcall    0x1c71, 0x67b               
  {0B9E6}  lcall    0x1c71, 0x5fe               
  {0B9EB}  lcall    0x1c71, 0x291               
  {0B9F0}  mov      di, 0x6a2                   
  {0B9F3}  push     ds                          
  {0B9F4}  push     di                          
  {0B9F5}  mov      di, 0x564                   
  {0B9F8}  push     ds                          
  {0B9F9}  push     di                          
  {0B9FA}  mov      ax, 0xff                    
  {0B9FD}  push     ax                          
  {0B9FE}  lcall    0x1c71, 0x6c6               
  {0BA03}  lcall    0x1c71, 0x59d               
  {0BA08}  lcall    0x1c71, 0x291               
  {0BA0D}  mov      di, 0x564                   
  {0BA10}  push     ds                          
  {0BA11}  push     di                          
  {0BA12}  mov      di, 0x8ca0                  
  {0BA15}  push     cs                          
  {0BA16}  push     di                          
  {0BA17}  lcall    0x1c71, 0x9d7               
  {0BA1C}  jne      0xba56                      
  {0BA1E}  mov      di, 0x7a2                   
  {0BA21}  push     ds                          
  {0BA22}  push     di                          
  {0BA23}  mov      di, 0x8ca5                  
  {0BA26}  push     cs                          
  {0BA27}  push     di                          
  {0BA28}  xor      ax, ax                      
  {0BA2A}  push     ax                          
  {0BA2B}  lcall    0x1c71, 0x701               
  {0BA30}  lcall    0x1c71, 0x5dd               
  {0BA35}  lcall    0x1c71, 0x291               
  {0BA3A}  mov      di, 0x7a2                   
  {0BA3D}  push     ds                          
  {0BA3E}  push     di                          
  {0BA3F}  mov      di, 0x8e64                  
  {0BA42}  push     cs                          
  {0BA43}  push     di                          
  {0BA44}  xor      ax, ax                      
  {0BA46}  push     ax                          
  {0BA47}  lcall    0x1c71, 0x701               
  {0BA4C}  lcall    0x1c71, 0x5dd               
  {0BA51}  lcall    0x1c71, 0x291               
  {0BA56}  mov      di, 0x564                   
  {0BA59}  push     ds                          
  {0BA5A}  push     di                          
  {0BA5B}  mov      di, 0x8cd3                  
  {0BA5E}  push     cs                          
  {0BA5F}  push     di                          
  {0BA60}  lcall    0x1c71, 0x9d7               
  {0BA65}  jne      0xba6c                      
  {0BA67}  lcall    0x129d, 0x3114              
  {0BA6C}  mov      di, 0x564                   
  {0BA6F}  push     ds                          
  {0BA70}  push     di                          
  {0BA71}  mov      di, 0x8cd8                  
  {0BA74}  push     cs                          
  {0BA75}  push     di                          
  {0BA76}  lcall    0x1c71, 0x9d7               
  {0BA7B}  jne      0xba80                      
  {0BA7D}  jmp      0xf5c2                      
  {0BA80}  mov      di, 0x564                   
  {0BA83}  push     ds                          
  {0BA84}  push     di                          
  {0BA85}  mov      di, 0x8e7b                  
  {0BA88}  push     cs                          
  {0BA89}  push     di                          
  {0BA8A}  lcall    0x1c71, 0x9d7               
  {0BA8F}  jne      0xba97                      
  {0BA91}  mov      word ptr [0x1d6], 0xb       
  {0BA97}  cmp      word ptr [0x1d6], 0x10      
  {0BA9C}  jne      0xbaa1                      
  {0BA9E}  jmp      0xb854                      
  {0BAA1}  cmp      word ptr [0x1d6], 0x11      
  {0BAA6}  je       0xbaab                      
  {0BAA8}  jmp      0xbca2                      
  {0BAAB}  mov      di, 0x7a2                   
  {0BAAE}  push     ds                          
  {0BAAF}  push     di                          
  {0BAB0}  mov      di, 0x8e7f                  
  {0BAB3}  push     cs                          
  {0BAB4}  push     di                          
  {0BAB5}  xor      ax, ax                      
  {0BAB7}  push     ax                          
  {0BAB8}  lcall    0x1c71, 0x701               
  {0BABD}  lcall    0x1c71, 0x5dd               
  {0BAC2}  lcall    0x1c71, 0x291               
  {0BAC7}  mov      di, 0x7a2                   
  {0BACA}  push     ds                          
  {0BACB}  push     di                          
  {0BACC}  mov      ax, word ptr [0x19c]        
  {0BACF}  cdq                                  
  {0BAD0}  push     dx                          
  {0BAD1}  push     ax                          
  {0BAD2}  xor      ax, ax                      
  {0BAD4}  push     ax                          
  {0BAD5}  lcall    0x1c71, 0x789               
  {0BADA}  mov      di, 0x8c9d                  
  {0BADD}  push     cs                          
  {0BADE}  push     di                          
  {0BADF}  xor      ax, ax                      
  {0BAE1}  push     ax                          
  {0BAE2}  lcall    0x1c71, 0x701               
  {0BAE7}  mov      ax, word ptr [0x1d4]        
  {0BAEA}  cdq                                  
  {0BAEB}  push     dx                          
  {0BAEC}  push     ax                          
  {0BAED}  xor      ax, ax                      
  {0BAEF}  push     ax                          
  {0BAF0}  lcall    0x1c71, 0x789               
  {0BAF5}  mov      al, 0x3e                    
  {0BAF7}  push     ax                          
  {0BAF8}  xor      ax, ax                      
  {0BAFA}  push     ax                          
  {0BAFB}  lcall    0x1c71, 0x67b               
  {0BB00}  lcall    0x1c71, 0x5fe               
  {0BB05}  lcall    0x1c71, 0x291               
  {0BB0A}  mov      di, 0x6a2                   
  {0BB0D}  push     ds                          
  {0BB0E}  push     di                          
  {0BB0F}  mov      di, 0x564                   
  {0BB12}  push     ds                          
  {0BB13}  push     di                          
  {0BB14}  mov      ax, 0xff                    
  {0BB17}  push     ax                          
  {0BB18}  lcall    0x1c71, 0x6c6               
  {0BB1D}  lcall    0x1c71, 0x59d               
  {0BB22}  lcall    0x1c71, 0x291               
  {0BB27}  mov      di, 0x564                   
  {0BB2A}  push     ds                          
  {0BB2B}  push     di                          
  {0BB2C}  mov      di, 0x8cd3                  
  {0BB2F}  push     cs                          
  {0BB30}  push     di                          
  {0BB31}  lcall    0x1c71, 0x9d7               
  {0BB36}  jne      0xbb3d                      
  {0BB38}  lcall    0x129d, 0x3114              
  {0BB3D}  mov      di, 0x564                   
  {0BB40}  push     ds                          
  {0BB41}  push     di                          
  {0BB42}  mov      di, 0x8ca0                  
  {0BB45}  push     cs                          
  {0BB46}  push     di                          
  {0BB47}  lcall    0x1c71, 0x9d7               
  {0BB4C}  jne      0xbba2                      
  {0BB4E}  mov      di, 0x7a2                   
  {0BB51}  push     ds                          
  {0BB52}  push     di                          
  {0BB53}  mov      di, 0x8ca5                  
  {0BB56}  push     cs                          
  {0BB57}  push     di                          
  {0BB58}  xor      ax, ax                      
  {0BB5A}  push     ax                          
  {0BB5B}  lcall    0x1c71, 0x701               
  {0BB60}  lcall    0x1c71, 0x5dd               
  {0BB65}  lcall    0x1c71, 0x291               
  {0BB6A}  mov      di, 0x7a2                   
  {0BB6D}  push     ds                          
  {0BB6E}  push     di                          
  {0BB6F}  mov      di, 0x8eb6                  
  {0BB72}  push     cs                          
  {0BB73}  push     di                          
  {0BB74}  xor      ax, ax                      
  {0BB76}  push     ax                          
  {0BB77}  lcall    0x1c71, 0x701               
  {0BB7C}  lcall    0x1c71, 0x5dd               
  {0BB81}  lcall    0x1c71, 0x291               
  {0BB86}  mov      di, 0x7a2                   
  {0BB89}  push     ds                          
  {0BB8A}  push     di                          
  {0BB8B}  mov      di, 0x8ece                  
  {0BB8E}  push     cs                          
  {0BB8F}  push     di                          
  {0BB90}  xor      ax, ax                      
  {0BB92}  push     ax                          
  {0BB93}  lcall    0x1c71, 0x701               
  {0BB98}  lcall    0x1c71, 0x5dd               
  {0BB9D}  lcall    0x1c71, 0x291               
  {0BBA2}  mov      di, 0x564                   
  {0BBA5}  push     ds                          
  {0BBA6}  push     di                          
  {0BBA7}  mov      di, 0x8ede                  
  {0BBAA}  push     cs                          
  {0BBAB}  push     di                          
  {0BBAC}  lcall    0x1c71, 0x9d7               
  {0BBB1}  je       0xbbb6                      
  {0BBB3}  jmp      0xbc56                      
  {0BBB6}  mov      di, 0x7a2                   
  {0BBB9}  push     ds                          
  {0BBBA}  push     di                          
  {0BBBB}  mov      di, 0x8eeb                  
  {0BBBE}  push     cs                          
  {0BBBF}  push     di                          
  {0BBC0}  xor      ax, ax                      
  {0BBC2}  push     ax                          
  {0BBC3}  lcall    0x1c71, 0x701               
  {0BBC8}  lcall    0x1c71, 0x5dd               
  {0BBCD}  lcall    0x1c71, 0x291               
  {0BBD2}  mov      di, 0x7a2                   
  {0BBD5}  push     ds                          
  {0BBD6}  push     di                          
  {0BBD7}  mov      di, 0x8efe                  
  {0BBDA}  push     cs                          
  {0BBDB}  push     di                          
  {0BBDC}  xor      ax, ax                      
  {0BBDE}  push     ax                          
  {0BBDF}  lcall    0x1c71, 0x701               
  {0BBE4}  lcall    0x1c71, 0x5dd               
  {0BBE9}  lcall    0x1c71, 0x291               
  {0BBEE}  mov      di, 0x7a2                   
  {0BBF1}  push     ds                          
  {0BBF2}  push     di                          
  {0BBF3}  mov      di, 0x8f31                  
  {0BBF6}  push     cs                          
  {0BBF7}  push     di                          
  {0BBF8}  xor      ax, ax                      
  {0BBFA}  push     ax                          
  {0BBFB}  lcall    0x1c71, 0x701               
  {0BC00}  lcall    0x1c71, 0x5dd               
  {0BC05}  lcall    0x1c71, 0x291               
  {0BC0A}  mov      di, 0x7a2                   
  {0BC0D}  push     ds                          
  {0BC0E}  push     di                          
  {0BC0F}  mov      di, 0x8f66                  
  {0BC12}  push     cs                          
  {0BC13}  push     di                          
  {0BC14}  xor      ax, ax                      
  {0BC16}  push     ax                          
  {0BC17}  lcall    0x1c71, 0x701               
  {0BC1C}  lcall    0x1c71, 0x5dd               
  {0BC21}  lcall    0x1c71, 0x291               
  {0BC26}  cmp      word ptr [0x58], 0          
  {0BC2B}  jne      0xbc56                      
  {0BC2D}  cmp      word ptr [0x5a], 0          
  {0BC32}  jne      0xbc56                      
  {0BC34}  cmp      word ptr [0x68c], 0         
  {0BC39}  jne      0xbc56                      
  {0BC3B}  cmp      word ptr [0x5c], 0          
  {0BC40}  jne      0xbc56                      
  {0BC42}  cmp      word ptr [0x5e], 0          
  {0BC47}  jne      0xbc56                      
  {0BC49}  cmp      word ptr [0x188], 0            // PRZEDM.ZWIEJ
  {0BC4E}  jne      0xbc56                      
  {0BC50}  mov      word ptr [0x188], 0x11         // PRZEDM.ZWIEJ
  {0BC56}  mov      di, 0x564                   
  {0BC59}  push     ds                          
  {0BC5A}  push     di                          
  {0BC5B}  mov      di, 0x8cd8                  
  {0BC5E}  push     cs                          
  {0BC5F}  push     di                          
  {0BC60}  lcall    0x1c71, 0x9d7               
  {0BC65}  jne      0xbc6a                      
  {0BC67}  jmp      0xf5c2                      
  {0BC6A}  mov      di, 0x564                   
  {0BC6D}  push     ds                          
  {0BC6E}  push     di                          
  {0BC6F}  mov      di, 0x8fa1                  
  {0BC72}  push     cs                          
  {0BC73}  push     di                          
  {0BC74}  lcall    0x1c71, 0x9d7               
  {0BC79}  jne      0xbc81                      
  {0BC7B}  mov      word ptr [0x1d6], 0xb       
  {0BC81}  mov      di, 0x564                   
  {0BC84}  push     ds                          
  {0BC85}  push     di                          
  {0BC86}  mov      di, 0x8e7b                  
  {0BC89}  push     cs                          
  {0BC8A}  push     di                          
  {0BC8B}  lcall    0x1c71, 0x9d7               
  {0BC90}  jne      0xbc98                      
  {0BC92}  mov      word ptr [0x1d6], 0x12      
  {0BC98}  cmp      word ptr [0x1d6], 0x11      
  {0BC9D}  jne      0xbca2                      
  {0BC9F}  jmp      0xbac7                      
  {0BCA2}  cmp      word ptr [0x1d6], 0x12      
  {0BCA7}  jne      0xbd1f                      
  {0BCA9}  mov      di, 0x7a2                   
  {0BCAC}  push     ds                          
  {0BCAD}  push     di                          
  {0BCAE}  mov      di, 0x8fa6                  
  {0BCB1}  push     cs                          
  {0BCB2}  push     di                          
  {0BCB3}  xor      ax, ax                      
  {0BCB5}  push     ax                          
  {0BCB6}  lcall    0x1c71, 0x701               
  {0BCBB}  lcall    0x1c71, 0x5dd               
  {0BCC0}  lcall    0x1c71, 0x291               
  {0BCC5}  mov      di, 0x7a2                   
  {0BCC8}  push     ds                          
  {0BCC9}  push     di                          
  {0BCCA}  mov      di, 0x8fd6                  
  {0BCCD}  push     cs                          
  {0BCCE}  push     di                          
  {0BCCF}  xor      ax, ax                      
  {0BCD1}  push     ax                          
  {0BCD2}  lcall    0x1c71, 0x701               
  {0BCD7}  lcall    0x1c71, 0x5dd               
  {0BCDC}  lcall    0x1c71, 0x291               
  {0BCE1}  mov      di, 0x7a2                   
  {0BCE4}  push     ds                          
  {0BCE5}  push     di                          
  {0BCE6}  mov      di, 0x901c                  
  {0BCE9}  push     cs                          
  {0BCEA}  push     di                          
  {0BCEB}  xor      ax, ax                      
  {0BCED}  push     ax                          
  {0BCEE}  lcall    0x1c71, 0x701               
  {0BCF3}  lcall    0x1c71, 0x5dd               
  {0BCF8}  lcall    0x1c71, 0x291               
  {0BCFD}  mov      di, 0x7a2                   
  {0BD00}  push     ds                          
  {0BD01}  push     di                          
  {0BD02}  mov      di, 0x9067                  
  {0BD05}  push     cs                          
  {0BD06}  push     di                          
  {0BD07}  xor      ax, ax                      
  {0BD09}  push     ax                          
  {0BD0A}  lcall    0x1c71, 0x701               
  {0BD0F}  lcall    0x1c71, 0x5dd               
  {0BD14}  lcall    0x1c71, 0x291               
  {0BD19}  mov      word ptr [0x1d6], 1         
  {0BD1F}  cmp      word ptr [0x1d6], 0x14      
  {0BD24}  je       0xbd29                      
  {0BD26}  jmp      0xbf0a                      
  {0BD29}  mov      di, 0x7a2                   
  {0BD2C}  push     ds                          
  {0BD2D}  push     di                          
  {0BD2E}  mov      di, 0x90b2                  
  {0BD31}  push     cs                          
  {0BD32}  push     di                          
  {0BD33}  xor      ax, ax                      
  {0BD35}  push     ax                          
  {0BD36}  lcall    0x1c71, 0x701               
  {0BD3B}  lcall    0x1c71, 0x5dd               
  {0BD40}  lcall    0x1c71, 0x291               
  {0BD45}  lcall    0x129d, 0x2c22              
  {0BD4A}  mov      di, 0x7a2                   
  {0BD4D}  push     ds                          
  {0BD4E}  push     di                          
  {0BD4F}  mov      ax, word ptr [0x19c]        
  {0BD52}  cdq                                  
  {0BD53}  push     dx                          
  {0BD54}  push     ax                          
  {0BD55}  xor      ax, ax                      
  {0BD57}  push     ax                          
  {0BD58}  lcall    0x1c71, 0x789               
  {0BD5D}  mov      di, 0x8c9d                  
  {0BD60}  push     cs                          
  {0BD61}  push     di                          
  {0BD62}  xor      ax, ax                      
  {0BD64}  push     ax                          
  {0BD65}  lcall    0x1c71, 0x701               
  {0BD6A}  mov      ax, word ptr [0x1d4]        
  {0BD6D}  cdq                                  
  {0BD6E}  push     dx                          
  {0BD6F}  push     ax                          
  {0BD70}  xor      ax, ax                      
  {0BD72}  push     ax                          
  {0BD73}  lcall    0x1c71, 0x789               
  {0BD78}  mov      al, 0x3e                    
  {0BD7A}  push     ax                          
  {0BD7B}  xor      ax, ax                      
  {0BD7D}  push     ax                          
  {0BD7E}  lcall    0x1c71, 0x67b               
  {0BD83}  lcall    0x1c71, 0x5fe               
  {0BD88}  lcall    0x1c71, 0x291               
  {0BD8D}  mov      di, 0x6a2                   
  {0BD90}  push     ds                          
  {0BD91}  push     di                          
  {0BD92}  mov      di, 0x564                   
  {0BD95}  push     ds                          
  {0BD96}  push     di                          
  {0BD97}  mov      ax, 0xff                    
  {0BD9A}  push     ax                          
  {0BD9B}  lcall    0x1c71, 0x6c6               
  {0BDA0}  lcall    0x1c71, 0x59d               
  {0BDA5}  lcall    0x1c71, 0x291               
  {0BDAA}  mov      di, 0x564                   
  {0BDAD}  push     ds                          
  {0BDAE}  push     di                          
  {0BDAF}  mov      di, 0x8cd3                  
  {0BDB2}  push     cs                          
  {0BDB3}  push     di                          
  {0BDB4}  lcall    0x1c71, 0x9d7               
  {0BDB9}  jne      0xbdc0                      
  {0BDBB}  lcall    0x129d, 0x3114              
  {0BDC0}  mov      di, 0x564                   
  {0BDC3}  push     ds                          
  {0BDC4}  push     di                          
  {0BDC5}  mov      di, 0x8ede                  
  {0BDC8}  push     cs                          
  {0BDC9}  push     di                          
  {0BDCA}  lcall    0x1c71, 0x9d7               
  {0BDCF}  jne      0xbded                      
  {0BDD1}  mov      di, 0x7a2                   
  {0BDD4}  push     ds                          
  {0BDD5}  push     di                          
  {0BDD6}  mov      di, 0x90f0                  
  {0BDD9}  push     cs                          
  {0BDDA}  push     di                          
  {0BDDB}  xor      ax, ax                      
  {0BDDD}  push     ax                          
  {0BDDE}  lcall    0x1c71, 0x701               
  {0BDE3}  lcall    0x1c71, 0x5dd               
  {0BDE8}  lcall    0x1c71, 0x291               
  {0BDED}  mov      di, 0x564                   
  {0BDF0}  push     ds                          
  {0BDF1}  push     di                          
  {0BDF2}  mov      di, 0x8ca0                  
  {0BDF5}  push     cs                          
  {0BDF6}  push     di                          
  {0BDF7}  lcall    0x1c71, 0x9d7               
  {0BDFC}  je       0xbe01                      
  {0BDFE}  jmp      0xbe8d                      
  {0BE01}  mov      di, 0x7a2                   
  {0BE04}  push     ds                          
  {0BE05}  push     di                          
  {0BE06}  mov      di, 0x8ca5                  
  {0BE09}  push     cs                          
  {0BE0A}  push     di                          
  {0BE0B}  xor      ax, ax                      
  {0BE0D}  push     ax                          
  {0BE0E}  lcall    0x1c71, 0x701               
  {0BE13}  lcall    0x1c71, 0x5dd               
  {0BE18}  lcall    0x1c71, 0x291               
  {0BE1D}  mov      di, 0x7a2                   
  {0BE20}  push     ds                          
  {0BE21}  push     di                          
  {0BE22}  mov      di, 0x9111                  
  {0BE25}  push     cs                          
  {0BE26}  push     di                          
  {0BE27}  xor      ax, ax                      
  {0BE29}  push     ax                          
  {0BE2A}  lcall    0x1c71, 0x701               
  {0BE2F}  lcall    0x1c71, 0x5dd               
  {0BE34}  lcall    0x1c71, 0x291               
  {0BE39}  mov      di, 0x7a2                   
  {0BE3C}  push     ds                          
  {0BE3D}  push     di                          
  {0BE3E}  mov      di, 0x912a                  
  {0BE41}  push     cs                          
  {0BE42}  push     di                          
  {0BE43}  xor      ax, ax                      
  {0BE45}  push     ax                          
  {0BE46}  lcall    0x1c71, 0x701               
  {0BE4B}  lcall    0x1c71, 0x5dd               
  {0BE50}  lcall    0x1c71, 0x291               
  {0BE55}  mov      di, 0x7a2                   
  {0BE58}  push     ds                          
  {0BE59}  push     di                          
  {0BE5A}  mov      di, 0x913f                  
  {0BE5D}  push     cs                          
  {0BE5E}  push     di                          
  {0BE5F}  xor      ax, ax                      
  {0BE61}  push     ax                          
  {0BE62}  lcall    0x1c71, 0x701               
  {0BE67}  lcall    0x1c71, 0x5dd               
  {0BE6C}  lcall    0x1c71, 0x291               
  {0BE71}  mov      di, 0x7a2                   
  {0BE74}  push     ds                          
  {0BE75}  push     di                          
  {0BE76}  mov      di, 0x9150                  
  {0BE79}  push     cs                          
  {0BE7A}  push     di                          
  {0BE7B}  xor      ax, ax                      
  {0BE7D}  push     ax                          
  {0BE7E}  lcall    0x1c71, 0x701               
  {0BE83}  lcall    0x1c71, 0x5dd               
  {0BE88}  lcall    0x1c71, 0x291               
  {0BE8D}  mov      di, 0x564                   
  {0BE90}  push     ds                          
  {0BE91}  push     di                          
  {0BE92}  mov      di, 0x9160                  
  {0BE95}  push     cs                          
  {0BE96}  push     di                          
  {0BE97}  lcall    0x1c71, 0x9d7               
  {0BE9C}  jne      0xbea1                      
  {0BE9E}  jmp      0xf5c2                      
  {0BEA1}  mov      di, 0x564                   
  {0BEA4}  push     ds                          
  {0BEA5}  push     di                          
  {0BEA6}  mov      di, 0x8ce0                  
  {0BEA9}  push     cs                          
  {0BEAA}  push     di                          
  {0BEAB}  lcall    0x1c71, 0x9d7               
  {0BEB0}  jne      0xbeb8                      
  {0BEB2}  mov      word ptr [0x1d6], 1         
  {0BEB8}  mov      di, 0x564                   
  {0BEBB}  push     ds                          
  {0BEBC}  push     di                          
  {0BEBD}  mov      di, 0x8e2d                  
  {0BEC0}  push     cs                          
  {0BEC1}  push     di                          
  {0BEC2}  lcall    0x1c71, 0x9d7               
  {0BEC7}  jne      0xbecf                      
  {0BEC9}  mov      word ptr [0x1d6], 0x15      
  {0BECF}  mov      di, 0x564                   
  {0BED2}  push     ds                          
  {0BED3}  push     di                          
  {0BED4}  mov      di, 0x9169                  
  {0BED7}  push     cs                          
  {0BED8}  push     di                          
  {0BED9}  lcall    0x1c71, 0x9d7               
  {0BEDE}  jne      0xbee6                      
  {0BEE0}  mov      word ptr [0x1d6], 0x1e      
  {0BEE6}  mov      di, 0x564                   
  {0BEE9}  push     ds                          
  {0BEEA}  push     di                          
  {0BEEB}  mov      di, 0x9170                  
  {0BEEE}  push     cs                          
  {0BEEF}  push     di                          
  {0BEF0}  lcall    0x1c71, 0x9d7               
  {0BEF5}  jne      0xbefd                      
  {0BEF7}  mov      word ptr [0x1d6], 0x4b      
  {0BEFD}  call     0x11c2a                     
  {0BF00}  cmp      word ptr [0x1d6], 0x14      
  {0BF05}  jne      0xbf0a                      
  {0BF07}  jmp      0xbd4a                      
  {0BF0A}  cmp      word ptr [0x1d6], 0x4b      
  {0BF0F}  jne      0xbf16                      
  {0BF11}  lcall    0xf5d, 0x260c               
  {0BF16}  cmp      word ptr [0x1d6], 0x1e      
  {0BF1B}  jne      0xbf22                      
  {0BF1D}  lcall    0xf5d, 0x2068               
  {0BF22}  cmp      word ptr [0x1d6], 0x4c      
  {0BF27}  je       0xbf2c                      
  {0BF29}  jmp      0xc202                      
  {0BF2C}  mov      di, 0x7a2                   
  {0BF2F}  push     ds                          
  {0BF30}  push     di                          
  {0BF31}  mov      di, 0x9177                  
  {0BF34}  push     cs                          
  {0BF35}  push     di                          
  {0BF36}  xor      ax, ax                      
  {0BF38}  push     ax                          
  {0BF39}  lcall    0x1c71, 0x701               
  {0BF3E}  lcall    0x1c71, 0x5dd               
  {0BF43}  lcall    0x1c71, 0x291               
  {0BF48}  mov      di, 0x7a2                   
  {0BF4B}  push     ds                          
  {0BF4C}  push     di                          
  {0BF4D}  mov      di, 0x91b9                  
  {0BF50}  push     cs                          
  {0BF51}  push     di                          
  {0BF52}  xor      ax, ax                      
  {0BF54}  push     ax                          
  {0BF55}  lcall    0x1c71, 0x701               
  {0BF5A}  lcall    0x1c71, 0x5dd               
  {0BF5F}  lcall    0x1c71, 0x291               
  {0BF64}  mov      di, 0x7a2                   
  {0BF67}  push     ds                          
  {0BF68}  push     di                          
  {0BF69}  mov      di, 0x91f8                  
  {0BF6C}  push     cs                          
  {0BF6D}  push     di                          
  {0BF6E}  xor      ax, ax                      
  {0BF70}  push     ax                          
  {0BF71}  lcall    0x1c71, 0x701               
  {0BF76}  lcall    0x1c71, 0x5dd               
  {0BF7B}  lcall    0x1c71, 0x291               
  {0BF80}  mov      di, 0x7a2                   
  {0BF83}  push     ds                          
  {0BF84}  push     di                          
  {0BF85}  mov      di, 0x9230                  
  {0BF88}  push     cs                          
  {0BF89}  push     di                          
  {0BF8A}  xor      ax, ax                      
  {0BF8C}  push     ax                          
  {0BF8D}  lcall    0x1c71, 0x701               
  {0BF92}  lcall    0x1c71, 0x5dd               
  {0BF97}  lcall    0x1c71, 0x291               
  {0BF9C}  cmp      word ptr [0x684], 0x4c      
  {0BFA1}  jne      0xbfbf                      
  {0BFA3}  mov      di, 0x7a2                   
  {0BFA6}  push     ds                          
  {0BFA7}  push     di                          
  {0BFA8}  mov      di, 0x9268                  
  {0BFAB}  push     cs                          
  {0BFAC}  push     di                          
  {0BFAD}  xor      ax, ax                      
  {0BFAF}  push     ax                          
  {0BFB0}  lcall    0x1c71, 0x701               
  {0BFB5}  lcall    0x1c71, 0x5dd               
  {0BFBA}  lcall    0x1c71, 0x291               
  {0BFBF}  cmp      word ptr [0x680], 0x4c      
  {0BFC4}  jne      0xbfe2                      
  {0BFC6}  mov      di, 0x7a2                   
  {0BFC9}  push     ds                          
  {0BFCA}  push     di                          
  {0BFCB}  mov      di, 0x92a6                  
  {0BFCE}  push     cs                          
  {0BFCF}  push     di                          
  {0BFD0}  xor      ax, ax                      
  {0BFD2}  push     ax                          
  {0BFD3}  lcall    0x1c71, 0x701               
  {0BFD8}  lcall    0x1c71, 0x5dd               
  {0BFDD}  lcall    0x1c71, 0x291               
  {0BFE2}  cmp      word ptr [0x682], 0x4c      
  {0BFE7}  jne      0xc005                      
  {0BFE9}  mov      di, 0x7a2                   
  {0BFEC}  push     ds                          
  {0BFED}  push     di                          
  {0BFEE}  mov      di, 0x92c7                  
  {0BFF1}  push     cs                          
  {0BFF2}  push     di                          
  {0BFF3}  xor      ax, ax                      
  {0BFF5}  push     ax                          
  {0BFF6}  lcall    0x1c71, 0x701               
  {0BFFB}  lcall    0x1c71, 0x5dd               
  {0C000}  lcall    0x1c71, 0x291               
  {0C005}  mov      di, 0x7a2                   
  {0C008}  push     ds                          
  {0C009}  push     di                          
  {0C00A}  mov      ax, word ptr [0x19c]        
  {0C00D}  cdq                                  
  {0C00E}  push     dx                          
  {0C00F}  push     ax                          
  {0C010}  xor      ax, ax                      
  {0C012}  push     ax                          
  {0C013}  lcall    0x1c71, 0x789               
  {0C018}  mov      di, 0x8c9d                  
  {0C01B}  push     cs                          
  {0C01C}  push     di                          
  {0C01D}  xor      ax, ax                      
  {0C01F}  push     ax                          
  {0C020}  lcall    0x1c71, 0x701               
  {0C025}  mov      ax, word ptr [0x1d4]        
  {0C028}  cdq                                  
  {0C029}  push     dx                          
  {0C02A}  push     ax                          
  {0C02B}  xor      ax, ax                      
  {0C02D}  push     ax                          
  {0C02E}  lcall    0x1c71, 0x789               
  {0C033}  mov      al, 0x3e                    
  {0C035}  push     ax                          
  {0C036}  xor      ax, ax                      
  {0C038}  push     ax                          
  {0C039}  lcall    0x1c71, 0x67b               
  {0C03E}  lcall    0x1c71, 0x5fe               
  {0C043}  lcall    0x1c71, 0x291               
  {0C048}  mov      di, 0x6a2                   
  {0C04B}  push     ds                          
  {0C04C}  push     di                          
  {0C04D}  mov      di, 0x564                   
  {0C050}  push     ds                          
  {0C051}  push     di                          
  {0C052}  mov      ax, 0xff                    
  {0C055}  push     ax                          
  {0C056}  lcall    0x1c71, 0x6c6               
  {0C05B}  lcall    0x1c71, 0x59d               
  {0C060}  lcall    0x1c71, 0x291               
  {0C065}  mov      di, 0x564                   
  {0C068}  push     ds                          
  {0C069}  push     di                          
  {0C06A}  mov      di, 0x8cd3                  
  {0C06D}  push     cs                          
  {0C06E}  push     di                          
  {0C06F}  lcall    0x1c71, 0x9d7               
  {0C074}  jne      0xc07b                      
  {0C076}  lcall    0x129d, 0x3114              
  {0C07B}  mov      di, 0x564                   
  {0C07E}  push     ds                          
  {0C07F}  push     di                          
  {0C080}  mov      di, 0x8ca0                  
  {0C083}  push     cs                          
  {0C084}  push     di                          
  {0C085}  lcall    0x1c71, 0x9d7               
  {0C08A}  jne      0xc0c4                      
  {0C08C}  mov      di, 0x7a2                   
  {0C08F}  push     ds                          
  {0C090}  push     di                          
  {0C091}  mov      di, 0x8ca5                  
  {0C094}  push     cs                          
  {0C095}  push     di                          
  {0C096}  xor      ax, ax                      
  {0C098}  push     ax                          
  {0C099}  lcall    0x1c71, 0x701               
  {0C09E}  lcall    0x1c71, 0x5dd               
  {0C0A3}  lcall    0x1c71, 0x291               
  {0C0A8}  mov      di, 0x7a2                   
  {0C0AB}  push     ds                          
  {0C0AC}  push     di                          
  {0C0AD}  mov      di, 0x92f4                  
  {0C0B0}  push     cs                          
  {0C0B1}  push     di                          
  {0C0B2}  xor      ax, ax                      
  {0C0B4}  push     ax                          
  {0C0B5}  lcall    0x1c71, 0x701               
  {0C0BA}  lcall    0x1c71, 0x5dd               
  {0C0BF}  lcall    0x1c71, 0x291               
  {0C0C4}  mov      di, 0x564                   
  {0C0C7}  push     ds                          
  {0C0C8}  push     di                          
  {0C0C9}  mov      di, 0x8cd8                  
  {0C0CC}  push     cs                          
  {0C0CD}  push     di                          
  {0C0CE}  lcall    0x1c71, 0x9d7               
  {0C0D3}  jne      0xc0d8                      
  {0C0D5}  jmp      0xf5c2                      
  {0C0D8}  mov      di, 0x564                   
  {0C0DB}  push     ds                          
  {0C0DC}  push     di                          
  {0C0DD}  mov      di, 0x8ce0                  
  {0C0E0}  push     cs                          
  {0C0E1}  push     di                          
  {0C0E2}  lcall    0x1c71, 0x9d7               
  {0C0E7}  jne      0xc0ef                      
  {0C0E9}  mov      word ptr [0x1d6], 0x4b      
  {0C0EF}  mov      di, 0x564                   
  {0C0F2}  push     ds                          
  {0C0F3}  push     di                          
  {0C0F4}  mov      di, 0x930a                  
  {0C0F7}  push     cs                          
  {0C0F8}  push     di                          
  {0C0F9}  lcall    0x1c71, 0x9d7               
  {0C0FE}  jne      0xc170                      
  {0C100}  mov      di, 0x7a2                   
  {0C103}  push     ds                          
  {0C104}  push     di                          
  {0C105}  mov      di, 0x9310                  
  {0C108}  push     cs                          
  {0C109}  push     di                          
  {0C10A}  xor      ax, ax                      
  {0C10C}  push     ax                          
  {0C10D}  lcall    0x1c71, 0x701               
  {0C112}  lcall    0x1c71, 0x5dd               
  {0C117}  lcall    0x1c71, 0x291               
  {0C11C}  mov      di, 0x7a2                   
  {0C11F}  push     ds                          
  {0C120}  push     di                          
  {0C121}  mov      di, 0x9322                  
  {0C124}  push     cs                          
  {0C125}  push     di                          
  {0C126}  xor      ax, ax                      
  {0C128}  push     ax                          
  {0C129}  lcall    0x1c71, 0x701               
  {0C12E}  lcall    0x1c71, 0x5dd               
  {0C133}  lcall    0x1c71, 0x291               
  {0C138}  mov      di, 0x7a2                   
  {0C13B}  push     ds                          
  {0C13C}  push     di                          
  {0C13D}  mov      di, 0x9335                  
  {0C140}  push     cs                          
  {0C141}  push     di                          
  {0C142}  xor      ax, ax                      
  {0C144}  push     ax                          
  {0C145}  lcall    0x1c71, 0x701               
  {0C14A}  lcall    0x1c71, 0x5dd               
  {0C14F}  lcall    0x1c71, 0x291               
  {0C154}  mov      di, 0x7a2                   
  {0C157}  push     ds                          
  {0C158}  push     di                          
  {0C159}  mov      di, 0x9348                  
  {0C15C}  push     cs                          
  {0C15D}  push     di                          
  {0C15E}  xor      ax, ax                      
  {0C160}  push     ax                          
  {0C161}  lcall    0x1c71, 0x701               
  {0C166}  lcall    0x1c71, 0x5dd               
  {0C16B}  lcall    0x1c71, 0x291               
  {0C170}  mov      di, 0x564                   
  {0C173}  push     ds                          
  {0C174}  push     di                          
  {0C175}  mov      di, 0x935b                  
  {0C178}  push     cs                          
  {0C179}  push     di                          
  {0C17A}  lcall    0x1c71, 0x9d7               
  {0C17F}  jne      0xc190                      
  {0C181}  lcall    0x129d, 0x1400              
  {0C186}  xor      ax, ax                      
  {0C188}  mov      word ptr [0x680], ax        
  {0C18B}  lcall    0x129d, 0x2e9e              
  {0C190}  mov      di, 0x564                   
  {0C193}  push     ds                          
  {0C194}  push     di                          
  {0C195}  mov      di, 0x9367                  
  {0C198}  push     cs                          
  {0C199}  push     di                          
  {0C19A}  lcall    0x1c71, 0x9d7               
  {0C19F}  jne      0xc1b0                      
  {0C1A1}  lcall    0x129d, 0x1646              
  {0C1A6}  xor      ax, ax                      
  {0C1A8}  mov      word ptr [0x682], ax        
  {0C1AB}  lcall    0x129d, 0x1646              
  {0C1B0}  mov      di, 0x564                   
  {0C1B3}  push     ds                          
  {0C1B4}  push     di                          
  {0C1B5}  mov      di, 0x9372                  
  {0C1B8}  push     cs                          
  {0C1B9}  push     di                          
  {0C1BA}  lcall    0x1c71, 0x9d7               
  {0C1BF}  jne      0xc1cb                      
  {0C1C1}  lcall    0x129d, 0x1400              
  {0C1C6}  xor      ax, ax                      
  {0C1C8}  mov      word ptr [0x684], ax        
  {0C1CB}  mov      di, 0x564                   
  {0C1CE}  push     ds                          
  {0C1CF}  push     di                          
  {0C1D0}  mov      di, 0x937f                  
  {0C1D3}  push     cs                          
  {0C1D4}  push     di                          
  {0C1D5}  lcall    0x1c71, 0x9d7               
  {0C1DA}  jne      0xc1f8                      
  {0C1DC}  mov      di, 0x7a2                   
  {0C1DF}  push     ds                          
  {0C1E0}  push     di                          
  {0C1E1}  mov      di, 0x938a                  
  {0C1E4}  push     cs                          
  {0C1E5}  push     di                          
  {0C1E6}  xor      ax, ax                      
  {0C1E8}  push     ax                          
  {0C1E9}  lcall    0x1c71, 0x701               
  {0C1EE}  lcall    0x1c71, 0x5dd               
  {0C1F3}  lcall    0x1c71, 0x291               
  {0C1F8}  cmp      word ptr [0x1d6], 0x4c      
  {0C1FD}  jne      0xc202                      
  {0C1FF}  jmp      0xc005                      
  {0C202}  cmp      word ptr [0x1d6], 0x4d      
  {0C207}  je       0xc20c                      
  {0C209}  jmp      0xc3e3                      
  {0C20C}  mov      di, 0x7a2                   
  {0C20F}  push     ds                          
  {0C210}  push     di                          
  {0C211}  mov      di, 0x93b6                  
  {0C214}  push     cs                          
  {0C215}  push     di                          
  {0C216}  xor      ax, ax                      
  {0C218}  push     ax                          
  {0C219}  lcall    0x1c71, 0x701               
  {0C21E}  lcall    0x1c71, 0x5dd               
  {0C223}  lcall    0x1c71, 0x291               
  {0C228}  mov      di, 0x7a2                   
  {0C22B}  push     ds                          
  {0C22C}  push     di                          
  {0C22D}  mov      di, 0x93f7                  
  {0C230}  push     cs                          
  {0C231}  push     di                          
  {0C232}  xor      ax, ax                      
  {0C234}  push     ax                          
  {0C235}  lcall    0x1c71, 0x701               
  {0C23A}  lcall    0x1c71, 0x5dd               
  {0C23F}  lcall    0x1c71, 0x291               
  {0C244}  lcall    0x129d, 0xc59               
  {0C249}  mov      di, 0x7a2                   
  {0C24C}  push     ds                          
  {0C24D}  push     di                          
  {0C24E}  mov      ax, word ptr [0x19c]        
  {0C251}  cdq                                  
  {0C252}  push     dx                          
  {0C253}  push     ax                          
  {0C254}  xor      ax, ax                      
  {0C256}  push     ax                          
  {0C257}  lcall    0x1c71, 0x789               
  {0C25C}  mov      di, 0x8c9d                  
  {0C25F}  push     cs                          
  {0C260}  push     di                          
  {0C261}  xor      ax, ax                      
  {0C263}  push     ax                          
  {0C264}  lcall    0x1c71, 0x701               
  {0C269}  mov      ax, word ptr [0x1d4]        
  {0C26C}  cdq                                  
  {0C26D}  push     dx                          
  {0C26E}  push     ax                          
  {0C26F}  xor      ax, ax                      
  {0C271}  push     ax                          
  {0C272}  lcall    0x1c71, 0x789               
  {0C277}  mov      al, 0x3e                    
  {0C279}  push     ax                          
  {0C27A}  xor      ax, ax                      
  {0C27C}  push     ax                          
  {0C27D}  lcall    0x1c71, 0x67b               
  {0C282}  lcall    0x1c71, 0x5fe               
  {0C287}  lcall    0x1c71, 0x291               
  {0C28C}  mov      di, 0x6a2                   
  {0C28F}  push     ds                          
  {0C290}  push     di                          
  {0C291}  mov      di, 0x564                   
  {0C294}  push     ds                          
  {0C295}  push     di                          
  {0C296}  mov      ax, 0xff                    
  {0C299}  push     ax                          
  {0C29A}  lcall    0x1c71, 0x6c6               
  {0C29F}  lcall    0x1c71, 0x59d               
  {0C2A4}  lcall    0x1c71, 0x291               
  {0C2A9}  lcall    0x129d, 0x9137              
  {0C2AE}  lcall    0x129d, 0x8be7              
  {0C2B3}  mov      di, 0x564                   
  {0C2B6}  push     ds                          
  {0C2B7}  push     di                          
  {0C2B8}  mov      di, 0x8cd3                  
  {0C2BB}  push     cs                          
  {0C2BC}  push     di                          
  {0C2BD}  lcall    0x1c71, 0x9d7               
  {0C2C2}  jne      0xc2c9                      
  {0C2C4}  lcall    0x129d, 0x3114              
  {0C2C9}  mov      di, 0x564                   
  {0C2CC}  push     ds                          
  {0C2CD}  push     di                          
  {0C2CE}  mov      di, 0x8ca0                  
  {0C2D1}  push     cs                          
  {0C2D2}  push     di                          
  {0C2D3}  lcall    0x1c71, 0x9d7               
  {0C2D8}  je       0xc2dd                      
  {0C2DA}  jmp      0xc369                      
  {0C2DD}  mov      di, 0x7a2                   
  {0C2E0}  push     ds                          
  {0C2E1}  push     di                          
  {0C2E2}  mov      di, 0x8ca5                  
  {0C2E5}  push     cs                          
  {0C2E6}  push     di                          
  {0C2E7}  xor      ax, ax                      
  {0C2E9}  push     ax                          
  {0C2EA}  lcall    0x1c71, 0x701               
  {0C2EF}  lcall    0x1c71, 0x5dd               
  {0C2F4}  lcall    0x1c71, 0x291               
  {0C2F9}  mov      di, 0x7a2                   
  {0C2FC}  push     ds                          
  {0C2FD}  push     di                          
  {0C2FE}  mov      di, 0x9431                  
  {0C301}  push     cs                          
  {0C302}  push     di                          
  {0C303}  xor      ax, ax                      
  {0C305}  push     ax                          
  {0C306}  lcall    0x1c71, 0x701               
  {0C30B}  lcall    0x1c71, 0x5dd               
  {0C310}  lcall    0x1c71, 0x291               
  {0C315}  mov      di, 0x7a2                   
  {0C318}  push     ds                          
  {0C319}  push     di                          
  {0C31A}  mov      di, 0x9442                  
  {0C31D}  push     cs                          
  {0C31E}  push     di                          
  {0C31F}  xor      ax, ax                      
  {0C321}  push     ax                          
  {0C322}  lcall    0x1c71, 0x701               
  {0C327}  lcall    0x1c71, 0x5dd               
  {0C32C}  lcall    0x1c71, 0x291               
  {0C331}  mov      di, 0x7a2                   
  {0C334}  push     ds                          
  {0C335}  push     di                          
  {0C336}  mov      di, 0x9451                  
  {0C339}  push     cs                          
  {0C33A}  push     di                          
  {0C33B}  xor      ax, ax                      
  {0C33D}  push     ax                          
  {0C33E}  lcall    0x1c71, 0x701               
  {0C343}  lcall    0x1c71, 0x5dd               
  {0C348}  lcall    0x1c71, 0x291               
  {0C34D}  mov      di, 0x7a2                   
  {0C350}  push     ds                          
  {0C351}  push     di                          
  {0C352}  mov      di, 0x9460                  
  {0C355}  push     cs                          
  {0C356}  push     di                          
  {0C357}  xor      ax, ax                      
  {0C359}  push     ax                          
  {0C35A}  lcall    0x1c71, 0x701               
  {0C35F}  lcall    0x1c71, 0x5dd               
  {0C364}  lcall    0x1c71, 0x291               
  {0C369}  mov      di, 0x564                   
  {0C36C}  push     ds                          
  {0C36D}  push     di                          
  {0C36E}  mov      di, 0x8cd8                  
  {0C371}  push     cs                          
  {0C372}  push     di                          
  {0C373}  lcall    0x1c71, 0x9d7               
  {0C378}  jne      0xc37d                      
  {0C37A}  jmp      0xf5c2                      
  {0C37D}  mov      di, 0x564                   
  {0C380}  push     ds                          
  {0C381}  push     di                          
  {0C382}  mov      di, 0x8e2d                  
  {0C385}  push     cs                          
  {0C386}  push     di                          
  {0C387}  lcall    0x1c71, 0x9d7               
  {0C38C}  jne      0xc394                      
  {0C38E}  mov      word ptr [0x1d6], 0x4b      
  {0C394}  mov      di, 0x564                   
  {0C397}  push     ds                          
  {0C398}  push     di                          
  {0C399}  mov      di, 0x9170                  
  {0C39C}  push     cs                          
  {0C39D}  push     di                          
  {0C39E}  lcall    0x1c71, 0x9d7               
  {0C3A3}  jne      0xc3ab                      
  {0C3A5}  mov      word ptr [0x1d6], 0x4e      
  {0C3AB}  mov      di, 0x564                   
  {0C3AE}  push     ds                          
  {0C3AF}  push     di                          
  {0C3B0}  mov      di, 0x9169                  
  {0C3B3}  push     cs                          
  {0C3B4}  push     di                          
  {0C3B5}  lcall    0x1c71, 0x9d7               
  {0C3BA}  jne      0xc3c2                      
  {0C3BC}  mov      word ptr [0x1d6], 0x4f      
  {0C3C2}  mov      di, 0x564                   
  {0C3C5}  push     ds                          
  {0C3C6}  push     di                          
  {0C3C7}  mov      di, 0x8ce0                  
  {0C3CA}  push     cs                          
  {0C3CB}  push     di                          
  {0C3CC}  lcall    0x1c71, 0x9d7               
  {0C3D1}  jne      0xc3d9                      
  {0C3D3}  mov      word ptr [0x1d6], 0x50      
  {0C3D9}  cmp      word ptr [0x1d6], 0x4d      
  {0C3DE}  jne      0xc3e3                      
  {0C3E0}  jmp      0xc249                      
  {0C3E3}  cmp      word ptr [0x1d6], 0x4e      
  {0C3E8}  je       0xc3ed                      
  {0C3EA}  jmp      0xc528                      
  {0C3ED}  mov      di, 0x7a2                   
  {0C3F0}  push     ds                          
  {0C3F1}  push     di                          
  {0C3F2}  mov      di, 0x9471                  
  {0C3F5}  push     cs                          
  {0C3F6}  push     di                          
  {0C3F7}  xor      ax, ax                      
  {0C3F9}  push     ax                          
  {0C3FA}  lcall    0x1c71, 0x701               
  {0C3FF}  lcall    0x1c71, 0x5dd               
  {0C404}  lcall    0x1c71, 0x291               
  {0C409}  mov      di, 0x7a2                   
  {0C40C}  push     ds                          
  {0C40D}  push     di                          
  {0C40E}  mov      di, 0x9494                  
  {0C411}  push     cs                          
  {0C412}  push     di                          
  {0C413}  xor      ax, ax                      
  {0C415}  push     ax                          
  {0C416}  lcall    0x1c71, 0x701               
  {0C41B}  lcall    0x1c71, 0x5dd               
  {0C420}  lcall    0x1c71, 0x291               
  {0C425}  lcall    0x129d, 0xc59               
  {0C42A}  mov      di, 0x7a2                   
  {0C42D}  push     ds                          
  {0C42E}  push     di                          
  {0C42F}  mov      ax, word ptr [0x19c]        
  {0C432}  cdq                                  
  {0C433}  push     dx                          
  {0C434}  push     ax                          
  {0C435}  xor      ax, ax                      
  {0C437}  push     ax                          
  {0C438}  lcall    0x1c71, 0x789               
  {0C43D}  mov      di, 0x8c9d                  
  {0C440}  push     cs                          
  {0C441}  push     di                          
  {0C442}  xor      ax, ax                      
  {0C444}  push     ax                          
  {0C445}  lcall    0x1c71, 0x701               
  {0C44A}  mov      ax, word ptr [0x1d4]        
  {0C44D}  cdq                                  
  {0C44E}  push     dx                          
  {0C44F}  push     ax                          
  {0C450}  xor      ax, ax                      
  {0C452}  push     ax                          
  {0C453}  lcall    0x1c71, 0x789               
  {0C458}  mov      al, 0x3e                    
  {0C45A}  push     ax                          
  {0C45B}  xor      ax, ax                      
  {0C45D}  push     ax                          
  {0C45E}  lcall    0x1c71, 0x67b               
  {0C463}  lcall    0x1c71, 0x5fe               
  {0C468}  lcall    0x1c71, 0x291               
  {0C46D}  mov      di, 0x6a2                   
  {0C470}  push     ds                          
  {0C471}  push     di                          
  {0C472}  mov      di, 0x564                   
  {0C475}  push     ds                          
  {0C476}  push     di                          
  {0C477}  mov      ax, 0xff                    
  {0C47A}  push     ax                          
  {0C47B}  lcall    0x1c71, 0x6c6               
  {0C480}  lcall    0x1c71, 0x59d               
  {0C485}  lcall    0x1c71, 0x291               
  {0C48A}  lcall    0x129d, 0x9137              
  {0C48F}  lcall    0x129d, 0x8be7              
  {0C494}  mov      di, 0x564                   
  {0C497}  push     ds                          
  {0C498}  push     di                          
  {0C499}  mov      di, 0x8cd3                  
  {0C49C}  push     cs                          
  {0C49D}  push     di                          
  {0C49E}  lcall    0x1c71, 0x9d7               
  {0C4A3}  jne      0xc4aa                      
  {0C4A5}  lcall    0x129d, 0x3114              
  {0C4AA}  mov      di, 0x564                   
  {0C4AD}  push     ds                          
  {0C4AE}  push     di                          
  {0C4AF}  mov      di, 0x8ca0                  
  {0C4B2}  push     cs                          
  {0C4B3}  push     di                          
  {0C4B4}  lcall    0x1c71, 0x9d7               
  {0C4B9}  jne      0xc4f3                      
  {0C4BB}  mov      di, 0x7a2                   
  {0C4BE}  push     ds                          
  {0C4BF}  push     di                          
  {0C4C0}  mov      di, 0x8ca5                  
  {0C4C3}  push     cs                          
  {0C4C4}  push     di                          
  {0C4C5}  xor      ax, ax                      
  {0C4C7}  push     ax                          
  {0C4C8}  lcall    0x1c71, 0x701               
  {0C4CD}  lcall    0x1c71, 0x5dd               
  {0C4D2}  lcall    0x1c71, 0x291               
  {0C4D7}  mov      di, 0x7a2                   
  {0C4DA}  push     ds                          
  {0C4DB}  push     di                          
  {0C4DC}  mov      di, 0x9451                  
  {0C4DF}  push     cs                          
  {0C4E0}  push     di                          
  {0C4E1}  xor      ax, ax                      
  {0C4E3}  push     ax                          
  {0C4E4}  lcall    0x1c71, 0x701               
  {0C4E9}  lcall    0x1c71, 0x5dd               
  {0C4EE}  lcall    0x1c71, 0x291               
  {0C4F3}  mov      di, 0x564                   
  {0C4F6}  push     ds                          
  {0C4F7}  push     di                          
  {0C4F8}  mov      di, 0x8cd8                  
  {0C4FB}  push     cs                          
  {0C4FC}  push     di                          
  {0C4FD}  lcall    0x1c71, 0x9d7               
  {0C502}  jne      0xc507                      
  {0C504}  jmp      0xf5c2                      
  {0C507}  mov      di, 0x564                   
  {0C50A}  push     ds                          
  {0C50B}  push     di                          
  {0C50C}  mov      di, 0x9169                  
  {0C50F}  push     cs                          
  {0C510}  push     di                          
  {0C511}  lcall    0x1c71, 0x9d7               
  {0C516}  jne      0xc51e                      
  {0C518}  mov      word ptr [0x1d6], 0x4d      
  {0C51E}  cmp      word ptr [0x1d6], 0x4e      
  {0C523}  jne      0xc528                      
  {0C525}  jmp      0xc42a                      
  {0C528}  cmp      word ptr [0x1d6], 0x4f      
  {0C52D}  je       0xc532                      
  {0C52F}  jmp      0xc66d                      
  {0C532}  mov      di, 0x7a2                   
  {0C535}  push     ds                          
  {0C536}  push     di                          
  {0C537}  mov      di, 0x94d6                  
  {0C53A}  push     cs                          
  {0C53B}  push     di                          
  {0C53C}  xor      ax, ax                      
  {0C53E}  push     ax                          
  {0C53F}  lcall    0x1c71, 0x701               
  {0C544}  lcall    0x1c71, 0x5dd               
  {0C549}  lcall    0x1c71, 0x291               
  {0C54E}  mov      di, 0x7a2                   
  {0C551}  push     ds                          
  {0C552}  push     di                          
  {0C553}  mov      di, 0x9511                  
  {0C556}  push     cs                          
  {0C557}  push     di                          
  {0C558}  xor      ax, ax                      
  {0C55A}  push     ax                          
  {0C55B}  lcall    0x1c71, 0x701               
  {0C560}  lcall    0x1c71, 0x5dd               
  {0C565}  lcall    0x1c71, 0x291               
  {0C56A}  lcall    0x129d, 0xc59               
  {0C56F}  mov      di, 0x7a2                   
  {0C572}  push     ds                          
  {0C573}  push     di                          
  {0C574}  mov      ax, word ptr [0x19c]        
  {0C577}  cdq                                  
  {0C578}  push     dx                          
  {0C579}  push     ax                          
  {0C57A}  xor      ax, ax                      
  {0C57C}  push     ax                          
  {0C57D}  lcall    0x1c71, 0x789               
  {0C582}  mov      di, 0x8c9d                  
  {0C585}  push     cs                          
  {0C586}  push     di                          
  {0C587}  xor      ax, ax                      
  {0C589}  push     ax                          
  {0C58A}  lcall    0x1c71, 0x701               
  {0C58F}  mov      ax, word ptr [0x1d4]        
  {0C592}  cdq                                  
  {0C593}  push     dx                          
  {0C594}  push     ax                          
  {0C595}  xor      ax, ax                      
  {0C597}  push     ax                          
  {0C598}  lcall    0x1c71, 0x789               
  {0C59D}  mov      al, 0x3e                    
  {0C59F}  push     ax                          
  {0C5A0}  xor      ax, ax                      
  {0C5A2}  push     ax                          
  {0C5A3}  lcall    0x1c71, 0x67b               
  {0C5A8}  lcall    0x1c71, 0x5fe               
  {0C5AD}  lcall    0x1c71, 0x291               
  {0C5B2}  mov      di, 0x6a2                   
  {0C5B5}  push     ds                          
  {0C5B6}  push     di                          
  {0C5B7}  mov      di, 0x564                   
  {0C5BA}  push     ds                          
  {0C5BB}  push     di                          
  {0C5BC}  mov      ax, 0xff                    
  {0C5BF}  push     ax                          
  {0C5C0}  lcall    0x1c71, 0x6c6               
  {0C5C5}  lcall    0x1c71, 0x59d               
  {0C5CA}  lcall    0x1c71, 0x291               
  {0C5CF}  lcall    0x129d, 0x9137              
  {0C5D4}  lcall    0x129d, 0x8be7              
  {0C5D9}  mov      di, 0x564                   
  {0C5DC}  push     ds                          
  {0C5DD}  push     di                          
  {0C5DE}  mov      di, 0x8cd3                  
  {0C5E1}  push     cs                          
  {0C5E2}  push     di                          
  {0C5E3}  lcall    0x1c71, 0x9d7               
  {0C5E8}  jne      0xc5ef                      
  {0C5EA}  lcall    0x129d, 0x3114              
  {0C5EF}  mov      di, 0x564                   
  {0C5F2}  push     ds                          
  {0C5F3}  push     di                          
  {0C5F4}  mov      di, 0x8ca0                  
  {0C5F7}  push     cs                          
  {0C5F8}  push     di                          
  {0C5F9}  lcall    0x1c71, 0x9d7               
  {0C5FE}  jne      0xc638                      
  {0C600}  mov      di, 0x7a2                   
  {0C603}  push     ds                          
  {0C604}  push     di                          
  {0C605}  mov      di, 0x8ca5                  
  {0C608}  push     cs                          
  {0C609}  push     di                          
  {0C60A}  xor      ax, ax                      
  {0C60C}  push     ax                          
  {0C60D}  lcall    0x1c71, 0x701               
  {0C612}  lcall    0x1c71, 0x5dd               
  {0C617}  lcall    0x1c71, 0x291               
  {0C61C}  mov      di, 0x7a2                   
  {0C61F}  push     ds                          
  {0C620}  push     di                          
  {0C621}  mov      di, 0x9442                  
  {0C624}  push     cs                          
  {0C625}  push     di                          
  {0C626}  xor      ax, ax                      
  {0C628}  push     ax                          
  {0C629}  lcall    0x1c71, 0x701               
  {0C62E}  lcall    0x1c71, 0x5dd               
  {0C633}  lcall    0x1c71, 0x291               
  {0C638}  mov      di, 0x564                   
  {0C63B}  push     ds                          
  {0C63C}  push     di                          
  {0C63D}  mov      di, 0x8cd8                  
  {0C640}  push     cs                          
  {0C641}  push     di                          
  {0C642}  lcall    0x1c71, 0x9d7               
  {0C647}  jne      0xc64c                      
  {0C649}  jmp      0xf5c2                      
  {0C64C}  mov      di, 0x564                   
  {0C64F}  push     ds                          
  {0C650}  push     di                          
  {0C651}  mov      di, 0x9170                  
  {0C654}  push     cs                          
  {0C655}  push     di                          
  {0C656}  lcall    0x1c71, 0x9d7               
  {0C65B}  jne      0xc663                      
  {0C65D}  mov      word ptr [0x1d6], 0x4d      
  {0C663}  cmp      word ptr [0x1d6], 0x4f      
  {0C668}  jne      0xc66d                      
  {0C66A}  jmp      0xc56f                      
  {0C66D}  cmp      word ptr [0x1d6], 0x50      
  {0C672}  je       0xc677                      
  {0C674}  jmp      0xc982                      
  {0C677}  mov      di, 0x7a2                   
  {0C67A}  push     ds                          
  {0C67B}  push     di                          
  {0C67C}  mov      di, 0x9547                  
  {0C67F}  push     cs                          
  {0C680}  push     di                          
  {0C681}  xor      ax, ax                      
  {0C683}  push     ax                          
  {0C684}  lcall    0x1c71, 0x701               
  {0C689}  lcall    0x1c71, 0x5dd               
  {0C68E}  lcall    0x1c71, 0x291               
  {0C693}  mov      di, 0x7a2                   
  {0C696}  push     ds                          
  {0C697}  push     di                          
  {0C698}  mov      di, 0x957e                  
  {0C69B}  push     cs                          
  {0C69C}  push     di                          
  {0C69D}  xor      ax, ax                      
  {0C69F}  push     ax                          
  {0C6A0}  lcall    0x1c71, 0x701               
  {0C6A5}  lcall    0x1c71, 0x5dd               
  {0C6AA}  lcall    0x1c71, 0x291               
  {0C6AF}  mov      di, 0x7a2                   
  {0C6B2}  push     ds                          
  {0C6B3}  push     di                          
  {0C6B4}  mov      di, 0x95be                  
  {0C6B7}  push     cs                          
  {0C6B8}  push     di                          
  {0C6B9}  xor      ax, ax                      
  {0C6BB}  push     ax                          
  {0C6BC}  lcall    0x1c71, 0x701               
  {0C6C1}  lcall    0x1c71, 0x5dd               
  {0C6C6}  lcall    0x1c71, 0x291               
  {0C6CB}  lcall    0x129d, 0xc59               
  {0C6D0}  mov      di, 0x7a2                   
  {0C6D3}  push     ds                          
  {0C6D4}  push     di                          
  {0C6D5}  mov      ax, word ptr [0x19c]        
  {0C6D8}  cdq                                  
  {0C6D9}  push     dx                          
  {0C6DA}  push     ax                          
  {0C6DB}  xor      ax, ax                      
  {0C6DD}  push     ax                          
  {0C6DE}  lcall    0x1c71, 0x789               
  {0C6E3}  mov      di, 0x8c9d                  
  {0C6E6}  push     cs                          
  {0C6E7}  push     di                          
  {0C6E8}  xor      ax, ax                      
  {0C6EA}  push     ax                          
  {0C6EB}  lcall    0x1c71, 0x701               
  {0C6F0}  mov      ax, word ptr [0x1d4]        
  {0C6F3}  cdq                                  
  {0C6F4}  push     dx                          
  {0C6F5}  push     ax                          
  {0C6F6}  xor      ax, ax                      
  {0C6F8}  push     ax                          
  {0C6F9}  lcall    0x1c71, 0x789               
  {0C6FE}  mov      al, 0x3e                    
  {0C700}  push     ax                          
  {0C701}  xor      ax, ax                      
  {0C703}  push     ax                          
  {0C704}  lcall    0x1c71, 0x67b               
  {0C709}  lcall    0x1c71, 0x5fe               
  {0C70E}  lcall    0x1c71, 0x291               
  {0C713}  mov      di, 0x6a2                   
  {0C716}  push     ds                          
  {0C717}  push     di                          
  {0C718}  mov      di, 0x564                   
  {0C71B}  push     ds                          
  {0C71C}  push     di                          
  {0C71D}  mov      ax, 0xff                    
  {0C720}  push     ax                          
  {0C721}  lcall    0x1c71, 0x6c6               
  {0C726}  lcall    0x1c71, 0x59d               
  {0C72B}  lcall    0x1c71, 0x291               
  {0C730}  lcall    0x129d, 0x9137              
  {0C735}  lcall    0x129d, 0x8be7              
  {0C73A}  mov      di, 0x564                   
  {0C73D}  push     ds                          
  {0C73E}  push     di                          
  {0C73F}  mov      di, 0x8cd3                  
  {0C742}  push     cs                          
  {0C743}  push     di                          
  {0C744}  lcall    0x1c71, 0x9d7               
  {0C749}  jne      0xc750                      
  {0C74B}  lcall    0x129d, 0x3114              
  {0C750}  mov      di, 0x564                   
  {0C753}  push     ds                          
  {0C754}  push     di                          
  {0C755}  mov      di, 0x8ca0                  
  {0C758}  push     cs                          
  {0C759}  push     di                          
  {0C75A}  lcall    0x1c71, 0x9d7               
  {0C75F}  je       0xc764                      
  {0C761}  jmp      0xc7f0                      
  {0C764}  mov      di, 0x7a2                   
  {0C767}  push     ds                          
  {0C768}  push     di                          
  {0C769}  mov      di, 0x8ca5                  
  {0C76C}  push     cs                          
  {0C76D}  push     di                          
  {0C76E}  xor      ax, ax                      
  {0C770}  push     ax                          
  {0C771}  lcall    0x1c71, 0x701               
  {0C776}  lcall    0x1c71, 0x5dd               
  {0C77B}  lcall    0x1c71, 0x291               
  {0C780}  mov      di, 0x7a2                   
  {0C783}  push     ds                          
  {0C784}  push     di                          
  {0C785}  mov      di, 0x95f3                  
  {0C788}  push     cs                          
  {0C789}  push     di                          
  {0C78A}  xor      ax, ax                      
  {0C78C}  push     ax                          
  {0C78D}  lcall    0x1c71, 0x701               
  {0C792}  lcall    0x1c71, 0x5dd               
  {0C797}  lcall    0x1c71, 0x291               
  {0C79C}  mov      di, 0x7a2                   
  {0C79F}  push     ds                          
  {0C7A0}  push     di                          
  {0C7A1}  mov      di, 0x9442                  
  {0C7A4}  push     cs                          
  {0C7A5}  push     di                          
  {0C7A6}  xor      ax, ax                      
  {0C7A8}  push     ax                          
  {0C7A9}  lcall    0x1c71, 0x701               
  {0C7AE}  lcall    0x1c71, 0x5dd               
  {0C7B3}  lcall    0x1c71, 0x291               
  {0C7B8}  mov      di, 0x7a2                   
  {0C7BB}  push     ds                          
  {0C7BC}  push     di                          
  {0C7BD}  mov      di, 0x9451                  
  {0C7C0}  push     cs                          
  {0C7C1}  push     di                          
  {0C7C2}  xor      ax, ax                      
  {0C7C4}  push     ax                          
  {0C7C5}  lcall    0x1c71, 0x701               
  {0C7CA}  lcall    0x1c71, 0x5dd               
  {0C7CF}  lcall    0x1c71, 0x291               
  {0C7D4}  mov      di, 0x7a2                   
  {0C7D7}  push     ds                          
  {0C7D8}  push     di                          
  {0C7D9}  mov      di, 0x9460                  
  {0C7DC}  push     cs                          
  {0C7DD}  push     di                          
  {0C7DE}  xor      ax, ax                      
  {0C7E0}  push     ax                          
  {0C7E1}  lcall    0x1c71, 0x701               
  {0C7E6}  lcall    0x1c71, 0x5dd               
  {0C7EB}  lcall    0x1c71, 0x291               
  {0C7F0}  mov      di, 0x564                   
  {0C7F3}  push     ds                          
  {0C7F4}  push     di                          
  {0C7F5}  mov      di, 0x8cd8                  
  {0C7F8}  push     cs                          
  {0C7F9}  push     di                          
  {0C7FA}  lcall    0x1c71, 0x9d7               
  {0C7FF}  jne      0xc804                      
  {0C801}  jmp      0xf5c2                      
  {0C804}  mov      di, 0x564                   
  {0C807}  push     ds                          
  {0C808}  push     di                          
  {0C809}  mov      di, 0x8e2d                  
  {0C80C}  push     cs                          
  {0C80D}  push     di                          
  {0C80E}  lcall    0x1c71, 0x9d7               
  {0C813}  jne      0xc81b                      
  {0C815}  mov      word ptr [0x1d6], 0x4d      
  {0C81B}  mov      di, 0x564                   
  {0C81E}  push     ds                          
  {0C81F}  push     di                          
  {0C820}  mov      di, 0x9169                  
  {0C823}  push     cs                          
  {0C824}  push     di                          
  {0C825}  lcall    0x1c71, 0x9d7               
  {0C82A}  jne      0xc832                      
  {0C82C}  mov      word ptr [0x1d6], 0x51      
  {0C832}  mov      di, 0x564                   
  {0C835}  push     ds                          
  {0C836}  push     di                          
  {0C837}  mov      di, 0x9170                  
  {0C83A}  push     cs                          
  {0C83B}  push     di                          
  {0C83C}  lcall    0x1c71, 0x9d7               
  {0C841}  jne      0xc849                      
  {0C843}  mov      word ptr [0x1d6], 0x52      
  {0C849}  mov      di, 0x564                   
  {0C84C}  push     ds                          
  {0C84D}  push     di                          
  {0C84E}  mov      di, 0x8ce0                  
  {0C851}  push     cs                          
  {0C852}  push     di                          
  {0C853}  lcall    0x1c71, 0x9d7               
  {0C858}  jne      0xc860                      
  {0C85A}  mov      word ptr [0x1d6], 0x53      
  {0C860}  mov      di, 0x564                   
  {0C863}  push     ds                          
  {0C864}  push     di                          
  {0C865}  mov      di, 0x9602                  
  {0C868}  push     cs                          
  {0C869}  push     di                          
  {0C86A}  lcall    0x1c71, 0x9d7               
  {0C86F}  jne      0xc88d                      
  {0C871}  mov      di, 0x7a2                   
  {0C874}  push     ds                          
  {0C875}  push     di                          
  {0C876}  mov      di, 0x960e                  
  {0C879}  push     cs                          
  {0C87A}  push     di                          
  {0C87B}  xor      ax, ax                      
  {0C87D}  push     ax                          
  {0C87E}  lcall    0x1c71, 0x701               
  {0C883}  lcall    0x1c71, 0x5dd               
  {0C888}  lcall    0x1c71, 0x291               
  {0C88D}  mov      di, 0x564                   
  {0C890}  push     ds                          
  {0C891}  push     di                          
  {0C892}  mov      di, 0x9649                  
  {0C895}  push     cs                          
  {0C896}  push     di                          
  {0C897}  lcall    0x1c71, 0x9d7               
  {0C89C}  je       0xc8a1                      
  {0C89E}  jmp      0xc978                      
  {0C8A1}  mov      ax, 3                       
  {0C8A4}  push     ax                          
  {0C8A5}  lcall    0x1c71, 0xbe4               
  {0C8AA}  inc      ax                          
  {0C8AB}  mov      word ptr [0x19e], ax        
  {0C8AE}  mov      di, 0x7a2                   
  {0C8B1}  push     ds                          
  {0C8B2}  push     di                          
  {0C8B3}  mov      di, 0x9657                  
  {0C8B6}  push     cs                          
  {0C8B7}  push     di                          
  {0C8B8}  xor      ax, ax                      
  {0C8BA}  push     ax                          
  {0C8BB}  lcall    0x1c71, 0x701               
  {0C8C0}  mov      ax, word ptr [0x19e]        
  {0C8C3}  cdq                                  
  {0C8C4}  push     dx                          
  {0C8C5}  push     ax                          
  {0C8C6}  xor      ax, ax                      
  {0C8C8}  push     ax                          
  {0C8C9}  lcall    0x1c71, 0x789               
  {0C8CE}  mov      di, 0x968a                  
  {0C8D1}  push     cs                          
  {0C8D2}  push     di                          
  {0C8D3}  xor      ax, ax                      
  {0C8D5}  push     ax                          
  {0C8D6}  lcall    0x1c71, 0x701               
  {0C8DB}  lcall    0x1c71, 0x5dd               
  {0C8E0}  lcall    0x1c71, 0x291               
  {0C8E5}  mov      ax, word ptr [0x19e]        
  {0C8E8}  cdq                                  
  {0C8E9}  add      ax, word ptr [0x21a]        
  {0C8ED}  adc      dx, word ptr [0x21c]        
  {0C8F1}  mov      word ptr [0x21a], ax        
  {0C8F4}  mov      word ptr [0x21c], dx        
  {0C8F8}  mov      ax, 0x64                    
  {0C8FB}  push     ax                          
  {0C8FC}  lcall    0x1c71, 0xbe4               
  {0C901}  mov      word ptr [0x19e], ax        
  {0C904}  cmp      word ptr [0x19e], 0xa       
  {0C909}  jge      0xc978                      
  {0C90B}  mov      di, 0x7a2                   
  {0C90E}  push     ds                          
  {0C90F}  push     di                          
  {0C910}  mov      di, 0x9692                  
  {0C913}  push     cs                          
  {0C914}  push     di                          
  {0C915}  xor      ax, ax                      
  {0C917}  push     ax                          
  {0C918}  lcall    0x1c71, 0x701               
  {0C91D}  lcall    0x1c71, 0x5dd               
  {0C922}  lcall    0x1c71, 0x291               
  {0C927}  mov      ax, word ptr [0x19c]        
  {0C92A}  sub      ax, 0x28                    
  {0C92D}  mov      word ptr [0x19c], ax        
  {0C930}  mov      di, 0x7a2                   
  {0C933}  push     ds                          
  {0C934}  push     di                          
  {0C935}  mov      di, 0x96c9                  
  {0C938}  push     cs                          
  {0C939}  push     di                          
  {0C93A}  xor      ax, ax                      
  {0C93C}  push     ax                          
  {0C93D}  lcall    0x1c71, 0x701               
  {0C942}  lcall    0x1c71, 0x5dd               
  {0C947}  lcall    0x1c71, 0x291               
  {0C94C}  mov      ax, word ptr [0x21a]        
  {0C94F}  mov      dx, word ptr [0x21c]        
  {0C953}  sub      ax, 0x64                    
  {0C956}  sbb      dx, 0                       
  {0C959}  mov      word ptr [0x21a], ax        
  {0C95C}  mov      word ptr [0x21c], dx        
  {0C960}  cmp      word ptr [0x21c], 0         
  {0C965}  jl       0xc970                      
  {0C967}  jg       0xc978                      
  {0C969}  cmp      word ptr [0x21a], 0         
  {0C96E}  jae      0xc978                      
  {0C970}  xor      ax, ax                      
  {0C972}  mov      word ptr [0x21a], ax        
  {0C975}  mov      word ptr [0x21c], ax        
  {0C978}  cmp      word ptr [0x1d6], 0x50      
  {0C97D}  jne      0xc982                      
  {0C97F}  jmp      0xc6d0                      
  {0C982}  cmp      word ptr [0x1d6], 0x51      
  {0C987}  je       0xc98c                      
  {0C989}  jmp      0xcac7                      
  {0C98C}  mov      di, 0x7a2                   
  {0C98F}  push     ds                          
  {0C990}  push     di                          
  {0C991}  mov      di, 0x96e4                  
  {0C994}  push     cs                          
  {0C995}  push     di                          
  {0C996}  xor      ax, ax                      
  {0C998}  push     ax                          
  {0C999}  lcall    0x1c71, 0x701               
  {0C99E}  lcall    0x1c71, 0x5dd               
  {0C9A3}  lcall    0x1c71, 0x291               
  {0C9A8}  mov      di, 0x7a2                   
  {0C9AB}  push     ds                          
  {0C9AC}  push     di                          
  {0C9AD}  mov      di, 0x971a                  
  {0C9B0}  push     cs                          
  {0C9B1}  push     di                          
  {0C9B2}  xor      ax, ax                      
  {0C9B4}  push     ax                          
  {0C9B5}  lcall    0x1c71, 0x701               
  {0C9BA}  lcall    0x1c71, 0x5dd               
  {0C9BF}  lcall    0x1c71, 0x291               
  {0C9C4}  lcall    0x129d, 0xc59               
  {0C9C9}  mov      di, 0x7a2                   
  {0C9CC}  push     ds                          
  {0C9CD}  push     di                          
  {0C9CE}  mov      ax, word ptr [0x19c]        
  {0C9D1}  cdq                                  
  {0C9D2}  push     dx                          
  {0C9D3}  push     ax                          
  {0C9D4}  xor      ax, ax                      
  {0C9D6}  push     ax                          
  {0C9D7}  lcall    0x1c71, 0x789               
  {0C9DC}  mov      di, 0x8c9d                  
  {0C9DF}  push     cs                          
  {0C9E0}  push     di                          
  {0C9E1}  xor      ax, ax                      
  {0C9E3}  push     ax                          
  {0C9E4}  lcall    0x1c71, 0x701               
  {0C9E9}  mov      ax, word ptr [0x1d4]        
  {0C9EC}  cdq                                  
  {0C9ED}  push     dx                          
  {0C9EE}  push     ax                          
  {0C9EF}  xor      ax, ax                      
  {0C9F1}  push     ax                          
  {0C9F2}  lcall    0x1c71, 0x789               
  {0C9F7}  mov      al, 0x3e                    
  {0C9F9}  push     ax                          
  {0C9FA}  xor      ax, ax                      
  {0C9FC}  push     ax                          
  {0C9FD}  lcall    0x1c71, 0x67b               
  {0CA02}  lcall    0x1c71, 0x5fe               
  {0CA07}  lcall    0x1c71, 0x291               
  {0CA0C}  mov      di, 0x6a2                   
  {0CA0F}  push     ds                          
  {0CA10}  push     di                          
  {0CA11}  mov      di, 0x564                   
  {0CA14}  push     ds                          
  {0CA15}  push     di                          
  {0CA16}  mov      ax, 0xff                    
  {0CA19}  push     ax                          
  {0CA1A}  lcall    0x1c71, 0x6c6               
  {0CA1F}  lcall    0x1c71, 0x59d               
  {0CA24}  lcall    0x1c71, 0x291               
  {0CA29}  lcall    0x129d, 0x9137              
  {0CA2E}  lcall    0x129d, 0x8be7              
  {0CA33}  mov      di, 0x564                   
  {0CA36}  push     ds                          
  {0CA37}  push     di                          
  {0CA38}  mov      di, 0x8cd3                  
  {0CA3B}  push     cs                          
  {0CA3C}  push     di                          
  {0CA3D}  .byte    0x9a                        
  {0CA3E}  xlatb                                
  {0CA3F}  .byte    0x09                        
  {0CA40}  .byte    0x71                        

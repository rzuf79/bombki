# `BOMBKI.LEVELING`

Generated recovery aid for logic retained in the executable's main dispatcher.
It is not reconstructed source code.

- File spans: `0x0da0e`–`0x0de84`
- Boundaries were verified from exact command-string references and jumps.
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.KUNSZT`
- `PRZEDM.MAD`
- `PRZEDM.MAXE`
- `PRZEDM.MAXMAD`
- `PRZEDM.MAXMANA`
- `PRZEDM.MAXSIL`
- `PRZEDM.MAXZRE`
- `PRZEDM.POZIOM`
- `PRZEDM.PRA`
- `PRZEDM.SIL`
- `PRZEDM.ZRE`

## Calls

- `System.IOCheck`
- `System.WriteInteger`
- `System.WriteLn`
- `System.WriteString`

## Exact strings

- `"<<<<<<<<<=+=+=+!!!#####ZDOBYLES LEVEL#####!!!+=+=+=<<<<<<<<<<<<<"`
- `"<<<<<<<<<<<<ZYSKALES "`
- `" PRAKTYK >>>>>>>>>>>>>>>"`
- `" MAXIMUM ENERGI >>>>>>>>>>>>>"`
- `"<<<<<<<<<<<<<<ZYSKALES "`
- `"MANY >>>>>>>>>>>>>>>>>"`
- `"HURRRA TO JUZ DWUNASTY POZIOM , CZAS PODWYZSZYC MAXYMALNE PARAMETRY"`
- `"\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002 MASZ TERAZ "`
- `" MAXYMALNIE SILY \u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002"`
- `" MAXYMALNIE ZRECZNOSCI \u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002"`
- `" MAXYMALNIE MADROSCI \u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002"`

## Annotated listing

```asm
; BOMBKI.EXE file span 0x0da0e-0x0de84
0da0e  55                   push bp                           
0da0f  89e5                 mov bp, sp                        
0da11  31c0                 xor ax, ax                        
0da13  9acd02711c           lcall 0x1c71, 0x2cd               
0da18  813ed401bc02         cmp word ptr [0x1d4], 0x2bc        ; data PRZEDM.KUNSZT
0da1e  7c07                 jl 0xda27                         
0da20  803e5c0201           cmp byte ptr [0x25c], 1            ; data PRZEDM.POZIOM
0da25  745b                 je 0xda82                         
0da27  813ed401d502         cmp word ptr [0x1d4], 0x2d5        ; data PRZEDM.KUNSZT
0da2d  7c07                 jl 0xda36                         
0da2f  803e5c0202           cmp byte ptr [0x25c], 2            ; data PRZEDM.POZIOM
0da34  744c                 je 0xda82                         
0da36  813ed401da02         cmp word ptr [0x1d4], 0x2da        ; data PRZEDM.KUNSZT
0da3c  7c07                 jl 0xda45                         
0da3e  803e5c0203           cmp byte ptr [0x25c], 3            ; data PRZEDM.POZIOM
0da43  743d                 je 0xda82                         
0da45  a05c02               mov al, byte ptr [0x25c]           ; data PRZEDM.POZIOM
0da48  98                   cbw                               
0da49  05df02               add ax, 0x2df                     
0da4c  3b06d401             cmp ax, word ptr [0x1d4]           ; data PRZEDM.KUNSZT
0da50  7f0e                 jg 0xda60                         
0da52  803e5c0203           cmp byte ptr [0x25c], 3            ; data PRZEDM.POZIOM
0da57  7e07                 jle 0xda60                        
0da59  803e5c0209           cmp byte ptr [0x25c], 9            ; data PRZEDM.POZIOM
0da5e  7c22                 jl 0xda82                         
0da60  803e5c0208           cmp byte ptr [0x25c], 8            ; data PRZEDM.POZIOM
0da65  7f03                 jg 0xda6a                         
0da67  e91804               jmp 0xde82                        
0da6a  a05c02               mov al, byte ptr [0x25c]           ; data PRZEDM.POZIOM
0da6d  98                   cbw                               
0da6e  8bd0                 mov dx, ax                        
0da70  a05c02               mov al, byte ptr [0x25c]           ; data PRZEDM.POZIOM
0da73  98                   cbw                               
0da74  05df02               add ax, 0x2df                     
0da77  03c2                 add ax, dx                        
0da79  3b06d401             cmp ax, word ptr [0x1d4]           ; data PRZEDM.KUNSZT
0da7d  7e03                 jle 0xda82                        
0da7f  e90004               jmp 0xde82                        
0da82  bfa207               mov di, 0x7a2                     
0da85  1e                   push ds                           
0da86  57                   push di                           
0da87  bfa885               mov di, 0x85a8                     ; string "<<<<<<<<<=+=+=+!!!#####ZDOBYLES LEVEL#####!!!+=+=+=<<<<<<<<<<<<<"
0da8a  0e                   push cs                           
0da8b  57                   push di                           
0da8c  31c0                 xor ax, ax                        
0da8e  50                   push ax                           
0da8f  9a0107711c           lcall 0x1c71, 0x701                ; call System.WriteString
0da94  9add05711c           lcall 0x1c71, 0x5dd                ; call System.WriteLn
0da99  9a9102711c           lcall 0x1c71, 0x291                ; call System.IOCheck
0da9e  bfa207               mov di, 0x7a2                     
0daa1  1e                   push ds                           
0daa2  57                   push di                           
0daa3  bfa885               mov di, 0x85a8                     ; string "<<<<<<<<<=+=+=+!!!#####ZDOBYLES LEVEL#####!!!+=+=+=<<<<<<<<<<<<<"
0daa6  0e                   push cs                           
0daa7  57                   push di                           
0daa8  31c0                 xor ax, ax                        
0daaa  50                   push ax                           
0daab  9a0107711c           lcall 0x1c71, 0x701                ; call System.WriteString
0dab0  9add05711c           lcall 0x1c71, 0x5dd                ; call System.WriteLn
0dab5  9a9102711c           lcall 0x1c71, 0x291                ; call System.IOCheck
0daba  bfa207               mov di, 0x7a2                     
0dabd  1e                   push ds                           
0dabe  57                   push di                           
0dabf  bfa885               mov di, 0x85a8                     ; string "<<<<<<<<<=+=+=+!!!#####ZDOBYLES LEVEL#####!!!+=+=+=<<<<<<<<<<<<<"
0dac2  0e                   push cs                           
0dac3  57                   push di                           
0dac4  31c0                 xor ax, ax                        
0dac6  50                   push ax                           
0dac7  9a0107711c           lcall 0x1c71, 0x701                ; call System.WriteString
0dacc  9add05711c           lcall 0x1c71, 0x5dd                ; call System.WriteLn
0dad1  9a9102711c           lcall 0x1c71, 0x291                ; call System.IOCheck
0dad6  bfa207               mov di, 0x7a2                     
0dad9  1e                   push ds                           
0dada  57                   push di                           
0dadb  bfa885               mov di, 0x85a8                     ; string "<<<<<<<<<=+=+=+!!!#####ZDOBYLES LEVEL#####!!!+=+=+=<<<<<<<<<<<<<"
0dade  0e                   push cs                           
0dadf  57                   push di                           
0dae0  31c0                 xor ax, ax                        
0dae2  50                   push ax                           
0dae3  9a0107711c           lcall 0x1c71, 0x701                ; call System.WriteString
0dae8  9add05711c           lcall 0x1c71, 0x5dd                ; call System.WriteLn
0daed  9a9102711c           lcall 0x1c71, 0x291                ; call System.IOCheck
0daf2  803e5c0201           cmp byte ptr [0x25c], 1            ; data PRZEDM.POZIOM
0daf7  7509                 jne 0xdb02                        
0daf9  a1d401               mov ax, word ptr [0x1d4]           ; data PRZEDM.KUNSZT
0dafc  2dd502               sub ax, 0x2d5                     
0daff  a3d401               mov word ptr [0x1d4], ax           ; data PRZEDM.KUNSZT
0db02  803e5c0202           cmp byte ptr [0x25c], 2            ; data PRZEDM.POZIOM
0db07  7509                 jne 0xdb12                        
0db09  a1d401               mov ax, word ptr [0x1d4]           ; data PRZEDM.KUNSZT
0db0c  2dda02               sub ax, 0x2da                     
0db0f  a3d401               mov word ptr [0x1d4], ax           ; data PRZEDM.KUNSZT
0db12  803e5c0203           cmp byte ptr [0x25c], 3            ; data PRZEDM.POZIOM
0db17  7509                 jne 0xdb22                        
0db19  a1d401               mov ax, word ptr [0x1d4]           ; data PRZEDM.KUNSZT
0db1c  2ddf02               sub ax, 0x2df                     
0db1f  a3d401               mov word ptr [0x1d4], ax           ; data PRZEDM.KUNSZT
0db22  803e5c0203           cmp byte ptr [0x25c], 3            ; data PRZEDM.POZIOM
0db27  7e18                 jle 0xdb41                        
0db29  803e5c0209           cmp byte ptr [0x25c], 9            ; data PRZEDM.POZIOM
0db2e  7d11                 jge 0xdb41                        
0db30  a05c02               mov al, byte ptr [0x25c]           ; data PRZEDM.POZIOM
0db33  98                   cbw                               
0db34  8bd0                 mov dx, ax                        
0db36  a1d401               mov ax, word ptr [0x1d4]           ; data PRZEDM.KUNSZT
0db39  2ddf02               sub ax, 0x2df                     
0db3c  2bc2                 sub ax, dx                        
0db3e  a3d401               mov word ptr [0x1d4], ax           ; data PRZEDM.KUNSZT
0db41  803e5c0208           cmp byte ptr [0x25c], 8            ; data PRZEDM.POZIOM
0db46  7e13                 jle 0xdb5b                        
0db48  a05c02               mov al, byte ptr [0x25c]           ; data PRZEDM.POZIOM
0db4b  98                   cbw                               
0db4c  d1e0                 shl ax, 1                         
0db4e  8bd0                 mov dx, ax                        
0db50  a1d401               mov ax, word ptr [0x1d4]           ; data PRZEDM.KUNSZT
0db53  2bc2                 sub ax, dx                        
0db55  2ddf02               sub ax, 0x2df                     
0db58  a3d401               mov word ptr [0x1d4], ax           ; data PRZEDM.KUNSZT
0db5b  833e8c010b           cmp word ptr [0x18c], 0xb          ; data PRZEDM.MAD
0db60  7d09                 jge 0xdb6b                        
0db62  a19401               mov ax, word ptr [0x194]           ; data PRZEDM.PRA
0db65  050300               add ax, 3                         
0db68  a39401               mov word ptr [0x194], ax           ; data PRZEDM.PRA
0db6b  833e8c010a           cmp word ptr [0x18c], 0xa          ; data PRZEDM.MAD
0db70  7e10                 jle 0xdb82                        
0db72  833e8c0110           cmp word ptr [0x18c], 0x10         ; data PRZEDM.MAD
0db77  7d09                 jge 0xdb82                        
0db79  a19401               mov ax, word ptr [0x194]           ; data PRZEDM.PRA
0db7c  050400               add ax, 4                         
0db7f  a39401               mov word ptr [0x194], ax           ; data PRZEDM.PRA
0db82  833e8c010f           cmp word ptr [0x18c], 0xf          ; data PRZEDM.MAD
0db87  7e10                 jle 0xdb99                        
0db89  833e8c0117           cmp word ptr [0x18c], 0x17         ; data PRZEDM.MAD
0db8e  7d09                 jge 0xdb99                        
0db90  a19401               mov ax, word ptr [0x194]           ; data PRZEDM.PRA
0db93  050500               add ax, 5                         
0db96  a39401               mov word ptr [0x194], ax           ; data PRZEDM.PRA
0db99  833e8c0116           cmp word ptr [0x18c], 0x16         ; data PRZEDM.MAD
0db9e  7e09                 jle 0xdba9                        
0dba0  a19401               mov ax, word ptr [0x194]           ; data PRZEDM.PRA
0dba3  050600               add ax, 6                         
0dba6  a39401               mov word ptr [0x194], ax           ; data PRZEDM.PRA
0dba9  bfa207               mov di, 0x7a2                     
0dbac  1e                   push ds                           
0dbad  57                   push di                           
0dbae  bfe985               mov di, 0x85e9                     ; string "<<<<<<<<<<<<ZYSKALES "
0dbb1  0e                   push cs                           
0dbb2  57                   push di                           
0dbb3  31c0                 xor ax, ax                        
0dbb5  50                   push ax                           
0dbb6  9a0107711c           lcall 0x1c71, 0x701                ; call System.WriteString
0dbbb  a19401               mov ax, word ptr [0x194]           ; data PRZEDM.PRA
0dbbe  99                   cwd                               
0dbbf  52                   push dx                           
0dbc0  50                   push ax                           
0dbc1  31c0                 xor ax, ax                        
0dbc3  50                   push ax                           
0dbc4  9a8907711c           lcall 0x1c71, 0x789                ; call System.WriteInteger
0dbc9  bfff85               mov di, 0x85ff                     ; string " PRAKTYK >>>>>>>>>>>>>>>"
0dbcc  0e                   push cs                           
0dbcd  57                   push di                           
0dbce  31c0                 xor ax, ax                        
0dbd0  50                   push ax                           
0dbd1  9a0107711c           lcall 0x1c71, 0x701                ; call System.WriteString
0dbd6  9add05711c           lcall 0x1c71, 0x5dd                ; call System.WriteLn
0dbdb  9a9102711c           lcall 0x1c71, 0x291                ; call System.IOCheck
0dbe0  833e90010c           cmp word ptr [0x190], 0xc          ; data PRZEDM.ZRE
0dbe5  7e0b                 jle 0xdbf2                        
0dbe7  a16406               mov ax, word ptr [0x664]           ; data PRZEDM.MAXE
0dbea  050b00               add ax, 0xb                       
0dbed  a36406               mov word ptr [0x664], ax           ; data PRZEDM.MAXE
0dbf0  eb09                 jmp 0xdbfb                        
0dbf2  a16406               mov ax, word ptr [0x664]           ; data PRZEDM.MAXE
0dbf5  050a00               add ax, 0xa                       
0dbf8  a36406               mov word ptr [0x664], ax           ; data PRZEDM.MAXE
0dbfb  833e900110           cmp word ptr [0x190], 0x10         ; data PRZEDM.ZRE
0dc00  7e07                 jle 0xdc09                        
0dc02  a16406               mov ax, word ptr [0x664]           ; data PRZEDM.MAXE
0dc05  40                   inc ax                            
0dc06  a36406               mov word ptr [0x664], ax           ; data PRZEDM.MAXE
0dc09  833e900115           cmp word ptr [0x190], 0x15         ; data PRZEDM.ZRE
0dc0e  7e07                 jle 0xdc17                        
0dc10  a16406               mov ax, word ptr [0x664]           ; data PRZEDM.MAXE
0dc13  40                   inc ax                            
0dc14  a36406               mov word ptr [0x664], ax           ; data PRZEDM.MAXE
0dc17  833e90011a           cmp word ptr [0x190], 0x1a         ; data PRZEDM.ZRE
0dc1c  7e0e                 jle 0xdc2c                        
0dc1e  833e8e0114           cmp word ptr [0x18e], 0x14         ; data PRZEDM.SIL
0dc23  7e07                 jle 0xdc2c                        
0dc25  a16406               mov ax, word ptr [0x664]           ; data PRZEDM.MAXE
0dc28  40                   inc ax                            
0dc29  a36406               mov word ptr [0x664], ax           ; data PRZEDM.MAXE
0dc2c  bfa207               mov di, 0x7a2                     
0dc2f  1e                   push ds                           
0dc30  57                   push di                           
0dc31  bfe985               mov di, 0x85e9                     ; string "<<<<<<<<<<<<ZYSKALES "
0dc34  0e                   push cs                           
0dc35  57                   push di                           
0dc36  31c0                 xor ax, ax                        
0dc38  50                   push ax                           
0dc39  9a0107711c           lcall 0x1c71, 0x701                ; call System.WriteString
0dc3e  a16406               mov ax, word ptr [0x664]           ; data PRZEDM.MAXE
0dc41  99                   cwd                               
0dc42  52                   push dx                           
0dc43  50                   push ax                           
0dc44  31c0                 xor ax, ax                        
0dc46  50                   push ax                           
0dc47  9a8907711c           lcall 0x1c71, 0x789                ; call System.WriteInteger
0dc4c  bf1886               mov di, 0x8618                     ; string " MAXIMUM ENERGI >>>>>>>>>>>>>"
0dc4f  0e                   push cs                           
0dc50  57                   push di                           
0dc51  31c0                 xor ax, ax                        
0dc53  50                   push ax                           
0dc54  9a0107711c           lcall 0x1c71, 0x701                ; call System.WriteString
0dc59  9add05711c           lcall 0x1c71, 0x5dd                ; call System.WriteLn
0dc5e  9a9102711c           lcall 0x1c71, 0x291                ; call System.IOCheck
0dc63  a1ae01               mov ax, word ptr [0x1ae]           ; data PRZEDM.MAXMANA
0dc66  03068c01             add ax, word ptr [0x18c]           ; data PRZEDM.MAD
0dc6a  40                   inc ax                            
0dc6b  40                   inc ax                            
0dc6c  a3ae01               mov word ptr [0x1ae], ax           ; data PRZEDM.MAXMANA
0dc6f  bfa207               mov di, 0x7a2                     
0dc72  1e                   push ds                           
0dc73  57                   push di                           
0dc74  bf3686               mov di, 0x8636                     ; string "<<<<<<<<<<<<<<ZYSKALES "
0dc77  0e                   push cs                           
0dc78  57                   push di                           
0dc79  31c0                 xor ax, ax                        
0dc7b  50                   push ax                           
0dc7c  9a0107711c           lcall 0x1c71, 0x701                ; call System.WriteString
0dc81  a18c01               mov ax, word ptr [0x18c]           ; data PRZEDM.MAD
0dc84  40                   inc ax                            
0dc85  40                   inc ax                            
0dc86  99                   cwd                               
0dc87  52                   push dx                           
0dc88  50                   push ax                           
0dc89  31c0                 xor ax, ax                        
0dc8b  50                   push ax                           
0dc8c  9a8907711c           lcall 0x1c71, 0x789                ; call System.WriteInteger
0dc91  bf4e86               mov di, 0x864e                     ; string "MANY >>>>>>>>>>>>>>>>>"
0dc94  0e                   push cs                           
0dc95  57                   push di                           
0dc96  31c0                 xor ax, ax                        
0dc98  50                   push ax                           
0dc99  9a0107711c           lcall 0x1c71, 0x701                ; call System.WriteString
0dc9e  9add05711c           lcall 0x1c71, 0x5dd                ; call System.WriteLn
0dca3  9a9102711c           lcall 0x1c71, 0x291                ; call System.IOCheck
0dca8  a05c02               mov al, byte ptr [0x25c]           ; data PRZEDM.POZIOM
0dcab  98                   cbw                               
0dcac  40                   inc ax                            
0dcad  a25c02               mov byte ptr [0x25c], al           ; data PRZEDM.POZIOM
0dcb0  31c0                 xor ax, ax                        
0dcb2  a36c00               mov word ptr [0x6c], ax           
0dcb5  803e5c020c           cmp byte ptr [0x25c], 0xc          ; data PRZEDM.POZIOM
0dcba  7403                 je 0xdcbf                         
0dcbc  e9c301               jmp 0xde82                        
0dcbf  bfa207               mov di, 0x7a2                     
0dcc2  1e                   push ds                           
0dcc3  57                   push di                           
0dcc4  bf6586               mov di, 0x8665                     ; string "HURRRA TO JUZ DWUNASTY POZIOM , CZAS PODWYZSZYC MAXYMALNE PARAMETRY"
0dcc7  0e                   push cs                           
0dcc8  57                   push di                           
0dcc9  31c0                 xor ax, ax                        
0dccb  50                   push ax                           
0dccc  9a0107711c           lcall 0x1c71, 0x701                ; call System.WriteString
0dcd1  9add05711c           lcall 0x1c71, 0x5dd                ; call System.WriteLn
0dcd6  9a9102711c           lcall 0x1c71, 0x291                ; call System.IOCheck
0dcdb  a18e01               mov ax, word ptr [0x18e]           ; data PRZEDM.SIL
0dcde  3b069801             cmp ax, word ptr [0x198]           ; data PRZEDM.MAXSIL
0dce2  7c09                 jl 0xdced                         
0dce4  a19801               mov ax, word ptr [0x198]           ; data PRZEDM.MAXSIL
0dce7  050300               add ax, 3                         
0dcea  a39801               mov word ptr [0x198], ax           ; data PRZEDM.MAXSIL
0dced  a19001               mov ax, word ptr [0x190]           ; data PRZEDM.ZRE
0dcf0  3b069a01             cmp ax, word ptr [0x19a]           ; data PRZEDM.MAXZRE
0dcf4  7c09                 jl 0xdcff                         
0dcf6  a19a01               mov ax, word ptr [0x19a]           ; data PRZEDM.MAXZRE
0dcf9  050300               add ax, 3                         
0dcfc  a39a01               mov word ptr [0x19a], ax           ; data PRZEDM.MAXZRE
0dcff  a18c01               mov ax, word ptr [0x18c]           ; data PRZEDM.MAD
0dd02  3b069601             cmp ax, word ptr [0x196]           ; data PRZEDM.MAXMAD
0dd06  7c09                 jl 0xdd11                         
0dd08  a19601               mov ax, word ptr [0x196]           ; data PRZEDM.MAXMAD
0dd0b  050300               add ax, 3                         
0dd0e  a39601               mov word ptr [0x196], ax           ; data PRZEDM.MAXMAD
0dd11  a18e01               mov ax, word ptr [0x18e]           ; data PRZEDM.SIL
0dd14  3b069801             cmp ax, word ptr [0x198]           ; data PRZEDM.MAXSIL
0dd18  7d08                 jge 0xdd22                        
0dd1a  a19801               mov ax, word ptr [0x198]           ; data PRZEDM.MAXSIL
0dd1d  40                   inc ax                            
0dd1e  40                   inc ax                            
0dd1f  a39801               mov word ptr [0x198], ax           ; data PRZEDM.MAXSIL
0dd22  a19001               mov ax, word ptr [0x190]           ; data PRZEDM.ZRE
0dd25  3b069a01             cmp ax, word ptr [0x19a]           ; data PRZEDM.MAXZRE
0dd29  7d08                 jge 0xdd33                        
0dd2b  a19a01               mov ax, word ptr [0x19a]           ; data PRZEDM.MAXZRE
0dd2e  40                   inc ax                            
0dd2f  40                   inc ax                            
0dd30  a39a01               mov word ptr [0x19a], ax           ; data PRZEDM.MAXZRE
0dd33  a18c01               mov ax, word ptr [0x18c]           ; data PRZEDM.MAD
0dd36  3b069601             cmp ax, word ptr [0x196]           ; data PRZEDM.MAXMAD
0dd3a  7d08                 jge 0xdd44                        
0dd3c  a19601               mov ax, word ptr [0x196]           ; data PRZEDM.MAXMAD
0dd3f  40                   inc ax                            
0dd40  40                   inc ax                            
0dd41  a39601               mov word ptr [0x196], ax           ; data PRZEDM.MAXMAD
0dd44  a19601               mov ax, word ptr [0x196]           ; data PRZEDM.MAXMAD
0dd47  3b069801             cmp ax, word ptr [0x198]           ; data PRZEDM.MAXSIL
0dd4b  7e12                 jle 0xdd5f                        
0dd4d  a19601               mov ax, word ptr [0x196]           ; data PRZEDM.MAXMAD
0dd50  3b069a01             cmp ax, word ptr [0x19a]           ; data PRZEDM.MAXZRE
0dd54  7e09                 jle 0xdd5f                        
0dd56  a19601               mov ax, word ptr [0x196]           ; data PRZEDM.MAXMAD
0dd59  050300               add ax, 3                         
0dd5c  a39601               mov word ptr [0x196], ax           ; data PRZEDM.MAXMAD
0dd5f  a19801               mov ax, word ptr [0x198]           ; data PRZEDM.MAXSIL
0dd62  3b069601             cmp ax, word ptr [0x196]           ; data PRZEDM.MAXMAD
0dd66  7e12                 jle 0xdd7a                        
0dd68  a19801               mov ax, word ptr [0x198]           ; data PRZEDM.MAXSIL
0dd6b  3b069a01             cmp ax, word ptr [0x19a]           ; data PRZEDM.MAXZRE
0dd6f  7e09                 jle 0xdd7a                        
0dd71  a19801               mov ax, word ptr [0x198]           ; data PRZEDM.MAXSIL
0dd74  050300               add ax, 3                         
0dd77  a39801               mov word ptr [0x198], ax           ; data PRZEDM.MAXSIL
0dd7a  a19a01               mov ax, word ptr [0x19a]           ; data PRZEDM.MAXZRE
0dd7d  3b069801             cmp ax, word ptr [0x198]           ; data PRZEDM.MAXSIL
0dd81  7e12                 jle 0xdd95                        
0dd83  a19a01               mov ax, word ptr [0x19a]           ; data PRZEDM.MAXZRE
0dd86  3b069601             cmp ax, word ptr [0x196]           ; data PRZEDM.MAXMAD
0dd8a  7e09                 jle 0xdd95                        
0dd8c  a19a01               mov ax, word ptr [0x19a]           ; data PRZEDM.MAXZRE
0dd8f  050300               add ax, 3                         
0dd92  a39a01               mov word ptr [0x19a], ax           ; data PRZEDM.MAXZRE
0dd95  a19a01               mov ax, word ptr [0x19a]           ; data PRZEDM.MAXZRE
0dd98  3b069801             cmp ax, word ptr [0x198]           ; data PRZEDM.MAXSIL
0dd9c  751e                 jne 0xddbc                        
0dd9e  a19801               mov ax, word ptr [0x198]           ; data PRZEDM.MAXSIL
0dda1  3b069601             cmp ax, word ptr [0x196]           ; data PRZEDM.MAXMAD
0dda5  7515                 jne 0xddbc                        
0dda7  a19a01               mov ax, word ptr [0x19a]           ; data PRZEDM.MAXZRE
0ddaa  40                   inc ax                            
0ddab  a39a01               mov word ptr [0x19a], ax           ; data PRZEDM.MAXZRE
0ddae  a19601               mov ax, word ptr [0x196]           ; data PRZEDM.MAXMAD
0ddb1  40                   inc ax                            
0ddb2  a39601               mov word ptr [0x196], ax           ; data PRZEDM.MAXMAD
0ddb5  a19801               mov ax, word ptr [0x198]           ; data PRZEDM.MAXSIL
0ddb8  40                   inc ax                            
0ddb9  a39801               mov word ptr [0x198], ax           ; data PRZEDM.MAXSIL
0ddbc  a19a01               mov ax, word ptr [0x19a]           ; data PRZEDM.MAXZRE
0ddbf  3b069601             cmp ax, word ptr [0x196]           ; data PRZEDM.MAXMAD
0ddc3  7e18                 jle 0xdddd                        
0ddc5  a19a01               mov ax, word ptr [0x19a]           ; data PRZEDM.MAXZRE
0ddc8  3b069801             cmp ax, word ptr [0x198]           ; data PRZEDM.MAXSIL
0ddcc  750f                 jne 0xdddd                        
0ddce  a19801               mov ax, word ptr [0x198]           ; data PRZEDM.MAXSIL
0ddd1  40                   inc ax                            
0ddd2  40                   inc ax                            
0ddd3  a39801               mov word ptr [0x198], ax           ; data PRZEDM.MAXSIL
0ddd6  a19a01               mov ax, word ptr [0x19a]           ; data PRZEDM.MAXZRE
0ddd9  40                   inc ax                            
0ddda  a39a01               mov word ptr [0x19a], ax           ; data PRZEDM.MAXZRE
0dddd  bfa207               mov di, 0x7a2                     
0dde0  1e                   push ds                           
0dde1  57                   push di                           
0dde2  bfa986               mov di, 0x86a9                     ; string "\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002 MASZ TERAZ "
0dde5  0e                   push cs                           
0dde6  57                   push di                           
0dde7  31c0                 xor ax, ax                        
0dde9  50                   push ax                           
0ddea  9a0107711c           lcall 0x1c71, 0x701                ; call System.WriteString
0ddef  a19801               mov ax, word ptr [0x198]           ; data PRZEDM.MAXSIL
0ddf2  99                   cwd                               
0ddf3  52                   push dx                           
0ddf4  50                   push ax                           
0ddf5  31c0                 xor ax, ax                        
0ddf7  50                   push ax                           
0ddf8  9a8907711c           lcall 0x1c71, 0x789                ; call System.WriteInteger
0ddfd  bfc486               mov di, 0x86c4                     ; string " MAXYMALNIE SILY \u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002"
0de00  0e                   push cs                           
0de01  57                   push di                           
0de02  31c0                 xor ax, ax                        
0de04  50                   push ax                           
0de05  9a0107711c           lcall 0x1c71, 0x701                ; call System.WriteString
0de0a  9add05711c           lcall 0x1c71, 0x5dd                ; call System.WriteLn
0de0f  9a9102711c           lcall 0x1c71, 0x291                ; call System.IOCheck
0de14  bfa207               mov di, 0x7a2                     
0de17  1e                   push ds                           
0de18  57                   push di                           
0de19  bfa986               mov di, 0x86a9                     ; string "\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002 MASZ TERAZ "
0de1c  0e                   push cs                           
0de1d  57                   push di                           
0de1e  31c0                 xor ax, ax                        
0de20  50                   push ax                           
0de21  9a0107711c           lcall 0x1c71, 0x701                ; call System.WriteString
0de26  a19a01               mov ax, word ptr [0x19a]           ; data PRZEDM.MAXZRE
0de29  99                   cwd                               
0de2a  52                   push dx                           
0de2b  50                   push ax                           
0de2c  31c0                 xor ax, ax                        
0de2e  50                   push ax                           
0de2f  9a8907711c           lcall 0x1c71, 0x789                ; call System.WriteInteger
0de34  bfe486               mov di, 0x86e4                     ; string " MAXYMALNIE ZRECZNOSCI \u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002"
0de37  0e                   push cs                           
0de38  57                   push di                           
0de39  31c0                 xor ax, ax                        
0de3b  50                   push ax                           
0de3c  9a0107711c           lcall 0x1c71, 0x701                ; call System.WriteString
0de41  9add05711c           lcall 0x1c71, 0x5dd                ; call System.WriteLn
0de46  9a9102711c           lcall 0x1c71, 0x291                ; call System.IOCheck
0de4b  bfa207               mov di, 0x7a2                     
0de4e  1e                   push ds                           
0de4f  57                   push di                           
0de50  bfa986               mov di, 0x86a9                     ; string "\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002 MASZ TERAZ "
0de53  0e                   push cs                           
0de54  57                   push di                           
0de55  31c0                 xor ax, ax                        
0de57  50                   push ax                           
0de58  9a0107711c           lcall 0x1c71, 0x701                ; call System.WriteString
0de5d  a19601               mov ax, word ptr [0x196]           ; data PRZEDM.MAXMAD
0de60  99                   cwd                               
0de61  52                   push dx                           
0de62  50                   push ax                           
0de63  31c0                 xor ax, ax                        
0de65  50                   push ax                           
0de66  9a8907711c           lcall 0x1c71, 0x789                ; call System.WriteInteger
0de6b  bf0a87               mov di, 0x870a                     ; string " MAXYMALNIE MADROSCI \u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002\u0002"
0de6e  0e                   push cs                           
0de6f  57                   push di                           
0de70  31c0                 xor ax, ax                        
0de72  50                   push ax                           
0de73  9a0107711c           lcall 0x1c71, 0x701                ; call System.WriteString
0de78  9add05711c           lcall 0x1c71, 0x5dd                ; call System.WriteLn
0de7d  9a9102711c           lcall 0x1c71, 0x291                ; call System.IOCheck
0de82  5d                   pop bp                            
0de83  c3                   ret                               

```

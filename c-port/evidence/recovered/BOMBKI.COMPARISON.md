# `BOMBKI.COMPARISON`

Generated recovery aid for logic retained in the executable's main dispatcher.
It is not reconstructed source code.

- File spans: `0x07d2a`–`0x07dc7`, `0x14372`–`0x143d5`, `0x145b9`–`0x145ef`
- Boundaries were verified from exact command-string references and jumps.
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.FUKS`
- `PRZEDM.MANA`
- `PRZEDM.POR`
- `PRZEDM.PRA`
- `PRZEDM.SCROLLPOR`
- `PRZEDM.SIL`

## Calls

- `PRZEDM.POROWNANIE`
- `System.CompareString`
- `System.IOCheck`
- `System.Random`
- `System.WriteInteger`
- `System.WriteLn`
- `System.WriteString`

## Exact strings

- `"CWICZ POROWNANIE"`
- `"CWICZYSZ POROWNYWANIE - PRAWDOPODOBIENSTWO JEST TERAZ "`
- `"% MASZ "`
- `" PRAKTYK"`
- `"POROWNAJ"`
- `"POPELNILES PEWNE BLEDY I NIE UDALO SIE WYKONAC CZARU"`
- `"UZYJ SCROLL POROWNYWANIE"`

## Annotated listing

```asm
; BOMBKI.EXE file span 0x07d2a-0x07dc7
07d2a  bf6405               mov di, 0x564                     
07d2d  1e                   push ds                           
07d2e  57                   push di                           
07d2f  bf0c23               mov di, 0x230c                     ; string "CWICZ POROWNANIE"
07d32  0e                   push cs                           
07d33  57                   push di                           
07d34  9ad709711c           lcall 0x1c71, 0x9d7                ; call System.CompareString
07d39  7403                 je 0x7d3e                         
07d3b  e98900               jmp 0x7dc7                        
07d3e  833e8c010b           cmp word ptr [0x18c], 0xb          ; data PRZEDM.SIL
07d43  7f03                 jg 0x7d48                         
07d45  e97f00               jmp 0x7dc7                        
07d48  803e5d025a           cmp byte ptr [0x25d], 0x5a         ; data PRZEDM.POR
07d4d  7d78                 jge 0x7dc7                        
07d4f  833e940100           cmp word ptr [0x194], 0            ; data PRZEDM.PRA
07d54  7e71                 jle 0x7dc7                        
07d56  a18c01               mov ax, word ptr [0x18c]           ; data PRZEDM.SIL
07d59  8bf0                 mov si, ax                        
07d5b  d1e0                 shl ax, 1                         
07d5d  01f0                 add ax, si                        
07d5f  8bd0                 mov dx, ax                        
07d61  a05d02               mov al, byte ptr [0x25d]           ; data PRZEDM.POR
07d64  98                   cbw                               
07d65  03c2                 add ax, dx                        
07d67  2d0900               sub ax, 9                         
07d6a  a25d02               mov byte ptr [0x25d], al           ; data PRZEDM.POR
07d6d  a19401               mov ax, word ptr [0x194]           ; data PRZEDM.PRA
07d70  48                   dec ax                            
07d71  a39401               mov word ptr [0x194], ax           ; data PRZEDM.PRA
07d74  bfa207               mov di, 0x7a2                     
07d77  1e                   push ds                           
07d78  57                   push di                           
07d79  bf1d23               mov di, 0x231d                     ; string "CWICZYSZ POROWNYWANIE - PRAWDOPODOBIENSTWO JEST TERAZ "
07d7c  0e                   push cs                           
07d7d  57                   push di                           
07d7e  31c0                 xor ax, ax                        
07d80  50                   push ax                           
07d81  9a0107711c           lcall 0x1c71, 0x701                ; call System.WriteString
07d86  a05d02               mov al, byte ptr [0x25d]           ; data PRZEDM.POR
07d89  98                   cbw                               
07d8a  99                   cwd                               
07d8b  52                   push dx                           
07d8c  50                   push ax                           
07d8d  31c0                 xor ax, ax                        
07d8f  50                   push ax                           
07d90  9a8907711c           lcall 0x1c71, 0x789                ; call System.WriteInteger
07d95  bffe21               mov di, 0x21fe                     ; string "% MASZ "
07d98  0e                   push cs                           
07d99  57                   push di                           
07d9a  31c0                 xor ax, ax                        
07d9c  50                   push ax                           
07d9d  9a0107711c           lcall 0x1c71, 0x701                ; call System.WriteString
07da2  a19401               mov ax, word ptr [0x194]           ; data PRZEDM.PRA
07da5  99                   cwd                               
07da6  52                   push dx                           
07da7  50                   push ax                           
07da8  31c0                 xor ax, ax                        
07daa  50                   push ax                           
07dab  9a8907711c           lcall 0x1c71, 0x789                ; call System.WriteInteger
07db0  bf0622               mov di, 0x2206                     ; string " PRAKTYK"
07db3  0e                   push cs                           
07db4  57                   push di                           
07db5  31c0                 xor ax, ax                        
07db7  50                   push ax                           
07db8  9a0107711c           lcall 0x1c71, 0x701                ; call System.WriteString
07dbd  9add05711c           lcall 0x1c71, 0x5dd                ; call System.WriteLn
07dc2  9a9102711c           lcall 0x1c71, 0x291                ; call System.IOCheck

; BOMBKI.EXE file span 0x14372-0x143d5
14372  bf6405               mov di, 0x564                     
14375  1e                   push ds                           
14376  57                   push di                           
14377  bffcad               mov di, 0xadfc                     ; string "POROWNAJ"
1437a  0e                   push cs                           
1437b  57                   push di                           
1437c  9ad709711c           lcall 0x1c71, 0x9d7                ; call System.CompareString
14381  7552                 jne 0x143d5                       
14383  803e5d0200           cmp byte ptr [0x25d], 0            ; data PRZEDM.POR
14388  7e4b                 jle 0x143d5                       
1438a  b86400               mov ax, 0x64                      
1438d  50                   push ax                           
1438e  9ae40b711c           lcall 0x1c71, 0xbe4                ; call System.Random
14393  a39e01               mov word ptr [0x19e], ax           ; data PRZEDM.FUKS
14396  a05d02               mov al, byte ptr [0x25d]           ; data PRZEDM.POR
14399  98                   cbw                               
1439a  3b069e01             cmp ax, word ptr [0x19e]           ; data PRZEDM.FUKS
1439e  7e10                 jle 0x143b0                       
143a0  9a461f9d12           lcall 0x129d, 0x1f46               ; call PRZEDM.POROWNANIE
143a5  a1ac01               mov ax, word ptr [0x1ac]           ; data PRZEDM.MANA
143a8  2d0a00               sub ax, 0xa                       
143ab  a3ac01               mov word ptr [0x1ac], ax           ; data PRZEDM.MANA
143ae  eb25                 jmp 0x143d5                       
143b0  bfa207               mov di, 0x7a2                     
143b3  1e                   push ds                           
143b4  57                   push di                           
143b5  bf05ae               mov di, 0xae05                     ; string "POPELNILES PEWNE BLEDY I NIE UDALO SIE WYKONAC CZARU"
143b8  0e                   push cs                           
143b9  57                   push di                           
143ba  31c0                 xor ax, ax                        
143bc  50                   push ax                           
143bd  9a0107711c           lcall 0x1c71, 0x701                ; call System.WriteString
143c2  9add05711c           lcall 0x1c71, 0x5dd                ; call System.WriteLn
143c7  9a9102711c           lcall 0x1c71, 0x291                ; call System.IOCheck
143cc  a1ac01               mov ax, word ptr [0x1ac]           ; data PRZEDM.MANA
143cf  2d0500               sub ax, 5                         
143d2  a3ac01               mov word ptr [0x1ac], ax           ; data PRZEDM.MANA

; BOMBKI.EXE file span 0x145b9-0x145ef
145b9  bf6405               mov di, 0x564                     
145bc  1e                   push ds                           
145bd  57                   push di                           
145be  bfc0af               mov di, 0xafc0                     ; string "UZYJ SCROLL POROWNYWANIE"
145c1  0e                   push cs                           
145c2  57                   push di                           
145c3  9ad709711c           lcall 0x1c71, 0x9d7                ; call System.CompareString
145c8  7525                 jne 0x145ef                       
145ca  833e300200           cmp word ptr [0x230], 0            ; data PRZEDM.SCROLLPOR
145cf  7d1e                 jge 0x145ef                       
145d1  9a461f9d12           lcall 0x129d, 0x1f46               ; call PRZEDM.POROWNANIE
145d6  a1ac01               mov ax, word ptr [0x1ac]           ; data PRZEDM.MANA
145d9  2d0a00               sub ax, 0xa                       
145dc  a3ac01               mov word ptr [0x1ac], ax           ; data PRZEDM.MANA
145df  a13002               mov ax, word ptr [0x230]           ; data PRZEDM.SCROLLPOR
145e2  050a00               add ax, 0xa                       
145e5  a33002               mov word ptr [0x230], ax           ; data PRZEDM.SCROLLPOR
145e8  a18201               mov ax, word ptr [0x182]          
145eb  48                   dec ax                            
145ec  a38201               mov word ptr [0x182], ax          

```

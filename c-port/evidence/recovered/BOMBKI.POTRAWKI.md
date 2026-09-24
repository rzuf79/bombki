# `BOMBKI.POTRAWKI`

Generated recovery aid for logic retained in the executable's main dispatcher.
It is not reconstructed source code.

- File spans: `0x07dc7`–`0x07e55`
- Boundaries were verified from exact command-string references and jumps.
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.POTRAWKI`
- `PRZEDM.PRA`
- `PRZEDM.SIL`

## Calls

- `System.CompareString`
- `System.IOCheck`
- `System.WriteInteger`
- `System.WriteLn`
- `System.WriteString`

## Exact strings

- `"CWICZ POTRAWKI"`
- `"CWICZYSZ POTRAWKI - PRAWDOPODOBIENSTWO JEST TERAZ "`
- `"% MASZ "`
- `" PRAKTYK"`

## Annotated listing

```asm
; BOMBKI.EXE file span 0x07dc7-0x07e55
07dc7  bf6405               mov di, 0x564                     
07dca  1e                   push ds                           
07dcb  57                   push di                           
07dcc  bf5423               mov di, 0x2354                     ; string "CWICZ POTRAWKI"
07dcf  0e                   push cs                           
07dd0  57                   push di                           
07dd1  9ad709711c           lcall 0x1c71, 0x9d7                ; call System.CompareString
07dd6  757b                 jne 0x7e53                        
07dd8  833e8c0112           cmp word ptr [0x18c], 0x12         ; data PRZEDM.SIL
07ddd  7e74                 jle 0x7e53                        
07ddf  803e58025a           cmp byte ptr [0x258], 0x5a         ; data PRZEDM.POTRAWKI
07de4  7d6d                 jge 0x7e53                        
07de6  833e940100           cmp word ptr [0x194], 0            ; data PRZEDM.PRA
07deb  7e66                 jle 0x7e53                        
07ded  a05802               mov al, byte ptr [0x258]           ; data PRZEDM.POTRAWKI
07df0  98                   cbw                               
07df1  03068c01             add ax, word ptr [0x18c]           ; data PRZEDM.SIL
07df5  40                   inc ax                            
07df6  a25802               mov byte ptr [0x258], al           ; data PRZEDM.POTRAWKI
07df9  a19401               mov ax, word ptr [0x194]           ; data PRZEDM.PRA
07dfc  48                   dec ax                            
07dfd  a39401               mov word ptr [0x194], ax           ; data PRZEDM.PRA
07e00  bfa207               mov di, 0x7a2                     
07e03  1e                   push ds                           
07e04  57                   push di                           
07e05  bf6323               mov di, 0x2363                     ; string "CWICZYSZ POTRAWKI - PRAWDOPODOBIENSTWO JEST TERAZ "
07e08  0e                   push cs                           
07e09  57                   push di                           
07e0a  31c0                 xor ax, ax                        
07e0c  50                   push ax                           
07e0d  9a0107711c           lcall 0x1c71, 0x701                ; call System.WriteString
07e12  a05802               mov al, byte ptr [0x258]           ; data PRZEDM.POTRAWKI
07e15  98                   cbw                               
07e16  99                   cwd                               
07e17  52                   push dx                           
07e18  50                   push ax                           
07e19  31c0                 xor ax, ax                        
07e1b  50                   push ax                           
07e1c  9a8907711c           lcall 0x1c71, 0x789                ; call System.WriteInteger
07e21  bffe21               mov di, 0x21fe                     ; string "% MASZ "
07e24  0e                   push cs                           
07e25  57                   push di                           
07e26  31c0                 xor ax, ax                        
07e28  50                   push ax                           
07e29  9a0107711c           lcall 0x1c71, 0x701                ; call System.WriteString
07e2e  a19401               mov ax, word ptr [0x194]           ; data PRZEDM.PRA
07e31  99                   cwd                               
07e32  52                   push dx                           
07e33  50                   push ax                           
07e34  31c0                 xor ax, ax                        
07e36  50                   push ax                           
07e37  9a8907711c           lcall 0x1c71, 0x789                ; call System.WriteInteger
07e3c  bf0622               mov di, 0x2206                     ; string " PRAKTYK"
07e3f  0e                   push cs                           
07e40  57                   push di                           
07e41  31c0                 xor ax, ax                        
07e43  50                   push ax                           
07e44  9a0107711c           lcall 0x1c71, 0x701                ; call System.WriteString
07e49  9add05711c           lcall 0x1c71, 0x5dd                ; call System.WriteLn
07e4e  9a9102711c           lcall 0x1c71, 0x291                ; call System.IOCheck
07e53  5d                   pop bp                            
07e54  c3                   ret                               

```

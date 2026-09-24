# `BOMBKI.PARRYING`

Generated recovery aid for logic retained in the executable's main dispatcher.
It is not reconstructed source code.

- File spans: `0x07c8d`–`0x07d2a`
- Boundaries were verified from exact command-string references and jumps.
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.PAR`
- `PRZEDM.PRA`
- `PRZEDM.SIL`
- `PRZEDM.ZRE`

## Calls

- `System.CompareString`
- `System.IOCheck`
- `System.WriteInteger`
- `System.WriteLn`
- `System.WriteString`

## Exact strings

- `"CWICZ PAROWANIE"`
- `"CWICZYSZ PAROWANIE - PRAWDOPODOBIENSTWO JEST TERAZ "`
- `"% MASZ "`
- `" PRAKTYK"`

## Annotated listing

```asm
; BOMBKI.EXE file span 0x07c8d-0x07d2a
07c8d  bf6405               mov di, 0x564                     
07c90  1e                   push ds                           
07c91  57                   push di                           
07c92  bfc822               mov di, 0x22c8                     ; string "CWICZ PAROWANIE"
07c95  0e                   push cs                           
07c96  57                   push di                           
07c97  9ad709711c           lcall 0x1c71, 0x9d7                ; call System.CompareString
07c9c  7403                 je 0x7ca1                         
07c9e  e98900               jmp 0x7d2a                        
07ca1  833e8c010f           cmp word ptr [0x18c], 0xf          ; data PRZEDM.SIL
07ca6  7f03                 jg 0x7cab                         
07ca8  e97f00               jmp 0x7d2a                        
07cab  833e90010b           cmp word ptr [0x190], 0xb          ; data PRZEDM.ZRE
07cb0  7e78                 jle 0x7d2a                        
07cb2  833ec6015a           cmp word ptr [0x1c6], 0x5a         ; data PRZEDM.PAR
07cb7  7d71                 jge 0x7d2a                        
07cb9  833e940100           cmp word ptr [0x194], 0            ; data PRZEDM.PRA
07cbe  7e6a                 jle 0x7d2a                        
07cc0  a1c601               mov ax, word ptr [0x1c6]           ; data PRZEDM.PAR
07cc3  03068c01             add ax, word ptr [0x18c]           ; data PRZEDM.SIL
07cc7  03069001             add ax, word ptr [0x190]           ; data PRZEDM.ZRE
07ccb  2d0e00               sub ax, 0xe                       
07cce  a3c601               mov word ptr [0x1c6], ax           ; data PRZEDM.PAR
07cd1  a19401               mov ax, word ptr [0x194]           ; data PRZEDM.PRA
07cd4  48                   dec ax                            
07cd5  a39401               mov word ptr [0x194], ax           ; data PRZEDM.PRA
07cd8  bfa207               mov di, 0x7a2                     
07cdb  1e                   push ds                           
07cdc  57                   push di                           
07cdd  bfd822               mov di, 0x22d8                     ; string "CWICZYSZ PAROWANIE - PRAWDOPODOBIENSTWO JEST TERAZ "
07ce0  0e                   push cs                           
07ce1  57                   push di                           
07ce2  31c0                 xor ax, ax                        
07ce4  50                   push ax                           
07ce5  9a0107711c           lcall 0x1c71, 0x701                ; call System.WriteString
07cea  a1c601               mov ax, word ptr [0x1c6]           ; data PRZEDM.PAR
07ced  99                   cwd                               
07cee  52                   push dx                           
07cef  50                   push ax                           
07cf0  31c0                 xor ax, ax                        
07cf2  50                   push ax                           
07cf3  9a8907711c           lcall 0x1c71, 0x789                ; call System.WriteInteger
07cf8  bffe21               mov di, 0x21fe                     ; string "% MASZ "
07cfb  0e                   push cs                           
07cfc  57                   push di                           
07cfd  31c0                 xor ax, ax                        
07cff  50                   push ax                           
07d00  9a0107711c           lcall 0x1c71, 0x701                ; call System.WriteString
07d05  a19401               mov ax, word ptr [0x194]           ; data PRZEDM.PRA
07d08  99                   cwd                               
07d09  52                   push dx                           
07d0a  50                   push ax                           
07d0b  31c0                 xor ax, ax                        
07d0d  50                   push ax                           
07d0e  9a8907711c           lcall 0x1c71, 0x789                ; call System.WriteInteger
07d13  bf0622               mov di, 0x2206                     ; string " PRAKTYK"
07d16  0e                   push cs                           
07d17  57                   push di                           
07d18  31c0                 xor ax, ax                        
07d1a  50                   push ax                           
07d1b  9a0107711c           lcall 0x1c71, 0x701                ; call System.WriteString
07d20  9add05711c           lcall 0x1c71, 0x5dd                ; call System.WriteLn
07d25  9a9102711c           lcall 0x1c71, 0x291                ; call System.IOCheck

```

# `PRZEDM.PIERDOLY`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:1111-1122`
- TPU code block: `0x00e0`
- Procedure bytes: `0x003b`–`0x00e1`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.FUKS`
- `PRZEDM.wpisz`
- `System.INPUT`
- `System.OUTPUT`

## Calls

- `Crt.TextColor`
- `Crt.entry_0x0070`
- `System.CompareString`
- `System.ReadInteger`
- `System.ReadLn`
- `System.WriteLn`
- `System.WriteString`
- `System.entry_0x0190`
- `System.entry_0x01a0`

## Exact strings

- `"ZMIEN KOLOR"`
- `"PODAJ LICZBE KOLORU"`
- `"ZMIEN TLO"`
- `"PODAJ LICZBE TLA"`

## Annotated listing

```asm
; PRZEDM.PAS:1111
003b  55                   push bp                           
003c  89e5                 mov bp, sp                        
003e  31c0                 xor ax, ax                        
0040  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:1112
0045  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0048  1e                   push ds                           
0049  57                   push di                           
004a  bf0000               mov di, 0                          ; string "ZMIEN KOLOR"
004d  0e                   push cs                           
004e  57                   push di                           
004f  9a00000000           lcall 0, 0                         ; call System.CompareString
0054  753c                 jne 0x92                          
; PRZEDM.PAS:1113
0056  bf0000               mov di, 0                          ; data System.OUTPUT
0059  1e                   push ds                           
005a  57                   push di                           
005b  bf0000               mov di, 0                          ; string "PODAJ LICZBE KOLORU"
005e  0e                   push cs                           
005f  57                   push di                           
0060  31c0                 xor ax, ax                        
0062  50                   push ax                           
0063  9a00000000           lcall 0, 0                         ; call System.WriteString
0068  9a00000000           lcall 0, 0                         ; call System.WriteLn
006d  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1114
0072  bf0000               mov di, 0                          ; data System.INPUT
0075  1e                   push ds                           
0076  57                   push di                           
0077  9a00000000           lcall 0, 0                         ; call System.ReadInteger
007c  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
007f  9a00000000           lcall 0, 0                         ; call System.ReadLn
0084  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1115
0089  a00000               mov al, byte ptr [0]               ; data PRZEDM.FUKS
008c  50                   push ax                           
008d  9a00000000           lcall 0, 0                         ; call Crt.TextColor
; PRZEDM.PAS:1117
0092  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0095  1e                   push ds                           
0096  57                   push di                           
0097  bf0000               mov di, 0                          ; string "ZMIEN TLO"
009a  0e                   push cs                           
009b  57                   push di                           
009c  9a00000000           lcall 0, 0                         ; call System.CompareString
00a1  753c                 jne 0xdf                          
; PRZEDM.PAS:1118
00a3  bf0000               mov di, 0                          ; data System.OUTPUT
00a6  1e                   push ds                           
00a7  57                   push di                           
00a8  bf0000               mov di, 0                          ; string "PODAJ LICZBE TLA"
00ab  0e                   push cs                           
00ac  57                   push di                           
00ad  31c0                 xor ax, ax                        
00af  50                   push ax                           
00b0  9a00000000           lcall 0, 0                         ; call System.WriteString
00b5  9a00000000           lcall 0, 0                         ; call System.WriteLn
00ba  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1119
00bf  bf0000               mov di, 0                          ; data System.INPUT
00c2  1e                   push ds                           
00c3  57                   push di                           
00c4  9a00000000           lcall 0, 0                         ; call System.ReadInteger
00c9  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
00cc  9a00000000           lcall 0, 0                         ; call System.ReadLn
00d1  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1120
00d6  a00000               mov al, byte ptr [0]               ; data PRZEDM.FUKS
00d9  50                   push ax                           
00da  9a00000000           lcall 0, 0                         ; call Crt.entry_0x0070
; PRZEDM.PAS:1122
00df  5d                   pop bp                            
00e0  cb                   retf                              
```

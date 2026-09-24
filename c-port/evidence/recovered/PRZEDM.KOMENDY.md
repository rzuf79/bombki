# `PRZEDM.KOMENDY`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:1560-1570`
- TPU code block: `0x0100`
- Procedure bytes: `0x0043`–`0x016f`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.wpisz`

## Calls

- `System.CompareString`
- `System.entry_0x0060`
- `System.entry_0x01a0`

## Exact strings

- `"PN"`
- `"POLNOC"`
- `"PD"`
- `"POLODNIE"`
- `"W"`
- `"WSCHOD"`
- `"Z"`
- `"ZACHOD"`
- `"G"`
- `"GORA"`
- `"D"`
- `"DOL"`
- `"E"`
- `"EXIT"`
- `"M"`
- `"MODE"`

## Annotated listing

```asm
; PRZEDM.PAS:1560
0043  55                   push bp                           
0044  89e5                 mov bp, sp                        
0046  31c0                 xor ax, ax                        
0048  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:1562
004d  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0050  1e                   push ds                           
0051  57                   push di                           
0052  bf0000               mov di, 0                          ; string "PN"
0055  0e                   push cs                           
0056  57                   push di                           
0057  9a00000000           lcall 0, 0                         ; call System.CompareString
005c  7513                 jne 0x71                          
005e  bf0000               mov di, 0                          ; string "POLNOC"
0061  0e                   push cs                           
0062  57                   push di                           
0063  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0066  1e                   push ds                           
0067  57                   push di                           
0068  b8ff00               mov ax, 0xff                      
006b  50                   push ax                           
006c  9a00000000           lcall 0, 0                         ; call System.entry_0x0060
; PRZEDM.PAS:1563
0071  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0074  1e                   push ds                           
0075  57                   push di                           
0076  bf0000               mov di, 0                          ; string "PD"
0079  0e                   push cs                           
007a  57                   push di                           
007b  9a00000000           lcall 0, 0                         ; call System.CompareString
0080  7513                 jne 0x95                          
0082  bf0000               mov di, 0                          ; string "POLODNIE"
0085  0e                   push cs                           
0086  57                   push di                           
0087  bf0000               mov di, 0                          ; data PRZEDM.wpisz
008a  1e                   push ds                           
008b  57                   push di                           
008c  b8ff00               mov ax, 0xff                      
008f  50                   push ax                           
0090  9a00000000           lcall 0, 0                         ; call System.entry_0x0060
; PRZEDM.PAS:1564
0095  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0098  1e                   push ds                           
0099  57                   push di                           
009a  bf0000               mov di, 0                          ; string "W"
009d  0e                   push cs                           
009e  57                   push di                           
009f  9a00000000           lcall 0, 0                         ; call System.CompareString
00a4  7513                 jne 0xb9                          
00a6  bf0000               mov di, 0                          ; string "WSCHOD"
00a9  0e                   push cs                           
00aa  57                   push di                           
00ab  bf0000               mov di, 0                          ; data PRZEDM.wpisz
00ae  1e                   push ds                           
00af  57                   push di                           
00b0  b8ff00               mov ax, 0xff                      
00b3  50                   push ax                           
00b4  9a00000000           lcall 0, 0                         ; call System.entry_0x0060
; PRZEDM.PAS:1565
00b9  bf0000               mov di, 0                          ; data PRZEDM.wpisz
00bc  1e                   push ds                           
00bd  57                   push di                           
00be  bf0000               mov di, 0                          ; string "Z"
00c1  0e                   push cs                           
00c2  57                   push di                           
00c3  9a00000000           lcall 0, 0                         ; call System.CompareString
00c8  7513                 jne 0xdd                          
00ca  bf0000               mov di, 0                          ; string "ZACHOD"
00cd  0e                   push cs                           
00ce  57                   push di                           
00cf  bf0000               mov di, 0                          ; data PRZEDM.wpisz
00d2  1e                   push ds                           
00d3  57                   push di                           
00d4  b8ff00               mov ax, 0xff                      
00d7  50                   push ax                           
00d8  9a00000000           lcall 0, 0                         ; call System.entry_0x0060
; PRZEDM.PAS:1566
00dd  bf0000               mov di, 0                          ; data PRZEDM.wpisz
00e0  1e                   push ds                           
00e1  57                   push di                           
00e2  bf0000               mov di, 0                          ; string "G"
00e5  0e                   push cs                           
00e6  57                   push di                           
00e7  9a00000000           lcall 0, 0                         ; call System.CompareString
00ec  7513                 jne 0x101                         
00ee  bf0000               mov di, 0                          ; string "GORA"
00f1  0e                   push cs                           
00f2  57                   push di                           
00f3  bf0000               mov di, 0                          ; data PRZEDM.wpisz
00f6  1e                   push ds                           
00f7  57                   push di                           
00f8  b8ff00               mov ax, 0xff                      
00fb  50                   push ax                           
00fc  9a00000000           lcall 0, 0                         ; call System.entry_0x0060
; PRZEDM.PAS:1567
0101  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0104  1e                   push ds                           
0105  57                   push di                           
0106  bf0000               mov di, 0                          ; string "D"
0109  0e                   push cs                           
010a  57                   push di                           
010b  9a00000000           lcall 0, 0                         ; call System.CompareString
0110  7513                 jne 0x125                         
0112  bf0000               mov di, 0                          ; string "DOL"
0115  0e                   push cs                           
0116  57                   push di                           
0117  bf0000               mov di, 0                          ; data PRZEDM.wpisz
011a  1e                   push ds                           
011b  57                   push di                           
011c  b8ff00               mov ax, 0xff                      
011f  50                   push ax                           
0120  9a00000000           lcall 0, 0                         ; call System.entry_0x0060
; PRZEDM.PAS:1568
0125  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0128  1e                   push ds                           
0129  57                   push di                           
012a  bf0000               mov di, 0                          ; string "E"
012d  0e                   push cs                           
012e  57                   push di                           
012f  9a00000000           lcall 0, 0                         ; call System.CompareString
0134  7513                 jne 0x149                         
0136  bf0000               mov di, 0                          ; string "EXIT"
0139  0e                   push cs                           
013a  57                   push di                           
013b  bf0000               mov di, 0                          ; data PRZEDM.wpisz
013e  1e                   push ds                           
013f  57                   push di                           
0140  b8ff00               mov ax, 0xff                      
0143  50                   push ax                           
0144  9a00000000           lcall 0, 0                         ; call System.entry_0x0060
; PRZEDM.PAS:1569
0149  bf0000               mov di, 0                          ; data PRZEDM.wpisz
014c  1e                   push ds                           
014d  57                   push di                           
014e  bf0000               mov di, 0                          ; string "M"
0151  0e                   push cs                           
0152  57                   push di                           
0153  9a00000000           lcall 0, 0                         ; call System.CompareString
0158  7513                 jne 0x16d                         
015a  bf0000               mov di, 0                          ; string "MODE"
015d  0e                   push cs                           
015e  57                   push di                           
015f  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0162  1e                   push ds                           
0163  57                   push di                           
0164  b8ff00               mov ax, 0xff                      
0167  50                   push ax                           
0168  9a00000000           lcall 0, 0                         ; call System.entry_0x0060
; PRZEDM.PAS:1570
016d  5d                   pop bp                            
016e  cb                   retf                              
```

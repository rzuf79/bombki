# `SWIAT.POKOJE`

Generated recovery aid; not reconstructed source code.

- Original source map: `SWIAT.PAS:170-227`
- TPU code block: `0x0028`
- Procedure bytes: `0x00c9`–`0x053c`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.ENERGIA`
- `PRZEDM.KUNSZT`
- `PRZEDM.MIECHO`
- `PRZEDM.wpisz`
- `System.INPUT`
- `System.OUTPUT`

## Calls

- `PRZEDM.MODE`
- `System.CompareString`
- `System.ReadLn`
- `System.ReadString`
- `System.WriteChar`
- `System.WriteEnd`
- `System.WriteInteger`
- `System.WriteLn`
- `System.WriteString`
- `System.entry_0x0190`
- `System.entry_0x01a0`

## Exact strings

- `"JESTES W DOSYC CIASNYM POKOJU I NICZEGO TU NIEMA "`
- `"%."`
- `"MODE"`
- `"EXIT"`
- `"DOSTEPNE WYJSCIA:"`
- `"WSCHOD-MUD SZKOLA(2)"`
- `"WYJSCIE"`
- `"WSCHOD"`
- `"POLNOC-MUD SZKOLA(2)"`
- `"POLNOC"`
- `"POLODNIE-MUD SZKOLA(2)"`
- `"POLODNIE"`
- `"GORA-MUD SZKOLA(2)"`
- `"GORA"`

## Annotated listing

```asm
; SWIAT.PAS:170
00c9  55                   push bp                           
00ca  89e5                 mov bp, sp                        
00cc  31c0                 xor ax, ax                        
00ce  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; SWIAT.PAS:171
00d3  833e000006           cmp word ptr [0], 6                ; data PRZEDM.MIECHO
00d8  7403                 je 0xdd                           
00da  e91001               jmp 0x1ed                         
; SWIAT.PAS:172
00dd  bf0000               mov di, 0                          ; data System.OUTPUT
00e0  1e                   push ds                           
00e1  57                   push di                           
00e2  bf0000               mov di, 0                          ; string "JESTES W DOSYC CIASNYM POKOJU I NICZEGO TU NIEMA "
00e5  0e                   push cs                           
00e6  57                   push di                           
00e7  31c0                 xor ax, ax                        
00e9  50                   push ax                           
00ea  9a00000000           lcall 0, 0                         ; call System.WriteString
00ef  9a00000000           lcall 0, 0                         ; call System.WriteLn
00f4  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:174
00f9  bf0000               mov di, 0                          ; data System.OUTPUT
00fc  1e                   push ds                           
00fd  57                   push di                           
00fe  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
0101  99                   cwd                               
0102  52                   push dx                           
0103  50                   push ax                           
0104  31c0                 xor ax, ax                        
0106  50                   push ax                           
0107  9a00000000           lcall 0, 0                         ; call System.WriteInteger
010c  bf0000               mov di, 0                          ; string "%."
010f  0e                   push cs                           
0110  57                   push di                           
0111  31c0                 xor ax, ax                        
0113  50                   push ax                           
0114  9a00000000           lcall 0, 0                         ; call System.WriteString
0119  a10000               mov ax, word ptr [0]               ; data PRZEDM.KUNSZT
011c  99                   cwd                               
011d  52                   push dx                           
011e  50                   push ax                           
011f  31c0                 xor ax, ax                        
0121  50                   push ax                           
0122  9a00000000           lcall 0, 0                         ; call System.WriteInteger
0127  b03e                 mov al, 0x3e                      
0129  50                   push ax                           
012a  31c0                 xor ax, ax                        
012c  50                   push ax                           
012d  9a00000000           lcall 0, 0                         ; call System.WriteChar
0132  9a00000000           lcall 0, 0                         ; call System.WriteEnd
0137  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:175
013c  bf0000               mov di, 0                          ; data System.INPUT
013f  1e                   push ds                           
0140  57                   push di                           
0141  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0144  1e                   push ds                           
0145  57                   push di                           
0146  b8ff00               mov ax, 0xff                      
0149  50                   push ax                           
014a  9a00000000           lcall 0, 0                         ; call System.ReadString
014f  9a00000000           lcall 0, 0                         ; call System.ReadLn
0154  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:176
0159  bf0000               mov di, 0                          ; data PRZEDM.wpisz
015c  1e                   push ds                           
015d  57                   push di                           
015e  bf0000               mov di, 0                          ; string "MODE"
0161  0e                   push cs                           
0162  57                   push di                           
0163  9a00000000           lcall 0, 0                         ; call System.CompareString
0168  7505                 jne 0x16f                         
016a  9a00000000           lcall 0, 0                         ; call PRZEDM.MODE
; SWIAT.PAS:177
016f  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0172  1e                   push ds                           
0173  57                   push di                           
0174  bf0000               mov di, 0                          ; string "EXIT"
0177  0e                   push cs                           
0178  57                   push di                           
0179  9a00000000           lcall 0, 0                         ; call System.CompareString
017e  7538                 jne 0x1b8                         
; SWIAT.PAS:178
0180  bf0000               mov di, 0                          ; data System.OUTPUT
0183  1e                   push ds                           
0184  57                   push di                           
0185  bf0000               mov di, 0                          ; string "DOSTEPNE WYJSCIA:"
0188  0e                   push cs                           
0189  57                   push di                           
018a  31c0                 xor ax, ax                        
018c  50                   push ax                           
018d  9a00000000           lcall 0, 0                         ; call System.WriteString
0192  9a00000000           lcall 0, 0                         ; call System.WriteLn
0197  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:179
019c  bf0000               mov di, 0                          ; data System.OUTPUT
019f  1e                   push ds                           
01a0  57                   push di                           
01a1  bf0000               mov di, 0                          ; string "WSCHOD-MUD SZKOLA(2)"
01a4  0e                   push cs                           
01a5  57                   push di                           
01a6  31c0                 xor ax, ax                        
01a8  50                   push ax                           
01a9  9a00000000           lcall 0, 0                         ; call System.WriteString
01ae  9a00000000           lcall 0, 0                         ; call System.WriteLn
01b3  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:181
01b8  bf0000               mov di, 0                          ; data PRZEDM.wpisz
01bb  1e                   push ds                           
01bc  57                   push di                           
01bd  bf0000               mov di, 0                          ; string "WYJSCIE"
01c0  0e                   push cs                           
01c1  57                   push di                           
01c2  9a00000000           lcall 0, 0                         ; call System.CompareString
01c7  7503                 jne 0x1cc                         
01c9  e96e03               jmp 0x53a                         
; SWIAT.PAS:182
01cc  bf0000               mov di, 0                          ; data PRZEDM.wpisz
01cf  1e                   push ds                           
01d0  57                   push di                           
01d1  bf0000               mov di, 0                          ; string "WSCHOD"
01d4  0e                   push cs                           
01d5  57                   push di                           
01d6  9a00000000           lcall 0, 0                         ; call System.CompareString
01db  7506                 jne 0x1e3                         
01dd  c70600000500         mov word ptr [0], 5                ; data PRZEDM.MIECHO
; SWIAT.PAS:183
01e3  833e000006           cmp word ptr [0], 6                ; data PRZEDM.MIECHO
01e8  7503                 jne 0x1ed                         
01ea  e90cff               jmp 0xf9                          
; SWIAT.PAS:185
01ed  833e000008           cmp word ptr [0], 8                ; data PRZEDM.MIECHO
01f2  7403                 je 0x1f7                          
01f4  e91001               jmp 0x307                         
; SWIAT.PAS:186
01f7  bf0000               mov di, 0                          ; data System.OUTPUT
01fa  1e                   push ds                           
01fb  57                   push di                           
01fc  bf0000               mov di, 0                          ; string "JESTES W DOSYC CIASNYM POKOJU I NICZEGO TU NIEMA "
01ff  0e                   push cs                           
0200  57                   push di                           
0201  31c0                 xor ax, ax                        
0203  50                   push ax                           
0204  9a00000000           lcall 0, 0                         ; call System.WriteString
0209  9a00000000           lcall 0, 0                         ; call System.WriteLn
020e  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:188
0213  bf0000               mov di, 0                          ; data System.OUTPUT
0216  1e                   push ds                           
0217  57                   push di                           
0218  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
021b  99                   cwd                               
021c  52                   push dx                           
021d  50                   push ax                           
021e  31c0                 xor ax, ax                        
0220  50                   push ax                           
0221  9a00000000           lcall 0, 0                         ; call System.WriteInteger
0226  bf0000               mov di, 0                          ; string "%."
0229  0e                   push cs                           
022a  57                   push di                           
022b  31c0                 xor ax, ax                        
022d  50                   push ax                           
022e  9a00000000           lcall 0, 0                         ; call System.WriteString
0233  a10000               mov ax, word ptr [0]               ; data PRZEDM.KUNSZT
0236  99                   cwd                               
0237  52                   push dx                           
0238  50                   push ax                           
0239  31c0                 xor ax, ax                        
023b  50                   push ax                           
023c  9a00000000           lcall 0, 0                         ; call System.WriteInteger
0241  b03e                 mov al, 0x3e                      
0243  50                   push ax                           
0244  31c0                 xor ax, ax                        
0246  50                   push ax                           
0247  9a00000000           lcall 0, 0                         ; call System.WriteChar
024c  9a00000000           lcall 0, 0                         ; call System.WriteEnd
0251  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:189
0256  bf0000               mov di, 0                          ; data System.INPUT
0259  1e                   push ds                           
025a  57                   push di                           
025b  bf0000               mov di, 0                          ; data PRZEDM.wpisz
025e  1e                   push ds                           
025f  57                   push di                           
0260  b8ff00               mov ax, 0xff                      
0263  50                   push ax                           
0264  9a00000000           lcall 0, 0                         ; call System.ReadString
0269  9a00000000           lcall 0, 0                         ; call System.ReadLn
026e  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:190
0273  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0276  1e                   push ds                           
0277  57                   push di                           
0278  bf0000               mov di, 0                          ; string "MODE"
027b  0e                   push cs                           
027c  57                   push di                           
027d  9a00000000           lcall 0, 0                         ; call System.CompareString
0282  7505                 jne 0x289                         
0284  9a00000000           lcall 0, 0                         ; call PRZEDM.MODE
; SWIAT.PAS:191
0289  bf0000               mov di, 0                          ; data PRZEDM.wpisz
028c  1e                   push ds                           
028d  57                   push di                           
028e  bf0000               mov di, 0                          ; string "EXIT"
0291  0e                   push cs                           
0292  57                   push di                           
0293  9a00000000           lcall 0, 0                         ; call System.CompareString
0298  7538                 jne 0x2d2                         
; SWIAT.PAS:192
029a  bf0000               mov di, 0                          ; data System.OUTPUT
029d  1e                   push ds                           
029e  57                   push di                           
029f  bf0000               mov di, 0                          ; string "DOSTEPNE WYJSCIA:"
02a2  0e                   push cs                           
02a3  57                   push di                           
02a4  31c0                 xor ax, ax                        
02a6  50                   push ax                           
02a7  9a00000000           lcall 0, 0                         ; call System.WriteString
02ac  9a00000000           lcall 0, 0                         ; call System.WriteLn
02b1  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:193
02b6  bf0000               mov di, 0                          ; data System.OUTPUT
02b9  1e                   push ds                           
02ba  57                   push di                           
02bb  bf0000               mov di, 0                          ; string "POLNOC-MUD SZKOLA(2)"
02be  0e                   push cs                           
02bf  57                   push di                           
02c0  31c0                 xor ax, ax                        
02c2  50                   push ax                           
02c3  9a00000000           lcall 0, 0                         ; call System.WriteString
02c8  9a00000000           lcall 0, 0                         ; call System.WriteLn
02cd  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:195
02d2  bf0000               mov di, 0                          ; data PRZEDM.wpisz
02d5  1e                   push ds                           
02d6  57                   push di                           
02d7  bf0000               mov di, 0                          ; string "WYJSCIE"
02da  0e                   push cs                           
02db  57                   push di                           
02dc  9a00000000           lcall 0, 0                         ; call System.CompareString
02e1  7503                 jne 0x2e6                         
02e3  e95402               jmp 0x53a                         
; SWIAT.PAS:196
02e6  bf0000               mov di, 0                          ; data PRZEDM.wpisz
02e9  1e                   push ds                           
02ea  57                   push di                           
02eb  bf0000               mov di, 0                          ; string "POLNOC"
02ee  0e                   push cs                           
02ef  57                   push di                           
02f0  9a00000000           lcall 0, 0                         ; call System.CompareString
02f5  7506                 jne 0x2fd                         
02f7  c70600000500         mov word ptr [0], 5                ; data PRZEDM.MIECHO
; SWIAT.PAS:197
02fd  833e000008           cmp word ptr [0], 8                ; data PRZEDM.MIECHO
0302  7503                 jne 0x307                         
0304  e90cff               jmp 0x213                         
; SWIAT.PAS:199
0307  833e000007           cmp word ptr [0], 7                ; data PRZEDM.MIECHO
030c  7403                 je 0x311                          
030e  e91001               jmp 0x421                         
; SWIAT.PAS:200
0311  bf0000               mov di, 0                          ; data System.OUTPUT
0314  1e                   push ds                           
0315  57                   push di                           
0316  bf0000               mov di, 0                          ; string "JESTES W DOSYC CIASNYM POKOJU I NICZEGO TU NIEMA "
0319  0e                   push cs                           
031a  57                   push di                           
031b  31c0                 xor ax, ax                        
031d  50                   push ax                           
031e  9a00000000           lcall 0, 0                         ; call System.WriteString
0323  9a00000000           lcall 0, 0                         ; call System.WriteLn
0328  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:202
032d  bf0000               mov di, 0                          ; data System.OUTPUT
0330  1e                   push ds                           
0331  57                   push di                           
0332  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
0335  99                   cwd                               
0336  52                   push dx                           
0337  50                   push ax                           
0338  31c0                 xor ax, ax                        
033a  50                   push ax                           
033b  9a00000000           lcall 0, 0                         ; call System.WriteInteger
0340  bf0000               mov di, 0                          ; string "%."
0343  0e                   push cs                           
0344  57                   push di                           
0345  31c0                 xor ax, ax                        
0347  50                   push ax                           
0348  9a00000000           lcall 0, 0                         ; call System.WriteString
034d  a10000               mov ax, word ptr [0]               ; data PRZEDM.KUNSZT
0350  99                   cwd                               
0351  52                   push dx                           
0352  50                   push ax                           
0353  31c0                 xor ax, ax                        
0355  50                   push ax                           
0356  9a00000000           lcall 0, 0                         ; call System.WriteInteger
035b  b03e                 mov al, 0x3e                      
035d  50                   push ax                           
035e  31c0                 xor ax, ax                        
0360  50                   push ax                           
0361  9a00000000           lcall 0, 0                         ; call System.WriteChar
0366  9a00000000           lcall 0, 0                         ; call System.WriteEnd
036b  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:203
0370  bf0000               mov di, 0                          ; data System.INPUT
0373  1e                   push ds                           
0374  57                   push di                           
0375  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0378  1e                   push ds                           
0379  57                   push di                           
037a  b8ff00               mov ax, 0xff                      
037d  50                   push ax                           
037e  9a00000000           lcall 0, 0                         ; call System.ReadString
0383  9a00000000           lcall 0, 0                         ; call System.ReadLn
0388  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:204
038d  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0390  1e                   push ds                           
0391  57                   push di                           
0392  bf0000               mov di, 0                          ; string "MODE"
0395  0e                   push cs                           
0396  57                   push di                           
0397  9a00000000           lcall 0, 0                         ; call System.CompareString
039c  7505                 jne 0x3a3                         
039e  9a00000000           lcall 0, 0                         ; call PRZEDM.MODE
; SWIAT.PAS:205
03a3  bf0000               mov di, 0                          ; data PRZEDM.wpisz
03a6  1e                   push ds                           
03a7  57                   push di                           
03a8  bf0000               mov di, 0                          ; string "EXIT"
03ab  0e                   push cs                           
03ac  57                   push di                           
03ad  9a00000000           lcall 0, 0                         ; call System.CompareString
03b2  7538                 jne 0x3ec                         
; SWIAT.PAS:206
03b4  bf0000               mov di, 0                          ; data System.OUTPUT
03b7  1e                   push ds                           
03b8  57                   push di                           
03b9  bf0000               mov di, 0                          ; string "DOSTEPNE WYJSCIA:"
03bc  0e                   push cs                           
03bd  57                   push di                           
03be  31c0                 xor ax, ax                        
03c0  50                   push ax                           
03c1  9a00000000           lcall 0, 0                         ; call System.WriteString
03c6  9a00000000           lcall 0, 0                         ; call System.WriteLn
03cb  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:207
03d0  bf0000               mov di, 0                          ; data System.OUTPUT
03d3  1e                   push ds                           
03d4  57                   push di                           
03d5  bf0000               mov di, 0                          ; string "POLODNIE-MUD SZKOLA(2)"
03d8  0e                   push cs                           
03d9  57                   push di                           
03da  31c0                 xor ax, ax                        
03dc  50                   push ax                           
03dd  9a00000000           lcall 0, 0                         ; call System.WriteString
03e2  9a00000000           lcall 0, 0                         ; call System.WriteLn
03e7  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:209
03ec  bf0000               mov di, 0                          ; data PRZEDM.wpisz
03ef  1e                   push ds                           
03f0  57                   push di                           
03f1  bf0000               mov di, 0                          ; string "WYJSCIE"
03f4  0e                   push cs                           
03f5  57                   push di                           
03f6  9a00000000           lcall 0, 0                         ; call System.CompareString
03fb  7503                 jne 0x400                         
03fd  e93a01               jmp 0x53a                         
; SWIAT.PAS:210
0400  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0403  1e                   push ds                           
0404  57                   push di                           
0405  bf0000               mov di, 0                          ; string "POLODNIE"
0408  0e                   push cs                           
0409  57                   push di                           
040a  9a00000000           lcall 0, 0                         ; call System.CompareString
040f  7506                 jne 0x417                         
0411  c70600000500         mov word ptr [0], 5                ; data PRZEDM.MIECHO
; SWIAT.PAS:211
0417  833e000007           cmp word ptr [0], 7                ; data PRZEDM.MIECHO
041c  7503                 jne 0x421                         
041e  e90cff               jmp 0x32d                         
; SWIAT.PAS:213
0421  833e00000a           cmp word ptr [0], 0xa              ; data PRZEDM.MIECHO
0426  7403                 je 0x42b                          
0428  e90f01               jmp 0x53a                         
; SWIAT.PAS:214
042b  bf0000               mov di, 0                          ; data System.OUTPUT
042e  1e                   push ds                           
042f  57                   push di                           
0430  bf0000               mov di, 0                          ; string "JESTES W DOSYC CIASNYM POKOJU I NICZEGO TU NIEMA "
0433  0e                   push cs                           
0434  57                   push di                           
0435  31c0                 xor ax, ax                        
0437  50                   push ax                           
0438  9a00000000           lcall 0, 0                         ; call System.WriteString
043d  9a00000000           lcall 0, 0                         ; call System.WriteLn
0442  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:216
0447  bf0000               mov di, 0                          ; data System.OUTPUT
044a  1e                   push ds                           
044b  57                   push di                           
044c  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
044f  99                   cwd                               
0450  52                   push dx                           
0451  50                   push ax                           
0452  31c0                 xor ax, ax                        
0454  50                   push ax                           
0455  9a00000000           lcall 0, 0                         ; call System.WriteInteger
045a  bf0000               mov di, 0                          ; string "%."
045d  0e                   push cs                           
045e  57                   push di                           
045f  31c0                 xor ax, ax                        
0461  50                   push ax                           
0462  9a00000000           lcall 0, 0                         ; call System.WriteString
0467  a10000               mov ax, word ptr [0]               ; data PRZEDM.KUNSZT
046a  99                   cwd                               
046b  52                   push dx                           
046c  50                   push ax                           
046d  31c0                 xor ax, ax                        
046f  50                   push ax                           
0470  9a00000000           lcall 0, 0                         ; call System.WriteInteger
0475  b03e                 mov al, 0x3e                      
0477  50                   push ax                           
0478  31c0                 xor ax, ax                        
047a  50                   push ax                           
047b  9a00000000           lcall 0, 0                         ; call System.WriteChar
0480  9a00000000           lcall 0, 0                         ; call System.WriteEnd
0485  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:217
048a  bf0000               mov di, 0                          ; data System.INPUT
048d  1e                   push ds                           
048e  57                   push di                           
048f  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0492  1e                   push ds                           
0493  57                   push di                           
0494  b8ff00               mov ax, 0xff                      
0497  50                   push ax                           
0498  9a00000000           lcall 0, 0                         ; call System.ReadString
049d  9a00000000           lcall 0, 0                         ; call System.ReadLn
04a2  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:218
04a7  bf0000               mov di, 0                          ; data PRZEDM.wpisz
04aa  1e                   push ds                           
04ab  57                   push di                           
04ac  bf0000               mov di, 0                          ; string "MODE"
04af  0e                   push cs                           
04b0  57                   push di                           
04b1  9a00000000           lcall 0, 0                         ; call System.CompareString
04b6  7505                 jne 0x4bd                         
04b8  9a00000000           lcall 0, 0                         ; call PRZEDM.MODE
; SWIAT.PAS:219
04bd  bf0000               mov di, 0                          ; data PRZEDM.wpisz
04c0  1e                   push ds                           
04c1  57                   push di                           
04c2  bf0000               mov di, 0                          ; string "EXIT"
04c5  0e                   push cs                           
04c6  57                   push di                           
04c7  9a00000000           lcall 0, 0                         ; call System.CompareString
04cc  7538                 jne 0x506                         
; SWIAT.PAS:220
04ce  bf0000               mov di, 0                          ; data System.OUTPUT
04d1  1e                   push ds                           
04d2  57                   push di                           
04d3  bf0000               mov di, 0                          ; string "DOSTEPNE WYJSCIA:"
04d6  0e                   push cs                           
04d7  57                   push di                           
04d8  31c0                 xor ax, ax                        
04da  50                   push ax                           
04db  9a00000000           lcall 0, 0                         ; call System.WriteString
04e0  9a00000000           lcall 0, 0                         ; call System.WriteLn
04e5  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:221
04ea  bf0000               mov di, 0                          ; data System.OUTPUT
04ed  1e                   push ds                           
04ee  57                   push di                           
04ef  bf0000               mov di, 0                          ; string "GORA-MUD SZKOLA(2)"
04f2  0e                   push cs                           
04f3  57                   push di                           
04f4  31c0                 xor ax, ax                        
04f6  50                   push ax                           
04f7  9a00000000           lcall 0, 0                         ; call System.WriteString
04fc  9a00000000           lcall 0, 0                         ; call System.WriteLn
0501  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:223
0506  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0509  1e                   push ds                           
050a  57                   push di                           
050b  bf0000               mov di, 0                          ; string "WYJSCIE"
050e  0e                   push cs                           
050f  57                   push di                           
0510  9a00000000           lcall 0, 0                         ; call System.CompareString
0515  7502                 jne 0x519                         
0517  eb21                 jmp 0x53a                         
; SWIAT.PAS:224
0519  bf0000               mov di, 0                          ; data PRZEDM.wpisz
051c  1e                   push ds                           
051d  57                   push di                           
051e  bf0000               mov di, 0                          ; string "GORA"
0521  0e                   push cs                           
0522  57                   push di                           
0523  9a00000000           lcall 0, 0                         ; call System.CompareString
0528  7506                 jne 0x530                         
052a  c70600000500         mov word ptr [0], 5                ; data PRZEDM.MIECHO
; SWIAT.PAS:225
0530  833e00000a           cmp word ptr [0], 0xa              ; data PRZEDM.MIECHO
0535  7503                 jne 0x53a                         
0537  e90dff               jmp 0x447                         
; SWIAT.PAS:227
053a  5d                   pop bp                            
053b  cb                   retf                              
```

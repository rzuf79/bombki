# `SWIAT.POKOJ30`

Generated recovery aid; not reconstructed source code.

- Original source map: `SWIAT.PAS:265-285`
- TPU code block: `0x0038`
- Procedure bytes: `0x00f1`–`0x0298`
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

- `"ULICA DLUGA CIAGNIE SIE W NIESKONCZONOSC,SORKI"`
- `"NA POLNOCY ZNAJDUJESZ OGROMNA BUDOWLE=TO ARENA PRZEZNACZONA DO WALKI"`
- `"%."`
- `"MODE"`
- `"EXIT"`
- `"DOSTEPNE WYJSCIA:"`
- `"WSCHOD-CENTRUM MIASTA"`
- `"ZACHOD-ULICA DLUGA"`
- `"POLNOC-WEJSCIE NA ARENE"`
- `"WYJSCIE"`
- `"WSCHOD"`
- `"ZACHOD"`
- `"POLNOC"`

## Annotated listing

```asm
; SWIAT.PAS:265
00f1  55                   push bp                           
00f2  89e5                 mov bp, sp                        
00f4  31c0                 xor ax, ax                        
00f6  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; SWIAT.PAS:266
00fb  833e00001e           cmp word ptr [0], 0x1e             ; data PRZEDM.MIECHO
0100  7403                 je 0x105                          
0102  e99101               jmp 0x296                         
; SWIAT.PAS:267
0105  bf0000               mov di, 0                          ; data System.OUTPUT
0108  1e                   push ds                           
0109  57                   push di                           
010a  bf0000               mov di, 0                          ; string "ULICA DLUGA CIAGNIE SIE W NIESKONCZONOSC,SORKI"
010d  0e                   push cs                           
010e  57                   push di                           
010f  31c0                 xor ax, ax                        
0111  50                   push ax                           
0112  9a00000000           lcall 0, 0                         ; call System.WriteString
0117  9a00000000           lcall 0, 0                         ; call System.WriteLn
011c  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:268
0121  bf0000               mov di, 0                          ; data System.OUTPUT
0124  1e                   push ds                           
0125  57                   push di                           
0126  bf0000               mov di, 0                          ; string "NA POLNOCY ZNAJDUJESZ OGROMNA BUDOWLE=TO ARENA PRZEZNACZONA DO WALKI"
0129  0e                   push cs                           
012a  57                   push di                           
012b  31c0                 xor ax, ax                        
012d  50                   push ax                           
012e  9a00000000           lcall 0, 0                         ; call System.WriteString
0133  9a00000000           lcall 0, 0                         ; call System.WriteLn
0138  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:270
013d  bf0000               mov di, 0                          ; data System.OUTPUT
0140  1e                   push ds                           
0141  57                   push di                           
0142  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
0145  99                   cwd                               
0146  52                   push dx                           
0147  50                   push ax                           
0148  31c0                 xor ax, ax                        
014a  50                   push ax                           
014b  9a00000000           lcall 0, 0                         ; call System.WriteInteger
0150  bf0000               mov di, 0                          ; string "%."
0153  0e                   push cs                           
0154  57                   push di                           
0155  31c0                 xor ax, ax                        
0157  50                   push ax                           
0158  9a00000000           lcall 0, 0                         ; call System.WriteString
015d  a10000               mov ax, word ptr [0]               ; data PRZEDM.KUNSZT
0160  99                   cwd                               
0161  52                   push dx                           
0162  50                   push ax                           
0163  31c0                 xor ax, ax                        
0165  50                   push ax                           
0166  9a00000000           lcall 0, 0                         ; call System.WriteInteger
016b  b03e                 mov al, 0x3e                      
016d  50                   push ax                           
016e  31c0                 xor ax, ax                        
0170  50                   push ax                           
0171  9a00000000           lcall 0, 0                         ; call System.WriteChar
0176  9a00000000           lcall 0, 0                         ; call System.WriteEnd
017b  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:271
0180  bf0000               mov di, 0                          ; data System.INPUT
0183  1e                   push ds                           
0184  57                   push di                           
0185  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0188  1e                   push ds                           
0189  57                   push di                           
018a  b8ff00               mov ax, 0xff                      
018d  50                   push ax                           
018e  9a00000000           lcall 0, 0                         ; call System.ReadString
0193  9a00000000           lcall 0, 0                         ; call System.ReadLn
0198  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:272
019d  bf0000               mov di, 0                          ; data PRZEDM.wpisz
01a0  1e                   push ds                           
01a1  57                   push di                           
01a2  bf0000               mov di, 0                          ; string "MODE"
01a5  0e                   push cs                           
01a6  57                   push di                           
01a7  9a00000000           lcall 0, 0                         ; call System.CompareString
01ac  7505                 jne 0x1b3                         
01ae  9a00000000           lcall 0, 0                         ; call PRZEDM.MODE
; SWIAT.PAS:273
01b3  bf0000               mov di, 0                          ; data PRZEDM.wpisz
01b6  1e                   push ds                           
01b7  57                   push di                           
01b8  bf0000               mov di, 0                          ; string "EXIT"
01bb  0e                   push cs                           
01bc  57                   push di                           
01bd  9a00000000           lcall 0, 0                         ; call System.CompareString
01c2  7570                 jne 0x234                         
; SWIAT.PAS:274
01c4  bf0000               mov di, 0                          ; data System.OUTPUT
01c7  1e                   push ds                           
01c8  57                   push di                           
01c9  bf0000               mov di, 0                          ; string "DOSTEPNE WYJSCIA:"
01cc  0e                   push cs                           
01cd  57                   push di                           
01ce  31c0                 xor ax, ax                        
01d0  50                   push ax                           
01d1  9a00000000           lcall 0, 0                         ; call System.WriteString
01d6  9a00000000           lcall 0, 0                         ; call System.WriteLn
01db  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:275
01e0  bf0000               mov di, 0                          ; data System.OUTPUT
01e3  1e                   push ds                           
01e4  57                   push di                           
01e5  bf0000               mov di, 0                          ; string "WSCHOD-CENTRUM MIASTA"
01e8  0e                   push cs                           
01e9  57                   push di                           
01ea  31c0                 xor ax, ax                        
01ec  50                   push ax                           
01ed  9a00000000           lcall 0, 0                         ; call System.WriteString
01f2  9a00000000           lcall 0, 0                         ; call System.WriteLn
01f7  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:276
01fc  bf0000               mov di, 0                          ; data System.OUTPUT
01ff  1e                   push ds                           
0200  57                   push di                           
0201  bf0000               mov di, 0                          ; string "ZACHOD-ULICA DLUGA"
0204  0e                   push cs                           
0205  57                   push di                           
0206  31c0                 xor ax, ax                        
0208  50                   push ax                           
0209  9a00000000           lcall 0, 0                         ; call System.WriteString
020e  9a00000000           lcall 0, 0                         ; call System.WriteLn
0213  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:277
0218  bf0000               mov di, 0                          ; data System.OUTPUT
021b  1e                   push ds                           
021c  57                   push di                           
021d  bf0000               mov di, 0                          ; string "POLNOC-WEJSCIE NA ARENE"
0220  0e                   push cs                           
0221  57                   push di                           
0222  31c0                 xor ax, ax                        
0224  50                   push ax                           
0225  9a00000000           lcall 0, 0                         ; call System.WriteString
022a  9a00000000           lcall 0, 0                         ; call System.WriteLn
022f  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:279
0234  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0237  1e                   push ds                           
0238  57                   push di                           
0239  bf0000               mov di, 0                          ; string "WYJSCIE"
023c  0e                   push cs                           
023d  57                   push di                           
023e  9a00000000           lcall 0, 0                         ; call System.CompareString
0243  7502                 jne 0x247                         
0245  eb4f                 jmp 0x296                         
; SWIAT.PAS:280
0247  bf0000               mov di, 0                          ; data PRZEDM.wpisz
024a  1e                   push ds                           
024b  57                   push di                           
024c  bf0000               mov di, 0                          ; string "WSCHOD"
024f  0e                   push cs                           
0250  57                   push di                           
0251  9a00000000           lcall 0, 0                         ; call System.CompareString
0256  7506                 jne 0x25e                         
0258  c70600001400         mov word ptr [0], 0x14             ; data PRZEDM.MIECHO
; SWIAT.PAS:281
025e  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0261  1e                   push ds                           
0262  57                   push di                           
0263  bf0000               mov di, 0                          ; string "ZACHOD"
0266  0e                   push cs                           
0267  57                   push di                           
0268  9a00000000           lcall 0, 0                         ; call System.CompareString
026d  7506                 jne 0x275                         
026f  c70600001f00         mov word ptr [0], 0x1f             ; data PRZEDM.MIECHO
; SWIAT.PAS:282
0275  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0278  1e                   push ds                           
0279  57                   push di                           
027a  bf0000               mov di, 0                          ; string "POLNOC"
027d  0e                   push cs                           
027e  57                   push di                           
027f  9a00000000           lcall 0, 0                         ; call System.CompareString
0284  7506                 jne 0x28c                         
0286  c70600002000         mov word ptr [0], 0x20             ; data PRZEDM.MIECHO
; SWIAT.PAS:283
028c  833e00001e           cmp word ptr [0], 0x1e             ; data PRZEDM.MIECHO
0291  7503                 jne 0x296                         
0293  e9a7fe               jmp 0x13d                         
; SWIAT.PAS:285
0296  5d                   pop bp                            
0297  cb                   retf                              
```

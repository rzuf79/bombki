# `SWIAT.POKOJ60`

Generated recovery aid; not reconstructed source code.

- Original source map: `SWIAT.PAS:287-306`
- TPU code block: `0x0040`
- Procedure bytes: `0x011f`–`0x02af`
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

- `"JESTES W DOLINIE ROZRYWEK DOLINA CIAGNIE SIE NA POLNOC, NA WSCHODZIE"`
- `"JEST SLYSZALNY JAKIS DZIWNY  HALAS , NA ZACHODZIE ZAS \"LA LA LA LA\" "`
- `"ZAWSZE MOZESZ WROCIC SIE IDAC NA POLODNIE ;)"`
- `"%."`
- `"MODE"`
- `"EXIT"`
- `"DOSTEPNE WYJSCIA:"`
- `"POLODNIE-ULICA DLUGA"`
- `"WSCHOD-BUDOWLA PELNA HALASU"`
- `"WYJSCIE"`
- `"POLODNIE"`
- `"WSCHOD"`

## Annotated listing

```asm
; SWIAT.PAS:287
011f  55                   push bp                           
0120  89e5                 mov bp, sp                        
0122  31c0                 xor ax, ax                        
0124  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; SWIAT.PAS:288
0129  833e00003c           cmp word ptr [0], 0x3c             ; data PRZEDM.MIECHO
012e  7403                 je 0x133                          
0130  e97a01               jmp 0x2ad                         
; SWIAT.PAS:289
0133  bf0000               mov di, 0                          ; data System.OUTPUT
0136  1e                   push ds                           
0137  57                   push di                           
0138  bf0000               mov di, 0                          ; string "JESTES W DOLINIE ROZRYWEK DOLINA CIAGNIE SIE NA POLNOC, NA WSCHODZIE"
013b  0e                   push cs                           
013c  57                   push di                           
013d  31c0                 xor ax, ax                        
013f  50                   push ax                           
0140  9a00000000           lcall 0, 0                         ; call System.WriteString
0145  9a00000000           lcall 0, 0                         ; call System.WriteLn
014a  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:290
014f  bf0000               mov di, 0                          ; data System.OUTPUT
0152  1e                   push ds                           
0153  57                   push di                           
0154  bf0000               mov di, 0                          ; string "JEST SLYSZALNY JAKIS DZIWNY  HALAS , NA ZACHODZIE ZAS \"LA LA LA LA\" "
0157  0e                   push cs                           
0158  57                   push di                           
0159  31c0                 xor ax, ax                        
015b  50                   push ax                           
015c  9a00000000           lcall 0, 0                         ; call System.WriteString
0161  9a00000000           lcall 0, 0                         ; call System.WriteLn
0166  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:291
016b  bf0000               mov di, 0                          ; data System.OUTPUT
016e  1e                   push ds                           
016f  57                   push di                           
0170  bf0000               mov di, 0                          ; string "ZAWSZE MOZESZ WROCIC SIE IDAC NA POLODNIE ;)"
0173  0e                   push cs                           
0174  57                   push di                           
0175  31c0                 xor ax, ax                        
0177  50                   push ax                           
0178  9a00000000           lcall 0, 0                         ; call System.WriteString
017d  9a00000000           lcall 0, 0                         ; call System.WriteLn
0182  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:293
0187  bf0000               mov di, 0                          ; data System.OUTPUT
018a  1e                   push ds                           
018b  57                   push di                           
018c  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
018f  99                   cwd                               
0190  52                   push dx                           
0191  50                   push ax                           
0192  31c0                 xor ax, ax                        
0194  50                   push ax                           
0195  9a00000000           lcall 0, 0                         ; call System.WriteInteger
019a  bf0000               mov di, 0                          ; string "%."
019d  0e                   push cs                           
019e  57                   push di                           
019f  31c0                 xor ax, ax                        
01a1  50                   push ax                           
01a2  9a00000000           lcall 0, 0                         ; call System.WriteString
01a7  a10000               mov ax, word ptr [0]               ; data PRZEDM.KUNSZT
01aa  99                   cwd                               
01ab  52                   push dx                           
01ac  50                   push ax                           
01ad  31c0                 xor ax, ax                        
01af  50                   push ax                           
01b0  9a00000000           lcall 0, 0                         ; call System.WriteInteger
01b5  b03e                 mov al, 0x3e                      
01b7  50                   push ax                           
01b8  31c0                 xor ax, ax                        
01ba  50                   push ax                           
01bb  9a00000000           lcall 0, 0                         ; call System.WriteChar
01c0  9a00000000           lcall 0, 0                         ; call System.WriteEnd
01c5  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:294
01ca  bf0000               mov di, 0                          ; data System.INPUT
01cd  1e                   push ds                           
01ce  57                   push di                           
01cf  bf0000               mov di, 0                          ; data PRZEDM.wpisz
01d2  1e                   push ds                           
01d3  57                   push di                           
01d4  b8ff00               mov ax, 0xff                      
01d7  50                   push ax                           
01d8  9a00000000           lcall 0, 0                         ; call System.ReadString
01dd  9a00000000           lcall 0, 0                         ; call System.ReadLn
01e2  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:295
01e7  bf0000               mov di, 0                          ; data PRZEDM.wpisz
01ea  1e                   push ds                           
01eb  57                   push di                           
01ec  bf0000               mov di, 0                          ; string "MODE"
01ef  0e                   push cs                           
01f0  57                   push di                           
01f1  9a00000000           lcall 0, 0                         ; call System.CompareString
01f6  7505                 jne 0x1fd                         
01f8  9a00000000           lcall 0, 0                         ; call PRZEDM.MODE
; SWIAT.PAS:296
01fd  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0200  1e                   push ds                           
0201  57                   push di                           
0202  bf0000               mov di, 0                          ; string "EXIT"
0205  0e                   push cs                           
0206  57                   push di                           
0207  9a00000000           lcall 0, 0                         ; call System.CompareString
020c  7554                 jne 0x262                         
; SWIAT.PAS:297
020e  bf0000               mov di, 0                          ; data System.OUTPUT
0211  1e                   push ds                           
0212  57                   push di                           
0213  bf0000               mov di, 0                          ; string "DOSTEPNE WYJSCIA:"
0216  0e                   push cs                           
0217  57                   push di                           
0218  31c0                 xor ax, ax                        
021a  50                   push ax                           
021b  9a00000000           lcall 0, 0                         ; call System.WriteString
0220  9a00000000           lcall 0, 0                         ; call System.WriteLn
0225  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:298
022a  bf0000               mov di, 0                          ; data System.OUTPUT
022d  1e                   push ds                           
022e  57                   push di                           
022f  bf0000               mov di, 0                          ; string "POLODNIE-ULICA DLUGA"
0232  0e                   push cs                           
0233  57                   push di                           
0234  31c0                 xor ax, ax                        
0236  50                   push ax                           
0237  9a00000000           lcall 0, 0                         ; call System.WriteString
023c  9a00000000           lcall 0, 0                         ; call System.WriteLn
0241  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:299
0246  bf0000               mov di, 0                          ; data System.OUTPUT
0249  1e                   push ds                           
024a  57                   push di                           
024b  bf0000               mov di, 0                          ; string "WSCHOD-BUDOWLA PELNA HALASU"
024e  0e                   push cs                           
024f  57                   push di                           
0250  31c0                 xor ax, ax                        
0252  50                   push ax                           
0253  9a00000000           lcall 0, 0                         ; call System.WriteString
0258  9a00000000           lcall 0, 0                         ; call System.WriteLn
025d  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:301
0262  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0265  1e                   push ds                           
0266  57                   push di                           
0267  bf0000               mov di, 0                          ; string "WYJSCIE"
026a  0e                   push cs                           
026b  57                   push di                           
026c  9a00000000           lcall 0, 0                         ; call System.CompareString
0271  7502                 jne 0x275                         
0273  eb38                 jmp 0x2ad                         
; SWIAT.PAS:302
0275  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0278  1e                   push ds                           
0279  57                   push di                           
027a  bf0000               mov di, 0                          ; string "POLODNIE"
027d  0e                   push cs                           
027e  57                   push di                           
027f  9a00000000           lcall 0, 0                         ; call System.CompareString
0284  7506                 jne 0x28c                         
0286  c70600001f00         mov word ptr [0], 0x1f             ; data PRZEDM.MIECHO
; SWIAT.PAS:303
028c  bf0000               mov di, 0                          ; data PRZEDM.wpisz
028f  1e                   push ds                           
0290  57                   push di                           
0291  bf0000               mov di, 0                          ; string "WSCHOD"
0294  0e                   push cs                           
0295  57                   push di                           
0296  9a00000000           lcall 0, 0                         ; call System.CompareString
029b  7506                 jne 0x2a3                         
029d  c70600003d00         mov word ptr [0], 0x3d             ; data PRZEDM.MIECHO
; SWIAT.PAS:304
02a3  833e00003c           cmp word ptr [0], 0x3c             ; data PRZEDM.MIECHO
02a8  7503                 jne 0x2ad                         
02aa  e9dafe               jmp 0x187                         
; SWIAT.PAS:306
02ad  5d                   pop bp                            
02ae  cb                   retf                              
```

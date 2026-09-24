# `SWIAT.POKOJ83`

Generated recovery aid; not reconstructed source code.

- Original source map: `SWIAT.PAS:331-353`
- TPU code block: `0x0050`
- Procedure bytes: `0x012b`–`0x02ca`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.ENERGIA`
- `PRZEDM.KUNSZT`
- `PRZEDM.MIECHO`
- `PRZEDM.wpisz`
- `System.INPUT`
- `System.OUTPUT`

## Calls

- `PRZEDM.BLUSZCZ`
- `PRZEDM.FIGHTBLUSZCZ`
- `PRZEDM.KOMENDY`
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

- `"............................. PIERDUT...........PIERDUT......PIERDUT"`
- `"DOPIERO TERAZ SIE ZORIENTOWALES ZE NA SRODKU STOI WIELKIE DRZEWO"`
- `"HMMM ALE ZARAZ ... TE KRZAKI NA ZACHOD WYGLADAJA BARDZO PODEJRZANIE...."`
- `"%."`
- `"MODE"`
- `"EXIT"`
- `"DOSTEPNE WYJSCIA:"`
- `"POLNOC-BLUSZCZ"`
- `"ZACHOD-PODEJRZANE KRZAKI"`
- `"WYJSCIE"`
- `"POLNOC"`
- `"ZACHOD"`

## Annotated listing

```asm
; SWIAT.PAS:331
012b  55                   push bp                           
012c  89e5                 mov bp, sp                        
012e  31c0                 xor ax, ax                        
0130  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; SWIAT.PAS:332
0135  833e000053           cmp word ptr [0], 0x53             ; data PRZEDM.MIECHO
013a  7403                 je 0x13f                          
013c  e98901               jmp 0x2c8                         
; SWIAT.PAS:333
013f  bf0000               mov di, 0                          ; data System.OUTPUT
0142  1e                   push ds                           
0143  57                   push di                           
0144  bf0000               mov di, 0                          ; string "............................. PIERDUT...........PIERDUT......PIERDUT"
0147  0e                   push cs                           
0148  57                   push di                           
0149  31c0                 xor ax, ax                        
014b  50                   push ax                           
014c  9a00000000           lcall 0, 0                         ; call System.WriteString
0151  9a00000000           lcall 0, 0                         ; call System.WriteLn
0156  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:334
015b  bf0000               mov di, 0                          ; data System.OUTPUT
015e  1e                   push ds                           
015f  57                   push di                           
0160  bf0000               mov di, 0                          ; string "DOPIERO TERAZ SIE ZORIENTOWALES ZE NA SRODKU STOI WIELKIE DRZEWO"
0163  0e                   push cs                           
0164  57                   push di                           
0165  31c0                 xor ax, ax                        
0167  50                   push ax                           
0168  9a00000000           lcall 0, 0                         ; call System.WriteString
016d  9a00000000           lcall 0, 0                         ; call System.WriteLn
0172  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:335
0177  bf0000               mov di, 0                          ; data System.OUTPUT
017a  1e                   push ds                           
017b  57                   push di                           
017c  bf0000               mov di, 0                          ; string "HMMM ALE ZARAZ ... TE KRZAKI NA ZACHOD WYGLADAJA BARDZO PODEJRZANIE...."
017f  0e                   push cs                           
0180  57                   push di                           
0181  31c0                 xor ax, ax                        
0183  50                   push ax                           
0184  9a00000000           lcall 0, 0                         ; call System.WriteString
0189  9a00000000           lcall 0, 0                         ; call System.WriteLn
018e  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:336
0193  9a00000000           lcall 0, 0                         ; call PRZEDM.BLUSZCZ
; SWIAT.PAS:338
0198  bf0000               mov di, 0                          ; data System.OUTPUT
019b  1e                   push ds                           
019c  57                   push di                           
019d  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
01a0  99                   cwd                               
01a1  52                   push dx                           
01a2  50                   push ax                           
01a3  31c0                 xor ax, ax                        
01a5  50                   push ax                           
01a6  9a00000000           lcall 0, 0                         ; call System.WriteInteger
01ab  bf0000               mov di, 0                          ; string "%."
01ae  0e                   push cs                           
01af  57                   push di                           
01b0  31c0                 xor ax, ax                        
01b2  50                   push ax                           
01b3  9a00000000           lcall 0, 0                         ; call System.WriteString
01b8  a10000               mov ax, word ptr [0]               ; data PRZEDM.KUNSZT
01bb  99                   cwd                               
01bc  52                   push dx                           
01bd  50                   push ax                           
01be  31c0                 xor ax, ax                        
01c0  50                   push ax                           
01c1  9a00000000           lcall 0, 0                         ; call System.WriteInteger
01c6  b03e                 mov al, 0x3e                      
01c8  50                   push ax                           
01c9  31c0                 xor ax, ax                        
01cb  50                   push ax                           
01cc  9a00000000           lcall 0, 0                         ; call System.WriteChar
01d1  9a00000000           lcall 0, 0                         ; call System.WriteEnd
01d6  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:339
01db  bf0000               mov di, 0                          ; data System.INPUT
01de  1e                   push ds                           
01df  57                   push di                           
01e0  bf0000               mov di, 0                          ; data PRZEDM.wpisz
01e3  1e                   push ds                           
01e4  57                   push di                           
01e5  b8ff00               mov ax, 0xff                      
01e8  50                   push ax                           
01e9  9a00000000           lcall 0, 0                         ; call System.ReadString
01ee  9a00000000           lcall 0, 0                         ; call System.ReadLn
01f3  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:340
01f8  9a00000000           lcall 0, 0                         ; call PRZEDM.KOMENDY
; SWIAT.PAS:341
01fd  9a00000000           lcall 0, 0                         ; call PRZEDM.FIGHTBLUSZCZ
; SWIAT.PAS:342
0202  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0205  1e                   push ds                           
0206  57                   push di                           
0207  bf0000               mov di, 0                          ; string "MODE"
020a  0e                   push cs                           
020b  57                   push di                           
020c  9a00000000           lcall 0, 0                         ; call System.CompareString
0211  7505                 jne 0x218                         
0213  9a00000000           lcall 0, 0                         ; call PRZEDM.MODE
; SWIAT.PAS:343
0218  bf0000               mov di, 0                          ; data PRZEDM.wpisz
021b  1e                   push ds                           
021c  57                   push di                           
021d  bf0000               mov di, 0                          ; string "EXIT"
0220  0e                   push cs                           
0221  57                   push di                           
0222  9a00000000           lcall 0, 0                         ; call System.CompareString
0227  7554                 jne 0x27d                         
; SWIAT.PAS:344
0229  bf0000               mov di, 0                          ; data System.OUTPUT
022c  1e                   push ds                           
022d  57                   push di                           
022e  bf0000               mov di, 0                          ; string "DOSTEPNE WYJSCIA:"
0231  0e                   push cs                           
0232  57                   push di                           
0233  31c0                 xor ax, ax                        
0235  50                   push ax                           
0236  9a00000000           lcall 0, 0                         ; call System.WriteString
023b  9a00000000           lcall 0, 0                         ; call System.WriteLn
0240  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:345
0245  bf0000               mov di, 0                          ; data System.OUTPUT
0248  1e                   push ds                           
0249  57                   push di                           
024a  bf0000               mov di, 0                          ; string "POLNOC-BLUSZCZ"
024d  0e                   push cs                           
024e  57                   push di                           
024f  31c0                 xor ax, ax                        
0251  50                   push ax                           
0252  9a00000000           lcall 0, 0                         ; call System.WriteString
0257  9a00000000           lcall 0, 0                         ; call System.WriteLn
025c  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:346
0261  bf0000               mov di, 0                          ; data System.OUTPUT
0264  1e                   push ds                           
0265  57                   push di                           
0266  bf0000               mov di, 0                          ; string "ZACHOD-PODEJRZANE KRZAKI"
0269  0e                   push cs                           
026a  57                   push di                           
026b  31c0                 xor ax, ax                        
026d  50                   push ax                           
026e  9a00000000           lcall 0, 0                         ; call System.WriteString
0273  9a00000000           lcall 0, 0                         ; call System.WriteLn
0278  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:348
027d  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0280  1e                   push ds                           
0281  57                   push di                           
0282  bf0000               mov di, 0                          ; string "WYJSCIE"
0285  0e                   push cs                           
0286  57                   push di                           
0287  9a00000000           lcall 0, 0                         ; call System.CompareString
028c  7502                 jne 0x290                         
028e  eb38                 jmp 0x2c8                         
; SWIAT.PAS:349
0290  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0293  1e                   push ds                           
0294  57                   push di                           
0295  bf0000               mov di, 0                          ; string "POLNOC"
0298  0e                   push cs                           
0299  57                   push di                           
029a  9a00000000           lcall 0, 0                         ; call System.CompareString
029f  7506                 jne 0x2a7                         
02a1  c70600005000         mov word ptr [0], 0x50             ; data PRZEDM.MIECHO
; SWIAT.PAS:350
02a7  bf0000               mov di, 0                          ; data PRZEDM.wpisz
02aa  1e                   push ds                           
02ab  57                   push di                           
02ac  bf0000               mov di, 0                          ; string "ZACHOD"
02af  0e                   push cs                           
02b0  57                   push di                           
02b1  9a00000000           lcall 0, 0                         ; call System.CompareString
02b6  7506                 jne 0x2be                         
02b8  c70600005400         mov word ptr [0], 0x54             ; data PRZEDM.MIECHO
; SWIAT.PAS:351
02be  833e000053           cmp word ptr [0], 0x53             ; data PRZEDM.MIECHO
02c3  7503                 jne 0x2c8                         
02c5  e9d0fe               jmp 0x198                         
; SWIAT.PAS:353
02c8  5d                   pop bp                            
02c9  cb                   retf                              
```

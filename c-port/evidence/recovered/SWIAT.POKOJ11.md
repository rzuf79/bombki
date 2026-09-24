# `SWIAT.POKOJ11`

Generated recovery aid; not reconstructed source code.

- Original source map: `SWIAT.PAS:229-263`
- TPU code block: `0x0030`
- Procedure bytes: `0x0261`–`0x0547`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.ENERGIA`
- `PRZEDM.KUNSZT`
- `PRZEDM.MIECHO`
- `PRZEDM.wpisz`
- `System.INPUT`
- `System.OUTPUT`

## Calls

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

- `"JESTES W POKOJU PROWADZACYM DO KLATEK"`
- `"DRZWI POD TOBA SIE ZATRZASNELY I NIE MASZ ODWROTU"`
- `"WE WSZYSTKICH KIERUNKACH SA KLATKI I UJADAJACE SIE W NICH POTWORY"`
- `"NO A POZA TYM NA SCIANIE JEST!!! PLAKAT!!!!"`
- `"%."`
- `"MODE"`
- `"EXIT"`
- `"DOSTEPNE WYJSCIA:"`
- `"WSCHOD-KLATKA CIENIASA"`
- `"ZACHOD-KLATKA SILNEGO"`
- `"POLNOC-KLATKA ZRECZNEGO"`
- `"POLODNIE-KLATKA ODPORNEGO"`
- `"GORA-KLATKA SILNEGO,ODPORNEGO I ZRECZNEGO "`
- `"DOL-JEDYNA DROGA NIE PROWADZACA DO KLATEK"`
- `"WYJSCIE"`
- `"WSCHOD"`
- `"ZACHOD"`
- `"POLNOC"`
- `"POLODNIE"`
- `"GORA"`
- `"DOL"`
- `"PATRZ PLAKAT"`
- `"NA PLAKACIE PISZE:"`
- `"W KLATKACH SA POTWORKI - ZABIJ JE! KOMEDA : ZABIJ [COS] - ZABIJA "`
- `"CZASAMI COS WYPADNIE Z POTWORKA MOZE CI SIE TO PRZYDAC"`

## Annotated listing

```asm
; SWIAT.PAS:229
0261  55                   push bp                           
0262  89e5                 mov bp, sp                        
0264  31c0                 xor ax, ax                        
0266  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; SWIAT.PAS:230
026b  833e00000b           cmp word ptr [0], 0xb              ; data PRZEDM.MIECHO
0270  7403                 je 0x275                          
0272  e9d002               jmp 0x545                         
; SWIAT.PAS:231
0275  bf0000               mov di, 0                          ; data System.OUTPUT
0278  1e                   push ds                           
0279  57                   push di                           
027a  bf0000               mov di, 0                          ; string "JESTES W POKOJU PROWADZACYM DO KLATEK"
027d  0e                   push cs                           
027e  57                   push di                           
027f  31c0                 xor ax, ax                        
0281  50                   push ax                           
0282  9a00000000           lcall 0, 0                         ; call System.WriteString
0287  9a00000000           lcall 0, 0                         ; call System.WriteLn
028c  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:232
0291  bf0000               mov di, 0                          ; data System.OUTPUT
0294  1e                   push ds                           
0295  57                   push di                           
0296  bf0000               mov di, 0                          ; string "DRZWI POD TOBA SIE ZATRZASNELY I NIE MASZ ODWROTU"
0299  0e                   push cs                           
029a  57                   push di                           
029b  31c0                 xor ax, ax                        
029d  50                   push ax                           
029e  9a00000000           lcall 0, 0                         ; call System.WriteString
02a3  9a00000000           lcall 0, 0                         ; call System.WriteLn
02a8  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:233
02ad  bf0000               mov di, 0                          ; data System.OUTPUT
02b0  1e                   push ds                           
02b1  57                   push di                           
02b2  bf0000               mov di, 0                          ; string "WE WSZYSTKICH KIERUNKACH SA KLATKI I UJADAJACE SIE W NICH POTWORY"
02b5  0e                   push cs                           
02b6  57                   push di                           
02b7  31c0                 xor ax, ax                        
02b9  50                   push ax                           
02ba  9a00000000           lcall 0, 0                         ; call System.WriteString
02bf  9a00000000           lcall 0, 0                         ; call System.WriteLn
02c4  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:234
02c9  bf0000               mov di, 0                          ; data System.OUTPUT
02cc  1e                   push ds                           
02cd  57                   push di                           
02ce  bf0000               mov di, 0                          ; string "NO A POZA TYM NA SCIANIE JEST!!! PLAKAT!!!!"
02d1  0e                   push cs                           
02d2  57                   push di                           
02d3  31c0                 xor ax, ax                        
02d5  50                   push ax                           
02d6  9a00000000           lcall 0, 0                         ; call System.WriteString
02db  9a00000000           lcall 0, 0                         ; call System.WriteLn
02e0  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:236
02e5  bf0000               mov di, 0                          ; data System.OUTPUT
02e8  1e                   push ds                           
02e9  57                   push di                           
02ea  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
02ed  99                   cwd                               
02ee  52                   push dx                           
02ef  50                   push ax                           
02f0  31c0                 xor ax, ax                        
02f2  50                   push ax                           
02f3  9a00000000           lcall 0, 0                         ; call System.WriteInteger
02f8  bf0000               mov di, 0                          ; string "%."
02fb  0e                   push cs                           
02fc  57                   push di                           
02fd  31c0                 xor ax, ax                        
02ff  50                   push ax                           
0300  9a00000000           lcall 0, 0                         ; call System.WriteString
0305  a10000               mov ax, word ptr [0]               ; data PRZEDM.KUNSZT
0308  99                   cwd                               
0309  52                   push dx                           
030a  50                   push ax                           
030b  31c0                 xor ax, ax                        
030d  50                   push ax                           
030e  9a00000000           lcall 0, 0                         ; call System.WriteInteger
0313  b03e                 mov al, 0x3e                      
0315  50                   push ax                           
0316  31c0                 xor ax, ax                        
0318  50                   push ax                           
0319  9a00000000           lcall 0, 0                         ; call System.WriteChar
031e  9a00000000           lcall 0, 0                         ; call System.WriteEnd
0323  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:237
0328  bf0000               mov di, 0                          ; data System.INPUT
032b  1e                   push ds                           
032c  57                   push di                           
032d  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0330  1e                   push ds                           
0331  57                   push di                           
0332  b8ff00               mov ax, 0xff                      
0335  50                   push ax                           
0336  9a00000000           lcall 0, 0                         ; call System.ReadString
033b  9a00000000           lcall 0, 0                         ; call System.ReadLn
0340  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:238
0345  9a00000000           lcall 0, 0                         ; call PRZEDM.KOMENDY
; SWIAT.PAS:239
034a  bf0000               mov di, 0                          ; data PRZEDM.wpisz
034d  1e                   push ds                           
034e  57                   push di                           
034f  bf0000               mov di, 0                          ; string "MODE"
0352  0e                   push cs                           
0353  57                   push di                           
0354  9a00000000           lcall 0, 0                         ; call System.CompareString
0359  7505                 jne 0x360                         
035b  9a00000000           lcall 0, 0                         ; call PRZEDM.MODE
; SWIAT.PAS:240
0360  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0363  1e                   push ds                           
0364  57                   push di                           
0365  bf0000               mov di, 0                          ; string "EXIT"
0368  0e                   push cs                           
0369  57                   push di                           
036a  9a00000000           lcall 0, 0                         ; call System.CompareString
036f  7403                 je 0x374                          
0371  e9c400               jmp 0x438                         
; SWIAT.PAS:241
0374  bf0000               mov di, 0                          ; data System.OUTPUT
0377  1e                   push ds                           
0378  57                   push di                           
0379  bf0000               mov di, 0                          ; string "DOSTEPNE WYJSCIA:"
037c  0e                   push cs                           
037d  57                   push di                           
037e  31c0                 xor ax, ax                        
0380  50                   push ax                           
0381  9a00000000           lcall 0, 0                         ; call System.WriteString
0386  9a00000000           lcall 0, 0                         ; call System.WriteLn
038b  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:242
0390  bf0000               mov di, 0                          ; data System.OUTPUT
0393  1e                   push ds                           
0394  57                   push di                           
0395  bf0000               mov di, 0                          ; string "WSCHOD-KLATKA CIENIASA"
0398  0e                   push cs                           
0399  57                   push di                           
039a  31c0                 xor ax, ax                        
039c  50                   push ax                           
039d  9a00000000           lcall 0, 0                         ; call System.WriteString
03a2  9a00000000           lcall 0, 0                         ; call System.WriteLn
03a7  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:243
03ac  bf0000               mov di, 0                          ; data System.OUTPUT
03af  1e                   push ds                           
03b0  57                   push di                           
03b1  bf0000               mov di, 0                          ; string "ZACHOD-KLATKA SILNEGO"
03b4  0e                   push cs                           
03b5  57                   push di                           
03b6  31c0                 xor ax, ax                        
03b8  50                   push ax                           
03b9  9a00000000           lcall 0, 0                         ; call System.WriteString
03be  9a00000000           lcall 0, 0                         ; call System.WriteLn
03c3  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:244
03c8  bf0000               mov di, 0                          ; data System.OUTPUT
03cb  1e                   push ds                           
03cc  57                   push di                           
03cd  bf0000               mov di, 0                          ; string "POLNOC-KLATKA ZRECZNEGO"
03d0  0e                   push cs                           
03d1  57                   push di                           
03d2  31c0                 xor ax, ax                        
03d4  50                   push ax                           
03d5  9a00000000           lcall 0, 0                         ; call System.WriteString
03da  9a00000000           lcall 0, 0                         ; call System.WriteLn
03df  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:245
03e4  bf0000               mov di, 0                          ; data System.OUTPUT
03e7  1e                   push ds                           
03e8  57                   push di                           
03e9  bf0000               mov di, 0                          ; string "POLODNIE-KLATKA ODPORNEGO"
03ec  0e                   push cs                           
03ed  57                   push di                           
03ee  31c0                 xor ax, ax                        
03f0  50                   push ax                           
03f1  9a00000000           lcall 0, 0                         ; call System.WriteString
03f6  9a00000000           lcall 0, 0                         ; call System.WriteLn
03fb  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:246
0400  bf0000               mov di, 0                          ; data System.OUTPUT
0403  1e                   push ds                           
0404  57                   push di                           
0405  bf0000               mov di, 0                          ; string "GORA-KLATKA SILNEGO,ODPORNEGO I ZRECZNEGO "
0408  0e                   push cs                           
0409  57                   push di                           
040a  31c0                 xor ax, ax                        
040c  50                   push ax                           
040d  9a00000000           lcall 0, 0                         ; call System.WriteString
0412  9a00000000           lcall 0, 0                         ; call System.WriteLn
0417  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:247
041c  bf0000               mov di, 0                          ; data System.OUTPUT
041f  1e                   push ds                           
0420  57                   push di                           
0421  bf0000               mov di, 0                          ; string "DOL-JEDYNA DROGA NIE PROWADZACA DO KLATEK"
0424  0e                   push cs                           
0425  57                   push di                           
0426  31c0                 xor ax, ax                        
0428  50                   push ax                           
0429  9a00000000           lcall 0, 0                         ; call System.WriteString
042e  9a00000000           lcall 0, 0                         ; call System.WriteLn
0433  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:249
0438  bf0000               mov di, 0                          ; data PRZEDM.wpisz
043b  1e                   push ds                           
043c  57                   push di                           
043d  bf0000               mov di, 0                          ; string "WYJSCIE"
0440  0e                   push cs                           
0441  57                   push di                           
0442  9a00000000           lcall 0, 0                         ; call System.CompareString
0447  7503                 jne 0x44c                         
0449  e9f900               jmp 0x545                         
; SWIAT.PAS:250
044c  bf0000               mov di, 0                          ; data PRZEDM.wpisz
044f  1e                   push ds                           
0450  57                   push di                           
0451  bf0000               mov di, 0                          ; string "WSCHOD"
0454  0e                   push cs                           
0455  57                   push di                           
0456  9a00000000           lcall 0, 0                         ; call System.CompareString
045b  7506                 jne 0x463                         
045d  c70600000c00         mov word ptr [0], 0xc              ; data PRZEDM.MIECHO
; SWIAT.PAS:251
0463  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0466  1e                   push ds                           
0467  57                   push di                           
0468  bf0000               mov di, 0                          ; string "ZACHOD"
046b  0e                   push cs                           
046c  57                   push di                           
046d  9a00000000           lcall 0, 0                         ; call System.CompareString
0472  7506                 jne 0x47a                         
0474  c70600000d00         mov word ptr [0], 0xd              ; data PRZEDM.MIECHO
; SWIAT.PAS:252
047a  bf0000               mov di, 0                          ; data PRZEDM.wpisz
047d  1e                   push ds                           
047e  57                   push di                           
047f  bf0000               mov di, 0                          ; string "POLNOC"
0482  0e                   push cs                           
0483  57                   push di                           
0484  9a00000000           lcall 0, 0                         ; call System.CompareString
0489  7506                 jne 0x491                         
048b  c70600000e00         mov word ptr [0], 0xe              ; data PRZEDM.MIECHO
; SWIAT.PAS:253
0491  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0494  1e                   push ds                           
0495  57                   push di                           
0496  bf0000               mov di, 0                          ; string "POLODNIE"
0499  0e                   push cs                           
049a  57                   push di                           
049b  9a00000000           lcall 0, 0                         ; call System.CompareString
04a0  7506                 jne 0x4a8                         
04a2  c70600000f00         mov word ptr [0], 0xf              ; data PRZEDM.MIECHO
; SWIAT.PAS:254
04a8  bf0000               mov di, 0                          ; data PRZEDM.wpisz
04ab  1e                   push ds                           
04ac  57                   push di                           
04ad  bf0000               mov di, 0                          ; string "GORA"
04b0  0e                   push cs                           
04b1  57                   push di                           
04b2  9a00000000           lcall 0, 0                         ; call System.CompareString
04b7  7506                 jne 0x4bf                         
04b9  c70600001000         mov word ptr [0], 0x10             ; data PRZEDM.MIECHO
; SWIAT.PAS:255
04bf  bf0000               mov di, 0                          ; data PRZEDM.wpisz
04c2  1e                   push ds                           
04c3  57                   push di                           
04c4  bf0000               mov di, 0                          ; string "DOL"
04c7  0e                   push cs                           
04c8  57                   push di                           
04c9  9a00000000           lcall 0, 0                         ; call System.CompareString
04ce  7506                 jne 0x4d6                         
04d0  c70600001100         mov word ptr [0], 0x11             ; data PRZEDM.MIECHO
; SWIAT.PAS:256
04d6  bf0000               mov di, 0                          ; data PRZEDM.wpisz
04d9  1e                   push ds                           
04da  57                   push di                           
04db  bf0000               mov di, 0                          ; string "PATRZ PLAKAT"
04de  0e                   push cs                           
04df  57                   push di                           
04e0  9a00000000           lcall 0, 0                         ; call System.CompareString
04e5  7554                 jne 0x53b                         
; SWIAT.PAS:257
04e7  bf0000               mov di, 0                          ; data System.OUTPUT
04ea  1e                   push ds                           
04eb  57                   push di                           
04ec  bf0000               mov di, 0                          ; string "NA PLAKACIE PISZE:"
04ef  0e                   push cs                           
04f0  57                   push di                           
04f1  31c0                 xor ax, ax                        
04f3  50                   push ax                           
04f4  9a00000000           lcall 0, 0                         ; call System.WriteString
04f9  9a00000000           lcall 0, 0                         ; call System.WriteLn
04fe  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:258
0503  bf0000               mov di, 0                          ; data System.OUTPUT
0506  1e                   push ds                           
0507  57                   push di                           
0508  bf0000               mov di, 0                          ; string "W KLATKACH SA POTWORKI - ZABIJ JE! KOMEDA : ZABIJ [COS] - ZABIJA "
050b  0e                   push cs                           
050c  57                   push di                           
050d  31c0                 xor ax, ax                        
050f  50                   push ax                           
0510  9a00000000           lcall 0, 0                         ; call System.WriteString
0515  9a00000000           lcall 0, 0                         ; call System.WriteLn
051a  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:259
051f  bf0000               mov di, 0                          ; data System.OUTPUT
0522  1e                   push ds                           
0523  57                   push di                           
0524  bf0000               mov di, 0                          ; string "CZASAMI COS WYPADNIE Z POTWORKA MOZE CI SIE TO PRZYDAC"
0527  0e                   push cs                           
0528  57                   push di                           
0529  31c0                 xor ax, ax                        
052b  50                   push ax                           
052c  9a00000000           lcall 0, 0                         ; call System.WriteString
0531  9a00000000           lcall 0, 0                         ; call System.WriteLn
0536  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:261
053b  833e00000b           cmp word ptr [0], 0xb              ; data PRZEDM.MIECHO
0540  7503                 jne 0x545                         
0542  e9a0fd               jmp 0x2e5                         
; SWIAT.PAS:263
0545  5d                   pop bp                            
0546  cb                   retf                              
```

# `SWIAT.POKOJ13`

Generated recovery aid; not reconstructed source code.

- Original source map: `SWIAT.PAS:127-168`
- TPU code block: `0x0020`
- Procedure bytes: `0x01a7`–`0x0468`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `MONSTRA.SILNY`
- `PRZEDM.CZY`
- `PRZEDM.ENERGIA`
- `PRZEDM.FORSA`
- `PRZEDM.FUKS`
- `PRZEDM.KUNSZT`
- `PRZEDM.MIECHO`
- `PRZEDM.MMIECZ`
- `PRZEDM.MTARCZA`
- `PRZEDM.PASZOL`
- `PRZEDM.SERCE`
- `PRZEDM.WROGEN`
- `PRZEDM.WROGSIL`
- `PRZEDM.WROGZRE`
- `PRZEDM.wpisz`
- `PRZEDM:0x0038+0x0002`
- `System.INPUT`
- `System.OUTPUT`

## Calls

- `PRZEDM.MODE`
- `PRZEDM.WALKA`
- `System.CompareString`
- `System.Random`
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

- `"TEN POKOJ JEST CALY OBRYZGANY KRWIA NA SCIANACH FLAKI I MOZGI LODZKIE "`
- `"SILNY , NAPAKOWANY POTWOR STOI POD SCIANA"`
- `"PAROJACE WNETRZNOSCI POTWORA SA ROZWLECZONE DOOKOLA"`
- `"%."`
- `"EXIT"`
- `"DOSTEPNE WYJSCIA:"`
- `"WSCHOD-KLATKI PELNE GAJDY"`
- `"MODE"`
- `"WYJSCIE"`
- `"WSCHOD"`
- `"ZABIJ POTWOR"`
- `"WYCIAGASZ "`
- `" MONET Z CIALA POTWORA"`
- `"WYCIAGASZ STARY ZARDZEWIALY MIECZ Z CIALA POTWORA"`
- `"WYCIAGASZ ZWYKLA MALA TARCZA Z CIALA POTWORA"`
- `"WYCIAGASZ ZAKRWAWIONE SERCE Z CIALA POTWORA"`

## Annotated listing

```asm
; SWIAT.PAS:127
01a7  55                   push bp                           
01a8  89e5                 mov bp, sp                        
01aa  31c0                 xor ax, ax                        
01ac  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; SWIAT.PAS:128
01b1  833e00000d           cmp word ptr [0], 0xd              ; data PRZEDM.MIECHO
01b6  7403                 je 0x1bb                          
01b8  e9ab02               jmp 0x466                         
; SWIAT.PAS:129
01bb  bf0000               mov di, 0                          ; data System.OUTPUT
01be  1e                   push ds                           
01bf  57                   push di                           
01c0  bf0000               mov di, 0                          ; string "TEN POKOJ JEST CALY OBRYZGANY KRWIA NA SCIANACH FLAKI I MOZGI LODZKIE "
01c3  0e                   push cs                           
01c4  57                   push di                           
01c5  31c0                 xor ax, ax                        
01c7  50                   push ax                           
01c8  9a00000000           lcall 0, 0                         ; call System.WriteString
01cd  9a00000000           lcall 0, 0                         ; call System.WriteLn
01d2  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:130
01d7  833e00000d           cmp word ptr [0], 0xd              ; data MONSTRA.SILNY
01dc  751c                 jne 0x1fa                         
01de  bf0000               mov di, 0                          ; data System.OUTPUT
01e1  1e                   push ds                           
01e2  57                   push di                           
01e3  bf0000               mov di, 0                          ; string "SILNY , NAPAKOWANY POTWOR STOI POD SCIANA"
01e6  0e                   push cs                           
01e7  57                   push di                           
01e8  31c0                 xor ax, ax                        
01ea  50                   push ax                           
01eb  9a00000000           lcall 0, 0                         ; call System.WriteString
01f0  9a00000000           lcall 0, 0                         ; call System.WriteLn
01f5  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:131
01fa  833e000000           cmp word ptr [0], 0                ; data MONSTRA.SILNY
01ff  751c                 jne 0x21d                         
0201  bf0000               mov di, 0                          ; data System.OUTPUT
0204  1e                   push ds                           
0205  57                   push di                           
0206  bf0000               mov di, 0                          ; string "PAROJACE WNETRZNOSCI POTWORA SA ROZWLECZONE DOOKOLA"
0209  0e                   push cs                           
020a  57                   push di                           
020b  31c0                 xor ax, ax                        
020d  50                   push ax                           
020e  9a00000000           lcall 0, 0                         ; call System.WriteString
0213  9a00000000           lcall 0, 0                         ; call System.WriteLn
0218  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:133
021d  bf0000               mov di, 0                          ; data System.OUTPUT
0220  1e                   push ds                           
0221  57                   push di                           
0222  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
0225  99                   cwd                               
0226  52                   push dx                           
0227  50                   push ax                           
0228  31c0                 xor ax, ax                        
022a  50                   push ax                           
022b  9a00000000           lcall 0, 0                         ; call System.WriteInteger
0230  bf0000               mov di, 0                          ; string "%."
0233  0e                   push cs                           
0234  57                   push di                           
0235  31c0                 xor ax, ax                        
0237  50                   push ax                           
0238  9a00000000           lcall 0, 0                         ; call System.WriteString
023d  a10000               mov ax, word ptr [0]               ; data PRZEDM.KUNSZT
0240  99                   cwd                               
0241  52                   push dx                           
0242  50                   push ax                           
0243  31c0                 xor ax, ax                        
0245  50                   push ax                           
0246  9a00000000           lcall 0, 0                         ; call System.WriteInteger
024b  b03e                 mov al, 0x3e                      
024d  50                   push ax                           
024e  31c0                 xor ax, ax                        
0250  50                   push ax                           
0251  9a00000000           lcall 0, 0                         ; call System.WriteChar
0256  9a00000000           lcall 0, 0                         ; call System.WriteEnd
025b  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:134
0260  bf0000               mov di, 0                          ; data System.INPUT
0263  1e                   push ds                           
0264  57                   push di                           
0265  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0268  1e                   push ds                           
0269  57                   push di                           
026a  b8ff00               mov ax, 0xff                      
026d  50                   push ax                           
026e  9a00000000           lcall 0, 0                         ; call System.ReadString
0273  9a00000000           lcall 0, 0                         ; call System.ReadLn
0278  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:135
027d  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0280  1e                   push ds                           
0281  57                   push di                           
0282  bf0000               mov di, 0                          ; string "EXIT"
0285  0e                   push cs                           
0286  57                   push di                           
0287  9a00000000           lcall 0, 0                         ; call System.CompareString
028c  7538                 jne 0x2c6                         
; SWIAT.PAS:136
028e  bf0000               mov di, 0                          ; data System.OUTPUT
0291  1e                   push ds                           
0292  57                   push di                           
0293  bf0000               mov di, 0                          ; string "DOSTEPNE WYJSCIA:"
0296  0e                   push cs                           
0297  57                   push di                           
0298  31c0                 xor ax, ax                        
029a  50                   push ax                           
029b  9a00000000           lcall 0, 0                         ; call System.WriteString
02a0  9a00000000           lcall 0, 0                         ; call System.WriteLn
02a5  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:137
02aa  bf0000               mov di, 0                          ; data System.OUTPUT
02ad  1e                   push ds                           
02ae  57                   push di                           
02af  bf0000               mov di, 0                          ; string "WSCHOD-KLATKI PELNE GAJDY"
02b2  0e                   push cs                           
02b3  57                   push di                           
02b4  31c0                 xor ax, ax                        
02b6  50                   push ax                           
02b7  9a00000000           lcall 0, 0                         ; call System.WriteString
02bc  9a00000000           lcall 0, 0                         ; call System.WriteLn
02c1  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:139
02c6  bf0000               mov di, 0                          ; data PRZEDM.wpisz
02c9  1e                   push ds                           
02ca  57                   push di                           
02cb  bf0000               mov di, 0                          ; string "MODE"
02ce  0e                   push cs                           
02cf  57                   push di                           
02d0  9a00000000           lcall 0, 0                         ; call System.CompareString
02d5  7505                 jne 0x2dc                         
02d7  9a00000000           lcall 0, 0                         ; call PRZEDM.MODE
; SWIAT.PAS:140
02dc  bf0000               mov di, 0                          ; data PRZEDM.wpisz
02df  1e                   push ds                           
02e0  57                   push di                           
02e1  bf0000               mov di, 0                          ; string "WYJSCIE"
02e4  0e                   push cs                           
02e5  57                   push di                           
02e6  9a00000000           lcall 0, 0                         ; call System.CompareString
02eb  7503                 jne 0x2f0                         
02ed  e97601               jmp 0x466                         
; SWIAT.PAS:141
02f0  bf0000               mov di, 0                          ; data PRZEDM.wpisz
02f3  1e                   push ds                           
02f4  57                   push di                           
02f5  bf0000               mov di, 0                          ; string "WSCHOD"
02f8  0e                   push cs                           
02f9  57                   push di                           
02fa  9a00000000           lcall 0, 0                         ; call System.CompareString
02ff  7506                 jne 0x307                         
0301  c70600000b00         mov word ptr [0], 0xb              ; data PRZEDM.MIECHO
; SWIAT.PAS:142
0307  bf0000               mov di, 0                          ; data PRZEDM.wpisz
030a  1e                   push ds                           
030b  57                   push di                           
030c  bf0000               mov di, 0                          ; string "ZABIJ POTWOR"
030f  0e                   push cs                           
0310  57                   push di                           
0311  9a00000000           lcall 0, 0                         ; call System.CompareString
0316  7403                 je 0x31b                          
0318  e94101               jmp 0x45c                         
031b  833e00000d           cmp word ptr [0], 0xd              ; data MONSTRA.SILNY
0320  7403                 je 0x325                          
0322  e93701               jmp 0x45c                         
; SWIAT.PAS:143
0325  c70600001400         mov word ptr [0], 0x14             ; data PRZEDM.WROGEN
; SWIAT.PAS:144
032b  c70600000300         mov word ptr [0], 3                ; data PRZEDM.WROGZRE
; SWIAT.PAS:145
0331  c70600000a00         mov word ptr [0], 0xa              ; data PRZEDM.WROGSIL
; SWIAT.PAS:146
0337  9a00000000           lcall 0, 0                         ; call PRZEDM.WALKA
; SWIAT.PAS:147
033c  833e000000           cmp word ptr [0], 0                ; data PRZEDM.PASZOL
0341  7403                 je 0x346                          
0343  e91101               jmp 0x457                         
; SWIAT.PAS:148
0346  31c0                 xor ax, ax                        
0348  a30000               mov word ptr [0], ax               ; data MONSTRA.SILNY
; SWIAT.PAS:149
034b  b80f00               mov ax, 0xf                       
034e  50                   push ax                           
034f  9a00000000           lcall 0, 0                         ; call System.Random
0354  a30000               mov word ptr [0], ax               ; data PRZEDM.CZY
; SWIAT.PAS:150
0357  bf0000               mov di, 0                          ; data System.OUTPUT
035a  1e                   push ds                           
035b  57                   push di                           
035c  bf0000               mov di, 0                          ; string "WYCIAGASZ "
035f  0e                   push cs                           
0360  57                   push di                           
0361  31c0                 xor ax, ax                        
0363  50                   push ax                           
0364  9a00000000           lcall 0, 0                         ; call System.WriteString
0369  a10000               mov ax, word ptr [0]               ; data PRZEDM.CZY
036c  99                   cwd                               
036d  52                   push dx                           
036e  50                   push ax                           
036f  31c0                 xor ax, ax                        
0371  50                   push ax                           
0372  9a00000000           lcall 0, 0                         ; call System.WriteInteger
0377  bf0000               mov di, 0                          ; string " MONET Z CIALA POTWORA"
037a  0e                   push cs                           
037b  57                   push di                           
037c  31c0                 xor ax, ax                        
037e  50                   push ax                           
037f  9a00000000           lcall 0, 0                         ; call System.WriteString
0384  9a00000000           lcall 0, 0                         ; call System.WriteLn
0389  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:151
038e  a10000               mov ax, word ptr [0]               ; data PRZEDM.CZY
0391  99                   cwd                               
0392  03060000             add ax, word ptr [0]               ; data PRZEDM.FORSA
0396  13160000             adc dx, word ptr [0]               ; data PRZEDM:0x0038+0x0002
039a  a30000               mov word ptr [0], ax               ; data PRZEDM.FORSA
039d  89160000             mov word ptr [0], dx               ; data PRZEDM:0x0038+0x0002
; SWIAT.PAS:152
03a1  833e000000           cmp word ptr [0], 0                ; data PRZEDM.MMIECZ
03a6  7535                 jne 0x3dd                         
; SWIAT.PAS:153
03a8  b81400               mov ax, 0x14                      
03ab  50                   push ax                           
03ac  9a00000000           lcall 0, 0                         ; call System.Random
03b1  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; SWIAT.PAS:154
03b4  833e000007           cmp word ptr [0], 7                ; data PRZEDM.FUKS
03b9  7d22                 jge 0x3dd                         
03bb  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
03be  a30000               mov word ptr [0], ax               ; data PRZEDM.MMIECZ
03c1  bf0000               mov di, 0                          ; data System.OUTPUT
03c4  1e                   push ds                           
03c5  57                   push di                           
03c6  bf0000               mov di, 0                          ; string "WYCIAGASZ STARY ZARDZEWIALY MIECZ Z CIALA POTWORA"
03c9  0e                   push cs                           
03ca  57                   push di                           
03cb  31c0                 xor ax, ax                        
03cd  50                   push ax                           
03ce  9a00000000           lcall 0, 0                         ; call System.WriteString
03d3  9a00000000           lcall 0, 0                         ; call System.WriteLn
03d8  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:156
03dd  833e000000           cmp word ptr [0], 0                ; data PRZEDM.MTARCZA
03e2  7535                 jne 0x419                         
; SWIAT.PAS:157
03e4  b81400               mov ax, 0x14                      
03e7  50                   push ax                           
03e8  9a00000000           lcall 0, 0                         ; call System.Random
03ed  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; SWIAT.PAS:158
03f0  833e000007           cmp word ptr [0], 7                ; data PRZEDM.FUKS
03f5  7d22                 jge 0x419                         
03f7  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
03fa  a30000               mov word ptr [0], ax               ; data PRZEDM.MTARCZA
03fd  bf0000               mov di, 0                          ; data System.OUTPUT
0400  1e                   push ds                           
0401  57                   push di                           
0402  bf0000               mov di, 0                          ; string "WYCIAGASZ ZWYKLA MALA TARCZA Z CIALA POTWORA"
0405  0e                   push cs                           
0406  57                   push di                           
0407  31c0                 xor ax, ax                        
0409  50                   push ax                           
040a  9a00000000           lcall 0, 0                         ; call System.WriteString
040f  9a00000000           lcall 0, 0                         ; call System.WriteLn
0414  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:160
0419  833e000000           cmp word ptr [0], 0                ; data PRZEDM.SERCE
041e  7535                 jne 0x455                         
; SWIAT.PAS:161
0420  b81400               mov ax, 0x14                      
0423  50                   push ax                           
0424  9a00000000           lcall 0, 0                         ; call System.Random
0429  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; SWIAT.PAS:162
042c  833e000006           cmp word ptr [0], 6                ; data PRZEDM.FUKS
0431  7d22                 jge 0x455                         
0433  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
0436  a30000               mov word ptr [0], ax               ; data PRZEDM.SERCE
0439  bf0000               mov di, 0                          ; data System.OUTPUT
043c  1e                   push ds                           
043d  57                   push di                           
043e  bf0000               mov di, 0                          ; string "WYCIAGASZ ZAKRWAWIONE SERCE Z CIALA POTWORA"
0441  0e                   push cs                           
0442  57                   push di                           
0443  31c0                 xor ax, ax                        
0445  50                   push ax                           
0446  9a00000000           lcall 0, 0                         ; call System.WriteString
044b  9a00000000           lcall 0, 0                         ; call System.WriteLn
0450  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:164
0455  eb05                 jmp 0x45c                         
0457  31c0                 xor ax, ax                        
0459  a30000               mov word ptr [0], ax               ; data PRZEDM.PASZOL
; SWIAT.PAS:166
045c  833e00000d           cmp word ptr [0], 0xd              ; data PRZEDM.MIECHO
0461  7503                 jne 0x466                         
0463  e9b7fd               jmp 0x21d                         
; SWIAT.PAS:168
0466  5d                   pop bp                            
0467  cb                   retf                              
```

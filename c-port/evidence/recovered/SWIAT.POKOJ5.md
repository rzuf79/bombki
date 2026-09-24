# `SWIAT.POKOJ5`

Generated recovery aid; not reconstructed source code.

- Original source map: `SWIAT.PAS:18-47`
- TPU code block: `0x0000`
- Procedure bytes: `0x0196`–`0x0435`
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

- `"SZOK!! AAA UPSI  O NIE FUJ ACH AJ OCH NEIN EEE UGH   "`
- `"STWIERDZASZ ZE W TYM POKOJU JEST X POKOI O NIE !! JAK SIE WYDOSTAC?"`
- `"AHA (NA SCIANIE JEST PLAKAT)"`
- `"%."`
- `"MODE"`
- `"EXIT"`
- `"DOSTEPNE WYJSCIA:"`
- `"WSCHOD-MUD SZKOLA"`
- `"ZACHOD-POKOJ"`
- `"POLNOC-POKOJ"`
- `"POLODNIE-POKOJ"`
- `"GORA-POKOJ"`
- `"DOL-POKOJ"`
- `"WYJSCIE"`
- `"WSCHOD"`
- `"ZACHOD"`
- `"POLNOC"`
- `"POLODNIE"`
- `"GORA"`
- `"DOL"`
- `"PATRZ PLAKAT"`
- `"NA PLAKACIE BYNAJMNIEJ PISZE"`
- `"TO JEST POKOJ DO ORIETACJI W TERENIE ORAZ W KIERUNKACH"`

## Annotated listing

```asm
; SWIAT.PAS:18
0196  55                   push bp                           
0197  89e5                 mov bp, sp                        
0199  31c0                 xor ax, ax                        
019b  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; SWIAT.PAS:19
01a0  bf0000               mov di, 0                          ; data System.OUTPUT
01a3  1e                   push ds                           
01a4  57                   push di                           
01a5  bf0000               mov di, 0                          ; string "SZOK!! AAA UPSI  O NIE FUJ ACH AJ OCH NEIN EEE UGH   "
01a8  0e                   push cs                           
01a9  57                   push di                           
01aa  31c0                 xor ax, ax                        
01ac  50                   push ax                           
01ad  9a00000000           lcall 0, 0                         ; call System.WriteString
01b2  9a00000000           lcall 0, 0                         ; call System.WriteLn
01b7  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:20
01bc  bf0000               mov di, 0                          ; data System.OUTPUT
01bf  1e                   push ds                           
01c0  57                   push di                           
01c1  bf0000               mov di, 0                          ; string "STWIERDZASZ ZE W TYM POKOJU JEST X POKOI O NIE !! JAK SIE WYDOSTAC?"
01c4  0e                   push cs                           
01c5  57                   push di                           
01c6  31c0                 xor ax, ax                        
01c8  50                   push ax                           
01c9  9a00000000           lcall 0, 0                         ; call System.WriteString
01ce  9a00000000           lcall 0, 0                         ; call System.WriteLn
01d3  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:21
01d8  bf0000               mov di, 0                          ; data System.OUTPUT
01db  1e                   push ds                           
01dc  57                   push di                           
01dd  bf0000               mov di, 0                          ; string "AHA (NA SCIANIE JEST PLAKAT)"
01e0  0e                   push cs                           
01e1  57                   push di                           
01e2  31c0                 xor ax, ax                        
01e4  50                   push ax                           
01e5  9a00000000           lcall 0, 0                         ; call System.WriteString
01ea  9a00000000           lcall 0, 0                         ; call System.WriteLn
01ef  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:23
01f4  bf0000               mov di, 0                          ; data System.OUTPUT
01f7  1e                   push ds                           
01f8  57                   push di                           
01f9  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
01fc  99                   cwd                               
01fd  52                   push dx                           
01fe  50                   push ax                           
01ff  31c0                 xor ax, ax                        
0201  50                   push ax                           
0202  9a00000000           lcall 0, 0                         ; call System.WriteInteger
0207  bf0000               mov di, 0                          ; string "%."
020a  0e                   push cs                           
020b  57                   push di                           
020c  31c0                 xor ax, ax                        
020e  50                   push ax                           
020f  9a00000000           lcall 0, 0                         ; call System.WriteString
0214  a10000               mov ax, word ptr [0]               ; data PRZEDM.KUNSZT
0217  99                   cwd                               
0218  52                   push dx                           
0219  50                   push ax                           
021a  31c0                 xor ax, ax                        
021c  50                   push ax                           
021d  9a00000000           lcall 0, 0                         ; call System.WriteInteger
0222  b03e                 mov al, 0x3e                      
0224  50                   push ax                           
0225  31c0                 xor ax, ax                        
0227  50                   push ax                           
0228  9a00000000           lcall 0, 0                         ; call System.WriteChar
022d  9a00000000           lcall 0, 0                         ; call System.WriteEnd
0232  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:24
0237  bf0000               mov di, 0                          ; data System.INPUT
023a  1e                   push ds                           
023b  57                   push di                           
023c  bf0000               mov di, 0                          ; data PRZEDM.wpisz
023f  1e                   push ds                           
0240  57                   push di                           
0241  b8ff00               mov ax, 0xff                      
0244  50                   push ax                           
0245  9a00000000           lcall 0, 0                         ; call System.ReadString
024a  9a00000000           lcall 0, 0                         ; call System.ReadLn
024f  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:25
0254  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0257  1e                   push ds                           
0258  57                   push di                           
0259  bf0000               mov di, 0                          ; string "MODE"
025c  0e                   push cs                           
025d  57                   push di                           
025e  9a00000000           lcall 0, 0                         ; call System.CompareString
0263  7505                 jne 0x26a                         
0265  9a00000000           lcall 0, 0                         ; call PRZEDM.MODE
; SWIAT.PAS:26
026a  bf0000               mov di, 0                          ; data PRZEDM.wpisz
026d  1e                   push ds                           
026e  57                   push di                           
026f  bf0000               mov di, 0                          ; string "EXIT"
0272  0e                   push cs                           
0273  57                   push di                           
0274  9a00000000           lcall 0, 0                         ; call System.CompareString
0279  7403                 je 0x27e                          
027b  e9c400               jmp 0x342                         
; SWIAT.PAS:27
027e  bf0000               mov di, 0                          ; data System.OUTPUT
0281  1e                   push ds                           
0282  57                   push di                           
0283  bf0000               mov di, 0                          ; string "DOSTEPNE WYJSCIA:"
0286  0e                   push cs                           
0287  57                   push di                           
0288  31c0                 xor ax, ax                        
028a  50                   push ax                           
028b  9a00000000           lcall 0, 0                         ; call System.WriteString
0290  9a00000000           lcall 0, 0                         ; call System.WriteLn
0295  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:28
029a  bf0000               mov di, 0                          ; data System.OUTPUT
029d  1e                   push ds                           
029e  57                   push di                           
029f  bf0000               mov di, 0                          ; string "WSCHOD-MUD SZKOLA"
02a2  0e                   push cs                           
02a3  57                   push di                           
02a4  31c0                 xor ax, ax                        
02a6  50                   push ax                           
02a7  9a00000000           lcall 0, 0                         ; call System.WriteString
02ac  9a00000000           lcall 0, 0                         ; call System.WriteLn
02b1  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:29
02b6  bf0000               mov di, 0                          ; data System.OUTPUT
02b9  1e                   push ds                           
02ba  57                   push di                           
02bb  bf0000               mov di, 0                          ; string "ZACHOD-POKOJ"
02be  0e                   push cs                           
02bf  57                   push di                           
02c0  31c0                 xor ax, ax                        
02c2  50                   push ax                           
02c3  9a00000000           lcall 0, 0                         ; call System.WriteString
02c8  9a00000000           lcall 0, 0                         ; call System.WriteLn
02cd  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:30
02d2  bf0000               mov di, 0                          ; data System.OUTPUT
02d5  1e                   push ds                           
02d6  57                   push di                           
02d7  bf0000               mov di, 0                          ; string "POLNOC-POKOJ"
02da  0e                   push cs                           
02db  57                   push di                           
02dc  31c0                 xor ax, ax                        
02de  50                   push ax                           
02df  9a00000000           lcall 0, 0                         ; call System.WriteString
02e4  9a00000000           lcall 0, 0                         ; call System.WriteLn
02e9  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:31
02ee  bf0000               mov di, 0                          ; data System.OUTPUT
02f1  1e                   push ds                           
02f2  57                   push di                           
02f3  bf0000               mov di, 0                          ; string "POLODNIE-POKOJ"
02f6  0e                   push cs                           
02f7  57                   push di                           
02f8  31c0                 xor ax, ax                        
02fa  50                   push ax                           
02fb  9a00000000           lcall 0, 0                         ; call System.WriteString
0300  9a00000000           lcall 0, 0                         ; call System.WriteLn
0305  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:32
030a  bf0000               mov di, 0                          ; data System.OUTPUT
030d  1e                   push ds                           
030e  57                   push di                           
030f  bf0000               mov di, 0                          ; string "GORA-POKOJ"
0312  0e                   push cs                           
0313  57                   push di                           
0314  31c0                 xor ax, ax                        
0316  50                   push ax                           
0317  9a00000000           lcall 0, 0                         ; call System.WriteString
031c  9a00000000           lcall 0, 0                         ; call System.WriteLn
0321  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:33
0326  bf0000               mov di, 0                          ; data System.OUTPUT
0329  1e                   push ds                           
032a  57                   push di                           
032b  bf0000               mov di, 0                          ; string "DOL-POKOJ"
032e  0e                   push cs                           
032f  57                   push di                           
0330  31c0                 xor ax, ax                        
0332  50                   push ax                           
0333  9a00000000           lcall 0, 0                         ; call System.WriteString
0338  9a00000000           lcall 0, 0                         ; call System.WriteLn
033d  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:35
0342  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0345  1e                   push ds                           
0346  57                   push di                           
0347  bf0000               mov di, 0                          ; string "WYJSCIE"
034a  0e                   push cs                           
034b  57                   push di                           
034c  9a00000000           lcall 0, 0                         ; call System.CompareString
0351  7503                 jne 0x356                         
0353  e9dd00               jmp 0x433                         
; SWIAT.PAS:36
0356  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0359  1e                   push ds                           
035a  57                   push di                           
035b  bf0000               mov di, 0                          ; string "WSCHOD"
035e  0e                   push cs                           
035f  57                   push di                           
0360  9a00000000           lcall 0, 0                         ; call System.CompareString
0365  7506                 jne 0x36d                         
0367  c70600000400         mov word ptr [0], 4                ; data PRZEDM.MIECHO
; SWIAT.PAS:37
036d  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0370  1e                   push ds                           
0371  57                   push di                           
0372  bf0000               mov di, 0                          ; string "ZACHOD"
0375  0e                   push cs                           
0376  57                   push di                           
0377  9a00000000           lcall 0, 0                         ; call System.CompareString
037c  7506                 jne 0x384                         
037e  c70600000600         mov word ptr [0], 6                ; data PRZEDM.MIECHO
; SWIAT.PAS:38
0384  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0387  1e                   push ds                           
0388  57                   push di                           
0389  bf0000               mov di, 0                          ; string "POLNOC"
038c  0e                   push cs                           
038d  57                   push di                           
038e  9a00000000           lcall 0, 0                         ; call System.CompareString
0393  7506                 jne 0x39b                         
0395  c70600000700         mov word ptr [0], 7                ; data PRZEDM.MIECHO
; SWIAT.PAS:39
039b  bf0000               mov di, 0                          ; data PRZEDM.wpisz
039e  1e                   push ds                           
039f  57                   push di                           
03a0  bf0000               mov di, 0                          ; string "POLODNIE"
03a3  0e                   push cs                           
03a4  57                   push di                           
03a5  9a00000000           lcall 0, 0                         ; call System.CompareString
03aa  7506                 jne 0x3b2                         
03ac  c70600000800         mov word ptr [0], 8                ; data PRZEDM.MIECHO
; SWIAT.PAS:40
03b2  bf0000               mov di, 0                          ; data PRZEDM.wpisz
03b5  1e                   push ds                           
03b6  57                   push di                           
03b7  bf0000               mov di, 0                          ; string "GORA"
03ba  0e                   push cs                           
03bb  57                   push di                           
03bc  9a00000000           lcall 0, 0                         ; call System.CompareString
03c1  7506                 jne 0x3c9                         
03c3  c70600000900         mov word ptr [0], 9                ; data PRZEDM.MIECHO
; SWIAT.PAS:41
03c9  bf0000               mov di, 0                          ; data PRZEDM.wpisz
03cc  1e                   push ds                           
03cd  57                   push di                           
03ce  bf0000               mov di, 0                          ; string "DOL"
03d1  0e                   push cs                           
03d2  57                   push di                           
03d3  9a00000000           lcall 0, 0                         ; call System.CompareString
03d8  7506                 jne 0x3e0                         
03da  c70600000a00         mov word ptr [0], 0xa              ; data PRZEDM.MIECHO
; SWIAT.PAS:42
03e0  bf0000               mov di, 0                          ; data PRZEDM.wpisz
03e3  1e                   push ds                           
03e4  57                   push di                           
03e5  bf0000               mov di, 0                          ; string "PATRZ PLAKAT"
03e8  0e                   push cs                           
03e9  57                   push di                           
03ea  9a00000000           lcall 0, 0                         ; call System.CompareString
03ef  7538                 jne 0x429                         
; SWIAT.PAS:43
03f1  bf0000               mov di, 0                          ; data System.OUTPUT
03f4  1e                   push ds                           
03f5  57                   push di                           
03f6  bf0000               mov di, 0                          ; string "NA PLAKACIE BYNAJMNIEJ PISZE"
03f9  0e                   push cs                           
03fa  57                   push di                           
03fb  31c0                 xor ax, ax                        
03fd  50                   push ax                           
03fe  9a00000000           lcall 0, 0                         ; call System.WriteString
0403  9a00000000           lcall 0, 0                         ; call System.WriteLn
0408  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:44
040d  bf0000               mov di, 0                          ; data System.OUTPUT
0410  1e                   push ds                           
0411  57                   push di                           
0412  bf0000               mov di, 0                          ; string "TO JEST POKOJ DO ORIETACJI W TERENIE ORAZ W KIERUNKACH"
0415  0e                   push cs                           
0416  57                   push di                           
0417  31c0                 xor ax, ax                        
0419  50                   push ax                           
041a  9a00000000           lcall 0, 0                         ; call System.WriteString
041f  9a00000000           lcall 0, 0                         ; call System.WriteLn
0424  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:46
0429  833e000005           cmp word ptr [0], 5                ; data PRZEDM.MIECHO
042e  7503                 jne 0x433                         
0430  e9c1fd               jmp 0x1f4                         
; SWIAT.PAS:47
0433  5d                   pop bp                            
0434  cb                   retf                              
```

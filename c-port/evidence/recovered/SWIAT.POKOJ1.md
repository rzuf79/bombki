# `SWIAT.POKOJ1`

Generated recovery aid; not reconstructed source code.

- Original source map: `SWIAT.PAS:61-98`
- TPU code block: `0x0010`
- Procedure bytes: `0x0397`–`0x071d`
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

- `"JESTES W OKROGLYM SALONIE WYPELNIONYM WITRAZAMI "`
- `"W POWIETRZU UNOSZA SIE ZAPACHY I SO TO ZAPACHY OK"`
- `"NO A POZA TYM NA SCIANIE JEST!!! PLAKAT!!!!"`
- `"NAPISZ PATRZ PLAKAT ABY GO ODCZYTAĆ "`
- `"%."`
- `"MODE"`
- `"EXIT"`
- `"DOSTEPNE WYJSCIA:"`
- `"POLODNIE-TAM GDZIE ZACZYNASZ GRE"`
- `"POLNOC-MIASTO"`
- `"WSCHOD-POKOJ TRENINGOWY 1"`
- `"ZACHOD-MUD SZKOLA"`
- `"DOL-PODDZIEMNY POKOJ TRENINGOWY(2)"`
- `"WYJSCIE"`
- `"POLODNIE"`
- `"WSCHOD"`
- `"DOL"`
- `"ZACHOD"`
- `"POLNOC"`
- `"PATRZ PLAKAT"`
- `"ę NA PLAKACIE PISZE:"`
- `"JEŻELI CHCESZ TRENOWAC UDAJ SIE DO POKOJU TRENINGOWEGO"`
- `"JEŻELI CHCESZ NAUCZYC SIE NOWYCH KOMEND IDZ DO MUD SZKOLY"`
- `"DOPIERO POTEM IDZ DO MIASTA "`
- `"A OTO TAJNE KOMENDY :"`
- `" MODE - WPROWADZENIE W STAN PODSWIADOMOSCI"`
- `" UNMODE - POWROT DO POPRZEDNIEGO STANU"`
- `"W CZASIE POBYTU W STANIE PODSWIADOMOSCI DZIALA WIELE KOMEND MIN:"`
- `" JA - WSZYSTKO O TOBIE , BIERZ , UZYJ , ZDEJMIJ , ODRZUC I INNE "`
- `" PONADTO WIELE KOMEND TRZEBA ODKRYC NP:ZMIEN KOLOR , ZMIEN TLO "`
- `" UWAGA Z OSTATNIEJ CHWILI : KOMENDA SPIJ W STANIE PODSWIADOMOSCI!"`

## Annotated listing

```asm
; SWIAT.PAS:61
0397  55                   push bp                           
0398  89e5                 mov bp, sp                        
039a  31c0                 xor ax, ax                        
039c  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; SWIAT.PAS:62
03a1  bf0000               mov di, 0                          ; data System.OUTPUT
03a4  1e                   push ds                           
03a5  57                   push di                           
03a6  bf0000               mov di, 0                          ; string "JESTES W OKROGLYM SALONIE WYPELNIONYM WITRAZAMI "
03a9  0e                   push cs                           
03aa  57                   push di                           
03ab  31c0                 xor ax, ax                        
03ad  50                   push ax                           
03ae  9a00000000           lcall 0, 0                         ; call System.WriteString
03b3  9a00000000           lcall 0, 0                         ; call System.WriteLn
03b8  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:63
03bd  bf0000               mov di, 0                          ; data System.OUTPUT
03c0  1e                   push ds                           
03c1  57                   push di                           
03c2  bf0000               mov di, 0                          ; string "W POWIETRZU UNOSZA SIE ZAPACHY I SO TO ZAPACHY OK"
03c5  0e                   push cs                           
03c6  57                   push di                           
03c7  31c0                 xor ax, ax                        
03c9  50                   push ax                           
03ca  9a00000000           lcall 0, 0                         ; call System.WriteString
03cf  9a00000000           lcall 0, 0                         ; call System.WriteLn
03d4  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:64
03d9  bf0000               mov di, 0                          ; data System.OUTPUT
03dc  1e                   push ds                           
03dd  57                   push di                           
03de  bf0000               mov di, 0                          ; string "NO A POZA TYM NA SCIANIE JEST!!! PLAKAT!!!!"
03e1  0e                   push cs                           
03e2  57                   push di                           
03e3  31c0                 xor ax, ax                        
03e5  50                   push ax                           
03e6  9a00000000           lcall 0, 0                         ; call System.WriteString
03eb  9a00000000           lcall 0, 0                         ; call System.WriteLn
03f0  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:65
03f5  bf0000               mov di, 0                          ; data System.OUTPUT
03f8  1e                   push ds                           
03f9  57                   push di                           
03fa  bf0000               mov di, 0                          ; string "NAPISZ PATRZ PLAKAT ABY GO ODCZYTAĆ "
03fd  0e                   push cs                           
03fe  57                   push di                           
03ff  31c0                 xor ax, ax                        
0401  50                   push ax                           
0402  9a00000000           lcall 0, 0                         ; call System.WriteString
0407  9a00000000           lcall 0, 0                         ; call System.WriteLn
040c  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:67
0411  bf0000               mov di, 0                          ; data System.OUTPUT
0414  1e                   push ds                           
0415  57                   push di                           
0416  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
0419  99                   cwd                               
041a  52                   push dx                           
041b  50                   push ax                           
041c  31c0                 xor ax, ax                        
041e  50                   push ax                           
041f  9a00000000           lcall 0, 0                         ; call System.WriteInteger
0424  bf0000               mov di, 0                          ; string "%."
0427  0e                   push cs                           
0428  57                   push di                           
0429  31c0                 xor ax, ax                        
042b  50                   push ax                           
042c  9a00000000           lcall 0, 0                         ; call System.WriteString
0431  a10000               mov ax, word ptr [0]               ; data PRZEDM.KUNSZT
0434  99                   cwd                               
0435  52                   push dx                           
0436  50                   push ax                           
0437  31c0                 xor ax, ax                        
0439  50                   push ax                           
043a  9a00000000           lcall 0, 0                         ; call System.WriteInteger
043f  b03e                 mov al, 0x3e                      
0441  50                   push ax                           
0442  31c0                 xor ax, ax                        
0444  50                   push ax                           
0445  9a00000000           lcall 0, 0                         ; call System.WriteChar
044a  9a00000000           lcall 0, 0                         ; call System.WriteEnd
044f  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:68
0454  bf0000               mov di, 0                          ; data System.INPUT
0457  1e                   push ds                           
0458  57                   push di                           
0459  bf0000               mov di, 0                          ; data PRZEDM.wpisz
045c  1e                   push ds                           
045d  57                   push di                           
045e  b8ff00               mov ax, 0xff                      
0461  50                   push ax                           
0462  9a00000000           lcall 0, 0                         ; call System.ReadString
0467  9a00000000           lcall 0, 0                         ; call System.ReadLn
046c  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:69
0471  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0474  1e                   push ds                           
0475  57                   push di                           
0476  bf0000               mov di, 0                          ; string "MODE"
0479  0e                   push cs                           
047a  57                   push di                           
047b  9a00000000           lcall 0, 0                         ; call System.CompareString
0480  7505                 jne 0x487                         
0482  9a00000000           lcall 0, 0                         ; call PRZEDM.MODE
; SWIAT.PAS:70
0487  bf0000               mov di, 0                          ; data PRZEDM.wpisz
048a  1e                   push ds                           
048b  57                   push di                           
048c  bf0000               mov di, 0                          ; string "EXIT"
048f  0e                   push cs                           
0490  57                   push di                           
0491  9a00000000           lcall 0, 0                         ; call System.CompareString
0496  7403                 je 0x49b                          
0498  e9a800               jmp 0x543                         
; SWIAT.PAS:71
049b  bf0000               mov di, 0                          ; data System.OUTPUT
049e  1e                   push ds                           
049f  57                   push di                           
04a0  bf0000               mov di, 0                          ; string "DOSTEPNE WYJSCIA:"
04a3  0e                   push cs                           
04a4  57                   push di                           
04a5  31c0                 xor ax, ax                        
04a7  50                   push ax                           
04a8  9a00000000           lcall 0, 0                         ; call System.WriteString
04ad  9a00000000           lcall 0, 0                         ; call System.WriteLn
04b2  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:72
04b7  bf0000               mov di, 0                          ; data System.OUTPUT
04ba  1e                   push ds                           
04bb  57                   push di                           
04bc  bf0000               mov di, 0                          ; string "POLODNIE-TAM GDZIE ZACZYNASZ GRE"
04bf  0e                   push cs                           
04c0  57                   push di                           
04c1  31c0                 xor ax, ax                        
04c3  50                   push ax                           
04c4  9a00000000           lcall 0, 0                         ; call System.WriteString
04c9  9a00000000           lcall 0, 0                         ; call System.WriteLn
04ce  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:73
04d3  bf0000               mov di, 0                          ; data System.OUTPUT
04d6  1e                   push ds                           
04d7  57                   push di                           
04d8  bf0000               mov di, 0                          ; string "POLNOC-MIASTO"
04db  0e                   push cs                           
04dc  57                   push di                           
04dd  31c0                 xor ax, ax                        
04df  50                   push ax                           
04e0  9a00000000           lcall 0, 0                         ; call System.WriteString
04e5  9a00000000           lcall 0, 0                         ; call System.WriteLn
04ea  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:74
04ef  bf0000               mov di, 0                          ; data System.OUTPUT
04f2  1e                   push ds                           
04f3  57                   push di                           
04f4  bf0000               mov di, 0                          ; string "WSCHOD-POKOJ TRENINGOWY 1"
04f7  0e                   push cs                           
04f8  57                   push di                           
04f9  31c0                 xor ax, ax                        
04fb  50                   push ax                           
04fc  9a00000000           lcall 0, 0                         ; call System.WriteString
0501  9a00000000           lcall 0, 0                         ; call System.WriteLn
0506  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:75
050b  bf0000               mov di, 0                          ; data System.OUTPUT
050e  1e                   push ds                           
050f  57                   push di                           
0510  bf0000               mov di, 0                          ; string "ZACHOD-MUD SZKOLA"
0513  0e                   push cs                           
0514  57                   push di                           
0515  31c0                 xor ax, ax                        
0517  50                   push ax                           
0518  9a00000000           lcall 0, 0                         ; call System.WriteString
051d  9a00000000           lcall 0, 0                         ; call System.WriteLn
0522  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:76
0527  bf0000               mov di, 0                          ; data System.OUTPUT
052a  1e                   push ds                           
052b  57                   push di                           
052c  bf0000               mov di, 0                          ; string "DOL-PODDZIEMNY POKOJ TRENINGOWY(2)"
052f  0e                   push cs                           
0530  57                   push di                           
0531  31c0                 xor ax, ax                        
0533  50                   push ax                           
0534  9a00000000           lcall 0, 0                         ; call System.WriteString
0539  9a00000000           lcall 0, 0                         ; call System.WriteLn
053e  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:78
0543  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0546  1e                   push ds                           
0547  57                   push di                           
0548  bf0000               mov di, 0                          ; string "WYJSCIE"
054b  0e                   push cs                           
054c  57                   push di                           
054d  9a00000000           lcall 0, 0                         ; call System.CompareString
0552  7503                 jne 0x557                         
0554  e9c401               jmp 0x71b                         
; SWIAT.PAS:79
0557  bf0000               mov di, 0                          ; data PRZEDM.wpisz
055a  1e                   push ds                           
055b  57                   push di                           
055c  bf0000               mov di, 0                          ; string "POLODNIE"
055f  0e                   push cs                           
0560  57                   push di                           
0561  9a00000000           lcall 0, 0                         ; call System.CompareString
0566  7505                 jne 0x56d                         
0568  31c0                 xor ax, ax                        
056a  a30000               mov word ptr [0], ax               ; data PRZEDM.MIECHO
; SWIAT.PAS:80
056d  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0570  1e                   push ds                           
0571  57                   push di                           
0572  bf0000               mov di, 0                          ; string "WSCHOD"
0575  0e                   push cs                           
0576  57                   push di                           
0577  9a00000000           lcall 0, 0                         ; call System.CompareString
057c  7506                 jne 0x584                         
057e  c70600000200         mov word ptr [0], 2                ; data PRZEDM.MIECHO
; SWIAT.PAS:81
0584  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0587  1e                   push ds                           
0588  57                   push di                           
0589  bf0000               mov di, 0                          ; string "DOL"
058c  0e                   push cs                           
058d  57                   push di                           
058e  9a00000000           lcall 0, 0                         ; call System.CompareString
0593  7506                 jne 0x59b                         
0595  c70600000300         mov word ptr [0], 3                ; data PRZEDM.MIECHO
; SWIAT.PAS:82
059b  bf0000               mov di, 0                          ; data PRZEDM.wpisz
059e  1e                   push ds                           
059f  57                   push di                           
05a0  bf0000               mov di, 0                          ; string "ZACHOD"
05a3  0e                   push cs                           
05a4  57                   push di                           
05a5  9a00000000           lcall 0, 0                         ; call System.CompareString
05aa  7506                 jne 0x5b2                         
05ac  c70600000400         mov word ptr [0], 4                ; data PRZEDM.MIECHO
; SWIAT.PAS:83
05b2  bf0000               mov di, 0                          ; data PRZEDM.wpisz
05b5  1e                   push ds                           
05b6  57                   push di                           
05b7  bf0000               mov di, 0                          ; string "POLNOC"
05ba  0e                   push cs                           
05bb  57                   push di                           
05bc  9a00000000           lcall 0, 0                         ; call System.CompareString
05c1  7506                 jne 0x5c9                         
05c3  c70600001400         mov word ptr [0], 0x14             ; data PRZEDM.MIECHO
; SWIAT.PAS:84
05c9  bf0000               mov di, 0                          ; data PRZEDM.wpisz
05cc  1e                   push ds                           
05cd  57                   push di                           
05ce  bf0000               mov di, 0                          ; string "PATRZ PLAKAT"
05d1  0e                   push cs                           
05d2  57                   push di                           
05d3  9a00000000           lcall 0, 0                         ; call System.CompareString
05d8  7403                 je 0x5dd                          
05da  e93401               jmp 0x711                         
; SWIAT.PAS:85
05dd  bf0000               mov di, 0                          ; data System.OUTPUT
05e0  1e                   push ds                           
05e1  57                   push di                           
05e2  bf0000               mov di, 0                          ; string "ę NA PLAKACIE PISZE:"
05e5  0e                   push cs                           
05e6  57                   push di                           
05e7  31c0                 xor ax, ax                        
05e9  50                   push ax                           
05ea  9a00000000           lcall 0, 0                         ; call System.WriteString
05ef  9a00000000           lcall 0, 0                         ; call System.WriteLn
05f4  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:86
05f9  bf0000               mov di, 0                          ; data System.OUTPUT
05fc  1e                   push ds                           
05fd  57                   push di                           
05fe  bf0000               mov di, 0                          ; string "JEŻELI CHCESZ TRENOWAC UDAJ SIE DO POKOJU TRENINGOWEGO"
0601  0e                   push cs                           
0602  57                   push di                           
0603  31c0                 xor ax, ax                        
0605  50                   push ax                           
0606  9a00000000           lcall 0, 0                         ; call System.WriteString
060b  9a00000000           lcall 0, 0                         ; call System.WriteLn
0610  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:87
0615  bf0000               mov di, 0                          ; data System.OUTPUT
0618  1e                   push ds                           
0619  57                   push di                           
061a  bf0000               mov di, 0                          ; string "JEŻELI CHCESZ NAUCZYC SIE NOWYCH KOMEND IDZ DO MUD SZKOLY"
061d  0e                   push cs                           
061e  57                   push di                           
061f  31c0                 xor ax, ax                        
0621  50                   push ax                           
0622  9a00000000           lcall 0, 0                         ; call System.WriteString
0627  9a00000000           lcall 0, 0                         ; call System.WriteLn
062c  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:88
0631  bf0000               mov di, 0                          ; data System.OUTPUT
0634  1e                   push ds                           
0635  57                   push di                           
0636  bf0000               mov di, 0                          ; string "DOPIERO POTEM IDZ DO MIASTA "
0639  0e                   push cs                           
063a  57                   push di                           
063b  31c0                 xor ax, ax                        
063d  50                   push ax                           
063e  9a00000000           lcall 0, 0                         ; call System.WriteString
0643  9a00000000           lcall 0, 0                         ; call System.WriteLn
0648  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:89
064d  bf0000               mov di, 0                          ; data System.OUTPUT
0650  1e                   push ds                           
0651  57                   push di                           
0652  bf0000               mov di, 0                          ; string "A OTO TAJNE KOMENDY :"
0655  0e                   push cs                           
0656  57                   push di                           
0657  31c0                 xor ax, ax                        
0659  50                   push ax                           
065a  9a00000000           lcall 0, 0                         ; call System.WriteString
065f  9a00000000           lcall 0, 0                         ; call System.WriteLn
0664  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:90
0669  bf0000               mov di, 0                          ; data System.OUTPUT
066c  1e                   push ds                           
066d  57                   push di                           
066e  bf0000               mov di, 0                          ; string " MODE - WPROWADZENIE W STAN PODSWIADOMOSCI"
0671  0e                   push cs                           
0672  57                   push di                           
0673  31c0                 xor ax, ax                        
0675  50                   push ax                           
0676  9a00000000           lcall 0, 0                         ; call System.WriteString
067b  9a00000000           lcall 0, 0                         ; call System.WriteLn
0680  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:91
0685  bf0000               mov di, 0                          ; data System.OUTPUT
0688  1e                   push ds                           
0689  57                   push di                           
068a  bf0000               mov di, 0                          ; string " UNMODE - POWROT DO POPRZEDNIEGO STANU"
068d  0e                   push cs                           
068e  57                   push di                           
068f  31c0                 xor ax, ax                        
0691  50                   push ax                           
0692  9a00000000           lcall 0, 0                         ; call System.WriteString
0697  9a00000000           lcall 0, 0                         ; call System.WriteLn
069c  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:92
06a1  bf0000               mov di, 0                          ; data System.OUTPUT
06a4  1e                   push ds                           
06a5  57                   push di                           
06a6  bf0000               mov di, 0                          ; string "W CZASIE POBYTU W STANIE PODSWIADOMOSCI DZIALA WIELE KOMEND MIN:"
06a9  0e                   push cs                           
06aa  57                   push di                           
06ab  31c0                 xor ax, ax                        
06ad  50                   push ax                           
06ae  9a00000000           lcall 0, 0                         ; call System.WriteString
06b3  9a00000000           lcall 0, 0                         ; call System.WriteLn
06b8  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:93
06bd  bf0000               mov di, 0                          ; data System.OUTPUT
06c0  1e                   push ds                           
06c1  57                   push di                           
06c2  bf0000               mov di, 0                          ; string " JA - WSZYSTKO O TOBIE , BIERZ , UZYJ , ZDEJMIJ , ODRZUC I INNE "
06c5  0e                   push cs                           
06c6  57                   push di                           
06c7  31c0                 xor ax, ax                        
06c9  50                   push ax                           
06ca  9a00000000           lcall 0, 0                         ; call System.WriteString
06cf  9a00000000           lcall 0, 0                         ; call System.WriteLn
06d4  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:94
06d9  bf0000               mov di, 0                          ; data System.OUTPUT
06dc  1e                   push ds                           
06dd  57                   push di                           
06de  bf0000               mov di, 0                          ; string " PONADTO WIELE KOMEND TRZEBA ODKRYC NP:ZMIEN KOLOR , ZMIEN TLO "
06e1  0e                   push cs                           
06e2  57                   push di                           
06e3  31c0                 xor ax, ax                        
06e5  50                   push ax                           
06e6  9a00000000           lcall 0, 0                         ; call System.WriteString
06eb  9a00000000           lcall 0, 0                         ; call System.WriteLn
06f0  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:95
06f5  bf0000               mov di, 0                          ; data System.OUTPUT
06f8  1e                   push ds                           
06f9  57                   push di                           
06fa  bf0000               mov di, 0                          ; string " UWAGA Z OSTATNIEJ CHWILI : KOMENDA SPIJ W STANIE PODSWIADOMOSCI!"
06fd  0e                   push cs                           
06fe  57                   push di                           
06ff  31c0                 xor ax, ax                        
0701  50                   push ax                           
0702  9a00000000           lcall 0, 0                         ; call System.WriteString
0707  9a00000000           lcall 0, 0                         ; call System.WriteLn
070c  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:97
0711  833e000001           cmp word ptr [0], 1                ; data PRZEDM.MIECHO
0716  7503                 jne 0x71b                         
0718  e9f6fc               jmp 0x411                         
; SWIAT.PAS:98
071b  5d                   pop bp                            
071c  cb                   retf                              
```

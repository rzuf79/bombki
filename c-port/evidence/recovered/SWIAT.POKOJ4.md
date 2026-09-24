# `SWIAT.POKOJ4`

Generated recovery aid; not reconstructed source code.

- Original source map: `SWIAT.PAS:100-125`
- TPU code block: `0x0018`
- Procedure bytes: `0x01e2`–`0x03f7`
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

- `"JESTES W HALLU MUD SZKOLY- OGARNIA CIE CYKORIA  "`
- `"NO A POZA TYM NA SCIANIE JEST!!! AFISZ!!!"`
- `"%."`
- `"MODE"`
- `"EXIT"`
- `"DOSTEPNE WYJSCIA:"`
- `"WSCHOD-POKOJ CENTRALNY"`
- `"ZACHOD-MUD SZKOLA (2)"`
- `"WYJSCIE"`
- `"WSCHOD"`
- `"ZACHOD"`
- `"PATRZ AFISZ"`
- `"ę NA AFISZU BYNAJMNIEJ PISZE"`
- `"TO JEST MUD SZKOLA KUJ KOMEDY ALBO ZGINIESZ!!!!!!!!"`
- `"JESLI CHODZI O EKWIPUNEK TO BIERZ (PRZEDMIOT)=BIERZESZ PRZEDMIOT"`
- `"UZYJ (PRZEDMIOT) = UZYWASZ PRZEDMIOTU ODRZUC (PRZEDMIOT) = ODRZUCASZ"`
- `"BRONIE I TARCZE I UBRONIA MOZNA ZDJAC KOMENDA ODLORZ (PRZEDMIOT) "`

## Annotated listing

```asm
; SWIAT.PAS:100
01e2  55                   push bp                           
01e3  89e5                 mov bp, sp                        
01e5  31c0                 xor ax, ax                        
01e7  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; SWIAT.PAS:101
01ec  833e000004           cmp word ptr [0], 4                ; data PRZEDM.MIECHO
01f1  7403                 je 0x1f6                          
01f3  e9ff01               jmp 0x3f5                         
; SWIAT.PAS:102
01f6  bf0000               mov di, 0                          ; data System.OUTPUT
01f9  1e                   push ds                           
01fa  57                   push di                           
01fb  bf0000               mov di, 0                          ; string "JESTES W HALLU MUD SZKOLY- OGARNIA CIE CYKORIA  "
01fe  0e                   push cs                           
01ff  57                   push di                           
0200  31c0                 xor ax, ax                        
0202  50                   push ax                           
0203  9a00000000           lcall 0, 0                         ; call System.WriteString
0208  9a00000000           lcall 0, 0                         ; call System.WriteLn
020d  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:103
0212  bf0000               mov di, 0                          ; data System.OUTPUT
0215  1e                   push ds                           
0216  57                   push di                           
0217  bf0000               mov di, 0                          ; string "NO A POZA TYM NA SCIANIE JEST!!! AFISZ!!!"
021a  0e                   push cs                           
021b  57                   push di                           
021c  31c0                 xor ax, ax                        
021e  50                   push ax                           
021f  9a00000000           lcall 0, 0                         ; call System.WriteString
0224  9a00000000           lcall 0, 0                         ; call System.WriteLn
0229  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:105
022e  bf0000               mov di, 0                          ; data System.OUTPUT
0231  1e                   push ds                           
0232  57                   push di                           
0233  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
0236  99                   cwd                               
0237  52                   push dx                           
0238  50                   push ax                           
0239  31c0                 xor ax, ax                        
023b  50                   push ax                           
023c  9a00000000           lcall 0, 0                         ; call System.WriteInteger
0241  bf0000               mov di, 0                          ; string "%."
0244  0e                   push cs                           
0245  57                   push di                           
0246  31c0                 xor ax, ax                        
0248  50                   push ax                           
0249  9a00000000           lcall 0, 0                         ; call System.WriteString
024e  a10000               mov ax, word ptr [0]               ; data PRZEDM.KUNSZT
0251  99                   cwd                               
0252  52                   push dx                           
0253  50                   push ax                           
0254  31c0                 xor ax, ax                        
0256  50                   push ax                           
0257  9a00000000           lcall 0, 0                         ; call System.WriteInteger
025c  b03e                 mov al, 0x3e                      
025e  50                   push ax                           
025f  31c0                 xor ax, ax                        
0261  50                   push ax                           
0262  9a00000000           lcall 0, 0                         ; call System.WriteChar
0267  9a00000000           lcall 0, 0                         ; call System.WriteEnd
026c  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:106
0271  bf0000               mov di, 0                          ; data System.INPUT
0274  1e                   push ds                           
0275  57                   push di                           
0276  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0279  1e                   push ds                           
027a  57                   push di                           
027b  b8ff00               mov ax, 0xff                      
027e  50                   push ax                           
027f  9a00000000           lcall 0, 0                         ; call System.ReadString
0284  9a00000000           lcall 0, 0                         ; call System.ReadLn
0289  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:107
028e  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0291  1e                   push ds                           
0292  57                   push di                           
0293  bf0000               mov di, 0                          ; string "MODE"
0296  0e                   push cs                           
0297  57                   push di                           
0298  9a00000000           lcall 0, 0                         ; call System.CompareString
029d  7505                 jne 0x2a4                         
029f  9a00000000           lcall 0, 0                         ; call PRZEDM.MODE
; SWIAT.PAS:108
02a4  bf0000               mov di, 0                          ; data PRZEDM.wpisz
02a7  1e                   push ds                           
02a8  57                   push di                           
02a9  bf0000               mov di, 0                          ; string "EXIT"
02ac  0e                   push cs                           
02ad  57                   push di                           
02ae  9a00000000           lcall 0, 0                         ; call System.CompareString
02b3  7554                 jne 0x309                         
; SWIAT.PAS:109
02b5  bf0000               mov di, 0                          ; data System.OUTPUT
02b8  1e                   push ds                           
02b9  57                   push di                           
02ba  bf0000               mov di, 0                          ; string "DOSTEPNE WYJSCIA:"
02bd  0e                   push cs                           
02be  57                   push di                           
02bf  31c0                 xor ax, ax                        
02c1  50                   push ax                           
02c2  9a00000000           lcall 0, 0                         ; call System.WriteString
02c7  9a00000000           lcall 0, 0                         ; call System.WriteLn
02cc  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:110
02d1  bf0000               mov di, 0                          ; data System.OUTPUT
02d4  1e                   push ds                           
02d5  57                   push di                           
02d6  bf0000               mov di, 0                          ; string "WSCHOD-POKOJ CENTRALNY"
02d9  0e                   push cs                           
02da  57                   push di                           
02db  31c0                 xor ax, ax                        
02dd  50                   push ax                           
02de  9a00000000           lcall 0, 0                         ; call System.WriteString
02e3  9a00000000           lcall 0, 0                         ; call System.WriteLn
02e8  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:111
02ed  bf0000               mov di, 0                          ; data System.OUTPUT
02f0  1e                   push ds                           
02f1  57                   push di                           
02f2  bf0000               mov di, 0                          ; string "ZACHOD-MUD SZKOLA (2)"
02f5  0e                   push cs                           
02f6  57                   push di                           
02f7  31c0                 xor ax, ax                        
02f9  50                   push ax                           
02fa  9a00000000           lcall 0, 0                         ; call System.WriteString
02ff  9a00000000           lcall 0, 0                         ; call System.WriteLn
0304  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:113
0309  bf0000               mov di, 0                          ; data PRZEDM.wpisz
030c  1e                   push ds                           
030d  57                   push di                           
030e  bf0000               mov di, 0                          ; string "WYJSCIE"
0311  0e                   push cs                           
0312  57                   push di                           
0313  9a00000000           lcall 0, 0                         ; call System.CompareString
0318  7503                 jne 0x31d                         
031a  e9d800               jmp 0x3f5                         
; SWIAT.PAS:114
031d  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0320  1e                   push ds                           
0321  57                   push di                           
0322  bf0000               mov di, 0                          ; string "WSCHOD"
0325  0e                   push cs                           
0326  57                   push di                           
0327  9a00000000           lcall 0, 0                         ; call System.CompareString
032c  7506                 jne 0x334                         
032e  c70600000100         mov word ptr [0], 1                ; data PRZEDM.MIECHO
; SWIAT.PAS:115
0334  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0337  1e                   push ds                           
0338  57                   push di                           
0339  bf0000               mov di, 0                          ; string "ZACHOD"
033c  0e                   push cs                           
033d  57                   push di                           
033e  9a00000000           lcall 0, 0                         ; call System.CompareString
0343  7506                 jne 0x34b                         
0345  c70600000500         mov word ptr [0], 5                ; data PRZEDM.MIECHO
; SWIAT.PAS:116
034b  bf0000               mov di, 0                          ; data PRZEDM.wpisz
034e  1e                   push ds                           
034f  57                   push di                           
0350  bf0000               mov di, 0                          ; string "PATRZ AFISZ"
0353  0e                   push cs                           
0354  57                   push di                           
0355  9a00000000           lcall 0, 0                         ; call System.CompareString
035a  7403                 je 0x35f                          
035c  e98c00               jmp 0x3eb                         
; SWIAT.PAS:117
035f  bf0000               mov di, 0                          ; data System.OUTPUT
0362  1e                   push ds                           
0363  57                   push di                           
0364  bf0000               mov di, 0                          ; string "ę NA AFISZU BYNAJMNIEJ PISZE"
0367  0e                   push cs                           
0368  57                   push di                           
0369  31c0                 xor ax, ax                        
036b  50                   push ax                           
036c  9a00000000           lcall 0, 0                         ; call System.WriteString
0371  9a00000000           lcall 0, 0                         ; call System.WriteLn
0376  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:118
037b  bf0000               mov di, 0                          ; data System.OUTPUT
037e  1e                   push ds                           
037f  57                   push di                           
0380  bf0000               mov di, 0                          ; string "TO JEST MUD SZKOLA KUJ KOMEDY ALBO ZGINIESZ!!!!!!!!"
0383  0e                   push cs                           
0384  57                   push di                           
0385  31c0                 xor ax, ax                        
0387  50                   push ax                           
0388  9a00000000           lcall 0, 0                         ; call System.WriteString
038d  9a00000000           lcall 0, 0                         ; call System.WriteLn
0392  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:119
0397  bf0000               mov di, 0                          ; data System.OUTPUT
039a  1e                   push ds                           
039b  57                   push di                           
039c  bf0000               mov di, 0                          ; string "JESLI CHODZI O EKWIPUNEK TO BIERZ (PRZEDMIOT)=BIERZESZ PRZEDMIOT"
039f  0e                   push cs                           
03a0  57                   push di                           
03a1  31c0                 xor ax, ax                        
03a3  50                   push ax                           
03a4  9a00000000           lcall 0, 0                         ; call System.WriteString
03a9  9a00000000           lcall 0, 0                         ; call System.WriteLn
03ae  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:120
03b3  bf0000               mov di, 0                          ; data System.OUTPUT
03b6  1e                   push ds                           
03b7  57                   push di                           
03b8  bf0000               mov di, 0                          ; string "UZYJ (PRZEDMIOT) = UZYWASZ PRZEDMIOTU ODRZUC (PRZEDMIOT) = ODRZUCASZ"
03bb  0e                   push cs                           
03bc  57                   push di                           
03bd  31c0                 xor ax, ax                        
03bf  50                   push ax                           
03c0  9a00000000           lcall 0, 0                         ; call System.WriteString
03c5  9a00000000           lcall 0, 0                         ; call System.WriteLn
03ca  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:121
03cf  bf0000               mov di, 0                          ; data System.OUTPUT
03d2  1e                   push ds                           
03d3  57                   push di                           
03d4  bf0000               mov di, 0                          ; string "BRONIE I TARCZE I UBRONIA MOZNA ZDJAC KOMENDA ODLORZ (PRZEDMIOT) "
03d7  0e                   push cs                           
03d8  57                   push di                           
03d9  31c0                 xor ax, ax                        
03db  50                   push ax                           
03dc  9a00000000           lcall 0, 0                         ; call System.WriteString
03e1  9a00000000           lcall 0, 0                         ; call System.WriteLn
03e6  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:123
03eb  833e000004           cmp word ptr [0], 4                ; data PRZEDM.MIECHO
03f0  7503                 jne 0x3f5                         
03f2  e939fe               jmp 0x22e                         
; SWIAT.PAS:125
03f5  5d                   pop bp                            
03f6  cb                   retf                              
```

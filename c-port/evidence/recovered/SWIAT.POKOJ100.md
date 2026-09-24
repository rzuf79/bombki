# `SWIAT.POKOJ100`

Generated recovery aid; not reconstructed source code.

- Original source map: `SWIAT.PAS:355-444`
- TPU code block: `0x0058`
- Procedure bytes: `0x03ab`–`0x095e`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `MONSTRA.MAXE`
- `PRZEDM.DYPLOM`
- `PRZEDM.ENERGIA`
- `PRZEDM.FAJKA`
- `PRZEDM.FIREBALL`
- `PRZEDM.FORSA`
- `PRZEDM.KUNSZT`
- `PRZEDM.MAD`
- `PRZEDM.MIECHO`
- `PRZEDM.POISON`
- `PRZEDM.PRA`
- `PRZEDM.PRZED`
- `PRZEDM.PRZEPUSTKA`
- `PRZEDM.QUEST`
- `PRZEDM.QUESTWYK`
- `PRZEDM.WROGEN`
- `PRZEDM.WROGSIL`
- `PRZEDM.WROGZRE`
- `PRZEDM.wpisz`
- `PRZEDM:0x0038+0x0002`
- `PRZEDM:0x0038+0x0006`
- `System.INPUT`
- `System.OUTPUT`

## Calls

- `PRZEDM.MODE`
- `PRZEDM.ULSKLEPIKOWA`
- `PRZEDM.WALKA`
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

- `"ZNALAZLES SIE NA ROZJEZDZIE DROG , DROGI PILNUJE QUEST-MASTER "`
- `"QUEST-MASTER NIE POSCI CIE DALEJ DOPOKI NIE KUPISZ I ROZWIAZESZ QUESTA"`
- `"%."`
- `"MODE"`
- `"EXIT"`
- `"DOSTEPNE WYJSCIA:"`
- `"POLODNIE-UL.SKLEPIKOWA"`
- `"WSCHOD-DROGA O KTOREJ MOZESZ POMAZYC ( BO JEST W PRODUKCJI !!! )"`
- `"ZACHOD-DROGA ( ZABLOKOWANA PRZEZ QUEST-MASTERA)"`
- `"ZACHOD-DROGA"`
- `"LISTA"`
- `"LATWY QUEST      - 200"`
- `"PRZECIETNY QUEST - 100"`
- `"TRUDNY QUEST     - 50"`
- `"KOMEDA - SPRZEDAJ QUEST - OZNACZA IZ QUEST ZOSTAL WYKONANY"`
- `"KUP LATWY QUEST"`
- `"ZABIJ 75 POTWOROW"`
- `"KUP PRZECIETNY QUEST"`
- `"ZABIJ 50 POTWOROW W TYM LIROYA I DAJ MI DYPLOM MUD SZKOLY"`
- `"KUP TRUDNY QUEST"`
- `"ZABIJ 50 POTWOROW W TYM LIROYA I DAJ MI FAJKE I POSWIEC 1 PRAKTYKE"`
- `"SPRZEDAJ QUEST"`
- `"AAAAA BARDZO MI MILO ZE UDALO CI SIE WYKONAC TEN QUEST"`
- `" ------ OTRZYMUJESZ 100 KUNSZTU -----"`
- `" ------ OTRZYMUJESZ 250 KUNSZTU -----"`
- `" ------ OTRZYMUJESZ 425 KUNSZTU -----"`
- `"WYJSCIE"`
- `"POLODNIE"`
- `"ZACHOD"`
- `"QUEST-MASTER MOWI CI : BARDZO MI PRZYKRO ALE MUSISZ MIEC PRZEPUSTKE"`
- `"ZABIJ QUEST-MASTER"`

## Annotated listing

```asm
; SWIAT.PAS:355
03ab  55                   push bp                           
03ac  89e5                 mov bp, sp                        
03ae  31c0                 xor ax, ax                        
03b0  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; SWIAT.PAS:356
03b5  833e000064           cmp word ptr [0], 0x64             ; data PRZEDM.MIECHO
03ba  7403                 je 0x3bf                          
03bc  e99d05               jmp 0x95c                         
; SWIAT.PAS:357
03bf  bf0000               mov di, 0                          ; data System.OUTPUT
03c2  1e                   push ds                           
03c3  57                   push di                           
03c4  bf0000               mov di, 0                          ; string "ZNALAZLES SIE NA ROZJEZDZIE DROG , DROGI PILNUJE QUEST-MASTER "
03c7  0e                   push cs                           
03c8  57                   push di                           
03c9  31c0                 xor ax, ax                        
03cb  50                   push ax                           
03cc  9a00000000           lcall 0, 0                         ; call System.WriteString
03d1  9a00000000           lcall 0, 0                         ; call System.WriteLn
03d6  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:358
03db  bf0000               mov di, 0                          ; data System.OUTPUT
03de  1e                   push ds                           
03df  57                   push di                           
03e0  bf0000               mov di, 0                          ; string "QUEST-MASTER NIE POSCI CIE DALEJ DOPOKI NIE KUPISZ I ROZWIAZESZ QUESTA"
03e3  0e                   push cs                           
03e4  57                   push di                           
03e5  31c0                 xor ax, ax                        
03e7  50                   push ax                           
03e8  9a00000000           lcall 0, 0                         ; call System.WriteString
03ed  9a00000000           lcall 0, 0                         ; call System.WriteLn
03f2  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:359
03f7  9a00000000           lcall 0, 0                         ; call PRZEDM.ULSKLEPIKOWA
; SWIAT.PAS:361
03fc  bf0000               mov di, 0                          ; data System.OUTPUT
03ff  1e                   push ds                           
0400  57                   push di                           
0401  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
0404  99                   cwd                               
0405  52                   push dx                           
0406  50                   push ax                           
0407  31c0                 xor ax, ax                        
0409  50                   push ax                           
040a  9a00000000           lcall 0, 0                         ; call System.WriteInteger
040f  bf0000               mov di, 0                          ; string "%."
0412  0e                   push cs                           
0413  57                   push di                           
0414  31c0                 xor ax, ax                        
0416  50                   push ax                           
0417  9a00000000           lcall 0, 0                         ; call System.WriteString
041c  a10000               mov ax, word ptr [0]               ; data PRZEDM.KUNSZT
041f  99                   cwd                               
0420  52                   push dx                           
0421  50                   push ax                           
0422  31c0                 xor ax, ax                        
0424  50                   push ax                           
0425  9a00000000           lcall 0, 0                         ; call System.WriteInteger
042a  b03e                 mov al, 0x3e                      
042c  50                   push ax                           
042d  31c0                 xor ax, ax                        
042f  50                   push ax                           
0430  9a00000000           lcall 0, 0                         ; call System.WriteChar
0435  9a00000000           lcall 0, 0                         ; call System.WriteEnd
043a  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:362
043f  bf0000               mov di, 0                          ; data System.INPUT
0442  1e                   push ds                           
0443  57                   push di                           
0444  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0447  1e                   push ds                           
0448  57                   push di                           
0449  b8ff00               mov ax, 0xff                      
044c  50                   push ax                           
044d  9a00000000           lcall 0, 0                         ; call System.ReadString
0452  9a00000000           lcall 0, 0                         ; call System.ReadLn
0457  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:363
045c  bf0000               mov di, 0                          ; data PRZEDM.wpisz
045f  1e                   push ds                           
0460  57                   push di                           
0461  bf0000               mov di, 0                          ; string "MODE"
0464  0e                   push cs                           
0465  57                   push di                           
0466  9a00000000           lcall 0, 0                         ; call System.CompareString
046b  7505                 jne 0x472                         
046d  9a00000000           lcall 0, 0                         ; call PRZEDM.MODE
; SWIAT.PAS:364
0472  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0475  1e                   push ds                           
0476  57                   push di                           
0477  bf0000               mov di, 0                          ; string "EXIT"
047a  0e                   push cs                           
047b  57                   push di                           
047c  9a00000000           lcall 0, 0                         ; call System.CompareString
0481  7403                 je 0x486                          
0483  e9a500               jmp 0x52b                         
; SWIAT.PAS:365
0486  bf0000               mov di, 0                          ; data System.OUTPUT
0489  1e                   push ds                           
048a  57                   push di                           
048b  bf0000               mov di, 0                          ; string "DOSTEPNE WYJSCIA:"
048e  0e                   push cs                           
048f  57                   push di                           
0490  31c0                 xor ax, ax                        
0492  50                   push ax                           
0493  9a00000000           lcall 0, 0                         ; call System.WriteString
0498  9a00000000           lcall 0, 0                         ; call System.WriteLn
049d  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:366
04a2  bf0000               mov di, 0                          ; data System.OUTPUT
04a5  1e                   push ds                           
04a6  57                   push di                           
04a7  bf0000               mov di, 0                          ; string "POLODNIE-UL.SKLEPIKOWA"
04aa  0e                   push cs                           
04ab  57                   push di                           
04ac  31c0                 xor ax, ax                        
04ae  50                   push ax                           
04af  9a00000000           lcall 0, 0                         ; call System.WriteString
04b4  9a00000000           lcall 0, 0                         ; call System.WriteLn
04b9  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:367
04be  bf0000               mov di, 0                          ; data System.OUTPUT
04c1  1e                   push ds                           
04c2  57                   push di                           
04c3  bf0000               mov di, 0                          ; string "WSCHOD-DROGA O KTOREJ MOZESZ POMAZYC ( BO JEST W PRODUKCJI !!! )"
04c6  0e                   push cs                           
04c7  57                   push di                           
04c8  31c0                 xor ax, ax                        
04ca  50                   push ax                           
04cb  9a00000000           lcall 0, 0                         ; call System.WriteString
04d0  9a00000000           lcall 0, 0                         ; call System.WriteLn
04d5  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:368
04da  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZEPUSTKA
04dd  0b060000             or ax, word ptr [0]                ; data PRZEDM:0x0038+0x0006
04e1  751c                 jne 0x4ff                         
04e3  bf0000               mov di, 0                          ; data System.OUTPUT
04e6  1e                   push ds                           
04e7  57                   push di                           
04e8  bf0000               mov di, 0                          ; string "ZACHOD-DROGA ( ZABLOKOWANA PRZEZ QUEST-MASTERA)"
04eb  0e                   push cs                           
04ec  57                   push di                           
04ed  31c0                 xor ax, ax                        
04ef  50                   push ax                           
04f0  9a00000000           lcall 0, 0                         ; call System.WriteString
04f5  9a00000000           lcall 0, 0                         ; call System.WriteLn
04fa  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:369
04ff  833e000000           cmp word ptr [0], 0                ; data PRZEDM:0x0038+0x0006
0504  7c09                 jl 0x50f                          
0506  7f23                 jg 0x52b                          
0508  833e000000           cmp word ptr [0], 0                ; data PRZEDM.PRZEPUSTKA
050d  731c                 jae 0x52b                         
050f  bf0000               mov di, 0                          ; data System.OUTPUT
0512  1e                   push ds                           
0513  57                   push di                           
0514  bf0000               mov di, 0                          ; string "ZACHOD-DROGA"
0517  0e                   push cs                           
0518  57                   push di                           
0519  31c0                 xor ax, ax                        
051b  50                   push ax                           
051c  9a00000000           lcall 0, 0                         ; call System.WriteString
0521  9a00000000           lcall 0, 0                         ; call System.WriteLn
0526  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:371
052b  bf0000               mov di, 0                          ; data PRZEDM.wpisz
052e  1e                   push ds                           
052f  57                   push di                           
0530  bf0000               mov di, 0                          ; string "LISTA"
0533  0e                   push cs                           
0534  57                   push di                           
0535  9a00000000           lcall 0, 0                         ; call System.CompareString
053a  7570                 jne 0x5ac                         
; SWIAT.PAS:372
053c  bf0000               mov di, 0                          ; data System.OUTPUT
053f  1e                   push ds                           
0540  57                   push di                           
0541  bf0000               mov di, 0                          ; string "LATWY QUEST      - 200"
0544  0e                   push cs                           
0545  57                   push di                           
0546  31c0                 xor ax, ax                        
0548  50                   push ax                           
0549  9a00000000           lcall 0, 0                         ; call System.WriteString
054e  9a00000000           lcall 0, 0                         ; call System.WriteLn
0553  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:373
0558  bf0000               mov di, 0                          ; data System.OUTPUT
055b  1e                   push ds                           
055c  57                   push di                           
055d  bf0000               mov di, 0                          ; string "PRZECIETNY QUEST - 100"
0560  0e                   push cs                           
0561  57                   push di                           
0562  31c0                 xor ax, ax                        
0564  50                   push ax                           
0565  9a00000000           lcall 0, 0                         ; call System.WriteString
056a  9a00000000           lcall 0, 0                         ; call System.WriteLn
056f  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:374
0574  bf0000               mov di, 0                          ; data System.OUTPUT
0577  1e                   push ds                           
0578  57                   push di                           
0579  bf0000               mov di, 0                          ; string "TRUDNY QUEST     - 50"
057c  0e                   push cs                           
057d  57                   push di                           
057e  31c0                 xor ax, ax                        
0580  50                   push ax                           
0581  9a00000000           lcall 0, 0                         ; call System.WriteString
0586  9a00000000           lcall 0, 0                         ; call System.WriteLn
058b  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:375
0590  bf0000               mov di, 0                          ; data System.OUTPUT
0593  1e                   push ds                           
0594  57                   push di                           
0595  bf0000               mov di, 0                          ; string "KOMEDA - SPRZEDAJ QUEST - OZNACZA IZ QUEST ZOSTAL WYKONANY"
0598  0e                   push cs                           
0599  57                   push di                           
059a  31c0                 xor ax, ax                        
059c  50                   push ax                           
059d  9a00000000           lcall 0, 0                         ; call System.WriteString
05a2  9a00000000           lcall 0, 0                         ; call System.WriteLn
05a7  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:377
05ac  bf0000               mov di, 0                          ; data PRZEDM.wpisz
05af  1e                   push ds                           
05b0  57                   push di                           
05b1  bf0000               mov di, 0                          ; string "KUP LATWY QUEST"
05b4  0e                   push cs                           
05b5  57                   push di                           
05b6  9a00000000           lcall 0, 0                         ; call System.CompareString
05bb  754d                 jne 0x60a                         
05bd  833e000000           cmp word ptr [0], 0                ; data PRZEDM:0x0038+0x0002
05c2  7f0a                 jg 0x5ce                          
05c4  7c44                 jl 0x60a                          
05c6  813e0000c700         cmp word ptr [0], 0xc7             ; data PRZEDM.FORSA
05cc  763c                 jbe 0x60a                         
; SWIAT.PAS:378
05ce  bf0000               mov di, 0                          ; data System.OUTPUT
05d1  1e                   push ds                           
05d2  57                   push di                           
05d3  bf0000               mov di, 0                          ; string "ZABIJ 75 POTWOROW"
05d6  0e                   push cs                           
05d7  57                   push di                           
05d8  31c0                 xor ax, ax                        
05da  50                   push ax                           
05db  9a00000000           lcall 0, 0                         ; call System.WriteString
05e0  9a00000000           lcall 0, 0                         ; call System.WriteLn
05e5  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:379
05ea  c70600000100         mov word ptr [0], 1                ; data PRZEDM.QUEST
; SWIAT.PAS:380
05f0  c70600004b00         mov word ptr [0], 0x4b             ; data PRZEDM.QUESTWYK
; SWIAT.PAS:381
05f6  a10000               mov ax, word ptr [0]               ; data PRZEDM.FORSA
05f9  8b160000             mov dx, word ptr [0]               ; data PRZEDM:0x0038+0x0002
05fd  2dc800               sub ax, 0xc8                      
0600  83da00               sbb dx, 0                         
0603  a30000               mov word ptr [0], ax               ; data PRZEDM.FORSA
0606  89160000             mov word ptr [0], dx               ; data PRZEDM:0x0038+0x0002
; SWIAT.PAS:383
060a  bf0000               mov di, 0                          ; data PRZEDM.wpisz
060d  1e                   push ds                           
060e  57                   push di                           
060f  bf0000               mov di, 0                          ; string "KUP PRZECIETNY QUEST"
0612  0e                   push cs                           
0613  57                   push di                           
0614  9a00000000           lcall 0, 0                         ; call System.CompareString
0619  754c                 jne 0x667                         
061b  833e000000           cmp word ptr [0], 0                ; data PRZEDM:0x0038+0x0002
0620  7f09                 jg 0x62b                          
0622  7c43                 jl 0x667                          
0624  833e000063           cmp word ptr [0], 0x63             ; data PRZEDM.FORSA
0629  763c                 jbe 0x667                         
; SWIAT.PAS:384
062b  bf0000               mov di, 0                          ; data System.OUTPUT
062e  1e                   push ds                           
062f  57                   push di                           
0630  bf0000               mov di, 0                          ; string "ZABIJ 50 POTWOROW W TYM LIROYA I DAJ MI DYPLOM MUD SZKOLY"
0633  0e                   push cs                           
0634  57                   push di                           
0635  31c0                 xor ax, ax                        
0637  50                   push ax                           
0638  9a00000000           lcall 0, 0                         ; call System.WriteString
063d  9a00000000           lcall 0, 0                         ; call System.WriteLn
0642  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:385
0647  c70600000200         mov word ptr [0], 2                ; data PRZEDM.QUEST
; SWIAT.PAS:386
064d  c7060000c800         mov word ptr [0], 0xc8             ; data PRZEDM.QUESTWYK
; SWIAT.PAS:387
0653  a10000               mov ax, word ptr [0]               ; data PRZEDM.FORSA
0656  8b160000             mov dx, word ptr [0]               ; data PRZEDM:0x0038+0x0002
065a  2d6400               sub ax, 0x64                      
065d  83da00               sbb dx, 0                         
0660  a30000               mov word ptr [0], ax               ; data PRZEDM.FORSA
0663  89160000             mov word ptr [0], dx               ; data PRZEDM:0x0038+0x0002
; SWIAT.PAS:389
0667  bf0000               mov di, 0                          ; data PRZEDM.wpisz
066a  1e                   push ds                           
066b  57                   push di                           
066c  bf0000               mov di, 0                          ; string "KUP TRUDNY QUEST"
066f  0e                   push cs                           
0670  57                   push di                           
0671  9a00000000           lcall 0, 0                         ; call System.CompareString
0676  754c                 jne 0x6c4                         
0678  833e000000           cmp word ptr [0], 0                ; data PRZEDM:0x0038+0x0002
067d  7f09                 jg 0x688                          
067f  7c43                 jl 0x6c4                          
0681  833e000031           cmp word ptr [0], 0x31             ; data PRZEDM.FORSA
0686  763c                 jbe 0x6c4                         
; SWIAT.PAS:390
0688  bf0000               mov di, 0                          ; data System.OUTPUT
068b  1e                   push ds                           
068c  57                   push di                           
068d  bf0000               mov di, 0                          ; string "ZABIJ 50 POTWOROW W TYM LIROYA I DAJ MI FAJKE I POSWIEC 1 PRAKTYKE"
0690  0e                   push cs                           
0691  57                   push di                           
0692  31c0                 xor ax, ax                        
0694  50                   push ax                           
0695  9a00000000           lcall 0, 0                         ; call System.WriteString
069a  9a00000000           lcall 0, 0                         ; call System.WriteLn
069f  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:391
06a4  c70600000300         mov word ptr [0], 3                ; data PRZEDM.QUEST
; SWIAT.PAS:392
06aa  c7060000c800         mov word ptr [0], 0xc8             ; data PRZEDM.QUESTWYK
; SWIAT.PAS:393
06b0  a10000               mov ax, word ptr [0]               ; data PRZEDM.FORSA
06b3  8b160000             mov dx, word ptr [0]               ; data PRZEDM:0x0038+0x0002
06b7  2d3200               sub ax, 0x32                      
06ba  83da00               sbb dx, 0                         
06bd  a30000               mov word ptr [0], ax               ; data PRZEDM.FORSA
06c0  89160000             mov word ptr [0], dx               ; data PRZEDM:0x0038+0x0002
; SWIAT.PAS:395
06c4  bf0000               mov di, 0                          ; data PRZEDM.wpisz
06c7  1e                   push ds                           
06c8  57                   push di                           
06c9  bf0000               mov di, 0                          ; string "SPRZEDAJ QUEST"
06cc  0e                   push cs                           
06cd  57                   push di                           
06ce  9a00000000           lcall 0, 0                         ; call System.CompareString
06d3  7403                 je 0x6d8                          
06d5  e9a501               jmp 0x87d                         
06d8  833e000000           cmp word ptr [0], 0                ; data PRZEDM.QUEST
06dd  7f03                 jg 0x6e2                          
06df  e99b01               jmp 0x87d                         
; SWIAT.PAS:396
06e2  833e000001           cmp word ptr [0], 1                ; data PRZEDM.QUEST
06e7  756d                 jne 0x756                         
06e9  833e000001           cmp word ptr [0], 1                ; data PRZEDM.QUESTWYK
06ee  7d66                 jge 0x756                         
; SWIAT.PAS:397
06f0  bf0000               mov di, 0                          ; data System.OUTPUT
06f3  1e                   push ds                           
06f4  57                   push di                           
06f5  bf0000               mov di, 0                          ; string "AAAAA BARDZO MI MILO ZE UDALO CI SIE WYKONAC TEN QUEST"
06f8  0e                   push cs                           
06f9  57                   push di                           
06fa  31c0                 xor ax, ax                        
06fc  50                   push ax                           
06fd  9a00000000           lcall 0, 0                         ; call System.WriteString
0702  9a00000000           lcall 0, 0                         ; call System.WriteLn
0707  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:398
070c  bf0000               mov di, 0                          ; data System.OUTPUT
070f  1e                   push ds                           
0710  57                   push di                           
0711  bf0000               mov di, 0                          ; string " ------ OTRZYMUJESZ 100 KUNSZTU -----"
0714  0e                   push cs                           
0715  57                   push di                           
0716  31c0                 xor ax, ax                        
0718  50                   push ax                           
0719  9a00000000           lcall 0, 0                         ; call System.WriteString
071e  9a00000000           lcall 0, 0                         ; call System.WriteLn
0723  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:399
0728  a10000               mov ax, word ptr [0]               ; data PRZEDM.KUNSZT
072b  056400               add ax, 0x64                      
072e  a30000               mov word ptr [0], ax               ; data PRZEDM.KUNSZT
; SWIAT.PAS:400
0731  31c0                 xor ax, ax                        
0733  a30000               mov word ptr [0], ax               ; data PRZEDM.QUEST
; SWIAT.PAS:401
0736  31c0                 xor ax, ax                        
0738  a30000               mov word ptr [0], ax               ; data PRZEDM.QUESTWYK
; SWIAT.PAS:402
073b  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZEPUSTKA
073e  8b160000             mov dx, word ptr [0]               ; data PRZEDM:0x0038+0x0006
0742  2d0a00               sub ax, 0xa                       
0745  83da00               sbb dx, 0                         
0748  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZEPUSTKA
074b  89160000             mov word ptr [0], dx               ; data PRZEDM:0x0038+0x0006
; SWIAT.PAS:403
074f  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
0752  40                   inc ax                            
0753  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; SWIAT.PAS:405
0756  833e000002           cmp word ptr [0], 2                ; data PRZEDM.QUEST
075b  757b                 jne 0x7d8                         
075d  833e000001           cmp word ptr [0], 1                ; data PRZEDM.QUESTWYK
0762  7d74                 jge 0x7d8                         
0764  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.DYPLOM
0769  7f6d                 jg 0x7d8                          
; SWIAT.PAS:406
076b  bf0000               mov di, 0                          ; data System.OUTPUT
076e  1e                   push ds                           
076f  57                   push di                           
0770  bf0000               mov di, 0                          ; string "AAAAA BARDZO MI MILO ZE UDALO CI SIE WYKONAC TEN QUEST"
0773  0e                   push cs                           
0774  57                   push di                           
0775  31c0                 xor ax, ax                        
0777  50                   push ax                           
0778  9a00000000           lcall 0, 0                         ; call System.WriteString
077d  9a00000000           lcall 0, 0                         ; call System.WriteLn
0782  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:407
0787  bf0000               mov di, 0                          ; data System.OUTPUT
078a  1e                   push ds                           
078b  57                   push di                           
078c  bf0000               mov di, 0                          ; string " ------ OTRZYMUJESZ 250 KUNSZTU -----"
078f  0e                   push cs                           
0790  57                   push di                           
0791  31c0                 xor ax, ax                        
0793  50                   push ax                           
0794  9a00000000           lcall 0, 0                         ; call System.WriteString
0799  9a00000000           lcall 0, 0                         ; call System.WriteLn
079e  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:408
07a3  a10000               mov ax, word ptr [0]               ; data PRZEDM.KUNSZT
07a6  05fa00               add ax, 0xfa                      
07a9  a30000               mov word ptr [0], ax               ; data PRZEDM.KUNSZT
; SWIAT.PAS:409
07ac  31c0                 xor ax, ax                        
07ae  a30000               mov word ptr [0], ax               ; data PRZEDM.QUEST
; SWIAT.PAS:410
07b1  31c0                 xor ax, ax                        
07b3  a30000               mov word ptr [0], ax               ; data PRZEDM.QUESTWYK
; SWIAT.PAS:411
07b6  31c0                 xor ax, ax                        
07b8  a30000               mov word ptr [0], ax               ; data PRZEDM.DYPLOM
; SWIAT.PAS:412
07bb  a10000               mov ax, word ptr [0]               ; data MONSTRA.MAXE
07be  2d0500               sub ax, 5                         
07c1  a30000               mov word ptr [0], ax               ; data MONSTRA.MAXE
; SWIAT.PAS:413
07c4  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZEPUSTKA
07c7  8b160000             mov dx, word ptr [0]               ; data PRZEDM:0x0038+0x0006
07cb  2d0a00               sub ax, 0xa                       
07ce  83da00               sbb dx, 0                         
07d1  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZEPUSTKA
07d4  89160000             mov word ptr [0], dx               ; data PRZEDM:0x0038+0x0006
; SWIAT.PAS:415
07d8  833e000003           cmp word ptr [0], 3                ; data PRZEDM.QUEST
07dd  7403                 je 0x7e2                          
07df  e99b00               jmp 0x87d                         
07e2  833e000001           cmp word ptr [0], 1                ; data PRZEDM.QUESTWYK
07e7  7c03                 jl 0x7ec                          
07e9  e99100               jmp 0x87d                         
07ec  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.FAJKA
07f1  7e03                 jle 0x7f6                         
07f3  e98700               jmp 0x87d                         
07f6  833e000000           cmp word ptr [0], 0                ; data PRZEDM.PRA
07fb  7f03                 jg 0x800                          
07fd  e97d00               jmp 0x87d                         
; SWIAT.PAS:416
0800  bf0000               mov di, 0                          ; data System.OUTPUT
0803  1e                   push ds                           
0804  57                   push di                           
0805  bf0000               mov di, 0                          ; string "AAAAA BARDZO MI MILO ZE UDALO CI SIE WYKONAC TEN QUEST"
0808  0e                   push cs                           
0809  57                   push di                           
080a  31c0                 xor ax, ax                        
080c  50                   push ax                           
080d  9a00000000           lcall 0, 0                         ; call System.WriteString
0812  9a00000000           lcall 0, 0                         ; call System.WriteLn
0817  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:417
081c  bf0000               mov di, 0                          ; data System.OUTPUT
081f  1e                   push ds                           
0820  57                   push di                           
0821  bf0000               mov di, 0                          ; string " ------ OTRZYMUJESZ 425 KUNSZTU -----"
0824  0e                   push cs                           
0825  57                   push di                           
0826  31c0                 xor ax, ax                        
0828  50                   push ax                           
0829  9a00000000           lcall 0, 0                         ; call System.WriteString
082e  9a00000000           lcall 0, 0                         ; call System.WriteLn
0833  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:418
0838  a10000               mov ax, word ptr [0]               ; data PRZEDM.KUNSZT
083b  05a901               add ax, 0x1a9                     
083e  a30000               mov word ptr [0], ax               ; data PRZEDM.KUNSZT
; SWIAT.PAS:419
0841  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
0844  48                   dec ax                            
0845  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; SWIAT.PAS:420
0848  a10000               mov ax, word ptr [0]               ; data PRZEDM.MAD
084b  48                   dec ax                            
084c  a30000               mov word ptr [0], ax               ; data PRZEDM.MAD
; SWIAT.PAS:421
084f  31c0                 xor ax, ax                        
0851  a30000               mov word ptr [0], ax               ; data PRZEDM.QUEST
; SWIAT.PAS:422
0854  31c0                 xor ax, ax                        
0856  a30000               mov word ptr [0], ax               ; data PRZEDM.QUESTWYK
; SWIAT.PAS:423
0859  a10000               mov ax, word ptr [0]               ; data PRZEDM.FAJKA
085c  050a00               add ax, 0xa                       
085f  a30000               mov word ptr [0], ax               ; data PRZEDM.FAJKA
; SWIAT.PAS:424
0862  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRA
0865  48                   dec ax                            
0866  a30000               mov word ptr [0], ax               ; data PRZEDM.PRA
; SWIAT.PAS:425
0869  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZEPUSTKA
086c  8b160000             mov dx, word ptr [0]               ; data PRZEDM:0x0038+0x0006
0870  2d0a00               sub ax, 0xa                       
0873  83da00               sbb dx, 0                         
0876  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZEPUSTKA
0879  89160000             mov word ptr [0], dx               ; data PRZEDM:0x0038+0x0006
; SWIAT.PAS:429
087d  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0880  1e                   push ds                           
0881  57                   push di                           
0882  bf0000               mov di, 0                          ; string "WYJSCIE"
0885  0e                   push cs                           
0886  57                   push di                           
0887  9a00000000           lcall 0, 0                         ; call System.CompareString
088c  7503                 jne 0x891                         
088e  e9cb00               jmp 0x95c                         
; SWIAT.PAS:430
0891  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0894  1e                   push ds                           
0895  57                   push di                           
0896  bf0000               mov di, 0                          ; string "POLODNIE"
0899  0e                   push cs                           
089a  57                   push di                           
089b  9a00000000           lcall 0, 0                         ; call System.CompareString
08a0  7506                 jne 0x8a8                         
08a2  c70600001600         mov word ptr [0], 0x16             ; data PRZEDM.MIECHO
; SWIAT.PAS:431
08a8  bf0000               mov di, 0                          ; data PRZEDM.wpisz
08ab  1e                   push ds                           
08ac  57                   push di                           
08ad  bf0000               mov di, 0                          ; string "ZACHOD"
08b0  0e                   push cs                           
08b1  57                   push di                           
08b2  9a00000000           lcall 0, 0                         ; call System.CompareString
08b7  7516                 jne 0x8cf                         
08b9  833e0000ff           cmp word ptr [0], -1               ; data PRZEDM:0x0038+0x0006
08be  7c09                 jl 0x8c9                          
08c0  7f0d                 jg 0x8cf                          
08c2  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.PRZEPUSTKA
08c7  7706                 ja 0x8cf                          
08c9  c70600006500         mov word ptr [0], 0x65             ; data PRZEDM.MIECHO
; SWIAT.PAS:432
08cf  bf0000               mov di, 0                          ; data PRZEDM.wpisz
08d2  1e                   push ds                           
08d3  57                   push di                           
08d4  bf0000               mov di, 0                          ; string "ZACHOD"
08d7  0e                   push cs                           
08d8  57                   push di                           
08d9  9a00000000           lcall 0, 0                         ; call System.CompareString
08de  7525                 jne 0x905                         
08e0  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZEPUSTKA
08e3  0b060000             or ax, word ptr [0]                ; data PRZEDM:0x0038+0x0006
08e7  751c                 jne 0x905                         
08e9  bf0000               mov di, 0                          ; data System.OUTPUT
08ec  1e                   push ds                           
08ed  57                   push di                           
08ee  bf0000               mov di, 0                          ; string "QUEST-MASTER MOWI CI : BARDZO MI PRZYKRO ALE MUSISZ MIEC PRZEPUSTKE"
08f1  0e                   push cs                           
08f2  57                   push di                           
08f3  31c0                 xor ax, ax                        
08f5  50                   push ax                           
08f6  9a00000000           lcall 0, 0                         ; call System.WriteString
08fb  9a00000000           lcall 0, 0                         ; call System.WriteLn
0900  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:433
0905  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0908  1e                   push ds                           
0909  57                   push di                           
090a  bf0000               mov di, 0                          ; string "ZABIJ QUEST-MASTER"
090d  0e                   push cs                           
090e  57                   push di                           
090f  9a00000000           lcall 0, 0                         ; call System.CompareString
0914  753c                 jne 0x952                         
; SWIAT.PAS:434
0916  c60600000a           mov byte ptr [0], 0xa              ; data PRZEDM.POISON
; SWIAT.PAS:435
091b  c606000014           mov byte ptr [0], 0x14             ; data PRZEDM.FIREBALL
; SWIAT.PAS:436
0920  c70600000a00         mov word ptr [0], 0xa              ; data PRZEDM.WROGSIL
; SWIAT.PAS:437
0926  c70600001a00         mov word ptr [0], 0x1a             ; data PRZEDM.WROGZRE
; SWIAT.PAS:438
092c  c7060000bc00         mov word ptr [0], 0xbc             ; data PRZEDM.WROGEN
; SWIAT.PAS:439
0932  9a00000000           lcall 0, 0                         ; call PRZEDM.WALKA
; SWIAT.PAS:440
0937  833e000001           cmp word ptr [0], 1                ; data PRZEDM.WROGEN
093c  7d14                 jge 0x952                         
093e  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZEPUSTKA
0941  8b160000             mov dx, word ptr [0]               ; data PRZEDM:0x0038+0x0006
0945  2d0a00               sub ax, 0xa                       
0948  83da00               sbb dx, 0                         
094b  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZEPUSTKA
094e  89160000             mov word ptr [0], dx               ; data PRZEDM:0x0038+0x0006
; SWIAT.PAS:442
0952  833e000064           cmp word ptr [0], 0x64             ; data PRZEDM.MIECHO
0957  7503                 jne 0x95c                         
0959  e9a0fa               jmp 0x3fc                         
; SWIAT.PAS:444
095c  5d                   pop bp                            
095d  cb                   retf                              
```

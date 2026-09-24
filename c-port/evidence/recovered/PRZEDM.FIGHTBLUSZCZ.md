# `PRZEDM.FIGHTBLUSZCZ`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:1463-1558`
- TPU code block: `0x00f8`
- Procedure bytes: `0x0522`–`0x0a2f`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.AGREST`
- `PRZEDM.DMUCHAWIEC`
- `PRZEDM.DUNCAN`
- `PRZEDM.DUNQ`
- `PRZEDM.ENERGIA`
- `PRZEDM.FORSA`
- `PRZEDM.JEZYNA`
- `PRZEDM.KONICZYNKA`
- `PRZEDM.KUNSZT`
- `PRZEDM.MALINA`
- `PRZEDM.MIECHO`
- `PRZEDM.MLECZ`
- `PRZEDM.OSET`
- `PRZEDM.PASZOL`
- `PRZEDM.PLECAK`
- `PRZEDM.PRZED`
- `PRZEDM.PRZEPUSTKA`
- `PRZEDM.ROZA`
- `PRZEDM.STOKROTKA`
- `PRZEDM.SZCZAW`
- `PRZEDM.TRAWA`
- `PRZEDM.WROGEN`
- `PRZEDM.wpisz`
- `PRZEDM:0x0038+0x0002`
- `PRZEDM:0x0038+0x0006`
- `System.OUTPUT`

## Calls

- `PRZEDM.EASY`
- `PRZEDM.TRUDNO`
- `PRZEDM.VEASY`
- `System.CompareString`
- `System.WriteLn`
- `System.WriteString`
- `System.entry_0x0190`
- `System.entry_0x01a0`

## Exact strings

- `"ZABIJ DUNCAN"`
- `"SECRET LISTA"`
- `"OTO CO AKTUALNIE MAM DO ZAOFEROWANIA : PAMIETAJ U MNIE TYLKO KUPUJEMY"`
- `"MARCHEWKA Z SADU DUNCANA   : 7000"`
- `"PRZEPUSTKA QUEST-MASTERA   :  400"`
- `"PLECAK                     : 4800"`
- `"KUP DOKUMENT"`
- `"OTO PODROBIONA PRZEPUSTKA HE , HE NAWET QUEST-MASTER SIE NIE POKAPUJE"`
- `"KUP PLECAK"`
- `"HE HE HE MILO SIE Z TOBA ROBI INTERESY"`
- `"ROZMAWIAJ DUNCAN"`
- `"UCH A COZ TO ZA STRASZNA ROSLINA - PRZELAKL SIE DUNCAN WIDZAC CIEBIE"`
- `"AAA TO JAKIS WAL A NIE ROSLINA , MOWI PO CHWILI,JAK CI SIE NUDZI TO "`
- `"MOZESZ POMOC MI WYRYWAC CHWASTY , SZCZEGOLNIA ZABOJCZA DLA MOICH MARCHEWECZEK"`
- `"JEST TA WREDNA POKRZYWA , SZKODA ZE TAK JAK INNE POTWORY SIE ODREGENEROWUJE"`
- `"ALE JAK JA ZABIJESZ , POWIEDZMY ... 4 RAZY TO MOZE DA SOBIE SPOKOJ"`
- `"CO CI DAM W ZAMIAN ? TROCHE KUNSZTU , A MOJ STARY PRACUJE NA CZARNYM RYNKU"`
- `"TO CO ZABIJESZ TE ROSLINY CZY BEDZIEMY TU STAC JAK OSTATNIE LOSIE?"`
- `"DZIEKI DZIEKI , TO BYLA DOBRA ROBOTA , OD TERAZ MOZESZ PISAC PRZY MNIE :"`
- `"SECRET LISTA , TO MOZE AKURAT BEDE COS MIAL NA ZBYCIU , ADIOS"`
- `"--------- ZDOBYLES 125 KUNSZTU ------------------------"`
- `"ZABIJ SZCZAW"`
- `"ZABIJ STOKROTKA"`
- `"ZABIJ KONICZYNKA"`
- `"ZABIJ MLECZ"`
- `"ZABIJ DMUCHAWIEC"`
- `"ZABIJ ROZA"`
- `"ZABIJ OSET"`
- `"ZABIJ MALINA"`
- `"ZABIJ AGREST"`
- `"ZABIJ JEZYNA"`
- `"ZABIJ TRAWA"`
- `"HA HA HA WOLAJA SETKI LISCI TRAWY - TO BEDZIE WALKA"`
- `"UFF STRUDZONY POSTANAWIASZ ODPOCZAC TYLU PRZECIWNIKOW DAWNO NIE WIDZIALES"`

## Annotated listing

```asm
; PRZEDM.PAS:1463
0522  55                   push bp                           
0523  89e5                 mov bp, sp                        
0525  31c0                 xor ax, ax                        
0527  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:1464
052c  bf0000               mov di, 0                          ; data PRZEDM.wpisz
052f  1e                   push ds                           
0530  57                   push di                           
0531  bf0000               mov di, 0                          ; string "ZABIJ DUNCAN"
0534  0e                   push cs                           
0535  57                   push di                           
0536  9a00000000           lcall 0, 0                         ; call System.CompareString
053b  751a                 jne 0x557                         
053d  a00000               mov al, byte ptr [0]               ; data PRZEDM.DUNCAN
0540  98                   cbw                               
0541  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0545  7510                 jne 0x557                         
; PRZEDM.PAS:1465
0547  0e                   push cs                           
0548  e80000               call 0x54b                         ; call PRZEDM.EASY
; PRZEDM.PAS:1466
054b  833e000001           cmp word ptr [0], 1                ; data PRZEDM.WROGEN
0550  7d05                 jge 0x557                         
0552  c606000000           mov byte ptr [0], 0                ; data PRZEDM.DUNCAN
; PRZEDM.PAS:1468
0557  bf0000               mov di, 0                          ; data PRZEDM.wpisz
055a  1e                   push ds                           
055b  57                   push di                           
055c  bf0000               mov di, 0                          ; string "SECRET LISTA"
055f  0e                   push cs                           
0560  57                   push di                           
0561  9a00000000           lcall 0, 0                         ; call System.CompareString
0566  757a                 jne 0x5e2                         
0568  a00000               mov al, byte ptr [0]               ; data PRZEDM.DUNCAN
056b  98                   cbw                               
056c  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0570  7570                 jne 0x5e2                         
; PRZEDM.PAS:1469
0572  bf0000               mov di, 0                          ; data System.OUTPUT
0575  1e                   push ds                           
0576  57                   push di                           
0577  bf0000               mov di, 0                          ; string "OTO CO AKTUALNIE MAM DO ZAOFEROWANIA : PAMIETAJ U MNIE TYLKO KUPUJEMY"
057a  0e                   push cs                           
057b  57                   push di                           
057c  31c0                 xor ax, ax                        
057e  50                   push ax                           
057f  9a00000000           lcall 0, 0                         ; call System.WriteString
0584  9a00000000           lcall 0, 0                         ; call System.WriteLn
0589  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1470
058e  bf0000               mov di, 0                          ; data System.OUTPUT
0591  1e                   push ds                           
0592  57                   push di                           
0593  bf0000               mov di, 0                          ; string "MARCHEWKA Z SADU DUNCANA   : 7000"
0596  0e                   push cs                           
0597  57                   push di                           
0598  31c0                 xor ax, ax                        
059a  50                   push ax                           
059b  9a00000000           lcall 0, 0                         ; call System.WriteString
05a0  9a00000000           lcall 0, 0                         ; call System.WriteLn
05a5  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1471
05aa  bf0000               mov di, 0                          ; data System.OUTPUT
05ad  1e                   push ds                           
05ae  57                   push di                           
05af  bf0000               mov di, 0                          ; string "PRZEPUSTKA QUEST-MASTERA   :  400"
05b2  0e                   push cs                           
05b3  57                   push di                           
05b4  31c0                 xor ax, ax                        
05b6  50                   push ax                           
05b7  9a00000000           lcall 0, 0                         ; call System.WriteString
05bc  9a00000000           lcall 0, 0                         ; call System.WriteLn
05c1  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1472
05c6  bf0000               mov di, 0                          ; data System.OUTPUT
05c9  1e                   push ds                           
05ca  57                   push di                           
05cb  bf0000               mov di, 0                          ; string "PLECAK                     : 4800"
05ce  0e                   push cs                           
05cf  57                   push di                           
05d0  31c0                 xor ax, ax                        
05d2  50                   push ax                           
05d3  9a00000000           lcall 0, 0                         ; call System.WriteString
05d8  9a00000000           lcall 0, 0                         ; call System.WriteLn
05dd  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1474
05e2  bf0000               mov di, 0                          ; data PRZEDM.wpisz
05e5  1e                   push ds                           
05e6  57                   push di                           
05e7  bf0000               mov di, 0                          ; string "KUP DOKUMENT"
05ea  0e                   push cs                           
05eb  57                   push di                           
05ec  9a00000000           lcall 0, 0                         ; call System.CompareString
05f1  755c                 jne 0x64f                         
05f3  833e000000           cmp word ptr [0], 0                ; data PRZEDM:0x0038+0x0002
05f8  7f0a                 jg 0x604                          
05fa  7c53                 jl 0x64f                          
05fc  813e00008f01         cmp word ptr [0], 0x18f            ; data PRZEDM.FORSA
0602  764b                 jbe 0x64f                         
; PRZEDM.PAS:1475
0604  bf0000               mov di, 0                          ; data System.OUTPUT
0607  1e                   push ds                           
0608  57                   push di                           
0609  bf0000               mov di, 0                          ; string "OTO PODROBIONA PRZEPUSTKA HE , HE NAWET QUEST-MASTER SIE NIE POKAPUJE"
060c  0e                   push cs                           
060d  57                   push di                           
060e  31c0                 xor ax, ax                        
0610  50                   push ax                           
0611  9a00000000           lcall 0, 0                         ; call System.WriteString
0616  9a00000000           lcall 0, 0                         ; call System.WriteLn
061b  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1476
0620  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZEPUSTKA
0623  8b160000             mov dx, word ptr [0]               ; data PRZEDM:0x0038+0x0006
0627  2d0a00               sub ax, 0xa                       
062a  83da00               sbb dx, 0                         
062d  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZEPUSTKA
0630  89160000             mov word ptr [0], dx               ; data PRZEDM:0x0038+0x0006
; PRZEDM.PAS:1477
0634  a10000               mov ax, word ptr [0]               ; data PRZEDM.FORSA
0637  8b160000             mov dx, word ptr [0]               ; data PRZEDM:0x0038+0x0002
063b  2d9001               sub ax, 0x190                     
063e  83da00               sbb dx, 0                         
0641  a30000               mov word ptr [0], ax               ; data PRZEDM.FORSA
0644  89160000             mov word ptr [0], dx               ; data PRZEDM:0x0038+0x0002
; PRZEDM.PAS:1478
0648  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
064b  40                   inc ax                            
064c  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:1480
064f  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0652  1e                   push ds                           
0653  57                   push di                           
0654  bf0000               mov di, 0                          ; string "KUP PLECAK"
0657  0e                   push cs                           
0658  57                   push di                           
0659  9a00000000           lcall 0, 0                         ; call System.CompareString
065e  755c                 jne 0x6bc                         
0660  a00000               mov al, byte ptr [0]               ; data PRZEDM.DUNCAN
0663  98                   cbw                               
0664  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0668  7552                 jne 0x6bc                         
066a  833e000000           cmp word ptr [0], 0                ; data PRZEDM:0x0038+0x0002
066f  7f0a                 jg 0x67b                          
0671  7c49                 jl 0x6bc                          
0673  813e0000bf12         cmp word ptr [0], 0x12bf           ; data PRZEDM.FORSA
0679  7641                 jbe 0x6bc                         
; PRZEDM.PAS:1481
067b  bf0000               mov di, 0                          ; data System.OUTPUT
067e  1e                   push ds                           
067f  57                   push di                           
0680  bf0000               mov di, 0                          ; string "HE HE HE MILO SIE Z TOBA ROBI INTERESY"
0683  0e                   push cs                           
0684  57                   push di                           
0685  31c0                 xor ax, ax                        
0687  50                   push ax                           
0688  9a00000000           lcall 0, 0                         ; call System.WriteString
068d  9a00000000           lcall 0, 0                         ; call System.WriteLn
0692  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1482
0697  a10000               mov ax, word ptr [0]               ; data PRZEDM.FORSA
069a  8b160000             mov dx, word ptr [0]               ; data PRZEDM:0x0038+0x0002
069e  2dc012               sub ax, 0x12c0                    
06a1  83da00               sbb dx, 0                         
06a4  a30000               mov word ptr [0], ax               ; data PRZEDM.FORSA
06a7  89160000             mov word ptr [0], dx               ; data PRZEDM:0x0038+0x0002
; PRZEDM.PAS:1483
06ab  a00000               mov al, byte ptr [0]               ; data PRZEDM.PLECAK
06ae  98                   cbw                               
06af  2d0a00               sub ax, 0xa                       
06b2  a20000               mov byte ptr [0], al               ; data PRZEDM.PLECAK
; PRZEDM.PAS:1484
06b5  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
06b8  40                   inc ax                            
06b9  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:1486
06bc  bf0000               mov di, 0                          ; data PRZEDM.wpisz
06bf  1e                   push ds                           
06c0  57                   push di                           
06c1  bf0000               mov di, 0                          ; string "ROZMAWIAJ DUNCAN"
06c4  0e                   push cs                           
06c5  57                   push di                           
06c6  9a00000000           lcall 0, 0                         ; call System.CompareString
06cb  7403                 je 0x6d0                          
06cd  e95001               jmp 0x820                         
06d0  a00000               mov al, byte ptr [0]               ; data PRZEDM.DUNCAN
06d3  98                   cbw                               
06d4  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
06d8  7403                 je 0x6dd                          
06da  e94301               jmp 0x820                         
; PRZEDM.PAS:1487
06dd  803e000000           cmp byte ptr [0], 0                ; data PRZEDM.DUNQ
06e2  7403                 je 0x6e7                          
06e4  e9ad00               jmp 0x794                         
; PRZEDM.PAS:1488
06e7  bf0000               mov di, 0                          ; data System.OUTPUT
06ea  1e                   push ds                           
06eb  57                   push di                           
06ec  bf0000               mov di, 0                          ; string "UCH A COZ TO ZA STRASZNA ROSLINA - PRZELAKL SIE DUNCAN WIDZAC CIEBIE"
06ef  0e                   push cs                           
06f0  57                   push di                           
06f1  31c0                 xor ax, ax                        
06f3  50                   push ax                           
06f4  9a00000000           lcall 0, 0                         ; call System.WriteString
06f9  9a00000000           lcall 0, 0                         ; call System.WriteLn
06fe  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1489
0703  bf0000               mov di, 0                          ; data System.OUTPUT
0706  1e                   push ds                           
0707  57                   push di                           
0708  bf0000               mov di, 0                          ; string "AAA TO JAKIS WAL A NIE ROSLINA , MOWI PO CHWILI,JAK CI SIE NUDZI TO "
070b  0e                   push cs                           
070c  57                   push di                           
070d  31c0                 xor ax, ax                        
070f  50                   push ax                           
0710  9a00000000           lcall 0, 0                         ; call System.WriteString
0715  9a00000000           lcall 0, 0                         ; call System.WriteLn
071a  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1490
071f  bf0000               mov di, 0                          ; data System.OUTPUT
0722  1e                   push ds                           
0723  57                   push di                           
0724  bf0000               mov di, 0                          ; string "MOZESZ POMOC MI WYRYWAC CHWASTY , SZCZEGOLNIA ZABOJCZA DLA MOICH MARCHEWECZEK"
0727  0e                   push cs                           
0728  57                   push di                           
0729  31c0                 xor ax, ax                        
072b  50                   push ax                           
072c  9a00000000           lcall 0, 0                         ; call System.WriteString
0731  9a00000000           lcall 0, 0                         ; call System.WriteLn
0736  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1491
073b  bf0000               mov di, 0                          ; data System.OUTPUT
073e  1e                   push ds                           
073f  57                   push di                           
0740  bf0000               mov di, 0                          ; string "JEST TA WREDNA POKRZYWA , SZKODA ZE TAK JAK INNE POTWORY SIE ODREGENEROWUJE"
0743  0e                   push cs                           
0744  57                   push di                           
0745  31c0                 xor ax, ax                        
0747  50                   push ax                           
0748  9a00000000           lcall 0, 0                         ; call System.WriteString
074d  9a00000000           lcall 0, 0                         ; call System.WriteLn
0752  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1492
0757  bf0000               mov di, 0                          ; data System.OUTPUT
075a  1e                   push ds                           
075b  57                   push di                           
075c  bf0000               mov di, 0                          ; string "ALE JAK JA ZABIJESZ , POWIEDZMY ... 4 RAZY TO MOZE DA SOBIE SPOKOJ"
075f  0e                   push cs                           
0760  57                   push di                           
0761  31c0                 xor ax, ax                        
0763  50                   push ax                           
0764  9a00000000           lcall 0, 0                         ; call System.WriteString
0769  9a00000000           lcall 0, 0                         ; call System.WriteLn
076e  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1493
0773  bf0000               mov di, 0                          ; data System.OUTPUT
0776  1e                   push ds                           
0777  57                   push di                           
0778  bf0000               mov di, 0                          ; string "CO CI DAM W ZAMIAN ? TROCHE KUNSZTU , A MOJ STARY PRACUJE NA CZARNYM RYNKU"
077b  0e                   push cs                           
077c  57                   push di                           
077d  31c0                 xor ax, ax                        
077f  50                   push ax                           
0780  9a00000000           lcall 0, 0                         ; call System.WriteString
0785  9a00000000           lcall 0, 0                         ; call System.WriteLn
078a  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1494
078f  c60600004b           mov byte ptr [0], 0x4b             ; data PRZEDM.DUNQ
; PRZEDM.PAS:1496
0794  803e000000           cmp byte ptr [0], 0                ; data PRZEDM.DUNQ
0799  741c                 je 0x7b7                          
; PRZEDM.PAS:1497
079b  bf0000               mov di, 0                          ; data System.OUTPUT
079e  1e                   push ds                           
079f  57                   push di                           
07a0  bf0000               mov di, 0                          ; string "TO CO ZABIJESZ TE ROSLINY CZY BEDZIEMY TU STAC JAK OSTATNIE LOSIE?"
07a3  0e                   push cs                           
07a4  57                   push di                           
07a5  31c0                 xor ax, ax                        
07a7  50                   push ax                           
07a8  9a00000000           lcall 0, 0                         ; call System.WriteString
07ad  9a00000000           lcall 0, 0                         ; call System.WriteLn
07b2  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1499
07b7  803e000083           cmp byte ptr [0], 0x83             ; data PRZEDM.DUNQ
07bc  7562                 jne 0x820                         
; PRZEDM.PAS:1500
07be  bf0000               mov di, 0                          ; data System.OUTPUT
07c1  1e                   push ds                           
07c2  57                   push di                           
07c3  bf0000               mov di, 0                          ; string "DZIEKI DZIEKI , TO BYLA DOBRA ROBOTA , OD TERAZ MOZESZ PISAC PRZY MNIE :"
07c6  0e                   push cs                           
07c7  57                   push di                           
07c8  31c0                 xor ax, ax                        
07ca  50                   push ax                           
07cb  9a00000000           lcall 0, 0                         ; call System.WriteString
07d0  9a00000000           lcall 0, 0                         ; call System.WriteLn
07d5  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1501
07da  bf0000               mov di, 0                          ; data System.OUTPUT
07dd  1e                   push ds                           
07de  57                   push di                           
07df  bf0000               mov di, 0                          ; string "SECRET LISTA , TO MOZE AKURAT BEDE COS MIAL NA ZBYCIU , ADIOS"
07e2  0e                   push cs                           
07e3  57                   push di                           
07e4  31c0                 xor ax, ax                        
07e6  50                   push ax                           
07e7  9a00000000           lcall 0, 0                         ; call System.WriteString
07ec  9a00000000           lcall 0, 0                         ; call System.WriteLn
07f1  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1502
07f6  c606000000           mov byte ptr [0], 0                ; data PRZEDM.DUNQ
; PRZEDM.PAS:1503
07fb  a10000               mov ax, word ptr [0]               ; data PRZEDM.KUNSZT
07fe  057d00               add ax, 0x7d                      
0801  a30000               mov word ptr [0], ax               ; data PRZEDM.KUNSZT
; PRZEDM.PAS:1504
0804  bf0000               mov di, 0                          ; data System.OUTPUT
0807  1e                   push ds                           
0808  57                   push di                           
0809  bf0000               mov di, 0                          ; string "--------- ZDOBYLES 125 KUNSZTU ------------------------"
080c  0e                   push cs                           
080d  57                   push di                           
080e  31c0                 xor ax, ax                        
0810  50                   push ax                           
0811  9a00000000           lcall 0, 0                         ; call System.WriteString
0816  9a00000000           lcall 0, 0                         ; call System.WriteLn
081b  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1508
0820  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0823  1e                   push ds                           
0824  57                   push di                           
0825  bf0000               mov di, 0                          ; string "ZABIJ SZCZAW"
0828  0e                   push cs                           
0829  57                   push di                           
082a  9a00000000           lcall 0, 0                         ; call System.CompareString
082f  7512                 jne 0x843                         
0831  a10000               mov ax, word ptr [0]               ; data PRZEDM.SZCZAW
0834  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0838  7509                 jne 0x843                         
; PRZEDM.PAS:1509
083a  0e                   push cs                           
083b  e80000               call 0x83e                         ; call PRZEDM.VEASY
; PRZEDM.PAS:1510
083e  31c0                 xor ax, ax                        
0840  a30000               mov word ptr [0], ax               ; data PRZEDM.SZCZAW
; PRZEDM.PAS:1512
0843  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0846  1e                   push ds                           
0847  57                   push di                           
0848  bf0000               mov di, 0                          ; string "ZABIJ STOKROTKA"
084b  0e                   push cs                           
084c  57                   push di                           
084d  9a00000000           lcall 0, 0                         ; call System.CompareString
0852  7519                 jne 0x86d                         
0854  a10000               mov ax, word ptr [0]               ; data PRZEDM.STOKROTKA
0857  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
085b  7510                 jne 0x86d                         
; PRZEDM.PAS:1513
085d  0e                   push cs                           
085e  e80000               call 0x861                         ; call PRZEDM.VEASY
; PRZEDM.PAS:1514
0861  833e000000           cmp word ptr [0], 0                ; data PRZEDM.ENERGIA
0866  7e05                 jle 0x86d                         
0868  31c0                 xor ax, ax                        
086a  a30000               mov word ptr [0], ax               ; data PRZEDM.STOKROTKA
; PRZEDM.PAS:1516
086d  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0870  1e                   push ds                           
0871  57                   push di                           
0872  bf0000               mov di, 0                          ; string "ZABIJ KONICZYNKA"
0875  0e                   push cs                           
0876  57                   push di                           
0877  9a00000000           lcall 0, 0                         ; call System.CompareString
087c  7512                 jne 0x890                         
087e  a10000               mov ax, word ptr [0]               ; data PRZEDM.KONICZYNKA
0881  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0885  7509                 jne 0x890                         
; PRZEDM.PAS:1517
0887  0e                   push cs                           
0888  e80000               call 0x88b                         ; call PRZEDM.VEASY
; PRZEDM.PAS:1518
088b  31c0                 xor ax, ax                        
088d  a30000               mov word ptr [0], ax               ; data PRZEDM.KONICZYNKA
; PRZEDM.PAS:1520
0890  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0893  1e                   push ds                           
0894  57                   push di                           
0895  bf0000               mov di, 0                          ; string "ZABIJ MLECZ"
0898  0e                   push cs                           
0899  57                   push di                           
089a  9a00000000           lcall 0, 0                         ; call System.CompareString
089f  7512                 jne 0x8b3                         
08a1  a10000               mov ax, word ptr [0]               ; data PRZEDM.MLECZ
08a4  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
08a8  7509                 jne 0x8b3                         
; PRZEDM.PAS:1521
08aa  0e                   push cs                           
08ab  e80000               call 0x8ae                         ; call PRZEDM.VEASY
; PRZEDM.PAS:1522
08ae  31c0                 xor ax, ax                        
08b0  a30000               mov word ptr [0], ax               ; data PRZEDM.MLECZ
; PRZEDM.PAS:1524
08b3  bf0000               mov di, 0                          ; data PRZEDM.wpisz
08b6  1e                   push ds                           
08b7  57                   push di                           
08b8  bf0000               mov di, 0                          ; string "ZABIJ DMUCHAWIEC"
08bb  0e                   push cs                           
08bc  57                   push di                           
08bd  9a00000000           lcall 0, 0                         ; call System.CompareString
08c2  7512                 jne 0x8d6                         
08c4  a10000               mov ax, word ptr [0]               ; data PRZEDM.DMUCHAWIEC
08c7  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
08cb  7509                 jne 0x8d6                         
; PRZEDM.PAS:1525
08cd  0e                   push cs                           
08ce  e80000               call 0x8d1                         ; call PRZEDM.VEASY
; PRZEDM.PAS:1526
08d1  31c0                 xor ax, ax                        
08d3  a30000               mov word ptr [0], ax               ; data PRZEDM.DMUCHAWIEC
; PRZEDM.PAS:1528
08d6  bf0000               mov di, 0                          ; data PRZEDM.wpisz
08d9  1e                   push ds                           
08da  57                   push di                           
08db  bf0000               mov di, 0                          ; string "ZABIJ ROZA"
08de  0e                   push cs                           
08df  57                   push di                           
08e0  9a00000000           lcall 0, 0                         ; call System.CompareString
08e5  7519                 jne 0x900                         
08e7  a10000               mov ax, word ptr [0]               ; data PRZEDM.ROZA
08ea  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
08ee  7510                 jne 0x900                         
; PRZEDM.PAS:1529
08f0  0e                   push cs                           
08f1  e80000               call 0x8f4                         ; call PRZEDM.EASY
; PRZEDM.PAS:1530
08f4  833e000000           cmp word ptr [0], 0                ; data PRZEDM.ENERGIA
08f9  7e05                 jle 0x900                         
08fb  31c0                 xor ax, ax                        
08fd  a30000               mov word ptr [0], ax               ; data PRZEDM.ROZA
; PRZEDM.PAS:1532
0900  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0903  1e                   push ds                           
0904  57                   push di                           
0905  bf0000               mov di, 0                          ; string "ZABIJ OSET"
0908  0e                   push cs                           
0909  57                   push di                           
090a  9a00000000           lcall 0, 0                         ; call System.CompareString
090f  7519                 jne 0x92a                         
0911  a10000               mov ax, word ptr [0]               ; data PRZEDM.OSET
0914  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0918  7510                 jne 0x92a                         
; PRZEDM.PAS:1533
091a  0e                   push cs                           
091b  e80000               call 0x91e                         ; call PRZEDM.EASY
; PRZEDM.PAS:1534
091e  833e000000           cmp word ptr [0], 0                ; data PRZEDM.ENERGIA
0923  7e05                 jle 0x92a                         
0925  31c0                 xor ax, ax                        
0927  a30000               mov word ptr [0], ax               ; data PRZEDM.OSET
; PRZEDM.PAS:1536
092a  bf0000               mov di, 0                          ; data PRZEDM.wpisz
092d  1e                   push ds                           
092e  57                   push di                           
092f  bf0000               mov di, 0                          ; string "ZABIJ MALINA"
0932  0e                   push cs                           
0933  57                   push di                           
0934  9a00000000           lcall 0, 0                         ; call System.CompareString
0939  7519                 jne 0x954                         
093b  a10000               mov ax, word ptr [0]               ; data PRZEDM.MALINA
093e  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0942  7510                 jne 0x954                         
; PRZEDM.PAS:1537
0944  0e                   push cs                           
0945  e80000               call 0x948                         ; call PRZEDM.EASY
; PRZEDM.PAS:1538
0948  833e000000           cmp word ptr [0], 0                ; data PRZEDM.ENERGIA
094d  7e05                 jle 0x954                         
094f  31c0                 xor ax, ax                        
0951  a30000               mov word ptr [0], ax               ; data PRZEDM.MALINA
; PRZEDM.PAS:1540
0954  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0957  1e                   push ds                           
0958  57                   push di                           
0959  bf0000               mov di, 0                          ; string "ZABIJ AGREST"
095c  0e                   push cs                           
095d  57                   push di                           
095e  9a00000000           lcall 0, 0                         ; call System.CompareString
0963  7519                 jne 0x97e                         
0965  a10000               mov ax, word ptr [0]               ; data PRZEDM.AGREST
0968  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
096c  7510                 jne 0x97e                         
; PRZEDM.PAS:1541
096e  0e                   push cs                           
096f  e80000               call 0x972                         ; call PRZEDM.EASY
; PRZEDM.PAS:1542
0972  833e000000           cmp word ptr [0], 0                ; data PRZEDM.ENERGIA
0977  7e05                 jle 0x97e                         
0979  31c0                 xor ax, ax                        
097b  a30000               mov word ptr [0], ax               ; data PRZEDM.AGREST
; PRZEDM.PAS:1544
097e  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0981  1e                   push ds                           
0982  57                   push di                           
0983  bf0000               mov di, 0                          ; string "ZABIJ JEZYNA"
0986  0e                   push cs                           
0987  57                   push di                           
0988  9a00000000           lcall 0, 0                         ; call System.CompareString
098d  7519                 jne 0x9a8                         
098f  a10000               mov ax, word ptr [0]               ; data PRZEDM.JEZYNA
0992  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0996  7510                 jne 0x9a8                         
; PRZEDM.PAS:1545
0998  0e                   push cs                           
0999  e80000               call 0x99c                         ; call PRZEDM.EASY
; PRZEDM.PAS:1546
099c  833e000000           cmp word ptr [0], 0                ; data PRZEDM.ENERGIA
09a1  7e05                 jle 0x9a8                         
09a3  31c0                 xor ax, ax                        
09a5  a30000               mov word ptr [0], ax               ; data PRZEDM.JEZYNA
; PRZEDM.PAS:1548
09a8  bf0000               mov di, 0                          ; data PRZEDM.wpisz
09ab  1e                   push ds                           
09ac  57                   push di                           
09ad  bf0000               mov di, 0                          ; string "ZABIJ TRAWA"
09b0  0e                   push cs                           
09b1  57                   push di                           
09b2  9a00000000           lcall 0, 0                         ; call System.CompareString
09b7  7574                 jne 0xa2d                         
09b9  a10000               mov ax, word ptr [0]               ; data PRZEDM.TRAWA
09bc  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
09c0  756b                 jne 0xa2d                         
; PRZEDM.PAS:1549
09c2  bf0000               mov di, 0                          ; data System.OUTPUT
09c5  1e                   push ds                           
09c6  57                   push di                           
09c7  bf0000               mov di, 0                          ; string "HA HA HA WOLAJA SETKI LISCI TRAWY - TO BEDZIE WALKA"
09ca  0e                   push cs                           
09cb  57                   push di                           
09cc  31c0                 xor ax, ax                        
09ce  50                   push ax                           
09cf  9a00000000           lcall 0, 0                         ; call System.WriteString
09d4  9a00000000           lcall 0, 0                         ; call System.WriteLn
09d9  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1550
09de  0e                   push cs                           
09df  e80000               call 0x9e2                         ; call PRZEDM.TRUDNO
; PRZEDM.PAS:1551
09e2  833e000000           cmp word ptr [0], 0                ; data PRZEDM.ENERGIA
09e7  7e04                 jle 0x9ed                         
09e9  0e                   push cs                           
09ea  e80000               call 0x9ed                         ; call PRZEDM.TRUDNO
; PRZEDM.PAS:1552
09ed  833e000000           cmp word ptr [0], 0                ; data PRZEDM.ENERGIA
09f2  7e04                 jle 0x9f8                         
09f4  0e                   push cs                           
09f5  e80000               call 0x9f8                         ; call PRZEDM.TRUDNO
; PRZEDM.PAS:1553
09f8  833e000000           cmp word ptr [0], 0                ; data PRZEDM.ENERGIA
09fd  7e04                 jle 0xa03                         
09ff  0e                   push cs                           
0a00  e80000               call 0xa03                         ; call PRZEDM.TRUDNO
; PRZEDM.PAS:1554
0a03  833e000000           cmp word ptr [0], 0                ; data PRZEDM.ENERGIA
0a08  7e23                 jle 0xa2d                         
0a0a  833e000000           cmp word ptr [0], 0                ; data PRZEDM.PASZOL
0a0f  751c                 jne 0xa2d                         
; PRZEDM.PAS:1555
0a11  bf0000               mov di, 0                          ; data System.OUTPUT
0a14  1e                   push ds                           
0a15  57                   push di                           
0a16  bf0000               mov di, 0                          ; string "UFF STRUDZONY POSTANAWIASZ ODPOCZAC TYLU PRZECIWNIKOW DAWNO NIE WIDZIALES"
0a19  0e                   push cs                           
0a1a  57                   push di                           
0a1b  31c0                 xor ax, ax                        
0a1d  50                   push ax                           
0a1e  9a00000000           lcall 0, 0                         ; call System.WriteString
0a23  9a00000000           lcall 0, 0                         ; call System.WriteLn
0a28  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1558
0a2d  5d                   pop bp                            
0a2e  cb                   retf                              
```

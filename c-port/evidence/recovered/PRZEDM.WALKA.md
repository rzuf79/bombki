# `PRZEDM.WALKA`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:611-905`
- TPU code block: `0x00c8`
- Procedure bytes: `0x04ec`–`0x183d`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `MONSTRA.MAXE`
- `PRZEDM.BIGOS`
- `PRZEDM.ENERGIA`
- `PRZEDM.FIREBALL`
- `PRZEDM.FUKS`
- `PRZEDM.FUKSROLL`
- `PRZEDM.ILEPOI`
- `PRZEDM.KOP`
- `PRZEDM.KOPHP`
- `PRZEDM.KOPM`
- `PRZEDM.KUNSZT`
- `PRZEDM.MANA`
- `PRZEDM.MIECHO`
- `PRZEDM.MINIKUNSZT`
- `PRZEDM.ON`
- `PRZEDM.PAR`
- `PRZEDM.PASZOL`
- `PRZEDM.POISON`
- `PRZEDM.POTRAWKI`
- `PRZEDM.POZIOM`
- `PRZEDM.PRZED`
- `PRZEDM.QUEST`
- `PRZEDM.QUESTWYK`
- `PRZEDM.SIL`
- `PRZEDM.SZANSA`
- `PRZEDM.TEST1`
- `PRZEDM.TY`
- `PRZEDM.WIMP`
- `PRZEDM.WPYSK`
- `PRZEDM.WROGEN`
- `PRZEDM.WROGSIL`
- `PRZEDM.WROGZRE`
- `PRZEDM.ZRE`
- `PRZEDM.ZWIEJ`
- `System.OUTPUT`

## Calls

- `Crt.Delay`
- `Crt.TextColor`
- `PRZEDM.TARCZA`
- `System.Random`
- `System.WriteInteger`
- `System.WriteLn`
- `System.WriteString`
- `System.entry_0x0190`
- `System.entry_0x01a0`

## Exact strings

- `"WALCZYSZ - <<<<TWOJ WROG MA "`
- `"%>>>><<<< A TY MASZ "`
- `"% ENERGII>>>>>"`
- `"UNIKASZ CIOSU WROGA TWEGO I SMIEJESZ SIE Z JEGO NIEPORADNOSCI"`
- `"PRZECIWNIK UNIKA TWOJEGO LAMERSKIEGO ATAKU"`
- `"PRZECIWNIK Z GRACJA UNIKA TWEGO CIOSU"`
- `"BEZ PARDONU OMIJASZ CIOS TWOJEGO PRZECIWNIKA"`
- `"PRZECIWNIK CIE TYLKO DRASNA I TRACISZ "`
- `"% ENERGII"`
- `"DOSTALES I TRACISZ "`
- `"PRZECIWNIK !MASAKRUJE! CIEBIE I TRACISZ AZ "`
- `"PRZECIWNIK !!!WYPRUWA FLAKI!!! Z CIEBIE I TRACISZ !!! "`
- `"            <<<<<ODPAROWUJESZ ATAK PRZECIWNIKA !!! TRACISZ 0% ENERGI"`
- `"            <<<<<ODPAROWUJESZ ATAK PRZECIWNIKA !!! TRACISZ "`
- `"% ENERGI"`
- `"*************** UCZYSZ SIE ZDOLNOSCI PAROWANIE !!!!! ***************"`
- `"PRZECIWNIK PUSZCZA FIREBALLA W TWYM KIERUNKU - TRACISZ "`
- `"PRZECIWNIK RZUCA CZAR \"POISON\" "`
- `"JESTES ZATRUTY - TRACISZ "`
- `"FUKSROLL FUKSROLL FUKSROLL ! "`
- `"MASZ PECHA : LEKKO POPCHNALES GO I STRACIL TYLKO "`
- `"DOSTAL I STRACIL "`
- `" !MASAKRUJESZ! PRZECIWNIKA I TRACI ON AZ "`
- `" !!!WYPRUWASZ FLAKI!!! Z PRZECIWNIKA I TRACI ON  !!!! "`
- `"TWOJ SUPER KOP ZABIERA "`
- `"TWOJ SUPER KOP CHYBIA PRZECIWNIKA "`
- `"WSTYD !!! UCIEKLES Z POLA BITWY TRACISZ 20 KUNSZTU"`
- `"NIE UDALO CI SIE UCIEC !!!! WALCZYSZ DALEJ !!! "`
- `"ZABILES GO ! ZYSKUJESZ ZA TO "`
- `" KUNSZTU "`
- `"ROBISZ SOBIE PYSZNY PYSZNY BIGOS Z KAPUSTA Z WROGA"`
- `"UCZYSZ SIE ZDOLNOSCI POTRAWKI !!! "`
- `"!!!!!!!!!!!ZOSTALES ZABITY!!!!!!!!!!!!"`

## Annotated listing

```asm
; PRZEDM.PAS:611
04ec  55                   push bp                           
04ed  89e5                 mov bp, sp                        
04ef  31c0                 xor ax, ax                        
04f1  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:612
04f6  a10000               mov ax, word ptr [0]               ; data MONSTRA.MAXE
04f9  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.WROGEN
04fd  7f03                 jg 0x502                          
04ff  e9e600               jmp 0x5e8                         
; PRZEDM.PAS:613
0502  a10000               mov ax, word ptr [0]               ; data MONSTRA.MAXE
0505  2b060000             sub ax, word ptr [0]               ; data PRZEDM.WROGEN
0509  a30000               mov word ptr [0], ax               ; data PRZEDM.TEST1
; PRZEDM.PAS:614
050c  833e000004           cmp word ptr [0], 4                ; data PRZEDM.TEST1
0511  7d09                 jge 0x51c                         
0513  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0516  050a00               add ax, 0xa                       
0519  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:615
051c  833e000002           cmp word ptr [0], 2                ; data PRZEDM.TEST1
0521  7e10                 jle 0x533                         
0523  833e000007           cmp word ptr [0], 7                ; data PRZEDM.TEST1
0528  7d09                 jge 0x533                         
052a  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
052d  050900               add ax, 9                         
0530  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:616
0533  833e000006           cmp word ptr [0], 6                ; data PRZEDM.TEST1
0538  7e10                 jle 0x54a                         
053a  833e00000a           cmp word ptr [0], 0xa              ; data PRZEDM.TEST1
053f  7d09                 jge 0x54a                         
0541  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0544  050800               add ax, 8                         
0547  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:617
054a  833e000009           cmp word ptr [0], 9                ; data PRZEDM.TEST1
054f  7e10                 jle 0x561                         
0551  833e00000d           cmp word ptr [0], 0xd              ; data PRZEDM.TEST1
0556  7d09                 jge 0x561                         
0558  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
055b  050700               add ax, 7                         
055e  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:618
0561  833e00000c           cmp word ptr [0], 0xc              ; data PRZEDM.TEST1
0566  7e10                 jle 0x578                         
0568  833e000010           cmp word ptr [0], 0x10             ; data PRZEDM.TEST1
056d  7d09                 jge 0x578                         
056f  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0572  050600               add ax, 6                         
0575  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:619
0578  833e00000f           cmp word ptr [0], 0xf              ; data PRZEDM.TEST1
057d  7e10                 jle 0x58f                         
057f  833e000013           cmp word ptr [0], 0x13             ; data PRZEDM.TEST1
0584  7d09                 jge 0x58f                         
0586  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0589  050500               add ax, 5                         
058c  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:620
058f  833e000012           cmp word ptr [0], 0x12             ; data PRZEDM.TEST1
0594  7e10                 jle 0x5a6                         
0596  833e000016           cmp word ptr [0], 0x16             ; data PRZEDM.TEST1
059b  7d09                 jge 0x5a6                         
059d  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
05a0  050400               add ax, 4                         
05a3  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:621
05a6  833e000015           cmp word ptr [0], 0x15             ; data PRZEDM.TEST1
05ab  7e10                 jle 0x5bd                         
05ad  833e000019           cmp word ptr [0], 0x19             ; data PRZEDM.TEST1
05b2  7d09                 jge 0x5bd                         
05b4  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
05b7  050300               add ax, 3                         
05ba  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:622
05bd  833e000018           cmp word ptr [0], 0x18             ; data PRZEDM.TEST1
05c2  7e0f                 jle 0x5d3                         
05c4  833e00001c           cmp word ptr [0], 0x1c             ; data PRZEDM.TEST1
05c9  7d08                 jge 0x5d3                         
05cb  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
05ce  40                   inc ax                            
05cf  40                   inc ax                            
05d0  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:623
05d3  833e00001b           cmp word ptr [0], 0x1b             ; data PRZEDM.TEST1
05d8  7e0e                 jle 0x5e8                         
05da  833e00001f           cmp word ptr [0], 0x1f             ; data PRZEDM.TEST1
05df  7d07                 jge 0x5e8                         
05e1  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
05e4  40                   inc ax                            
05e5  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:625
05e8  a10000               mov ax, word ptr [0]               ; data MONSTRA.MAXE
05eb  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.WROGEN
05ef  7c03                 jl 0x5f4                          
05f1  e9aa00               jmp 0x69e                         
; PRZEDM.PAS:626
05f4  a10000               mov ax, word ptr [0]               ; data PRZEDM.WROGEN
05f7  2b060000             sub ax, word ptr [0]               ; data MONSTRA.MAXE
05fb  a30000               mov word ptr [0], ax               ; data PRZEDM.TEST1
; PRZEDM.PAS:627
05fe  833e000002           cmp word ptr [0], 2                ; data PRZEDM.TEST1
0603  7509                 jne 0x60e                         
0605  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0608  050c00               add ax, 0xc                       
060b  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:628
060e  833e000004           cmp word ptr [0], 4                ; data PRZEDM.TEST1
0613  7509                 jne 0x61e                         
0615  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0618  050d00               add ax, 0xd                       
061b  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:629
061e  833e000006           cmp word ptr [0], 6                ; data PRZEDM.TEST1
0623  7509                 jne 0x62e                         
0625  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0628  050e00               add ax, 0xe                       
062b  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:630
062e  833e000008           cmp word ptr [0], 8                ; data PRZEDM.TEST1
0633  7509                 jne 0x63e                         
0635  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0638  050f00               add ax, 0xf                       
063b  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:631
063e  833e00000a           cmp word ptr [0], 0xa              ; data PRZEDM.TEST1
0643  7509                 jne 0x64e                         
0645  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0648  051000               add ax, 0x10                      
064b  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:632
064e  833e00000c           cmp word ptr [0], 0xc              ; data PRZEDM.TEST1
0653  7509                 jne 0x65e                         
0655  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0658  051100               add ax, 0x11                      
065b  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:633
065e  833e00000e           cmp word ptr [0], 0xe              ; data PRZEDM.TEST1
0663  7509                 jne 0x66e                         
0665  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0668  051200               add ax, 0x12                      
066b  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:634
066e  833e000010           cmp word ptr [0], 0x10             ; data PRZEDM.TEST1
0673  7509                 jne 0x67e                         
0675  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0678  051300               add ax, 0x13                      
067b  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:635
067e  833e000012           cmp word ptr [0], 0x12             ; data PRZEDM.TEST1
0683  7509                 jne 0x68e                         
0685  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0688  051400               add ax, 0x14                      
068b  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:636
068e  833e000014           cmp word ptr [0], 0x14             ; data PRZEDM.TEST1
0693  7e09                 jle 0x69e                         
0695  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0698  051500               add ax, 0x15                      
069b  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:638
069e  a10000               mov ax, word ptr [0]               ; data MONSTRA.MAXE
06a1  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.WROGEN
06a5  7509                 jne 0x6b0                         
06a7  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
06aa  050b00               add ax, 0xb                       
06ad  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:639
06b0  a10000               mov ax, word ptr [0]               ; data PRZEDM.SIL
06b3  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.WROGSIL
06b7  7f03                 jg 0x6bc                          
06b9  e9a700               jmp 0x763                         
; PRZEDM.PAS:640
06bc  a10000               mov ax, word ptr [0]               ; data PRZEDM.SIL
06bf  2b060000             sub ax, word ptr [0]               ; data PRZEDM.WROGSIL
06c3  a30000               mov word ptr [0], ax               ; data PRZEDM.TEST1
; PRZEDM.PAS:641
06c6  833e000001           cmp word ptr [0], 1                ; data PRZEDM.TEST1
06cb  7509                 jne 0x6d6                         
06cd  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
06d0  050a00               add ax, 0xa                       
06d3  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:642
06d6  833e000002           cmp word ptr [0], 2                ; data PRZEDM.TEST1
06db  7509                 jne 0x6e6                         
06dd  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
06e0  050900               add ax, 9                         
06e3  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:643
06e6  833e000003           cmp word ptr [0], 3                ; data PRZEDM.TEST1
06eb  7509                 jne 0x6f6                         
06ed  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
06f0  050800               add ax, 8                         
06f3  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:644
06f6  833e000004           cmp word ptr [0], 4                ; data PRZEDM.TEST1
06fb  7509                 jne 0x706                         
06fd  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0700  050700               add ax, 7                         
0703  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:645
0706  833e000005           cmp word ptr [0], 5                ; data PRZEDM.TEST1
070b  7509                 jne 0x716                         
070d  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0710  050600               add ax, 6                         
0713  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:646
0716  833e000006           cmp word ptr [0], 6                ; data PRZEDM.TEST1
071b  7509                 jne 0x726                         
071d  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0720  050500               add ax, 5                         
0723  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:647
0726  833e000007           cmp word ptr [0], 7                ; data PRZEDM.TEST1
072b  7509                 jne 0x736                         
072d  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0730  050400               add ax, 4                         
0733  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:648
0736  833e000008           cmp word ptr [0], 8                ; data PRZEDM.TEST1
073b  7509                 jne 0x746                         
073d  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0740  050300               add ax, 3                         
0743  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:649
0746  833e000009           cmp word ptr [0], 9                ; data PRZEDM.TEST1
074b  7508                 jne 0x755                         
074d  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0750  40                   inc ax                            
0751  40                   inc ax                            
0752  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:650
0755  833e00000a           cmp word ptr [0], 0xa              ; data PRZEDM.TEST1
075a  7507                 jne 0x763                         
075c  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
075f  40                   inc ax                            
0760  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:652
0763  a10000               mov ax, word ptr [0]               ; data PRZEDM.SIL
0766  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.WROGSIL
076a  7c03                 jl 0x76f                          
076c  e9aa00               jmp 0x819                         
; PRZEDM.PAS:653
076f  a10000               mov ax, word ptr [0]               ; data PRZEDM.WROGSIL
0772  2b060000             sub ax, word ptr [0]               ; data PRZEDM.SIL
0776  a30000               mov word ptr [0], ax               ; data PRZEDM.TEST1
; PRZEDM.PAS:654
0779  833e000001           cmp word ptr [0], 1                ; data PRZEDM.TEST1
077e  7509                 jne 0x789                         
0780  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0783  050c00               add ax, 0xc                       
0786  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:655
0789  833e000002           cmp word ptr [0], 2                ; data PRZEDM.TEST1
078e  7509                 jne 0x799                         
0790  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0793  050d00               add ax, 0xd                       
0796  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:656
0799  833e000003           cmp word ptr [0], 3                ; data PRZEDM.TEST1
079e  7509                 jne 0x7a9                         
07a0  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
07a3  050e00               add ax, 0xe                       
07a6  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:657
07a9  833e000004           cmp word ptr [0], 4                ; data PRZEDM.TEST1
07ae  7509                 jne 0x7b9                         
07b0  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
07b3  050f00               add ax, 0xf                       
07b6  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:658
07b9  833e000005           cmp word ptr [0], 5                ; data PRZEDM.TEST1
07be  7509                 jne 0x7c9                         
07c0  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
07c3  051000               add ax, 0x10                      
07c6  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:659
07c9  833e000006           cmp word ptr [0], 6                ; data PRZEDM.TEST1
07ce  7509                 jne 0x7d9                         
07d0  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
07d3  051100               add ax, 0x11                      
07d6  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:660
07d9  833e000007           cmp word ptr [0], 7                ; data PRZEDM.TEST1
07de  7509                 jne 0x7e9                         
07e0  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
07e3  051200               add ax, 0x12                      
07e6  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:661
07e9  833e000008           cmp word ptr [0], 8                ; data PRZEDM.TEST1
07ee  7509                 jne 0x7f9                         
07f0  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
07f3  051300               add ax, 0x13                      
07f6  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:662
07f9  833e000009           cmp word ptr [0], 9                ; data PRZEDM.TEST1
07fe  7509                 jne 0x809                         
0800  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0803  051400               add ax, 0x14                      
0806  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:663
0809  833e000009           cmp word ptr [0], 9                ; data PRZEDM.TEST1
080e  7e09                 jle 0x819                         
0810  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0813  051500               add ax, 0x15                      
0816  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:665
0819  a10000               mov ax, word ptr [0]               ; data PRZEDM.SIL
081c  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.WROGSIL
0820  7509                 jne 0x82b                         
0822  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0825  050b00               add ax, 0xb                       
0828  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:666
082b  a10000               mov ax, word ptr [0]               ; data PRZEDM.ZRE
082e  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.WROGZRE
0832  7f03                 jg 0x837                          
0834  e9ed00               jmp 0x924                         
; PRZEDM.PAS:667
0837  a10000               mov ax, word ptr [0]               ; data PRZEDM.ZRE
083a  2b060000             sub ax, word ptr [0]               ; data PRZEDM.WROGZRE
083e  a30000               mov word ptr [0], ax               ; data PRZEDM.TEST1
; PRZEDM.PAS:668
0841  833e000001           cmp word ptr [0], 1                ; data PRZEDM.TEST1
0846  7407                 je 0x84f                          
0848  833e000002           cmp word ptr [0], 2                ; data PRZEDM.TEST1
084d  7509                 jne 0x858                         
084f  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0852  050a00               add ax, 0xa                       
0855  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:669
0858  833e000003           cmp word ptr [0], 3                ; data PRZEDM.TEST1
085d  7407                 je 0x866                          
085f  833e000004           cmp word ptr [0], 4                ; data PRZEDM.TEST1
0864  7509                 jne 0x86f                         
0866  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0869  050900               add ax, 9                         
086c  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:670
086f  833e000005           cmp word ptr [0], 5                ; data PRZEDM.TEST1
0874  7407                 je 0x87d                          
0876  833e000006           cmp word ptr [0], 6                ; data PRZEDM.TEST1
087b  7509                 jne 0x886                         
087d  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0880  050800               add ax, 8                         
0883  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:671
0886  833e000007           cmp word ptr [0], 7                ; data PRZEDM.TEST1
088b  7407                 je 0x894                          
088d  833e000008           cmp word ptr [0], 8                ; data PRZEDM.TEST1
0892  7509                 jne 0x89d                         
0894  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0897  050700               add ax, 7                         
089a  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:672
089d  833e000009           cmp word ptr [0], 9                ; data PRZEDM.TEST1
08a2  7407                 je 0x8ab                          
08a4  833e00000a           cmp word ptr [0], 0xa              ; data PRZEDM.TEST1
08a9  7509                 jne 0x8b4                         
08ab  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
08ae  050600               add ax, 6                         
08b1  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:673
08b4  833e00000b           cmp word ptr [0], 0xb              ; data PRZEDM.TEST1
08b9  7407                 je 0x8c2                          
08bb  833e00000c           cmp word ptr [0], 0xc              ; data PRZEDM.TEST1
08c0  7509                 jne 0x8cb                         
08c2  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
08c5  050500               add ax, 5                         
08c8  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:674
08cb  833e00000d           cmp word ptr [0], 0xd              ; data PRZEDM.TEST1
08d0  7407                 je 0x8d9                          
08d2  833e00000e           cmp word ptr [0], 0xe              ; data PRZEDM.TEST1
08d7  7509                 jne 0x8e2                         
08d9  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
08dc  050400               add ax, 4                         
08df  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:675
08e2  833e00000f           cmp word ptr [0], 0xf              ; data PRZEDM.TEST1
08e7  7407                 je 0x8f0                          
08e9  833e000010           cmp word ptr [0], 0x10             ; data PRZEDM.TEST1
08ee  7509                 jne 0x8f9                         
08f0  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
08f3  050300               add ax, 3                         
08f6  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:676
08f9  833e000011           cmp word ptr [0], 0x11             ; data PRZEDM.TEST1
08fe  7407                 je 0x907                          
0900  833e000012           cmp word ptr [0], 0x12             ; data PRZEDM.TEST1
0905  7508                 jne 0x90f                         
0907  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
090a  40                   inc ax                            
090b  40                   inc ax                            
090c  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:677
090f  833e000013           cmp word ptr [0], 0x13             ; data PRZEDM.TEST1
0914  7407                 je 0x91d                          
0916  833e000014           cmp word ptr [0], 0x14             ; data PRZEDM.TEST1
091b  7507                 jne 0x924                         
091d  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0920  40                   inc ax                            
0921  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:679
0924  a10000               mov ax, word ptr [0]               ; data PRZEDM.ZRE
0927  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.WROGZRE
092b  7c03                 jl 0x930                          
092d  e9f000               jmp 0xa20                         
; PRZEDM.PAS:680
0930  a10000               mov ax, word ptr [0]               ; data PRZEDM.WROGZRE
0933  2b060000             sub ax, word ptr [0]               ; data PRZEDM.ZRE
0937  a30000               mov word ptr [0], ax               ; data PRZEDM.TEST1
; PRZEDM.PAS:681
093a  833e000001           cmp word ptr [0], 1                ; data PRZEDM.TEST1
093f  7407                 je 0x948                          
0941  833e000002           cmp word ptr [0], 2                ; data PRZEDM.TEST1
0946  7509                 jne 0x951                         
0948  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
094b  050c00               add ax, 0xc                       
094e  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:682
0951  833e000003           cmp word ptr [0], 3                ; data PRZEDM.TEST1
0956  7407                 je 0x95f                          
0958  833e000004           cmp word ptr [0], 4                ; data PRZEDM.TEST1
095d  7509                 jne 0x968                         
095f  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0962  050d00               add ax, 0xd                       
0965  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:683
0968  833e000005           cmp word ptr [0], 5                ; data PRZEDM.TEST1
096d  7407                 je 0x976                          
096f  833e000006           cmp word ptr [0], 6                ; data PRZEDM.TEST1
0974  7509                 jne 0x97f                         
0976  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0979  050e00               add ax, 0xe                       
097c  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:684
097f  833e000007           cmp word ptr [0], 7                ; data PRZEDM.TEST1
0984  7407                 je 0x98d                          
0986  833e000008           cmp word ptr [0], 8                ; data PRZEDM.TEST1
098b  7509                 jne 0x996                         
098d  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0990  050f00               add ax, 0xf                       
0993  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:685
0996  833e000009           cmp word ptr [0], 9                ; data PRZEDM.TEST1
099b  7407                 je 0x9a4                          
099d  833e00000a           cmp word ptr [0], 0xa              ; data PRZEDM.TEST1
09a2  7509                 jne 0x9ad                         
09a4  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
09a7  051000               add ax, 0x10                      
09aa  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:686
09ad  833e00000b           cmp word ptr [0], 0xb              ; data PRZEDM.TEST1
09b2  7407                 je 0x9bb                          
09b4  833e00000c           cmp word ptr [0], 0xc              ; data PRZEDM.TEST1
09b9  7509                 jne 0x9c4                         
09bb  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
09be  051100               add ax, 0x11                      
09c1  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:687
09c4  833e00000d           cmp word ptr [0], 0xd              ; data PRZEDM.TEST1
09c9  7407                 je 0x9d2                          
09cb  833e00000e           cmp word ptr [0], 0xe              ; data PRZEDM.TEST1
09d0  7509                 jne 0x9db                         
09d2  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
09d5  051200               add ax, 0x12                      
09d8  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:688
09db  833e00000f           cmp word ptr [0], 0xf              ; data PRZEDM.TEST1
09e0  7407                 je 0x9e9                          
09e2  833e000010           cmp word ptr [0], 0x10             ; data PRZEDM.TEST1
09e7  7509                 jne 0x9f2                         
09e9  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
09ec  051300               add ax, 0x13                      
09ef  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:689
09f2  833e000011           cmp word ptr [0], 0x11             ; data PRZEDM.TEST1
09f7  7407                 je 0xa00                          
09f9  833e000012           cmp word ptr [0], 0x12             ; data PRZEDM.TEST1
09fe  7509                 jne 0xa09                         
0a00  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0a03  051400               add ax, 0x14                      
0a06  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:690
0a09  833e000013           cmp word ptr [0], 0x13             ; data PRZEDM.TEST1
0a0e  7407                 je 0xa17                          
0a10  833e000014           cmp word ptr [0], 0x14             ; data PRZEDM.TEST1
0a15  7509                 jne 0xa20                         
0a17  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0a1a  051500               add ax, 0x15                      
0a1d  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:693
0a20  a10000               mov ax, word ptr [0]               ; data PRZEDM.ZRE
0a23  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.WROGZRE
0a27  7509                 jne 0xa32                         
0a29  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
0a2c  050b00               add ax, 0xb                       
0a2f  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:696
0a32  31c0                 xor ax, ax                        
0a34  a30000               mov word ptr [0], ax               ; data PRZEDM.ON
; PRZEDM.PAS:697
0a37  31c0                 xor ax, ax                        
0a39  a30000               mov word ptr [0], ax               ; data PRZEDM.TY
; PRZEDM.PAS:698
0a3c  bf0000               mov di, 0                          ; data System.OUTPUT
0a3f  1e                   push ds                           
0a40  57                   push di                           
0a41  bf0000               mov di, 0                          ; string "WALCZYSZ - <<<<TWOJ WROG MA "
0a44  0e                   push cs                           
0a45  57                   push di                           
0a46  31c0                 xor ax, ax                        
0a48  50                   push ax                           
0a49  9a00000000           lcall 0, 0                         ; call System.WriteString
0a4e  a10000               mov ax, word ptr [0]               ; data PRZEDM.WROGEN
0a51  99                   cwd                               
0a52  52                   push dx                           
0a53  50                   push ax                           
0a54  31c0                 xor ax, ax                        
0a56  50                   push ax                           
0a57  9a00000000           lcall 0, 0                         ; call System.WriteInteger
0a5c  bf0000               mov di, 0                          ; string "%>>>><<<< A TY MASZ "
0a5f  0e                   push cs                           
0a60  57                   push di                           
0a61  31c0                 xor ax, ax                        
0a63  50                   push ax                           
0a64  9a00000000           lcall 0, 0                         ; call System.WriteString
0a69  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
0a6c  99                   cwd                               
0a6d  52                   push dx                           
0a6e  50                   push ax                           
0a6f  31c0                 xor ax, ax                        
0a71  50                   push ax                           
0a72  9a00000000           lcall 0, 0                         ; call System.WriteInteger
0a77  bf0000               mov di, 0                          ; string "% ENERGII>>>>>"
0a7a  0e                   push cs                           
0a7b  57                   push di                           
0a7c  31c0                 xor ax, ax                        
0a7e  50                   push ax                           
0a7f  9a00000000           lcall 0, 0                         ; call System.WriteString
0a84  9a00000000           lcall 0, 0                         ; call System.WriteLn
0a89  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:699
0a8e  a10000               mov ax, word ptr [0]               ; data PRZEDM.ZRE
0a91  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.WROGZRE
0a95  7f03                 jg 0xa9a                          
0a97  e9b002               jmp 0xd4a                         
; PRZEDM.PAS:700
0a9a  a10000               mov ax, word ptr [0]               ; data PRZEDM.ZRE
0a9d  2b060000             sub ax, word ptr [0]               ; data PRZEDM.WROGZRE
0aa1  a30000               mov word ptr [0], ax               ; data PRZEDM.SZANSA
; PRZEDM.PAS:701
0aa4  833e00001e           cmp word ptr [0], 0x1e             ; data PRZEDM.SZANSA
0aa9  7e0c                 jle 0xab7                         
0aab  b80c00               mov ax, 0xc                       
0aae  50                   push ax                           
0aaf  9a00000000           lcall 0, 0                         ; call System.Random
0ab4  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:702
0ab7  833e00001b           cmp word ptr [0], 0x1b             ; data PRZEDM.SZANSA
0abc  7e13                 jle 0xad1                         
0abe  833e00001f           cmp word ptr [0], 0x1f             ; data PRZEDM.SZANSA
0ac3  7d0c                 jge 0xad1                         
0ac5  b80d00               mov ax, 0xd                       
0ac8  50                   push ax                           
0ac9  9a00000000           lcall 0, 0                         ; call System.Random
0ace  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:703
0ad1  833e000018           cmp word ptr [0], 0x18             ; data PRZEDM.SZANSA
0ad6  7e13                 jle 0xaeb                         
0ad8  833e00001c           cmp word ptr [0], 0x1c             ; data PRZEDM.SZANSA
0add  7d0c                 jge 0xaeb                         
0adf  b80e00               mov ax, 0xe                       
0ae2  50                   push ax                           
0ae3  9a00000000           lcall 0, 0                         ; call System.Random
0ae8  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:704
0aeb  833e000014           cmp word ptr [0], 0x14             ; data PRZEDM.SZANSA
0af0  7e13                 jle 0xb05                         
0af2  833e00001f           cmp word ptr [0], 0x1f             ; data PRZEDM.SZANSA
0af7  7d0c                 jge 0xb05                         
0af9  b80f00               mov ax, 0xf                       
0afc  50                   push ax                           
0afd  9a00000000           lcall 0, 0                         ; call System.Random
0b02  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:705
0b05  833e000012           cmp word ptr [0], 0x12             ; data PRZEDM.SZANSA
0b0a  7e13                 jle 0xb1f                         
0b0c  833e000015           cmp word ptr [0], 0x15             ; data PRZEDM.SZANSA
0b11  7d0c                 jge 0xb1f                         
0b13  b81000               mov ax, 0x10                      
0b16  50                   push ax                           
0b17  9a00000000           lcall 0, 0                         ; call System.Random
0b1c  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:706
0b1f  833e000010           cmp word ptr [0], 0x10             ; data PRZEDM.SZANSA
0b24  7e13                 jle 0xb39                         
0b26  833e000013           cmp word ptr [0], 0x13             ; data PRZEDM.SZANSA
0b2b  7d0c                 jge 0xb39                         
0b2d  b81100               mov ax, 0x11                      
0b30  50                   push ax                           
0b31  9a00000000           lcall 0, 0                         ; call System.Random
0b36  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:707
0b39  833e00000c           cmp word ptr [0], 0xc              ; data PRZEDM.SZANSA
0b3e  7e13                 jle 0xb53                         
0b40  833e000011           cmp word ptr [0], 0x11             ; data PRZEDM.SZANSA
0b45  7d0c                 jge 0xb53                         
0b47  b81200               mov ax, 0x12                      
0b4a  50                   push ax                           
0b4b  9a00000000           lcall 0, 0                         ; call System.Random
0b50  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:708
0b53  833e000009           cmp word ptr [0], 9                ; data PRZEDM.SZANSA
0b58  7e13                 jle 0xb6d                         
0b5a  833e00000d           cmp word ptr [0], 0xd              ; data PRZEDM.SZANSA
0b5f  7d0c                 jge 0xb6d                         
0b61  b81300               mov ax, 0x13                      
0b64  50                   push ax                           
0b65  9a00000000           lcall 0, 0                         ; call System.Random
0b6a  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:709
0b6d  833e000006           cmp word ptr [0], 6                ; data PRZEDM.SZANSA
0b72  7e13                 jle 0xb87                         
0b74  833e00000a           cmp word ptr [0], 0xa              ; data PRZEDM.SZANSA
0b79  7d0c                 jge 0xb87                         
0b7b  b81400               mov ax, 0x14                      
0b7e  50                   push ax                           
0b7f  9a00000000           lcall 0, 0                         ; call System.Random
0b84  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:710
0b87  833e000004           cmp word ptr [0], 4                ; data PRZEDM.SZANSA
0b8c  7e13                 jle 0xba1                         
0b8e  833e000007           cmp word ptr [0], 7                ; data PRZEDM.SZANSA
0b93  7d0c                 jge 0xba1                         
0b95  b81500               mov ax, 0x15                      
0b98  50                   push ax                           
0b99  9a00000000           lcall 0, 0                         ; call System.Random
0b9e  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:711
0ba1  833e000002           cmp word ptr [0], 2                ; data PRZEDM.SZANSA
0ba6  7e13                 jle 0xbbb                         
0ba8  833e000005           cmp word ptr [0], 5                ; data PRZEDM.SZANSA
0bad  7d0c                 jge 0xbbb                         
0baf  b81600               mov ax, 0x16                      
0bb2  50                   push ax                           
0bb3  9a00000000           lcall 0, 0                         ; call System.Random
0bb8  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:712
0bbb  833e000003           cmp word ptr [0], 3                ; data PRZEDM.SZANSA
0bc0  7d0c                 jge 0xbce                         
0bc2  b81700               mov ax, 0x17                      
0bc5  50                   push ax                           
0bc6  9a00000000           lcall 0, 0                         ; call System.Random
0bcb  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:713
0bce  833e00000a           cmp word ptr [0], 0xa              ; data PRZEDM.FUKS
0bd3  7d22                 jge 0xbf7                         
; PRZEDM.PAS:714
0bd5  bf0000               mov di, 0                          ; data System.OUTPUT
0bd8  1e                   push ds                           
0bd9  57                   push di                           
0bda  bf0000               mov di, 0                          ; string "UNIKASZ CIOSU WROGA TWEGO I SMIEJESZ SIE Z JEGO NIEPORADNOSCI"
0bdd  0e                   push cs                           
0bde  57                   push di                           
0bdf  31c0                 xor ax, ax                        
0be1  50                   push ax                           
0be2  9a00000000           lcall 0, 0                         ; call System.WriteString
0be7  9a00000000           lcall 0, 0                         ; call System.WriteLn
0bec  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:715
0bf1  c70600000100         mov word ptr [0], 1                ; data PRZEDM.TY
; PRZEDM.PAS:717
0bf7  833e00001e           cmp word ptr [0], 0x1e             ; data PRZEDM.SZANSA
0bfc  7e0c                 jle 0xc0a                         
0bfe  b83c00               mov ax, 0x3c                      
0c01  50                   push ax                           
0c02  9a00000000           lcall 0, 0                         ; call System.Random
0c07  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:718
0c0a  833e00001b           cmp word ptr [0], 0x1b             ; data PRZEDM.SZANSA
0c0f  7e13                 jle 0xc24                         
0c11  833e00001f           cmp word ptr [0], 0x1f             ; data PRZEDM.SZANSA
0c16  7d0c                 jge 0xc24                         
0c18  b83a00               mov ax, 0x3a                      
0c1b  50                   push ax                           
0c1c  9a00000000           lcall 0, 0                         ; call System.Random
0c21  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:719
0c24  833e000018           cmp word ptr [0], 0x18             ; data PRZEDM.SZANSA
0c29  7e13                 jle 0xc3e                         
0c2b  833e00001c           cmp word ptr [0], 0x1c             ; data PRZEDM.SZANSA
0c30  7d0c                 jge 0xc3e                         
0c32  b83800               mov ax, 0x38                      
0c35  50                   push ax                           
0c36  9a00000000           lcall 0, 0                         ; call System.Random
0c3b  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:720
0c3e  833e000014           cmp word ptr [0], 0x14             ; data PRZEDM.SZANSA
0c43  7e13                 jle 0xc58                         
0c45  833e00001f           cmp word ptr [0], 0x1f             ; data PRZEDM.SZANSA
0c4a  7d0c                 jge 0xc58                         
0c4c  b83600               mov ax, 0x36                      
0c4f  50                   push ax                           
0c50  9a00000000           lcall 0, 0                         ; call System.Random
0c55  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:721
0c58  833e000012           cmp word ptr [0], 0x12             ; data PRZEDM.SZANSA
0c5d  7e13                 jle 0xc72                         
0c5f  833e000015           cmp word ptr [0], 0x15             ; data PRZEDM.SZANSA
0c64  7d0c                 jge 0xc72                         
0c66  b83400               mov ax, 0x34                      
0c69  50                   push ax                           
0c6a  9a00000000           lcall 0, 0                         ; call System.Random
0c6f  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:722
0c72  833e000010           cmp word ptr [0], 0x10             ; data PRZEDM.SZANSA
0c77  7e13                 jle 0xc8c                         
0c79  833e000013           cmp word ptr [0], 0x13             ; data PRZEDM.SZANSA
0c7e  7d0c                 jge 0xc8c                         
0c80  b83300               mov ax, 0x33                      
0c83  50                   push ax                           
0c84  9a00000000           lcall 0, 0                         ; call System.Random
0c89  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:723
0c8c  833e00000c           cmp word ptr [0], 0xc              ; data PRZEDM.SZANSA
0c91  7e13                 jle 0xca6                         
0c93  833e000011           cmp word ptr [0], 0x11             ; data PRZEDM.SZANSA
0c98  7d0c                 jge 0xca6                         
0c9a  b83000               mov ax, 0x30                      
0c9d  50                   push ax                           
0c9e  9a00000000           lcall 0, 0                         ; call System.Random
0ca3  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:724
0ca6  833e000009           cmp word ptr [0], 9                ; data PRZEDM.SZANSA
0cab  7e13                 jle 0xcc0                         
0cad  833e00000d           cmp word ptr [0], 0xd              ; data PRZEDM.SZANSA
0cb2  7d0c                 jge 0xcc0                         
0cb4  b82e00               mov ax, 0x2e                      
0cb7  50                   push ax                           
0cb8  9a00000000           lcall 0, 0                         ; call System.Random
0cbd  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:725
0cc0  833e000006           cmp word ptr [0], 6                ; data PRZEDM.SZANSA
0cc5  7e13                 jle 0xcda                         
0cc7  833e00000a           cmp word ptr [0], 0xa              ; data PRZEDM.SZANSA
0ccc  7d0c                 jge 0xcda                         
0cce  b82a00               mov ax, 0x2a                      
0cd1  50                   push ax                           
0cd2  9a00000000           lcall 0, 0                         ; call System.Random
0cd7  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:726
0cda  833e000004           cmp word ptr [0], 4                ; data PRZEDM.SZANSA
0cdf  7e13                 jle 0xcf4                         
0ce1  833e000007           cmp word ptr [0], 7                ; data PRZEDM.SZANSA
0ce6  7d0c                 jge 0xcf4                         
0ce8  b82800               mov ax, 0x28                      
0ceb  50                   push ax                           
0cec  9a00000000           lcall 0, 0                         ; call System.Random
0cf1  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:727
0cf4  833e000002           cmp word ptr [0], 2                ; data PRZEDM.SZANSA
0cf9  7e13                 jle 0xd0e                         
0cfb  833e000005           cmp word ptr [0], 5                ; data PRZEDM.SZANSA
0d00  7d0c                 jge 0xd0e                         
0d02  b82600               mov ax, 0x26                      
0d05  50                   push ax                           
0d06  9a00000000           lcall 0, 0                         ; call System.Random
0d0b  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:728
0d0e  833e000003           cmp word ptr [0], 3                ; data PRZEDM.SZANSA
0d13  7d0c                 jge 0xd21                         
0d15  b82300               mov ax, 0x23                      
0d18  50                   push ax                           
0d19  9a00000000           lcall 0, 0                         ; call System.Random
0d1e  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:729
0d21  833e00000a           cmp word ptr [0], 0xa              ; data PRZEDM.FUKS
0d26  7d22                 jge 0xd4a                         
; PRZEDM.PAS:730
0d28  bf0000               mov di, 0                          ; data System.OUTPUT
0d2b  1e                   push ds                           
0d2c  57                   push di                           
0d2d  bf0000               mov di, 0                          ; string "PRZECIWNIK UNIKA TWOJEGO LAMERSKIEGO ATAKU"
0d30  0e                   push cs                           
0d31  57                   push di                           
0d32  31c0                 xor ax, ax                        
0d34  50                   push ax                           
0d35  9a00000000           lcall 0, 0                         ; call System.WriteString
0d3a  9a00000000           lcall 0, 0                         ; call System.WriteLn
0d3f  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:731
0d44  c70600000100         mov word ptr [0], 1                ; data PRZEDM.ON
; PRZEDM.PAS:734
0d4a  a10000               mov ax, word ptr [0]               ; data PRZEDM.WROGZRE
0d4d  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.ZRE
0d51  7f03                 jg 0xd56                          
0d53  e9b002               jmp 0x1006                        
; PRZEDM.PAS:735
0d56  a10000               mov ax, word ptr [0]               ; data PRZEDM.WROGZRE
0d59  2b060000             sub ax, word ptr [0]               ; data PRZEDM.ZRE
0d5d  a30000               mov word ptr [0], ax               ; data PRZEDM.SZANSA
; PRZEDM.PAS:736
0d60  833e00001e           cmp word ptr [0], 0x1e             ; data PRZEDM.SZANSA
0d65  7e0c                 jle 0xd73                         
0d67  b80c00               mov ax, 0xc                       
0d6a  50                   push ax                           
0d6b  9a00000000           lcall 0, 0                         ; call System.Random
0d70  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:737
0d73  833e00001b           cmp word ptr [0], 0x1b             ; data PRZEDM.SZANSA
0d78  7e13                 jle 0xd8d                         
0d7a  833e00001f           cmp word ptr [0], 0x1f             ; data PRZEDM.SZANSA
0d7f  7d0c                 jge 0xd8d                         
0d81  b80d00               mov ax, 0xd                       
0d84  50                   push ax                           
0d85  9a00000000           lcall 0, 0                         ; call System.Random
0d8a  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:738
0d8d  833e000018           cmp word ptr [0], 0x18             ; data PRZEDM.SZANSA
0d92  7e13                 jle 0xda7                         
0d94  833e00001c           cmp word ptr [0], 0x1c             ; data PRZEDM.SZANSA
0d99  7d0c                 jge 0xda7                         
0d9b  b80e00               mov ax, 0xe                       
0d9e  50                   push ax                           
0d9f  9a00000000           lcall 0, 0                         ; call System.Random
0da4  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:739
0da7  833e000014           cmp word ptr [0], 0x14             ; data PRZEDM.SZANSA
0dac  7e13                 jle 0xdc1                         
0dae  833e00001f           cmp word ptr [0], 0x1f             ; data PRZEDM.SZANSA
0db3  7d0c                 jge 0xdc1                         
0db5  b80f00               mov ax, 0xf                       
0db8  50                   push ax                           
0db9  9a00000000           lcall 0, 0                         ; call System.Random
0dbe  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:740
0dc1  833e000012           cmp word ptr [0], 0x12             ; data PRZEDM.SZANSA
0dc6  7e13                 jle 0xddb                         
0dc8  833e000015           cmp word ptr [0], 0x15             ; data PRZEDM.SZANSA
0dcd  7d0c                 jge 0xddb                         
0dcf  b81000               mov ax, 0x10                      
0dd2  50                   push ax                           
0dd3  9a00000000           lcall 0, 0                         ; call System.Random
0dd8  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:741
0ddb  833e000010           cmp word ptr [0], 0x10             ; data PRZEDM.SZANSA
0de0  7e13                 jle 0xdf5                         
0de2  833e000013           cmp word ptr [0], 0x13             ; data PRZEDM.SZANSA
0de7  7d0c                 jge 0xdf5                         
0de9  b81100               mov ax, 0x11                      
0dec  50                   push ax                           
0ded  9a00000000           lcall 0, 0                         ; call System.Random
0df2  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:742
0df5  833e00000c           cmp word ptr [0], 0xc              ; data PRZEDM.SZANSA
0dfa  7e13                 jle 0xe0f                         
0dfc  833e000011           cmp word ptr [0], 0x11             ; data PRZEDM.SZANSA
0e01  7d0c                 jge 0xe0f                         
0e03  b81200               mov ax, 0x12                      
0e06  50                   push ax                           
0e07  9a00000000           lcall 0, 0                         ; call System.Random
0e0c  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:743
0e0f  833e000009           cmp word ptr [0], 9                ; data PRZEDM.SZANSA
0e14  7e13                 jle 0xe29                         
0e16  833e00000d           cmp word ptr [0], 0xd              ; data PRZEDM.SZANSA
0e1b  7d0c                 jge 0xe29                         
0e1d  b81300               mov ax, 0x13                      
0e20  50                   push ax                           
0e21  9a00000000           lcall 0, 0                         ; call System.Random
0e26  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:744
0e29  833e000006           cmp word ptr [0], 6                ; data PRZEDM.SZANSA
0e2e  7e13                 jle 0xe43                         
0e30  833e00000a           cmp word ptr [0], 0xa              ; data PRZEDM.SZANSA
0e35  7d0c                 jge 0xe43                         
0e37  b81400               mov ax, 0x14                      
0e3a  50                   push ax                           
0e3b  9a00000000           lcall 0, 0                         ; call System.Random
0e40  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:745
0e43  833e000004           cmp word ptr [0], 4                ; data PRZEDM.SZANSA
0e48  7e13                 jle 0xe5d                         
0e4a  833e000007           cmp word ptr [0], 7                ; data PRZEDM.SZANSA
0e4f  7d0c                 jge 0xe5d                         
0e51  b81500               mov ax, 0x15                      
0e54  50                   push ax                           
0e55  9a00000000           lcall 0, 0                         ; call System.Random
0e5a  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:746
0e5d  833e000002           cmp word ptr [0], 2                ; data PRZEDM.SZANSA
0e62  7e13                 jle 0xe77                         
0e64  833e000005           cmp word ptr [0], 5                ; data PRZEDM.SZANSA
0e69  7d0c                 jge 0xe77                         
0e6b  b81600               mov ax, 0x16                      
0e6e  50                   push ax                           
0e6f  9a00000000           lcall 0, 0                         ; call System.Random
0e74  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:747
0e77  833e000003           cmp word ptr [0], 3                ; data PRZEDM.SZANSA
0e7c  7d0c                 jge 0xe8a                         
0e7e  b81700               mov ax, 0x17                      
0e81  50                   push ax                           
0e82  9a00000000           lcall 0, 0                         ; call System.Random
0e87  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:748
0e8a  833e00000a           cmp word ptr [0], 0xa              ; data PRZEDM.FUKS
0e8f  7d22                 jge 0xeb3                         
; PRZEDM.PAS:749
0e91  bf0000               mov di, 0                          ; data System.OUTPUT
0e94  1e                   push ds                           
0e95  57                   push di                           
0e96  bf0000               mov di, 0                          ; string "PRZECIWNIK Z GRACJA UNIKA TWEGO CIOSU"
0e99  0e                   push cs                           
0e9a  57                   push di                           
0e9b  31c0                 xor ax, ax                        
0e9d  50                   push ax                           
0e9e  9a00000000           lcall 0, 0                         ; call System.WriteString
0ea3  9a00000000           lcall 0, 0                         ; call System.WriteLn
0ea8  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:750
0ead  c70600000100         mov word ptr [0], 1                ; data PRZEDM.ON
; PRZEDM.PAS:752
0eb3  833e00001e           cmp word ptr [0], 0x1e             ; data PRZEDM.SZANSA
0eb8  7e0c                 jle 0xec6                         
0eba  b83c00               mov ax, 0x3c                      
0ebd  50                   push ax                           
0ebe  9a00000000           lcall 0, 0                         ; call System.Random
0ec3  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:753
0ec6  833e00001b           cmp word ptr [0], 0x1b             ; data PRZEDM.SZANSA
0ecb  7e13                 jle 0xee0                         
0ecd  833e00001f           cmp word ptr [0], 0x1f             ; data PRZEDM.SZANSA
0ed2  7d0c                 jge 0xee0                         
0ed4  b83a00               mov ax, 0x3a                      
0ed7  50                   push ax                           
0ed8  9a00000000           lcall 0, 0                         ; call System.Random
0edd  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:754
0ee0  833e000018           cmp word ptr [0], 0x18             ; data PRZEDM.SZANSA
0ee5  7e13                 jle 0xefa                         
0ee7  833e00001c           cmp word ptr [0], 0x1c             ; data PRZEDM.SZANSA
0eec  7d0c                 jge 0xefa                         
0eee  b83800               mov ax, 0x38                      
0ef1  50                   push ax                           
0ef2  9a00000000           lcall 0, 0                         ; call System.Random
0ef7  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:755
0efa  833e000014           cmp word ptr [0], 0x14             ; data PRZEDM.SZANSA
0eff  7e13                 jle 0xf14                         
0f01  833e00001f           cmp word ptr [0], 0x1f             ; data PRZEDM.SZANSA
0f06  7d0c                 jge 0xf14                         
0f08  b83600               mov ax, 0x36                      
0f0b  50                   push ax                           
0f0c  9a00000000           lcall 0, 0                         ; call System.Random
0f11  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:756
0f14  833e000012           cmp word ptr [0], 0x12             ; data PRZEDM.SZANSA
0f19  7e13                 jle 0xf2e                         
0f1b  833e000015           cmp word ptr [0], 0x15             ; data PRZEDM.SZANSA
0f20  7d0c                 jge 0xf2e                         
0f22  b83400               mov ax, 0x34                      
0f25  50                   push ax                           
0f26  9a00000000           lcall 0, 0                         ; call System.Random
0f2b  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:757
0f2e  833e000010           cmp word ptr [0], 0x10             ; data PRZEDM.SZANSA
0f33  7e13                 jle 0xf48                         
0f35  833e000013           cmp word ptr [0], 0x13             ; data PRZEDM.SZANSA
0f3a  7d0c                 jge 0xf48                         
0f3c  b83300               mov ax, 0x33                      
0f3f  50                   push ax                           
0f40  9a00000000           lcall 0, 0                         ; call System.Random
0f45  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:758
0f48  833e00000c           cmp word ptr [0], 0xc              ; data PRZEDM.SZANSA
0f4d  7e13                 jle 0xf62                         
0f4f  833e000011           cmp word ptr [0], 0x11             ; data PRZEDM.SZANSA
0f54  7d0c                 jge 0xf62                         
0f56  b83000               mov ax, 0x30                      
0f59  50                   push ax                           
0f5a  9a00000000           lcall 0, 0                         ; call System.Random
0f5f  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:759
0f62  833e000009           cmp word ptr [0], 9                ; data PRZEDM.SZANSA
0f67  7e13                 jle 0xf7c                         
0f69  833e00000d           cmp word ptr [0], 0xd              ; data PRZEDM.SZANSA
0f6e  7d0c                 jge 0xf7c                         
0f70  b82e00               mov ax, 0x2e                      
0f73  50                   push ax                           
0f74  9a00000000           lcall 0, 0                         ; call System.Random
0f79  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:760
0f7c  833e000006           cmp word ptr [0], 6                ; data PRZEDM.SZANSA
0f81  7e13                 jle 0xf96                         
0f83  833e00000a           cmp word ptr [0], 0xa              ; data PRZEDM.SZANSA
0f88  7d0c                 jge 0xf96                         
0f8a  b82a00               mov ax, 0x2a                      
0f8d  50                   push ax                           
0f8e  9a00000000           lcall 0, 0                         ; call System.Random
0f93  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:761
0f96  833e000004           cmp word ptr [0], 4                ; data PRZEDM.SZANSA
0f9b  7e13                 jle 0xfb0                         
0f9d  833e000007           cmp word ptr [0], 7                ; data PRZEDM.SZANSA
0fa2  7d0c                 jge 0xfb0                         
0fa4  b82800               mov ax, 0x28                      
0fa7  50                   push ax                           
0fa8  9a00000000           lcall 0, 0                         ; call System.Random
0fad  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:762
0fb0  833e000002           cmp word ptr [0], 2                ; data PRZEDM.SZANSA
0fb5  7e13                 jle 0xfca                         
0fb7  833e000005           cmp word ptr [0], 5                ; data PRZEDM.SZANSA
0fbc  7d0c                 jge 0xfca                         
0fbe  b82600               mov ax, 0x26                      
0fc1  50                   push ax                           
0fc2  9a00000000           lcall 0, 0                         ; call System.Random
0fc7  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:763
0fca  833e000003           cmp word ptr [0], 3                ; data PRZEDM.SZANSA
0fcf  7d0c                 jge 0xfdd                         
0fd1  b82300               mov ax, 0x23                      
0fd4  50                   push ax                           
0fd5  9a00000000           lcall 0, 0                         ; call System.Random
0fda  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:764
0fdd  833e00000a           cmp word ptr [0], 0xa              ; data PRZEDM.FUKS
0fe2  7d22                 jge 0x1006                        
; PRZEDM.PAS:765
0fe4  bf0000               mov di, 0                          ; data System.OUTPUT
0fe7  1e                   push ds                           
0fe8  57                   push di                           
0fe9  bf0000               mov di, 0                          ; string "BEZ PARDONU OMIJASZ CIOS TWOJEGO PRZECIWNIKA"
0fec  0e                   push cs                           
0fed  57                   push di                           
0fee  31c0                 xor ax, ax                        
0ff0  50                   push ax                           
0ff1  9a00000000           lcall 0, 0                         ; call System.WriteString
0ff6  9a00000000           lcall 0, 0                         ; call System.WriteLn
0ffb  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:766
1000  c70600000100         mov word ptr [0], 1                ; data PRZEDM.TY
; PRZEDM.PAS:770
1006  833e000000           cmp word ptr [0], 0                ; data PRZEDM.TY
100b  7403                 je 0x1010                         
100d  e97c03               jmp 0x138c                        
; PRZEDM.PAS:771
1010  ff360000             push word ptr [0]                  ; data PRZEDM.WROGSIL
1014  9a00000000           lcall 0, 0                         ; call System.Random
1019  a30000               mov word ptr [0], ax               ; data PRZEDM.WPYSK
; PRZEDM.PAS:772
101c  833e000006           cmp word ptr [0], 6                ; data PRZEDM.WPYSK
1021  7d37                 jge 0x105a                        
1023  bf0000               mov di, 0                          ; data System.OUTPUT
1026  1e                   push ds                           
1027  57                   push di                           
1028  bf0000               mov di, 0                          ; string "PRZECIWNIK CIE TYLKO DRASNA I TRACISZ "
102b  0e                   push cs                           
102c  57                   push di                           
102d  31c0                 xor ax, ax                        
102f  50                   push ax                           
1030  9a00000000           lcall 0, 0                         ; call System.WriteString
1035  a10000               mov ax, word ptr [0]               ; data PRZEDM.WPYSK
1038  99                   cwd                               
1039  52                   push dx                           
103a  50                   push ax                           
103b  31c0                 xor ax, ax                        
103d  50                   push ax                           
103e  9a00000000           lcall 0, 0                         ; call System.WriteInteger
1043  bf0000               mov di, 0                          ; string "% ENERGII"
1046  0e                   push cs                           
1047  57                   push di                           
1048  31c0                 xor ax, ax                        
104a  50                   push ax                           
104b  9a00000000           lcall 0, 0                         ; call System.WriteString
1050  9a00000000           lcall 0, 0                         ; call System.WriteLn
1055  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:773
105a  833e000005           cmp word ptr [0], 5                ; data PRZEDM.WPYSK
105f  7e3e                 jle 0x109f                        
1061  833e000015           cmp word ptr [0], 0x15             ; data PRZEDM.WPYSK
1066  7d37                 jge 0x109f                        
1068  bf0000               mov di, 0                          ; data System.OUTPUT
106b  1e                   push ds                           
106c  57                   push di                           
106d  bf0000               mov di, 0                          ; string "DOSTALES I TRACISZ "
1070  0e                   push cs                           
1071  57                   push di                           
1072  31c0                 xor ax, ax                        
1074  50                   push ax                           
1075  9a00000000           lcall 0, 0                         ; call System.WriteString
107a  a10000               mov ax, word ptr [0]               ; data PRZEDM.WPYSK
107d  99                   cwd                               
107e  52                   push dx                           
107f  50                   push ax                           
1080  31c0                 xor ax, ax                        
1082  50                   push ax                           
1083  9a00000000           lcall 0, 0                         ; call System.WriteInteger
1088  bf0000               mov di, 0                          ; string "% ENERGII"
108b  0e                   push cs                           
108c  57                   push di                           
108d  31c0                 xor ax, ax                        
108f  50                   push ax                           
1090  9a00000000           lcall 0, 0                         ; call System.WriteString
1095  9a00000000           lcall 0, 0                         ; call System.WriteLn
109a  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:774
109f  833e000014           cmp word ptr [0], 0x14             ; data PRZEDM.WPYSK
10a4  7e3e                 jle 0x10e4                        
10a6  833e000033           cmp word ptr [0], 0x33             ; data PRZEDM.WPYSK
10ab  7d37                 jge 0x10e4                        
10ad  bf0000               mov di, 0                          ; data System.OUTPUT
10b0  1e                   push ds                           
10b1  57                   push di                           
10b2  bf0000               mov di, 0                          ; string "PRZECIWNIK !MASAKRUJE! CIEBIE I TRACISZ AZ "
10b5  0e                   push cs                           
10b6  57                   push di                           
10b7  31c0                 xor ax, ax                        
10b9  50                   push ax                           
10ba  9a00000000           lcall 0, 0                         ; call System.WriteString
10bf  a10000               mov ax, word ptr [0]               ; data PRZEDM.WPYSK
10c2  99                   cwd                               
10c3  52                   push dx                           
10c4  50                   push ax                           
10c5  31c0                 xor ax, ax                        
10c7  50                   push ax                           
10c8  9a00000000           lcall 0, 0                         ; call System.WriteInteger
10cd  bf0000               mov di, 0                          ; string "% ENERGII"
10d0  0e                   push cs                           
10d1  57                   push di                           
10d2  31c0                 xor ax, ax                        
10d4  50                   push ax                           
10d5  9a00000000           lcall 0, 0                         ; call System.WriteString
10da  9a00000000           lcall 0, 0                         ; call System.WriteLn
10df  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:775
10e4  833e000032           cmp word ptr [0], 0x32             ; data PRZEDM.WPYSK
10e9  7e37                 jle 0x1122                        
10eb  bf0000               mov di, 0                          ; data System.OUTPUT
10ee  1e                   push ds                           
10ef  57                   push di                           
10f0  bf0000               mov di, 0                          ; string "PRZECIWNIK !!!WYPRUWA FLAKI!!! Z CIEBIE I TRACISZ !!! "
10f3  0e                   push cs                           
10f4  57                   push di                           
10f5  31c0                 xor ax, ax                        
10f7  50                   push ax                           
10f8  9a00000000           lcall 0, 0                         ; call System.WriteString
10fd  a10000               mov ax, word ptr [0]               ; data PRZEDM.WPYSK
1100  99                   cwd                               
1101  52                   push dx                           
1102  50                   push ax                           
1103  31c0                 xor ax, ax                        
1105  50                   push ax                           
1106  9a00000000           lcall 0, 0                         ; call System.WriteInteger
110b  bf0000               mov di, 0                          ; string "% ENERGII"
110e  0e                   push cs                           
110f  57                   push di                           
1110  31c0                 xor ax, ax                        
1112  50                   push ax                           
1113  9a00000000           lcall 0, 0                         ; call System.WriteString
1118  9a00000000           lcall 0, 0                         ; call System.WriteLn
111d  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:776
1122  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
1125  40                   inc ax                            
1126  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:777
1129  0e                   push cs                           
112a  e80000               call 0x112d                        ; call PRZEDM.TARCZA
; PRZEDM.PAS:778
112d  833e000000           cmp word ptr [0], 0                ; data PRZEDM.PAR
1132  7f03                 jg 0x1137                         
1134  e91801               jmp 0x124f                        
1137  833e000000           cmp word ptr [0], 0                ; data PRZEDM.WPYSK
113c  7f03                 jg 0x1141                         
113e  e90e01               jmp 0x124f                        
; PRZEDM.PAS:779
1141  b88c00               mov ax, 0x8c                      
1144  50                   push ax                           
1145  9a00000000           lcall 0, 0                         ; call System.Random
114a  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:780
114d  a10000               mov ax, word ptr [0]               ; data PRZEDM.FUKS
1150  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.PAR
1154  7e03                 jle 0x1159                        
1156  e9f600               jmp 0x124f                        
; PRZEDM.PAS:781
1159  833e000003           cmp word ptr [0], 3                ; data PRZEDM.WPYSK
115e  7d21                 jge 0x1181                        
; PRZEDM.PAS:782
1160  bf0000               mov di, 0                          ; data System.OUTPUT
1163  1e                   push ds                           
1164  57                   push di                           
1165  bf0000               mov di, 0                          ; string "            <<<<<ODPAROWUJESZ ATAK PRZECIWNIKA !!! TRACISZ 0% ENERGI"
1168  0e                   push cs                           
1169  57                   push di                           
116a  31c0                 xor ax, ax                        
116c  50                   push ax                           
116d  9a00000000           lcall 0, 0                         ; call System.WriteString
1172  9a00000000           lcall 0, 0                         ; call System.WriteLn
1177  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:783
117c  31c0                 xor ax, ax                        
117e  a30000               mov word ptr [0], ax               ; data PRZEDM.WPYSK
; PRZEDM.PAS:785
1181  833e000002           cmp word ptr [0], 2                ; data PRZEDM.WPYSK
1186  7e46                 jle 0x11ce                        
1188  833e00000a           cmp word ptr [0], 0xa              ; data PRZEDM.WPYSK
118d  7d3f                 jge 0x11ce                        
; PRZEDM.PAS:786
118f  a10000               mov ax, word ptr [0]               ; data PRZEDM.WPYSK
1192  48                   dec ax                            
1193  48                   dec ax                            
1194  a30000               mov word ptr [0], ax               ; data PRZEDM.WPYSK
; PRZEDM.PAS:787
1197  bf0000               mov di, 0                          ; data System.OUTPUT
119a  1e                   push ds                           
119b  57                   push di                           
119c  bf0000               mov di, 0                          ; string "            <<<<<ODPAROWUJESZ ATAK PRZECIWNIKA !!! TRACISZ "
119f  0e                   push cs                           
11a0  57                   push di                           
11a1  31c0                 xor ax, ax                        
11a3  50                   push ax                           
11a4  9a00000000           lcall 0, 0                         ; call System.WriteString
11a9  a10000               mov ax, word ptr [0]               ; data PRZEDM.WPYSK
11ac  99                   cwd                               
11ad  52                   push dx                           
11ae  50                   push ax                           
11af  31c0                 xor ax, ax                        
11b1  50                   push ax                           
11b2  9a00000000           lcall 0, 0                         ; call System.WriteInteger
11b7  bf0000               mov di, 0                          ; string "% ENERGI"
11ba  0e                   push cs                           
11bb  57                   push di                           
11bc  31c0                 xor ax, ax                        
11be  50                   push ax                           
11bf  9a00000000           lcall 0, 0                         ; call System.WriteString
11c4  9a00000000           lcall 0, 0                         ; call System.WriteLn
11c9  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:789
11ce  833e000009           cmp word ptr [0], 9                ; data PRZEDM.WPYSK
11d3  7e40                 jle 0x1215                        
; PRZEDM.PAS:790
11d5  a10000               mov ax, word ptr [0]               ; data PRZEDM.WPYSK
11d8  2d0300               sub ax, 3                         
11db  a30000               mov word ptr [0], ax               ; data PRZEDM.WPYSK
; PRZEDM.PAS:791
11de  bf0000               mov di, 0                          ; data System.OUTPUT
11e1  1e                   push ds                           
11e2  57                   push di                           
11e3  bf0000               mov di, 0                          ; string "            <<<<<ODPAROWUJESZ ATAK PRZECIWNIKA !!! TRACISZ "
11e6  0e                   push cs                           
11e7  57                   push di                           
11e8  31c0                 xor ax, ax                        
11ea  50                   push ax                           
11eb  9a00000000           lcall 0, 0                         ; call System.WriteString
11f0  a10000               mov ax, word ptr [0]               ; data PRZEDM.WPYSK
11f3  99                   cwd                               
11f4  52                   push dx                           
11f5  50                   push ax                           
11f6  31c0                 xor ax, ax                        
11f8  50                   push ax                           
11f9  9a00000000           lcall 0, 0                         ; call System.WriteInteger
11fe  bf0000               mov di, 0                          ; string "% ENERGI"
1201  0e                   push cs                           
1202  57                   push di                           
1203  31c0                 xor ax, ax                        
1205  50                   push ax                           
1206  9a00000000           lcall 0, 0                         ; call System.WriteString
120b  9a00000000           lcall 0, 0                         ; call System.WriteLn
1210  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:793
1215  833e000001           cmp word ptr [0], 1                ; data PRZEDM.FUKS
121a  7d33                 jge 0x124f                        
121c  833e000064           cmp word ptr [0], 0x64             ; data PRZEDM.PAR
1221  7d2c                 jge 0x124f                        
; PRZEDM.PAS:794
1223  bf0000               mov di, 0                          ; data System.OUTPUT
1226  1e                   push ds                           
1227  57                   push di                           
1228  bf0000               mov di, 0                          ; string "*************** UCZYSZ SIE ZDOLNOSCI PAROWANIE !!!!! ***************"
122b  0e                   push cs                           
122c  57                   push di                           
122d  31c0                 xor ax, ax                        
122f  50                   push ax                           
1230  9a00000000           lcall 0, 0                         ; call System.WriteString
1235  9a00000000           lcall 0, 0                         ; call System.WriteLn
123a  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:795
123f  a10000               mov ax, word ptr [0]               ; data PRZEDM.PAR
1242  40                   inc ax                            
1243  a30000               mov word ptr [0], ax               ; data PRZEDM.PAR
; PRZEDM.PAS:796
1246  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
1249  050500               add ax, 5                         
124c  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:800
124f  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
1252  2b060000             sub ax, word ptr [0]               ; data PRZEDM.WPYSK
1256  a30000               mov word ptr [0], ax               ; data PRZEDM.ENERGIA
; PRZEDM.PAS:801
1259  803e000000           cmp byte ptr [0], 0                ; data PRZEDM.FIREBALL
125e  7e78                 jle 0x12d8                        
; PRZEDM.PAS:802
1260  b86400               mov ax, 0x64                      
1263  50                   push ax                           
1264  9a00000000           lcall 0, 0                         ; call System.Random
1269  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:803
126c  833e00000a           cmp word ptr [0], 0xa              ; data PRZEDM.FUKS
1271  7d65                 jge 0x12d8                        
; PRZEDM.PAS:804
1273  b00e                 mov al, 0xe                       
1275  50                   push ax                           
1276  9a00000000           lcall 0, 0                         ; call Crt.TextColor
; PRZEDM.PAS:805
127b  b81400               mov ax, 0x14                      
127e  50                   push ax                           
127f  9a00000000           lcall 0, 0                         ; call System.Random
1284  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:806
1287  bf0000               mov di, 0                          ; data System.OUTPUT
128a  1e                   push ds                           
128b  57                   push di                           
128c  bf0000               mov di, 0                          ; string "PRZECIWNIK PUSZCZA FIREBALLA W TWYM KIERUNKU - TRACISZ "
128f  0e                   push cs                           
1290  57                   push di                           
1291  31c0                 xor ax, ax                        
1293  50                   push ax                           
1294  9a00000000           lcall 0, 0                         ; call System.WriteString
1299  a10000               mov ax, word ptr [0]               ; data PRZEDM.FUKS
129c  99                   cwd                               
129d  52                   push dx                           
129e  50                   push ax                           
129f  31c0                 xor ax, ax                        
12a1  50                   push ax                           
12a2  9a00000000           lcall 0, 0                         ; call System.WriteInteger
12a7  bf0000               mov di, 0                          ; string "% ENERGII"
12aa  0e                   push cs                           
12ab  57                   push di                           
12ac  31c0                 xor ax, ax                        
12ae  50                   push ax                           
12af  9a00000000           lcall 0, 0                         ; call System.WriteString
12b4  9a00000000           lcall 0, 0                         ; call System.WriteLn
12b9  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:807
12be  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
12c1  2b060000             sub ax, word ptr [0]               ; data PRZEDM.FUKS
12c5  a30000               mov word ptr [0], ax               ; data PRZEDM.ENERGIA
; PRZEDM.PAS:808
12c8  a00000               mov al, byte ptr [0]               ; data PRZEDM.FIREBALL
12cb  98                   cbw                               
12cc  48                   dec ax                            
12cd  a20000               mov byte ptr [0], al               ; data PRZEDM.FIREBALL
; PRZEDM.PAS:809
12d0  b00f                 mov al, 0xf                       
12d2  50                   push ax                           
12d3  9a00000000           lcall 0, 0                         ; call Crt.TextColor
; PRZEDM.PAS:812
12d8  803e000000           cmp byte ptr [0], 0                ; data PRZEDM.POISON
12dd  7e51                 jle 0x1330                        
; PRZEDM.PAS:813
12df  b86400               mov ax, 0x64                      
12e2  50                   push ax                           
12e3  9a00000000           lcall 0, 0                         ; call System.Random
12e8  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:814
12eb  833e00000a           cmp word ptr [0], 0xa              ; data PRZEDM.FUKS
12f0  7d3e                 jge 0x1330                        
; PRZEDM.PAS:815
12f2  b004                 mov al, 4                         
12f4  50                   push ax                           
12f5  9a00000000           lcall 0, 0                         ; call Crt.TextColor
; PRZEDM.PAS:816
12fa  bf0000               mov di, 0                          ; data System.OUTPUT
12fd  1e                   push ds                           
12fe  57                   push di                           
12ff  bf0000               mov di, 0                          ; string "PRZECIWNIK RZUCA CZAR \"POISON\" "
1302  0e                   push cs                           
1303  57                   push di                           
1304  31c0                 xor ax, ax                        
1306  50                   push ax                           
1307  9a00000000           lcall 0, 0                         ; call System.WriteString
130c  9a00000000           lcall 0, 0                         ; call System.WriteLn
1311  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:817
1316  a00000               mov al, byte ptr [0]               ; data PRZEDM.POISON
1319  98                   cbw                               
131a  48                   dec ax                            
131b  a20000               mov byte ptr [0], al               ; data PRZEDM.POISON
; PRZEDM.PAS:818
131e  b00f                 mov al, 0xf                       
1320  50                   push ax                           
1321  9a00000000           lcall 0, 0                         ; call Crt.TextColor
; PRZEDM.PAS:819
1326  a00000               mov al, byte ptr [0]               ; data PRZEDM.ILEPOI
1329  98                   cbw                               
132a  050a00               add ax, 0xa                       
132d  a20000               mov byte ptr [0], al               ; data PRZEDM.ILEPOI
; PRZEDM.PAS:822
1330  803e000000           cmp byte ptr [0], 0                ; data PRZEDM.ILEPOI
1335  7e55                 jle 0x138c                        
; PRZEDM.PAS:823
1337  b80500               mov ax, 5                         
133a  50                   push ax                           
133b  9a00000000           lcall 0, 0                         ; call System.Random
1340  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:824
1343  bf0000               mov di, 0                          ; data System.OUTPUT
1346  1e                   push ds                           
1347  57                   push di                           
1348  bf0000               mov di, 0                          ; string "JESTES ZATRUTY - TRACISZ "
134b  0e                   push cs                           
134c  57                   push di                           
134d  31c0                 xor ax, ax                        
134f  50                   push ax                           
1350  9a00000000           lcall 0, 0                         ; call System.WriteString
1355  a10000               mov ax, word ptr [0]               ; data PRZEDM.FUKS
1358  99                   cwd                               
1359  52                   push dx                           
135a  50                   push ax                           
135b  31c0                 xor ax, ax                        
135d  50                   push ax                           
135e  9a00000000           lcall 0, 0                         ; call System.WriteInteger
1363  bf0000               mov di, 0                          ; string "% ENERGI"
1366  0e                   push cs                           
1367  57                   push di                           
1368  31c0                 xor ax, ax                        
136a  50                   push ax                           
136b  9a00000000           lcall 0, 0                         ; call System.WriteString
1370  9a00000000           lcall 0, 0                         ; call System.WriteLn
1375  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:825
137a  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
137d  2b060000             sub ax, word ptr [0]               ; data PRZEDM.FUKS
1381  a30000               mov word ptr [0], ax               ; data PRZEDM.ENERGIA
; PRZEDM.PAS:826
1384  a00000               mov al, byte ptr [0]               ; data PRZEDM.ILEPOI
1387  98                   cbw                               
1388  48                   dec ax                            
1389  a20000               mov byte ptr [0], al               ; data PRZEDM.ILEPOI
; PRZEDM.PAS:829
138c  833e000000           cmp word ptr [0], 0                ; data PRZEDM.ON
1391  7403                 je 0x1396                         
1393  e95e01               jmp 0x14f4                        
; PRZEDM.PAS:830
1396  ff360000             push word ptr [0]                  ; data PRZEDM.SIL
139a  9a00000000           lcall 0, 0                         ; call System.Random
139f  a30000               mov word ptr [0], ax               ; data PRZEDM.WPYSK
; PRZEDM.PAS:831
13a2  b80a00               mov ax, 0xa                       
13a5  f7260000             mul word ptr [0]                   ; data PRZEDM.WPYSK
13a9  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.FUKSROLL
13ad  7d35                 jge 0x13e4                        
; PRZEDM.PAS:833
13af  ff360000             push word ptr [0]                  ; data PRZEDM.SIL
13b3  9a00000000           lcall 0, 0                         ; call System.Random
13b8  a30000               mov word ptr [0], ax               ; data PRZEDM.WPYSK
; PRZEDM.PAS:834
13bb  bf0000               mov di, 0                          ; data System.OUTPUT
13be  1e                   push ds                           
13bf  57                   push di                           
13c0  bf0000               mov di, 0                          ; string "FUKSROLL FUKSROLL FUKSROLL ! "
13c3  0e                   push cs                           
13c4  57                   push di                           
13c5  31c0                 xor ax, ax                        
13c7  50                   push ax                           
13c8  9a00000000           lcall 0, 0                         ; call System.WriteString
13cd  9a00000000           lcall 0, 0                         ; call System.WriteLn
13d2  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:835
13d7  b80a00               mov ax, 0xa                       
13da  f7260000             mul word ptr [0]                   ; data PRZEDM.WPYSK
13de  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.FUKSROLL
13e2  7ecb                 jle 0x13af                        
; PRZEDM.PAS:837
13e4  a10000               mov ax, word ptr [0]               ; data PRZEDM.WROGEN
13e7  2b060000             sub ax, word ptr [0]               ; data PRZEDM.WPYSK
13eb  a30000               mov word ptr [0], ax               ; data PRZEDM.WROGEN
; PRZEDM.PAS:838
13ee  833e000006           cmp word ptr [0], 6                ; data PRZEDM.WPYSK
13f3  7d37                 jge 0x142c                        
; PRZEDM.PAS:839
13f5  bf0000               mov di, 0                          ; data System.OUTPUT
13f8  1e                   push ds                           
13f9  57                   push di                           
13fa  bf0000               mov di, 0                          ; string "MASZ PECHA : LEKKO POPCHNALES GO I STRACIL TYLKO "
13fd  0e                   push cs                           
13fe  57                   push di                           
13ff  31c0                 xor ax, ax                        
1401  50                   push ax                           
1402  9a00000000           lcall 0, 0                         ; call System.WriteString
1407  a10000               mov ax, word ptr [0]               ; data PRZEDM.WPYSK
140a  99                   cwd                               
140b  52                   push dx                           
140c  50                   push ax                           
140d  31c0                 xor ax, ax                        
140f  50                   push ax                           
1410  9a00000000           lcall 0, 0                         ; call System.WriteInteger
1415  bf0000               mov di, 0                          ; string "% ENERGII"
1418  0e                   push cs                           
1419  57                   push di                           
141a  31c0                 xor ax, ax                        
141c  50                   push ax                           
141d  9a00000000           lcall 0, 0                         ; call System.WriteString
1422  9a00000000           lcall 0, 0                         ; call System.WriteLn
1427  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:841
142c  833e000005           cmp word ptr [0], 5                ; data PRZEDM.WPYSK
1431  7e3e                 jle 0x1471                        
1433  833e000015           cmp word ptr [0], 0x15             ; data PRZEDM.WPYSK
1438  7d37                 jge 0x1471                        
; PRZEDM.PAS:842
143a  bf0000               mov di, 0                          ; data System.OUTPUT
143d  1e                   push ds                           
143e  57                   push di                           
143f  bf0000               mov di, 0                          ; string "DOSTAL I STRACIL "
1442  0e                   push cs                           
1443  57                   push di                           
1444  31c0                 xor ax, ax                        
1446  50                   push ax                           
1447  9a00000000           lcall 0, 0                         ; call System.WriteString
144c  a10000               mov ax, word ptr [0]               ; data PRZEDM.WPYSK
144f  99                   cwd                               
1450  52                   push dx                           
1451  50                   push ax                           
1452  31c0                 xor ax, ax                        
1454  50                   push ax                           
1455  9a00000000           lcall 0, 0                         ; call System.WriteInteger
145a  bf0000               mov di, 0                          ; string "% ENERGII"
145d  0e                   push cs                           
145e  57                   push di                           
145f  31c0                 xor ax, ax                        
1461  50                   push ax                           
1462  9a00000000           lcall 0, 0                         ; call System.WriteString
1467  9a00000000           lcall 0, 0                         ; call System.WriteLn
146c  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:843
1471  833e000014           cmp word ptr [0], 0x14             ; data PRZEDM.WPYSK
1476  7e3e                 jle 0x14b6                        
1478  833e000033           cmp word ptr [0], 0x33             ; data PRZEDM.WPYSK
147d  7d37                 jge 0x14b6                        
147f  bf0000               mov di, 0                          ; data System.OUTPUT
1482  1e                   push ds                           
1483  57                   push di                           
1484  bf0000               mov di, 0                          ; string " !MASAKRUJESZ! PRZECIWNIKA I TRACI ON AZ "
1487  0e                   push cs                           
1488  57                   push di                           
1489  31c0                 xor ax, ax                        
148b  50                   push ax                           
148c  9a00000000           lcall 0, 0                         ; call System.WriteString
1491  a10000               mov ax, word ptr [0]               ; data PRZEDM.WPYSK
1494  99                   cwd                               
1495  52                   push dx                           
1496  50                   push ax                           
1497  31c0                 xor ax, ax                        
1499  50                   push ax                           
149a  9a00000000           lcall 0, 0                         ; call System.WriteInteger
149f  bf0000               mov di, 0                          ; string "% ENERGII"
14a2  0e                   push cs                           
14a3  57                   push di                           
14a4  31c0                 xor ax, ax                        
14a6  50                   push ax                           
14a7  9a00000000           lcall 0, 0                         ; call System.WriteString
14ac  9a00000000           lcall 0, 0                         ; call System.WriteLn
14b1  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:844
14b6  833e000032           cmp word ptr [0], 0x32             ; data PRZEDM.WPYSK
14bb  7e37                 jle 0x14f4                        
14bd  bf0000               mov di, 0                          ; data System.OUTPUT
14c0  1e                   push ds                           
14c1  57                   push di                           
14c2  bf0000               mov di, 0                          ; string " !!!WYPRUWASZ FLAKI!!! Z PRZECIWNIKA I TRACI ON  !!!! "
14c5  0e                   push cs                           
14c6  57                   push di                           
14c7  31c0                 xor ax, ax                        
14c9  50                   push ax                           
14ca  9a00000000           lcall 0, 0                         ; call System.WriteString
14cf  a10000               mov ax, word ptr [0]               ; data PRZEDM.WPYSK
14d2  99                   cwd                               
14d3  52                   push dx                           
14d4  50                   push ax                           
14d5  31c0                 xor ax, ax                        
14d7  50                   push ax                           
14d8  9a00000000           lcall 0, 0                         ; call System.WriteInteger
14dd  bf0000               mov di, 0                          ; string "% ENERGII"
14e0  0e                   push cs                           
14e1  57                   push di                           
14e2  31c0                 xor ax, ax                        
14e4  50                   push ax                           
14e5  9a00000000           lcall 0, 0                         ; call System.WriteString
14ea  9a00000000           lcall 0, 0                         ; call System.WriteLn
14ef  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:846
14f4  b8d007               mov ax, 0x7d0                     
14f7  50                   push ax                           
14f8  9a00000000           lcall 0, 0                         ; call Crt.Delay
; PRZEDM.PAS:847
14fd  833e000000           cmp word ptr [0], 0                ; data PRZEDM.KOP
1502  7f03                 jg 0x1507                         
1504  e9fc00               jmp 0x1603                        
1507  a10000               mov ax, word ptr [0]               ; data PRZEDM.MANA
150a  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.KOPM
150e  7f03                 jg 0x1513                         
1510  e9f000               jmp 0x1603                        
1513  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
1516  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.KOPHP
151a  7c03                 jl 0x151f                         
151c  e9e400               jmp 0x1603                        
; PRZEDM.PAS:848
151f  b86400               mov ax, 0x64                      
1522  50                   push ax                           
1523  9a00000000           lcall 0, 0                         ; call System.Random
1528  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:849
152b  a10000               mov ax, word ptr [0]               ; data PRZEDM.KOP
152e  2d0a00               sub ax, 0xa                       
1531  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.FUKS
1535  7d03                 jge 0x153a                        
1537  e98d00               jmp 0x15c7                        
; PRZEDM.PAS:850
153a  a00000               mov al, byte ptr [0]               ; data PRZEDM.POZIOM
153d  98                   cbw                               
153e  50                   push ax                           
153f  9a00000000           lcall 0, 0                         ; call System.Random
1544  50                   push ax                           
1545  b80a00               mov ax, 0xa                       
1548  50                   push ax                           
1549  9a00000000           lcall 0, 0                         ; call System.Random
154e  5a                   pop dx                            
154f  03c2                 add ax, dx                        
1551  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:851
1554  b00e                 mov al, 0xe                       
1556  50                   push ax                           
1557  9a00000000           lcall 0, 0                         ; call Crt.TextColor
; PRZEDM.PAS:852
155c  bf0000               mov di, 0                          ; data System.OUTPUT
155f  1e                   push ds                           
1560  57                   push di                           
1561  bf0000               mov di, 0                          ; string "TWOJ SUPER KOP ZABIERA "
1564  0e                   push cs                           
1565  57                   push di                           
1566  31c0                 xor ax, ax                        
1568  50                   push ax                           
1569  9a00000000           lcall 0, 0                         ; call System.WriteString
156e  a10000               mov ax, word ptr [0]               ; data PRZEDM.FUKS
1571  99                   cwd                               
1572  52                   push dx                           
1573  50                   push ax                           
1574  31c0                 xor ax, ax                        
1576  50                   push ax                           
1577  9a00000000           lcall 0, 0                         ; call System.WriteInteger
157c  bf0000               mov di, 0                          ; string "% ENERGI"
157f  0e                   push cs                           
1580  57                   push di                           
1581  31c0                 xor ax, ax                        
1583  50                   push ax                           
1584  9a00000000           lcall 0, 0                         ; call System.WriteString
1589  9a00000000           lcall 0, 0                         ; call System.WriteLn
158e  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:853
1593  b00f                 mov al, 0xf                       
1595  50                   push ax                           
1596  9a00000000           lcall 0, 0                         ; call Crt.TextColor
; PRZEDM.PAS:854
159b  b80300               mov ax, 3                         
159e  50                   push ax                           
159f  9a00000000           lcall 0, 0                         ; call System.Random
15a4  31d2                 xor dx, dx                        
15a6  8bc8                 mov cx, ax                        
15a8  8bda                 mov bx, dx                        
15aa  a10000               mov ax, word ptr [0]               ; data PRZEDM.MANA
15ad  99                   cwd                               
15ae  2bc1                 sub ax, cx                        
15b0  1bd3                 sbb dx, bx                        
15b2  2d0300               sub ax, 3                         
15b5  83da00               sbb dx, 0                         
15b8  a30000               mov word ptr [0], ax               ; data PRZEDM.MANA
; PRZEDM.PAS:855
15bb  a10000               mov ax, word ptr [0]               ; data PRZEDM.WROGEN
15be  2b060000             sub ax, word ptr [0]               ; data PRZEDM.FUKS
15c2  a30000               mov word ptr [0], ax               ; data PRZEDM.WROGEN
; PRZEDM.PAS:856
15c5  eb1c                 jmp 0x15e3                        
15c7  bf0000               mov di, 0                          ; data System.OUTPUT
15ca  1e                   push ds                           
15cb  57                   push di                           
15cc  bf0000               mov di, 0                          ; string "TWOJ SUPER KOP CHYBIA PRZECIWNIKA "
15cf  0e                   push cs                           
15d0  57                   push di                           
15d1  31c0                 xor ax, ax                        
15d3  50                   push ax                           
15d4  9a00000000           lcall 0, 0                         ; call System.WriteString
15d9  9a00000000           lcall 0, 0                         ; call System.WriteLn
15de  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:857
15e3  b80200               mov ax, 2                         
15e6  50                   push ax                           
15e7  9a00000000           lcall 0, 0                         ; call System.Random
15ec  31d2                 xor dx, dx                        
15ee  8bc8                 mov cx, ax                        
15f0  8bda                 mov bx, dx                        
15f2  a10000               mov ax, word ptr [0]               ; data PRZEDM.MANA
15f5  99                   cwd                               
15f6  2bc1                 sub ax, cx                        
15f8  1bd3                 sbb dx, bx                        
15fa  2d0200               sub ax, 2                         
15fd  83da00               sbb dx, 0                         
1600  a30000               mov word ptr [0], ax               ; data PRZEDM.MANA
; PRZEDM.PAS:859
1603  833e000000           cmp word ptr [0], 0                ; data PRZEDM.ZWIEJ
1608  7e77                 jle 0x1681                        
160a  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
160d  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.WIMP
1611  7d6e                 jge 0x1681                        
1613  833e00000e           cmp word ptr [0], 0xe              ; data PRZEDM.MANA
1618  7e67                 jle 0x1681                        
; PRZEDM.PAS:860
161a  a10000               mov ax, word ptr [0]               ; data PRZEDM.MANA
161d  2d0f00               sub ax, 0xf                       
1620  a30000               mov word ptr [0], ax               ; data PRZEDM.MANA
; PRZEDM.PAS:861
1623  b86400               mov ax, 0x64                      
1626  50                   push ax                           
1627  9a00000000           lcall 0, 0                         ; call System.Random
162c  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:862
162f  a10000               mov ax, word ptr [0]               ; data PRZEDM.FUKS
1632  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.ZWIEJ
1636  7f2d                 jg 0x1665                         
; PRZEDM.PAS:863
1638  c70600000100         mov word ptr [0], 1                ; data PRZEDM.PASZOL
; PRZEDM.PAS:864
163e  bf0000               mov di, 0                          ; data System.OUTPUT
1641  1e                   push ds                           
1642  57                   push di                           
1643  bf0000               mov di, 0                          ; string "WSTYD !!! UCIEKLES Z POLA BITWY TRACISZ 20 KUNSZTU"
1646  0e                   push cs                           
1647  57                   push di                           
1648  31c0                 xor ax, ax                        
164a  50                   push ax                           
164b  9a00000000           lcall 0, 0                         ; call System.WriteString
1650  9a00000000           lcall 0, 0                         ; call System.WriteLn
1655  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:865
165a  a10000               mov ax, word ptr [0]               ; data PRZEDM.KUNSZT
165d  2d1400               sub ax, 0x14                      
1660  a30000               mov word ptr [0], ax               ; data PRZEDM.KUNSZT
; PRZEDM.PAS:866
1663  eb1c                 jmp 0x1681                        
1665  bf0000               mov di, 0                          ; data System.OUTPUT
1668  1e                   push ds                           
1669  57                   push di                           
166a  bf0000               mov di, 0                          ; string "NIE UDALO CI SIE UCIEC !!!! WALCZYSZ DALEJ !!! "
166d  0e                   push cs                           
166e  57                   push di                           
166f  31c0                 xor ax, ax                        
1671  50                   push ax                           
1672  9a00000000           lcall 0, 0                         ; call System.WriteString
1677  9a00000000           lcall 0, 0                         ; call System.WriteLn
167c  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:868
1681  833e000001           cmp word ptr [0], 1                ; data PRZEDM.ENERGIA
1686  7c11                 jl 0x1699                         
1688  833e000001           cmp word ptr [0], 1                ; data PRZEDM.WROGEN
168d  7c0a                 jl 0x1699                         
168f  833e000001           cmp word ptr [0], 1                ; data PRZEDM.PASZOL
1694  7403                 je 0x1699                         
1696  e999f3               jmp 0xa32                         
; PRZEDM.PAS:869
1699  833e000001           cmp word ptr [0], 1                ; data PRZEDM.WROGEN
169e  7c03                 jl 0x16a3                         
16a0  e96101               jmp 0x1804                        
16a3  833e000000           cmp word ptr [0], 0                ; data PRZEDM.ENERGIA
16a8  7f03                 jg 0x16ad                         
16aa  e95701               jmp 0x1804                        
; PRZEDM.PAS:870
16ad  833e00004b           cmp word ptr [0], 0x4b             ; data MONSTRA.MAXE
16b2  7e08                 jle 0x16bc                        
16b4  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
16b7  48                   dec ax                            
16b8  48                   dec ax                            
16b9  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:871
16bc  833e000073           cmp word ptr [0], 0x73             ; data MONSTRA.MAXE
16c1  7e09                 jle 0x16cc                        
16c3  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
16c6  2d0300               sub ax, 3                         
16c9  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:872
16cc  833e000032           cmp word ptr [0], 0x32             ; data PRZEDM.PAR
16d1  7e08                 jle 0x16db                        
16d3  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
16d6  48                   dec ax                            
16d7  48                   dec ax                            
16d8  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:873
16db  833e00004b           cmp word ptr [0], 0x4b             ; data PRZEDM.PAR
16e0  7e08                 jle 0x16ea                        
16e2  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
16e5  48                   dec ax                            
16e6  48                   dec ax                            
16e7  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:874
16ea  833e00005f           cmp word ptr [0], 0x5f             ; data PRZEDM.PAR
16ef  7e07                 jle 0x16f8                        
16f1  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
16f4  48                   dec ax                            
16f5  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:875
16f8  833e000032           cmp word ptr [0], 0x32             ; data PRZEDM.KOP
16fd  7e09                 jle 0x1708                        
16ff  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
1702  2d0500               sub ax, 5                         
1705  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:876
1708  833e00005f           cmp word ptr [0], 0x5f             ; data PRZEDM.KOP
170d  7e08                 jle 0x1717                        
170f  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
1712  48                   dec ax                            
1713  48                   dec ax                            
1714  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:877
1717  833e000000           cmp word ptr [0], 0                ; data PRZEDM.MINIKUNSZT
171c  7d05                 jge 0x1723                        
171e  31c0                 xor ax, ax                        
1720  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:878
1723  bf0000               mov di, 0                          ; data System.OUTPUT
1726  1e                   push ds                           
1727  57                   push di                           
1728  bf0000               mov di, 0                          ; string "ZABILES GO ! ZYSKUJESZ ZA TO "
172b  0e                   push cs                           
172c  57                   push di                           
172d  31c0                 xor ax, ax                        
172f  50                   push ax                           
1730  9a00000000           lcall 0, 0                         ; call System.WriteString
1735  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
1738  99                   cwd                               
1739  52                   push dx                           
173a  50                   push ax                           
173b  31c0                 xor ax, ax                        
173d  50                   push ax                           
173e  9a00000000           lcall 0, 0                         ; call System.WriteInteger
1743  bf0000               mov di, 0                          ; string " KUNSZTU "
1746  0e                   push cs                           
1747  57                   push di                           
1748  31c0                 xor ax, ax                        
174a  50                   push ax                           
174b  9a00000000           lcall 0, 0                         ; call System.WriteString
1750  9a00000000           lcall 0, 0                         ; call System.WriteLn
1755  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:879
175a  a10000               mov ax, word ptr [0]               ; data PRZEDM.MINIKUNSZT
175d  03060000             add ax, word ptr [0]               ; data PRZEDM.KUNSZT
1761  a30000               mov word ptr [0], ax               ; data PRZEDM.KUNSZT
; PRZEDM.PAS:880
1764  c606000000           mov byte ptr [0], 0                ; data PRZEDM.FIREBALL
; PRZEDM.PAS:881
1769  c606000000           mov byte ptr [0], 0                ; data PRZEDM.POISON
; PRZEDM.PAS:883
176e  833e000000           cmp word ptr [0], 0                ; data PRZEDM.QUEST
1773  7e07                 jle 0x177c                        
1775  a10000               mov ax, word ptr [0]               ; data PRZEDM.QUESTWYK
1778  48                   dec ax                            
1779  a30000               mov word ptr [0], ax               ; data PRZEDM.QUESTWYK
; PRZEDM.PAS:884
177c  803e000000           cmp byte ptr [0], 0                ; data PRZEDM.POTRAWKI
1781  7f03                 jg 0x1786                         
1783  e97e00               jmp 0x1804                        
; PRZEDM.PAS:885
1786  b86400               mov ax, 0x64                      
1789  50                   push ax                           
178a  9a00000000           lcall 0, 0                         ; call System.Random
178f  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:886
1792  a00000               mov al, byte ptr [0]               ; data PRZEDM.POTRAWKI
1795  98                   cbw                               
1796  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.FUKS
179a  7e68                 jle 0x1804                        
; PRZEDM.PAS:887
179c  bf0000               mov di, 0                          ; data System.OUTPUT
179f  1e                   push ds                           
17a0  57                   push di                           
17a1  bf0000               mov di, 0                          ; string "ROBISZ SOBIE PYSZNY PYSZNY BIGOS Z KAPUSTA Z WROGA"
17a4  0e                   push cs                           
17a5  57                   push di                           
17a6  31c0                 xor ax, ax                        
17a8  50                   push ax                           
17a9  9a00000000           lcall 0, 0                         ; call System.WriteString
17ae  9a00000000           lcall 0, 0                         ; call System.WriteLn
17b3  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:888
17b8  a00000               mov al, byte ptr [0]               ; data PRZEDM.BIGOS
17bb  98                   cbw                               
17bc  2d0a00               sub ax, 0xa                       
17bf  a20000               mov byte ptr [0], al               ; data PRZEDM.BIGOS
; PRZEDM.PAS:889
17c2  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
17c5  40                   inc ax                            
17c6  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:890
17c9  833e000001           cmp word ptr [0], 1                ; data PRZEDM.FUKS
17ce  7d34                 jge 0x1804                        
17d0  803e000064           cmp byte ptr [0], 0x64             ; data PRZEDM.POTRAWKI
17d5  7d2d                 jge 0x1804                        
; PRZEDM.PAS:891
17d7  bf0000               mov di, 0                          ; data System.OUTPUT
17da  1e                   push ds                           
17db  57                   push di                           
17dc  bf0000               mov di, 0                          ; string "UCZYSZ SIE ZDOLNOSCI POTRAWKI !!! "
17df  0e                   push cs                           
17e0  57                   push di                           
17e1  31c0                 xor ax, ax                        
17e3  50                   push ax                           
17e4  9a00000000           lcall 0, 0                         ; call System.WriteString
17e9  9a00000000           lcall 0, 0                         ; call System.WriteLn
17ee  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:892
17f3  a00000               mov al, byte ptr [0]               ; data PRZEDM.POTRAWKI
17f6  98                   cbw                               
17f7  40                   inc ax                            
17f8  a20000               mov byte ptr [0], al               ; data PRZEDM.POTRAWKI
; PRZEDM.PAS:893
17fb  a10000               mov ax, word ptr [0]               ; data PRZEDM.KUNSZT
17fe  050a00               add ax, 0xa                       
1801  a30000               mov word ptr [0], ax               ; data PRZEDM.KUNSZT
; PRZEDM.PAS:899
1804  833e000001           cmp word ptr [0], 1                ; data PRZEDM.ENERGIA
1809  7d2b                 jge 0x1836                        
; PRZEDM.PAS:900
180b  bf0000               mov di, 0                          ; data System.OUTPUT
180e  1e                   push ds                           
180f  57                   push di                           
1810  bf0000               mov di, 0                          ; string "!!!!!!!!!!!ZOSTALES ZABITY!!!!!!!!!!!!"
1813  0e                   push cs                           
1814  57                   push di                           
1815  31c0                 xor ax, ax                        
1817  50                   push ax                           
1818  9a00000000           lcall 0, 0                         ; call System.WriteString
181d  9a00000000           lcall 0, 0                         ; call System.WriteLn
1822  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:901
1827  b8b80b               mov ax, 0xbb8                     
182a  50                   push ax                           
182b  9a00000000           lcall 0, 0                         ; call Crt.Delay
; PRZEDM.PAS:902
1830  c70600001027         mov word ptr [0], 0x2710           ; data PRZEDM.MIECHO
; PRZEDM.PAS:904
1836  31c0                 xor ax, ax                        
1838  a30000               mov word ptr [0], ax               ; data PRZEDM.MINIKUNSZT
; PRZEDM.PAS:905
183b  5d                   pop bp                            
183c  cb                   retf                              
```

# `PRZEDM.KTO`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:569-598`
- TPU code block: `0x00b8`
- Procedure bytes: `0x0523`–`0x093b`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.BAKTERIA`
- `PRZEDM.BIZON`
- `PRZEDM.BOA`
- `PRZEDM.DZIK`
- `PRZEDM.GLADIATOR`
- `PRZEDM.KARALUCH`
- `PRZEDM.KORNIK`
- `PRZEDM.KUROPATWA`
- `PRZEDM.LEW`
- `PRZEDM.LIS`
- `PRZEDM.MIECHO`
- `PRZEDM.MROWKA`
- `PRZEDM.MUCHA`
- `PRZEDM.ORZEL`
- `PRZEDM.PAJAK`
- `PRZEDM.PANTERA`
- `PRZEDM.SARNA`
- `PRZEDM.SLIMAK`
- `PRZEDM.SLON`
- `PRZEDM.STRUS`
- `PRZEDM.SZCZUR`
- `PRZEDM.TRENER`
- `PRZEDM.WIELBLAD`
- `PRZEDM.WILCZUR`
- `PRZEDM.WILK`
- `PRZEDM.WOJOWNIK`
- `PRZEDM.ZAJAC`
- `PRZEDM.ZUK`
- `PRZEDM.ZYRAFA`
- `System.OUTPUT`

## Calls

- `System.WriteLn`
- `System.WriteString`
- `System.entry_0x0190`
- `System.entry_0x01a0`

## Exact strings

- `"KORNIK SZUKA JAKIEGOS DRZEWA ABY COS PRZEKASIC"`
- `"MUCHA BZYKA SOBIE TO TU TO TAM"`
- `"BAKTERIA KTORA ZOBACZYLES POD MIKROSKOPEM STARA USUNAC CI SIE Z DROGI"`
- `"SLIMAK KTORY ZOSTAWIA SLUZ POWOLI SUNIE PO PODLODZE"`
- `"ZUK KTORY WIDZI CO SIE SWIECI ZWIEWA STAD"`
- `"OHYDNY KARALUCH MA OCHOTE CIE OBRZYDZIC"`
- `"MROWKA NIESIE TLUSTY PACZEK I SIE CIESZY"`
- `"PAJAK ZROBIL SIEC NA SCIANIE ARENY"`
- `"TLUSTY DZICZEK BIEGNIE SOBIE TEDY"`
- `"JEST TUTAJ SZCZUR,TAK WIELKI ZE WIEKSZEGO NIE WIDZIALES"`
- `"CHYTRY LIS SZUKA SPOSOBU BY CIE ZABIC"`
- `"KUROPATWA PO PROSTU JEST TU"`
- `"ZAJAC KICA SOBIE SPIEWAJAC \"POMYLONE MISIE\""`
- `"CZARNY WILCZUR PO KRZYWEJ SIE TOCZY (MU PIANA Z UST)"`
- `"ORZEL SZYBUJE W POWIETRZYU W POSZUKIWANIU OFIARY"`
- `"SARNA SKASZE SOBIE NIE ZDAJAC SOBIE SPRAWY ZE ZARAZ ZGINIE"`
- `"OGROMNIASTY SLON ZGNIATA WSZYSTKO CO NAPOTKA"`
- `"LEW - KROL ZWIERZAT WLASNIE ZABIJA NIEWINNE DZIECKO ROZWALAJAC JEGO MOZG"`
- `"ZYRAFA KTORA TU STOI NIE SZUKA ZACZEPKI"`
- `"WIELBLAD KORZYSTA Z GARBOW UZYWAJAC ICH JAKO SMIERTELNEJ BRONI"`
- `"STRUS NIE CHOWA GLOWY W PIASEK BO JEST NA BETONIE"`
- `"BOA DUSICIEL WLASNIE ZJADL KROWE "`
- `"WILK CHORY NA WSCIEKLIZNE PANOSZY SIE W OKOLICY"`
- `"NIEWINNY BIZON MORDUJE WLASNIE PUBLICZNOSC"`
- `"ZWINNA PANTERA NUDZI SIE POLYKAJAC RESZTKI LUDZKIEGO MIESA"`
- `"GLADIATOR ZDOBYWA TUTAJ KUNSZT"`
- `"WOJOWNIK GREEN PEACE MORDUJE TUTAJ BEZBRONNE LWIATKA :( "`
- `"TRENER CYRKU LAPIE ZWIERZETA NA SWOJE PRZEDSTAWIENIE"`

## Annotated listing

```asm
; PRZEDM.PAS:569
0523  55                   push bp                           
0524  89e5                 mov bp, sp                        
0526  31c0                 xor ax, ax                        
0528  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:570
052d  a10000               mov ax, word ptr [0]               ; data PRZEDM.KORNIK
0530  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0534  751c                 jne 0x552                         
0536  bf0000               mov di, 0                          ; data System.OUTPUT
0539  1e                   push ds                           
053a  57                   push di                           
053b  bf0000               mov di, 0                          ; string "KORNIK SZUKA JAKIEGOS DRZEWA ABY COS PRZEKASIC"
053e  0e                   push cs                           
053f  57                   push di                           
0540  31c0                 xor ax, ax                        
0542  50                   push ax                           
0543  9a00000000           lcall 0, 0                         ; call System.WriteString
0548  9a00000000           lcall 0, 0                         ; call System.WriteLn
054d  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:571
0552  a10000               mov ax, word ptr [0]               ; data PRZEDM.MUCHA
0555  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0559  751c                 jne 0x577                         
055b  bf0000               mov di, 0                          ; data System.OUTPUT
055e  1e                   push ds                           
055f  57                   push di                           
0560  bf0000               mov di, 0                          ; string "MUCHA BZYKA SOBIE TO TU TO TAM"
0563  0e                   push cs                           
0564  57                   push di                           
0565  31c0                 xor ax, ax                        
0567  50                   push ax                           
0568  9a00000000           lcall 0, 0                         ; call System.WriteString
056d  9a00000000           lcall 0, 0                         ; call System.WriteLn
0572  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:572
0577  a10000               mov ax, word ptr [0]               ; data PRZEDM.BAKTERIA
057a  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
057e  751c                 jne 0x59c                         
0580  bf0000               mov di, 0                          ; data System.OUTPUT
0583  1e                   push ds                           
0584  57                   push di                           
0585  bf0000               mov di, 0                          ; string "BAKTERIA KTORA ZOBACZYLES POD MIKROSKOPEM STARA USUNAC CI SIE Z DROGI"
0588  0e                   push cs                           
0589  57                   push di                           
058a  31c0                 xor ax, ax                        
058c  50                   push ax                           
058d  9a00000000           lcall 0, 0                         ; call System.WriteString
0592  9a00000000           lcall 0, 0                         ; call System.WriteLn
0597  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:573
059c  a10000               mov ax, word ptr [0]               ; data PRZEDM.SLIMAK
059f  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
05a3  751c                 jne 0x5c1                         
05a5  bf0000               mov di, 0                          ; data System.OUTPUT
05a8  1e                   push ds                           
05a9  57                   push di                           
05aa  bf0000               mov di, 0                          ; string "SLIMAK KTORY ZOSTAWIA SLUZ POWOLI SUNIE PO PODLODZE"
05ad  0e                   push cs                           
05ae  57                   push di                           
05af  31c0                 xor ax, ax                        
05b1  50                   push ax                           
05b2  9a00000000           lcall 0, 0                         ; call System.WriteString
05b7  9a00000000           lcall 0, 0                         ; call System.WriteLn
05bc  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:574
05c1  a10000               mov ax, word ptr [0]               ; data PRZEDM.ZUK
05c4  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
05c8  751c                 jne 0x5e6                         
05ca  bf0000               mov di, 0                          ; data System.OUTPUT
05cd  1e                   push ds                           
05ce  57                   push di                           
05cf  bf0000               mov di, 0                          ; string "ZUK KTORY WIDZI CO SIE SWIECI ZWIEWA STAD"
05d2  0e                   push cs                           
05d3  57                   push di                           
05d4  31c0                 xor ax, ax                        
05d6  50                   push ax                           
05d7  9a00000000           lcall 0, 0                         ; call System.WriteString
05dc  9a00000000           lcall 0, 0                         ; call System.WriteLn
05e1  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:575
05e6  a10000               mov ax, word ptr [0]               ; data PRZEDM.KARALUCH
05e9  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
05ed  751c                 jne 0x60b                         
05ef  bf0000               mov di, 0                          ; data System.OUTPUT
05f2  1e                   push ds                           
05f3  57                   push di                           
05f4  bf0000               mov di, 0                          ; string "OHYDNY KARALUCH MA OCHOTE CIE OBRZYDZIC"
05f7  0e                   push cs                           
05f8  57                   push di                           
05f9  31c0                 xor ax, ax                        
05fb  50                   push ax                           
05fc  9a00000000           lcall 0, 0                         ; call System.WriteString
0601  9a00000000           lcall 0, 0                         ; call System.WriteLn
0606  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:576
060b  a10000               mov ax, word ptr [0]               ; data PRZEDM.MROWKA
060e  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0612  751c                 jne 0x630                         
0614  bf0000               mov di, 0                          ; data System.OUTPUT
0617  1e                   push ds                           
0618  57                   push di                           
0619  bf0000               mov di, 0                          ; string "MROWKA NIESIE TLUSTY PACZEK I SIE CIESZY"
061c  0e                   push cs                           
061d  57                   push di                           
061e  31c0                 xor ax, ax                        
0620  50                   push ax                           
0621  9a00000000           lcall 0, 0                         ; call System.WriteString
0626  9a00000000           lcall 0, 0                         ; call System.WriteLn
062b  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:577
0630  a10000               mov ax, word ptr [0]               ; data PRZEDM.PAJAK
0633  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0637  751c                 jne 0x655                         
0639  bf0000               mov di, 0                          ; data System.OUTPUT
063c  1e                   push ds                           
063d  57                   push di                           
063e  bf0000               mov di, 0                          ; string "PAJAK ZROBIL SIEC NA SCIANIE ARENY"
0641  0e                   push cs                           
0642  57                   push di                           
0643  31c0                 xor ax, ax                        
0645  50                   push ax                           
0646  9a00000000           lcall 0, 0                         ; call System.WriteString
064b  9a00000000           lcall 0, 0                         ; call System.WriteLn
0650  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:578
0655  a10000               mov ax, word ptr [0]               ; data PRZEDM.DZIK
0658  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
065c  751c                 jne 0x67a                         
065e  bf0000               mov di, 0                          ; data System.OUTPUT
0661  1e                   push ds                           
0662  57                   push di                           
0663  bf0000               mov di, 0                          ; string "TLUSTY DZICZEK BIEGNIE SOBIE TEDY"
0666  0e                   push cs                           
0667  57                   push di                           
0668  31c0                 xor ax, ax                        
066a  50                   push ax                           
066b  9a00000000           lcall 0, 0                         ; call System.WriteString
0670  9a00000000           lcall 0, 0                         ; call System.WriteLn
0675  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:579
067a  a10000               mov ax, word ptr [0]               ; data PRZEDM.SZCZUR
067d  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0681  751c                 jne 0x69f                         
0683  bf0000               mov di, 0                          ; data System.OUTPUT
0686  1e                   push ds                           
0687  57                   push di                           
0688  bf0000               mov di, 0                          ; string "JEST TUTAJ SZCZUR,TAK WIELKI ZE WIEKSZEGO NIE WIDZIALES"
068b  0e                   push cs                           
068c  57                   push di                           
068d  31c0                 xor ax, ax                        
068f  50                   push ax                           
0690  9a00000000           lcall 0, 0                         ; call System.WriteString
0695  9a00000000           lcall 0, 0                         ; call System.WriteLn
069a  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:580
069f  a10000               mov ax, word ptr [0]               ; data PRZEDM.LIS
06a2  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
06a6  751c                 jne 0x6c4                         
06a8  bf0000               mov di, 0                          ; data System.OUTPUT
06ab  1e                   push ds                           
06ac  57                   push di                           
06ad  bf0000               mov di, 0                          ; string "CHYTRY LIS SZUKA SPOSOBU BY CIE ZABIC"
06b0  0e                   push cs                           
06b1  57                   push di                           
06b2  31c0                 xor ax, ax                        
06b4  50                   push ax                           
06b5  9a00000000           lcall 0, 0                         ; call System.WriteString
06ba  9a00000000           lcall 0, 0                         ; call System.WriteLn
06bf  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:581
06c4  a10000               mov ax, word ptr [0]               ; data PRZEDM.KUROPATWA
06c7  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
06cb  751c                 jne 0x6e9                         
06cd  bf0000               mov di, 0                          ; data System.OUTPUT
06d0  1e                   push ds                           
06d1  57                   push di                           
06d2  bf0000               mov di, 0                          ; string "KUROPATWA PO PROSTU JEST TU"
06d5  0e                   push cs                           
06d6  57                   push di                           
06d7  31c0                 xor ax, ax                        
06d9  50                   push ax                           
06da  9a00000000           lcall 0, 0                         ; call System.WriteString
06df  9a00000000           lcall 0, 0                         ; call System.WriteLn
06e4  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:582
06e9  a10000               mov ax, word ptr [0]               ; data PRZEDM.ZAJAC
06ec  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
06f0  751c                 jne 0x70e                         
06f2  bf0000               mov di, 0                          ; data System.OUTPUT
06f5  1e                   push ds                           
06f6  57                   push di                           
06f7  bf0000               mov di, 0                          ; string "ZAJAC KICA SOBIE SPIEWAJAC \"POMYLONE MISIE\""
06fa  0e                   push cs                           
06fb  57                   push di                           
06fc  31c0                 xor ax, ax                        
06fe  50                   push ax                           
06ff  9a00000000           lcall 0, 0                         ; call System.WriteString
0704  9a00000000           lcall 0, 0                         ; call System.WriteLn
0709  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:583
070e  a10000               mov ax, word ptr [0]               ; data PRZEDM.WILCZUR
0711  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0715  751c                 jne 0x733                         
0717  bf0000               mov di, 0                          ; data System.OUTPUT
071a  1e                   push ds                           
071b  57                   push di                           
071c  bf0000               mov di, 0                          ; string "CZARNY WILCZUR PO KRZYWEJ SIE TOCZY (MU PIANA Z UST)"
071f  0e                   push cs                           
0720  57                   push di                           
0721  31c0                 xor ax, ax                        
0723  50                   push ax                           
0724  9a00000000           lcall 0, 0                         ; call System.WriteString
0729  9a00000000           lcall 0, 0                         ; call System.WriteLn
072e  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:584
0733  a10000               mov ax, word ptr [0]               ; data PRZEDM.ORZEL
0736  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
073a  751c                 jne 0x758                         
073c  bf0000               mov di, 0                          ; data System.OUTPUT
073f  1e                   push ds                           
0740  57                   push di                           
0741  bf0000               mov di, 0                          ; string "ORZEL SZYBUJE W POWIETRZYU W POSZUKIWANIU OFIARY"
0744  0e                   push cs                           
0745  57                   push di                           
0746  31c0                 xor ax, ax                        
0748  50                   push ax                           
0749  9a00000000           lcall 0, 0                         ; call System.WriteString
074e  9a00000000           lcall 0, 0                         ; call System.WriteLn
0753  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:585
0758  a10000               mov ax, word ptr [0]               ; data PRZEDM.SARNA
075b  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
075f  751c                 jne 0x77d                         
0761  bf0000               mov di, 0                          ; data System.OUTPUT
0764  1e                   push ds                           
0765  57                   push di                           
0766  bf0000               mov di, 0                          ; string "SARNA SKASZE SOBIE NIE ZDAJAC SOBIE SPRAWY ZE ZARAZ ZGINIE"
0769  0e                   push cs                           
076a  57                   push di                           
076b  31c0                 xor ax, ax                        
076d  50                   push ax                           
076e  9a00000000           lcall 0, 0                         ; call System.WriteString
0773  9a00000000           lcall 0, 0                         ; call System.WriteLn
0778  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:586
077d  a10000               mov ax, word ptr [0]               ; data PRZEDM.SLON
0780  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0784  751c                 jne 0x7a2                         
0786  bf0000               mov di, 0                          ; data System.OUTPUT
0789  1e                   push ds                           
078a  57                   push di                           
078b  bf0000               mov di, 0                          ; string "OGROMNIASTY SLON ZGNIATA WSZYSTKO CO NAPOTKA"
078e  0e                   push cs                           
078f  57                   push di                           
0790  31c0                 xor ax, ax                        
0792  50                   push ax                           
0793  9a00000000           lcall 0, 0                         ; call System.WriteString
0798  9a00000000           lcall 0, 0                         ; call System.WriteLn
079d  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:587
07a2  a10000               mov ax, word ptr [0]               ; data PRZEDM.LEW
07a5  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
07a9  751c                 jne 0x7c7                         
07ab  bf0000               mov di, 0                          ; data System.OUTPUT
07ae  1e                   push ds                           
07af  57                   push di                           
07b0  bf0000               mov di, 0                          ; string "LEW - KROL ZWIERZAT WLASNIE ZABIJA NIEWINNE DZIECKO ROZWALAJAC JEGO MOZG"
07b3  0e                   push cs                           
07b4  57                   push di                           
07b5  31c0                 xor ax, ax                        
07b7  50                   push ax                           
07b8  9a00000000           lcall 0, 0                         ; call System.WriteString
07bd  9a00000000           lcall 0, 0                         ; call System.WriteLn
07c2  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:588
07c7  a10000               mov ax, word ptr [0]               ; data PRZEDM.ZYRAFA
07ca  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
07ce  751c                 jne 0x7ec                         
07d0  bf0000               mov di, 0                          ; data System.OUTPUT
07d3  1e                   push ds                           
07d4  57                   push di                           
07d5  bf0000               mov di, 0                          ; string "ZYRAFA KTORA TU STOI NIE SZUKA ZACZEPKI"
07d8  0e                   push cs                           
07d9  57                   push di                           
07da  31c0                 xor ax, ax                        
07dc  50                   push ax                           
07dd  9a00000000           lcall 0, 0                         ; call System.WriteString
07e2  9a00000000           lcall 0, 0                         ; call System.WriteLn
07e7  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:589
07ec  a10000               mov ax, word ptr [0]               ; data PRZEDM.WIELBLAD
07ef  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
07f3  751c                 jne 0x811                         
07f5  bf0000               mov di, 0                          ; data System.OUTPUT
07f8  1e                   push ds                           
07f9  57                   push di                           
07fa  bf0000               mov di, 0                          ; string "WIELBLAD KORZYSTA Z GARBOW UZYWAJAC ICH JAKO SMIERTELNEJ BRONI"
07fd  0e                   push cs                           
07fe  57                   push di                           
07ff  31c0                 xor ax, ax                        
0801  50                   push ax                           
0802  9a00000000           lcall 0, 0                         ; call System.WriteString
0807  9a00000000           lcall 0, 0                         ; call System.WriteLn
080c  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:590
0811  a10000               mov ax, word ptr [0]               ; data PRZEDM.STRUS
0814  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0818  751c                 jne 0x836                         
081a  bf0000               mov di, 0                          ; data System.OUTPUT
081d  1e                   push ds                           
081e  57                   push di                           
081f  bf0000               mov di, 0                          ; string "STRUS NIE CHOWA GLOWY W PIASEK BO JEST NA BETONIE"
0822  0e                   push cs                           
0823  57                   push di                           
0824  31c0                 xor ax, ax                        
0826  50                   push ax                           
0827  9a00000000           lcall 0, 0                         ; call System.WriteString
082c  9a00000000           lcall 0, 0                         ; call System.WriteLn
0831  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:591
0836  a10000               mov ax, word ptr [0]               ; data PRZEDM.BOA
0839  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
083d  751c                 jne 0x85b                         
083f  bf0000               mov di, 0                          ; data System.OUTPUT
0842  1e                   push ds                           
0843  57                   push di                           
0844  bf0000               mov di, 0                          ; string "BOA DUSICIEL WLASNIE ZJADL KROWE "
0847  0e                   push cs                           
0848  57                   push di                           
0849  31c0                 xor ax, ax                        
084b  50                   push ax                           
084c  9a00000000           lcall 0, 0                         ; call System.WriteString
0851  9a00000000           lcall 0, 0                         ; call System.WriteLn
0856  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:592
085b  a10000               mov ax, word ptr [0]               ; data PRZEDM.WILK
085e  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0862  751c                 jne 0x880                         
0864  bf0000               mov di, 0                          ; data System.OUTPUT
0867  1e                   push ds                           
0868  57                   push di                           
0869  bf0000               mov di, 0                          ; string "WILK CHORY NA WSCIEKLIZNE PANOSZY SIE W OKOLICY"
086c  0e                   push cs                           
086d  57                   push di                           
086e  31c0                 xor ax, ax                        
0870  50                   push ax                           
0871  9a00000000           lcall 0, 0                         ; call System.WriteString
0876  9a00000000           lcall 0, 0                         ; call System.WriteLn
087b  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:593
0880  a10000               mov ax, word ptr [0]               ; data PRZEDM.BIZON
0883  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
0887  751c                 jne 0x8a5                         
0889  bf0000               mov di, 0                          ; data System.OUTPUT
088c  1e                   push ds                           
088d  57                   push di                           
088e  bf0000               mov di, 0                          ; string "NIEWINNY BIZON MORDUJE WLASNIE PUBLICZNOSC"
0891  0e                   push cs                           
0892  57                   push di                           
0893  31c0                 xor ax, ax                        
0895  50                   push ax                           
0896  9a00000000           lcall 0, 0                         ; call System.WriteString
089b  9a00000000           lcall 0, 0                         ; call System.WriteLn
08a0  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:594
08a5  a10000               mov ax, word ptr [0]               ; data PRZEDM.PANTERA
08a8  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
08ac  751c                 jne 0x8ca                         
08ae  bf0000               mov di, 0                          ; data System.OUTPUT
08b1  1e                   push ds                           
08b2  57                   push di                           
08b3  bf0000               mov di, 0                          ; string "ZWINNA PANTERA NUDZI SIE POLYKAJAC RESZTKI LUDZKIEGO MIESA"
08b6  0e                   push cs                           
08b7  57                   push di                           
08b8  31c0                 xor ax, ax                        
08ba  50                   push ax                           
08bb  9a00000000           lcall 0, 0                         ; call System.WriteString
08c0  9a00000000           lcall 0, 0                         ; call System.WriteLn
08c5  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:595
08ca  a10000               mov ax, word ptr [0]               ; data PRZEDM.GLADIATOR
08cd  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
08d1  751c                 jne 0x8ef                         
08d3  bf0000               mov di, 0                          ; data System.OUTPUT
08d6  1e                   push ds                           
08d7  57                   push di                           
08d8  bf0000               mov di, 0                          ; string "GLADIATOR ZDOBYWA TUTAJ KUNSZT"
08db  0e                   push cs                           
08dc  57                   push di                           
08dd  31c0                 xor ax, ax                        
08df  50                   push ax                           
08e0  9a00000000           lcall 0, 0                         ; call System.WriteString
08e5  9a00000000           lcall 0, 0                         ; call System.WriteLn
08ea  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:596
08ef  a10000               mov ax, word ptr [0]               ; data PRZEDM.WOJOWNIK
08f2  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
08f6  751c                 jne 0x914                         
08f8  bf0000               mov di, 0                          ; data System.OUTPUT
08fb  1e                   push ds                           
08fc  57                   push di                           
08fd  bf0000               mov di, 0                          ; string "WOJOWNIK GREEN PEACE MORDUJE TUTAJ BEZBRONNE LWIATKA :( "
0900  0e                   push cs                           
0901  57                   push di                           
0902  31c0                 xor ax, ax                        
0904  50                   push ax                           
0905  9a00000000           lcall 0, 0                         ; call System.WriteString
090a  9a00000000           lcall 0, 0                         ; call System.WriteLn
090f  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:597
0914  a10000               mov ax, word ptr [0]               ; data PRZEDM.TRENER
0917  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MIECHO
091b  751c                 jne 0x939                         
091d  bf0000               mov di, 0                          ; data System.OUTPUT
0920  1e                   push ds                           
0921  57                   push di                           
0922  bf0000               mov di, 0                          ; string "TRENER CYRKU LAPIE ZWIERZETA NA SWOJE PRZEDSTAWIENIE"
0925  0e                   push cs                           
0926  57                   push di                           
0927  31c0                 xor ax, ax                        
0929  50                   push ax                           
092a  9a00000000           lcall 0, 0                         ; call System.WriteString
092f  9a00000000           lcall 0, 0                         ; call System.WriteLn
0934  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:598
0939  5d                   pop bp                            
093a  cb                   retf                              
```

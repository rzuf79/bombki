# `PRZEDM.MINIARENA`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:1124-1433`
- TPU code block: `0x00e8`
- Procedure bytes: `0x0299`–`0x1689`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.ARENA`
- `PRZEDM.BAKTERIA`
- `PRZEDM.BIZON`
- `PRZEDM.BOA`
- `PRZEDM.DZIK`
- `PRZEDM.ENERGIA`
- `PRZEDM.GLADIATOR`
- `PRZEDM.KARALUCH`
- `PRZEDM.KORNIK`
- `PRZEDM.KUNSZT`
- `PRZEDM.KUROPATWA`
- `PRZEDM.LEW`
- `PRZEDM.LIS`
- `PRZEDM.MIECHO`
- `PRZEDM.MROWKA`
- `PRZEDM.MUCHA`
- `PRZEDM.ORZEL`
- `PRZEDM.PAJAK`
- `PRZEDM.PANTERA`
- `PRZEDM.PASZOL`
- `PRZEDM.SARNA`
- `PRZEDM.SLIMAK`
- `PRZEDM.SLON`
- `PRZEDM.STOP`
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
- `PRZEDM.wpisz`
- `System.INPUT`
- `System.OUTPUT`

## Calls

- `PRZEDM.GARNITURZYSK`
- `PRZEDM.KOMENDY`
- `PRZEDM.KTO`
- `PRZEDM.MNIEJSLABO`
- `PRZEDM.MODE`
- `PRZEDM.PIGULKAZYSK`
- `PRZEDM.SLABO`
- `PRZEDM.SREDNIO`
- `PRZEDM.TRUDNO`
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

- `"JESTES NA ARENIE I CZUJESZ POTRZEBE ZABIJANIA"`
- `"%."`
- `"MODE"`
- `"ZABIJ BAKTERIA"`
- `"BUUUUU! BIEDNA BAKTERIA "`
- `"ZABIJ SLIMAK"`
- `"ZABIJ KORNIK"`
- `"ZABIJ MUCHA"`
- `"ZABIJ ZUK"`
- `"ZABIJ KARALUCH"`
- `"ZABIJ MROWKA"`
- `"ZABIJ PAJAK"`
- `"ZABIJ DZIK"`
- `"ZABIJ WILCZUR"`
- `"WILCZUR PRZYJA PROPOZYCJE Z GODNOSCIA"`
- `"ZABIJ SZCZUR"`
- `"ZABIJ LIS"`
- `"ZABIJ KUROPATWA"`
- `"ZABIJ ZAJAC"`
- `"ZABIJ ORZEL"`
- `"ZABIJ SARNA"`
- `"ZABIJ SLON"`
- `"ZABIJ LEW"`
- `"ZABIJ ZYRAFA"`
- `"ZABIJ WILK"`
- `"ZABIJ WIELBLAD"`
- `"ZABIJ STRUS"`
- `"ZABIJ BOA"`
- `"ZABIJ BIZON"`
- `"ZABIJ PANTERA"`
- `"ZABIJ GLADIATOR"`
- `"ZABIJ WOJOWNIK"`
- `"ZABIJ TRENER"`
- `"EXIT"`
- `"DOSTEPNE WYJSCIA:"`
- `"POLODNIE-WEJSCIE NA ARENE"`
- `"POLNOC-ARENA"`
- `"WSCHOD-ARENA"`
- `"ZACHOD-ARENA"`
- `"POLODNIE-ARENA"`
- `"MOZESZ WYJSC NA :"`
- `"MOZESZ ISC NA :"`
- `"DOSTEPNE WYJSCIE:"`
- `"WYJSCIE"`
- `"POLODNIE"`
- `"POLNOC"`
- `"WSCHOD"`
- `"ZACHOD"`

## Annotated listing

```asm
; PRZEDM.PAS:1124
0299  55                   push bp                           
029a  89e5                 mov bp, sp                        
029c  31c0                 xor ax, ax                        
029e  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:1125
02a3  833e000021           cmp word ptr [0], 0x21             ; data PRZEDM.MIECHO
02a8  7503                 jne 0x2ad                         
02aa  e9bd00               jmp 0x36a                         
02ad  833e000022           cmp word ptr [0], 0x22             ; data PRZEDM.MIECHO
02b2  7503                 jne 0x2b7                         
02b4  e9b300               jmp 0x36a                         
02b7  833e000023           cmp word ptr [0], 0x23             ; data PRZEDM.MIECHO
02bc  7503                 jne 0x2c1                         
02be  e9a900               jmp 0x36a                         
02c1  833e000024           cmp word ptr [0], 0x24             ; data PRZEDM.MIECHO
02c6  7503                 jne 0x2cb                         
02c8  e99f00               jmp 0x36a                         
02cb  833e000025           cmp word ptr [0], 0x25             ; data PRZEDM.MIECHO
02d0  7503                 jne 0x2d5                         
02d2  e99500               jmp 0x36a                         
02d5  833e000026           cmp word ptr [0], 0x26             ; data PRZEDM.MIECHO
02da  7503                 jne 0x2df                         
02dc  e98b00               jmp 0x36a                         
02df  833e000027           cmp word ptr [0], 0x27             ; data PRZEDM.MIECHO
02e4  7503                 jne 0x2e9                         
02e6  e98100               jmp 0x36a                         
02e9  833e000028           cmp word ptr [0], 0x28             ; data PRZEDM.MIECHO
02ee  747a                 je 0x36a                          
02f0  833e000029           cmp word ptr [0], 0x29             ; data PRZEDM.MIECHO
02f5  7473                 je 0x36a                          
02f7  833e00002a           cmp word ptr [0], 0x2a             ; data PRZEDM.MIECHO
02fc  746c                 je 0x36a                          
02fe  833e00002b           cmp word ptr [0], 0x2b             ; data PRZEDM.MIECHO
0303  7465                 je 0x36a                          
0305  833e00002c           cmp word ptr [0], 0x2c             ; data PRZEDM.MIECHO
030a  745e                 je 0x36a                          
030c  833e00002d           cmp word ptr [0], 0x2d             ; data PRZEDM.MIECHO
0311  7457                 je 0x36a                          
0313  833e00002e           cmp word ptr [0], 0x2e             ; data PRZEDM.MIECHO
0318  7450                 je 0x36a                          
031a  833e00002f           cmp word ptr [0], 0x2f             ; data PRZEDM.MIECHO
031f  7449                 je 0x36a                          
0321  833e000030           cmp word ptr [0], 0x30             ; data PRZEDM.MIECHO
0326  7442                 je 0x36a                          
0328  833e000031           cmp word ptr [0], 0x31             ; data PRZEDM.MIECHO
032d  743b                 je 0x36a                          
032f  833e000032           cmp word ptr [0], 0x32             ; data PRZEDM.MIECHO
0334  7434                 je 0x36a                          
0336  833e000033           cmp word ptr [0], 0x33             ; data PRZEDM.MIECHO
033b  742d                 je 0x36a                          
033d  833e000034           cmp word ptr [0], 0x34             ; data PRZEDM.MIECHO
0342  7426                 je 0x36a                          
0344  833e000035           cmp word ptr [0], 0x35             ; data PRZEDM.MIECHO
0349  741f                 je 0x36a                          
034b  833e000036           cmp word ptr [0], 0x36             ; data PRZEDM.MIECHO
0350  7418                 je 0x36a                          
0352  833e000037           cmp word ptr [0], 0x37             ; data PRZEDM.MIECHO
0357  7411                 je 0x36a                          
0359  833e000038           cmp word ptr [0], 0x38             ; data PRZEDM.MIECHO
035e  740a                 je 0x36a                          
0360  833e000039           cmp word ptr [0], 0x39             ; data PRZEDM.MIECHO
0365  7403                 je 0x36a                          
0367  e91d13               jmp 0x1687                        
; PRZEDM.PAS:1131
036a  c70600000100         mov word ptr [0], 1                ; data PRZEDM.ARENA
; PRZEDM.PAS:1132
0370  bf0000               mov di, 0                          ; data System.OUTPUT
0373  1e                   push ds                           
0374  57                   push di                           
0375  bf0000               mov di, 0                          ; string "JESTES NA ARENIE I CZUJESZ POTRZEBE ZABIJANIA"
0378  0e                   push cs                           
0379  57                   push di                           
037a  31c0                 xor ax, ax                        
037c  50                   push ax                           
037d  9a00000000           lcall 0, 0                         ; call System.WriteString
0382  9a00000000           lcall 0, 0                         ; call System.WriteLn
0387  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1133
038c  0e                   push cs                           
038d  e80000               call 0x390                         ; call PRZEDM.KTO
; PRZEDM.PAS:1135
0390  bf0000               mov di, 0                          ; data System.OUTPUT
0393  1e                   push ds                           
0394  57                   push di                           
0395  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
0398  99                   cwd                               
0399  52                   push dx                           
039a  50                   push ax                           
039b  31c0                 xor ax, ax                        
039d  50                   push ax                           
039e  9a00000000           lcall 0, 0                         ; call System.WriteInteger
03a3  bf0000               mov di, 0                          ; string "%."
03a6  0e                   push cs                           
03a7  57                   push di                           
03a8  31c0                 xor ax, ax                        
03aa  50                   push ax                           
03ab  9a00000000           lcall 0, 0                         ; call System.WriteString
03b0  a10000               mov ax, word ptr [0]               ; data PRZEDM.KUNSZT
03b3  99                   cwd                               
03b4  52                   push dx                           
03b5  50                   push ax                           
03b6  31c0                 xor ax, ax                        
03b8  50                   push ax                           
03b9  9a00000000           lcall 0, 0                         ; call System.WriteInteger
03be  b03e                 mov al, 0x3e                      
03c0  50                   push ax                           
03c1  31c0                 xor ax, ax                        
03c3  50                   push ax                           
03c4  9a00000000           lcall 0, 0                         ; call System.WriteChar
03c9  9a00000000           lcall 0, 0                         ; call System.WriteEnd
03ce  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1136
03d3  bf0000               mov di, 0                          ; data System.INPUT
03d6  1e                   push ds                           
03d7  57                   push di                           
03d8  bf0000               mov di, 0                          ; data PRZEDM.wpisz
03db  1e                   push ds                           
03dc  57                   push di                           
03dd  b8ff00               mov ax, 0xff                      
03e0  50                   push ax                           
03e1  9a00000000           lcall 0, 0                         ; call System.ReadString
03e6  9a00000000           lcall 0, 0                         ; call System.ReadLn
03eb  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1137
03f0  0e                   push cs                           
03f1  e80000               call 0x3f4                         ; call PRZEDM.KOMENDY
; PRZEDM.PAS:1138
03f4  bf0000               mov di, 0                          ; data PRZEDM.wpisz
03f7  1e                   push ds                           
03f8  57                   push di                           
03f9  bf0000               mov di, 0                          ; string "MODE"
03fc  0e                   push cs                           
03fd  57                   push di                           
03fe  9a00000000           lcall 0, 0                         ; call System.CompareString
0403  7504                 jne 0x409                         
0405  0e                   push cs                           
0406  e80000               call 0x409                         ; call PRZEDM.MODE
; PRZEDM.PAS:1139
0409  bf0000               mov di, 0                          ; data PRZEDM.wpisz
040c  1e                   push ds                           
040d  57                   push di                           
040e  bf0000               mov di, 0                          ; string "ZABIJ BAKTERIA"
0411  0e                   push cs                           
0412  57                   push di                           
0413  9a00000000           lcall 0, 0                         ; call System.CompareString
0418  752e                 jne 0x448                         
041a  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
041d  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.BAKTERIA
0421  7525                 jne 0x448                         
; PRZEDM.PAS:1140
0423  0e                   push cs                           
0424  e80000               call 0x427                         ; call PRZEDM.SLABO
; PRZEDM.PAS:1141
0427  31c0                 xor ax, ax                        
0429  a30000               mov word ptr [0], ax               ; data PRZEDM.BAKTERIA
; PRZEDM.PAS:1142
042c  bf0000               mov di, 0                          ; data System.OUTPUT
042f  1e                   push ds                           
0430  57                   push di                           
0431  bf0000               mov di, 0                          ; string "BUUUUU! BIEDNA BAKTERIA "
0434  0e                   push cs                           
0435  57                   push di                           
0436  31c0                 xor ax, ax                        
0438  50                   push ax                           
0439  9a00000000           lcall 0, 0                         ; call System.WriteString
043e  9a00000000           lcall 0, 0                         ; call System.WriteLn
0443  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1144
0448  bf0000               mov di, 0                          ; data PRZEDM.wpisz
044b  1e                   push ds                           
044c  57                   push di                           
044d  bf0000               mov di, 0                          ; string "ZABIJ SLIMAK"
0450  0e                   push cs                           
0451  57                   push di                           
0452  9a00000000           lcall 0, 0                         ; call System.CompareString
0457  7519                 jne 0x472                         
0459  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
045c  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.SLIMAK
0460  7510                 jne 0x472                         
; PRZEDM.PAS:1145
0462  0e                   push cs                           
0463  e80000               call 0x466                         ; call PRZEDM.SLABO
; PRZEDM.PAS:1146
0466  833e000000           cmp word ptr [0], 0                ; data PRZEDM.PASZOL
046b  7505                 jne 0x472                         
046d  31c0                 xor ax, ax                        
046f  a30000               mov word ptr [0], ax               ; data PRZEDM.SLIMAK
; PRZEDM.PAS:1148
0472  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0475  1e                   push ds                           
0476  57                   push di                           
0477  bf0000               mov di, 0                          ; string "ZABIJ KORNIK"
047a  0e                   push cs                           
047b  57                   push di                           
047c  9a00000000           lcall 0, 0                         ; call System.CompareString
0481  7519                 jne 0x49c                         
0483  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
0486  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.KORNIK
048a  7510                 jne 0x49c                         
; PRZEDM.PAS:1149
048c  0e                   push cs                           
048d  e80000               call 0x490                         ; call PRZEDM.SLABO
; PRZEDM.PAS:1150
0490  833e000000           cmp word ptr [0], 0                ; data PRZEDM.PASZOL
0495  7505                 jne 0x49c                         
0497  31c0                 xor ax, ax                        
0499  a30000               mov word ptr [0], ax               ; data PRZEDM.KORNIK
; PRZEDM.PAS:1152
049c  bf0000               mov di, 0                          ; data PRZEDM.wpisz
049f  1e                   push ds                           
04a0  57                   push di                           
04a1  bf0000               mov di, 0                          ; string "ZABIJ MUCHA"
04a4  0e                   push cs                           
04a5  57                   push di                           
04a6  9a00000000           lcall 0, 0                         ; call System.CompareString
04ab  7519                 jne 0x4c6                         
04ad  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
04b0  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MUCHA
04b4  7510                 jne 0x4c6                         
; PRZEDM.PAS:1153
04b6  0e                   push cs                           
04b7  e80000               call 0x4ba                         ; call PRZEDM.SLABO
; PRZEDM.PAS:1154
04ba  833e000000           cmp word ptr [0], 0                ; data PRZEDM.PASZOL
04bf  7505                 jne 0x4c6                         
04c1  31c0                 xor ax, ax                        
04c3  a30000               mov word ptr [0], ax               ; data PRZEDM.MUCHA
; PRZEDM.PAS:1157
04c6  bf0000               mov di, 0                          ; data PRZEDM.wpisz
04c9  1e                   push ds                           
04ca  57                   push di                           
04cb  bf0000               mov di, 0                          ; string "ZABIJ ZUK"
04ce  0e                   push cs                           
04cf  57                   push di                           
04d0  9a00000000           lcall 0, 0                         ; call System.CompareString
04d5  7519                 jne 0x4f0                         
04d7  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
04da  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.ZUK
04de  7510                 jne 0x4f0                         
; PRZEDM.PAS:1158
04e0  0e                   push cs                           
04e1  e80000               call 0x4e4                         ; call PRZEDM.SLABO
; PRZEDM.PAS:1159
04e4  833e000000           cmp word ptr [0], 0                ; data PRZEDM.PASZOL
04e9  7505                 jne 0x4f0                         
04eb  31c0                 xor ax, ax                        
04ed  a30000               mov word ptr [0], ax               ; data PRZEDM.ZUK
; PRZEDM.PAS:1161
04f0  bf0000               mov di, 0                          ; data PRZEDM.wpisz
04f3  1e                   push ds                           
04f4  57                   push di                           
04f5  bf0000               mov di, 0                          ; string "ZABIJ KARALUCH"
04f8  0e                   push cs                           
04f9  57                   push di                           
04fa  9a00000000           lcall 0, 0                         ; call System.CompareString
04ff  7512                 jne 0x513                         
0501  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
0504  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.KARALUCH
0508  7509                 jne 0x513                         
; PRZEDM.PAS:1162
050a  0e                   push cs                           
050b  e80000               call 0x50e                         ; call PRZEDM.SLABO
; PRZEDM.PAS:1163
050e  31c0                 xor ax, ax                        
0510  a30000               mov word ptr [0], ax               ; data PRZEDM.KARALUCH
; PRZEDM.PAS:1165
0513  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0516  1e                   push ds                           
0517  57                   push di                           
0518  bf0000               mov di, 0                          ; string "ZABIJ MROWKA"
051b  0e                   push cs                           
051c  57                   push di                           
051d  9a00000000           lcall 0, 0                         ; call System.CompareString
0522  7512                 jne 0x536                         
0524  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
0527  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.MROWKA
052b  7509                 jne 0x536                         
; PRZEDM.PAS:1166
052d  0e                   push cs                           
052e  e80000               call 0x531                         ; call PRZEDM.SLABO
; PRZEDM.PAS:1167
0531  31c0                 xor ax, ax                        
0533  a30000               mov word ptr [0], ax               ; data PRZEDM.MROWKA
; PRZEDM.PAS:1169
0536  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0539  1e                   push ds                           
053a  57                   push di                           
053b  bf0000               mov di, 0                          ; string "ZABIJ PAJAK"
053e  0e                   push cs                           
053f  57                   push di                           
0540  9a00000000           lcall 0, 0                         ; call System.CompareString
0545  7512                 jne 0x559                         
0547  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
054a  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.PAJAK
054e  7509                 jne 0x559                         
; PRZEDM.PAS:1170
0550  0e                   push cs                           
0551  e80000               call 0x554                         ; call PRZEDM.SLABO
; PRZEDM.PAS:1171
0554  31c0                 xor ax, ax                        
0556  a30000               mov word ptr [0], ax               ; data PRZEDM.PAJAK
; PRZEDM.PAS:1173
0559  bf0000               mov di, 0                          ; data PRZEDM.wpisz
055c  1e                   push ds                           
055d  57                   push di                           
055e  bf0000               mov di, 0                          ; string "ZABIJ DZIK"
0561  0e                   push cs                           
0562  57                   push di                           
0563  9a00000000           lcall 0, 0                         ; call System.CompareString
0568  7512                 jne 0x57c                         
056a  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
056d  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.DZIK
0571  7509                 jne 0x57c                         
; PRZEDM.PAS:1174
0573  0e                   push cs                           
0574  e80000               call 0x577                         ; call PRZEDM.MNIEJSLABO
; PRZEDM.PAS:1175
0577  31c0                 xor ax, ax                        
0579  a30000               mov word ptr [0], ax               ; data PRZEDM.DZIK
; PRZEDM.PAS:1177
057c  bf0000               mov di, 0                          ; data PRZEDM.wpisz
057f  1e                   push ds                           
0580  57                   push di                           
0581  bf0000               mov di, 0                          ; string "ZABIJ WILCZUR"
0584  0e                   push cs                           
0585  57                   push di                           
0586  9a00000000           lcall 0, 0                         ; call System.CompareString
058b  752e                 jne 0x5bb                         
058d  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
0590  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.WILCZUR
0594  7525                 jne 0x5bb                         
; PRZEDM.PAS:1178
0596  bf0000               mov di, 0                          ; data System.OUTPUT
0599  1e                   push ds                           
059a  57                   push di                           
059b  bf0000               mov di, 0                          ; string "WILCZUR PRZYJA PROPOZYCJE Z GODNOSCIA"
059e  0e                   push cs                           
059f  57                   push di                           
05a0  31c0                 xor ax, ax                        
05a2  50                   push ax                           
05a3  9a00000000           lcall 0, 0                         ; call System.WriteString
05a8  9a00000000           lcall 0, 0                         ; call System.WriteLn
05ad  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1179
05b2  0e                   push cs                           
05b3  e80000               call 0x5b6                         ; call PRZEDM.MNIEJSLABO
; PRZEDM.PAS:1180
05b6  31c0                 xor ax, ax                        
05b8  a30000               mov word ptr [0], ax               ; data PRZEDM.WILCZUR
; PRZEDM.PAS:1183
05bb  bf0000               mov di, 0                          ; data PRZEDM.wpisz
05be  1e                   push ds                           
05bf  57                   push di                           
05c0  bf0000               mov di, 0                          ; string "ZABIJ SZCZUR"
05c3  0e                   push cs                           
05c4  57                   push di                           
05c5  9a00000000           lcall 0, 0                         ; call System.CompareString
05ca  7512                 jne 0x5de                         
05cc  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
05cf  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.SZCZUR
05d3  7509                 jne 0x5de                         
; PRZEDM.PAS:1184
05d5  0e                   push cs                           
05d6  e80000               call 0x5d9                         ; call PRZEDM.MNIEJSLABO
; PRZEDM.PAS:1185
05d9  31c0                 xor ax, ax                        
05db  a30000               mov word ptr [0], ax               ; data PRZEDM.SZCZUR
; PRZEDM.PAS:1187
05de  bf0000               mov di, 0                          ; data PRZEDM.wpisz
05e1  1e                   push ds                           
05e2  57                   push di                           
05e3  bf0000               mov di, 0                          ; string "ZABIJ LIS"
05e6  0e                   push cs                           
05e7  57                   push di                           
05e8  9a00000000           lcall 0, 0                         ; call System.CompareString
05ed  7512                 jne 0x601                         
05ef  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
05f2  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.LIS
05f6  7509                 jne 0x601                         
; PRZEDM.PAS:1188
05f8  0e                   push cs                           
05f9  e80000               call 0x5fc                         ; call PRZEDM.MNIEJSLABO
; PRZEDM.PAS:1189
05fc  31c0                 xor ax, ax                        
05fe  a30000               mov word ptr [0], ax               ; data PRZEDM.LIS
; PRZEDM.PAS:1191
0601  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0604  1e                   push ds                           
0605  57                   push di                           
0606  bf0000               mov di, 0                          ; string "ZABIJ KUROPATWA"
0609  0e                   push cs                           
060a  57                   push di                           
060b  9a00000000           lcall 0, 0                         ; call System.CompareString
0610  7512                 jne 0x624                         
0612  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
0615  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.KUROPATWA
0619  7509                 jne 0x624                         
; PRZEDM.PAS:1192
061b  0e                   push cs                           
061c  e80000               call 0x61f                         ; call PRZEDM.MNIEJSLABO
; PRZEDM.PAS:1193
061f  31c0                 xor ax, ax                        
0621  a30000               mov word ptr [0], ax               ; data PRZEDM.KUROPATWA
; PRZEDM.PAS:1195
0624  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0627  1e                   push ds                           
0628  57                   push di                           
0629  bf0000               mov di, 0                          ; string "ZABIJ ZAJAC"
062c  0e                   push cs                           
062d  57                   push di                           
062e  9a00000000           lcall 0, 0                         ; call System.CompareString
0633  7512                 jne 0x647                         
0635  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
0638  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.ZAJAC
063c  7509                 jne 0x647                         
; PRZEDM.PAS:1196
063e  0e                   push cs                           
063f  e80000               call 0x642                         ; call PRZEDM.MNIEJSLABO
; PRZEDM.PAS:1197
0642  31c0                 xor ax, ax                        
0644  a30000               mov word ptr [0], ax               ; data PRZEDM.ZAJAC
; PRZEDM.PAS:1199
0647  bf0000               mov di, 0                          ; data PRZEDM.wpisz
064a  1e                   push ds                           
064b  57                   push di                           
064c  bf0000               mov di, 0                          ; string "ZABIJ ORZEL"
064f  0e                   push cs                           
0650  57                   push di                           
0651  9a00000000           lcall 0, 0                         ; call System.CompareString
0656  7512                 jne 0x66a                         
0658  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
065b  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.ORZEL
065f  7509                 jne 0x66a                         
; PRZEDM.PAS:1200
0661  0e                   push cs                           
0662  e80000               call 0x665                         ; call PRZEDM.MNIEJSLABO
; PRZEDM.PAS:1201
0665  31c0                 xor ax, ax                        
0667  a30000               mov word ptr [0], ax               ; data PRZEDM.ORZEL
; PRZEDM.PAS:1203
066a  bf0000               mov di, 0                          ; data PRZEDM.wpisz
066d  1e                   push ds                           
066e  57                   push di                           
066f  bf0000               mov di, 0                          ; string "ZABIJ SARNA"
0672  0e                   push cs                           
0673  57                   push di                           
0674  9a00000000           lcall 0, 0                         ; call System.CompareString
0679  7512                 jne 0x68d                         
067b  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
067e  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.SARNA
0682  7509                 jne 0x68d                         
; PRZEDM.PAS:1204
0684  0e                   push cs                           
0685  e80000               call 0x688                         ; call PRZEDM.MNIEJSLABO
; PRZEDM.PAS:1205
0688  31c0                 xor ax, ax                        
068a  a30000               mov word ptr [0], ax               ; data PRZEDM.SARNA
; PRZEDM.PAS:1207
068d  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0690  1e                   push ds                           
0691  57                   push di                           
0692  bf0000               mov di, 0                          ; string "ZABIJ SLON"
0695  0e                   push cs                           
0696  57                   push di                           
0697  9a00000000           lcall 0, 0                         ; call System.CompareString
069c  7512                 jne 0x6b0                         
069e  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
06a1  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.SLON
06a5  7509                 jne 0x6b0                         
; PRZEDM.PAS:1208
06a7  0e                   push cs                           
06a8  e80000               call 0x6ab                         ; call PRZEDM.SREDNIO
; PRZEDM.PAS:1209
06ab  31c0                 xor ax, ax                        
06ad  a30000               mov word ptr [0], ax               ; data PRZEDM.SLON
; PRZEDM.PAS:1211
06b0  bf0000               mov di, 0                          ; data PRZEDM.wpisz
06b3  1e                   push ds                           
06b4  57                   push di                           
06b5  bf0000               mov di, 0                          ; string "ZABIJ LEW"
06b8  0e                   push cs                           
06b9  57                   push di                           
06ba  9a00000000           lcall 0, 0                         ; call System.CompareString
06bf  7512                 jne 0x6d3                         
06c1  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
06c4  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.LEW
06c8  7509                 jne 0x6d3                         
; PRZEDM.PAS:1212
06ca  0e                   push cs                           
06cb  e80000               call 0x6ce                         ; call PRZEDM.SREDNIO
; PRZEDM.PAS:1213
06ce  31c0                 xor ax, ax                        
06d0  a30000               mov word ptr [0], ax               ; data PRZEDM.LEW
; PRZEDM.PAS:1215
06d3  bf0000               mov di, 0                          ; data PRZEDM.wpisz
06d6  1e                   push ds                           
06d7  57                   push di                           
06d8  bf0000               mov di, 0                          ; string "ZABIJ ZYRAFA"
06db  0e                   push cs                           
06dc  57                   push di                           
06dd  9a00000000           lcall 0, 0                         ; call System.CompareString
06e2  7512                 jne 0x6f6                         
06e4  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
06e7  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.ZYRAFA
06eb  7509                 jne 0x6f6                         
; PRZEDM.PAS:1216
06ed  0e                   push cs                           
06ee  e80000               call 0x6f1                         ; call PRZEDM.SREDNIO
; PRZEDM.PAS:1217
06f1  31c0                 xor ax, ax                        
06f3  a30000               mov word ptr [0], ax               ; data PRZEDM.ZYRAFA
; PRZEDM.PAS:1219
06f6  bf0000               mov di, 0                          ; data PRZEDM.wpisz
06f9  1e                   push ds                           
06fa  57                   push di                           
06fb  bf0000               mov di, 0                          ; string "ZABIJ WILK"
06fe  0e                   push cs                           
06ff  57                   push di                           
0700  9a00000000           lcall 0, 0                         ; call System.CompareString
0705  7512                 jne 0x719                         
0707  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
070a  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.WILK
070e  7509                 jne 0x719                         
; PRZEDM.PAS:1220
0710  0e                   push cs                           
0711  e80000               call 0x714                         ; call PRZEDM.SREDNIO
; PRZEDM.PAS:1221
0714  31c0                 xor ax, ax                        
0716  a30000               mov word ptr [0], ax               ; data PRZEDM.WILK
; PRZEDM.PAS:1223
0719  bf0000               mov di, 0                          ; data PRZEDM.wpisz
071c  1e                   push ds                           
071d  57                   push di                           
071e  bf0000               mov di, 0                          ; string "ZABIJ WIELBLAD"
0721  0e                   push cs                           
0722  57                   push di                           
0723  9a00000000           lcall 0, 0                         ; call System.CompareString
0728  7512                 jne 0x73c                         
072a  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
072d  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.WIELBLAD
0731  7509                 jne 0x73c                         
; PRZEDM.PAS:1224
0733  0e                   push cs                           
0734  e80000               call 0x737                         ; call PRZEDM.SREDNIO
; PRZEDM.PAS:1225
0737  31c0                 xor ax, ax                        
0739  a30000               mov word ptr [0], ax               ; data PRZEDM.WIELBLAD
; PRZEDM.PAS:1227
073c  bf0000               mov di, 0                          ; data PRZEDM.wpisz
073f  1e                   push ds                           
0740  57                   push di                           
0741  bf0000               mov di, 0                          ; string "ZABIJ STRUS"
0744  0e                   push cs                           
0745  57                   push di                           
0746  9a00000000           lcall 0, 0                         ; call System.CompareString
074b  7512                 jne 0x75f                         
074d  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
0750  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.STRUS
0754  7509                 jne 0x75f                         
; PRZEDM.PAS:1228
0756  0e                   push cs                           
0757  e80000               call 0x75a                         ; call PRZEDM.SREDNIO
; PRZEDM.PAS:1229
075a  31c0                 xor ax, ax                        
075c  a30000               mov word ptr [0], ax               ; data PRZEDM.STRUS
; PRZEDM.PAS:1231
075f  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0762  1e                   push ds                           
0763  57                   push di                           
0764  bf0000               mov di, 0                          ; string "ZABIJ BOA"
0767  0e                   push cs                           
0768  57                   push di                           
0769  9a00000000           lcall 0, 0                         ; call System.CompareString
076e  7512                 jne 0x782                         
0770  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
0773  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.BOA
0777  7509                 jne 0x782                         
; PRZEDM.PAS:1232
0779  0e                   push cs                           
077a  e80000               call 0x77d                         ; call PRZEDM.SREDNIO
; PRZEDM.PAS:1233
077d  31c0                 xor ax, ax                        
077f  a30000               mov word ptr [0], ax               ; data PRZEDM.BOA
; PRZEDM.PAS:1235
0782  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0785  1e                   push ds                           
0786  57                   push di                           
0787  bf0000               mov di, 0                          ; string "ZABIJ BIZON"
078a  0e                   push cs                           
078b  57                   push di                           
078c  9a00000000           lcall 0, 0                         ; call System.CompareString
0791  7512                 jne 0x7a5                         
0793  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
0796  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.BIZON
079a  7509                 jne 0x7a5                         
; PRZEDM.PAS:1236
079c  0e                   push cs                           
079d  e80000               call 0x7a0                         ; call PRZEDM.SREDNIO
; PRZEDM.PAS:1237
07a0  31c0                 xor ax, ax                        
07a2  a30000               mov word ptr [0], ax               ; data PRZEDM.BIZON
; PRZEDM.PAS:1239
07a5  bf0000               mov di, 0                          ; data PRZEDM.wpisz
07a8  1e                   push ds                           
07a9  57                   push di                           
07aa  bf0000               mov di, 0                          ; string "ZABIJ PANTERA"
07ad  0e                   push cs                           
07ae  57                   push di                           
07af  9a00000000           lcall 0, 0                         ; call System.CompareString
07b4  7512                 jne 0x7c8                         
07b6  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
07b9  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.PANTERA
07bd  7509                 jne 0x7c8                         
; PRZEDM.PAS:1240
07bf  0e                   push cs                           
07c0  e80000               call 0x7c3                         ; call PRZEDM.SREDNIO
; PRZEDM.PAS:1241
07c3  31c0                 xor ax, ax                        
07c5  a30000               mov word ptr [0], ax               ; data PRZEDM.PANTERA
; PRZEDM.PAS:1243
07c8  bf0000               mov di, 0                          ; data PRZEDM.wpisz
07cb  1e                   push ds                           
07cc  57                   push di                           
07cd  bf0000               mov di, 0                          ; string "ZABIJ GLADIATOR"
07d0  0e                   push cs                           
07d1  57                   push di                           
07d2  9a00000000           lcall 0, 0                         ; call System.CompareString
07d7  7516                 jne 0x7ef                         
07d9  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
07dc  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.GLADIATOR
07e0  750d                 jne 0x7ef                         
; PRZEDM.PAS:1244
07e2  0e                   push cs                           
07e3  e80000               call 0x7e6                         ; call PRZEDM.TRUDNO
; PRZEDM.PAS:1245
07e6  31c0                 xor ax, ax                        
07e8  a30000               mov word ptr [0], ax               ; data PRZEDM.GLADIATOR
; PRZEDM.PAS:1246
07eb  0e                   push cs                           
07ec  e80000               call 0x7ef                         ; call PRZEDM.PIGULKAZYSK
; PRZEDM.PAS:1248
07ef  bf0000               mov di, 0                          ; data PRZEDM.wpisz
07f2  1e                   push ds                           
07f3  57                   push di                           
07f4  bf0000               mov di, 0                          ; string "ZABIJ WOJOWNIK"
07f7  0e                   push cs                           
07f8  57                   push di                           
07f9  9a00000000           lcall 0, 0                         ; call System.CompareString
07fe  7516                 jne 0x816                         
0800  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
0803  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.WOJOWNIK
0807  750d                 jne 0x816                         
; PRZEDM.PAS:1249
0809  0e                   push cs                           
080a  e80000               call 0x80d                         ; call PRZEDM.TRUDNO
; PRZEDM.PAS:1250
080d  31c0                 xor ax, ax                        
080f  a30000               mov word ptr [0], ax               ; data PRZEDM.WOJOWNIK
; PRZEDM.PAS:1251
0812  0e                   push cs                           
0813  e80000               call 0x816                         ; call PRZEDM.PIGULKAZYSK
; PRZEDM.PAS:1253
0816  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0819  1e                   push ds                           
081a  57                   push di                           
081b  bf0000               mov di, 0                          ; string "ZABIJ TRENER"
081e  0e                   push cs                           
081f  57                   push di                           
0820  9a00000000           lcall 0, 0                         ; call System.CompareString
0825  7516                 jne 0x83d                         
0827  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
082a  3b060000             cmp ax, word ptr [0]               ; data PRZEDM.TRENER
082e  750d                 jne 0x83d                         
; PRZEDM.PAS:1254
0830  0e                   push cs                           
0831  e80000               call 0x834                         ; call PRZEDM.TRUDNO
; PRZEDM.PAS:1255
0834  31c0                 xor ax, ax                        
0836  a30000               mov word ptr [0], ax               ; data PRZEDM.TRENER
; PRZEDM.PAS:1256
0839  0e                   push cs                           
083a  e80000               call 0x83d                         ; call PRZEDM.GARNITURZYSK
; PRZEDM.PAS:1258
083d  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0840  1e                   push ds                           
0841  57                   push di                           
0842  bf0000               mov di, 0                          ; string "EXIT"
0845  0e                   push cs                           
0846  57                   push di                           
0847  9a00000000           lcall 0, 0                         ; call System.CompareString
084c  7403                 je 0x851                          
084e  e9dd04               jmp 0xd2e                         
; PRZEDM.PAS:1259
0851  833e000021           cmp word ptr [0], 0x21             ; data PRZEDM.MIECHO
0856  7403                 je 0x85b                          
0858  e98c00               jmp 0x8e7                         
; PRZEDM.PAS:1260
085b  bf0000               mov di, 0                          ; data System.OUTPUT
085e  1e                   push ds                           
085f  57                   push di                           
0860  bf0000               mov di, 0                          ; string "DOSTEPNE WYJSCIA:"
0863  0e                   push cs                           
0864  57                   push di                           
0865  31c0                 xor ax, ax                        
0867  50                   push ax                           
0868  9a00000000           lcall 0, 0                         ; call System.WriteString
086d  9a00000000           lcall 0, 0                         ; call System.WriteLn
0872  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1261
0877  bf0000               mov di, 0                          ; data System.OUTPUT
087a  1e                   push ds                           
087b  57                   push di                           
087c  bf0000               mov di, 0                          ; string "POLODNIE-WEJSCIE NA ARENE"
087f  0e                   push cs                           
0880  57                   push di                           
0881  31c0                 xor ax, ax                        
0883  50                   push ax                           
0884  9a00000000           lcall 0, 0                         ; call System.WriteString
0889  9a00000000           lcall 0, 0                         ; call System.WriteLn
088e  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1262
0893  bf0000               mov di, 0                          ; data System.OUTPUT
0896  1e                   push ds                           
0897  57                   push di                           
0898  bf0000               mov di, 0                          ; string "POLNOC-ARENA"
089b  0e                   push cs                           
089c  57                   push di                           
089d  31c0                 xor ax, ax                        
089f  50                   push ax                           
08a0  9a00000000           lcall 0, 0                         ; call System.WriteString
08a5  9a00000000           lcall 0, 0                         ; call System.WriteLn
08aa  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1263
08af  bf0000               mov di, 0                          ; data System.OUTPUT
08b2  1e                   push ds                           
08b3  57                   push di                           
08b4  bf0000               mov di, 0                          ; string "WSCHOD-ARENA"
08b7  0e                   push cs                           
08b8  57                   push di                           
08b9  31c0                 xor ax, ax                        
08bb  50                   push ax                           
08bc  9a00000000           lcall 0, 0                         ; call System.WriteString
08c1  9a00000000           lcall 0, 0                         ; call System.WriteLn
08c6  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1264
08cb  bf0000               mov di, 0                          ; data System.OUTPUT
08ce  1e                   push ds                           
08cf  57                   push di                           
08d0  bf0000               mov di, 0                          ; string "ZACHOD-ARENA"
08d3  0e                   push cs                           
08d4  57                   push di                           
08d5  31c0                 xor ax, ax                        
08d7  50                   push ax                           
08d8  9a00000000           lcall 0, 0                         ; call System.WriteString
08dd  9a00000000           lcall 0, 0                         ; call System.WriteLn
08e2  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1266
08e7  833e000022           cmp word ptr [0], 0x22             ; data PRZEDM.MIECHO
08ec  743b                 je 0x929                          
08ee  833e000025           cmp word ptr [0], 0x25             ; data PRZEDM.MIECHO
08f3  7434                 je 0x929                          
08f5  833e000026           cmp word ptr [0], 0x26             ; data PRZEDM.MIECHO
08fa  742d                 je 0x929                          
08fc  833e000027           cmp word ptr [0], 0x27             ; data PRZEDM.MIECHO
0901  7426                 je 0x929                          
0903  833e00002a           cmp word ptr [0], 0x2a             ; data PRZEDM.MIECHO
0908  741f                 je 0x929                          
090a  833e00002b           cmp word ptr [0], 0x2b             ; data PRZEDM.MIECHO
090f  7418                 je 0x929                          
0911  833e00002c           cmp word ptr [0], 0x2c             ; data PRZEDM.MIECHO
0916  7411                 je 0x929                          
0918  833e000030           cmp word ptr [0], 0x30             ; data PRZEDM.MIECHO
091d  740a                 je 0x929                          
091f  833e000031           cmp word ptr [0], 0x31             ; data PRZEDM.MIECHO
0924  7403                 je 0x929                          
0926  e98c00               jmp 0x9b5                         
; PRZEDM.PAS:1269
0929  bf0000               mov di, 0                          ; data System.OUTPUT
092c  1e                   push ds                           
092d  57                   push di                           
092e  bf0000               mov di, 0                          ; string "DOSTEPNE WYJSCIA:"
0931  0e                   push cs                           
0932  57                   push di                           
0933  31c0                 xor ax, ax                        
0935  50                   push ax                           
0936  9a00000000           lcall 0, 0                         ; call System.WriteString
093b  9a00000000           lcall 0, 0                         ; call System.WriteLn
0940  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1270
0945  bf0000               mov di, 0                          ; data System.OUTPUT
0948  1e                   push ds                           
0949  57                   push di                           
094a  bf0000               mov di, 0                          ; string "POLODNIE-ARENA"
094d  0e                   push cs                           
094e  57                   push di                           
094f  31c0                 xor ax, ax                        
0951  50                   push ax                           
0952  9a00000000           lcall 0, 0                         ; call System.WriteString
0957  9a00000000           lcall 0, 0                         ; call System.WriteLn
095c  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1271
0961  bf0000               mov di, 0                          ; data System.OUTPUT
0964  1e                   push ds                           
0965  57                   push di                           
0966  bf0000               mov di, 0                          ; string "POLNOC-ARENA"
0969  0e                   push cs                           
096a  57                   push di                           
096b  31c0                 xor ax, ax                        
096d  50                   push ax                           
096e  9a00000000           lcall 0, 0                         ; call System.WriteString
0973  9a00000000           lcall 0, 0                         ; call System.WriteLn
0978  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1272
097d  bf0000               mov di, 0                          ; data System.OUTPUT
0980  1e                   push ds                           
0981  57                   push di                           
0982  bf0000               mov di, 0                          ; string "WSCHOD-ARENA"
0985  0e                   push cs                           
0986  57                   push di                           
0987  31c0                 xor ax, ax                        
0989  50                   push ax                           
098a  9a00000000           lcall 0, 0                         ; call System.WriteString
098f  9a00000000           lcall 0, 0                         ; call System.WriteLn
0994  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1273
0999  bf0000               mov di, 0                          ; data System.OUTPUT
099c  1e                   push ds                           
099d  57                   push di                           
099e  bf0000               mov di, 0                          ; string "ZACHOD-ARENA"
09a1  0e                   push cs                           
09a2  57                   push di                           
09a3  31c0                 xor ax, ax                        
09a5  50                   push ax                           
09a6  9a00000000           lcall 0, 0                         ; call System.WriteString
09ab  9a00000000           lcall 0, 0                         ; call System.WriteLn
09b0  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1275
09b5  833e000023           cmp word ptr [0], 0x23             ; data PRZEDM.MIECHO
09ba  7407                 je 0x9c3                          
09bc  833e000024           cmp word ptr [0], 0x24             ; data PRZEDM.MIECHO
09c1  7570                 jne 0xa33                         
; PRZEDM.PAS:1276
09c3  bf0000               mov di, 0                          ; data System.OUTPUT
09c6  1e                   push ds                           
09c7  57                   push di                           
09c8  bf0000               mov di, 0                          ; string "DOSTEPNE WYJSCIA:"
09cb  0e                   push cs                           
09cc  57                   push di                           
09cd  31c0                 xor ax, ax                        
09cf  50                   push ax                           
09d0  9a00000000           lcall 0, 0                         ; call System.WriteString
09d5  9a00000000           lcall 0, 0                         ; call System.WriteLn
09da  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1277
09df  bf0000               mov di, 0                          ; data System.OUTPUT
09e2  1e                   push ds                           
09e3  57                   push di                           
09e4  bf0000               mov di, 0                          ; string "POLNOC-ARENA"
09e7  0e                   push cs                           
09e8  57                   push di                           
09e9  31c0                 xor ax, ax                        
09eb  50                   push ax                           
09ec  9a00000000           lcall 0, 0                         ; call System.WriteString
09f1  9a00000000           lcall 0, 0                         ; call System.WriteLn
09f6  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1278
09fb  bf0000               mov di, 0                          ; data System.OUTPUT
09fe  1e                   push ds                           
09ff  57                   push di                           
0a00  bf0000               mov di, 0                          ; string "WSCHOD-ARENA"
0a03  0e                   push cs                           
0a04  57                   push di                           
0a05  31c0                 xor ax, ax                        
0a07  50                   push ax                           
0a08  9a00000000           lcall 0, 0                         ; call System.WriteString
0a0d  9a00000000           lcall 0, 0                         ; call System.WriteLn
0a12  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1279
0a17  bf0000               mov di, 0                          ; data System.OUTPUT
0a1a  1e                   push ds                           
0a1b  57                   push di                           
0a1c  bf0000               mov di, 0                          ; string "ZACHOD-ARENA"
0a1f  0e                   push cs                           
0a20  57                   push di                           
0a21  31c0                 xor ax, ax                        
0a23  50                   push ax                           
0a24  9a00000000           lcall 0, 0                         ; call System.WriteString
0a29  9a00000000           lcall 0, 0                         ; call System.WriteLn
0a2e  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1281
0a33  833e000028           cmp word ptr [0], 0x28             ; data PRZEDM.MIECHO
0a38  7554                 jne 0xa8e                         
; PRZEDM.PAS:1282
0a3a  bf0000               mov di, 0                          ; data System.OUTPUT
0a3d  1e                   push ds                           
0a3e  57                   push di                           
0a3f  bf0000               mov di, 0                          ; string "DOSTEPNE WYJSCIA:"
0a42  0e                   push cs                           
0a43  57                   push di                           
0a44  31c0                 xor ax, ax                        
0a46  50                   push ax                           
0a47  9a00000000           lcall 0, 0                         ; call System.WriteString
0a4c  9a00000000           lcall 0, 0                         ; call System.WriteLn
0a51  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1283
0a56  bf0000               mov di, 0                          ; data System.OUTPUT
0a59  1e                   push ds                           
0a5a  57                   push di                           
0a5b  bf0000               mov di, 0                          ; string "POLNOC-ARENA"
0a5e  0e                   push cs                           
0a5f  57                   push di                           
0a60  31c0                 xor ax, ax                        
0a62  50                   push ax                           
0a63  9a00000000           lcall 0, 0                         ; call System.WriteString
0a68  9a00000000           lcall 0, 0                         ; call System.WriteLn
0a6d  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1284
0a72  bf0000               mov di, 0                          ; data System.OUTPUT
0a75  1e                   push ds                           
0a76  57                   push di                           
0a77  bf0000               mov di, 0                          ; string "ZACHOD-ARENA"
0a7a  0e                   push cs                           
0a7b  57                   push di                           
0a7c  31c0                 xor ax, ax                        
0a7e  50                   push ax                           
0a7f  9a00000000           lcall 0, 0                         ; call System.WriteString
0a84  9a00000000           lcall 0, 0                         ; call System.WriteLn
0a89  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1286
0a8e  833e000029           cmp word ptr [0], 0x29             ; data PRZEDM.MIECHO
0a93  7554                 jne 0xae9                         
; PRZEDM.PAS:1287
0a95  bf0000               mov di, 0                          ; data System.OUTPUT
0a98  1e                   push ds                           
0a99  57                   push di                           
0a9a  bf0000               mov di, 0                          ; string "DOSTEPNE WYJSCIA:"
0a9d  0e                   push cs                           
0a9e  57                   push di                           
0a9f  31c0                 xor ax, ax                        
0aa1  50                   push ax                           
0aa2  9a00000000           lcall 0, 0                         ; call System.WriteString
0aa7  9a00000000           lcall 0, 0                         ; call System.WriteLn
0aac  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1288
0ab1  bf0000               mov di, 0                          ; data System.OUTPUT
0ab4  1e                   push ds                           
0ab5  57                   push di                           
0ab6  bf0000               mov di, 0                          ; string "POLNOC-ARENA"
0ab9  0e                   push cs                           
0aba  57                   push di                           
0abb  31c0                 xor ax, ax                        
0abd  50                   push ax                           
0abe  9a00000000           lcall 0, 0                         ; call System.WriteString
0ac3  9a00000000           lcall 0, 0                         ; call System.WriteLn
0ac8  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1289
0acd  bf0000               mov di, 0                          ; data System.OUTPUT
0ad0  1e                   push ds                           
0ad1  57                   push di                           
0ad2  bf0000               mov di, 0                          ; string "WSCHOD-ARENA"
0ad5  0e                   push cs                           
0ad6  57                   push di                           
0ad7  31c0                 xor ax, ax                        
0ad9  50                   push ax                           
0ada  9a00000000           lcall 0, 0                         ; call System.WriteString
0adf  9a00000000           lcall 0, 0                         ; call System.WriteLn
0ae4  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1291
0ae9  833e00002d           cmp word ptr [0], 0x2d             ; data PRZEDM.MIECHO
0aee  740e                 je 0xafe                          
0af0  833e000032           cmp word ptr [0], 0x32             ; data PRZEDM.MIECHO
0af5  7407                 je 0xafe                          
0af7  833e000036           cmp word ptr [0], 0x36             ; data PRZEDM.MIECHO
0afc  7570                 jne 0xb6e                         
; PRZEDM.PAS:1292
0afe  bf0000               mov di, 0                          ; data System.OUTPUT
0b01  1e                   push ds                           
0b02  57                   push di                           
0b03  bf0000               mov di, 0                          ; string "MOZESZ WYJSC NA :"
0b06  0e                   push cs                           
0b07  57                   push di                           
0b08  31c0                 xor ax, ax                        
0b0a  50                   push ax                           
0b0b  9a00000000           lcall 0, 0                         ; call System.WriteString
0b10  9a00000000           lcall 0, 0                         ; call System.WriteLn
0b15  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1293
0b1a  bf0000               mov di, 0                          ; data System.OUTPUT
0b1d  1e                   push ds                           
0b1e  57                   push di                           
0b1f  bf0000               mov di, 0                          ; string "POLNOC-ARENA"
0b22  0e                   push cs                           
0b23  57                   push di                           
0b24  31c0                 xor ax, ax                        
0b26  50                   push ax                           
0b27  9a00000000           lcall 0, 0                         ; call System.WriteString
0b2c  9a00000000           lcall 0, 0                         ; call System.WriteLn
0b31  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1294
0b36  bf0000               mov di, 0                          ; data System.OUTPUT
0b39  1e                   push ds                           
0b3a  57                   push di                           
0b3b  bf0000               mov di, 0                          ; string "POLODNIE-ARENA"
0b3e  0e                   push cs                           
0b3f  57                   push di                           
0b40  31c0                 xor ax, ax                        
0b42  50                   push ax                           
0b43  9a00000000           lcall 0, 0                         ; call System.WriteString
0b48  9a00000000           lcall 0, 0                         ; call System.WriteLn
0b4d  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1295
0b52  bf0000               mov di, 0                          ; data System.OUTPUT
0b55  1e                   push ds                           
0b56  57                   push di                           
0b57  bf0000               mov di, 0                          ; string "ZACHOD-ARENA"
0b5a  0e                   push cs                           
0b5b  57                   push di                           
0b5c  31c0                 xor ax, ax                        
0b5e  50                   push ax                           
0b5f  9a00000000           lcall 0, 0                         ; call System.WriteString
0b64  9a00000000           lcall 0, 0                         ; call System.WriteLn
0b69  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1297
0b6e  833e00002e           cmp word ptr [0], 0x2e             ; data PRZEDM.MIECHO
0b73  740e                 je 0xb83                          
0b75  833e000033           cmp word ptr [0], 0x33             ; data PRZEDM.MIECHO
0b7a  7407                 je 0xb83                          
0b7c  833e000037           cmp word ptr [0], 0x37             ; data PRZEDM.MIECHO
0b81  7570                 jne 0xbf3                         
; PRZEDM.PAS:1298
0b83  bf0000               mov di, 0                          ; data System.OUTPUT
0b86  1e                   push ds                           
0b87  57                   push di                           
0b88  bf0000               mov di, 0                          ; string "MOZESZ WYJSC NA :"
0b8b  0e                   push cs                           
0b8c  57                   push di                           
0b8d  31c0                 xor ax, ax                        
0b8f  50                   push ax                           
0b90  9a00000000           lcall 0, 0                         ; call System.WriteString
0b95  9a00000000           lcall 0, 0                         ; call System.WriteLn
0b9a  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1299
0b9f  bf0000               mov di, 0                          ; data System.OUTPUT
0ba2  1e                   push ds                           
0ba3  57                   push di                           
0ba4  bf0000               mov di, 0                          ; string "POLNOC-ARENA"
0ba7  0e                   push cs                           
0ba8  57                   push di                           
0ba9  31c0                 xor ax, ax                        
0bab  50                   push ax                           
0bac  9a00000000           lcall 0, 0                         ; call System.WriteString
0bb1  9a00000000           lcall 0, 0                         ; call System.WriteLn
0bb6  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1300
0bbb  bf0000               mov di, 0                          ; data System.OUTPUT
0bbe  1e                   push ds                           
0bbf  57                   push di                           
0bc0  bf0000               mov di, 0                          ; string "POLODNIE-ARENA"
0bc3  0e                   push cs                           
0bc4  57                   push di                           
0bc5  31c0                 xor ax, ax                        
0bc7  50                   push ax                           
0bc8  9a00000000           lcall 0, 0                         ; call System.WriteString
0bcd  9a00000000           lcall 0, 0                         ; call System.WriteLn
0bd2  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1301
0bd7  bf0000               mov di, 0                          ; data System.OUTPUT
0bda  1e                   push ds                           
0bdb  57                   push di                           
0bdc  bf0000               mov di, 0                          ; string "WSCHOD-ARENA"
0bdf  0e                   push cs                           
0be0  57                   push di                           
0be1  31c0                 xor ax, ax                        
0be3  50                   push ax                           
0be4  9a00000000           lcall 0, 0                         ; call System.WriteString
0be9  9a00000000           lcall 0, 0                         ; call System.WriteLn
0bee  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1303
0bf3  833e00002f           cmp word ptr [0], 0x2f             ; data PRZEDM.MIECHO
0bf8  740e                 je 0xc08                          
0bfa  833e000034           cmp word ptr [0], 0x34             ; data PRZEDM.MIECHO
0bff  7407                 je 0xc08                          
0c01  833e000035           cmp word ptr [0], 0x35             ; data PRZEDM.MIECHO
0c06  7570                 jne 0xc78                         
; PRZEDM.PAS:1304
0c08  bf0000               mov di, 0                          ; data System.OUTPUT
0c0b  1e                   push ds                           
0c0c  57                   push di                           
0c0d  bf0000               mov di, 0                          ; string "MOZESZ ISC NA :"
0c10  0e                   push cs                           
0c11  57                   push di                           
0c12  31c0                 xor ax, ax                        
0c14  50                   push ax                           
0c15  9a00000000           lcall 0, 0                         ; call System.WriteString
0c1a  9a00000000           lcall 0, 0                         ; call System.WriteLn
0c1f  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1305
0c24  bf0000               mov di, 0                          ; data System.OUTPUT
0c27  1e                   push ds                           
0c28  57                   push di                           
0c29  bf0000               mov di, 0                          ; string "POLODNIE-ARENA"
0c2c  0e                   push cs                           
0c2d  57                   push di                           
0c2e  31c0                 xor ax, ax                        
0c30  50                   push ax                           
0c31  9a00000000           lcall 0, 0                         ; call System.WriteString
0c36  9a00000000           lcall 0, 0                         ; call System.WriteLn
0c3b  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1306
0c40  bf0000               mov di, 0                          ; data System.OUTPUT
0c43  1e                   push ds                           
0c44  57                   push di                           
0c45  bf0000               mov di, 0                          ; string "WSCHOD-ARENA"
0c48  0e                   push cs                           
0c49  57                   push di                           
0c4a  31c0                 xor ax, ax                        
0c4c  50                   push ax                           
0c4d  9a00000000           lcall 0, 0                         ; call System.WriteString
0c52  9a00000000           lcall 0, 0                         ; call System.WriteLn
0c57  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1307
0c5c  bf0000               mov di, 0                          ; data System.OUTPUT
0c5f  1e                   push ds                           
0c60  57                   push di                           
0c61  bf0000               mov di, 0                          ; string "ZACHOD-ARENA"
0c64  0e                   push cs                           
0c65  57                   push di                           
0c66  31c0                 xor ax, ax                        
0c68  50                   push ax                           
0c69  9a00000000           lcall 0, 0                         ; call System.WriteString
0c6e  9a00000000           lcall 0, 0                         ; call System.WriteLn
0c73  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1309
0c78  833e000038           cmp word ptr [0], 0x38             ; data PRZEDM.MIECHO
0c7d  7554                 jne 0xcd3                         
; PRZEDM.PAS:1310
0c7f  bf0000               mov di, 0                          ; data System.OUTPUT
0c82  1e                   push ds                           
0c83  57                   push di                           
0c84  bf0000               mov di, 0                          ; string "DOSTEPNE WYJSCIE:"
0c87  0e                   push cs                           
0c88  57                   push di                           
0c89  31c0                 xor ax, ax                        
0c8b  50                   push ax                           
0c8c  9a00000000           lcall 0, 0                         ; call System.WriteString
0c91  9a00000000           lcall 0, 0                         ; call System.WriteLn
0c96  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1311
0c9b  bf0000               mov di, 0                          ; data System.OUTPUT
0c9e  1e                   push ds                           
0c9f  57                   push di                           
0ca0  bf0000               mov di, 0                          ; string "POLODNIE-ARENA"
0ca3  0e                   push cs                           
0ca4  57                   push di                           
0ca5  31c0                 xor ax, ax                        
0ca7  50                   push ax                           
0ca8  9a00000000           lcall 0, 0                         ; call System.WriteString
0cad  9a00000000           lcall 0, 0                         ; call System.WriteLn
0cb2  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1312
0cb7  bf0000               mov di, 0                          ; data System.OUTPUT
0cba  1e                   push ds                           
0cbb  57                   push di                           
0cbc  bf0000               mov di, 0                          ; string "ZACHOD-ARENA"
0cbf  0e                   push cs                           
0cc0  57                   push di                           
0cc1  31c0                 xor ax, ax                        
0cc3  50                   push ax                           
0cc4  9a00000000           lcall 0, 0                         ; call System.WriteString
0cc9  9a00000000           lcall 0, 0                         ; call System.WriteLn
0cce  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1314
0cd3  833e000039           cmp word ptr [0], 0x39             ; data PRZEDM.MIECHO
0cd8  7554                 jne 0xd2e                         
; PRZEDM.PAS:1315
0cda  bf0000               mov di, 0                          ; data System.OUTPUT
0cdd  1e                   push ds                           
0cde  57                   push di                           
0cdf  bf0000               mov di, 0                          ; string "DOSTEPNE WYJSCIE:"
0ce2  0e                   push cs                           
0ce3  57                   push di                           
0ce4  31c0                 xor ax, ax                        
0ce6  50                   push ax                           
0ce7  9a00000000           lcall 0, 0                         ; call System.WriteString
0cec  9a00000000           lcall 0, 0                         ; call System.WriteLn
0cf1  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1316
0cf6  bf0000               mov di, 0                          ; data System.OUTPUT
0cf9  1e                   push ds                           
0cfa  57                   push di                           
0cfb  bf0000               mov di, 0                          ; string "POLODNIE-ARENA"
0cfe  0e                   push cs                           
0cff  57                   push di                           
0d00  31c0                 xor ax, ax                        
0d02  50                   push ax                           
0d03  9a00000000           lcall 0, 0                         ; call System.WriteString
0d08  9a00000000           lcall 0, 0                         ; call System.WriteLn
0d0d  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1317
0d12  bf0000               mov di, 0                          ; data System.OUTPUT
0d15  1e                   push ds                           
0d16  57                   push di                           
0d17  bf0000               mov di, 0                          ; string "WSCHOD-ARENA"
0d1a  0e                   push cs                           
0d1b  57                   push di                           
0d1c  31c0                 xor ax, ax                        
0d1e  50                   push ax                           
0d1f  9a00000000           lcall 0, 0                         ; call System.WriteString
0d24  9a00000000           lcall 0, 0                         ; call System.WriteLn
0d29  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:1320
0d2e  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0d31  1e                   push ds                           
0d32  57                   push di                           
0d33  bf0000               mov di, 0                          ; string "WYJSCIE"
0d36  0e                   push cs                           
0d37  57                   push di                           
0d38  9a00000000           lcall 0, 0                         ; call System.CompareString
0d3d  7503                 jne 0xd42                         
0d3f  e94509               jmp 0x1687                        
; PRZEDM.PAS:1321
0d42  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0d45  1e                   push ds                           
0d46  57                   push di                           
0d47  bf0000               mov di, 0                          ; string "POLODNIE"
0d4a  0e                   push cs                           
0d4b  57                   push di                           
0d4c  9a00000000           lcall 0, 0                         ; call System.CompareString
0d51  7403                 je 0xd56                          
0d53  e93801               jmp 0xe8e                         
; PRZEDM.PAS:1322
0d56  31c0                 xor ax, ax                        
0d58  a30000               mov word ptr [0], ax               ; data PRZEDM.ARENA
; PRZEDM.PAS:1323
0d5b  833e000021           cmp word ptr [0], 0x21             ; data PRZEDM.MIECHO
0d60  7506                 jne 0xd68                         
0d62  c70600002000         mov word ptr [0], 0x20             ; data PRZEDM.MIECHO
; PRZEDM.PAS:1324
0d68  833e000022           cmp word ptr [0], 0x22             ; data PRZEDM.MIECHO
0d6d  7506                 jne 0xd75                         
0d6f  c70600002100         mov word ptr [0], 0x21             ; data PRZEDM.MIECHO
; PRZEDM.PAS:1325
0d75  833e000023           cmp word ptr [0], 0x23             ; data PRZEDM.MIECHO
0d7a  7415                 je 0xd91                          
0d7c  833e000024           cmp word ptr [0], 0x24             ; data PRZEDM.MIECHO
0d81  740e                 je 0xd91                          
0d83  833e000028           cmp word ptr [0], 0x28             ; data PRZEDM.MIECHO
0d88  7407                 je 0xd91                          
0d8a  833e000029           cmp word ptr [0], 0x29             ; data PRZEDM.MIECHO
0d8f  7506                 jne 0xd97                         
0d91  c70600000100         mov word ptr [0], 1                ; data PRZEDM.ARENA
; PRZEDM.PAS:1326
0d97  833e000025           cmp word ptr [0], 0x25             ; data PRZEDM.MIECHO
0d9c  7506                 jne 0xda4                         
0d9e  c70600002200         mov word ptr [0], 0x22             ; data PRZEDM.MIECHO
; PRZEDM.PAS:1327
0da4  833e000026           cmp word ptr [0], 0x26             ; data PRZEDM.MIECHO
0da9  7506                 jne 0xdb1                         
0dab  c70600002300         mov word ptr [0], 0x23             ; data PRZEDM.MIECHO
; PRZEDM.PAS:1328
0db1  833e000027           cmp word ptr [0], 0x27             ; data PRZEDM.MIECHO
0db6  7506                 jne 0xdbe                         
0db8  c70600002400         mov word ptr [0], 0x24             ; data PRZEDM.MIECHO
; PRZEDM.PAS:1329
0dbe  833e00002a           cmp word ptr [0], 0x2a             ; data PRZEDM.MIECHO
0dc3  7506                 jne 0xdcb                         
0dc5  c70600002500         mov word ptr [0], 0x25             ; data PRZEDM.MIECHO
; PRZEDM.PAS:1330
0dcb  833e00002b           cmp word ptr [0], 0x2b             ; data PRZEDM.MIECHO
0dd0  7506                 jne 0xdd8                         
0dd2  c70600002600         mov word ptr [0], 0x26             ; data PRZEDM.MIECHO
; PRZEDM.PAS:1331
0dd8  833e00002c           cmp word ptr [0], 0x2c             ; data PRZEDM.MIECHO
0ddd  7506                 jne 0xde5                         
0ddf  c70600002700         mov word ptr [0], 0x27             ; data PRZEDM.MIECHO
; PRZEDM.PAS:1332
0de5  833e00002d           cmp word ptr [0], 0x2d             ; data PRZEDM.MIECHO
0dea  7506                 jne 0xdf2                         
0dec  c70600002800         mov word ptr [0], 0x28             ; data PRZEDM.MIECHO
; PRZEDM.PAS:1333
0df2  833e00002e           cmp word ptr [0], 0x2e             ; data PRZEDM.MIECHO
0df7  7506                 jne 0xdff                         
0df9  c70600002900         mov word ptr [0], 0x29             ; data PRZEDM.MIECHO
; PRZEDM.PAS:1334
0dff  833e00002f           cmp word ptr [0], 0x2f             ; data PRZEDM.MIECHO
0e04  7506                 jne 0xe0c                         
0e06  c70600002a00         mov word ptr [0], 0x2a             ; data PRZEDM.MIECHO
; PRZEDM.PAS:1335
0e0c  833e000030           cmp word ptr [0], 0x30             ; data PRZEDM.MIECHO
0e11  7506                 jne 0xe19                         
0e13  c70600002b00         mov word ptr [0], 0x2b             ; data PRZEDM.MIECHO
; PRZEDM.PAS:1336
0e19  833e000031           cmp word ptr [0], 0x31             ; data PRZEDM.MIECHO
0e1e  7506                 jne 0xe26                         
0e20  c70600002c00         mov word ptr [0], 0x2c             ; data PRZEDM.MIECHO
; PRZEDM.PAS:1337
0e26  833e000032           cmp word ptr [0], 0x32             ; data PRZEDM.MIECHO
0e2b  7506                 jne 0xe33                         
0e2d  c70600002d00         mov word ptr [0], 0x2d             ; data PRZEDM.MIECHO
; PRZEDM.PAS:1338
0e33  833e000033           cmp word ptr [0], 0x33             ; data PRZEDM.MIECHO
0e38  7506                 jne 0xe40                         
0e3a  c70600002e00         mov word ptr [0], 0x2e             ; data PRZEDM.MIECHO
; PRZEDM.PAS:1339
0e40  833e000034           cmp word ptr [0], 0x34             ; data PRZEDM.MIECHO
0e45  7506                 jne 0xe4d                         
0e47  c70600003000         mov word ptr [0], 0x30             ; data PRZEDM.MIECHO
; PRZEDM.PAS:1340
0e4d  833e000035           cmp word ptr [0], 0x35             ; data PRZEDM.MIECHO
0e52  7506                 jne 0xe5a                         
0e54  c70600003100         mov word ptr [0], 0x31             ; data PRZEDM.MIECHO
; PRZEDM.PAS:1341
0e5a  833e000036           cmp word ptr [0], 0x36             ; data PRZEDM.MIECHO
0e5f  7506                 jne 0xe67                         
0e61  c70600003200         mov word ptr [0], 0x32             ; data PRZEDM.MIECHO
; PRZEDM.PAS:1342
0e67  833e000037           cmp word ptr [0], 0x37             ; data PRZEDM.MIECHO
0e6c  7506                 jne 0xe74                         
0e6e  c70600003300         mov word ptr [0], 0x33             ; data PRZEDM.MIECHO
; PRZEDM.PAS:1343
0e74  833e000038           cmp word ptr [0], 0x38             ; data PRZEDM.MIECHO
0e79  7506                 jne 0xe81                         
0e7b  c70600003600         mov word ptr [0], 0x36             ; data PRZEDM.MIECHO
; PRZEDM.PAS:1344
0e81  833e000039           cmp word ptr [0], 0x39             ; data PRZEDM.MIECHO
0e86  7506                 jne 0xe8e                         
0e88  c70600003700         mov word ptr [0], 0x37             ; data PRZEDM.MIECHO
; PRZEDM.PAS:1346
0e8e  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0e91  1e                   push ds                           
0e92  57                   push di                           
0e93  bf0000               mov di, 0                          ; string "POLNOC"
0e96  0e                   push cs                           
0e97  57                   push di                           
0e98  9a00000000           lcall 0, 0                         ; call System.CompareString
0e9d  7403                 je 0xea2                          
0e9f  e98802               jmp 0x112a                        
; PRZEDM.PAS:1347
0ea2  31c0                 xor ax, ax                        
0ea4  a30000               mov word ptr [0], ax               ; data PRZEDM.ARENA
; PRZEDM.PAS:1348
0ea7  833e000021           cmp word ptr [0], 0x21             ; data PRZEDM.MIECHO
0eac  750c                 jne 0xeba                         
0eae  c70600002200         mov word ptr [0], 0x22             ; data PRZEDM.MIECHO
0eb4  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1349
0eba  833e000022           cmp word ptr [0], 0x22             ; data PRZEDM.MIECHO
0ebf  7513                 jne 0xed4                         
0ec1  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
0ec6  750c                 jne 0xed4                         
0ec8  c70600002500         mov word ptr [0], 0x25             ; data PRZEDM.MIECHO
0ece  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1350
0ed4  833e000023           cmp word ptr [0], 0x23             ; data PRZEDM.MIECHO
0ed9  7513                 jne 0xeee                         
0edb  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
0ee0  750c                 jne 0xeee                         
0ee2  c70600002600         mov word ptr [0], 0x26             ; data PRZEDM.MIECHO
0ee8  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1351
0eee  833e000024           cmp word ptr [0], 0x24             ; data PRZEDM.MIECHO
0ef3  7513                 jne 0xf08                         
0ef5  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
0efa  750c                 jne 0xf08                         
0efc  c70600002700         mov word ptr [0], 0x27             ; data PRZEDM.MIECHO
0f02  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1352
0f08  833e000025           cmp word ptr [0], 0x25             ; data PRZEDM.MIECHO
0f0d  7513                 jne 0xf22                         
0f0f  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
0f14  750c                 jne 0xf22                         
0f16  c70600002a00         mov word ptr [0], 0x2a             ; data PRZEDM.MIECHO
0f1c  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1353
0f22  833e000026           cmp word ptr [0], 0x26             ; data PRZEDM.MIECHO
0f27  7513                 jne 0xf3c                         
0f29  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
0f2e  750c                 jne 0xf3c                         
0f30  c70600002b00         mov word ptr [0], 0x2b             ; data PRZEDM.MIECHO
0f36  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1354
0f3c  833e000027           cmp word ptr [0], 0x27             ; data PRZEDM.MIECHO
0f41  7513                 jne 0xf56                         
0f43  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
0f48  750c                 jne 0xf56                         
0f4a  c70600002c00         mov word ptr [0], 0x2c             ; data PRZEDM.MIECHO
0f50  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1355
0f56  833e000028           cmp word ptr [0], 0x28             ; data PRZEDM.MIECHO
0f5b  7513                 jne 0xf70                         
0f5d  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
0f62  750c                 jne 0xf70                         
0f64  c70600002d00         mov word ptr [0], 0x2d             ; data PRZEDM.MIECHO
0f6a  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1356
0f70  833e000029           cmp word ptr [0], 0x29             ; data PRZEDM.MIECHO
0f75  7513                 jne 0xf8a                         
0f77  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
0f7c  750c                 jne 0xf8a                         
0f7e  c70600002e00         mov word ptr [0], 0x2e             ; data PRZEDM.MIECHO
0f84  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1357
0f8a  833e00002a           cmp word ptr [0], 0x2a             ; data PRZEDM.MIECHO
0f8f  7513                 jne 0xfa4                         
0f91  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
0f96  750c                 jne 0xfa4                         
0f98  c70600002f00         mov word ptr [0], 0x2f             ; data PRZEDM.MIECHO
0f9e  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1358
0fa4  833e00002b           cmp word ptr [0], 0x2b             ; data PRZEDM.MIECHO
0fa9  7513                 jne 0xfbe                         
0fab  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
0fb0  750c                 jne 0xfbe                         
0fb2  c70600003000         mov word ptr [0], 0x30             ; data PRZEDM.MIECHO
0fb8  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1359
0fbe  833e00002c           cmp word ptr [0], 0x2c             ; data PRZEDM.MIECHO
0fc3  7513                 jne 0xfd8                         
0fc5  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
0fca  750c                 jne 0xfd8                         
0fcc  c70600003100         mov word ptr [0], 0x31             ; data PRZEDM.MIECHO
0fd2  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1360
0fd8  833e00002d           cmp word ptr [0], 0x2d             ; data PRZEDM.MIECHO
0fdd  7513                 jne 0xff2                         
0fdf  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
0fe4  750c                 jne 0xff2                         
0fe6  c70600003200         mov word ptr [0], 0x32             ; data PRZEDM.MIECHO
0fec  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1361
0ff2  833e00002e           cmp word ptr [0], 0x2e             ; data PRZEDM.MIECHO
0ff7  7513                 jne 0x100c                        
0ff9  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
0ffe  750c                 jne 0x100c                        
1000  c70600003300         mov word ptr [0], 0x33             ; data PRZEDM.MIECHO
1006  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1362
100c  833e00002f           cmp word ptr [0], 0x2f             ; data PRZEDM.MIECHO
1011  7513                 jne 0x1026                        
1013  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
1018  750c                 jne 0x1026                        
101a  c70600000100         mov word ptr [0], 1                ; data PRZEDM.ARENA
1020  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1363
1026  833e000030           cmp word ptr [0], 0x30             ; data PRZEDM.MIECHO
102b  7513                 jne 0x1040                        
102d  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
1032  750c                 jne 0x1040                        
1034  c70600003400         mov word ptr [0], 0x34             ; data PRZEDM.MIECHO
103a  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1364
1040  833e000031           cmp word ptr [0], 0x31             ; data PRZEDM.MIECHO
1045  7513                 jne 0x105a                        
1047  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
104c  750c                 jne 0x105a                        
104e  c70600003500         mov word ptr [0], 0x35             ; data PRZEDM.MIECHO
1054  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1365
105a  833e000032           cmp word ptr [0], 0x32             ; data PRZEDM.MIECHO
105f  7513                 jne 0x1074                        
1061  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
1066  750c                 jne 0x1074                        
1068  c70600003600         mov word ptr [0], 0x36             ; data PRZEDM.MIECHO
106e  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1366
1074  833e000033           cmp word ptr [0], 0x33             ; data PRZEDM.MIECHO
1079  7513                 jne 0x108e                        
107b  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
1080  750c                 jne 0x108e                        
1082  c70600003700         mov word ptr [0], 0x37             ; data PRZEDM.MIECHO
1088  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1367
108e  833e000034           cmp word ptr [0], 0x34             ; data PRZEDM.MIECHO
1093  7513                 jne 0x10a8                        
1095  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
109a  750c                 jne 0x10a8                        
109c  c70600000100         mov word ptr [0], 1                ; data PRZEDM.ARENA
10a2  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1368
10a8  833e000035           cmp word ptr [0], 0x35             ; data PRZEDM.MIECHO
10ad  7513                 jne 0x10c2                        
10af  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
10b4  750c                 jne 0x10c2                        
10b6  c70600000100         mov word ptr [0], 1                ; data PRZEDM.ARENA
10bc  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1369
10c2  833e000036           cmp word ptr [0], 0x36             ; data PRZEDM.MIECHO
10c7  7513                 jne 0x10dc                        
10c9  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
10ce  750c                 jne 0x10dc                        
10d0  c70600003800         mov word ptr [0], 0x38             ; data PRZEDM.MIECHO
10d6  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1370
10dc  833e000037           cmp word ptr [0], 0x37             ; data PRZEDM.MIECHO
10e1  7513                 jne 0x10f6                        
10e3  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
10e8  750c                 jne 0x10f6                        
10ea  c70600003900         mov word ptr [0], 0x39             ; data PRZEDM.MIECHO
10f0  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1371
10f6  833e000038           cmp word ptr [0], 0x38             ; data PRZEDM.MIECHO
10fb  7513                 jne 0x1110                        
10fd  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
1102  750c                 jne 0x1110                        
1104  c70600000100         mov word ptr [0], 1                ; data PRZEDM.ARENA
110a  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1372
1110  833e000039           cmp word ptr [0], 0x39             ; data PRZEDM.MIECHO
1115  7513                 jne 0x112a                        
1117  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
111c  750c                 jne 0x112a                        
111e  c70600000100         mov word ptr [0], 1                ; data PRZEDM.ARENA
1124  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1374
112a  bf0000               mov di, 0                          ; data PRZEDM.wpisz
112d  1e                   push ds                           
112e  57                   push di                           
112f  bf0000               mov di, 0                          ; string "WSCHOD"
1132  0e                   push cs                           
1133  57                   push di                           
1134  9a00000000           lcall 0, 0                         ; call System.CompareString
1139  7403                 je 0x113e                         
113b  e98f02               jmp 0x13cd                        
; PRZEDM.PAS:1375
113e  31c0                 xor ax, ax                        
1140  a30000               mov word ptr [0], ax               ; data PRZEDM.ARENA
; PRZEDM.PAS:1376
1143  833e000021           cmp word ptr [0], 0x21             ; data PRZEDM.MIECHO
1148  7513                 jne 0x115d                        
114a  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
114f  750c                 jne 0x115d                        
1151  c70600002300         mov word ptr [0], 0x23             ; data PRZEDM.MIECHO
1157  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1377
115d  833e000022           cmp word ptr [0], 0x22             ; data PRZEDM.MIECHO
1162  7513                 jne 0x1177                        
1164  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
1169  750c                 jne 0x1177                        
116b  c70600002600         mov word ptr [0], 0x26             ; data PRZEDM.MIECHO
1171  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1378
1177  833e000023           cmp word ptr [0], 0x23             ; data PRZEDM.MIECHO
117c  7513                 jne 0x1191                        
117e  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
1183  750c                 jne 0x1191                        
1185  c70600002800         mov word ptr [0], 0x28             ; data PRZEDM.MIECHO
118b  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1379
1191  833e000024           cmp word ptr [0], 0x24             ; data PRZEDM.MIECHO
1196  7513                 jne 0x11ab                        
1198  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
119d  750c                 jne 0x11ab                        
119f  c70600002100         mov word ptr [0], 0x21             ; data PRZEDM.MIECHO
11a5  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1380
11ab  833e000025           cmp word ptr [0], 0x25             ; data PRZEDM.MIECHO
11b0  7513                 jne 0x11c5                        
11b2  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
11b7  750c                 jne 0x11c5                        
11b9  c70600002b00         mov word ptr [0], 0x2b             ; data PRZEDM.MIECHO
11bf  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1381
11c5  833e000026           cmp word ptr [0], 0x26             ; data PRZEDM.MIECHO
11ca  7513                 jne 0x11df                        
11cc  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
11d1  750c                 jne 0x11df                        
11d3  c70600002d00         mov word ptr [0], 0x2d             ; data PRZEDM.MIECHO
11d9  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1382
11df  833e000027           cmp word ptr [0], 0x27             ; data PRZEDM.MIECHO
11e4  7513                 jne 0x11f9                        
11e6  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
11eb  750c                 jne 0x11f9                        
11ed  c70600002200         mov word ptr [0], 0x22             ; data PRZEDM.MIECHO
11f3  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1383
11f9  833e000028           cmp word ptr [0], 0x28             ; data PRZEDM.MIECHO
11fe  7513                 jne 0x1213                        
1200  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
1205  750c                 jne 0x1213                        
1207  c70600000100         mov word ptr [0], 1                ; data PRZEDM.ARENA
120d  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1384
1213  833e000029           cmp word ptr [0], 0x29             ; data PRZEDM.MIECHO
1218  7513                 jne 0x122d                        
121a  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
121f  750c                 jne 0x122d                        
1221  c70600002400         mov word ptr [0], 0x24             ; data PRZEDM.MIECHO
1227  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1385
122d  833e00002a           cmp word ptr [0], 0x2a             ; data PRZEDM.MIECHO
1232  7513                 jne 0x1247                        
1234  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
1239  750c                 jne 0x1247                        
123b  c70600003000         mov word ptr [0], 0x30             ; data PRZEDM.MIECHO
1241  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1386
1247  833e00002b           cmp word ptr [0], 0x2b             ; data PRZEDM.MIECHO
124c  7513                 jne 0x1261                        
124e  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
1253  750c                 jne 0x1261                        
1255  c70600003200         mov word ptr [0], 0x32             ; data PRZEDM.MIECHO
125b  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1387
1261  833e00002c           cmp word ptr [0], 0x2c             ; data PRZEDM.MIECHO
1266  7513                 jne 0x127b                        
1268  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
126d  750c                 jne 0x127b                        
126f  c70600002500         mov word ptr [0], 0x25             ; data PRZEDM.MIECHO
1275  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1388
127b  833e00002d           cmp word ptr [0], 0x2d             ; data PRZEDM.MIECHO
1280  7513                 jne 0x1295                        
1282  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
1287  750c                 jne 0x1295                        
1289  c70600000100         mov word ptr [0], 1                ; data PRZEDM.ARENA
128f  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1389
1295  833e00002e           cmp word ptr [0], 0x2e             ; data PRZEDM.MIECHO
129a  7513                 jne 0x12af                        
129c  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
12a1  750c                 jne 0x12af                        
12a3  c70600002700         mov word ptr [0], 0x27             ; data PRZEDM.MIECHO
12a9  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1390
12af  833e00002f           cmp word ptr [0], 0x2f             ; data PRZEDM.MIECHO
12b4  7513                 jne 0x12c9                        
12b6  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
12bb  750c                 jne 0x12c9                        
12bd  c70600003400         mov word ptr [0], 0x34             ; data PRZEDM.MIECHO
12c3  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1391
12c9  833e000030           cmp word ptr [0], 0x30             ; data PRZEDM.MIECHO
12ce  7513                 jne 0x12e3                        
12d0  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
12d5  750c                 jne 0x12e3                        
12d7  c70600003600         mov word ptr [0], 0x36             ; data PRZEDM.MIECHO
12dd  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1392
12e3  833e000031           cmp word ptr [0], 0x31             ; data PRZEDM.MIECHO
12e8  7513                 jne 0x12fd                        
12ea  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
12ef  750c                 jne 0x12fd                        
12f1  c70600002a00         mov word ptr [0], 0x2a             ; data PRZEDM.MIECHO
12f7  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1393
12fd  833e000032           cmp word ptr [0], 0x32             ; data PRZEDM.MIECHO
1302  7513                 jne 0x1317                        
1304  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
1309  750c                 jne 0x1317                        
130b  c70600000100         mov word ptr [0], 1                ; data PRZEDM.ARENA
1311  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1394
1317  833e000033           cmp word ptr [0], 0x33             ; data PRZEDM.MIECHO
131c  7513                 jne 0x1331                        
131e  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
1323  750c                 jne 0x1331                        
1325  c70600002c00         mov word ptr [0], 0x2c             ; data PRZEDM.MIECHO
132b  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1395
1331  833e000034           cmp word ptr [0], 0x34             ; data PRZEDM.MIECHO
1336  7513                 jne 0x134b                        
1338  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
133d  750c                 jne 0x134b                        
133f  c70600003800         mov word ptr [0], 0x38             ; data PRZEDM.MIECHO
1345  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1396
134b  833e000035           cmp word ptr [0], 0x35             ; data PRZEDM.MIECHO
1350  7513                 jne 0x1365                        
1352  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
1357  750c                 jne 0x1365                        
1359  c70600002f00         mov word ptr [0], 0x2f             ; data PRZEDM.MIECHO
135f  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1397
1365  833e000036           cmp word ptr [0], 0x36             ; data PRZEDM.MIECHO
136a  7513                 jne 0x137f                        
136c  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
1371  750c                 jne 0x137f                        
1373  c70600000100         mov word ptr [0], 1                ; data PRZEDM.ARENA
1379  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1398
137f  833e000037           cmp word ptr [0], 0x37             ; data PRZEDM.MIECHO
1384  7513                 jne 0x1399                        
1386  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
138b  750c                 jne 0x1399                        
138d  c70600003100         mov word ptr [0], 0x31             ; data PRZEDM.MIECHO
1393  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1399
1399  833e000038           cmp word ptr [0], 0x38             ; data PRZEDM.MIECHO
139e  7513                 jne 0x13b3                        
13a0  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
13a5  750c                 jne 0x13b3                        
13a7  c70600000100         mov word ptr [0], 1                ; data PRZEDM.ARENA
13ad  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1400
13b3  833e000039           cmp word ptr [0], 0x39             ; data PRZEDM.MIECHO
13b8  7513                 jne 0x13cd                        
13ba  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
13bf  750c                 jne 0x13cd                        
13c1  c70600003500         mov word ptr [0], 0x35             ; data PRZEDM.MIECHO
13c7  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1402
13cd  bf0000               mov di, 0                          ; data PRZEDM.wpisz
13d0  1e                   push ds                           
13d1  57                   push di                           
13d2  bf0000               mov di, 0                          ; string "ZACHOD"
13d5  0e                   push cs                           
13d6  57                   push di                           
13d7  9a00000000           lcall 0, 0                         ; call System.CompareString
13dc  7403                 je 0x13e1                         
13de  e98f02               jmp 0x1670                        
; PRZEDM.PAS:1403
13e1  31c0                 xor ax, ax                        
13e3  a30000               mov word ptr [0], ax               ; data PRZEDM.ARENA
; PRZEDM.PAS:1404
13e6  833e000021           cmp word ptr [0], 0x21             ; data PRZEDM.MIECHO
13eb  7513                 jne 0x1400                        
13ed  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
13f2  750c                 jne 0x1400                        
13f4  c70600002400         mov word ptr [0], 0x24             ; data PRZEDM.MIECHO
13fa  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1405
1400  833e000022           cmp word ptr [0], 0x22             ; data PRZEDM.MIECHO
1405  7513                 jne 0x141a                        
1407  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
140c  750c                 jne 0x141a                        
140e  c70600002700         mov word ptr [0], 0x27             ; data PRZEDM.MIECHO
1414  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1406
141a  833e000023           cmp word ptr [0], 0x23             ; data PRZEDM.MIECHO
141f  7513                 jne 0x1434                        
1421  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
1426  750c                 jne 0x1434                        
1428  c70600002100         mov word ptr [0], 0x21             ; data PRZEDM.MIECHO
142e  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1407
1434  833e000024           cmp word ptr [0], 0x24             ; data PRZEDM.MIECHO
1439  7513                 jne 0x144e                        
143b  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
1440  750c                 jne 0x144e                        
1442  c70600002900         mov word ptr [0], 0x29             ; data PRZEDM.MIECHO
1448  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1408
144e  833e000025           cmp word ptr [0], 0x25             ; data PRZEDM.MIECHO
1453  7513                 jne 0x1468                        
1455  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
145a  750c                 jne 0x1468                        
145c  c70600002c00         mov word ptr [0], 0x2c             ; data PRZEDM.MIECHO
1462  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1409
1468  833e000026           cmp word ptr [0], 0x26             ; data PRZEDM.MIECHO
146d  7513                 jne 0x1482                        
146f  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
1474  750c                 jne 0x1482                        
1476  c70600002200         mov word ptr [0], 0x22             ; data PRZEDM.MIECHO
147c  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1410
1482  833e000027           cmp word ptr [0], 0x27             ; data PRZEDM.MIECHO
1487  7513                 jne 0x149c                        
1489  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
148e  750c                 jne 0x149c                        
1490  c70600002e00         mov word ptr [0], 0x2e             ; data PRZEDM.MIECHO
1496  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1411
149c  833e000028           cmp word ptr [0], 0x28             ; data PRZEDM.MIECHO
14a1  7513                 jne 0x14b6                        
14a3  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
14a8  750c                 jne 0x14b6                        
14aa  c70600002300         mov word ptr [0], 0x23             ; data PRZEDM.MIECHO
14b0  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1412
14b6  833e000029           cmp word ptr [0], 0x29             ; data PRZEDM.MIECHO
14bb  7513                 jne 0x14d0                        
14bd  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
14c2  750c                 jne 0x14d0                        
14c4  c70600000100         mov word ptr [0], 1                ; data PRZEDM.ARENA
14ca  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1413
14d0  833e00002a           cmp word ptr [0], 0x2a             ; data PRZEDM.MIECHO
14d5  7513                 jne 0x14ea                        
14d7  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
14dc  750c                 jne 0x14ea                        
14de  c70600003100         mov word ptr [0], 0x31             ; data PRZEDM.MIECHO
14e4  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1414
14ea  833e00002b           cmp word ptr [0], 0x2b             ; data PRZEDM.MIECHO
14ef  7513                 jne 0x1504                        
14f1  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
14f6  750c                 jne 0x1504                        
14f8  c70600002500         mov word ptr [0], 0x25             ; data PRZEDM.MIECHO
14fe  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1415
1504  833e00002c           cmp word ptr [0], 0x2c             ; data PRZEDM.MIECHO
1509  7513                 jne 0x151e                        
150b  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
1510  750c                 jne 0x151e                        
1512  c70600003300         mov word ptr [0], 0x33             ; data PRZEDM.MIECHO
1518  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1416
151e  833e00002d           cmp word ptr [0], 0x2d             ; data PRZEDM.MIECHO
1523  7513                 jne 0x1538                        
1525  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
152a  750c                 jne 0x1538                        
152c  c70600002600         mov word ptr [0], 0x26             ; data PRZEDM.MIECHO
1532  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1417
1538  833e00002e           cmp word ptr [0], 0x2e             ; data PRZEDM.MIECHO
153d  7513                 jne 0x1552                        
153f  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
1544  750c                 jne 0x1552                        
1546  c70600000100         mov word ptr [0], 1                ; data PRZEDM.ARENA
154c  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1418
1552  833e00002f           cmp word ptr [0], 0x2f             ; data PRZEDM.MIECHO
1557  7513                 jne 0x156c                        
1559  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
155e  750c                 jne 0x156c                        
1560  c70600003500         mov word ptr [0], 0x35             ; data PRZEDM.MIECHO
1566  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1419
156c  833e000030           cmp word ptr [0], 0x30             ; data PRZEDM.MIECHO
1571  7513                 jne 0x1586                        
1573  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
1578  750c                 jne 0x1586                        
157a  c70600002a00         mov word ptr [0], 0x2a             ; data PRZEDM.MIECHO
1580  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1420
1586  833e000031           cmp word ptr [0], 0x31             ; data PRZEDM.MIECHO
158b  7513                 jne 0x15a0                        
158d  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
1592  750c                 jne 0x15a0                        
1594  c70600003700         mov word ptr [0], 0x37             ; data PRZEDM.MIECHO
159a  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1421
15a0  833e000032           cmp word ptr [0], 0x32             ; data PRZEDM.MIECHO
15a5  7513                 jne 0x15ba                        
15a7  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
15ac  750c                 jne 0x15ba                        
15ae  c70600002b00         mov word ptr [0], 0x2b             ; data PRZEDM.MIECHO
15b4  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1422
15ba  833e000033           cmp word ptr [0], 0x33             ; data PRZEDM.MIECHO
15bf  7513                 jne 0x15d4                        
15c1  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
15c6  750c                 jne 0x15d4                        
15c8  c70600000100         mov word ptr [0], 1                ; data PRZEDM.ARENA
15ce  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1423
15d4  833e000034           cmp word ptr [0], 0x34             ; data PRZEDM.MIECHO
15d9  7513                 jne 0x15ee                        
15db  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
15e0  750c                 jne 0x15ee                        
15e2  c70600002f00         mov word ptr [0], 0x2f             ; data PRZEDM.MIECHO
15e8  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1424
15ee  833e000035           cmp word ptr [0], 0x35             ; data PRZEDM.MIECHO
15f3  7513                 jne 0x1608                        
15f5  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
15fa  750c                 jne 0x1608                        
15fc  c70600003900         mov word ptr [0], 0x39             ; data PRZEDM.MIECHO
1602  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1425
1608  833e000036           cmp word ptr [0], 0x36             ; data PRZEDM.MIECHO
160d  7513                 jne 0x1622                        
160f  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
1614  750c                 jne 0x1622                        
1616  c70600003000         mov word ptr [0], 0x30             ; data PRZEDM.MIECHO
161c  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1426
1622  833e000037           cmp word ptr [0], 0x37             ; data PRZEDM.MIECHO
1627  7513                 jne 0x163c                        
1629  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
162e  750c                 jne 0x163c                        
1630  c70600000100         mov word ptr [0], 1                ; data PRZEDM.ARENA
1636  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1427
163c  833e000038           cmp word ptr [0], 0x38             ; data PRZEDM.MIECHO
1641  7513                 jne 0x1656                        
1643  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
1648  750c                 jne 0x1656                        
164a  c70600003400         mov word ptr [0], 0x34             ; data PRZEDM.MIECHO
1650  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1428
1656  833e000039           cmp word ptr [0], 0x39             ; data PRZEDM.MIECHO
165b  7513                 jne 0x1670                        
165d  833e000000           cmp word ptr [0], 0                ; data PRZEDM.STOP
1662  750c                 jne 0x1670                        
1664  c70600000100         mov word ptr [0], 1                ; data PRZEDM.ARENA
166a  c70600000100         mov word ptr [0], 1                ; data PRZEDM.STOP
; PRZEDM.PAS:1430
1670  31c0                 xor ax, ax                        
1672  a30000               mov word ptr [0], ax               ; data PRZEDM.STOP
; PRZEDM.PAS:1431
1675  833e000000           cmp word ptr [0], 0                ; data PRZEDM.ARENA
167a  740b                 je 0x1687                         
167c  813e0000e803         cmp word ptr [0], 0x3e8            ; data PRZEDM.MIECHO
1682  7403                 je 0x1687                         
1684  e909ed               jmp 0x390                         
; PRZEDM.PAS:1433
1687  5d                   pop bp                            
1688  cb                   retf                              
```

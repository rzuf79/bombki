# `SWIAT.POKOJ75`

Generated recovery aid; not reconstructed source code.

- Original source map: `SWIAT.PAS:308-329`
- TPU code block: `0x0048`
- Procedure bytes: `0x014e`–`0x0311`
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

- `"JESTES NA ULICY CIEMNEJ , WLASCIWIE NARAZIE NIE JEST TU JESZCZE TAK CIEMNO "`
- `"TA ULICA WYGLADA NA REMONTOWANĄ , NA POLNOC WIDZISZ JAKIS BAR "`
- `"NA POLODNIE PRZEBIEGAJA CIE DRESZCZE , JEST TAM NAPRAWDE CIEMNO"`
- `"%."`
- `"MODE"`
- `"EXIT"`
- `"DOSTEPNE WYJSCIA:"`
- `"ZACHOD-CENTRUM MIASTA"`
- `"POLNOC-BAR POD DWOMA PEDALAMI"`
- `"POLODNIE-BLUSZCZ"`
- `"WYJSCIE"`
- `"ZACHOD"`
- `"POLNOC"`
- `"POLODNIE"`

## Annotated listing

```asm
; SWIAT.PAS:308
014e  55                   push bp                           
014f  89e5                 mov bp, sp                        
0151  31c0                 xor ax, ax                        
0153  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; SWIAT.PAS:309
0158  833e00004b           cmp word ptr [0], 0x4b             ; data PRZEDM.MIECHO
015d  7403                 je 0x162                          
015f  e9ad01               jmp 0x30f                         
; SWIAT.PAS:310
0162  bf0000               mov di, 0                          ; data System.OUTPUT
0165  1e                   push ds                           
0166  57                   push di                           
0167  bf0000               mov di, 0                          ; string "JESTES NA ULICY CIEMNEJ , WLASCIWIE NARAZIE NIE JEST TU JESZCZE TAK CIEMNO "
016a  0e                   push cs                           
016b  57                   push di                           
016c  31c0                 xor ax, ax                        
016e  50                   push ax                           
016f  9a00000000           lcall 0, 0                         ; call System.WriteString
0174  9a00000000           lcall 0, 0                         ; call System.WriteLn
0179  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:311
017e  bf0000               mov di, 0                          ; data System.OUTPUT
0181  1e                   push ds                           
0182  57                   push di                           
0183  bf0000               mov di, 0                          ; string "TA ULICA WYGLADA NA REMONTOWANĄ , NA POLNOC WIDZISZ JAKIS BAR "
0186  0e                   push cs                           
0187  57                   push di                           
0188  31c0                 xor ax, ax                        
018a  50                   push ax                           
018b  9a00000000           lcall 0, 0                         ; call System.WriteString
0190  9a00000000           lcall 0, 0                         ; call System.WriteLn
0195  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:312
019a  bf0000               mov di, 0                          ; data System.OUTPUT
019d  1e                   push ds                           
019e  57                   push di                           
019f  bf0000               mov di, 0                          ; string "NA POLODNIE PRZEBIEGAJA CIE DRESZCZE , JEST TAM NAPRAWDE CIEMNO"
01a2  0e                   push cs                           
01a3  57                   push di                           
01a4  31c0                 xor ax, ax                        
01a6  50                   push ax                           
01a7  9a00000000           lcall 0, 0                         ; call System.WriteString
01ac  9a00000000           lcall 0, 0                         ; call System.WriteLn
01b1  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:314
01b6  bf0000               mov di, 0                          ; data System.OUTPUT
01b9  1e                   push ds                           
01ba  57                   push di                           
01bb  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
01be  99                   cwd                               
01bf  52                   push dx                           
01c0  50                   push ax                           
01c1  31c0                 xor ax, ax                        
01c3  50                   push ax                           
01c4  9a00000000           lcall 0, 0                         ; call System.WriteInteger
01c9  bf0000               mov di, 0                          ; string "%."
01cc  0e                   push cs                           
01cd  57                   push di                           
01ce  31c0                 xor ax, ax                        
01d0  50                   push ax                           
01d1  9a00000000           lcall 0, 0                         ; call System.WriteString
01d6  a10000               mov ax, word ptr [0]               ; data PRZEDM.KUNSZT
01d9  99                   cwd                               
01da  52                   push dx                           
01db  50                   push ax                           
01dc  31c0                 xor ax, ax                        
01de  50                   push ax                           
01df  9a00000000           lcall 0, 0                         ; call System.WriteInteger
01e4  b03e                 mov al, 0x3e                      
01e6  50                   push ax                           
01e7  31c0                 xor ax, ax                        
01e9  50                   push ax                           
01ea  9a00000000           lcall 0, 0                         ; call System.WriteChar
01ef  9a00000000           lcall 0, 0                         ; call System.WriteEnd
01f4  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:315
01f9  bf0000               mov di, 0                          ; data System.INPUT
01fc  1e                   push ds                           
01fd  57                   push di                           
01fe  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0201  1e                   push ds                           
0202  57                   push di                           
0203  b8ff00               mov ax, 0xff                      
0206  50                   push ax                           
0207  9a00000000           lcall 0, 0                         ; call System.ReadString
020c  9a00000000           lcall 0, 0                         ; call System.ReadLn
0211  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:316
0216  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0219  1e                   push ds                           
021a  57                   push di                           
021b  bf0000               mov di, 0                          ; string "MODE"
021e  0e                   push cs                           
021f  57                   push di                           
0220  9a00000000           lcall 0, 0                         ; call System.CompareString
0225  7505                 jne 0x22c                         
0227  9a00000000           lcall 0, 0                         ; call PRZEDM.MODE
; SWIAT.PAS:317
022c  bf0000               mov di, 0                          ; data PRZEDM.wpisz
022f  1e                   push ds                           
0230  57                   push di                           
0231  bf0000               mov di, 0                          ; string "EXIT"
0234  0e                   push cs                           
0235  57                   push di                           
0236  9a00000000           lcall 0, 0                         ; call System.CompareString
023b  7570                 jne 0x2ad                         
; SWIAT.PAS:318
023d  bf0000               mov di, 0                          ; data System.OUTPUT
0240  1e                   push ds                           
0241  57                   push di                           
0242  bf0000               mov di, 0                          ; string "DOSTEPNE WYJSCIA:"
0245  0e                   push cs                           
0246  57                   push di                           
0247  31c0                 xor ax, ax                        
0249  50                   push ax                           
024a  9a00000000           lcall 0, 0                         ; call System.WriteString
024f  9a00000000           lcall 0, 0                         ; call System.WriteLn
0254  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:319
0259  bf0000               mov di, 0                          ; data System.OUTPUT
025c  1e                   push ds                           
025d  57                   push di                           
025e  bf0000               mov di, 0                          ; string "ZACHOD-CENTRUM MIASTA"
0261  0e                   push cs                           
0262  57                   push di                           
0263  31c0                 xor ax, ax                        
0265  50                   push ax                           
0266  9a00000000           lcall 0, 0                         ; call System.WriteString
026b  9a00000000           lcall 0, 0                         ; call System.WriteLn
0270  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:320
0275  bf0000               mov di, 0                          ; data System.OUTPUT
0278  1e                   push ds                           
0279  57                   push di                           
027a  bf0000               mov di, 0                          ; string "POLNOC-BAR POD DWOMA PEDALAMI"
027d  0e                   push cs                           
027e  57                   push di                           
027f  31c0                 xor ax, ax                        
0281  50                   push ax                           
0282  9a00000000           lcall 0, 0                         ; call System.WriteString
0287  9a00000000           lcall 0, 0                         ; call System.WriteLn
028c  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:321
0291  bf0000               mov di, 0                          ; data System.OUTPUT
0294  1e                   push ds                           
0295  57                   push di                           
0296  bf0000               mov di, 0                          ; string "POLODNIE-BLUSZCZ"
0299  0e                   push cs                           
029a  57                   push di                           
029b  31c0                 xor ax, ax                        
029d  50                   push ax                           
029e  9a00000000           lcall 0, 0                         ; call System.WriteString
02a3  9a00000000           lcall 0, 0                         ; call System.WriteLn
02a8  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:323
02ad  bf0000               mov di, 0                          ; data PRZEDM.wpisz
02b0  1e                   push ds                           
02b1  57                   push di                           
02b2  bf0000               mov di, 0                          ; string "WYJSCIE"
02b5  0e                   push cs                           
02b6  57                   push di                           
02b7  9a00000000           lcall 0, 0                         ; call System.CompareString
02bc  7502                 jne 0x2c0                         
02be  eb4f                 jmp 0x30f                         
; SWIAT.PAS:324
02c0  bf0000               mov di, 0                          ; data PRZEDM.wpisz
02c3  1e                   push ds                           
02c4  57                   push di                           
02c5  bf0000               mov di, 0                          ; string "ZACHOD"
02c8  0e                   push cs                           
02c9  57                   push di                           
02ca  9a00000000           lcall 0, 0                         ; call System.CompareString
02cf  7506                 jne 0x2d7                         
02d1  c70600001400         mov word ptr [0], 0x14             ; data PRZEDM.MIECHO
; SWIAT.PAS:325
02d7  bf0000               mov di, 0                          ; data PRZEDM.wpisz
02da  1e                   push ds                           
02db  57                   push di                           
02dc  bf0000               mov di, 0                          ; string "POLNOC"
02df  0e                   push cs                           
02e0  57                   push di                           
02e1  9a00000000           lcall 0, 0                         ; call System.CompareString
02e6  7506                 jne 0x2ee                         
02e8  c70600004c00         mov word ptr [0], 0x4c             ; data PRZEDM.MIECHO
; SWIAT.PAS:326
02ee  bf0000               mov di, 0                          ; data PRZEDM.wpisz
02f1  1e                   push ds                           
02f2  57                   push di                           
02f3  bf0000               mov di, 0                          ; string "POLODNIE"
02f6  0e                   push cs                           
02f7  57                   push di                           
02f8  9a00000000           lcall 0, 0                         ; call System.CompareString
02fd  7506                 jne 0x305                         
02ff  c70600004d00         mov word ptr [0], 0x4d             ; data PRZEDM.MIECHO
; SWIAT.PAS:327
0305  833e00004b           cmp word ptr [0], 0x4b             ; data PRZEDM.MIECHO
030a  7503                 jne 0x30f                         
030c  e9a7fe               jmp 0x1b6                         
; SWIAT.PAS:329
030f  5d                   pop bp                            
0310  cb                   retf                              
```

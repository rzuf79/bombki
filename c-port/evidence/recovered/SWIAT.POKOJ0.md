# `SWIAT.POKOJ0`

Generated recovery aid; not reconstructed source code.

- Original source map: `SWIAT.PAS:50-59`
- TPU code block: `0x0008`
- Procedure bytes: `0x005a`–`0x0143`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.ENERGIA`
- `PRZEDM.KUNSZT`
- `PRZEDM.MIECHO`
- `PRZEDM.wpisz`
- `System.INPUT`
- `System.OUTPUT`

## Calls

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

- `"TU ZACZYNA SIE GRE"`
- `"%."`
- `"EXIT"`
- `"DOSTEPNE WYJSCIE-POLNOC-HALA GLOWNA MUD SZKOLE "`
- `"WYJSCIE"`
- `"POLNOC"`

## Annotated listing

```asm
; SWIAT.PAS:50
005a  55                   push bp                           
005b  89e5                 mov bp, sp                        
005d  31c0                 xor ax, ax                        
005f  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; SWIAT.PAS:51
0064  bf0000               mov di, 0                          ; data System.OUTPUT
0067  1e                   push ds                           
0068  57                   push di                           
0069  bf0000               mov di, 0                          ; string "TU ZACZYNA SIE GRE"
006c  0e                   push cs                           
006d  57                   push di                           
006e  31c0                 xor ax, ax                        
0070  50                   push ax                           
0071  9a00000000           lcall 0, 0                         ; call System.WriteString
0076  9a00000000           lcall 0, 0                         ; call System.WriteLn
007b  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:53
0080  bf0000               mov di, 0                          ; data System.OUTPUT
0083  1e                   push ds                           
0084  57                   push di                           
0085  a10000               mov ax, word ptr [0]               ; data PRZEDM.ENERGIA
0088  99                   cwd                               
0089  52                   push dx                           
008a  50                   push ax                           
008b  31c0                 xor ax, ax                        
008d  50                   push ax                           
008e  9a00000000           lcall 0, 0                         ; call System.WriteInteger
0093  bf0000               mov di, 0                          ; string "%."
0096  0e                   push cs                           
0097  57                   push di                           
0098  31c0                 xor ax, ax                        
009a  50                   push ax                           
009b  9a00000000           lcall 0, 0                         ; call System.WriteString
00a0  a10000               mov ax, word ptr [0]               ; data PRZEDM.KUNSZT
00a3  99                   cwd                               
00a4  52                   push dx                           
00a5  50                   push ax                           
00a6  31c0                 xor ax, ax                        
00a8  50                   push ax                           
00a9  9a00000000           lcall 0, 0                         ; call System.WriteInteger
00ae  b03e                 mov al, 0x3e                      
00b0  50                   push ax                           
00b1  31c0                 xor ax, ax                        
00b3  50                   push ax                           
00b4  9a00000000           lcall 0, 0                         ; call System.WriteChar
00b9  9a00000000           lcall 0, 0                         ; call System.WriteEnd
00be  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:54
00c3  bf0000               mov di, 0                          ; data System.INPUT
00c6  1e                   push ds                           
00c7  57                   push di                           
00c8  bf0000               mov di, 0                          ; data PRZEDM.wpisz
00cb  1e                   push ds                           
00cc  57                   push di                           
00cd  b8ff00               mov ax, 0xff                      
00d0  50                   push ax                           
00d1  9a00000000           lcall 0, 0                         ; call System.ReadString
00d6  9a00000000           lcall 0, 0                         ; call System.ReadLn
00db  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:55
00e0  bf0000               mov di, 0                          ; data PRZEDM.wpisz
00e3  1e                   push ds                           
00e4  57                   push di                           
00e5  bf0000               mov di, 0                          ; string "EXIT"
00e8  0e                   push cs                           
00e9  57                   push di                           
00ea  9a00000000           lcall 0, 0                         ; call System.CompareString
00ef  751c                 jne 0x10d                         
00f1  bf0000               mov di, 0                          ; data System.OUTPUT
00f4  1e                   push ds                           
00f5  57                   push di                           
00f6  bf0000               mov di, 0                          ; string "DOSTEPNE WYJSCIE-POLNOC-HALA GLOWNA MUD SZKOLE "
00f9  0e                   push cs                           
00fa  57                   push di                           
00fb  31c0                 xor ax, ax                        
00fd  50                   push ax                           
00fe  9a00000000           lcall 0, 0                         ; call System.WriteString
0103  9a00000000           lcall 0, 0                         ; call System.WriteLn
0108  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; SWIAT.PAS:56
010d  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0110  1e                   push ds                           
0111  57                   push di                           
0112  bf0000               mov di, 0                          ; string "WYJSCIE"
0115  0e                   push cs                           
0116  57                   push di                           
0117  9a00000000           lcall 0, 0                         ; call System.CompareString
011c  7502                 jne 0x120                         
011e  eb21                 jmp 0x141                         
; SWIAT.PAS:57
0120  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0123  1e                   push ds                           
0124  57                   push di                           
0125  bf0000               mov di, 0                          ; string "POLNOC"
0128  0e                   push cs                           
0129  57                   push di                           
012a  9a00000000           lcall 0, 0                         ; call System.CompareString
012f  7506                 jne 0x137                         
0131  c70600000100         mov word ptr [0], 1                ; data PRZEDM.MIECHO
; SWIAT.PAS:58
0137  833e000000           cmp word ptr [0], 0                ; data PRZEDM.MIECHO
013c  7503                 jne 0x141                         
013e  e93fff               jmp 0x80                          
; SWIAT.PAS:59
0141  5d                   pop bp                            
0142  cb                   retf                              
```

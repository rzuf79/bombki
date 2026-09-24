# `PRZEDM.SMIERC`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:192-208`
- TPU code block: `0x0018`
- Procedure bytes: `0x0141`–`0x0277`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `MONSTRA.MAXE`
- `PRZEDM.ENERGIA`
- `PRZEDM.KUNSZT`
- `PRZEDM.MIECHO`
- `PRZEDM.POZIOM`
- `PRZEDM.QUEST`
- `PRZEDM.QUESTWYK`
- `PRZEDM.wpisz`
- `System.INPUT`
- `System.OUTPUT`

## Calls

- `PRZEDM.POTWORY`
- `PRZEDM.save`
- `System.Random`
- `System.ReadLn`
- `System.WriteLn`
- `System.WriteString`
- `System.entry_0x0060`
- `System.entry_0x0190`
- `System.entry_0x01a0`

## Exact strings

- `"AJAJAJAJ TWOJA GLOWA NAWALA JAK TESCIOWA!!!"`
- `"NIC NA TO NIE PORADZE , TRZEBA BYLO SIE STARAC"`
- `"NAGLE REFLEKSJA - DO JASNEJ CENZURY JAK SIE WALCZYLO TYM MIECZEM?"`
- `"NIESTETY WRAZ ZE SMIERCIA TRACISZ KUNSZT ADEKWATNIE DO TWOJEGO LEVELKA"`
- `"POJAWISZ SIE W CENTRUM MIASTA ..... POWODZENIA"`
- `"P.S : AHA POTWORY SIE ODREGENEROWALY"`
- `"PAMIETAJ"`

## Annotated listing

```asm
; PRZEDM.PAS:192
0141  55                   push bp                           
0142  89e5                 mov bp, sp                        
0144  31c0                 xor ax, ax                        
0146  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:193
014b  bf0000               mov di, 0                          ; data System.OUTPUT
014e  1e                   push ds                           
014f  57                   push di                           
0150  bf0000               mov di, 0                          ; string "AJAJAJAJ TWOJA GLOWA NAWALA JAK TESCIOWA!!!"
0153  0e                   push cs                           
0154  57                   push di                           
0155  31c0                 xor ax, ax                        
0157  50                   push ax                           
0158  9a00000000           lcall 0, 0                         ; call System.WriteString
015d  9a00000000           lcall 0, 0                         ; call System.WriteLn
0162  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:194
0167  bf0000               mov di, 0                          ; data System.OUTPUT
016a  1e                   push ds                           
016b  57                   push di                           
016c  bf0000               mov di, 0                          ; string "NIC NA TO NIE PORADZE , TRZEBA BYLO SIE STARAC"
016f  0e                   push cs                           
0170  57                   push di                           
0171  31c0                 xor ax, ax                        
0173  50                   push ax                           
0174  9a00000000           lcall 0, 0                         ; call System.WriteString
0179  9a00000000           lcall 0, 0                         ; call System.WriteLn
017e  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:195
0183  bf0000               mov di, 0                          ; data System.OUTPUT
0186  1e                   push ds                           
0187  57                   push di                           
0188  bf0000               mov di, 0                          ; string "NAGLE REFLEKSJA - DO JASNEJ CENZURY JAK SIE WALCZYLO TYM MIECZEM?"
018b  0e                   push cs                           
018c  57                   push di                           
018d  31c0                 xor ax, ax                        
018f  50                   push ax                           
0190  9a00000000           lcall 0, 0                         ; call System.WriteString
0195  9a00000000           lcall 0, 0                         ; call System.WriteLn
019a  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:196
019f  bf0000               mov di, 0                          ; data System.OUTPUT
01a2  1e                   push ds                           
01a3  57                   push di                           
01a4  bf0000               mov di, 0                          ; string "NIESTETY WRAZ ZE SMIERCIA TRACISZ KUNSZT ADEKWATNIE DO TWOJEGO LEVELKA"
01a7  0e                   push cs                           
01a8  57                   push di                           
01a9  31c0                 xor ax, ax                        
01ab  50                   push ax                           
01ac  9a00000000           lcall 0, 0                         ; call System.WriteString
01b1  9a00000000           lcall 0, 0                         ; call System.WriteLn
01b6  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:197
01bb  bf0000               mov di, 0                          ; data System.OUTPUT
01be  1e                   push ds                           
01bf  57                   push di                           
01c0  bf0000               mov di, 0                          ; string "POJAWISZ SIE W CENTRUM MIASTA ..... POWODZENIA"
01c3  0e                   push cs                           
01c4  57                   push di                           
01c5  31c0                 xor ax, ax                        
01c7  50                   push ax                           
01c8  9a00000000           lcall 0, 0                         ; call System.WriteString
01cd  9a00000000           lcall 0, 0                         ; call System.WriteLn
01d2  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:198
01d7  bf0000               mov di, 0                          ; data System.OUTPUT
01da  1e                   push ds                           
01db  57                   push di                           
01dc  bf0000               mov di, 0                          ; string "P.S : AHA POTWORY SIE ODREGENEROWALY"
01df  0e                   push cs                           
01e0  57                   push di                           
01e1  31c0                 xor ax, ax                        
01e3  50                   push ax                           
01e4  9a00000000           lcall 0, 0                         ; call System.WriteString
01e9  9a00000000           lcall 0, 0                         ; call System.WriteLn
01ee  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:199
01f3  833e000001           cmp word ptr [0], 1                ; data PRZEDM.QUEST
01f8  7506                 jne 0x200                         
01fa  c70600003200         mov word ptr [0], 0x32             ; data PRZEDM.QUESTWYK
; PRZEDM.PAS:200
0200  833e000001           cmp word ptr [0], 1                ; data PRZEDM.QUEST
0205  7e06                 jle 0x20d                         
0207  c7060000c800         mov word ptr [0], 0xc8             ; data PRZEDM.QUESTWYK
; PRZEDM.PAS:201
020d  a10000               mov ax, word ptr [0]               ; data MONSTRA.MAXE
0210  a30000               mov word ptr [0], ax               ; data PRZEDM.ENERGIA
; PRZEDM.PAS:202
0213  a00000               mov al, byte ptr [0]               ; data PRZEDM.POZIOM
0216  98                   cbw                               
0217  8bf0                 mov si, ax                        
0219  d1e0                 shl ax, 1                         
021b  d1e0                 shl ax, 1                         
021d  01f0                 add ax, si                        
021f  99                   cwd                               
0220  52                   push dx                           
0221  50                   push ax                           
0222  b83200               mov ax, 0x32                      
0225  50                   push ax                           
0226  9a00000000           lcall 0, 0                         ; call System.Random
022b  31d2                 xor dx, dx                        
022d  8bc8                 mov cx, ax                        
022f  8bda                 mov bx, dx                        
0231  a10000               mov ax, word ptr [0]               ; data PRZEDM.KUNSZT
0234  2dfa00               sub ax, 0xfa                      
0237  99                   cwd                               
0238  03c1                 add ax, cx                        
023a  13d3                 adc dx, bx                        
023c  59                   pop cx                            
023d  5b                   pop bx                            
023e  2bc1                 sub ax, cx                        
0240  1bd3                 sbb dx, bx                        
0242  a30000               mov word ptr [0], ax               ; data PRZEDM.KUNSZT
; PRZEDM.PAS:203
0245  c70600001400         mov word ptr [0], 0x14             ; data PRZEDM.MIECHO
; PRZEDM.PAS:204
024b  0e                   push cs                           
024c  e80000               call 0x24f                         ; call PRZEDM.POTWORY
; PRZEDM.PAS:205
024f  bf0000               mov di, 0                          ; string "PAMIETAJ"
0252  0e                   push cs                           
0253  57                   push di                           
0254  bf0000               mov di, 0                          ; data PRZEDM.wpisz
0257  1e                   push ds                           
0258  57                   push di                           
0259  b8ff00               mov ax, 0xff                      
025c  50                   push ax                           
025d  9a00000000           lcall 0, 0                         ; call System.entry_0x0060
; PRZEDM.PAS:206
0262  0e                   push cs                           
0263  e80000               call 0x266                         ; call PRZEDM.save
; PRZEDM.PAS:207
0266  bf0000               mov di, 0                          ; data System.INPUT
0269  1e                   push ds                           
026a  57                   push di                           
026b  9a00000000           lcall 0, 0                         ; call System.ReadLn
0270  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:208
0275  5d                   pop bp                            
0276  c3                   ret                               
```

# `PRZEDM.SLABO`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:225-243`
- TPU code block: `0x0028`
- Procedure bytes: `0x0047`–`0x011d`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.CZY`
- `PRZEDM.FORSA`
- `PRZEDM.FUKS`
- `PRZEDM.PACZEK`
- `PRZEDM.PASZOL`
- `PRZEDM.PRZED`
- `PRZEDM.WROGEN`
- `PRZEDM.WROGSIL`
- `PRZEDM.WROGZRE`
- `PRZEDM.wpisz`
- `PRZEDM:0x0038+0x0002`
- `System.OUTPUT`

## Calls

- `PRZEDM.WALKA`
- `System.CompareString`
- `System.Random`
- `System.WriteInteger`
- `System.WriteLn`
- `System.WriteString`
- `System.entry_0x0190`
- `System.entry_0x01a0`

## Exact strings

- `"WYCIAGASZ "`
- `" MONET Z CIALA"`
- `"ZABIJ MROWKA"`
- `"WYCIAGASZ PACZEK Z CIALA MROWKI"`

## Annotated listing

```asm
; PRZEDM.PAS:225
0047  55                   push bp                           
0048  89e5                 mov bp, sp                        
004a  31c0                 xor ax, ax                        
004c  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:226
0051  c70600000100         mov word ptr [0], 1                ; data PRZEDM.WROGEN
; PRZEDM.PAS:227
0057  c70600000100         mov word ptr [0], 1                ; data PRZEDM.WROGZRE
; PRZEDM.PAS:228
005d  c70600000200         mov word ptr [0], 2                ; data PRZEDM.WROGSIL
; PRZEDM.PAS:229
0063  0e                   push cs                           
0064  e80000               call 0x67                          ; call PRZEDM.WALKA
; PRZEDM.PAS:230
0067  833e000000           cmp word ptr [0], 0                ; data PRZEDM.PASZOL
006c  7403                 je 0x71                           
006e  e9aa00               jmp 0x11b                         
; PRZEDM.PAS:231
0071  b80300               mov ax, 3                         
0074  50                   push ax                           
0075  9a00000000           lcall 0, 0                         ; call System.Random
007a  a30000               mov word ptr [0], ax               ; data PRZEDM.CZY
; PRZEDM.PAS:232
007d  bf0000               mov di, 0                          ; data System.OUTPUT
0080  1e                   push ds                           
0081  57                   push di                           
0082  bf0000               mov di, 0                          ; string "WYCIAGASZ "
0085  0e                   push cs                           
0086  57                   push di                           
0087  31c0                 xor ax, ax                        
0089  50                   push ax                           
008a  9a00000000           lcall 0, 0                         ; call System.WriteString
008f  a10000               mov ax, word ptr [0]               ; data PRZEDM.CZY
0092  99                   cwd                               
0093  52                   push dx                           
0094  50                   push ax                           
0095  31c0                 xor ax, ax                        
0097  50                   push ax                           
0098  9a00000000           lcall 0, 0                         ; call System.WriteInteger
009d  bf0000               mov di, 0                          ; string " MONET Z CIALA"
00a0  0e                   push cs                           
00a1  57                   push di                           
00a2  31c0                 xor ax, ax                        
00a4  50                   push ax                           
00a5  9a00000000           lcall 0, 0                         ; call System.WriteString
00aa  9a00000000           lcall 0, 0                         ; call System.WriteLn
00af  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:233
00b4  a10000               mov ax, word ptr [0]               ; data PRZEDM.CZY
00b7  99                   cwd                               
00b8  03060000             add ax, word ptr [0]               ; data PRZEDM.FORSA
00bc  13160000             adc dx, word ptr [0]               ; data PRZEDM:0x0038+0x0002
00c0  a30000               mov word ptr [0], ax               ; data PRZEDM.FORSA
00c3  89160000             mov word ptr [0], dx               ; data PRZEDM:0x0038+0x0002
; PRZEDM.PAS:234
00c7  bf0000               mov di, 0                          ; data PRZEDM.wpisz
00ca  1e                   push ds                           
00cb  57                   push di                           
00cc  bf0000               mov di, 0                          ; string "ZABIJ MROWKA"
00cf  0e                   push cs                           
00d0  57                   push di                           
00d1  9a00000000           lcall 0, 0                         ; call System.CompareString
00d6  7543                 jne 0x11b                         
; PRZEDM.PAS:235
00d8  b80a00               mov ax, 0xa                       
00db  50                   push ax                           
00dc  9a00000000           lcall 0, 0                         ; call System.Random
00e1  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:236
00e4  833e000007           cmp word ptr [0], 7                ; data PRZEDM.FUKS
00e9  7d30                 jge 0x11b                         
00eb  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.PACZEK
00f0  7429                 je 0x11b                          
; PRZEDM.PAS:237
00f2  bf0000               mov di, 0                          ; data System.OUTPUT
00f5  1e                   push ds                           
00f6  57                   push di                           
00f7  bf0000               mov di, 0                          ; string "WYCIAGASZ PACZEK Z CIALA MROWKI"
00fa  0e                   push cs                           
00fb  57                   push di                           
00fc  31c0                 xor ax, ax                        
00fe  50                   push ax                           
00ff  9a00000000           lcall 0, 0                         ; call System.WriteString
0104  9a00000000           lcall 0, 0                         ; call System.WriteLn
0109  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:238
010e  c7060000f6ff         mov word ptr [0], 0xfff6           ; data PRZEDM.PACZEK
; PRZEDM.PAS:239
0114  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
0117  40                   inc ax                            
0118  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:243
011b  5d                   pop bp                            
011c  cb                   retf                              
```

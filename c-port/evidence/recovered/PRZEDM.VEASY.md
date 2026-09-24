# `PRZEDM.VEASY`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:305-323`
- TPU code block: `0x0048`
- Procedure bytes: `0x0038`–`0x012c`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.CZY`
- `PRZEDM.ENERGIA`
- `PRZEDM.FORSA`
- `PRZEDM.FUKS`
- `PRZEDM.PASZOL`
- `PRZEDM.PRZED`
- `PRZEDM.SERCE`
- `PRZEDM.WROGEN`
- `PRZEDM.WROGSIL`
- `PRZEDM.WROGZRE`
- `PRZEDM:0x0038+0x0002`
- `System.OUTPUT`

## Calls

- `PRZEDM.WALKA`
- `System.Random`
- `System.WriteInteger`
- `System.WriteLn`
- `System.WriteString`
- `System.entry_0x0190`
- `System.entry_0x01a0`

## Exact strings

- `"WYCIAGASZ "`
- `" MONET Z CIALA"`
- `"WYCIAGASZ SERCE Z CIALA TRUPA"`

## Annotated listing

```asm
; PRZEDM.PAS:305
0038  55                   push bp                           
0039  89e5                 mov bp, sp                        
003b  31c0                 xor ax, ax                        
003d  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:306
0042  b80a00               mov ax, 0xa                       
0045  50                   push ax                           
0046  9a00000000           lcall 0, 0                         ; call System.Random
004b  055a00               add ax, 0x5a                      
004e  a30000               mov word ptr [0], ax               ; data PRZEDM.WROGEN
; PRZEDM.PAS:307
0051  b80200               mov ax, 2                         
0054  50                   push ax                           
0055  9a00000000           lcall 0, 0                         ; call System.Random
005a  050e00               add ax, 0xe                       
005d  a30000               mov word ptr [0], ax               ; data PRZEDM.WROGZRE
; PRZEDM.PAS:308
0060  b80200               mov ax, 2                         
0063  50                   push ax                           
0064  9a00000000           lcall 0, 0                         ; call System.Random
0069  051100               add ax, 0x11                      
006c  a30000               mov word ptr [0], ax               ; data PRZEDM.WROGSIL
; PRZEDM.PAS:309
006f  0e                   push cs                           
0070  e80000               call 0x73                          ; call PRZEDM.WALKA
; PRZEDM.PAS:310
0073  833e000000           cmp word ptr [0], 0                ; data PRZEDM.PASZOL
0078  7403                 je 0x7d                           
007a  e9ad00               jmp 0x12a                         
007d  833e000000           cmp word ptr [0], 0                ; data PRZEDM.ENERGIA
0082  7f03                 jg 0x87                           
0084  e9a300               jmp 0x12a                         
; PRZEDM.PAS:311
0087  b83700               mov ax, 0x37                      
008a  50                   push ax                           
008b  9a00000000           lcall 0, 0                         ; call System.Random
0090  050a00               add ax, 0xa                       
0093  a30000               mov word ptr [0], ax               ; data PRZEDM.CZY
; PRZEDM.PAS:312
0096  bf0000               mov di, 0                          ; data System.OUTPUT
0099  1e                   push ds                           
009a  57                   push di                           
009b  bf0000               mov di, 0                          ; string "WYCIAGASZ "
009e  0e                   push cs                           
009f  57                   push di                           
00a0  31c0                 xor ax, ax                        
00a2  50                   push ax                           
00a3  9a00000000           lcall 0, 0                         ; call System.WriteString
00a8  a10000               mov ax, word ptr [0]               ; data PRZEDM.CZY
00ab  99                   cwd                               
00ac  52                   push dx                           
00ad  50                   push ax                           
00ae  31c0                 xor ax, ax                        
00b0  50                   push ax                           
00b1  9a00000000           lcall 0, 0                         ; call System.WriteInteger
00b6  bf0000               mov di, 0                          ; string " MONET Z CIALA"
00b9  0e                   push cs                           
00ba  57                   push di                           
00bb  31c0                 xor ax, ax                        
00bd  50                   push ax                           
00be  9a00000000           lcall 0, 0                         ; call System.WriteString
00c3  9a00000000           lcall 0, 0                         ; call System.WriteLn
00c8  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:313
00cd  a10000               mov ax, word ptr [0]               ; data PRZEDM.CZY
00d0  99                   cwd                               
00d1  03060000             add ax, word ptr [0]               ; data PRZEDM.FORSA
00d5  13160000             adc dx, word ptr [0]               ; data PRZEDM:0x0038+0x0002
00d9  a30000               mov word ptr [0], ax               ; data PRZEDM.FORSA
00dc  89160000             mov word ptr [0], dx               ; data PRZEDM:0x0038+0x0002
; PRZEDM.PAS:314
00e0  833e000000           cmp word ptr [0], 0                ; data PRZEDM.SERCE
00e5  7543                 jne 0x12a                         
; PRZEDM.PAS:315
00e7  b81400               mov ax, 0x14                      
00ea  50                   push ax                           
00eb  9a00000000           lcall 0, 0                         ; call System.Random
00f0  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:316
00f3  833e000004           cmp word ptr [0], 4                ; data PRZEDM.FUKS
00f8  7d30                 jge 0x12a                         
00fa  833e0000f6           cmp word ptr [0], -0xa             ; data PRZEDM.SERCE
00ff  7429                 je 0x12a                          
; PRZEDM.PAS:317
0101  bf0000               mov di, 0                          ; data System.OUTPUT
0104  1e                   push ds                           
0105  57                   push di                           
0106  bf0000               mov di, 0                          ; string "WYCIAGASZ SERCE Z CIALA TRUPA"
0109  0e                   push cs                           
010a  57                   push di                           
010b  31c0                 xor ax, ax                        
010d  50                   push ax                           
010e  9a00000000           lcall 0, 0                         ; call System.WriteString
0113  9a00000000           lcall 0, 0                         ; call System.WriteLn
0118  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:318
011d  c7060000f6ff         mov word ptr [0], 0xfff6           ; data PRZEDM.SERCE
; PRZEDM.PAS:319
0123  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
0126  40                   inc ax                            
0127  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:323
012a  5d                   pop bp                            
012b  cb                   retf                              
```

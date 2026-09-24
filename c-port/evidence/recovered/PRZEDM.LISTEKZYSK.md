# `PRZEDM.LISTEKZYSK`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:522-531`
- TPU code block: `0x0090`
- Procedure bytes: `0x0054`–`0x00cd`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.FUKS`
- `PRZEDM.LISTEK`
- `PRZEDM.MAXMANA`
- `PRZEDM.MIECHO`
- `PRZEDM.PRZED`
- `System.OUTPUT`

## Calls

- `System.Random`
- `System.WriteLn`
- `System.WriteString`
- `System.entry_0x0190`
- `System.entry_0x01a0`

## Exact strings

- `"WYCIAGASZ LISTEK SZCZESCIA Z CIALA WROGIEJ TOBIE POSTACI"`
- `"!!! PRZEDMIOT UNIQE 4% !!!"`

## Annotated listing

```asm
; PRZEDM.PAS:522
0054  55                   push bp                           
0055  89e5                 mov bp, sp                        
0057  31c0                 xor ax, ax                        
0059  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:523
005e  b86400               mov ax, 0x64                      
0061  50                   push ax                           
0062  9a00000000           lcall 0, 0                         ; call System.Random
0067  a30000               mov word ptr [0], ax               ; data PRZEDM.FUKS
; PRZEDM.PAS:524
006a  833e000006           cmp word ptr [0], 6                ; data PRZEDM.FUKS
006f  7d5a                 jge 0xcb                          
0071  813e00001027         cmp word ptr [0], 0x2710           ; data PRZEDM.MIECHO
0077  7452                 je 0xcb                           
; PRZEDM.PAS:525
0079  bf0000               mov di, 0                          ; data System.OUTPUT
007c  1e                   push ds                           
007d  57                   push di                           
007e  bf0000               mov di, 0                          ; string "WYCIAGASZ LISTEK SZCZESCIA Z CIALA WROGIEJ TOBIE POSTACI"
0081  0e                   push cs                           
0082  57                   push di                           
0083  31c0                 xor ax, ax                        
0085  50                   push ax                           
0086  9a00000000           lcall 0, 0                         ; call System.WriteString
008b  9a00000000           lcall 0, 0                         ; call System.WriteLn
0090  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:526
0095  bf0000               mov di, 0                          ; data System.OUTPUT
0098  1e                   push ds                           
0099  57                   push di                           
009a  bf0000               mov di, 0                          ; string "!!! PRZEDMIOT UNIQE 4% !!!"
009d  0e                   push cs                           
009e  57                   push di                           
009f  31c0                 xor ax, ax                        
00a1  50                   push ax                           
00a2  9a00000000           lcall 0, 0                         ; call System.WriteString
00a7  9a00000000           lcall 0, 0                         ; call System.WriteLn
00ac  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; PRZEDM.PAS:527
00b1  a00000               mov al, byte ptr [0]               ; data PRZEDM.LISTEK
00b4  98                   cbw                               
00b5  2d0a00               sub ax, 0xa                       
00b8  a20000               mov byte ptr [0], al               ; data PRZEDM.LISTEK
; PRZEDM.PAS:528
00bb  a10000               mov ax, word ptr [0]               ; data PRZEDM.PRZED
00be  40                   inc ax                            
00bf  a30000               mov word ptr [0], ax               ; data PRZEDM.PRZED
; PRZEDM.PAS:529
00c2  a10000               mov ax, word ptr [0]               ; data PRZEDM.MAXMANA
00c5  052800               add ax, 0x28                      
00c8  a30000               mov word ptr [0], ax               ; data PRZEDM.MAXMANA
; PRZEDM.PAS:531
00cb  5d                   pop bp                            
00cc  cb                   retf                              
```

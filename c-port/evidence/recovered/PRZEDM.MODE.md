# `PRZEDM.MODE`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:543-546`
- TPU code block: `0x00a0`
- Procedure bytes: `0x0000`–`0x0018`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `PRZEDM.MIECHO`
- `PRZEDM.MIECHO2`

## Calls

- `System.entry_0x01a0`

## Exact strings

- None.

## Annotated listing

```asm
; PRZEDM.PAS:543
0000  55                   push bp                           
0001  89e5                 mov bp, sp                        
0003  31c0                 xor ax, ax                        
0005  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:544
000a  a10000               mov ax, word ptr [0]               ; data PRZEDM.MIECHO
000d  a30000               mov word ptr [0], ax               ; data PRZEDM.MIECHO2
; PRZEDM.PAS:545
0010  c7060000e803         mov word ptr [0], 0x3e8            ; data PRZEDM.MIECHO
; PRZEDM.PAS:546
0016  5d                   pop bp                            
0017  cb                   retf                              
```

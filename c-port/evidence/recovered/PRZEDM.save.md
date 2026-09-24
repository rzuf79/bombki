# `PRZEDM.save`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:1573-1574`
- TPU code block: `0x0108`
- Procedure bytes: `0x0000`–`0x000c`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- None resolved.

## Calls

- `System.entry_0x01a0`

## Exact strings

- None.

## Annotated listing

```asm
; PRZEDM.PAS:1573
0000  55                   push bp                           
0001  89e5                 mov bp, sp                        
0003  31c0                 xor ax, ax                        
0005  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:1574
000a  5d                   pop bp                            
000b  cb                   retf                              
```

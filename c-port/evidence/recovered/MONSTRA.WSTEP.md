# `MONSTRA.WSTEP`

Generated recovery aid; not reconstructed source code.

- Original source map: `MONSTRA.PAS:10-51`
- TPU code block: `0x0000`
- Procedure bytes: `0x022b`–`0x04ab`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `MONSTRA.MAXE`
- `System.OUTPUT`

## Calls

- `Crt.Delay`
- `Crt.entry_0x0010`
- `Crt.entry_0x0048`
- `Crt.entry_0x0098`
- `Crt.entry_0x00a0`
- `System.WriteLn`
- `System.WriteString`
- `System.entry_0x0190`
- `System.entry_0x01a0`

## Exact strings

- `"         |||||| "`
- `"         ||||||                     M&M=MILY MUD "`
- `"         ||||||     "`
- `" /-----------------------\\       /\\  /\\   | |   \\./  "`
- `"|   /\\           /\\       |     /  \\/  \\  | |__  | "`
- `"|   \\/           \\/       |"`
- `"|        /                |     /\\  /\\   |   |  |-\\ "`
- `"| \\     /___)      /      |    /  \\/  \\  |___|  |_/ "`
- `"|  \\______________/       |"`
- `"|   \\____________/        |"`
- `"\\_________________________/"`
- `"VERSJA CETA 0.86 23.05.99 - LAST MODYFIKACIONEN"`
- `"NACISNIJ DOWOLNY KLAWISZ ABY ROZPOCZAC GRE"`
- `"KORZYSTAJ Z DUZYCH LITER !!!!!!!!!!!!!!!!!"`
- `"TICK !!!"`

## Annotated listing

```asm
; MONSTRA.PAS:10
022b  55                   push bp                           
022c  89e5                 mov bp, sp                        
022e  31c0                 xor ax, ax                        
0230  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; MONSTRA.PAS:11
0235  9a00000000           lcall 0, 0                         ; call Crt.entry_0x0048
; MONSTRA.PAS:12
023a  c70600003200         mov word ptr [0], 0x32             ; data MONSTRA.MAXE
; MONSTRA.PAS:13
0240  bf0000               mov di, 0                          ; data System.OUTPUT
0243  1e                   push ds                           
0244  57                   push di                           
0245  bf0000               mov di, 0                          ; string "         |||||| "
0248  0e                   push cs                           
0249  57                   push di                           
024a  31c0                 xor ax, ax                        
024c  50                   push ax                           
024d  9a00000000           lcall 0, 0                         ; call System.WriteString
0252  9a00000000           lcall 0, 0                         ; call System.WriteLn
0257  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; MONSTRA.PAS:14
025c  bf0000               mov di, 0                          ; data System.OUTPUT
025f  1e                   push ds                           
0260  57                   push di                           
0261  bf0000               mov di, 0                          ; string "         ||||||                     M&M=MILY MUD "
0264  0e                   push cs                           
0265  57                   push di                           
0266  31c0                 xor ax, ax                        
0268  50                   push ax                           
0269  9a00000000           lcall 0, 0                         ; call System.WriteString
026e  9a00000000           lcall 0, 0                         ; call System.WriteLn
0273  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; MONSTRA.PAS:15
0278  bf0000               mov di, 0                          ; data System.OUTPUT
027b  1e                   push ds                           
027c  57                   push di                           
027d  bf0000               mov di, 0                          ; string "         ||||||     "
0280  0e                   push cs                           
0281  57                   push di                           
0282  31c0                 xor ax, ax                        
0284  50                   push ax                           
0285  9a00000000           lcall 0, 0                         ; call System.WriteString
028a  9a00000000           lcall 0, 0                         ; call System.WriteLn
028f  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; MONSTRA.PAS:16
0294  bf0000               mov di, 0                          ; data System.OUTPUT
0297  1e                   push ds                           
0298  57                   push di                           
0299  bf0000               mov di, 0                          ; string " /-----------------------\\       /\\  /\\   | |   \\./  "
029c  0e                   push cs                           
029d  57                   push di                           
029e  31c0                 xor ax, ax                        
02a0  50                   push ax                           
02a1  9a00000000           lcall 0, 0                         ; call System.WriteString
02a6  9a00000000           lcall 0, 0                         ; call System.WriteLn
02ab  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; MONSTRA.PAS:17
02b0  bf0000               mov di, 0                          ; data System.OUTPUT
02b3  1e                   push ds                           
02b4  57                   push di                           
02b5  bf0000               mov di, 0                          ; string "|   /\\           /\\       |     /  \\/  \\  | |__  | "
02b8  0e                   push cs                           
02b9  57                   push di                           
02ba  31c0                 xor ax, ax                        
02bc  50                   push ax                           
02bd  9a00000000           lcall 0, 0                         ; call System.WriteString
02c2  9a00000000           lcall 0, 0                         ; call System.WriteLn
02c7  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; MONSTRA.PAS:18
02cc  bf0000               mov di, 0                          ; data System.OUTPUT
02cf  1e                   push ds                           
02d0  57                   push di                           
02d1  bf0000               mov di, 0                          ; string "|   \\/           \\/       |"
02d4  0e                   push cs                           
02d5  57                   push di                           
02d6  31c0                 xor ax, ax                        
02d8  50                   push ax                           
02d9  9a00000000           lcall 0, 0                         ; call System.WriteString
02de  9a00000000           lcall 0, 0                         ; call System.WriteLn
02e3  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; MONSTRA.PAS:19
02e8  bf0000               mov di, 0                          ; data System.OUTPUT
02eb  1e                   push ds                           
02ec  57                   push di                           
02ed  bf0000               mov di, 0                          ; string "|        /                |     /\\  /\\   |   |  |-\\ "
02f0  0e                   push cs                           
02f1  57                   push di                           
02f2  31c0                 xor ax, ax                        
02f4  50                   push ax                           
02f5  9a00000000           lcall 0, 0                         ; call System.WriteString
02fa  9a00000000           lcall 0, 0                         ; call System.WriteLn
02ff  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; MONSTRA.PAS:20
0304  bf0000               mov di, 0                          ; data System.OUTPUT
0307  1e                   push ds                           
0308  57                   push di                           
0309  bf0000               mov di, 0                          ; string "| \\     /___)      /      |    /  \\/  \\  |___|  |_/ "
030c  0e                   push cs                           
030d  57                   push di                           
030e  31c0                 xor ax, ax                        
0310  50                   push ax                           
0311  9a00000000           lcall 0, 0                         ; call System.WriteString
0316  9a00000000           lcall 0, 0                         ; call System.WriteLn
031b  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; MONSTRA.PAS:21
0320  bf0000               mov di, 0                          ; data System.OUTPUT
0323  1e                   push ds                           
0324  57                   push di                           
0325  bf0000               mov di, 0                          ; string "|  \\______________/       |"
0328  0e                   push cs                           
0329  57                   push di                           
032a  31c0                 xor ax, ax                        
032c  50                   push ax                           
032d  9a00000000           lcall 0, 0                         ; call System.WriteString
0332  9a00000000           lcall 0, 0                         ; call System.WriteLn
0337  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; MONSTRA.PAS:22
033c  bf0000               mov di, 0                          ; data System.OUTPUT
033f  1e                   push ds                           
0340  57                   push di                           
0341  bf0000               mov di, 0                          ; string "|   \\____________/        |"
0344  0e                   push cs                           
0345  57                   push di                           
0346  31c0                 xor ax, ax                        
0348  50                   push ax                           
0349  9a00000000           lcall 0, 0                         ; call System.WriteString
034e  9a00000000           lcall 0, 0                         ; call System.WriteLn
0353  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; MONSTRA.PAS:23
0358  bf0000               mov di, 0                          ; data System.OUTPUT
035b  1e                   push ds                           
035c  57                   push di                           
035d  bf0000               mov di, 0                          ; string "\\_________________________/"
0360  0e                   push cs                           
0361  57                   push di                           
0362  31c0                 xor ax, ax                        
0364  50                   push ax                           
0365  9a00000000           lcall 0, 0                         ; call System.WriteString
036a  9a00000000           lcall 0, 0                         ; call System.WriteLn
036f  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; MONSTRA.PAS:24
0374  bf0000               mov di, 0                          ; data System.OUTPUT
0377  1e                   push ds                           
0378  57                   push di                           
0379  bf0000               mov di, 0                          ; string "VERSJA CETA 0.86 23.05.99 - LAST MODYFIKACIONEN"
037c  0e                   push cs                           
037d  57                   push di                           
037e  31c0                 xor ax, ax                        
0380  50                   push ax                           
0381  9a00000000           lcall 0, 0                         ; call System.WriteString
0386  9a00000000           lcall 0, 0                         ; call System.WriteLn
038b  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; MONSTRA.PAS:25
0390  bf0000               mov di, 0                          ; data System.OUTPUT
0393  1e                   push ds                           
0394  57                   push di                           
0395  bf0000               mov di, 0                          ; string "NACISNIJ DOWOLNY KLAWISZ ABY ROZPOCZAC GRE"
0398  0e                   push cs                           
0399  57                   push di                           
039a  31c0                 xor ax, ax                        
039c  50                   push ax                           
039d  9a00000000           lcall 0, 0                         ; call System.WriteString
03a2  9a00000000           lcall 0, 0                         ; call System.WriteLn
03a7  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; MONSTRA.PAS:26
03ac  bf0000               mov di, 0                          ; data System.OUTPUT
03af  1e                   push ds                           
03b0  57                   push di                           
03b1  bf0000               mov di, 0                          ; string "KORZYSTAJ Z DUZYCH LITER !!!!!!!!!!!!!!!!!"
03b4  0e                   push cs                           
03b5  57                   push di                           
03b6  31c0                 xor ax, ax                        
03b8  50                   push ax                           
03b9  9a00000000           lcall 0, 0                         ; call System.WriteString
03be  9a00000000           lcall 0, 0                         ; call System.WriteLn
03c3  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; MONSTRA.PAS:28
03c8  b86400               mov ax, 0x64                      
03cb  50                   push ax                           
03cc  9a00000000           lcall 0, 0                         ; call Crt.entry_0x0098
; MONSTRA.PAS:29
03d1  b86400               mov ax, 0x64                      
03d4  50                   push ax                           
03d5  9a00000000           lcall 0, 0                         ; call Crt.Delay
; MONSTRA.PAS:30
03da  b8c800               mov ax, 0xc8                      
03dd  50                   push ax                           
03de  9a00000000           lcall 0, 0                         ; call Crt.entry_0x0098
; MONSTRA.PAS:31
03e3  b86400               mov ax, 0x64                      
03e6  50                   push ax                           
03e7  9a00000000           lcall 0, 0                         ; call Crt.Delay
; MONSTRA.PAS:32
03ec  b82c01               mov ax, 0x12c                     
03ef  50                   push ax                           
03f0  9a00000000           lcall 0, 0                         ; call Crt.entry_0x0098
; MONSTRA.PAS:33
03f5  b86400               mov ax, 0x64                      
03f8  50                   push ax                           
03f9  9a00000000           lcall 0, 0                         ; call Crt.Delay
; MONSTRA.PAS:34
03fe  b89001               mov ax, 0x190                     
0401  50                   push ax                           
0402  9a00000000           lcall 0, 0                         ; call Crt.entry_0x0098
; MONSTRA.PAS:35
0407  b86400               mov ax, 0x64                      
040a  50                   push ax                           
040b  9a00000000           lcall 0, 0                         ; call Crt.Delay
; MONSTRA.PAS:36
0410  b8f401               mov ax, 0x1f4                     
0413  50                   push ax                           
0414  9a00000000           lcall 0, 0                         ; call Crt.entry_0x0098
; MONSTRA.PAS:37
0419  b86400               mov ax, 0x64                      
041c  50                   push ax                           
041d  9a00000000           lcall 0, 0                         ; call Crt.Delay
; MONSTRA.PAS:38
0422  b85802               mov ax, 0x258                     
0425  50                   push ax                           
0426  9a00000000           lcall 0, 0                         ; call Crt.entry_0x0098
; MONSTRA.PAS:39
042b  b86400               mov ax, 0x64                      
042e  50                   push ax                           
042f  9a00000000           lcall 0, 0                         ; call Crt.Delay
; MONSTRA.PAS:40
0434  b8f401               mov ax, 0x1f4                     
0437  50                   push ax                           
0438  9a00000000           lcall 0, 0                         ; call Crt.entry_0x0098
; MONSTRA.PAS:41
043d  b86400               mov ax, 0x64                      
0440  50                   push ax                           
0441  9a00000000           lcall 0, 0                         ; call Crt.Delay
; MONSTRA.PAS:42
0446  b89001               mov ax, 0x190                     
0449  50                   push ax                           
044a  9a00000000           lcall 0, 0                         ; call Crt.entry_0x0098
; MONSTRA.PAS:43
044f  b86400               mov ax, 0x64                      
0452  50                   push ax                           
0453  9a00000000           lcall 0, 0                         ; call Crt.Delay
; MONSTRA.PAS:44
0458  b82c01               mov ax, 0x12c                     
045b  50                   push ax                           
045c  9a00000000           lcall 0, 0                         ; call Crt.entry_0x0098
; MONSTRA.PAS:45
0461  b86400               mov ax, 0x64                      
0464  50                   push ax                           
0465  9a00000000           lcall 0, 0                         ; call Crt.Delay
; MONSTRA.PAS:46
046a  b8c800               mov ax, 0xc8                      
046d  50                   push ax                           
046e  9a00000000           lcall 0, 0                         ; call Crt.entry_0x0098
; MONSTRA.PAS:47
0473  b86400               mov ax, 0x64                      
0476  50                   push ax                           
0477  9a00000000           lcall 0, 0                         ; call Crt.Delay
; MONSTRA.PAS:48
047c  bf0000               mov di, 0                          ; data System.OUTPUT
047f  1e                   push ds                           
0480  57                   push di                           
0481  bf0000               mov di, 0                          ; string "TICK !!!"
0484  0e                   push cs                           
0485  57                   push di                           
0486  31c0                 xor ax, ax                        
0488  50                   push ax                           
0489  9a00000000           lcall 0, 0                         ; call System.WriteString
048e  9a00000000           lcall 0, 0                         ; call System.WriteLn
0493  9a00000000           lcall 0, 0                         ; call System.entry_0x0190
; MONSTRA.PAS:49
0498  9a00000000           lcall 0, 0                         ; call Crt.entry_0x0010
049d  08c0                 or al, al                         
049f  7503                 jne 0x4a4                         
04a1  e924ff               jmp 0x3c8                         
; MONSTRA.PAS:50
04a4  9a00000000           lcall 0, 0                         ; call Crt.entry_0x00a0
; MONSTRA.PAS:51
04a9  5d                   pop bp                            
04aa  cb                   retf                              
```

# `PRZEDM.POTWORY`

Generated recovery aid; not reconstructed source code.

- Original source map: `PRZEDM.PAS:70-164`
- TPU code block: `0x0008`
- Procedure bytes: `0x0000`–`0x05d8`
- Exact displayed strings below are evidence and must not be rewritten.

## Referenced state

- `MONSTRA.DJ`
- `MONSTRA.DRZWI`
- `MONSTRA.GRUBAS`
- `MONSTRA.JAMNIK`
- `MONSTRA.MACIEK`
- `MONSTRA.MINIBARMAN`
- `MONSTRA.OWCZAREK`
- `MONSTRA.PARA`
- `MONSTRA.PEDAL`
- `MONSTRA.PIESEK`
- `MONSTRA.PIJAK`
- `MONSTRA.PUDEL`
- `MONSTRA.SPANIEL`
- `MONSTRA.SPRZEDAWCA`
- `MONSTRA.STARUCH`
- `MONSTRA.TAKSOWKARZ`
- `MONSTRA.ZAMIATACZ`
- `MONSTRA.ZEBRAK`
- `PRZEDM.AGREST`
- `PRZEDM.BAKTERIA`
- `PRZEDM.BIZON`
- `PRZEDM.BOA`
- `PRZEDM.CZLOWIEK`
- `PRZEDM.DMUCHAWIEC`
- `PRZEDM.DUNCAN`
- `PRZEDM.DZIADEK`
- `PRZEDM.DZIECKO`
- `PRZEDM.DZIK`
- `PRZEDM.FAN`
- `PRZEDM.GITARZYSTA`
- `PRZEDM.GLADIATOR`
- `PRZEDM.GORYL`
- `PRZEDM.JEZYNA`
- `PRZEDM.KARALUCH`
- `PRZEDM.KONICZYNKA`
- `PRZEDM.KORNIK`
- `PRZEDM.KUROPATWA`
- `PRZEDM.LEW`
- `PRZEDM.LIROY`
- `PRZEDM.LIS`
- `PRZEDM.MALINA`
- `PRZEDM.MLECZ`
- `PRZEDM.MROWKA`
- `PRZEDM.MUCHA`
- `PRZEDM.OCHRONIARZ`
- `PRZEDM.ORGANISTA`
- `PRZEDM.ORZEL`
- `PRZEDM.OSET`
- `PRZEDM.PAJAK`
- `PRZEDM.PANTERA`
- `PRZEDM.PERKUSISTA`
- `PRZEDM.POLICJANT`
- `PRZEDM.REPORTER`
- `PRZEDM.ROZA`
- `PRZEDM.SARNA`
- `PRZEDM.SLIMAK`
- `PRZEDM.SLON`
- `PRZEDM.SLUCHACZ`
- `PRZEDM.STOKROTKA`
- `PRZEDM.STRUS`
- `PRZEDM.SZCZAW`
- `PRZEDM.SZCZUR`
- `PRZEDM.TRAWA`
- `PRZEDM.TRENER`
- `PRZEDM.WARIAT`
- `PRZEDM.WIELBLAD`
- `PRZEDM.WILCZUR`
- `PRZEDM.WILK`
- `PRZEDM.WOJOWNIK`
- `PRZEDM.ZAJAC`
- `PRZEDM.ZUK`
- `PRZEDM.ZYRAFA`

## Calls

- `System.Random`
- `System.entry_0x01a0`

## Exact strings

- None.

## Annotated listing

```asm
; PRZEDM.PAS:70
0000  55                   push bp                           
0001  89e5                 mov bp, sp                        
0003  31c0                 xor ax, ax                        
0005  9a00000000           lcall 0, 0                         ; call System.entry_0x01a0
; PRZEDM.PAS:72
000a  b82600               mov ax, 0x26                      
000d  50                   push ax                           
000e  9a00000000           lcall 0, 0                         ; call System.Random
0013  051400               add ax, 0x14                      
0016  a30000               mov word ptr [0], ax               ; data PRZEDM.BAKTERIA
; PRZEDM.PAS:73
0019  b82600               mov ax, 0x26                      
001c  50                   push ax                           
001d  9a00000000           lcall 0, 0                         ; call System.Random
0022  051400               add ax, 0x14                      
0025  a30000               mov word ptr [0], ax               ; data PRZEDM.SLIMAK
; PRZEDM.PAS:74
0028  b82600               mov ax, 0x26                      
002b  50                   push ax                           
002c  9a00000000           lcall 0, 0                         ; call System.Random
0031  051400               add ax, 0x14                      
0034  a30000               mov word ptr [0], ax               ; data PRZEDM.ZUK
; PRZEDM.PAS:75
0037  b82600               mov ax, 0x26                      
003a  50                   push ax                           
003b  9a00000000           lcall 0, 0                         ; call System.Random
0040  051400               add ax, 0x14                      
0043  a30000               mov word ptr [0], ax               ; data PRZEDM.KARALUCH
; PRZEDM.PAS:76
0046  b82600               mov ax, 0x26                      
0049  50                   push ax                           
004a  9a00000000           lcall 0, 0                         ; call System.Random
004f  051400               add ax, 0x14                      
0052  a30000               mov word ptr [0], ax               ; data PRZEDM.MROWKA
; PRZEDM.PAS:77
0055  b82600               mov ax, 0x26                      
0058  50                   push ax                           
0059  9a00000000           lcall 0, 0                         ; call System.Random
005e  051400               add ax, 0x14                      
0061  a30000               mov word ptr [0], ax               ; data PRZEDM.PAJAK
; PRZEDM.PAS:78
0064  b82600               mov ax, 0x26                      
0067  50                   push ax                           
0068  9a00000000           lcall 0, 0                         ; call System.Random
006d  051400               add ax, 0x14                      
0070  a30000               mov word ptr [0], ax               ; data PRZEDM.DZIK
; PRZEDM.PAS:79
0073  b82600               mov ax, 0x26                      
0076  50                   push ax                           
0077  9a00000000           lcall 0, 0                         ; call System.Random
007c  051400               add ax, 0x14                      
007f  a30000               mov word ptr [0], ax               ; data PRZEDM.LIS
; PRZEDM.PAS:80
0082  b82600               mov ax, 0x26                      
0085  50                   push ax                           
0086  9a00000000           lcall 0, 0                         ; call System.Random
008b  051400               add ax, 0x14                      
008e  a30000               mov word ptr [0], ax               ; data PRZEDM.SZCZUR
; PRZEDM.PAS:81
0091  b82600               mov ax, 0x26                      
0094  50                   push ax                           
0095  9a00000000           lcall 0, 0                         ; call System.Random
009a  051400               add ax, 0x14                      
009d  a30000               mov word ptr [0], ax               ; data PRZEDM.KUROPATWA
; PRZEDM.PAS:82
00a0  833e000020           cmp word ptr [0], 0x20             ; data PRZEDM.BAKTERIA
00a5  7f03                 jg 0xaa                           
00a7  e960ff               jmp 0xa                           
00aa  833e000020           cmp word ptr [0], 0x20             ; data PRZEDM.SLIMAK
00af  7f03                 jg 0xb4                           
00b1  e956ff               jmp 0xa                           
00b4  833e000020           cmp word ptr [0], 0x20             ; data PRZEDM.ZUK
00b9  7f03                 jg 0xbe                           
00bb  e94cff               jmp 0xa                           
00be  833e000020           cmp word ptr [0], 0x20             ; data PRZEDM.KARALUCH
00c3  7f03                 jg 0xc8                           
00c5  e942ff               jmp 0xa                           
00c8  833e000020           cmp word ptr [0], 0x20             ; data PRZEDM.MROWKA
00cd  7f03                 jg 0xd2                           
00cf  e938ff               jmp 0xa                           
00d2  833e000020           cmp word ptr [0], 0x20             ; data PRZEDM.PAJAK
00d7  7f03                 jg 0xdc                           
00d9  e92eff               jmp 0xa                           
00dc  833e000020           cmp word ptr [0], 0x20             ; data PRZEDM.DZIK
00e1  7f03                 jg 0xe6                           
00e3  e924ff               jmp 0xa                           
00e6  833e000020           cmp word ptr [0], 0x20             ; data PRZEDM.LIS
00eb  7f03                 jg 0xf0                           
00ed  e91aff               jmp 0xa                           
00f0  833e000020           cmp word ptr [0], 0x20             ; data PRZEDM.SZCZUR
00f5  7f03                 jg 0xfa                           
00f7  e910ff               jmp 0xa                           
00fa  833e000020           cmp word ptr [0], 0x20             ; data PRZEDM.KUROPATWA
00ff  7f03                 jg 0x104                          
0101  e906ff               jmp 0xa                           
; PRZEDM.PAS:85
0104  b82600               mov ax, 0x26                      
0107  50                   push ax                           
0108  9a00000000           lcall 0, 0                         ; call System.Random
010d  051400               add ax, 0x14                      
0110  a30000               mov word ptr [0], ax               ; data PRZEDM.SARNA
; PRZEDM.PAS:86
0113  b82600               mov ax, 0x26                      
0116  50                   push ax                           
0117  9a00000000           lcall 0, 0                         ; call System.Random
011c  051400               add ax, 0x14                      
011f  a30000               mov word ptr [0], ax               ; data PRZEDM.ORZEL
; PRZEDM.PAS:87
0122  b82600               mov ax, 0x26                      
0125  50                   push ax                           
0126  9a00000000           lcall 0, 0                         ; call System.Random
012b  051400               add ax, 0x14                      
012e  a30000               mov word ptr [0], ax               ; data PRZEDM.ZAJAC
; PRZEDM.PAS:88
0131  b82600               mov ax, 0x26                      
0134  50                   push ax                           
0135  9a00000000           lcall 0, 0                         ; call System.Random
013a  051400               add ax, 0x14                      
013d  a30000               mov word ptr [0], ax               ; data PRZEDM.WILCZUR
; PRZEDM.PAS:89
0140  b82600               mov ax, 0x26                      
0143  50                   push ax                           
0144  9a00000000           lcall 0, 0                         ; call System.Random
0149  051400               add ax, 0x14                      
014c  a30000               mov word ptr [0], ax               ; data PRZEDM.KORNIK
; PRZEDM.PAS:90
014f  b82600               mov ax, 0x26                      
0152  50                   push ax                           
0153  9a00000000           lcall 0, 0                         ; call System.Random
0158  051400               add ax, 0x14                      
015b  a30000               mov word ptr [0], ax               ; data PRZEDM.MUCHA
; PRZEDM.PAS:91
015e  833e000020           cmp word ptr [0], 0x20             ; data PRZEDM.SARNA
0163  7e9f                 jle 0x104                         
0165  833e000020           cmp word ptr [0], 0x20             ; data PRZEDM.ORZEL
016a  7e98                 jle 0x104                         
016c  833e000020           cmp word ptr [0], 0x20             ; data PRZEDM.ZAJAC
0171  7e91                 jle 0x104                         
0173  833e000020           cmp word ptr [0], 0x20             ; data PRZEDM.WILCZUR
0178  7e8a                 jle 0x104                         
017a  833e000020           cmp word ptr [0], 0x20             ; data PRZEDM.KORNIK
017f  7e83                 jle 0x104                         
0181  833e000020           cmp word ptr [0], 0x20             ; data PRZEDM.MUCHA
0186  7f03                 jg 0x18b                          
0188  e979ff               jmp 0x104                         
; PRZEDM.PAS:93
018b  b82600               mov ax, 0x26                      
018e  50                   push ax                           
018f  9a00000000           lcall 0, 0                         ; call System.Random
0194  051400               add ax, 0x14                      
0197  a30000               mov word ptr [0], ax               ; data PRZEDM.SLON
; PRZEDM.PAS:94
019a  b82600               mov ax, 0x26                      
019d  50                   push ax                           
019e  9a00000000           lcall 0, 0                         ; call System.Random
01a3  051400               add ax, 0x14                      
01a6  a30000               mov word ptr [0], ax               ; data PRZEDM.LEW
; PRZEDM.PAS:95
01a9  b82600               mov ax, 0x26                      
01ac  50                   push ax                           
01ad  9a00000000           lcall 0, 0                         ; call System.Random
01b2  051400               add ax, 0x14                      
01b5  a30000               mov word ptr [0], ax               ; data PRZEDM.ZYRAFA
; PRZEDM.PAS:96
01b8  b82600               mov ax, 0x26                      
01bb  50                   push ax                           
01bc  9a00000000           lcall 0, 0                         ; call System.Random
01c1  051400               add ax, 0x14                      
01c4  a30000               mov word ptr [0], ax               ; data PRZEDM.WIELBLAD
; PRZEDM.PAS:97
01c7  b82600               mov ax, 0x26                      
01ca  50                   push ax                           
01cb  9a00000000           lcall 0, 0                         ; call System.Random
01d0  051400               add ax, 0x14                      
01d3  a30000               mov word ptr [0], ax               ; data PRZEDM.STRUS
; PRZEDM.PAS:98
01d6  b82600               mov ax, 0x26                      
01d9  50                   push ax                           
01da  9a00000000           lcall 0, 0                         ; call System.Random
01df  051400               add ax, 0x14                      
01e2  a30000               mov word ptr [0], ax               ; data PRZEDM.BOA
; PRZEDM.PAS:99
01e5  b82600               mov ax, 0x26                      
01e8  50                   push ax                           
01e9  9a00000000           lcall 0, 0                         ; call System.Random
01ee  051400               add ax, 0x14                      
01f1  a30000               mov word ptr [0], ax               ; data PRZEDM.WILK
; PRZEDM.PAS:100
01f4  b82600               mov ax, 0x26                      
01f7  50                   push ax                           
01f8  9a00000000           lcall 0, 0                         ; call System.Random
01fd  051400               add ax, 0x14                      
0200  a30000               mov word ptr [0], ax               ; data PRZEDM.BIZON
; PRZEDM.PAS:101
0203  b82600               mov ax, 0x26                      
0206  50                   push ax                           
0207  9a00000000           lcall 0, 0                         ; call System.Random
020c  051400               add ax, 0x14                      
020f  a30000               mov word ptr [0], ax               ; data PRZEDM.PANTERA
; PRZEDM.PAS:102
0212  833e000020           cmp word ptr [0], 0x20             ; data PRZEDM.SLON
0217  7f03                 jg 0x21c                          
0219  e96fff               jmp 0x18b                         
021c  833e000020           cmp word ptr [0], 0x20             ; data PRZEDM.LEW
0221  7f03                 jg 0x226                          
0223  e965ff               jmp 0x18b                         
0226  833e000020           cmp word ptr [0], 0x20             ; data PRZEDM.ZYRAFA
022b  7f03                 jg 0x230                          
022d  e95bff               jmp 0x18b                         
0230  833e000020           cmp word ptr [0], 0x20             ; data PRZEDM.WIELBLAD
0235  7f03                 jg 0x23a                          
0237  e951ff               jmp 0x18b                         
023a  833e000020           cmp word ptr [0], 0x20             ; data PRZEDM.STRUS
023f  7f03                 jg 0x244                          
0241  e947ff               jmp 0x18b                         
0244  833e000020           cmp word ptr [0], 0x20             ; data PRZEDM.BOA
0249  7f03                 jg 0x24e                          
024b  e93dff               jmp 0x18b                         
024e  833e000020           cmp word ptr [0], 0x20             ; data PRZEDM.WILK
0253  7f03                 jg 0x258                          
0255  e933ff               jmp 0x18b                         
0258  833e000020           cmp word ptr [0], 0x20             ; data PRZEDM.BIZON
025d  7f03                 jg 0x262                          
025f  e929ff               jmp 0x18b                         
0262  833e000020           cmp word ptr [0], 0x20             ; data PRZEDM.PANTERA
0267  7f03                 jg 0x26c                          
0269  e91fff               jmp 0x18b                         
; PRZEDM.PAS:105
026c  b82600               mov ax, 0x26                      
026f  50                   push ax                           
0270  9a00000000           lcall 0, 0                         ; call System.Random
0275  051400               add ax, 0x14                      
0278  a30000               mov word ptr [0], ax               ; data PRZEDM.GLADIATOR
; PRZEDM.PAS:106
027b  b82600               mov ax, 0x26                      
027e  50                   push ax                           
027f  9a00000000           lcall 0, 0                         ; call System.Random
0284  051400               add ax, 0x14                      
0287  a30000               mov word ptr [0], ax               ; data PRZEDM.WOJOWNIK
; PRZEDM.PAS:107
028a  b82600               mov ax, 0x26                      
028d  50                   push ax                           
028e  9a00000000           lcall 0, 0                         ; call System.Random
0293  051400               add ax, 0x14                      
0296  a30000               mov word ptr [0], ax               ; data PRZEDM.TRENER
; PRZEDM.PAS:108
0299  833e000020           cmp word ptr [0], 0x20             ; data PRZEDM.GLADIATOR
029e  7ecc                 jle 0x26c                         
02a0  833e000020           cmp word ptr [0], 0x20             ; data PRZEDM.WOJOWNIK
02a5  7ec5                 jle 0x26c                         
02a7  833e000020           cmp word ptr [0], 0x20             ; data PRZEDM.TRENER
02ac  7ebe                 jle 0x26c                         
; PRZEDM.PAS:110
02ae  b80700               mov ax, 7                         
02b1  50                   push ax                           
02b2  9a00000000           lcall 0, 0                         ; call System.Random
02b7  051400               add ax, 0x14                      
02ba  a30000               mov word ptr [0], ax               ; data MONSTRA.JAMNIK
; PRZEDM.PAS:111
02bd  b80700               mov ax, 7                         
02c0  50                   push ax                           
02c1  9a00000000           lcall 0, 0                         ; call System.Random
02c6  051400               add ax, 0x14                      
02c9  a30000               mov word ptr [0], ax               ; data MONSTRA.OWCZAREK
; PRZEDM.PAS:112
02cc  b80700               mov ax, 7                         
02cf  50                   push ax                           
02d0  9a00000000           lcall 0, 0                         ; call System.Random
02d5  051400               add ax, 0x14                      
02d8  a30000               mov word ptr [0], ax               ; data MONSTRA.PIESEK
; PRZEDM.PAS:113
02db  b80700               mov ax, 7                         
02de  50                   push ax                           
02df  9a00000000           lcall 0, 0                         ; call System.Random
02e4  051400               add ax, 0x14                      
02e7  a30000               mov word ptr [0], ax               ; data MONSTRA.SPANIEL
; PRZEDM.PAS:114
02ea  b80700               mov ax, 7                         
02ed  50                   push ax                           
02ee  9a00000000           lcall 0, 0                         ; call System.Random
02f3  051400               add ax, 0x14                      
02f6  a30000               mov word ptr [0], ax               ; data MONSTRA.PUDEL
; PRZEDM.PAS:115
02f9  833e000013           cmp word ptr [0], 0x13             ; data MONSTRA.JAMNIK
02fe  7eae                 jle 0x2ae                         
0300  833e000013           cmp word ptr [0], 0x13             ; data MONSTRA.OWCZAREK
0305  7ea7                 jle 0x2ae                         
0307  833e000013           cmp word ptr [0], 0x13             ; data MONSTRA.PIESEK
030c  7ea0                 jle 0x2ae                         
030e  833e000013           cmp word ptr [0], 0x13             ; data MONSTRA.SPANIEL
0313  7e99                 jle 0x2ae                         
0315  833e000013           cmp word ptr [0], 0x13             ; data MONSTRA.PUDEL
031a  7e92                 jle 0x2ae                         
; PRZEDM.PAS:117
031c  b80700               mov ax, 7                         
031f  50                   push ax                           
0320  9a00000000           lcall 0, 0                         ; call System.Random
0325  051400               add ax, 0x14                      
0328  a30000               mov word ptr [0], ax               ; data MONSTRA.TAKSOWKARZ
; PRZEDM.PAS:118
032b  b80700               mov ax, 7                         
032e  50                   push ax                           
032f  9a00000000           lcall 0, 0                         ; call System.Random
0334  051400               add ax, 0x14                      
0337  a30000               mov word ptr [0], ax               ; data MONSTRA.SPRZEDAWCA
; PRZEDM.PAS:119
033a  b80700               mov ax, 7                         
033d  50                   push ax                           
033e  9a00000000           lcall 0, 0                         ; call System.Random
0343  051400               add ax, 0x14                      
0346  a30000               mov word ptr [0], ax               ; data MONSTRA.ZAMIATACZ
; PRZEDM.PAS:120
0349  b80700               mov ax, 7                         
034c  50                   push ax                           
034d  9a00000000           lcall 0, 0                         ; call System.Random
0352  051400               add ax, 0x14                      
0355  a30000               mov word ptr [0], ax               ; data MONSTRA.PIJAK
; PRZEDM.PAS:121
0358  b80700               mov ax, 7                         
035b  50                   push ax                           
035c  9a00000000           lcall 0, 0                         ; call System.Random
0361  051400               add ax, 0x14                      
0364  a30000               mov word ptr [0], ax               ; data MONSTRA.ZEBRAK
; PRZEDM.PAS:122
0367  833e000013           cmp word ptr [0], 0x13             ; data MONSTRA.TAKSOWKARZ
036c  7eae                 jle 0x31c                         
036e  833e000013           cmp word ptr [0], 0x13             ; data MONSTRA.SPRZEDAWCA
0373  7ea7                 jle 0x31c                         
0375  833e000013           cmp word ptr [0], 0x13             ; data MONSTRA.ZAMIATACZ
037a  7ea0                 jle 0x31c                         
037c  833e000013           cmp word ptr [0], 0x13             ; data MONSTRA.PIJAK
0381  7e99                 jle 0x31c                         
0383  833e000013           cmp word ptr [0], 0x13             ; data MONSTRA.ZEBRAK
0388  7e92                 jle 0x31c                         
; PRZEDM.PAS:124
038a  b80700               mov ax, 7                         
038d  50                   push ax                           
038e  9a00000000           lcall 0, 0                         ; call System.Random
0393  053c00               add ax, 0x3c                      
0396  a20000               mov byte ptr [0], al               ; data PRZEDM.DZIECKO
; PRZEDM.PAS:125
0399  b80800               mov ax, 8                         
039c  50                   push ax                           
039d  9a00000000           lcall 0, 0                         ; call System.Random
03a2  053c00               add ax, 0x3c                      
03a5  a20000               mov byte ptr [0], al               ; data PRZEDM.WARIAT
; PRZEDM.PAS:126
03a8  b80800               mov ax, 8                         
03ab  50                   push ax                           
03ac  9a00000000           lcall 0, 0                         ; call System.Random
03b1  053c00               add ax, 0x3c                      
03b4  a20000               mov byte ptr [0], al               ; data PRZEDM.SLUCHACZ
; PRZEDM.PAS:127
03b7  b80800               mov ax, 8                         
03ba  50                   push ax                           
03bb  9a00000000           lcall 0, 0                         ; call System.Random
03c0  053c00               add ax, 0x3c                      
03c3  a20000               mov byte ptr [0], al               ; data PRZEDM.FAN
; PRZEDM.PAS:128
03c6  b80800               mov ax, 8                         
03c9  50                   push ax                           
03ca  9a00000000           lcall 0, 0                         ; call System.Random
03cf  053c00               add ax, 0x3c                      
03d2  a20000               mov byte ptr [0], al               ; data PRZEDM.CZLOWIEK
; PRZEDM.PAS:129
03d5  803e00003c           cmp byte ptr [0], 0x3c             ; data PRZEDM.DZIECKO
03da  7eae                 jle 0x38a                         
03dc  803e00003c           cmp byte ptr [0], 0x3c             ; data PRZEDM.WARIAT
03e1  7ea7                 jle 0x38a                         
03e3  803e00003c           cmp byte ptr [0], 0x3c             ; data PRZEDM.SLUCHACZ
03e8  7ea0                 jle 0x38a                         
03ea  803e00003c           cmp byte ptr [0], 0x3c             ; data PRZEDM.FAN
03ef  7e99                 jle 0x38a                         
03f1  803e00003c           cmp byte ptr [0], 0x3c             ; data PRZEDM.CZLOWIEK
03f6  7e92                 jle 0x38a                         
; PRZEDM.PAS:131
03f8  b80900               mov ax, 9                         
03fb  50                   push ax                           
03fc  9a00000000           lcall 0, 0                         ; call System.Random
0401  053c00               add ax, 0x3c                      
0404  a20000               mov byte ptr [0], al               ; data PRZEDM.POLICJANT
; PRZEDM.PAS:132
0407  b80900               mov ax, 9                         
040a  50                   push ax                           
040b  9a00000000           lcall 0, 0                         ; call System.Random
0410  053c00               add ax, 0x3c                      
0413  a20000               mov byte ptr [0], al               ; data PRZEDM.OCHRONIARZ
; PRZEDM.PAS:133
0416  b80900               mov ax, 9                         
0419  50                   push ax                           
041a  9a00000000           lcall 0, 0                         ; call System.Random
041f  053c00               add ax, 0x3c                      
0422  a20000               mov byte ptr [0], al               ; data PRZEDM.GORYL
; PRZEDM.PAS:134
0425  b80800               mov ax, 8                         
0428  50                   push ax                           
0429  9a00000000           lcall 0, 0                         ; call System.Random
042e  053c00               add ax, 0x3c                      
0431  a20000               mov byte ptr [0], al               ; data PRZEDM.DZIADEK
; PRZEDM.PAS:135
0434  b80700               mov ax, 7                         
0437  50                   push ax                           
0438  9a00000000           lcall 0, 0                         ; call System.Random
043d  053c00               add ax, 0x3c                      
0440  a20000               mov byte ptr [0], al               ; data PRZEDM.REPORTER
; PRZEDM.PAS:136
0443  803e00003c           cmp byte ptr [0], 0x3c             ; data PRZEDM.POLICJANT
0448  7eae                 jle 0x3f8                         
044a  803e00003c           cmp byte ptr [0], 0x3c             ; data PRZEDM.OCHRONIARZ
044f  7ea7                 jle 0x3f8                         
0451  803e00003c           cmp byte ptr [0], 0x3c             ; data PRZEDM.GORYL
0456  7ea0                 jle 0x3f8                         
0458  803e00003c           cmp byte ptr [0], 0x3c             ; data PRZEDM.DZIADEK
045d  7e99                 jle 0x3f8                         
045f  803e00003c           cmp byte ptr [0], 0x3c             ; data PRZEDM.REPORTER
0464  7e92                 jle 0x3f8                         
; PRZEDM.PAS:137
0466  b80300               mov ax, 3                         
0469  50                   push ax                           
046a  9a00000000           lcall 0, 0                         ; call System.Random
046f  054600               add ax, 0x46                      
0472  a30000               mov word ptr [0], ax               ; data PRZEDM.GITARZYSTA
; PRZEDM.PAS:138
0475  b80300               mov ax, 3                         
0478  50                   push ax                           
0479  9a00000000           lcall 0, 0                         ; call System.Random
047e  054600               add ax, 0x46                      
0481  a30000               mov word ptr [0], ax               ; data PRZEDM.PERKUSISTA
; PRZEDM.PAS:139
0484  b80300               mov ax, 3                         
0487  50                   push ax                           
0488  9a00000000           lcall 0, 0                         ; call System.Random
048d  054600               add ax, 0x46                      
0490  a30000               mov word ptr [0], ax               ; data PRZEDM.ORGANISTA
; PRZEDM.PAS:140
0493  b80300               mov ax, 3                         
0496  50                   push ax                           
0497  9a00000000           lcall 0, 0                         ; call System.Random
049c  054600               add ax, 0x46                      
049f  a30000               mov word ptr [0], ax               ; data PRZEDM.LIROY
; PRZEDM.PAS:141
04a2  c70600004300         mov word ptr [0], 0x43             ; data MONSTRA.MINIBARMAN
; PRZEDM.PAS:142
04a8  c70600004300         mov word ptr [0], 0x43             ; data MONSTRA.GRUBAS
; PRZEDM.PAS:143
04ae  c70600004500         mov word ptr [0], 0x45             ; data MONSTRA.DJ
; PRZEDM.PAS:144
04b4  c70600004c00         mov word ptr [0], 0x4c             ; data MONSTRA.PEDAL
; PRZEDM.PAS:145
04ba  c70600004c00         mov word ptr [0], 0x4c             ; data MONSTRA.PARA
; PRZEDM.PAS:146
04c0  c70600004c00         mov word ptr [0], 0x4c             ; data MONSTRA.MACIEK
; PRZEDM.PAS:147
04c6  c70600000100         mov word ptr [0], 1                ; data MONSTRA.DRZWI
; PRZEDM.PAS:148
04cc  c70600000100         mov word ptr [0], 1                ; data MONSTRA.STARUCH
; PRZEDM.PAS:150
04d2  b80800               mov ax, 8                         
04d5  50                   push ax                           
04d6  9a00000000           lcall 0, 0                         ; call System.Random
04db  054d00               add ax, 0x4d                      
04de  a30000               mov word ptr [0], ax               ; data PRZEDM.SZCZAW
; PRZEDM.PAS:151
04e1  b80800               mov ax, 8                         
04e4  50                   push ax                           
04e5  9a00000000           lcall 0, 0                         ; call System.Random
04ea  054d00               add ax, 0x4d                      
04ed  a30000               mov word ptr [0], ax               ; data PRZEDM.KONICZYNKA
; PRZEDM.PAS:152
04f0  b80800               mov ax, 8                         
04f3  50                   push ax                           
04f4  9a00000000           lcall 0, 0                         ; call System.Random
04f9  054d00               add ax, 0x4d                      
04fc  a30000               mov word ptr [0], ax               ; data PRZEDM.STOKROTKA
; PRZEDM.PAS:153
04ff  b80800               mov ax, 8                         
0502  50                   push ax                           
0503  9a00000000           lcall 0, 0                         ; call System.Random
0508  054d00               add ax, 0x4d                      
050b  a30000               mov word ptr [0], ax               ; data PRZEDM.MLECZ
; PRZEDM.PAS:154
050e  b80800               mov ax, 8                         
0511  50                   push ax                           
0512  9a00000000           lcall 0, 0                         ; call System.Random
0517  054d00               add ax, 0x4d                      
051a  a30000               mov word ptr [0], ax               ; data PRZEDM.DMUCHAWIEC
; PRZEDM.PAS:155
051d  b80800               mov ax, 8                         
0520  50                   push ax                           
0521  9a00000000           lcall 0, 0                         ; call System.Random
0526  054d00               add ax, 0x4d                      
0529  a30000               mov word ptr [0], ax               ; data PRZEDM.ROZA
; PRZEDM.PAS:156
052c  b80800               mov ax, 8                         
052f  50                   push ax                           
0530  9a00000000           lcall 0, 0                         ; call System.Random
0535  054d00               add ax, 0x4d                      
0538  a30000               mov word ptr [0], ax               ; data PRZEDM.OSET
; PRZEDM.PAS:157
053b  b80800               mov ax, 8                         
053e  50                   push ax                           
053f  9a00000000           lcall 0, 0                         ; call System.Random
0544  054d00               add ax, 0x4d                      
0547  a30000               mov word ptr [0], ax               ; data PRZEDM.MALINA
; PRZEDM.PAS:158
054a  b80800               mov ax, 8                         
054d  50                   push ax                           
054e  9a00000000           lcall 0, 0                         ; call System.Random
0553  054d00               add ax, 0x4d                      
0556  a30000               mov word ptr [0], ax               ; data PRZEDM.AGREST
; PRZEDM.PAS:159
0559  b80800               mov ax, 8                         
055c  50                   push ax                           
055d  9a00000000           lcall 0, 0                         ; call System.Random
0562  054d00               add ax, 0x4d                      
0565  a30000               mov word ptr [0], ax               ; data PRZEDM.JEZYNA
; PRZEDM.PAS:160
0568  b80800               mov ax, 8                         
056b  50                   push ax                           
056c  9a00000000           lcall 0, 0                         ; call System.Random
0571  054d00               add ax, 0x4d                      
0574  a30000               mov word ptr [0], ax               ; data PRZEDM.TRAWA
; PRZEDM.PAS:161
0577  b80800               mov ax, 8                         
057a  50                   push ax                           
057b  9a00000000           lcall 0, 0                         ; call System.Random
0580  054d00               add ax, 0x4d                      
0583  a20000               mov byte ptr [0], al               ; data PRZEDM.DUNCAN
; PRZEDM.PAS:162
0586  833e000054           cmp word ptr [0], 0x54             ; data PRZEDM.SZCZAW
058b  7c03                 jl 0x590                          
058d  e942ff               jmp 0x4d2                         
0590  833e000054           cmp word ptr [0], 0x54             ; data PRZEDM.STOKROTKA
0595  7c03                 jl 0x59a                          
0597  e938ff               jmp 0x4d2                         
059a  833e000054           cmp word ptr [0], 0x54             ; data PRZEDM.KONICZYNKA
059f  7c03                 jl 0x5a4                          
05a1  e92eff               jmp 0x4d2                         
05a4  833e000054           cmp word ptr [0], 0x54             ; data PRZEDM.MLECZ
05a9  7c03                 jl 0x5ae                          
05ab  e924ff               jmp 0x4d2                         
05ae  833e000054           cmp word ptr [0], 0x54             ; data PRZEDM.DMUCHAWIEC
05b3  7c03                 jl 0x5b8                          
05b5  e91aff               jmp 0x4d2                         
05b8  833e000054           cmp word ptr [0], 0x54             ; data PRZEDM.ROZA
05bd  7c03                 jl 0x5c2                          
05bf  e910ff               jmp 0x4d2                         
05c2  833e000054           cmp word ptr [0], 0x54             ; data PRZEDM.OSET
05c7  7c03                 jl 0x5cc                          
05c9  e906ff               jmp 0x4d2                         
05cc  833e000054           cmp word ptr [0], 0x54             ; data PRZEDM.MALINA
05d1  7c03                 jl 0x5d6                          
05d3  e9fcfe               jmp 0x4d2                         
; PRZEDM.PAS:164
05d6  5d                   pop bp                            
05d7  cb                   retf                              
```

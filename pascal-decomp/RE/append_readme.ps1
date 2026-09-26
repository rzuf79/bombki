$r = "E:\Develop\Reverse\bombki\RECONSTRUCTION-LOG.md"
$add = @"
## 2026-09-24 (6): save() proc decoded - SAVE-FIELD-MAP.txt (80 fields = file 1:1)
PRZEDM.save() = EXE paragraph at img 0x2BA1 (write order = file order):

  #   slot  expr(saved->raw)      file         meaning
  1  0x1AC  [0x1AC]<<2 =1000      1000      MAXE*4? (raw 250)
  3  0x17E  raw                     -100      PRZEDM[1] stat
  5  0x188  raw                     -10       ZWIEJ
  6  0x184  raw                    -100       PASZOL
 10  0x180  raw                    10000      MIECHO (band start)
 12  0x18E  [0x18E]-0x18 = -15      -15      (raw 3)
 27  0x182  raw                        4      KUNSZT
 44  0x186  raw                     -10      WIMP
 65  0x1DA  raw                       57      gameflag/score
 66  0x1DC  raw                       52      gameflag/score
 67  0x1DE  raw                       33      gameflag/score
 70  0x1E0  raw                       54      gameflag/score

CONFIRMS the descending stat band DGROUP layout (MIECHO>KUNSZT>PASZOL>WIMP>ZWIEJ).
save() also emits a player-name Pascal string (ds:0x264) -> field '21JA' and a
cs-const path string '/Users/zrfu/gry/BOMBKI/PRZEDM.TPU' (field 15; dev box remnant,
author 'zrfu' built on Linux/macOS). File = 80 numeric lines + name.
Full table: RECONSTRUCTED\disasm\procs\SAVE-FIELD-MAP.txt
"@
Add-Content -Path $r -Value $add -Encoding Default
Write-Output ('README now ' + (Get-Item $r).Length + ' B')
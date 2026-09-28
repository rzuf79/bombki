# SWIAT source physical layout

Machine evidence for the source shape that reproduces `../og/SWIAT.TPU`
byte-for-byte with genuine Turbo Pascal 7. `reconstructed/SWIAT.PAS` is laid
out accordingly. This file records *what the TPU proves about the layout*; it
does not claim to recover the original author's spelling or whitespace.

Related: `disasm/SWIAT-POKOJ*.asm` (per-procedure annotated listings),
`disasm/SWIAT-region.asm` (whole-unit code region), log finding (63).

## Line-info record format

The per-procedure line records live between the unit's `ofs_line_lengths` word
and the end of the symbol section. Each record is:

| offset | size | meaning |
|---|---|---|
| `+0` | 2 | file offset of the procedure's symbol record |
| `+2` | 2 | always `0` |
| `+4` | 2 | **decl** line: the `procedure X;` line |
| `+6` | 2 | **entry** line: the first executable line of the body |
| `+8` | 2 | `n`, the number of following bytes |
| `+10` | `n` | `lens[]`, one byte per body line |

`lens[i]` is the number of code bytes the compiler attributed to the `i`-th
source line between `begin` and `end;` inclusive; the values sum to the
procedure's code-block size. A value of `0` means the line contributed no code
— a block-opening `if ... then begin`, a `repeat`, a closing `end;`, a blank
line, or a comment.

Consequences that drove the reconstruction:

- Merging two of our source lines into one yields the sum of their `lens`
  values, so byte attribution alone can prove or disprove a grouping.
- Any run of `0`-byte lines is interchangeable as long as its length matches.
  Where a run had to shrink, an `end;` was moved onto the line that opened the
  block (it contributes `0` bytes either way).
- A line must be 127 characters or fewer; TP7 reports `Error 11: Line too
  long` otherwise.

## Unit header

The header is exactly **16 lines**, so that `procedure POKOJ5;` lands on line
17 and `begin` on line 18 — required because the original's `decl` line is
always `begin` line − 1:

```pascal
unit SWIAT;
interface
uses  crt, monstra, przedm;
  procedure POKOJ0;   { .. 12 one-line interface declarations .. }
implementation
```

The `uses` clause sits in the interface section, ahead of the declarations.
Its order (`crt, monstra, przedm`) is what the retained unit records.

The interface declaration order is **alphabetical** (`POKOJ0`, `POKOJ1`,
`POKOJ4`, `POKOJ13`, `POKOJE`, `POKOJ5`, `POKOJ11`, `POKOJ30`, `POKOJ60`,
`POKOJ75`, `POKOJ100`, `POKOJ83`) and matches the block identifiers
`$08 $10 $18 $20 $28 $30 $38 $40 $48 $50 $58 $60` in that order. It is
independent of the implementation order below.

## Implementation order and line spans

`decl`/`begin`/`n` are read straight from the TPU line-info records; the spans
are contiguous, with a single blank line between `POKOJ5` and `POKOJ0` and no
separator elsewhere.

| # | procedure | block id | size | entry (img) | TPU code span | decl | `begin` | body lines |
|---|---|---|---|---|---|---|---|---|
| 1 | `POKOJ5` | `$00` | `0x435` | `0xF766` | `0x720..0xB54` | `17` | `18` | `30` |
| 2 | `POKOJ0` | `$08` | `0x143` | `0xFA5F` | `0xB55..0xC97` | `49` | `50` | `10` |
| 3 | `POKOJ1` | `$10` | `0x71D` | `0xFEDF` | `0xC98..0x13B4` | `60` | `61` | `38` |
| 4 | `POKOJ4` | `$18` | `0x3F7` | `0x10447` | `0x13B5..0x17AB` | `99` | `100` | `26` |
| 5 | `POKOJ13` | `$20` | `0x468` | `0x10803` | `0x17AC..0x1C13` | `126` | `127` | `42` |
| 6 | `POKOJE` | `$28` | `0x53C` | `0x10B8D` | `0x1C14..0x214F` | `169` | `170` | `58` |
| 7 | `POKOJ11` | `$30` | `0x547` | `0x11261` | `0x2150..0x2696` | `228` | `229` | `35` |
| 8 | `POKOJ30` | `$38` | `0x298` | `0x11638` | `0x2697..0x292E` | `264` | `265` | `21` |
| 9 | `POKOJ60` | `$40` | `0x2AF` | `0x118FE` | `0x292F..0x2BDD` | `286` | `287` | `20` |
| 10 | `POKOJ75` | `$48` | `0x311` | `0x11BDC` | `0x2BDE..0x2EEE` | `307` | `308` | `22` |
| 11 | `POKOJ83` | `$50` | `0x2CA` | `0x11ECA` | `0x2EEF..0x31B8` | `330` | `331` | `23` |
| 12 | `POKOJ100` | `$58` | `0x95E` | `0x12414` | `0x31B9..0x3B16` | `354` | `355` | `90` |

415 attributed body lines plus 30 header lines (16 unit header + 12 `procedure`
declarations + `implementation` + `begin` of the first procedure, minus the one
counted per procedure) give the unit's **445 lines**; line 445 is `end.`.

The TPU code section starts at file offset `0x720` and the retained section
base in the linked EXE is img `0xF5D0`, so block *n*'s code span in the EXE
starts at `0xF5D0` + the cumulative size of blocks `1..n-1`. Every block's code
is byte-identical to the corresponding EXE region apart from zeroed relocation
cells, which are patched at link time.

## Statement groupings the TPU forces

Each item below is a place where the retained `lens` values cannot be produced
by the one-statement-per-line spelling; the sum shown is the target `lens`
value for the merged line.

- **`POKOJ0`** — `if wpisz = 'EXIT' then` + `WriteLn(...)` = `17 + 28 = 45`.
- **`POKOJ13`**
  - `if MONSTRA.SILNY = 13 then` + `WriteLn(...)` = `7 + 28 = 35`
  - `if MONSTRA.SILNY = 0 then` + `WriteLn(...)` = `7 + 28 = 35`
  - each of the three `if FUKS < n then begin` blocks keeps its opening
    statement, the equipment assignment and the `WriteLn` on one line, with the
    matching `end;` on that same line: `7 + 6 + 28 = 41`
  - `end else` + `PASZOL := 0;` = `2 + 5 = 7`
- **`POKOJ100`**
  - `if PRZEPUSTKA = 0 then` + `WriteLn(...)` = `9 + 28 = 37`
  - `if PRZEPUSTKA < 0 then` + `WriteLn(...)` = `16 + 28 = 44`
  - the `if (QUEST = 3) …` condition continued onto `and (PRA > 0) then begin`
    is one source line, `40` bytes
  - `if (wpisz = 'ZACHOD') and (PRZEPUSTKA = 0) then` + `WriteLn(...)`
    = `26 + 28 = 54`

### Blank lines the TPU forces

Eight of the twelve bodies have one more attributed line than the statement
spelling needs. In each case the extra line carries `0` code bytes and sits at
the end of the body:

- `POKOJ4`, `POKOJ11`, `POKOJ30`, `POKOJ60`, `POKOJ75`, `POKOJ83`,
  `POKOJ13`, `POKOJ100`: one blank line between the `until`/`end` and the
  closing `end;` of the procedure.
- `POKOJ100` additionally has a run of three `0`-byte lines between
  `PRZEPUSTKA := PRZEPUSTKA - 10;` and `if wpisz = 'WYJSCIE' then Exit;`, where
  the statement spelling only needs two (the `end;` closing the quest-3 block
  and the `end;` closing the `SPRZEDAJ QUEST` block).

These are emitted as blank lines. Whether the original used a blank line, a
comment, or a differently nested `begin` there is **OPEN** — the TPU records
line counts and byte attribution only.

### The 127-character line

`POKOJ100`'s `if (wpisz = 'ZACHOD') and (PRZEPUSTKA = 0) then WriteLn(…)`
statement is 127 characters with the surrounding file's spacing, before any
indentation. The line table requires it on one source line, and TP7 caps source
lines at 127 characters, so that single statement carries no leading
indentation. Its neighbours are indented two spaces per level as usual.

## Source timestamp

The unit's source record stores the DOS mtime of `SWIAT.PAS` at TPU file
offset `0x04CF` as `0x26CC6711`, i.e. **1999-06-12 12:56:34** (date word
`0x26CC` = day 12, month 6, year 1999; time word `0x6711` = 12:56:34).
`conformance/tp7-conformance.sh` applies `touch -t 199906121256.34` to the
scratch copy after CRLF conversion. Git does not preserve source mtimes, so
this step is required for repeatable whole-file identity; the compiler output
itself is compared unmodified.

## Status

- **RESOLVED:** `reconstructed/SWIAT.PAS` at this layout compiles under genuine
  TP7 to all **26000 bytes** of `../og/SWIAT.TPU`, SHA-256
  `fa10ec7352e0a287793ec5a7919f1667984776086648bba421ffe19823d65961`.
- **OPEN:** the original's exact whitespace, comments, and the identity of the
  zero-byte lines described above. The TPU cannot distinguish them.

# Reconstructing matching TPU source-line records

This is the general method for reproducing Turbo Pascal 7 (TP7) source-line
records in reconstructed `.PAS` units. It is the canonical reference for the
record layout, comparison workflow, interpretation limits, and verification
steps. Unit-specific evidence and final layouts remain in documents such as
[`swiat-line-layout.md`](swiat-line-layout.md) and the dated findings in
[`reconstruction-log.md`](reconstruction-log.md).

The target is the exact source-line metadata emitted into a retained TPU, not a
guess at the original author's whitespace. Keep these related goals distinct:

- **Count-vector match:** for each procedure, the `n` count bytes match in
  length and value at every body-line index.
- **Line-record match:** the count vectors and record metadata match, including
  declaration line, code-entry offset, and first body-line number.
- **Code match:** generated procedure bytes and relocation records match.
- **Whole-TPU match:** all TPU sections and metadata, including source names,
  line records, timestamps, and padding, match.

`compare_tp7_artifacts.py` checks count vectors, not all line-record metadata.
Use the conformance comparator for code, relocation, and whole-TPU identity.

## TPU line-record format

The TPU header stores `ofs_line_lengths` at file offset `0x1C` and `sym_size` at
`0x1E`. Procedure line records start at `ofs_line_lengths` and continue to the
end of the symbol section at `sym_size`. Each record begins with six little-
endian words followed by a byte vector:

| Record offset | Size | Meaning |
|---|---:|---|
| `+0` | 2 | Offset of the procedure's symbol record |
| `+2` | 2 | Reserved word; zero in the retained TPUs checked here |
| `+4` | 2 | Absolute source line of the routine declaration |
| `+6` | 2 | Procedure code-entry offset from the TPU entry table; **not a source line** |
| `+8` | 2 | Absolute source line of the first body line, normally `begin` |
| `+10` | 2 | `n`, the number of body-line code-byte counts that follow |
| `+12` | `n` | One unsigned code-byte count for each physical procedure body line |

For zero-based vector index `i`, the source line is `body_line + i`. The `n`
counts cover the body through its closing `end;`, inclusive. Zero is meaningful:
it says no code bytes were attributed to that physical line. It does not identify
whether that line was a blank, comment, block delimiter, or another construct
that generated no code.

The `+6` word is easy to misread as a source-line number. It is a code offset:
the value matches the `offset` in the entry-table item referenced by the
procedure symbol. For example, the first PRZEDM line record is at TPU offset
`0x152E` and starts:

```
A0 0F  00 00  35 00  46 00  36 00  0E 00
```

It identifies symbol offset `0x0FA0` (`WALKAPIES`), reserved word `0`,
declaration line `53`, code-entry offset `70`, first body line `54`, and 14
following count bytes. In `PRZEDM.PAS`, line 53 is the procedure declaration
and line 54 is `begin`; the code-entry offset 70 is unrelated to either source
line.

When decoding records, validate more than plausible line numbers: resolve the
symbol offset to a procedure, require the reserved word to be zero, verify that
the entry offset matches that procedure's entry-table item, check that the
count vector fits before `sym_size`, and verify its length against the record's
`n`. The checked retained units contain 1 MONSTRA, 12 SWIAT, and 33 PRZEDM
procedure line records; all resolve to their procedures and entry-table
offsets. `analysis-tools/tpuq.py` exposes the TPU header, symbol, and entry data;
`analysis-tools/compare_tp7_artifacts.py` reads and compares the count vectors.

## Reconstruction workflow

1. **Pin the reference and compiler.** Use the retained TPU as the line-record
   target and genuine TP7 for candidate builds. Keep compiler version, options,
   dependencies, and source encoding/line endings controlled. Compile scratch
   copies; do not modify retained artifacts.
2. **Establish a baseline.** Compare one procedure first, then all procedures.
   Use every row, not only a total or the number of mismatches. The useful
   comparison key is procedure name plus zero-based body-line index; inspect
   both absolute source lines when candidate and reference starts differ.
3. **Localize the first divergence.** Record the procedure, index, reference
   and candidate counts, and both source lines. Look for a moved statement,
   split or merged line, a different block delimiter, or an inserted/deleted
   physical line. A one-row shift often continues downstream until another
   layout boundary compensates for it.
4. **Form a narrow hypothesis.** Preserve statement order and meaning. Change
   only nearby physical layout: split or merge statements at legal Pascal
   boundaries, move `begin`/`end` where semantics stay identical, or place a
   zero-code line where the vector requires one. Do not delete a clause or
   reorder conditions merely to make the counts fit.
5. **Rebuild and compare after each change.** Run genuine TP7 on the candidate
   and compare the entire relevant vector. When attribution is surprising,
   reduce the construct to a minimal compilable procedure, reproduce the
   alternatives there, and use the observed vectors rather than a presumed
   universal token-to-line rule.
6. **Verify the whole unit.** Once a procedure matches, compare all procedures
   again. Header, interface, implementation order, and blank lines affect
   absolute line numbers. Then independently compare code blocks and
   relocations; finish with whole-TPU conformance if full identity is required.

Typical commands from the repository root:

```sh
# Show all rows for one procedure in two already-built TPUs.
python3 pascal-decomp/analysis-tools/compare_tp7_artifacts.py \
  -p POROWNANIE -S candidate/PRZEDM.TPU og/PRZEDM.TPU

# Compile one source and compare its TPU; -s prints candidate lines on mismatches.
python3 pascal-decomp/analysis-tools/compare_tp7_artifacts.py \
  --compile -s pascal-decomp/reconstructed/PRZEDM.PAS og/PRZEDM.TPU

# Compile a source directory and compare matching artifacts.
python3 pascal-decomp/analysis-tools/compare_tp7_artifacts.py \
  --compile pascal-decomp/reconstructed/ og/
```

`-S` / `--show-all` lists matching and mismatching rows. Without it, only
mismatches are listed; `-m` adds zero-mismatch procedure summaries. `-p` limits
an existing-TPU comparison to one procedure. The comparator's compile mode
uses local DOSBox-X and TP7.

## Attribution: measure, do not assume

Counts are TP7's attribution, not estimates based on source token lengths. A
source construct can distribute bytes across line rows in ways that depend on
its exact surrounding syntax. Do not turn one observed case into a universal
rule such as "a call belongs to the next line." Confirm a proposed layout by
compiling it.

For example, a standalone TP7 probe unit with global `X: Integer` produces
these body vectors:

```pascal
begin
  if X > 0 then
    X := X + 1;
  WriteLn('X');
end;
```

The vector is `[10, 7, 7, 26, 2]` for `begin`, condition, assignment, output,
and `end;`. Putting the condition and assignment on one line gives
`[10, 14, 26, 2]`: the generated procedure code is still 52 bytes, but the
condition and assignment counts combine on that physical source row. A separate
probe with `if X > 0 then WriteLn('X');` attributes 33 bytes to that statement
line in that exact procedure. These are verified TP7 examples, not reusable
fixed byte counts for arbitrary expressions or contexts.

Useful constraints and limits:

- TP7 rejects source lines longer than 127 characters with Error 11. Keep
  reconstructed lines at or below 127 characters, including indentation.
- Preserve Pascal statement order, semicolons, and `else` binding. A line-break
  edit is valid only if it preserves the intended parse and generated behavior.
- Equal per-line vectors do not prove equal code. Conversely, equal code does
  not prove equal line vectors. Check both when source equivalence is required.
- The vector sum is not a replacement for resolving the procedure's actual
  code extent. Entry offsets can point inside TPU code blocks, so do not compare
  the sum blindly with an entire code-block size.
- Count vectors constrain physical line counts and byte attribution, but do not
  establish the original whitespace, comments, or syntax of zero-byte lines.
  Those details are not recoverable from these records alone.

## Verified worked cases

- [`swiat-line-layout.md`](swiat-line-layout.md) records the 12-procedure,
  445-line SWIAT layout and statement groupings forced by its retained TPU.
- `reconstruction-log.md` findings (64), (66), and (70) record verified PRZEDM
  and MINIARENA count-vector alignments. All 88 POROWNANIE rows and all 310
  MINIARENA rows match their retained records.
- Whole-file TPUs are byte-identical after the source timestamp is restored in
  the scratch TP7 build; that metadata step is separate from line-vector
  reconstruction.

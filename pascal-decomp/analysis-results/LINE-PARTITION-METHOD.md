# User's line-partition method (Hint 2) — working note

Kept verbatim in spirit; applies to recovering the original TP7 line layout of
`reconstructed/*.PAS` from the lens (per-line code-byte) streams in the
retained TPU units.

## The method

- The lens stream is a list where each value counts code bytes attributed to
  one source line. Different physical layouts produce *different* streams even
  though the **bytecode is identical**, so both `og/*.TPU` and a rebuilt unit
  give lens streams whose values **sum identically**.
- To fix a mismatch: **move values between adjacent indices**. When a trivial
  shuffle is impossible, **BREAK lines into atomic pieces**, then **GROUP
  (concatenate) them one-by-one** to hit the target values.
- **"LINE MATCHING IS MORE IMPORTANT THAN TOTAL LINE NUMBER COUNT."**
  If every line matches, the count follows automatically.
- Constraints:
  - Keep statement order — reordering changes the bytecode.
  - Keep every line ≤ ~126–127 chars (TP7 Error 11 "Line too long").

## Empirical attribution rules (verified by compile-and-compare)

- `if <cond> then` on its own line: the eval bytes attach to the `then` line.
- `WriteLn(...)` on a line: the call bytes land **one line later** (on the next
  source line's index).
- A single merged `if <cond> then WriteLn(...)` line attributes its **whole
  total to the NEXT line index** (v2124a).
- The POROWNANIE outer chain eval lands on lines 402/403 (idx17/18) regardless
  of where the tail clause text sits, **as long as the clause set is unbroken**
  (dropping a clause corrupts bytecode, e.g. the l2a experiment).

## Application to POROWNANIE `[21..24]`

Ref `[35,42,35,0]` = each `if cond then WriteLn(...)` eval+call paired on one
index (35 = 7+28, 42 = 14+28, 35 = 7+28, 0 = `end;`).

Validated final layout (candidate `l2full`, n=88, all units byte-identical,
lens-sum diff 0):

```
404:   (wpisz = 'ORZEL') or (wpisz = 'SARNA') or (wpisz = 'DZIECKO') or (wpisz = 'DZIADEK') then
405:   begin if MONSTRA.OGOL < 16 then WriteLn('NICZEGO ...');
406:   if (SIL > 15) and (SIL < 19) then WriteLn('PRZECIWNIK ...');
407:   if SIL > 18 then WriteLn('WSTYD ...');
408:   end;
```

Puts the chain tail clause on line 404 (no clause dropped), so idx17/18 stay
`[128,176]`, idx19..29 match ref exactly, and only the pre-existing separate
mismatches **idx30, 31, 33, 34, 37, 38, 41, 42, 44, 45, 47, 49, 54, 55…84**
remain. Full mismatch count for POROWNANIE dropped 42 → 40.

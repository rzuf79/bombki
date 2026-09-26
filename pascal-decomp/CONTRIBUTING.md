# Contributing to the BOMBKI reconstruction (pascal-decomp)

Source-level reconstruction of the original MONSTRA / SWIAT / PRZEDM Turbo
Pascal 7 units from `../og/` (EXE + TPU units). Covers this directory only;
the port (`../c-port/`) has its own rules.

## Ground truth

`../og/` and the machine evidence derived from it. The C port is not a
reference. `../og/` is read-only.

## Docs

- `INTEGRATED-FIELD-MAP.md` records original behaviour only; port comparisons
  live exclusively in `C-PORT-DISCREPANCIES.md` (entries 1..19 + "Confirmed
  1:1"). Register letters (A..H) and entry numbers (1..19) are separate
  numbering systems.
- `README.MD` dated highlights are history — keep them.

## Evidence

- Claims cite `img 0x…` or a C-PORT entry number; undecided facts stay as
  explicit OPEN items; RESOLVED means machine-verified.
- `BODY TODO` stubs are the scoped cut (see `README.MD` §3), not debt.

## Commits

One line, conventional prefix (`docs: feat: fix: refactor: ci:`), no bodies.
History rewrites on `main` are agreed first.

## Text

LF, UTF-8, Polish diacritics preserved.
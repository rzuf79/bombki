# Contributing to the BOMBKI reconstruction (pascal-decomp)

Source-level reconstruction of the original MONSTRA / SWIAT / PRZEDM Turbo
Pascal 7 units from `../og/` (EXE + TPU units). Covers this directory only;
the port (`../c-port/`) has its own rules.

## Ground truth

`../og/` and the machine evidence derived from it. The C port is not a
reference. `../og/` is read-only.

## Source fidelity and reconstructed names

- Keep reconstructed unit `.PAS` files as equivalent to their `.TPU` files
  as possible, including declarations, types, names, and unit ownership.
- Before adding a variable, check existing TPU symbols and EXE accesses for
  an existing declaration representing that storage. Do not duplicate it.
- Variables not accounted for by the TPU declarations belong in `BOMBKI.PAS`
  unless EXE decompilation conclusively establishes another owner. Record
  the ownership evidence; use from a unit alone does not establish ownership.
- Invented identifiers use ordinary Pascal capitalization with Polish names
  (e.g. `WybierzRase`, `PunktKontrolny`, `ZdobadzPoziom`), never ALLCAPS to
  imitate recovered names. Explicitly label invented names and distinguish them
  from symbols recovered from the TPUs.

## Docs

- `INTEGRATED-FIELD-MAP.md` records original behaviour only; port comparisons
  live exclusively in `C-PORT-DISCREPANCIES.md` (entries 1..19 + "Confirmed
  1:1"). Register letters (A..H) and entry numbers (1..19) are separate
  numbering systems.
- `RECONSTRUCTION-LOG.md` dated highlights are history — keep them.

## Evidence

- Claims cite `img 0x…` or a C-PORT entry number; undecided facts stay as
  explicit OPEN items; RESOLVED means machine-verified.
- `BODY TODO` stubs are the scoped cut (see `RECONSTRUCTION-LOG.md` §3), not debt.

## Commits

One line, conventional prefix (`docs: feat: fix: refactor: ci:`), no bodies.
History rewrites on `main` are agreed first.

## Text

LF, UTF-8, Polish diacritics preserved.
Files always end with a newline.
Enforced locally by `.githooks/pre-commit`
(`git config core.hooksPath .githooks`).

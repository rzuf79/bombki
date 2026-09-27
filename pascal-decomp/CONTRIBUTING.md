# Contributing to the BOMBKI reconstruction (pascal-decomp)

Source-level reconstruction of the original MONSTRA / SWIAT / PRZEDM Turbo
Pascal 7 units from `../og/` (EXE + TPU units). Covers this directory only;
the port (`../c-port/`) has its own rules and is outside this project's scope.

## Scope boundary

- Never inspect or modify anything under `../c-port/` (source, documentation,
  tests, configuration, generated files, or file locations). This prohibition applies
  even when a task mentions the port or its documentation. Keep all requested
  reconstruction work within `pascal-decomp/`; ask the user if a request cannot
  be completed without changing the port.
- Do not modify the repository-root `../README.md`; it is shared by the projects
  and outside this reconstruction's ownership.

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

- `INTEGRATED-FIELD-MAP.md` records original behaviour.
- `RECONSTRUCTION-LOG.md` dated highlights are history — keep them.
- `TODO.md` is the maintained active work queue; keep it current as work lands.
- `C-PORT-DISCREPANCIES.md` and references to the C port are historical
  comparisons only. They are not evidence, requirements, or a compatibility
  target for this reconstruction; use the EXE/TPU machine evidence instead.

## Evidence

- Original-behaviour claims cite `img 0x…`; undecided facts stay as explicit
  OPEN items; RESOLVED means machine-verified. C-port observations are never
  evidence for original behaviour.
- `BODY TODO` stubs are the scoped cut (see `RECONSTRUCTION-LOG.md` §3), not debt.

## Commits

One line, conventional prefix (`docs: feat: fix: refactor: ci:`), no bodies.
History rewrites on `main` are agreed first.

## Text

LF, UTF-8, Polish diacritics preserved.
Files always end with a newline.
Enforced locally by `.githooks/pre-commit`
(`git config core.hooksPath .githooks`).

# CI proposal: compiling the BOMBKI reconstruction

Status: **proposed** -- implemented on branches `ci/pas-build` (workflow +
sweep tooling) and `recon/przedm-compilable` (this doc, manifest flips:
`MONSTRA.PAS` / `PRZEDM.PAS` now compile). Awaiting review on GitHub; nothing
touches `main`.

## Why it can't just "compile" yet

The reconstructed `reconstructed/*.pas` are still theoretical:

| file | state |
| --- | --- |
| `MONSTRA.PAS` | interface intact; `WSTEP` has a compile-satisfying empty body (reconstruction stays BODY TODO, log §5(9)) -- **compiles** |
| `SWIAT.PAS` | unit skeleton; 13 interface procs with no implementation (`BODY TODO`) -- not yet compilable |
| `PRZEDM.PAS` | all 33 interface procs reconstructed (log §5(19)-(31)); blocked only by `uses monstra` -- **compiles** |
| `BOMBKI.PAS` | main skeleton, `uses crt, swiat, przedm, monstra, dos, System` -- needs all units (`SWIAT` pending) |
| `WALKA/WSTEP/WCZYTANIE-*`, `BAZAR-death.pas` | **fragments** (bodies with no `unit`/`program` wrapper) |
| `BOMBKI-body.pas` | EXE disassembly listing, not compilable source |

So a naive "compile everything" action would fail forever. The action instead
pins **current** behaviour and fails on *drift*: every landed body is rewarded
with green, and the pipeline is standing by for the day `BOMBKI.PAS` links.

## Toolchain options

| option | what it gives | cost / blocker |
| --- | --- | --- |
| **Free Pascal `-Mtp`** (used now) | true TP7 **language** conformance (syntax, unit graph, interfaces, `crt/dos/System`) on a stock runner (`apt install fpc`, 3.2.2) | 32/64-bit semantics (word sizes, `Real`) -- not byte-exact vs TP7 |
| **FPC i8086-msdos 16-bit** (next step) | real 16-bit MZ binary, TP7-faithful calling conventions and operational semantics | needs a cross snapshot build on the runner (nasm + make, ~minutes) or a cached artifact |
| **DOSBox + genuine TP7** (optional later) | the original `TPC.EXE` compiling the sources -- the literal truth | needs a licensed TP7 copy (not in repo; `og/` holds only the compiled units) |

## Conformance model

`analysis-tools/pas-conformance.sh` + `analysis-tools/pas-manifest.txt`:

- `PASS` targets must compile cleanly; a failure is a **regression** (red).
- `FAIL` targets must not compile yet (documented gap); if one suddenly
  compiles, the manifest is **stale** and must be flipped to `PASS` (red,
  with a hint).
- `scaffold` targets (fragments / listing) are existence-checked only.

Each run prints a manifest-vs-observed table -- also posted to the PR via
`$GITHUB_STEP_SUMMARY` -- plus the error tails of whatever still fails, so
reviewers can see the exact gap that remains.

## Acceptance / end state

```
MONSTRA PASS, PRZEDM PASS            <- current (2026-09-26)
SWIAT PASS                           <- next step (13 stub bodies)
  -> BOMBKI.PAS PASS (links)
  -> run-app job: DOSBox smoke-run of the 16-bit binary
  -> test job: DGROUP-harness unit tests (combat math, save/load round-trips)
```

## Future hooks (designed, not wired)

- **`run-app`** -- `apt install dosbox` + the i8086-msdos binary; real app
  execution as soon as one target links.
- **`test`** -- wrap the fragments as units with the DGROUP globals they
  already reference predeclared -> executable regression tests for the combat
  engine and the save/load transforms (golden values from the EXE, per
  `C-PORT-DISCREPANCIES.md` where applicable).

## Files

- `.github/workflows/pas-reconstruction.yml` -- runs on PR/push (path-scoped
  to `pascal-decomp/**`) and on `workflow_dispatch`.
- `pascal-decomp/analysis-tools/pas-conformance.sh` -- the sweep itself.
- `pascal-decomp/analysis-tools/pas-manifest.txt` -- the pinned expectations.
- this doc.

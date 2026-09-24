# Static evidence

Milestone 1 is backed by deterministic reports generated directly from the
seven untouched original files in the parent directory.

Generate or verify them from the project directory:

```sh
python3 tools/evidence.py
python3 tools/evidence.py --check
python3 tools/evidence.py --dump-tpu ../SWIAT.TPU
```

Python 3.10 or newer is required. The normal C build does not use the original
files; only the evidence tests and generator do.

## Recovered procedure listings

`evidence/recovered/` contains a second, optional recovery layer: one compact,
symbol-aware listing for each of the 47 named TPU procedures. It combines the
existing procedure boundaries, original Pascal line map, global names,
relocations, exact strings, and common runtime-call labels. These listings are
recovery aids, not reconstructed source code.

They are checked in so ordinary consultation needs no extra software. Use the
dependency-free lookup command for normal work:

```sh
python3 tools/recovery_lookup.py --list
python3 tools/recovery_lookup.py --mechanic COMPARISON
python3 tools/recovery_lookup.py --procedure POROWNANIE
python3 tools/recovery_lookup.py --procedure WALKA --source-lines 841-858
python3 tools/recovery_lookup.py --search "SCROLL POROWNYWANIE"
```

The compact mechanic dossiers in `evidence/recovered/pseudocode/` are the
first place to look. The longer annotated listings remain available to verify
an uncertain detail. Only regeneration or a new disassembly needs Capstone:

```sh
python3 -m pip install -r requirements-recovery.txt
python3 tools/recover_code.py
python3 tools/recover_code.py --check
```

For a new low-volume disassembly directly from the original artifacts:

```sh
python3 tools/recover_code.py --procedure POROWNANIE --stdout
python3 tools/recover_code.py --procedure WALKA --source-lines 841-858 --stdout
```

## Outputs

- `manifest.json`: size, SHA-256, and format description for every original
  artifact.
- `mz.json`: DOS MZ header and segment evidence.
- `tpuq.json`: TPUQ headers, sections, symbols, dependencies, source files,
  source maps, entry records, code blocks, relocations, and validation counts.
- `procedures.tsv`: all 47 named retained procedures and three initialization
  entries, associated with units, code blocks, code offsets, and source ranges.
- `strings.json`: canonical string-literal records with artifact, exact byte
  offset, raw CP852 hex, losslessly decoded UTF-8, and reference evidence.
- `strings.cp852.jsonl` and `strings.utf8.jsonl`: compact raw and decoded views
  keyed by the same artifact-and-offset identifier.
- `inventories.json` and `inventories.md`: reproducible candidate inventories
  for commands, rooms, items, enemies, skills, shops, NPCs, quests, and state
  fields.
- `summary.md`: compact counts and navigation for the generated set.

## Method and limits

TPU literals are identified exactly by BP7 code-data relocation records, then
read as length-prefixed Pascal strings. EXE literals are identified in each
retained code segment by the Turbo Pascal compiler sequence that loads a
literal offset and pushes its `CS` pointer. The generator cross-checks unit
payloads found by these independent methods.

`PRZEDM.TPU` contains seven literals which are not present in the linked
`BOMBKI.EXE`; the generated cross-check lists them rather than hiding the
difference. This is evidence of artifact-version skew, not permission to alter
either file or its wording.

The category inventories are static candidates. They are exhaustive for their
documented matching rules, but runtime reachability and exact semantics belong
to later milestones. Raw hexadecimal bytes are canonical whenever control
characters make a rendered text view ambiguous.

# Generated evidence summary

This directory was generated from the seven original files. Do not edit it by hand;
run `python3 tools/evidence.py` from the project directory.

- Original artifacts: 7
- Retained TPU source lines: 2073
- Retained TPU code bytes: 52616
- TPU entry records: 50 (47 named procedures plus initialization records)
- Relocation-identified TPU string literals: 668 unique physical strings
- EXE string literals identified by compiler code references: 1303 unique physical strings
- Total string-literal records: 1971
- MZ relocation records: 5295

`manifest.json` fixes the exact input set. `tpuq.json` contains decoded headers,
symbols, code blocks, source maps, and validations. `procedures.tsv` is its compact
procedure-to-code-and-source index. `strings.json`, `strings.cp852.jsonl`, and
`strings.utf8.jsonl` preserve locations, raw bytes, and losslessly decoded text.
`inventories.json` and `inventories.md` group the static candidates without making
claims about runtime reachability.

#!/usr/bin/env python3
"""Generate compact, symbol-aware listings from the retained TPU files.

This is a recovery aid, not a source-code reconstruction.  It combines the
TPUQ metadata parsed by evidence.py with a 16-bit x86 disassembler.  The
generated Markdown keeps procedure boundaries, Pascal source-line markers,
global variable names, exact string literals, and relocatable call targets in
one place.
"""

from __future__ import annotations

import argparse
import json
import re
import struct
import sys
from collections import defaultdict
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Iterable

import evidence

try:
    from capstone import CS_ARCH_X86, CS_MODE_16, Cs
except ImportError as exc:  # pragma: no cover - exercised by users without tooling
    raise SystemExit(
        "recover_code.py needs Capstone; install requirements-recovery.txt"
    ) from exc


TPU_NAMES = ("MONSTRA.TPU", "PRZEDM.TPU", "SWIAT.TPU")

# Only name runtime entries whose identity has been checked in the retained
# code.  Unknown entries remain explicit numeric references instead of being
# assigned an attractive but potentially false name.
KNOWN_RUNTIME_CALLS = {
    ("System", 0x0088): "CompareString",
    ("System", 0x01B0): "WriteString",
    ("System", 0x01B8): "WriteInteger",
    ("System", 0x01C8): "WriteChar",
    ("System", 0x01D0): "WriteLn",
    ("System", 0x01D8): "WriteEnd",
    ("System", 0x01F0): "ReadString",
    ("System", 0x01F8): "ReadInteger",
    ("System", 0x0208): "ReadLn",
    ("System", 0x02E8): "Random",
    ("Crt", 0x0068): "TextColor",
    ("Crt", 0x0090): "Delay",
}

KNOWN_RUNTIME_DATA = {
    ("System", 0x0000, 0x0000): "INPUT",
    ("System", 0x0000, 0x0100): "OUTPUT",
}

# Main-program regions do not retain Pascal procedure metadata.  Keep only
# boundaries that were verified from command-string references and control-flow
# exits.  Discontiguous spans let one mechanic collect its training, direct
# command, and item paths without dumping the intervening dispatcher.
EXE_REGIONS = {
    "COMPARISON": (
        (0x07D2A, 0x07DC7),
        (0x14372, 0x143D5),
        (0x145B9, 0x145EF),
    ),
    "PARRYING": (
        (0x07C8D, 0x07D2A),
    ),
    "POTRAWKI": (
        (0x07DC7, 0x07E55),
    ),
    "LEVELING": (
        (0x0DA0E, 0x0DE84),
    ),
}

LINKED_DATA_NAMES = {
    0x018C: "SIL",
    0x018E: "MAD",
    0x0190: "ZRE",
    0x0194: "PRA",
    0x0196: "MAXSIL",
    0x0198: "MAXMAD",
    0x019A: "MAXZRE",
    0x019C: "ENERGIA",
    0x019E: "FUKS",
    0x01AC: "MANA",
    0x01AE: "MAXMANA",
    0x01C6: "PAR",
    0x01C8: "KOP",
    0x01D4: "KUNSZT",
    0x0230: "SCROLLPOR",
    0x0258: "POTRAWKI",
    0x025C: "POZIOM",
    0x025D: "POR",
    0x0564: "wpisz",
    0x0664: "MAXE",
}

LINKED_CALL_NAMES = {
    (0x1C71, 0x0291): "System.IOCheck",
    (0x1C71, 0x05DD): "System.WriteLn",
    (0x1C71, 0x0701): "System.WriteString",
    (0x1C71, 0x0789): "System.WriteInteger",
    (0x1C71, 0x09D7): "System.CompareString",
    (0x1C71, 0x0BE4): "System.Random",
    (0x129D, 0x1F46): "PRZEDM.POROWNANIE",
}


@dataclass(frozen=True)
class Relocation:
    source_block: int
    fixup_offset: int
    unit_number: int
    relocation_type: int
    target_block: int
    target_offset: int


@dataclass
class Unit:
    path: Path
    raw: bytes
    report: dict[str, Any]
    name: str
    unit_names: dict[int, str]
    variables: dict[tuple[int, int], list[str]]
    procedures_by_entry: dict[int, str]
    blocks: dict[int, dict[str, Any]]
    relocations: list[Relocation]
    strings_by_reference: dict[tuple[int, int], str]
    line_maps_by_owner: dict[str, dict[int, int]]


def parse_relocations(raw: bytes, report: dict[str, Any]) -> list[Relocation]:
    cursor = report["section_file_offsets"]["relocations"]
    result: list[Relocation] = []

    for block in report["code_blocks"]:
        for _ in range(block["relocation_count"]):
            values = struct.unpack_from("<BBHHH", raw, cursor)
            result.append(Relocation(block["record_offset"], values[4], *values[:4]))
            cursor += 8
    expected = (report["section_file_offsets"]["relocations"]
                + report["header"]["reloc_size"])
    if cursor != expected:
        raise evidence.EvidenceError("relocation table length mismatch")
    return result


def load_unit(path: Path) -> Unit:
    raw = path.read_bytes()
    report = evidence.parse_tpuq(path)
    variables: dict[tuple[int, int], list[str]] = defaultdict(list)
    procedures_by_entry: dict[int, str] = {}
    strings_by_reference: dict[tuple[int, int], str] = {}
    line_maps_by_owner: dict[str, dict[int, int]] = defaultdict(dict)

    for obj in report["objects"]:
        variable = obj.get("variable")
        procedure = obj.get("procedure")
        if variable is not None:
            key = (variable["data_block_or_unit"], variable["data_offset"])
            variables[key].append(obj["name"])
        if procedure is not None:
            procedures_by_entry[procedure["entry_record_offset"]] = obj["name"]
    for item in report["strings"]:
        for reference in item["references"]:
            key = (reference["source_code_block"], reference["fixup_offset"])
            strings_by_reference[key] = item["text_utf8"]
    for line_map in report["source_line_maps"]:
        target = line_maps_by_owner[line_map["owner"]]
        for item in line_map["mapped_lines"]:
            target[item["code_offset"]] = item["line"]

    return Unit(
        path=path,
        raw=raw,
        report=report,
        name=path.stem.upper(),
        unit_names={item["record_offset"]: item["name"]
                    for item in report["units"]},
        variables=dict(variables),
        procedures_by_entry=procedures_by_entry,
        blocks={item["record_offset"]: item for item in report["code_blocks"]},
        relocations=parse_relocations(raw, report),
        strings_by_reference=strings_by_reference,
        line_maps_by_owner=dict(line_maps_by_owner),
    )


def load_units(source: Path) -> dict[str, Unit]:
    result = {}
    for filename in TPU_NAMES:
        unit = load_unit(source / filename)
        result[unit.name] = unit
    return result


def procedure_bounds(unit: Unit, procedure: dict[str, Any]) -> tuple[int, int]:
    block = unit.blocks[procedure["code_block"]]
    return procedure["offset_in_block"], block["size"]


def target_unit(unit: Unit, relocation: Relocation, units: dict[str, Unit]) -> Unit | None:
    name = unit.unit_names.get(relocation.unit_number, "")
    return units.get(name.upper())


def annotate_relocation(
    unit: Unit,
    relocation: Relocation,
    units: dict[str, Unit],
) -> tuple[str, str | None]:
    unit_name = unit.unit_names.get(
        relocation.unit_number,
        f"unit_0x{relocation.unit_number:02x}",
    )
    foreign = target_unit(unit, relocation, units)

    if relocation.relocation_type == 0x50:
        text = unit.strings_by_reference.get(
            (relocation.source_block, relocation.fixup_offset)
        )
        if text is not None:
            return f"string {json.dumps(text, ensure_ascii=False)}", text
        return (
            f"string {unit_name}:0x{relocation.target_block:04x}"
            f"+0x{relocation.target_offset:04x}",
            None,
        )

    if relocation.relocation_type == 0x90:
        runtime_name = KNOWN_RUNTIME_DATA.get(
            (unit_name, relocation.target_block, relocation.target_offset)
        )
        if runtime_name is not None:
            return f"data {unit_name}.{runtime_name}", None
        if foreign is not None:
            names = foreign.variables.get(
                (relocation.target_block, relocation.target_offset), []
            )
            if names:
                joined = "/".join(names)
                return f"data {foreign.name}.{joined}", None
        return (
            f"data {unit_name}:0x{relocation.target_block:04x}"
            f"+0x{relocation.target_offset:04x}",
            None,
        )

    if relocation.relocation_type in (0x00, 0x30):
        runtime_name = KNOWN_RUNTIME_CALLS.get((unit_name, relocation.target_block))
        if runtime_name is not None:
            return f"call {unit_name}.{runtime_name}", None
        if foreign is not None:
            name = foreign.procedures_by_entry.get(relocation.target_block)
            if name is not None:
                return f"call {foreign.name}.{name}", None
        return f"call {unit_name}.entry_0x{relocation.target_block:04x}", None

    return (
        f"reloc type=0x{relocation.relocation_type:02x} "
        f"{unit_name}:0x{relocation.target_block:04x}"
        f"+0x{relocation.target_offset:04x}",
        None,
    )


def normalize_instruction(mnemonic: str, raw: bytes) -> str:
    # Capstone 5 currently prints the 32-bit spelling for these two one-byte
    # instructions even in CS_MODE_16.  The opcodes are unambiguous here.
    if raw == b"\x98":
        return "cbw"
    if raw == b"\x99":
        return "cwd"
    return mnemonic


def source_ranges(procedure: dict[str, Any]) -> str:
    parts = []
    for item in procedure["source_ranges"]:
        parts.append(f"{item['source_file']}:{item['start_line']}-{item['end_line']}")
    return ", ".join(parts)


def render_procedure(
    unit: Unit,
    procedure: dict[str, Any],
    units: dict[str, Unit],
    line_filter: tuple[int, int] | None = None,
) -> str:
    start, end = procedure_bounds(unit, procedure)
    block = unit.blocks[procedure["code_block"]]
    code_base = unit.report["section_file_offsets"]["code"] + block["emitted_offset"]
    relocations = [
        item for item in unit.relocations
        if item.source_block == procedure["code_block"]
        and start <= item.fixup_offset < end
    ]
    relocations_by_offset: dict[int, list[Relocation]] = defaultdict(list)
    for item in relocations:
        relocations_by_offset[item.fixup_offset].append(item)

    line_by_offset = unit.line_maps_by_owner.get(procedure["name"], {})
    referenced_variables: set[str] = set()
    referenced_strings: list[str] = []
    referenced_calls: set[str] = set()
    disassembler = Cs(CS_ARCH_X86, CS_MODE_16)
    listing: list[str] = []
    current_line: int | None = None

    for instruction in disassembler.disasm(unit.raw[code_base + start:code_base + end], start):
        if instruction.address in line_by_offset:
            current_line = line_by_offset[instruction.address]
        if (line_filter is not None
            and (current_line is None
                 or current_line < line_filter[0]
                 or current_line > line_filter[1])):
            continue
        if instruction.address in line_by_offset:
            source_file = procedure["source_ranges"][0]["source_file"]
            listing.append(f"; {source_file}:{current_line}")
        annotations: list[str] = []
        for offset in range(instruction.address, instruction.address + instruction.size):
            for relocation in relocations_by_offset.get(offset, []):
                annotation, string = annotate_relocation(unit, relocation, units)
                annotations.append(annotation)
                if annotation.startswith("data "):
                    referenced_variables.add(annotation[5:])
                elif annotation.startswith("call "):
                    referenced_calls.add(annotation[5:])
                if string is not None and string not in referenced_strings:
                    referenced_strings.append(string)
        mnemonic = normalize_instruction(instruction.mnemonic, instruction.bytes)
        assembly = f"{mnemonic} {instruction.op_str}".rstrip()
        suffix = "" if not annotations else " ; " + "; ".join(annotations)
        listing.append(
            f"{instruction.address:04x}  {instruction.bytes.hex():<20}"
            f" {assembly:<34}{suffix}"
        )

    title = f"{unit.name}.{procedure['name']}"
    result = [
        f"# `{title}`",
        "",
        "Generated recovery aid; not reconstructed source code.",
        "",
        f"- Original source map: `{source_ranges(procedure)}`",
        f"- TPU code block: `0x{procedure['code_block']:04x}`",
        f"- Procedure bytes: `0x{start:04x}`–`0x{end:04x}`",
        "- Exact displayed strings below are evidence and must not be rewritten.",
        "",
        "## Referenced state",
        "",
    ]
    result.extend(
        [f"- `{name}`" for name in sorted(referenced_variables)]
        or ["- None resolved."]
    )
    result.extend(["", "## Calls", ""])
    result.extend(
        [f"- `{name}`" for name in sorted(referenced_calls)]
        or ["- None resolved."]
    )
    result.extend(["", "## Exact strings", ""])
    result.extend(
        [f"- `{json.dumps(text, ensure_ascii=False)}`" for text in referenced_strings]
        or ["- None."]
    )
    result.extend([
        "",
        "## Annotated listing",
        "",
        "```asm",
        *listing,
        "```",
        "",
    ])
    if line_filter is not None:
        result.insert(7, f"- Focused source lines: `{line_filter[0]}-{line_filter[1]}`")
    return "\n".join(result)


def named_procedures(unit: Unit) -> Iterable[dict[str, Any]]:
    return (
        item for item in unit.report["procedures"]
        if item["name"] != "<initialization>" and item["code_block"] != 0xFFFF
    )


def render_exe_region(
    source: Path,
    name: str,
    spans: tuple[tuple[int, int], ...],
) -> str:
    mz = evidence.parse_mz(source / "BOMBKI.EXE")
    strings_at_instruction: dict[int, str] = {}
    for item in evidence.all_pointer_strings(mz, "BOMBKI.EXE"):
        for reference in item["references"]:
            strings_at_instruction[reference["instruction_file_offset"]] = item["text_utf8"]

    disassembler = Cs(CS_ARCH_X86, CS_MODE_16)
    listing: list[str] = []
    referenced_state: set[str] = set()
    referenced_calls: set[str] = set()
    referenced_strings: list[str] = []

    for start, end in spans:
        listing.append(f"; BOMBKI.EXE file span 0x{start:05x}-0x{end:05x}")
        for instruction in disassembler.disasm(mz["data"][start:end], start):
            annotations: list[str] = []
            text = strings_at_instruction.get(instruction.address)
            if text is not None:
                annotations.append(f"string {json.dumps(text, ensure_ascii=False)}")
                if text not in referenced_strings:
                    referenced_strings.append(text)

            for match in re.finditer(r"\[0x([0-9a-f]+)\]", instruction.op_str):
                address = int(match.group(1), 16)
                state_name = LINKED_DATA_NAMES.get(address)
                if state_name is not None:
                    annotations.append(f"data PRZEDM.{state_name}")
                    referenced_state.add(f"PRZEDM.{state_name}")

            if instruction.mnemonic == "lcall":
                match = re.fullmatch(
                    r"0x([0-9a-f]+), 0x([0-9a-f]+)",
                    instruction.op_str,
                )
                if match is not None:
                    target = (int(match.group(1), 16), int(match.group(2), 16))
                    call_name = LINKED_CALL_NAMES.get(target)
                    if call_name is not None:
                        annotations.append(f"call {call_name}")
                        referenced_calls.add(call_name)

            mnemonic = normalize_instruction(instruction.mnemonic, instruction.bytes)
            assembly = f"{mnemonic} {instruction.op_str}".rstrip()
            suffix = "" if not annotations else " ; " + "; ".join(annotations)
            listing.append(
                f"{instruction.address:05x}  {instruction.bytes.hex():<20}"
                f" {assembly:<34}{suffix}"
            )
        listing.append("")

    result = [
        f"# `BOMBKI.{name}`",
        "",
        "Generated recovery aid for logic retained in the executable's main dispatcher.",
        "It is not reconstructed source code.",
        "",
        "- File spans: " + ", ".join(
            f"`0x{start:05x}`–`0x{end:05x}`" for start, end in spans
        ),
        "- Boundaries were verified from exact command-string references and jumps.",
        "- Exact displayed strings below are evidence and must not be rewritten.",
        "",
        "## Referenced state",
        "",
        *([f"- `{item}`" for item in sorted(referenced_state)] or ["- None resolved."]),
        "",
        "## Calls",
        "",
        *([f"- `{item}`" for item in sorted(referenced_calls)] or ["- None resolved."]),
        "",
        "## Exact strings",
        "",
        *([f"- `{json.dumps(item, ensure_ascii=False)}`" for item in referenced_strings]
          or ["- None."]),
        "",
        "## Annotated listing",
        "",
        "```asm",
        *listing,
        "```",
        "",
    ]
    return "\n".join(result)


def generate(
    units: dict[str, Unit],
    source: Path,
    unit_filter: str | None = None,
    procedure_filter: str | None = None,
    line_filter: tuple[int, int] | None = None,
) -> dict[str, str]:
    outputs: dict[str, str] = {}
    rows: list[tuple[str, str, str, str]] = []

    for unit_name in sorted(units):
        unit = units[unit_name]
        if unit_filter is not None and unit_name != unit_filter.upper().removesuffix(".TPU"):
            continue
        for procedure in sorted(named_procedures(unit), key=lambda item: item["name"].upper()):
            if (procedure_filter is not None
                and procedure["name"].upper() != procedure_filter.upper()):
                continue
            filename = f"{unit.name}.{procedure['name']}.md"
            outputs[filename] = render_procedure(
                unit,
                procedure,
                units,
                line_filter,
            )
            rows.append((unit.name, procedure["name"], source_ranges(procedure), filename))

    index = [
        "# Recovered procedure index",
        "",
        "These files are generated symbol-aware 16-bit listings, not reconstructed source.",
        "Consult a single procedure instead of reopening raw machine code. Exact strings are",
        "copied from the retained artifacts and must not be editorially rewritten.",
        "",
        "| Unit | Procedure | Original lines | Listing |",
        "|---|---|---|---|",
    ]
    for unit_name, procedure_name, lines, filename in rows:
        index.append(
            f"| `{unit_name}` | `{procedure_name}` | `{lines}` | [{filename}]({filename}) |"
        )
    if procedure_filter is None and unit_filter is None and line_filter is None:
        index.extend([
            "",
            "## Main executable regions",
            "",
            "| Mechanic | Listing | Compact pseudocode |",
            "|---|---|---|",
        ])
        for region_name, spans in sorted(EXE_REGIONS.items()):
            filename = f"BOMBKI.{region_name}.md"
            outputs[filename] = render_exe_region(source, region_name, spans)
            index.append(
                f"| `{region_name}` | [{filename}]({filename}) | "
                f"[pseudocode/{region_name}.md](pseudocode/{region_name}.md) |"
            )

    index.extend([
        "",
        "Consult checked-in recovery data without installing Capstone:",
        "",
        "```sh",
        "python3 tools/recovery_lookup.py --list",
        "python3 tools/recovery_lookup.py --mechanic COMPARISON",
        "python3 tools/recovery_lookup.py --procedure POROWNANIE --source-lines 385-402",
        "```",
        "",
        "Regenerate with:",
        "",
        "```sh",
        "python3 -m pip install -r requirements-recovery.txt",
        "python3 tools/recover_code.py",
        "```",
        "",
        "Disassemble one procedure directly from the original files:",
        "",
        "```sh",
        "python3 tools/recover_code.py --procedure POROWNANIE --stdout",
        "python3 tools/recover_code.py --procedure WALKA --source-lines 841-858 --stdout",
        "```",
        "",
    ])
    if procedure_filter is None and unit_filter is None:
        outputs["INDEX.md"] = "\n".join(index)
    return outputs


def check_outputs(output: Path, expected: dict[str, str]) -> list[str]:
    problems = []
    expected_names = set(expected)
    actual_names = {item.name for item in output.glob("*.md")}
    for name in sorted(expected_names):
        path = output / name
        if not path.exists():
            problems.append(f"missing {name}")
        elif path.read_text(encoding="utf-8") != expected[name]:
            problems.append(f"outdated {name}")
    for name in sorted(actual_names - expected_names):
        problems.append(f"unexpected {name}")
    return problems


def parse_args() -> argparse.Namespace:
    project = Path(__file__).resolve().parents[1]
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, default=project.parent)
    parser.add_argument("--output", type=Path, default=project / "evidence" / "recovered")
    parser.add_argument("--unit", help="limit output to one TPU unit")
    parser.add_argument("--procedure", help="limit output to one exact procedure name")
    parser.add_argument(
        "--source-lines",
        metavar="START-END",
        help="with --stdout, include only this original source-line range",
    )
    parser.add_argument("--stdout", action="store_true", help="print selected output")
    parser.add_argument("--check", action="store_true", help="verify generated files")
    return parser.parse_args()


def parse_source_lines(text: str | None) -> tuple[int, int] | None:
    if text is None:
        return None
    pieces = text.split("-", 1)
    try:
        start = int(pieces[0])
        end = int(pieces[-1])
    except ValueError as exc:
        raise SystemExit("--source-lines must be START-END or one line number") from exc
    if start <= 0 or end < start:
        raise SystemExit("--source-lines must be a positive ascending range")
    return start, end


def main() -> int:
    args = parse_args()
    line_filter = parse_source_lines(args.source_lines)
    if line_filter is not None and not args.stdout:
        raise SystemExit("--source-lines is a focused query and requires --stdout")
    units = load_units(args.source)
    outputs = generate(units, args.source, args.unit, args.procedure, line_filter)
    if not outputs:
        raise SystemExit("no matching procedure")
    if args.stdout:
        for name in sorted(outputs):
            print(outputs[name], end="")
        return 0
    if args.check:
        problems = check_outputs(args.output, outputs)
        for problem in problems:
            print(problem, file=sys.stderr)
        return 1 if problems else 0
    args.output.mkdir(parents=True, exist_ok=True)
    for name, text in outputs.items():
        (args.output / name).write_text(text, encoding="utf-8")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

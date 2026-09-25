#!/usr/bin/env python3
"""Generate reviewable static-evidence reports for the original BOMBKI files.

The parser is intentionally dependency-free.  It implements only the parts of
the Borland Pascal 7 TPUQ and DOS MZ formats needed by this project, and checks
every offset before using it.  Generated reports retain literal bytes as hex;
their UTF-8 counterparts are decoded with Python's one-to-one CP852 codec.
"""

from __future__ import annotations

import argparse
import datetime as dt
import hashlib
import json
import re
import struct
import sys
from collections import defaultdict
from pathlib import Path
from typing import Any, Iterable


ARTIFACTS = (
    "BOMBKI.EXE",
    "BOMBKI.PIF",
    "CZYTAJ.TXT",
    "MONSTRA.TPU",
    "PLIKI.TPU",
    "PRZEDM.TPU",
    "SWIAT.TPU",
)
TPU_NAMES = ("MONSTRA.TPU", "PRZEDM.TPU", "SWIAT.TPU")

HEADER_FIELDS = (
    "i4",
    "i6",
    "ofs_this_unit",
    "ofs_hashtable",
    "ofs_entry_pts",
    "ofs_code_blocks",
    "ofs_const_blocks",
    "ofs_var_blocks",
    "ofs_dll_list",
    "ofs_unit_list",
    "ofs_src_name",
    "ofs_line_count",
    "ofs_line_lengths",
    "sym_size",
    "browser_size",
    "code_size",
    "const_size",
    "reloc_size",
    "const_reloc_size",
    "var_size",
    "ofs_full_hash",
    "flags",
    "object_type_list",
    "br_defs_end",
    "br_symbol_refxx1",
)

OBJECT_KINDS = {
    0x4F: "constant",
    0x50: "type",
    0x51: "variable",
    0x52: "procedure",
    0x53: "system-procedure",
    0x54: "system-function",
    0x55: "system-new",
    0x56: "system-port",
    0x57: "system-memory",
    0x58: "unit",
}


class EvidenceError(RuntimeError):
    """Raised when an input does not satisfy a format invariant."""


def u16(data: bytes, offset: int) -> int:
    if offset < 0 or offset + 2 > len(data):
        raise EvidenceError(f"word outside file at 0x{offset:x}")
    return struct.unpack_from("<H", data, offset)[0]


def u32(data: bytes, offset: int) -> int:
    if offset < 0 or offset + 4 > len(data):
        raise EvidenceError(f"longword outside file at 0x{offset:x}")
    return struct.unpack_from("<I", data, offset)[0]


def align16(value: int) -> int:
    return (value + 15) & ~15


def hex_offset(value: int | None) -> str | None:
    return None if value is None else f"0x{value:05x}"


def short_string(data: bytes, offset: int, limit: int | None = None) -> bytes:
    if offset < 0 or offset >= len(data):
        raise EvidenceError(f"short string outside file at 0x{offset:x}")
    length = data[offset]
    end = offset + 1 + length
    maximum = len(data) if limit is None else min(limit, len(data))
    if end > maximum:
        raise EvidenceError(f"short string overruns section at 0x{offset:x}")
    return data[offset + 1 : end]


def decode_cp852(raw: bytes) -> str:
    # CP852 maps every byte, including C0 controls; raw hex remains canonical.
    return raw.decode("cp852")


def json_text(value: Any) -> str:
    return json.dumps(value, ensure_ascii=False, indent=2, sort_keys=True) + "\n"


def dos_datetime(packed: int) -> str | None:
    if packed == 0:
        return None
    date = packed >> 16
    time = packed & 0xFFFF
    year = 1980 + ((date >> 9) & 0x7F)
    month = (date >> 5) & 0x0F
    day = date & 0x1F
    hour = (time >> 11) & 0x1F
    minute = (time >> 5) & 0x3F
    second = (time & 0x1F) * 2
    try:
        return dt.datetime(year, month, day, hour, minute, second).isoformat()
    except ValueError:
        return f"invalid:0x{packed:08x}"


def parse_hash(data: bytes, table_offset: int, sym_size: int) -> list[int]:
    byte_length = u16(data, table_offset)
    table_end = table_offset + 2 + byte_length + 2
    if table_end > sym_size:
        raise EvidenceError(f"hash table at 0x{table_offset:x} overruns symbols")
    offsets: set[int] = set()
    for bucket_offset in range(table_offset + 2, table_end, 2):
        current = u16(data, bucket_offset)
        seen: set[int] = set()
        while current:
            if current in seen:
                raise EvidenceError(f"hash chain cycle at 0x{current:x}")
            if current + 4 > sym_size:
                raise EvidenceError(f"object outside symbol section at 0x{current:x}")
            seen.add(current)
            offsets.add(current)
            current = u16(data, current)
    return sorted(offsets)


def parse_object(data: bytes, offset: int, is_public: bool) -> dict[str, Any]:
    raw_kind = data[offset + 2]
    name_raw = short_string(data, offset + 3)
    kind = raw_kind & 0x7F
    info_offset = offset + 4 + len(name_raw)
    result: dict[str, Any] = {
        "offset": offset,
        "offset_hex": hex_offset(offset),
        "name": name_raw.decode("ascii", errors="replace"),
        "name_raw_hex": name_raw.hex(),
        "kind_id": kind,
        "kind": OBJECT_KINDS.get(kind, f"unknown-0x{kind:02x}"),
        "private": bool(raw_kind & 0x80),
        "in_public_hash": is_public,
        "info_offset": info_offset,
        "info_offset_hex": hex_offset(info_offset),
    }
    if kind == 0x52:
        if info_offset + 24 > len(data):
            raise EvidenceError(f"truncated procedure info at 0x{info_offset:x}")
        result["procedure"] = {
            "code_flags": data[info_offset],
            "object_flags": data[info_offset + 1],
            "entry_record_offset": u16(data, info_offset + 2),
            "parent_object_offset": u16(data, info_offset + 4),
            "local_hash_offset": u16(data, info_offset + 6),
            "vmt_entry": u16(data, info_offset + 8),
            "next_method": u16(data, info_offset + 16),
            "return_type_offset": u16(data, info_offset + 18),
            "return_type_unit": u16(data, info_offset + 20),
            "argument_count": u16(data, info_offset + 22),
        }
    elif kind == 0x51 and info_offset + 11 <= len(data):
        result["variable"] = {
            "flags": data[info_offset],
            "data_offset": u16(data, info_offset + 1),
            "data_block_or_unit": u16(data, info_offset + 3),
            "next_field": u16(data, info_offset + 5),
            "type_offset": u16(data, info_offset + 7),
            "type_unit": u16(data, info_offset + 9),
        }
    return result


def parse_tpuq(path: Path) -> dict[str, Any]:
    data = path.read_bytes()
    if data[:4] != b"TPUQ":
        raise EvidenceError(f"{path.name}: expected TPUQ signature")
    values = struct.unpack_from("<25H", data, 4)
    header = dict(zip(HEADER_FIELDS, values))
    sym_size = header["sym_size"]
    section_offsets = {
        "symbols": 0,
        "browser": align16(sym_size),
        "code": align16(sym_size) + align16(header["browser_size"]),
    }
    section_offsets["constants"] = section_offsets["code"] + align16(header["code_size"])
    section_offsets["relocations"] = section_offsets["constants"] + align16(header["const_size"])
    section_offsets["constant_relocations"] = section_offsets["relocations"] + align16(header["reloc_size"])
    expected_minimum = section_offsets["constant_relocations"] + header["const_reloc_size"]
    if expected_minimum > len(data):
        raise EvidenceError(f"{path.name}: declared sections overrun the file")

    public_offsets = set(parse_hash(data, header["ofs_hashtable"], sym_size))
    object_offsets = parse_hash(data, header["ofs_full_hash"], sym_size)
    objects = [parse_object(data, offset, offset in public_offsets) for offset in object_offsets]
    objects_by_offset = {obj["offset"]: obj for obj in objects}

    entries: list[dict[str, Any]] = []
    for relative in range(0, header["ofs_code_blocks"] - header["ofs_entry_pts"], 8):
        absolute = header["ofs_entry_pts"] + relative
        w1, flags, b1, code_block, offset = struct.unpack_from("<HBBHH", data, absolute)
        entries.append(
            {
                "record_offset": relative,
                "record_offset_hex": hex_offset(relative),
                "w1": w1,
                "flags": flags,
                "b1": b1,
                "code_block": code_block,
                "code_block_hex": hex_offset(code_block),
                "offset_in_block": offset,
                "offset_in_block_hex": hex_offset(offset),
            }
        )

    blocks: list[dict[str, Any]] = []
    emitted_offset = 0
    for relative in range(0, header["ofs_const_blocks"] - header["ofs_code_blocks"], 8):
        absolute = header["ofs_code_blocks"] + relative
        w1, size, relocation_bytes, owner = struct.unpack_from("<HHHH", data, absolute)
        blocks.append(
            {
                "record_offset": relative,
                "record_offset_hex": hex_offset(relative),
                "w1": w1,
                "size": size,
                "relocation_bytes": relocation_bytes,
                "relocation_count": relocation_bytes // 8,
                "owner_object_offset": owner,
                "emitted_offset": emitted_offset,
                "emitted_offset_hex": hex_offset(emitted_offset),
            }
        )
        emitted_offset += size
    if emitted_offset != header["code_size"]:
        raise EvidenceError(
            f"{path.name}: code blocks total {emitted_offset}, header says {header['code_size']}"
        )
    blocks_by_record = {block["record_offset"]: block for block in blocks}

    unit_records: list[dict[str, Any]] = []
    cursor = header["ofs_unit_list"]
    while cursor < header["ofs_src_name"]:
        if cursor + 5 > header["ofs_src_name"]:
            raise EvidenceError(f"{path.name}: truncated unit record")
        name_raw = short_string(data, cursor + 4, header["ofs_src_name"])
        unit_records.append(
            {
                "record_offset": cursor - header["ofs_unit_list"],
                "w1": u16(data, cursor),
                "browser_reference_bytes": u16(data, cursor + 2),
                "name": name_raw.decode("ascii", errors="replace"),
            }
        )
        cursor += 5 + len(name_raw)
    if cursor != header["ofs_src_name"]:
        raise EvidenceError(f"{path.name}: unit records do not meet source records")

    source_files: list[dict[str, Any]] = []
    source_by_relative: dict[int, dict[str, Any]] = {}
    cursor = header["ofs_src_name"]
    while cursor < header["ofs_line_count"]:
        if cursor + 8 > header["ofs_line_count"]:
            raise EvidenceError(f"{path.name}: truncated source-file record")
        name_raw = short_string(data, cursor + 7, header["ofs_line_count"])
        record = {
            "record_offset": cursor - header["ofs_src_name"],
            "file_type": data[cursor],
            "w1": u16(data, cursor + 1),
            "dos_timestamp_raw": u32(data, cursor + 3),
            "timestamp": dos_datetime(u32(data, cursor + 3)),
            "name": name_raw.decode("ascii", errors="replace"),
        }
        source_files.append(record)
        source_by_relative[record["record_offset"]] = record
        cursor += 8 + len(name_raw)
    if cursor != header["ofs_line_count"]:
        raise EvidenceError(f"{path.name}: source records do not meet line count")

    count_w0, count_w1, source_line_count = struct.unpack_from(
        "<HHH", data, header["ofs_line_count"]
    )
    line_maps: list[dict[str, Any]] = []
    cursor = header["ofs_line_lengths"]
    while cursor < sym_size:
        if cursor + 12 > sym_size:
            raise EvidenceError(f"{path.name}: truncated source-line record")
        owner, source_rel, header_line, entry, start_line, num_lines = struct.unpack_from(
            "<HHHHHH", data, cursor
        )
        lengths_start = cursor + 12
        length_cursor = lengths_start
        code_offset = entry
        mapped_lines: list[dict[str, int]] = []
        for line_index in range(num_lines):
            if length_cursor >= sym_size:
                raise EvidenceError(f"{path.name}: truncated source-line lengths")
            encoded = data[length_cursor]
            length_cursor += 1
            if encoded:
                mapped_lines.append(
                    {"line": start_line + line_index, "code_offset": code_offset}
                )
                if encoded >= 0x80:
                    if length_cursor >= sym_size:
                        raise EvidenceError(f"{path.name}: truncated long line length")
                    code_offset += 0x100 * (encoded - 0x80) + data[length_cursor]
                    length_cursor += 1
                else:
                    code_offset += encoded
        source_record = source_by_relative.get(source_rel)
        if source_record is None:
            raise EvidenceError(f"{path.name}: unknown source record 0x{source_rel:x}")
        owner_obj = objects_by_offset.get(owner)
        line_maps.append(
            {
                "record_file_offset": cursor,
                "owner_object_offset": owner,
                "owner": "<initialization>" if owner == 0 else (
                    owner_obj["name"] if owner_obj else f"<object-0x{owner:x}>"
                ),
                "source_record_offset": source_rel,
                "source_file": source_record["name"],
                "header_line": header_line,
                "entry_code_offset": entry,
                "start_line": start_line,
                "end_line": start_line + num_lines - 1 if num_lines else start_line,
                "line_count": num_lines,
                "mapped_lines": mapped_lines,
            }
        )
        cursor = length_cursor
    if cursor != sym_size:
        raise EvidenceError(f"{path.name}: line maps do not end at symbol boundary")

    line_maps_by_owner: dict[int, list[dict[str, Any]]] = defaultdict(list)
    for line_map in line_maps:
        line_maps_by_owner[line_map["owner_object_offset"]].append(line_map)
    procedure_by_entry: dict[int, dict[str, Any]] = {}
    for obj in objects:
        if obj["kind"] == "procedure":
            procedure_by_entry[obj["procedure"]["entry_record_offset"]] = obj

    procedures: list[dict[str, Any]] = []
    entries_by_block: dict[int, list[str]] = defaultdict(list)
    for entry in entries:
        obj = procedure_by_entry.get(entry["record_offset"])
        name = "<initialization>" if entry["record_offset"] == 0 else (
            obj["name"] if obj else f"<entry-0x{entry['record_offset']:x}>"
        )
        block = blocks_by_record.get(entry["code_block"])
        if block is None and entry["code_block"] != 0xFFFF and not (entry["flags"] & 0x02):
            raise EvidenceError(f"{path.name}: entry refers to missing code block")
        segment_offset = None if block is None else block["emitted_offset"] + entry["offset_in_block"]
        maps = line_maps_by_owner.get(0 if obj is None else obj["offset"], [])
        procedures.append(
            {
                "name": name,
                "object_offset": None if obj is None else obj["offset"],
                "entry_record_offset": entry["record_offset"],
                "code_block": entry["code_block"],
                "offset_in_block": entry["offset_in_block"],
                "segment_offset": segment_offset,
                "segment_offset_hex": hex_offset(segment_offset),
                "file_offset": None if segment_offset is None else section_offsets["code"] + segment_offset,
                "file_offset_hex": hex_offset(
                    None if segment_offset is None else section_offsets["code"] + segment_offset
                ),
                "code_block_size": None if block is None else block["size"],
                "source_ranges": [
                    {
                        "source_file": item["source_file"],
                        "header_line": item["header_line"],
                        "start_line": item["start_line"],
                        "end_line": item["end_line"],
                        "line_count": item["line_count"],
                    }
                    for item in maps
                ],
            }
        )
        entries_by_block[entry["code_block"]].append(name)

    reloc_cursor = section_offsets["relocations"]
    strings_by_offset: dict[int, dict[str, Any]] = {}
    relocation_count = 0
    for source_block in blocks:
        count = source_block["relocation_count"]
        for _ in range(count):
            if reloc_cursor + 8 > section_offsets["relocations"] + header["reloc_size"]:
                raise EvidenceError(f"{path.name}: relocation record overrun")
            unit_number, relocation_type, target_block_id, target_offset, fixup_offset = (
                struct.unpack_from("<BBHHH", data, reloc_cursor)
            )
            relocation_count += 1
            if relocation_type != 0xFF and (relocation_type >> 6) == 1:
                target_block = blocks_by_record.get(target_block_id)
                if target_block is None:
                    raise EvidenceError(f"{path.name}: string target has missing block")
                segment_offset = target_block["emitted_offset"] + target_offset
                file_offset = section_offsets["code"] + segment_offset
                raw = short_string(
                    data, file_offset, section_offsets["code"] + header["code_size"]
                )
                reference = {
                    "source_code_block": source_block["record_offset"],
                    "source_procedures": entries_by_block.get(source_block["record_offset"], []),
                    "fixup_offset": fixup_offset,
                    "relocation_file_offset": reloc_cursor,
                    "unit_number": unit_number,
                    "relocation_type": relocation_type,
                }
                existing = strings_by_offset.get(segment_offset)
                if existing is None:
                    strings_by_offset[segment_offset] = {
                        "artifact": path.name,
                        "method": "TPUQ code-data relocation",
                        "segment_offset": segment_offset,
                        "segment_offset_hex": hex_offset(segment_offset),
                        "file_offset": file_offset,
                        "file_offset_hex": hex_offset(file_offset),
                        "length": len(raw),
                        "raw_cp852_hex": raw.hex(),
                        "text_utf8": decode_cp852(raw),
                        "references": [reference],
                    }
                else:
                    existing["references"].append(reference)
            reloc_cursor += 8
    expected_reloc_end = section_offsets["relocations"] + header["reloc_size"]
    if reloc_cursor != expected_reloc_end:
        raise EvidenceError(
            f"{path.name}: consumed {reloc_cursor - section_offsets['relocations']} "
            f"of {header['reloc_size']} relocation bytes"
        )

    missing_source = [
        proc["name"]
        for proc in procedures
        if proc["name"] != "<initialization>" and not proc["source_ranges"]
    ]
    return {
        "artifact": path.name,
        "format": "Borland Pascal 7 TPUQ",
        "file_size": len(data),
        "header": header,
        "section_file_offsets": section_offsets,
        "objects": objects,
        "units": unit_records,
        "source_files": source_files,
        "source_line_count_record": {
            "w0": count_w0,
            "w1": count_w1,
            "count": source_line_count,
        },
        "source_line_maps": line_maps,
        "entries": entries,
        "code_blocks": blocks,
        "procedures": procedures,
        "strings": list(strings_by_offset.values()),
        "validation": {
            "object_count": len(objects),
            "entry_count": len(entries),
            "code_block_count": len(blocks),
            "code_bytes_from_blocks": emitted_offset,
            "relocation_count": relocation_count,
            "unique_code_string_count": len(strings_by_offset),
            "procedures_without_source_ranges": missing_source,
        },
    }


def parse_mz(path: Path) -> dict[str, Any]:
    data = path.read_bytes()
    if data[:2] != b"MZ":
        raise EvidenceError(f"{path.name}: expected MZ signature")
    header_paragraphs = u16(data, 8)
    relocation_count = u16(data, 6)
    relocation_table = u16(data, 0x18)
    header_bytes = header_paragraphs * 16
    source_segments: set[int] = set()
    target_segments: set[int] = set()
    for index in range(relocation_count):
        record = relocation_table + index * 4
        offset, segment = struct.unpack_from("<HH", data, record)
        physical = header_bytes + segment * 16 + offset
        if physical + 2 > len(data):
            raise EvidenceError(f"{path.name}: relocation outside load image")
        source_segments.add(segment)
        target_segments.add(u16(data, physical))
    logical_segments = sorted(source_segments | {0})
    return {
        "data": data,
        "header_bytes": header_bytes,
        "relocation_count": relocation_count,
        "relocation_table_offset": relocation_table,
        "source_segments": sorted(source_segments),
        "target_segments": sorted(target_segments),
        "logical_segments": logical_segments,
    }


def identify_linked_unit_segments(mz: dict[str, Any], tpus: list[dict[str, Any]]) -> dict[str, int]:
    data = mz["data"]
    candidates = mz["logical_segments"]
    matches: dict[str, int] = {}
    for tpu in tpus:
        sample_strings = tpu["strings"]
        scores: list[tuple[int, int]] = []
        for segment in candidates:
            base = mz["header_bytes"] + segment * 16
            score = 0
            for item in sample_strings:
                raw = bytes.fromhex(item["raw_cp852_hex"])
                at = base + item["segment_offset"]
                if at < len(data) and data[at : at + 1 + len(raw)] == bytes([len(raw)]) + raw:
                    score += 1
            scores.append((score, segment))
        score, segment = max(scores)
        if score == 0:
            raise EvidenceError(f"could not locate linked segment for {tpu['artifact']}")
        matches[tpu["artifact"]] = segment
    if len(set(matches.values())) != len(matches):
        raise EvidenceError("two TPU units matched the same EXE segment")
    return matches


def pointer_strings_in_segment(
    data: bytes, header_bytes: int, segment: int, end_segment: int, artifact: str
) -> list[dict[str, Any]]:
    base = header_bytes + segment * 16
    end = min(header_bytes + end_segment * 16, len(data))
    segment_data = data[base:end]
    found: dict[int, dict[str, Any]] = {}
    # Turbo Pascal emits MOV reg,offset / PUSH CS / PUSH same-reg for CS strings.
    for fixup in range(0, max(0, len(segment_data) - 4)):
        opcode = segment_data[fixup]
        if not 0xB8 <= opcode <= 0xBF:
            continue
        register = opcode - 0xB8
        if segment_data[fixup + 3] != 0x0E or segment_data[fixup + 4] != 0x50 + register:
            continue
        target = u16(segment_data, fixup + 1)
        if target >= len(segment_data):
            continue
        try:
            raw = short_string(segment_data, target, len(segment_data))
        except EvidenceError:
            continue
        reference = {
            "instruction_segment_offset": fixup,
            "instruction_file_offset": base + fixup,
            "register": register,
        }
        if target not in found:
            found[target] = {
                "artifact": artifact,
                "method": "MZ code reference: MOV reg,offset; PUSH CS; PUSH reg",
                "segment": segment,
                "segment_offset": target,
                "segment_offset_hex": hex_offset(target),
                "file_offset": base + target,
                "file_offset_hex": hex_offset(base + target),
                "length": len(raw),
                "raw_cp852_hex": raw.hex(),
                "text_utf8": decode_cp852(raw),
                "references": [reference],
            }
        else:
            found[target]["references"].append(reference)
    return list(found.values())


def all_pointer_strings(mz: dict[str, Any], artifact: str) -> list[dict[str, Any]]:
    """Collect compiler-referenced strings from every retained MZ code segment."""
    data = mz["data"]
    segments = mz["logical_segments"]
    load_paragraphs = (len(data) - mz["header_bytes"] + 15) // 16
    by_file_offset: dict[int, dict[str, Any]] = {}
    for index, segment in enumerate(segments):
        end_segment = segments[index + 1] if index + 1 < len(segments) else load_paragraphs
        for item in pointer_strings_in_segment(
            data, mz["header_bytes"], segment, end_segment, artifact
        ):
            existing = by_file_offset.get(item["file_offset"])
            if existing is None:
                by_file_offset[item["file_offset"]] = item
            elif existing["raw_cp852_hex"] == item["raw_cp852_hex"]:
                existing["references"].extend(item["references"])
            else:
                raise EvidenceError("two incompatible strings share an EXE file offset")
    return list(by_file_offset.values())


def make_manifest(source: Path) -> dict[str, Any]:
    actual = sorted(item.name for item in source.iterdir() if item.is_file())
    missing = sorted(set(ARTIFACTS) - set(actual))
    unexpected = sorted(set(actual) - set(ARTIFACTS))
    if missing or unexpected:
        raise EvidenceError(
            f"artifact set differs: missing={missing or 'none'}, unexpected={unexpected or 'none'}"
        )
    descriptions = {
        "BOMBKI.EXE": "16-bit DOS MZ executable",
        "BOMBKI.PIF": "Windows Program Information File",
        "CZYTAJ.TXT": "CP852 text with CRLF line endings",
        "MONSTRA.TPU": "Borland Pascal 7 TPUQ compiled unit",
        "PLIKI.TPU": "ASCII line-oriented game state",
        "PRZEDM.TPU": "Borland Pascal 7 TPUQ compiled unit",
        "SWIAT.TPU": "Borland Pascal 7 TPUQ compiled unit",
    }
    records = []
    for name in ARTIFACTS:
        raw = (source / name).read_bytes()
        records.append(
            {
                "name": name,
                "size": len(raw),
                "sha256": hashlib.sha256(raw).hexdigest(),
                "description": descriptions[name],
            }
        )
    return {
        "schema": 1,
        "scope": "Every regular file in the original-artifact directory",
        "artifacts": records,
    }


def flatten_procedures(tpus: Iterable[dict[str, Any]]) -> list[dict[str, Any]]:
    rows = []
    for tpu in tpus:
        for procedure in tpu["procedures"]:
            row = dict(procedure)
            row["unit"] = tpu["artifact"]
            rows.append(row)
    return rows


def string_key(row: dict[str, Any]) -> str:
    return f"{row['artifact']}:{row['file_offset_hex']}"


def normalize_for_match(text: str) -> str:
    return "".join(character if 32 <= ord(character) < 127 else " " for character in text).upper()


def matching_strings(
    strings: Iterable[dict[str, Any]], words: Iterable[str], artifacts: set[str] | None = None,
    whole_words: bool = False,
) -> list[dict[str, Any]]:
    patterns = tuple(words)
    rows = []
    for string in strings:
        if artifacts is not None and string["artifact"] not in artifacts:
            continue
        searchable = normalize_for_match(string["text_utf8"])
        if whole_words:
            matched = any(
                re.search(rf"(?<![A-Z0-9]){re.escape(pattern)}(?![A-Z0-9])", searchable)
                for pattern in patterns
            )
        else:
            matched = any(pattern in searchable for pattern in patterns)
        if matched:
            rows.append(
                {
                    "evidence": string_key(string),
                    "text": string["text_utf8"],
                    "raw_cp852_hex": string["raw_cp852_hex"],
                }
            )
    return rows


def make_inventories(tpus: list[dict[str, Any]], strings: list[dict[str, Any]]) -> dict[str, Any]:
    objects = [
        {"unit": tpu["artifact"], **obj}
        for tpu in tpus
        for obj in tpu["objects"]
    ]
    procedures = flatten_procedures(tpus)
    variables = [
        {
            "unit": obj["unit"],
            "name": obj["name"],
            "object_offset_hex": obj["offset_hex"],
            "private": obj["private"],
        }
        for obj in objects
        if obj["kind"] == "variable"
    ]
    room_procedures = [
        {
            "unit": proc["unit"],
            "name": proc["name"],
            "source_ranges": proc["source_ranges"],
        }
        for proc in procedures
        if proc["unit"] == "SWIAT.TPU" and proc["name"] != "<initialization>"
    ]
    command_words = (
        "POLNOC", "POLODNIE", "WSCHOD", "ZACHOD", "GORA", "DOL", "EXIT", "PATRZ",
        "MODE", "UNMODE", "JA", "KTO", "BIERZ", "ODRZUC", "UZYJ", "ZABIJ",
        "ROZMAWIAJ", "KUP", "SPRZEDAJ", "CWICZ", "TRENUJ", "PAMIETAJ",
        "WLACZ POSTAC", "POROWNAJ", "LISTA", "KOP", "ZWIEJ", "POWROT", "RECE",
        "UZDROW", "OSLEP", "SZAL", "SIATKA", "CIOS W", "ROZPAL", "SPEED", "PIECZ",
        "ZDOLNOSCI", "ZMIEN KOLOR", "ZMIEN TLO", "SPIJ", "CZYSC EKRAN",
        "SECRET LISTA", "SCAN", "ZDEJMUJ", "ODLORZ", "ODLOZ", "DAWAJ EN",
        "DAWAJ KASE", "DAWAJ KUNSZT", "ZABIERAJ KASE", "USTAW SZ", "SYF", "UM",
    )
    command_evidence = matching_strings(strings, command_words, whole_words=True)
    command_vocabulary = []
    for command in command_words:
        matches = [
            row["evidence"]
            for row in command_evidence
            if re.search(
                rf"(?<![A-Z0-9]){re.escape(command)}(?![A-Z0-9])",
                normalize_for_match(row["text"]),
            )
        ]
        if matches:
            command_vocabulary.append({"command": command, "evidence": matches})
    return {
        "schema": 1,
        "status": (
            "Static candidate inventories. They are exhaustive for the stated extraction rule, "
            "not yet claims about runtime reachability or semantics."
        ),
        "commands": {
            "rule": "Command candidates explicitly present as whole words in string literals.",
            "vocabulary": command_vocabulary,
            "strings": command_evidence,
        },
        "rooms": {
            "rule": "All retained SWIAT room procedures and all SWIAT code string literals.",
            "procedures": room_procedures,
            "strings": matching_strings(strings, ("",), {"SWIAT.TPU"}),
        },
        "items": {
            "rule": "String literals naming or manipulating portable objects.",
            "strings": matching_strings(
                strings,
                ("BIERZ", "ODRZUC", "UZYJ", "KUP", "SPRZEDAJ", "PLECAK", "TORB", "NOSISZ"),
            ),
        },
        "enemies": {
            "rule": "MONSTRA symbols plus combat/enemy string literals.",
            "symbols": [item for item in variables if item["unit"] == "MONSTRA.TPU"],
            "strings": matching_strings(
                strings, ("ZABIJ", "ATAK", "WALCZ", "WALKA", "POTWOR", "TRUP", "ZABILES")
            ),
        },
        "skills": {
            "rule": "Training and ability string literals.",
            "strings": matching_strings(
                strings,
                ("CWICZ", "TRENUJ", "UMIEJET", "KOP", "ZWIEJ", "UZDROW", "OSLEP", "SZAL", "SIATK", "CIOS", "ROZPAL", "SPEED", "PIECZ", "RECE"),
            ),
        },
        "shops": {
            "rule": "Shop, price, purchase, and sale string literals plus shop-related procedures.",
            "procedures": [
                {"unit": proc["unit"], "name": proc["name"], "source_ranges": proc["source_ranges"]}
                for proc in procedures
                if "ZYSK" in proc["name"] or "SKLEP" in proc["name"]
            ],
            "strings": matching_strings(
                strings, ("SKLEP", "LISTA", "KUP", "SPRZEDAJ", "CENA", "KOSZTUJE", "ZYSK")
            ),
        },
        "npcs": {
            "rule": "Conversation, speech, and character string literals.",
            "strings": matching_strings(
                strings, ("ROZMAWIAJ", "MOWI", "POWIEDZ", "PYTA", "ODPOWIADA", "POSTAC", "OSOBA")
            ),
        },
        "quests": {
            "rule": "Quest-labelled, mission, requirement, and reward string literals.",
            "strings": matching_strings(
                strings, ("QUEST", "MISJ", "ZADAN", "NAGROD", "PRZYNIES", "POTRZEB")
            ),
        },
        "state_fields": {
            "rule": "Every variable object retained in the three TPUQ full symbol hashes.",
            "symbols": variables,
        },
    }


def procedures_tsv(rows: list[dict[str, Any]]) -> str:
    columns = (
        "unit",
        "procedure",
        "object_offset",
        "entry_record_offset",
        "code_block",
        "offset_in_block",
        "segment_offset",
        "file_offset",
        "source_ranges",
    )
    output = ["\t".join(columns)]
    for row in rows:
        ranges = ";".join(
            f"{item['source_file']}:{item['start_line']}-{item['end_line']}"
            for item in row["source_ranges"]
        )
        output.append(
            "\t".join(
                (
                    row["unit"],
                    row["name"],
                    hex_offset(row["object_offset"]) or "",
                    hex_offset(row["entry_record_offset"]) or "",
                    hex_offset(row["code_block"]) or "",
                    hex_offset(row["offset_in_block"]) or "",
                    row["segment_offset_hex"] or "",
                    row["file_offset_hex"] or "",
                    ranges,
                )
            )
        )
    return "\n".join(output) + "\n"


def strings_jsonl(strings: list[dict[str, Any]], raw_only: bool) -> str:
    lines = []
    for item in strings:
        if raw_only:
            record = {
                "id": string_key(item),
                "artifact": item["artifact"],
                "file_offset": item["file_offset"],
                "length": item["length"],
                "raw_cp852_hex": item["raw_cp852_hex"],
            }
        else:
            record = {
                "id": string_key(item),
                "text_utf8": item["text_utf8"],
            }
        lines.append(json.dumps(record, ensure_ascii=False, sort_keys=True))
    return "\n".join(lines) + "\n"


def inventory_markdown(inventories: dict[str, Any]) -> str:
    titles = {
        "commands": "Commands",
        "rooms": "Rooms",
        "items": "Items",
        "enemies": "Enemies",
        "skills": "Skills",
        "shops": "Shops",
        "npcs": "NPCs",
        "quests": "Quests",
        "state_fields": "State fields",
    }
    lines = [
        "# Generated static-evidence inventories",
        "",
        inventories["status"],
        "",
        "The JSON report beside this file is canonical and includes exact evidence offsets and raw bytes.",
        "",
    ]
    for key, title in titles.items():
        inventory = inventories[key]
        lines.extend((f"## {title}", "", inventory["rule"], ""))
        if inventory.get("procedures"):
            lines.append("Retained procedures: " + ", ".join(item["name"] for item in inventory["procedures"]) + ".")
            lines.append("")
        if inventory.get("symbols"):
            lines.append("Retained symbols: " + ", ".join(item["name"] for item in inventory["symbols"]) + ".")
            lines.append("")
        if inventory.get("vocabulary"):
            lines.append(
                "Candidate vocabulary: "
                + ", ".join(item["command"] for item in inventory["vocabulary"])
                + "."
            )
            lines.append("")
        if "strings" in inventory:
            lines.append(f"Candidate string records: {len(inventory['strings'])}.")
            lines.append("")
    return "\n".join(lines)


def summary_markdown(
    manifest: dict[str, Any], tpus: list[dict[str, Any]], procedures: list[dict[str, Any]],
    strings: list[dict[str, Any]], exe_details: dict[str, Any]
) -> str:
    named_procedures = [item for item in procedures if item["name"] != "<initialization>"]
    tpu_strings = [item for item in strings if item["artifact"].endswith(".TPU")]
    exe_strings = [item for item in strings if item["artifact"] == "BOMBKI.EXE"]
    source_lines = sum(item["source_line_count_record"]["count"] for item in tpus)
    code_bytes = sum(item["header"]["code_size"] for item in tpus)
    return f"""# Generated evidence summary

This directory was generated from the seven original files. Do not edit it by hand;
run `python3 tools/evidence.py` from the project directory.

- Original artifacts: {len(manifest['artifacts'])}
- Retained TPU source lines: {source_lines}
- Retained TPU code bytes: {code_bytes}
- TPU entry records: {len(procedures)} ({len(named_procedures)} named procedures plus initialization records)
- Relocation-identified TPU string literals: {len(tpu_strings)} unique physical strings
- EXE string literals identified by compiler code references: {len(exe_strings)} unique physical strings
- Total string-literal records: {len(strings)}
- MZ relocation records: {exe_details['relocation_count']}

`manifest.json` fixes the exact input set. `tpuq.json` contains decoded headers,
symbols, code blocks, source maps, and validations. `procedures.tsv` is its compact
procedure-to-code-and-source index. `strings.json`, `strings.cp852.jsonl`, and
`strings.utf8.jsonl` preserve locations, raw bytes, and losslessly decoded text.
`inventories.json` and `inventories.md` group the static candidates without making
claims about runtime reachability.
"""


def generate(source: Path) -> dict[str, str]:
    manifest = make_manifest(source)
    tpus = [parse_tpuq(source / name) for name in TPU_NAMES]
    mz = parse_mz(source / "BOMBKI.EXE")
    unit_segments = identify_linked_unit_segments(mz, tpus)

    sorted_segments = mz["logical_segments"]
    exe_strings = all_pointer_strings(mz, "BOMBKI.EXE")
    strings = sorted(
        exe_strings + [item for tpu in tpus for item in tpu["strings"]],
        key=lambda row: (row["artifact"], row["file_offset"]),
    )
    for index, row in enumerate(strings, 1):
        row["id"] = f"string-{index:04d}"

    coverage: dict[str, Any] = {}
    for tpu in tpus:
        segment = unit_segments[tpu["artifact"]]
        following = [item for item in sorted_segments if item > segment]
        end_segment = following[0] if following else (len(mz["data"]) - mz["header_bytes"] + 15) // 16
        linked = pointer_strings_in_segment(
            mz["data"], mz["header_bytes"], segment, end_segment, "BOMBKI.EXE"
        )
        linked_payloads = {item["raw_cp852_hex"] for item in linked}
        relocation_payloads = {item["raw_cp852_hex"] for item in tpu["strings"]}
        missing_payloads = relocation_payloads - linked_payloads
        extra_payloads = linked_payloads - relocation_payloads
        coverage[tpu["artifact"]] = {
            "mz_segment": segment,
            "mz_segment_hex": hex_offset(segment),
            "tpu_relocation_physical_string_count": len(tpu["strings"]),
            "tpu_unique_payload_count": len(relocation_payloads),
            "linked_pointer_physical_string_count": len(linked),
            "linked_unique_payload_count": len(linked_payloads),
            "matching_unique_payload_count": len(relocation_payloads & linked_payloads),
            "tpu_payloads_not_present_in_linked_executable": [
                {
                    "tpu_file_offset_hex": item["file_offset_hex"],
                    "raw_cp852_hex": item["raw_cp852_hex"],
                    "text_utf8": item["text_utf8"],
                }
                for item in tpu["strings"]
                if item["raw_cp852_hex"] in missing_payloads
            ],
            "linked_payloads_not_present_in_tpu": [
                {
                    "exe_file_offset_hex": item["file_offset_hex"],
                    "raw_cp852_hex": item["raw_cp852_hex"],
                    "text_utf8": item["text_utf8"],
                }
                for item in linked
                if item["raw_cp852_hex"] in extra_payloads
            ],
        }

    procedure_rows = flatten_procedures(tpus)
    inventories = make_inventories(tpus, strings)
    tpuq_report = {
        "schema": 1,
        "format_reference": "Borland Pascal 7 TPUQ structures parsed from retained metadata",
        "units": tpus,
        "linked_executable_cross_check": coverage,
    }
    strings_report = {
        "schema": 1,
        "encoding": "Raw bytes are hexadecimal CP852; text_utf8 is a lossless CP852 decode.",
        "scope": (
            "All TPU literals targeted by code-data relocations, plus all EXE literals referenced "
            "in retained MZ code segments by the Turbo Pascal MOV/PUSH-CS compiler sequence."
        ),
        "strings": strings,
    }
    exe_public = {key: value for key, value in mz.items() if key != "data"}
    exe_public["header_bytes_hex"] = hex_offset(mz["header_bytes"])
    exe_public["linked_unit_segments"] = unit_segments

    return {
        "manifest.json": json_text(manifest),
        "mz.json": json_text(exe_public),
        "tpuq.json": json_text(tpuq_report),
        "procedures.tsv": procedures_tsv(procedure_rows),
        "strings.json": json_text(strings_report),
        "strings.cp852.jsonl": strings_jsonl(strings, raw_only=True),
        "strings.utf8.jsonl": strings_jsonl(strings, raw_only=False),
        "inventories.json": json_text(inventories),
        "inventories.md": inventory_markdown(inventories),
        "summary.md": summary_markdown(manifest, tpus, procedure_rows, strings, exe_public),
    }


def write_outputs(output: Path, reports: dict[str, str]) -> None:
    output.mkdir(parents=True, exist_ok=True)
    expected = set(reports)
    for existing in output.iterdir():
        if existing.is_file() and existing.name not in expected:
            raise EvidenceError(f"unexpected generated file: {existing}")
    for name, content in reports.items():
        (output / name).write_text(content, encoding="utf-8", newline="\n")


def check_outputs(output: Path, reports: dict[str, str]) -> list[str]:
    differences = []
    for name, expected in reports.items():
        path = output / name
        if not path.exists():
            differences.append(f"missing {path}")
        elif path.read_text(encoding="utf-8") != expected:
            differences.append(f"stale {path}")
    extras = sorted(
        item.name for item in output.iterdir() if item.is_file() and item.name not in reports
    ) if output.exists() else []
    differences.extend(f"unexpected {output / name}" for name in extras)
    return differences


def parse_args(argv: list[str]) -> argparse.Namespace:
    project = Path(__file__).resolve().parents[1]
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, default=project.parent / "og", help="original artifact directory")
    parser.add_argument("--output", type=Path, default=project / "evidence" / "generated", help="report directory")
    parser.add_argument("--check", action="store_true", help="fail if committed reports are missing or stale")
    parser.add_argument("--dump-tpu", type=Path, help="print one TPUQ metadata report as JSON")
    return parser.parse_args(argv)


def main(argv: list[str] | None = None) -> int:
    args = parse_args(sys.argv[1:] if argv is None else argv)
    try:
        if args.dump_tpu is not None:
            print(json_text(parse_tpuq(args.dump_tpu)), end="")
            return 0
        reports = generate(args.source.resolve())
        if args.check:
            differences = check_outputs(args.output.resolve(), reports)
            if differences:
                print("Evidence reports are not current:", file=sys.stderr)
                for difference in differences:
                    print(f"  {difference}", file=sys.stderr)
                return 1
            print(f"Evidence reports are current: {args.output.resolve()}")
            return 0
        write_outputs(args.output.resolve(), reports)
        print(f"Generated {len(reports)} evidence reports in {args.output.resolve()}")
        return 0
    except (EvidenceError, OSError, struct.error) as error:
        print(f"evidence: {error}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())

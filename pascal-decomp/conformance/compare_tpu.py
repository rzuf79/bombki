#!/usr/bin/env python3
"""Compare TP7-rebuilt units byte-for-byte with the retained originals."""

import argparse
import struct
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tools"))
from tpuq import Tpu, section_layout

UNITS = ("MONSTRA.TPU", "PRZEDM.TPU", "SWIAT.TPU")
DETAIL_LIMIT = 24
HEADER_WORDS = (
    ("ofs_this_unit", 8),
    ("ofs_hashtable", 10),
    ("ofs_entry_pts", 12),
    ("ofs_code_blocks", 14),
    ("ofs_const_blocks", 16),
    ("ofs_var_blocks", 18),
    ("ofs_dll_list", 20),
    ("ofs_unit_list", 22),
    ("ofs_src_name", 24),
    ("ofs_line_count", 26),
    ("ofs_line_lengths", 28),
    ("sym_size", 30),
    ("browser_size", 32),
    ("code_size", 34),
    ("const_size", 36),
    ("reloc_size", 38),
    ("const_reloc_size", 40),
    ("var_size", 42),
)
def sections(data: bytes) -> dict[str, bytes]:
    """Split payloads and alignment padding without dropping any file bytes."""
    return {name: data[start:start + size]
            for name, (start, size) in section_layout(data).items()}


def code_block_deltas(
    original_path: Path, rebuilt_path: Path
) -> tuple[list[str], int, list[str], list[str]]:
    """Return mismatching block summaries labelled with TPU procedure names."""
    original = Tpu(str(original_path))
    rebuilt = Tpu(str(rebuilt_path))

    def blocks(unit: Tpu) -> tuple[
        dict[str, bytes], dict[str, tuple[int, int, int]], bytes,
        dict[int, tuple[int, int]], dict[str, set[int]],
    ]:
        names_by_block = {}
        entries_by_name = {}
        proc_names = unit.proc_entry_map()
        for entry in unit.entries:
            name = proc_names.get(entry.ofs, f"entry@{entry.ofs:04X}")
            if entry.code_block != 0xFFFF:
                names_by_block.setdefault(entry.code_block, []).append(name)

        code_offset = 0
        result = {}
        block_bases = {}
        block_bounds = {}
        relocation_offsets = {}
        relocation_cursor = 0
        for block in unit.code_blocks:
            label = "/".join(sorted(names_by_block.get(block.ofs, []))) or f"block@{block.ofs:04X}"
            block_bases[block.ofs] = code_offset
            block_bounds[block.ofs] = (code_offset, block.size)
            code = unit.data[unit.ofs_code + code_offset:unit.ofs_code + code_offset + block.size]
            result[label] = code
            offsets = set()
            for _, relocation_type, _, _, patch_offset in unit.relocs[
                relocation_cursor:relocation_cursor + block.relocbytes // 8
            ]:
                # Offset, segment, and relative fixups occupy one word;
                # pointer fixups occupy an offset/segment pair.
                width = 4 if ((relocation_type >> 4) & 3) == 3 else 2
                offsets.update(range(patch_offset, patch_offset + width))
            relocation_offsets[label] = offsets
            relocation_cursor += block.relocbytes // 8
            code_offset += block.size
        for entry in unit.entries:
            name = proc_names.get(entry.ofs, f"entry@{entry.ofs:04X}")
            if name and entry.code_block in block_bases:
                entries_by_name[name] = (
                    entry.code_block, entry.offset,
                    block_bases[entry.code_block] + entry.offset,
                )
        code = unit.data[unit.ofs_code:unit.ofs_code + unit.h.code_size]
        return result, entries_by_name, code, block_bounds, relocation_offsets

    old_blocks, old_entries, old_code, old_bounds, old_relocations = blocks(original)
    new_blocks, new_entries, new_code, new_bounds, new_relocations = blocks(rebuilt)
    def procedure_window(
        code: bytes, entry: tuple[int, int, int],
        bounds: dict[int, tuple[int, int]],
    ) -> bytes:
        block_base, block_size = bounds[entry[0]]
        return code[entry[2]:block_base + block_size]

    def diff_window(old: bytes, new: bytes) -> str:
        offset = next((i for i, (a, b) in enumerate(zip(old, new)) if a != b),
                      min(len(old), len(new)))
        start = max(0, offset - 8)
        end = min(max(len(old), len(new)), offset + 16)
        before = old[start:end].hex(" ") or "<end>"
        after = new[start:end].hex(" ") or "<end>"
        return f"+0x{offset:04X} [{before}->{after}]"

    deltas = []
    shared = old_blocks.keys() & new_blocks.keys()
    for label in sorted(shared):
        old = old_blocks[label]
        new = new_blocks[label]
        if old == new:
            continue
        mismatch_count = sum(a != b for a, b in zip(old, new)) + abs(len(old) - len(new))
        relocation_offsets = old_relocations.get(label, set()) | new_relocations.get(label, set())
        real_mismatch_count = sum(
            a != b and offset not in relocation_offsets
            for offset, (a, b) in enumerate(zip(old, new))
        ) + abs(len(old) - len(new))
        first_difference = next(
            (i for i, (a, b) in enumerate(zip(old, new)) if a != b),
            min(len(old), len(new)),
        )
        window_start = max(0, first_difference - 4)
        window_end = min(max(len(old), len(new)), first_difference + 8)
        old_window = old[window_start:window_end].hex(" ") or "<end>"
        new_window = new[window_start:window_end].hex(" ") or "<end>"
        name_deltas = []
        for procedure in label.split("/"):
            old_entry = old_entries.get(procedure)
            new_entry = new_entries.get(procedure)
            if not old_entry or not new_entry:
                continue
            old_post_entry = procedure_window(
                old_code, old_entry, old_bounds
            )
            new_post_entry = procedure_window(
                new_code, new_entry, new_bounds
            )
            post_entry_differences = sum(
                a != b for a, b in zip(old_post_entry, new_post_entry)
            )
            post_entry_differences += abs(
                len(old_post_entry) - len(new_post_entry)
            )
            old_prefix = old[:old_entry[1]]
            new_prefix = new[:new_entry[1]]
            prefix_differences = sum(a != b for a, b in zip(old_prefix, new_prefix))
            prefix_differences += abs(len(old_prefix) - len(new_prefix))
            prefix_first = diff_window(old_prefix, new_prefix)
            post_entry_first = diff_window(old_post_entry, new_post_entry)
            name_deltas.append(
                f"{procedure} entry {old_entry[1]:04X}->{new_entry[1]:04X}, "
                f"pre {prefix_differences} ({len(old_prefix)}->{len(new_prefix)}) "
                f"{prefix_first}, post-entry {post_entry_differences} "
                f"({len(old_post_entry)}->{len(new_post_entry)}) "
                f"{post_entry_first}"
            )
        deltas.append(
            f"{label}: raw {mismatch_count}, real {real_mismatch_count}, "
            f"{len(old)}->{len(new)} bytes, "
            f"first +0x{first_difference:04X} [{old_window}->{new_window}]; "
            + "; ".join(name_deltas)
        )
    return (
        deltas,
        len(shared),
        sorted(old_blocks.keys() - new_blocks.keys()),
        sorted(new_blocks.keys() - old_blocks.keys()),
    )


def relocation_block_deltas(original_path: Path, rebuilt_path: Path) -> tuple[int, int]:
    """Compare fixups by entry identity, resolving only self CS-pool block IDs.

    Reordering procedures renumbers their CS literal-pool blocks. All other
    fields (including runtime call targets and variable-block offsets) must
    match verbatim. This diagnostic does not change the whole-file verdict.
    """
    def groups(path: Path) -> dict:
        unit = Tpu(str(path))
        entries = {}
        for entry in unit.entries:
            entries.setdefault(entry.code_block, []).append(entry.ofs)
        identities = {block: tuple(offsets) for block, offsets in entries.items()}
        result = {}
        cursor = 0
        for block in unit.code_blocks:
            count = block.relocbytes // 8
            records = []
            for target_unit, kind, target_block, target_offset, patch_offset in unit.relocs[cursor:cursor + count]:
                if (kind >> 6 == 1 and
                        unit.unit_blocks_name(target_unit).upper() == unit.unit_self_name.upper()):
                    target_block = identities[target_block]
                records.append((target_unit, unit.unit_blocks_name(target_unit),
                                kind, target_block, target_offset, patch_offset))
            result[identities[block.ofs]] = records
            cursor += count
        return result

    original, rebuilt = groups(original_path), groups(rebuilt_path)
    shared = original.keys() & rebuilt.keys()
    changed = sum(original[key] != rebuilt[key] for key in shared)
    changed += len(original.keys() ^ rebuilt.keys())
    return changed, len(original.keys() | rebuilt.keys())


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--original-dir", type=Path, required=True)
    parser.add_argument("--rebuilt-dir", type=Path, required=True)
    args = parser.parse_args()

    failures = 0
    for name in UNITS:
        original_path = args.original_dir / name
        rebuilt_path = args.rebuilt_dir / name
        if not original_path.is_file():
            print(f"FAIL {name}: original missing: {original_path}")
            failures += 1
            continue
        if not rebuilt_path.is_file():
            print(f"FAIL {name}: rebuilt TPU missing: {rebuilt_path}")
            failures += 1
            continue

        original = original_path.read_bytes()
        rebuilt = rebuilt_path.read_bytes()
        if original[:4] != b"TPUQ" or rebuilt[:4] != b"TPUQ":
            print(
                f"FAIL {name}: invalid TPUQ signature "
                f"(original={original[:4]!r}, rebuilt={rebuilt[:4]!r})"
            )
            failures += 1
            continue
        if len(original) < 44 or len(rebuilt) < 44:
            print(
                f"FAIL {name}: truncated TPU header "
                f"(original={len(original)} bytes, rebuilt={len(rebuilt)} bytes)"
            )
            failures += 1
            continue
        differing = [
            (offset, expected, actual)
            for offset, (expected, actual) in enumerate(zip(original, rebuilt))
            if expected != actual
        ]
        extra = abs(len(original) - len(rebuilt))
        total = len(differing) + extra

        if not total:
            print(f"PASS {name}: byte-identical ({len(original)} bytes)")
            continue

        failures += 1
        header_differences = [
            f"{name}=0x{struct.unpack_from('<H', original, offset)[0]:04X}"
            f"->0x{struct.unpack_from('<H', rebuilt, offset)[0]:04X}"
            for name, offset in HEADER_WORDS
            if len(original) >= offset + 2
            and len(rebuilt) >= offset + 2
            and original[offset:offset + 2] != rebuilt[offset:offset + 2]
        ]
        original_sections = sections(original)
        rebuilt_sections = sections(rebuilt)
        section_summaries = []
        block_deltas, matched_blocks, old_only, new_only = code_block_deltas(
            original_path, rebuilt_path
        )
        reloc_changed, reloc_blocks = relocation_block_deltas(original_path, rebuilt_path)
        print(
            f"FAIL {name}: {total} differing byte position(s); "
            f"original={len(original)} bytes, rebuilt={len(rebuilt)} bytes"
        )
        if header_differences:
            print("  TPU header: " + ", ".join(header_differences))
        for section, expected_data in original_sections.items():
            actual_data = rebuilt_sections[section]
            section_differences = [
                (offset, expected, actual)
                for offset, (expected, actual) in enumerate(
                    zip(expected_data, actual_data)
                )
                if expected != actual
            ]
            section_extra = abs(len(expected_data) - len(actual_data))
            section_total = len(section_differences) + section_extra
            if not section_total:
                continue
            first = (
                f"first +0x{section_differences[0][0]:04X} "
                f"({section_differences[0][1]:02X}->{section_differences[0][2]:02X})"
                if section_differences
                else f"length differs at +0x{min(len(expected_data), len(actual_data)):04X}"
            )
            message = (
                f"{name} {section}: {section_total} differing position(s); "
                f"sizes {len(expected_data)}->{len(actual_data)}, {first}"
            )
            print("  " + message)
            section_summaries.append(
                f"{section} {section_total} ({len(expected_data)}->"
                f"{len(actual_data)}; {first})"
            )
        if differing:
            offset, expected, actual = differing[0]
            print(
                f"::error title=TPU byte mismatch::{name}: {total} differing "
                f"byte position(s), sizes {len(original)}->{len(rebuilt)}; "
                f"first at 0x{offset:04X}, original=0x{expected:02X}, "
                f"rebuilt=0x{actual:02X}; "
                f"header: {', '.join(header_differences) or 'no header-word changes'}; "
                f"sections: {'; '.join(section_summaries)}"
            )
        if matched_blocks or old_only or new_only:
            changed_blocks = len(block_deltas)
            details = "; ".join(block_deltas[:12])
            if changed_blocks > 12:
                details += f"; ... {changed_blocks - 12} more blocks"
            if old_only:
                details += "; original-only: " + ", ".join(old_only[:5])
            if new_only:
                details += "; rebuilt-only: " + ", ".join(new_only[:5])
            print(
                f"::notice title=TPU code-block deltas::{name}: "
                f"{changed_blocks}/{matched_blocks} entry-labelled blocks differ, "
                f"{len(old_only)} original-only and {len(new_only)} rebuilt-only "
                f"block label(s); relocation groups {reloc_changed}/{reloc_blocks} differ "
                f"after resolving self CS-pool block IDs; {details}"
            )
        for offset, expected, actual in differing[:DETAIL_LIMIT]:
            print(
                f"  offset 0x{offset:04X}: "
                f"original=0x{expected:02X}, rebuilt=0x{actual:02X}"
            )
        if len(differing) > DETAIL_LIMIT:
            print(f"  ... {len(differing) - DETAIL_LIMIT} more in-range differences")
        if extra:
            common = min(len(original), len(rebuilt))
            print(f"  length-only difference begins at offset 0x{common:04X}")

    if failures:
        print(f"TPU byte comparison failed: {failures} unit(s) differ or are missing")
        return 1
    print("All reconstructed TPUs are byte-identical to the retained originals")
    return 0


if __name__ == "__main__":
    sys.exit(main())

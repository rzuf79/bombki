#!/usr/bin/env python3
"""Query the checked-in recovery layer without a disassembler dependency."""

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path


PROJECT = Path(__file__).resolve().parents[1]
RECOVERED = PROJECT / "evidence" / "recovered"
SOURCE_MARKER = re.compile(r"^; [^:]+:(\d+)$")


def parse_line_range(value: str) -> tuple[int, int]:
    pieces = value.split("-", 1)
    try:
        start = int(pieces[0])
        end = int(pieces[-1])
    except ValueError as exc:
        raise argparse.ArgumentTypeError(
            "source lines must be START-END or one line number"
        ) from exc
    if start <= 0 or end < start:
        raise argparse.ArgumentTypeError(
            "source lines must be a positive ascending range"
        )
    return start, end


def markdown_files(directory: Path) -> list[Path]:
    return sorted(directory.rglob("*.md"), key=lambda path: str(path).upper())


def find_named_file(directory: Path, name: str, suffix_only: bool = False) -> Path:
    wanted = name.upper().removesuffix(".MD")
    candidates = []
    for path in directory.glob("*.md"):
        stem = path.stem.upper()
        if stem == wanted or (suffix_only and stem.endswith(f".{wanted}")):
            candidates.append(path)
    if not candidates:
        raise SystemExit(f"no recovery entry named {name!r}")
    if len(candidates) > 1:
        choices = ", ".join(path.stem for path in sorted(candidates))
        raise SystemExit(f"ambiguous recovery entry {name!r}: {choices}")
    return candidates[0]


def focused_source_lines(path: Path, bounds: tuple[int, int]) -> str:
    text = path.read_text(encoding="utf-8")
    match = re.search(r"```asm\n(.*?)```", text, flags=re.DOTALL)
    if match is None:
        raise SystemExit(f"{path.name} has no annotated listing")

    start, end = bounds
    current_line: int | None = None
    selected: list[str] = []
    for line in match.group(1).splitlines():
        marker = SOURCE_MARKER.match(line)
        if marker is not None:
            current_line = int(marker.group(1))
        if current_line is not None and start <= current_line <= end:
            selected.append(line)

    if not selected:
        raise SystemExit(
            f"{path.stem} has no instructions mapped to source lines {start}-{end}"
        )
    return "\n".join([
        f"# `{path.stem}` source lines {start}-{end}",
        "",
        "Extracted from the checked-in annotated listing.",
        "",
        "```asm",
        *selected,
        "```",
        "",
    ])


def print_catalog(recovered: Path) -> None:
    mechanics = sorted((recovered / "pseudocode").glob("*.md"))
    procedures = [
        path for path in recovered.glob("*.md")
        if path.name != "INDEX.md" and not path.name.startswith("BOMBKI.")
    ]
    print("Mechanics:")
    for path in mechanics:
        print(f"  {path.stem}")
    print("Procedures:")
    for path in sorted(procedures, key=lambda item: item.stem.upper()):
        print(f"  {path.stem}")


def search(recovered: Path, term: str, limit: int) -> int:
    needle = term.casefold()
    found = 0
    for path in markdown_files(recovered):
        relative = path.relative_to(recovered)
        for line_number, line in enumerate(
            path.read_text(encoding="utf-8").splitlines(), start=1
        ):
            if needle not in line.casefold():
                continue
            print(f"{relative}:{line_number}: {line}")
            found += 1
            if found >= limit:
                return found
    return found


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--recovered",
        type=Path,
        default=RECOVERED,
        help=argparse.SUPPRESS,
    )
    actions = parser.add_mutually_exclusive_group(required=True)
    actions.add_argument("--list", action="store_true", help="list known entries")
    actions.add_argument("--mechanic", metavar="NAME", help="print compact pseudocode")
    actions.add_argument("--procedure", metavar="NAME", help="print one TPU listing")
    actions.add_argument("--search", metavar="TEXT", help="search all recovered notes")
    parser.add_argument(
        "--source-lines",
        type=parse_line_range,
        metavar="START-END",
        help="limit a procedure listing to original Pascal source lines",
    )
    parser.add_argument(
        "--limit",
        type=int,
        default=40,
        help="maximum search matches (default: 40)",
    )
    args = parser.parse_args()
    if args.source_lines is not None and args.procedure is None:
        parser.error("--source-lines requires --procedure")
    if args.limit <= 0:
        parser.error("--limit must be positive")
    return args


def main() -> int:
    args = parse_args()
    recovered = args.recovered
    if not recovered.is_dir():
        raise SystemExit(f"recovery directory not found: {recovered}")

    if args.list:
        print_catalog(recovered)
        return 0
    if args.mechanic is not None:
        path = find_named_file(recovered / "pseudocode", args.mechanic)
        print(path.read_text(encoding="utf-8"), end="")
        return 0
    if args.procedure is not None:
        path = find_named_file(recovered, args.procedure, suffix_only=True)
        if path.name.startswith("BOMBKI.") or path.name == "INDEX.md":
            raise SystemExit(f"{args.procedure!r} is not a TPU procedure")
        if args.source_lines is None:
            print(path.read_text(encoding="utf-8"), end="")
        else:
            print(focused_source_lines(path, args.source_lines), end="")
        return 0
    if search(recovered, args.search, args.limit) == 0:
        print(f"no matches for {args.search!r}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

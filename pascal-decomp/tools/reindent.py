#!/usr/bin/env python3
"""Fix under-indented lines in reconstructed/*.PAS.

Whitespace only. This never adds, removes, or reorders a line, so the
per-source-line code-byte attribution that the reference TPUs encode is
untouched (see analysis-results/reconstruction-log.md finding 147).

The rule is one line of reasoning: a line's correct indent is two spaces per
enclosing block, and this tool only ever *increases* indentation. Anything
already at or below its correct indent is left exactly as it is, so
hand-placed alignment that the structural model cannot see (the indented
continuation lines in `WriteLn` calls, for example) survives untouched.

Two corrections to the naive "add two spaces to the flat lines after a
`repeat`" approach:

  - A line that closes a block (`end`, `until`) or continues one (`else`)
    belongs to the *enclosing* level, so it aligns with its `begin`/`repeat`/
    `if` rather than sitting inside the block.
  - When a flat `if ... then begin` sits above an already-indented body,
    moving only the header would leave that body flush with it. Deriving the
    indent from block depth moves both.

A third case is handled for the same reason: the statement after an unbraced
`if <cond> then` is that `if`'s body but opens no block, so block depth alone
would leave it flush against its own `if`. It gets one extra level, which
preserves the conventional +2 continuation the sources already use:

    if StanZrecznego = 14 then
      WriteLn('ZRECZNY POTWOR SMIGA MIEDZY SCIANAMI');

Column limit: Turbo Pascal rejects source lines longer than 127 bytes with
"Error 11: Line too long", so any line that cannot be indented within the
limit is left alone and reported. SWIAT.PAS:432 is 127 columns at column 0
and therefore cannot move; see finding 147.

Usage:
  tools/reindent.py [--write] [--max-col N] [FILE ...]

Default is a dry run. With no FILEs, every unit in reconstructed/ is used.
Exit status is 0 even when lines were skipped: skipping is the correct
outcome when a line cannot legally be indented, not a failure.
"""

import argparse
import re
import sys
from pathlib import Path

PROJECT = Path(__file__).resolve().parents[1]
RECON = PROJECT / "reconstructed"
UNITS = ["MONSTRA.PAS", "PRZEDM.PAS", "SWIAT.PAS", "BOMBKI.PAS"]

INDENT = 2
# TP7's hard limit; a longer line is a compile error.
DEFAULT_MAX_COL = 127

# Constructs that open a block. `repeat` is closed by `until`, everything
# else here by `end`.
OPENERS = re.compile(r"\b(begin|case|record|class|object|try|with|asm|repeat)\b")
# `until` closes a `repeat`; `end` closes everything else.
CLOSERS = re.compile(r"\b(until|end)\b")
# A line starting with one of these closes a block or continues one, so it
# belongs to the enclosing level rather than the inner one. `end else`,
# `end if` and friends all start with `end` and are covered by it.
CLOSER_FIRST = re.compile(r"^(end\b|until\b|else\b)")
# `if <cond> then` with no `begin` puts its single statement on the next line,
# one level in. That statement opens no block, so block depth alone would place
# it flush against its own `if`; this flags the line that owes the extra level.
UNBRACED_THEN = re.compile(r"\b(then|else)\s*$")
ENDS_BEGIN = re.compile(r"\bbegin\s*$")
# A statement that opens a block in its own right. When such a statement is
# the body of an unbraced `if <cond> then`, the `begin` belongs to the `if`'s
# own level, not one deeper - Turbo Pascal style puts them side by side:
#
#     if cond then
#     begin
#       ...
#     end;
#
# Bumping the `begin` instead would leave its contents flush with it.
STARTS_BLOCK = re.compile(
    r"^(begin|case|record|class|object|try|asm|repeat)\b"
)


def blank_code(line: str) -> str:
    """Return `line` with comments and string literals blanked out.

    Blanking rather than deleting preserves column positions, and stops
    braces or quotes inside string literals from confusing the nesting scan.
    A doubled quote ('') is an escaped quote, not a terminator.
    """
    out = []
    i, n = 0, len(line)
    while i < n:
        ch = line[i]
        if ch == "{":
            end = line.find("}", i)
            if end == -1:
                end = n - 1
            out.append(" " * (end - i + 1))
            i = end + 1
        elif ch == "'":
            j = i + 1
            while j < n:
                if line[j] == "'":
                    if j + 1 < n and line[j + 1] == "'":
                        j += 2
                        continue
                    break
                j += 1
            out.append(" " * (j - i + 1))
            i = j + 1
        else:
            out.append(ch)
            i += 1
    return "".join(out)


def desired_indents(code_lines):
    """Two spaces per enclosing block, for every line.

    Returns the indent each line should have. Block nesting sets the baseline;
    a few constructs need one extra level that nesting alone cannot express:

      - a line starting with `end`/`until`/`else` belongs to the level
        outside the block it closes;
      - the statement after an unbraced `if <cond> then` (or `else`) is that
        `if`'s body. A plain statement opens no block, so depth would leave it
        flush against its own `if`, flattening the conventional +2
        continuation. If that body instead opens a block (`begin`, `case`,
        `try`, ...), the opener stays level with the `if` and its contents get
        the level from the opener, so no extra level is added here.

    Declaration sections (`var`, `const`, `type`, `label`) do not open a block,
    so their entries get depth 0 and are never moved by this tool.
    """
    result = []
    depth = 0
    owes_level = False  # previous line ended in an unbraced `then`/`else`
    for line in code_lines:
        stripped = line.strip()
        if not stripped:
            result.append(None)  # blank line: leave as is, pending survives
            continue

        # This line is the body of the previous line's unbraced `if`/`else`.
        # If it opens a block itself, the opener belongs to the `if`'s level.
        body_opens_block = owes_level and STARTS_BLOCK.match(stripped) is not None

        if CLOSER_FIRST.match(stripped):
            level = depth - 1
        elif owes_level and not body_opens_block:
            level = depth + 1
        else:
            level = depth
        result.append(max(level, 0) * INDENT)

        opened = len(OPENERS.findall(line))
        closed = len(CLOSERS.findall(line))
        depth += opened - closed
        if depth < 0:
            depth = 0

        rstripped = line.rstrip()
        owes_level = bool(UNBRACED_THEN.search(rstripped)) and not ENDS_BEGIN.search(
            rstripped
        )

    return result


def plan(text: str, max_col: int):
    """Return (new_text, indented, skipped) without writing anything.

    `indented` and `skipped` hold 1-based line numbers.
    """
    lines = text.split("\n")
    code = [blank_code(line) for line in lines]
    want = desired_indents(code)

    indented, skipped = [], []
    for i, line in enumerate(lines):
        target = want[i]
        if target is None:
            continue
        current = len(line) - len(line.lstrip())
        if current >= target:
            continue  # already correct, or hand-placed deeper: never touch
        if len(line) + (target - current) > max_col:
            skipped.append((i + 1, len(line) + (target - current)))
            continue
        lines[i] = " " * target + line.lstrip()
        indented.append(i + 1)

    return "\n".join(lines), indented, skipped


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Indent under-indented lines in reconstructed/*.PAS."
    )
    parser.add_argument("files", nargs="*", help="Pascal files (default: all units)")
    parser.add_argument("--write", action="store_true", help="apply changes in place")
    parser.add_argument(
        "--max-col",
        type=int,
        default=DEFAULT_MAX_COL,
        help=f"column limit (default {DEFAULT_MAX_COL}, TP7's maximum)",
    )
    args = parser.parse_args()

    paths = [Path(f) for f in args.files] if args.files else [RECON / u for u in UNITS]

    changed_files = 0
    total_indented = 0
    total_skipped = 0

    for path in paths:
        try:
            original = path.read_text(encoding="latin-1")
        except OSError as exc:
            print(f"::error::cannot read {path}: {exc}", file=sys.stderr)
            return 2

        new_text, indented, skipped = plan(original, args.max_col)
        changed = new_text != original
        changed_files += 1 if changed else 0
        total_indented += len(indented)
        total_skipped += len(skipped)

        print(f"{path.name}: {'indent' if changed else 'ok'} "
              f"({len(indented)} indented, {len(skipped)} skipped)")
        for lineno in indented[:5]:
            print(f"    +{lineno}: {new_text.split(chr(10))[lineno - 1].strip()[:60]}")
        if len(indented) > 5:
            print(f"    ... and {len(indented) - 5} more")
        for lineno, length in skipped:
            print(f"    ! {lineno}: would reach {length} cols "
                  f"(limit {args.max_col}), left alone: "
                  f"{original.split(chr(10))[lineno - 1].strip()[:48]}")

        if changed and args.write:
            # split("\n")/join round-trips a trailing newline exactly, so the
            # original final-newline state is preserved either way.
            path.write_text(new_text, encoding="latin-1")
        elif changed:
            print("    (dry run; pass --write to apply)")

    print(f"\n{changed_files} file(s) would change, {total_indented} line(s) "
          f"indented, {total_skipped} skipped for exceeding {args.max_col} columns")
    return 0


if __name__ == "__main__":
    sys.exit(main())

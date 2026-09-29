#!/usr/bin/env python3
"""Compare TP7 per-source-line code-byte counts or complete EXE files.

Compile every top-level Pascal source in SOURCE_DIR and check each TPU/EXE
against the matching file in REFERENCE_DIR:
  python3 tools/compare_tp7_artifacts.py --compile SOURCE_DIR REFERENCE_DIR

Compile one Pascal source and compare its generated TPU/EXE:
  python3 tools/compare_tp7_artifacts.py --compile SOURCE.PAS REFERENCE.TPU

Compare two existing files (candidate first, reference second):
  python3 tools/compare_tp7_artifacts.py -p POROWNANIE CANDIDATE.TPU REFERENCE.TPU

TPUs are compared by compiler-attributed code-byte counts for each source line
in every procedure by default. EXEs are compared byte-for-byte. Compile mode
uses local DOSBox-X and TP7. TPU comparisons check per-line code-byte counts,
not whole-file metadata, and do not apply project-specific source timestamps.
"""

import argparse
import os
import re
import shutil
import struct
import subprocess
import sys
import tempfile
from pathlib import Path

from tpuq import Tpu

VERSION = "1.2"
BUILDABLE_EXTENSIONS = {".pas"}


def u16(data: bytes, offset: int) -> int:
    return struct.unpack_from("<H", data, offset)[0]


def line_byte_counts(path: Path) -> dict[str, dict]:
    """Read procedure source-line code-byte counts keyed by procedure name."""
    unit = Tpu(str(path))
    data = unit.data
    names = {offset: proc.name for offset, proc in unit.procs.items()}
    rows = {}
    offset = unit.h.ofs_line_lengths
    end = unit.h.sym_size

    while offset + 12 <= end:
        symbol = u16(data, offset)
        declaration = u16(data, offset + 4)
        body_line = u16(data, offset + 8)
        count = u16(data, offset + 10)
        if (0 < declaration < body_line and 1 <= count <= 1000
                and offset + 12 + count <= end):
            name = names.get(symbol)
            if name:
                rows[name] = {
                    "body_line": body_line,
                    "byte_counts": list(data[offset + 12:offset + 12 + count]),
                }
            offset += 12 + count
        else:
            offset += 1

    if not rows:
        raise ValueError(f"no procedure source-line code-byte records found in {path}")
    return rows


SOFT_GREEN = "\033[38;5;120m"
SOFT_RED = "\033[38;5;210m"
WHITE = "\033[97m"
RESET = "\033[0m"
USE_COLOR = False


def color_enabled(mode: str) -> bool:
    if mode == "always":
        return True
    if mode == "never" or os.environ.get("NO_COLOR") is not None:
        return False
    return sys.stdout.isatty()


def styled(text: object, color: str) -> str:
    return f"{color}{text}{RESET}" if USE_COLOR else str(text)


def compare_tpus(candidate: Path, reference: Path, procedure: str | None,
                 show_matches: bool = False, show_all: bool = False,
                 source_file: Path | None = None) -> int:
    """Compare source-line code-byte counts for each procedure."""
    actual_rows = line_byte_counts(candidate)
    expected_rows = line_byte_counts(reference)
    if procedure:
        procedure = procedure.upper()
        if procedure not in actual_rows or procedure not in expected_rows:
            raise ValueError(f"procedure {procedure!r} is not present in both TPUs")
        procedures = [procedure]
    else:
        procedures = sorted(actual_rows.keys() | expected_rows.keys())

    rows_by_procedure = {}
    summaries = []
    for name in procedures:
        actual = actual_rows.get(name)
        expected = expected_rows.get(name)
        if actual is None or expected is None:
            rows_by_procedure[name] = [{
                "procedure": name,
                "index": "-",
                "candidate_line": None,
                "reference_line": None,
                "reference": "present" if expected else "missing",
                "candidate": "present" if actual else "missing",
                "mismatch": True,
            }]
            summaries.append((name, 1, 0))
            continue

        count = max(len(actual["byte_counts"]), len(expected["byte_counts"]))
        proc_mismatches = 0
        procedure_rows = []
        for index in range(count):
            got = actual["byte_counts"][index] if index < len(actual["byte_counts"]) else None
            want = expected["byte_counts"][index] if index < len(expected["byte_counts"]) else None
            mismatch = got != want
            proc_mismatches += mismatch
            procedure_rows.append({
                "procedure": name,
                "index": str(index),
                "candidate_line": actual["body_line"] + index if got is not None else None,
                "reference_line": expected["body_line"] + index if want is not None else None,
                "reference": str(want) if want is not None else "-",
                "candidate": str(got) if got is not None else "-",
                "mismatch": mismatch,
            })
        rows_by_procedure[name] = procedure_rows
        summaries.append((name, proc_mismatches, count))

    mismatch_total = sum(count for _, count, _ in summaries)
    if not mismatch_total and not show_all:
        if show_matches:
            for name, count, total in summaries:
                print(styled(f"Procedure: {name}", WHITE))
                print(styled(f"0 mismatches / {total} source-line entries", SOFT_GREEN))
        else:
            total_entries = sum(total for _, _, total in summaries)
            print(styled(
                f"No mismatches across {len(summaries)} procedures ", SOFT_GREEN
            ) + f"({total_entries} source-line entries).")
        return 0

    source_lines = source_file.read_bytes().splitlines() if source_file else None
    for name, count, total in summaries:
        if not count and not show_matches and not show_all:
            continue
        print(styled(f"Procedure: {name}", WHITE))
        procedure_rows = rows_by_procedure[name]
        if not show_all:
            procedure_rows = [row for row in procedure_rows if row["mismatch"]]
        if not count and not show_all:
            summary = f"0 mismatches / {total} source-line entries"
            print(styled(summary, SOFT_GREEN))
            continue
        headers = ("index", "line", "reference", "candidate")
        rendered_rows = []
        for row in procedure_rows:
            candidate_line = row["candidate_line"]
            reference_line = row["reference_line"]
            if candidate_line is not None and candidate_line == reference_line:
                line = str(candidate_line)
                line_display = styled(line, SOFT_GREEN)
            else:
                candidate_value = str(candidate_line) if candidate_line is not None else "-"
                reference_value = str(reference_line) if reference_line is not None else "-"
                candidate_display = styled(candidate_value, SOFT_GREEN)
                reference_display = styled(reference_value, SOFT_RED)
                line = f"{candidate_value}:{reference_value}"
                line_display = f"{candidate_display}:{reference_display}"
            rendered_rows.append((
                row["index"], line, row["reference"], row["candidate"],
                line_display, row["mismatch"],
            ))

        widths = [max(len(headers[column]), *(len(row[column]) for row in rendered_rows))
                  for column in range(len(headers))]
        print("  ".join(value.ljust(widths[column])
                        for column, value in enumerate(headers)))
        print("  ".join("-" * width for width in widths))
        for row, rendered in zip(procedure_rows, rendered_rows):
            index_display = styled(rendered[0].ljust(widths[0]), WHITE)
            line_display = rendered[4] + " " * (widths[1] - len(rendered[1]))
            count_color = SOFT_RED if rendered[5] else SOFT_GREEN
            reference_display = styled(rendered[2], SOFT_GREEN)
            reference_display += " " * (widths[2] - len(rendered[2]))
            candidate_display = styled(rendered[3], count_color)
            candidate_display += " " * (widths[3] - len(rendered[3]))
            print("  ".join((index_display, line_display,
                            reference_display, candidate_display)))
            candidate_line = row["candidate_line"]
            if (row["mismatch"] and source_lines is not None
                    and candidate_line is not None
                    and 1 <= candidate_line <= len(source_lines)):
                source_text = source_lines[candidate_line - 1].decode(
                    "utf-8", errors="replace"
                )
                print(f"      {source_text}")
        if count:
            mismatch_count = styled(f"{count} mismatches", SOFT_RED)
            print(f"{mismatch_count} / {total} source-line entries")
        else:
            summary = f"0 mismatches / {total} source-line entries"
            print(styled(summary, SOFT_GREEN))
    return 1 if mismatch_total else 0


def file_kind(path: Path) -> str:
    with path.open("rb") as stream:
        signature = stream.read(4)
    if signature == b"TPUQ":
        return "TPU"
    if signature[:2] == b"MZ":
        return "EXE"
    raise ValueError(f"{path} is neither a TPUQ unit nor an MZ executable")


def compare_exes(candidate: Path, reference: Path) -> int:
    """Compare the complete bytes of two DOS executables."""
    actual = candidate.read_bytes()
    expected = reference.read_bytes()
    differences = [(index, want, got) for index, (want, got) in enumerate(
        zip(expected, actual)) if want != got]
    length_delta = abs(len(expected) - len(actual))
    total = len(differences) + length_delta
    if total == 0:
        line = f"EXE byte-identical: {len(actual)} bytes"
        print(styled(line, SOFT_GREEN))
        return 0
    first = differences[0][0] if differences else min(len(expected), len(actual))
    exe_red = styled("EXE differs: ", SOFT_RED)
    reference_green = styled(len(expected), SOFT_GREEN)
    candidate_red = styled(len(actual), SOFT_RED)
    print(exe_red + "reference=" + reference_green + " bytes, candidate=" + candidate_red + " bytes" )
    line = [
        f"{total} differing byte positions; ",
        f"first at file offset 0x{first:X}"
    ]
    print(styled(line[0], SOFT_RED) + line[1])
    return 1


def compare_files(candidate: Path, reference: Path,
                  procedure: str | None,
                  show_matches: bool = False, show_all: bool = False,
                  source_file: Path | None = None) -> int:
    actual_kind = file_kind(candidate)
    expected_kind = file_kind(reference)
    if actual_kind != expected_kind:
        raise ValueError(
            f"artifact types differ: candidate is {actual_kind}, reference is {expected_kind}"
        )
    print("Comparing candidate " + styled(candidate, WHITE)
          + " against reference " + styled(reference, SOFT_GREEN) + " "
          + styled(f"({actual_kind})", WHITE) + ".")
    if actual_kind == "TPU":
        return compare_tpus(candidate, reference, procedure, show_matches,
                            show_all, source_file)
    if procedure:
        raise ValueError("--procedure applies only when comparing TPU files")
    return compare_exes(candidate, reference)


def remove_pascal_comments(source: str) -> str:
    return re.sub(r"\{.*?\}|\(\*.*?\*\)|//[^\r\n]*", " ", source,
                  flags=re.DOTALL)


def source_info(path: Path) -> dict:
    source = remove_pascal_comments(path.read_bytes().decode("latin-1"))
    unit_match = re.search(r"\bunit\s+([A-Za-z_]\w*)\s*;", source, re.IGNORECASE)
    uses = []
    for match in re.finditer(r"\buses\s+(.*?);", source, re.IGNORECASE | re.DOTALL):
        uses.extend(re.findall(r"[A-Za-z_]\w*", match.group(1)))
    unit_name = unit_match.group(1) if unit_match else None
    extension = ".TPU" if unit_name else ".EXE"
    return {
        "path": path,
        "unit_name": unit_name,
        "output_name": path.stem + extension,
        "uses": {name.casefold() for name in uses},
    }


def ordered_sources(source_dir: Path) -> list[dict]:
    """Sort source units before their users using Pascal `uses` clauses."""
    paths = sorted((path for path in source_dir.iterdir()
                    if path.is_file() and path.suffix.lower() in BUILDABLE_EXTENSIONS),
                   key=lambda path: path.name.casefold())
    if not paths:
        raise ValueError(f"no top-level .pas sources found in {source_dir}")

    sources = [source_info(path) for path in paths]
    unit_paths = {}
    for source in sources:
        name = source["unit_name"]
        if name:
            key = name.casefold()
            if key in unit_paths:
                raise ValueError(f"duplicate Pascal unit name: {name}")
            unit_paths[key] = source["path"]

    by_path = {source["path"]: source for source in sources}
    dependencies = {}
    for source in sources:
        dependencies[source["path"]] = {
            unit_paths[name] for name in source["uses"] if name in unit_paths
        }

    pending = set(paths)
    ordered = []
    while pending:
        ready = sorted((path for path in pending
                        if not (dependencies[path] & pending)),
                       key=lambda path: path.name.casefold())
        if not ready:
            names = ", ".join(path.name for path in sorted(pending))
            raise ValueError(f"cyclic Pascal unit dependencies among: {names}")
        ordered.extend(by_path[path] for path in ready)
        pending.difference_update(ready)
    return ordered


def find_tpc(explicit_root: Path | None) -> tuple[Path, Path]:
    """Find the TP7 installation and TPC.EXE in local standard locations."""
    candidates = []
    if explicit_root:
        candidates.append(explicit_root)
    if os.environ.get("TP7_ROOT"):
        candidates.append(Path(os.environ["TP7_ROOT"]))
    candidates.extend((Path("/tmp/opencode/tp7"), Path("/opt/tp7"), Path("/tools/tp7")))
    seen = set()
    for candidate in candidates:
        candidate = candidate.expanduser().resolve()
        if candidate in seen:
            continue
        seen.add(candidate)
        if candidate.is_file() and candidate.name.lower() == "tpc.exe":
            return candidate.parent.parent, candidate
        if not candidate.is_dir():
            continue
        direct = candidate / "BIN" / "TPC.EXE"
        if direct.is_file():
            return candidate, direct
        for executable in candidate.rglob("tpc.exe"):
            return candidate, executable
    searched = ", ".join(str(path) for path in candidates) or "(none)"
    raise FileNotFoundError(f"TPC.EXE not found; set TP7_ROOT or pass --tp7-root. Checked: {searched}")


def case_insensitive_file(directory: Path, name: str) -> Path | None:
    key = name.casefold()
    for path in directory.iterdir():
        if path.is_file() and path.name.casefold() == key:
            return path
    return None


def compile_sources(source_dir: Path, build_dir: Path, tp7_root: Path,
                    tpc: Path, dosbox: str,
                    selected_sources: list[dict] | None = None) -> list[Path]:
    """Copy a source directory and compile selected or all top-level sources."""
    sources = selected_sources if selected_sources is not None else ordered_sources(source_dir)
    shutil.copytree(source_dir, build_dir, dirs_exist_ok=True)
    for source in sources:
        copied = build_dir / source["path"].name
        text = copied.read_bytes().replace(b"\r\n", b"\n").replace(b"\r", b"\n")
        copied.write_bytes(text.replace(b"\n", b"\r\n"))
        old_output = case_insensitive_file(build_dir, source["output_name"])
        if old_output:
            old_output.unlink()

    tpc_relative = tpc.relative_to(tp7_root).as_posix().replace("/", "\\")
    tpc_dos = "c:\\" + tpc_relative
    compile_commands = []
    for index, source in enumerate(sources):
        redirect = ">" if index == 0 else ">>"
        compile_commands.append(
            f'{tpc_dos} "{source["path"].name}" {redirect} d:\\tp7-build.log'
        )
    config = [
        "[dosbox]", "machine=svga_bridge", "memsize=32", "",
        "[cpu]", "core=auto", "cputype=pentium", "",
        "[render]", "frameskip=0", "",
        "[sdl]", "fullscreen=false", "fulldouble=false", "autolock=false", "",
        "[mixer]", "nosound=true", "",
        "[dos]", "ver=7.0", "",
        "[autoexec]",
        f'mount c "{str(tp7_root).replace(chr(34), "")}"',
        f'mount d "{str(build_dir).replace(chr(34), "")}"',
        "d:", *compile_commands, "exit", "",
    ]
    config_path = build_dir / "tp7-run.conf"
    config_path.write_text("\n".join(config), encoding="ascii")
    env = dict(os.environ, SDL_VIDEODRIVER="dummy", SDL_AUDIODRIVER="dummy")
    result = subprocess.run([dosbox, "-conf", str(config_path)], check=False,
                            capture_output=True, timeout=180, env=env)
    log_path = build_dir / "tp7-build.log"
    if not log_path.is_file():
        output = (result.stdout + result.stderr).decode("utf-8", "replace")
        raise RuntimeError(f"DOSBox-X produced no TP7 build log:\n{output[-2000:]}")
    log = log_path.read_bytes().decode("cp437", "replace")
    banners = len(re.findall(r"Turbo Pascal.*Version 7", log, re.IGNORECASE))
    if banners < len(sources):
        raise RuntimeError(f"expected {len(sources)} genuine TP7 compiler banners:\n{log[-3000:]}")
    if re.search(r"(?:Error\s+\d+:|Fatal:)", log, re.IGNORECASE):
        raise RuntimeError(f"TP7 reported a compile error:\n{log[-3000:]}")

    outputs = []
    for source in sources:
        output = case_insensitive_file(build_dir, source["output_name"])
        if output is None:
            raise RuntimeError(f"TP7 did not produce {source['output_name']}:\n{log[-3000:]}")
        outputs.append(output)
    print(f"TP7 compiled {len(sources)} Pascal source files successfully.")
    print(log.splitlines()[-1])
    return outputs


def compare_single_source(source_file: Path, reference_file: Path,
                          build_dir: Path, tp7_root: Path, tpc: Path,
                          dosbox: str, procedure: str | None,
                          show_matches: bool, show_all: bool,
                          show_source: bool) -> int:
    """Compile only one Pascal source, then compare its output to one artifact."""
    if source_file.suffix.lower() != ".pas":
        raise ValueError(f"single-source compile requires a .pas file: {source_file}")
    source = source_info(source_file)
    outputs = compile_sources(
        source_file.parent, build_dir, tp7_root, tpc, dosbox,
        selected_sources=[source],
    )
    return compare_files(outputs[0], reference_file, procedure,
                         show_matches, show_all,
                         source_file if show_source else None)


def compare_directories(source_dir: Path, reference_dir: Path,
                        build_dir: Path, tp7_root: Path, tpc: Path,
                        dosbox: str, procedure: str | None,
                        show_matches: bool, show_all: bool,
                        show_source: bool) -> int:
    outputs = compile_sources(source_dir, build_dir, tp7_root, tpc, dosbox)
    sources = ordered_sources(source_dir)
    failures = 0
    for output, source in zip(outputs, sources):
        reference = case_insensitive_file(reference_dir, output.name)
        if reference is None:
            print(f"FAIL {output.name}: reference artifact missing from {reference_dir}")
            failures += 1
            continue
        try:
            selected_procedure = procedure if file_kind(output) == "TPU" else None
            failures += compare_files(output, reference, selected_procedure,
                                      show_matches, show_all,
                                      source["path"] if show_source else None)
        except ValueError as error:
            print(f"FAIL {output.name}: {error}")
            failures += 1
    return 1 if failures else 0


def check_option_order(argv: list[str], parser: argparse.ArgumentParser) -> None:
    """Require options before operands, except after POSIX's `--` marker."""
    value_options = {"-p", "--procedure", "-t", "--tp7-root", "-d", "--dosbox-x",
                     "-C", "--color"}
    long_value_options = {"--procedure", "--tp7-root", "--dosbox-x", "--color"}
    operands_started = False
    skip_value = False
    for token in argv:
        if token == "--":
            break
        if skip_value:
            skip_value = False
            continue
        if token in value_options:
            if operands_started:
                parser.error("options must precede path operands; use -- before operands")
            skip_value = True
            continue
        if any(token.startswith(option + "=") for option in long_value_options):
            if operands_started:
                parser.error("options must precede path operands; use -- before operands")
            continue
        if token.startswith("-"):
            if operands_started:
                parser.error("options must precede path operands; use -- before operands")
            continue
        operands_started = True


def main() -> int:
    examples = """\
Compile and compare every top-level Pascal source in two directories:
  %(prog)s --compile SOURCE_DIR REFERENCE_DIR

Compile one Pascal source and compare its generated artifact:
  %(prog)s --compile SOURCE.PAS REFERENCE.TPU

Compare two existing TPUs or EXEs (candidate first):
  %(prog)s [-p PROCEDURE] CANDIDATE REFERENCE

TPUs are compared by per-source-line code-byte counts; by default, only
mismatching rows are listed. Use -S/--show-all to list matching rows too.
EXEs are compared byte-for-byte.
"""
    parser = argparse.ArgumentParser(
        description="Compare TP7 TPU source-line code-byte counts or complete EXE files.",
        epilog=examples,
        formatter_class=argparse.RawDescriptionHelpFormatter,
        allow_abbrev=False,
    )
    parser.add_argument("-c", "--compile", action="store_true",
                        help="compile all top-level .pas files in the first directory")
    parser.add_argument("-p", "--procedure", metavar="NAME",
                        help="limit TPU comparison to this procedure (default: all procedures)")
    parser.add_argument("-t", "--tp7-root", type=Path, metavar="DIR",
                        help="TP7 installation root (default: TP7_ROOT or known local paths)")
    parser.add_argument("-d", "--dosbox-x", metavar="PROGRAM",
                        help="DOSBox-X executable (default: dosbox-x from PATH)")
    parser.add_argument("-k", "--keep-build", action="store_true",
                        help="retain the compiled scratch directory")
    parser.add_argument("-m", "--show-matches", action="store_true",
                        help="include zero-mismatch procedure summaries")
    parser.add_argument("-S", "--show-all", action="store_true",
                        help="show matching and mismatching TPU line-count rows")
    parser.add_argument("-s", "--show-source", action="store_true",
                        help="print candidate source lines below TPU mismatches (compile mode)")
    parser.add_argument("-C", "--color", choices=("auto", "always", "never"),
                        default="auto", metavar="WHEN",
                        help="colorize mismatch tables (default: auto; honors NO_COLOR)")
    parser.add_argument("-v", "--version", action="version",
                        version=f"%(prog)s {VERSION}")
    parser.add_argument("candidate", type=Path,
                        help="candidate file, or .pas source / source directory with --compile")
    parser.add_argument("reference", type=Path,
                        help="reference file, or reference directory with --compile")
    argv = sys.argv[1:]
    check_option_order(argv, parser)
    args = parser.parse_args(argv)
    global USE_COLOR
    USE_COLOR = color_enabled(args.color)

    try:
        if args.compile:
            directory_mode = args.candidate.is_dir() and args.reference.is_dir()
            single_file_mode = args.candidate.is_file() and args.reference.is_file()
            if not directory_mode and not single_file_mode:
                parser.error(
                    "--compile requires either SOURCE_DIR REFERENCE_DIR or "
                    "SOURCE.PAS REFERENCE.TPU|EXE"
                )
            dosbox = args.dosbox_x or shutil.which("dosbox-x")
            if not dosbox:
                raise FileNotFoundError("dosbox-x not found in PATH; pass --dosbox-x")
            tp7_root, tpc = find_tpc(args.tp7_root)
            if args.keep_build:
                build_dir = Path(tempfile.mkdtemp(prefix="tp7-line-bytes-"))
                if single_file_mode:
                    result = compare_single_source(
                        args.candidate, args.reference, build_dir,
                        tp7_root, tpc, dosbox, args.procedure,
                        args.show_matches, args.show_all,
                        args.show_source,
                    )
                else:
                    result = compare_directories(
                        args.candidate, args.reference, build_dir,
                        tp7_root, tpc, dosbox, args.procedure,
                        args.show_matches, args.show_all,
                        args.show_source,
                    )
                print(f"Build artifacts kept at: {build_dir}")
                return result
            with tempfile.TemporaryDirectory(prefix="tp7-line-bytes-") as temp_dir:
                if single_file_mode:
                    return compare_single_source(
                        args.candidate, args.reference, Path(temp_dir),
                        tp7_root, tpc, dosbox, args.procedure,
                        args.show_matches, args.show_all,
                        args.show_source,
                    )
                return compare_directories(
                    args.candidate, args.reference, Path(temp_dir),
                    tp7_root, tpc, dosbox, args.procedure,
                    args.show_matches, args.show_all,
                    args.show_source,
                )

        if args.keep_build or args.tp7_root or args.dosbox_x or args.show_source:
            parser.error("--keep-build, --tp7-root, --dosbox-x, and --show-source require --compile")
        if not args.candidate.is_file() or not args.reference.is_file():
            parser.error("without --compile, CANDIDATE and REFERENCE must be files")
        return compare_files(args.candidate, args.reference, args.procedure,
                             args.show_matches, args.show_all)
    except (OSError, RuntimeError, ValueError, struct.error,
            subprocess.TimeoutExpired) as error:
        parser.error(str(error))


if __name__ == "__main__":
    sys.exit(main())

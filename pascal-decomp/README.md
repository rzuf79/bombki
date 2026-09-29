# BOMBKI Pascal reconstruction

This project reconstructs the original BOMBKI Turbo Pascal 7 program from its
DOS executable and TP7 units. The goal is source-level fidelity to that EXE/TPU
evidence, including original DOS behavior. Native FPC builds are available and
used for development and prompt-driven tests.

 See `TODO.md` and `analysis-results/reconstruction-log.md` for more info.

## Setup

- Python 3 for the analysis, build, and conformance scripts.
- Optional `pyte` (`python3 -m pip install pyte`) for screen-aware PTY tests
  with `conformance/expect_pty.py --pyte`.
- Free Pascal (FPC) for a host-native build and tests.
- For genuine TP7 builds, a Turbo Pascal 7 installation and DOSBox-X. Set
  `TP7_ROOT` to the TP7 directory if it is not in a standard location.
- DOSEMU2 is an optional DOS runtime. The following options disable KVM
  (to run in WSL2) and change the CPU emu to avoid Pascal CRT RE 200:

  ```ini
  $_cpu_vm = "emulated"
  $_cpu_vm_dpmi = "emulated"
  $_cpuemu = (1)
  ```

  Note that `-dumb` doesn't really work for Pascal because CRT writes to video
  memory directly, so no DOS/BIOS terminal access happens. Use `-t` instead.

Generated build products and test transcripts go under the ignored `build/`
directory.

## Common commands

Build the native Linux executable:

```sh
python3 tools/build_fpc.py --target linux
```

Run the prompt-driven native MODE smoke test (after building):

```sh
python3 conformance/expect_pty.py build/fpc/BOMBKI-linux-x86_64 \
  conformance/scenarios/mode-smoke.json \
  --log build/pty-native/mode-smoke.jsonl
```

Compile with genuine TP7 in DOSBox-X, without starting the game:

```sh
python3 tools/build_tp7_dosbox.py --no-run
```

Run the TP7 executable in DOSEMU2's terminal frontend without opening a window:

```sh
dosemu -q -t \
  -I '$_cpu_vm = "emulated"' \
  -I '$_cpu_vm_dpmi = "emulated"' \
  -I '$_cpuemu = (1)' \
  -I '$_external_char_set = "utf8"' \
  -I '$_internal_char_set = "cp437"' \
  -K "$PWD/build/tp7" -E BOMBKI.EXE
```

The DOSEMU2 command is useful for runtime investigation.

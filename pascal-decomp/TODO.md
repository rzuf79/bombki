# Pascal reconstruction — current handoff

This is the active work queue, not a chronological record. Keep it synchronized
with `analysis-results/reconstruction-log.md` when tasks are completed or
priorities change. The log preserves dated findings; the EXE/TPU evidence
remains authoritative.

## Reconstruction work

1. **Validate MODE runtime fidelity (context 1000).** The known command body,
   including save/load and skill/item commands, is transcribed in
   `StanPodswiadomosci`: the 80 save/load fields, inventory/status output,
   inline spell/skill/item branches, `BRANIE` at img `0xEC9B`, and late color
   dispatch at img `0xF566`. A host-native PTY smoke scenario now exercises
   startup, race/name input, MODE status/color, UNMODE, and WYJSCIE. Separate
   `mode-sleep-smoke.json` and `mode-save-load-smoke.json` scenarios exercise
   `SPIJ` and all 80 save/load fields, including a changed-then-restored money
   value. These are host-native FPC evidence. DOSEMU2 terminal mode with
   interpreter CPU emulation and pyte screen capture also passed all 12 steps
   on the TP7 build; `-dumb` does not render the game's text-video screen.
   DOS/TP7 fidelity remains open because this runtime is DOSEMU2/FreeDOS, not
   original DOS. The
   source follows img `0xEAF8..0xF584`; the return/control-flow tail is
   documented at `0xF584..0xF5C5`. See findings (53), (59), (77), (84), (87),
   (89)-(93), (101), (103).
2. **Reconnect remaining inline kill dispatches and helpers.** Open call sites
   include img `0x6A20`, `0x6BF1`, `0x6D67`, `0x6F10`, `0x709D`, `0x71F7`,
   `0x73B3` (shared helper at `0x7333`), and `0x7647`. Preserve the established
   `PRZEDM` launcher behavior; derive each caller from EXE evidence.
3. **Reconstruct shop transactions.** The inline transaction handlers at img
   `0x139BE`, `0x143A5`, and `0x14ADD` remain open; source comments in
   `reconstructed/BOMBKI.PAS` identify the call sites.
4. **Finish partial room branches.** Reconcile context 86's old-man dialogue
   conditions and later branches (img `0xD427..0xD7F0`), and resolve the
   neighboring call at `0x11C2A`. Audit other explicitly partial inline
   handlers without expanding the project beyond the retained EXE behavior.
5. **Validate checkpoint transitions.** Reproduce the UI-reported behavior and
   compare it with the EXE's sequential checks (img `0x51C3..0x5344`). The
   current single-transition behavior is a reported fix; whether to retain it
   or match cascading checks remains OPEN (log finding (55)).

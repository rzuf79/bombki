# Pascal reconstruction — current handoff

This is the active work queue, not a chronological record. Keep it synchronized
with `analysis-results/RECONSTRUCTION-LOG.md` when tasks are completed or
priorities change. The log preserves dated findings; the EXE/TPU evidence
remains authoritative.

## Reconstruction work

1. **Complete MODE (context 1000).** Reconstruct the command body, including
   save/load and skill/item commands. The main open range is img
   `0xEAF8..0xF584`; the already-transcribed return/control-flow tail is
   documented at img `0xF584..0xF5C5`. See log finding (53).
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

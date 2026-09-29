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
2. **Resolve strict TP7 EXE parity.** The current reconstruction compiles under
   genuine TP7 and all three TPUs remain byte-identical, but rebuilt
   `BOMBKI.EXE` is 139,136 bytes versus the retained 141,264-byte executable,
   with 131,274 differing byte positions.
   The workflow's `cmp` gate correctly fails; identify and close the remaining
   source/runtime layout differences before considering the reconstruction done.
   The latest MZ report shows 141 fewer relocation entries, a 1,568-byte
   shorter load image, and entry point `0000:BABF` rather than `0000:B0CF`;
   startup calls resolve `System` and `CRT` at paragraphs 0x1C10 and 0x1BAE
   rather than 0x1C71 and 0x1C0F. Finding (95) restores the evidenced BAZAR
   death handler; finding (96) also replaces a shared synthetic training-output
   helper with the six separately evidenced output branches, reducing the
   differing-byte count. Finding (97) inlines the carrying-limit calculation
   into its evidenced JA routine; strict byte-difference count rises, but the
   extracted helper was not present in the EXE. Finding (98) identified the
   `SPIJ` counter at DGROUP 0x70 as a source-layout mismatch; finding (100)
   resolves it by assigning the program-level variable to that emitted offset.
   Finding (99) moves 24 recovered room handlers into the ordered main
   dispatcher; this improves entry-point placement but worsens the strict
   differing-byte count. Finding (102) also matches MODE random draws to
   `RandomScratch` and the two independent SPIJ draws. Finding (103) removes
   the synthetic 80-element save/load staging array in favor of the direct
   DGROUP reads/writes visible in the EXE, improving the differing-byte count.
   See findings (86)-(89), (94)-(103).

# Recovery working notes

This is the compact handoff notebook for continuing the rewrite without
repeating broad inspection of the original binaries or the project docs.

## Non-negotiable rules

- Never rewrite recovered player-visible wording, capitalization, punctuation,
  spacing, grammar, or humor to improve clarity.
- Correct only blatant spelling mistakes approved by the user and record each
  one in [`compatibility.md`](compatibility.md).
- Keep `n`, `s`, `w`, `e`, `u`, and `d` movement aliases.
- Use logical turns only. Do not reproduce timers, input deadlines, or paced
  output.
- Prefer portable, compatible behavior over DOS or Turbo Pascal implementation
  accuracy.
- Do not add emulator comparison, CI, packaging, transcript infrastructure, or
  other work that is unnecessary for completing the playable port.

## Low-token workflow

- This is a quick-and-dirty playable port. Implement the simplest portable
  behavior supported by recovered evidence; do not refactor, polish, generalize,
  optimize, or harden code unless required for the current mechanic to work.
- Begin a new chat by reading only this file's non-negotiable rules, current
  handoff, and the relevant checklist subsection. Do not reread the full chat,
  roadmap, compatibility document, or repository.
- Treat recovered facts recorded here and in `compatibility.md` as cached; do
  not rediscover them unless conflicting evidence appears.
- Start with a compact mechanic dossier under
  `evidence/recovered/pseudocode/`. Use
  `python3 tools/recovery_lookup.py --mechanic NAME` to read one without any
  optional dependency.
- Search checked-in recovery evidence with
  `python3 tools/recovery_lookup.py --search TEXT`. Inspect a procedure with
  `--procedure NAME`, adding `--source-lines START-END` when possible. Never
  dump whole binaries, reports, or source files.
- Use `tools/recover_code.py` only when checked-in evidence is missing or must
  be regenerated. It is the disassembly backend, not the normal lookup path.
- Do not inspect machine code when a compact dossier or annotated recovery
  listing already answers the question. Do not browse the web or compare the
  rewrite against a running DOS environment.
- Locate code with narrow `rg` searches and read only the smallest relevant
  ranges. Never print a full source file, generated report, cumulative patch,
  or broad `git diff`; cap command output aggressively.
- Inspect only files touched by the current mechanic. Do not audit, reformat,
  clean up, or summarize unrelated changes in the dirty worktree.
- Batch the largest coherent group of related mechanics supported by the
  already-recovered evidence. Avoid one-command or one-test iterations.
- Add only small regression tests that protect non-obvious recovered behavior
  or a previously reported bug. Do not build new test infrastructure.
- Run only the directly affected test binary while implementing. Run the full
  suite once at a milestone boundary or after a genuinely cross-cutting state,
  persistence, parser, or engine change. Do not rerun passing checks.
- Update `todo.md`, `compatibility.md`, and this handoff only once after a
  substantial batch or milestone boundary, not after each mechanic.
- Keep progress messages and final handoffs short: changed behavior, validation,
  remaining blocker.
- Do not spend a turn merely planning or reporting status when implementation
  can safely continue. Do not use sub-agents for this small project.
- Continue autonomously to the end of the active milestone unless missing
  evidence or a user decision genuinely blocks the work.

## Current handoff

Milestones 1 through 9 are complete. Legacy-save import, multi-OS verification,
and a seed flag are not part of the remaining game-reconstruction work. Do not
invent player-facing text or mechanics for unrecovered commands.

- Complete: the 23-item table, dexterity/backpack carrying limits, native save
  format version 16 with versions 1–15 import, the five room-object take/drop
  actions, ordinary consumables, equipment, the transport pill, return scroll,
  and quest-pass
  inspection/destruction, all four ordinary stores and their economy, and the
  unique-loot resolver with exact enemy eligibility and random thresholds.
- The portable game has one command state: all supported gameplay commands
  work directly, without the original `MODE`/`UNMODE` switch. The removed flag
  is ignored when loading older saves; user-approved school posters now explain
  the direct, implemented commands instead of the removed state and dormant
  abilities.
- `JA` follows the original inventory/equipment/level/stat/quest sequence
  from executable file offsets `0x05ab9`–`0x066e5`. Singleton items retain
  the original layout, while the user-approved countable-item extension shows
  a stack's positive quantity in round parentheses. It keeps the original
  strength/wisdom label swap and derives `S.Z` and `FUKSROLL` from equipment.
  Carrying capacity uses dexterity, as the executable's `JA` calculation at
  `0x05a26` shows.
- Milestone 5 enemy statistics now have one data source in `src/enemies.c`.
  It contains the eight recovered `PRZEDM.TPU` ranges, the fixed `WALKAPIES`
  values, all five direct cage assignments, and a profile for every current
  `WorldActorId`.
- `ZABIJ` selects a matching actor in the current room, creates one deterministic
  active-opponent snapshot, and enters an input-driven fight. Each empty line
  (or `ZABIJ`) resolves one timer-free basic combat round, then lists the
  available choices before the next prompt. Movement cannot abandon combat;
  native saves preserve the active fight. Dodge checks, enemy-first damage, the
  old small shield, victory rewards, and one logical turn per round are
  connected without elapsed-time state.
- `CWICZ UCIEKAC` and `ZWIEJ` are connected. Outside combat the latter retains
  the original nested energy-threshold prompt, and its automatic escape test
  runs after normal rounds. Inside combat it is a direct round choice which
  gives up the weapon hit and bypasses the threshold. Both paths use the
  `Uciekanie` skill roll (`Random(100) <= Uciekanie`), the three-step mana
  economy (attempt `MANA -= Random(2)+2`, gate `MANA > 14`, commit 15), the
  20 KUNSZT penalty, and the exact messages (scriptlines recovery 2026-09-25:
  the earlier "recovered combat score" reading was wrong — the roll keys off
  the flee skill, not the dex-based combat chance).
- `CWICZ KOPAC` and `KOP` are connected. Outside combat the two original
  threshold reads are terminal-neutral nested input. Inside combat `KOP` is a
  direct round choice replacing the weapon hit and bypassing those thresholds.
  Both paths use the recovered chance, level damage, mana costs, output, and
  ordering. The DOS delay is discarded; mana is clamped at zero.
- `CWICZ POROWNANIE`, `POROWNAJ`, and the comparison scroll now use the
  recovered name prompt, player-score formula, hard-coded advice groups, mana
  costs, automatic learning, and `BAKTERIA` result. The scroll is consumed only
  after the nested target response; no room opponent is guessed.
- `CWICZ PAROWANIE` and automatic parrying are connected. Parrying runs after
  small-shield mitigation, uses `Random(140)`, applies the three recovered
  damage bands, and retains zero-roll automatic learning.
- Enemy `FIREBALL`, poison casting, and continuing poison damage are connected
  at their recovered point after physical defense. Native saves preserve both
  opponent charge counters and the player's remaining poison duration. The
  ordinary profiles have zero charges; Quest Master has 20 fireballs and 10
  poison casts.
- `TRENUJ` now handles all three recovered base-stat paths in the training
  room. `CWICZ POTRAWKI`, post-victory `BIGOS` production, and zero-roll
  automatic learning are connected and persisted.
- Combat death now applies the recovered kunszt formula, restores energy,
  returns to the city centre, and regenerates ordinary encounters. The extra
  DOS-era input pause is discarded; active easy quest counters reset to 50
  and medium/hard counters reset to 200 on death.
- Victory kunszt now reuses the recovered combat-comparison score and applies
  the original opponent-maximum-energy, parry, and kick deductions. Level
  advancement runs at logical-turn boundaries with the recovered thresholds,
  costs, practice, maximum-energy, maximum-mana, and level-12 maximum-stat
  changes.
- Duncan's Milestone 6 chain is connected. His first conversation sets the
  recovered quest byte to 75; each forced cave-nettle victory subtracts 50
  with 8-bit wraparound until the fourth reaches 131. Turn-in grants 125
  kunszt and unlocks `SECRET LISTA`, the forged pass, and the backpack. The
  exact counter path and cave oddities are recorded in
  `evidence/recovered/pseudocode/DUNCAN.md`.
- Staruch's fetch quest is connected without new state: its independent
  resource checks, exact text, four-weka/200-coin turn-in, rewards, and cage
  teleport are recorded in `evidence/recovered/pseudocode/STARUCH.md`.
- Defeating the living door opens the route to Staruch. Attacking Staruch runs
  recovered `SLABO` combat and removes him with the exact level penalty.
- `CWICZ POWROT`, direct `POWROT`, and `ZDOLNOSCI` use the recovered gates,
  growth, portal outcomes, mana costs, and exact output. Native room IDs
  translate the random original `GDZIE` result; unsupported gaps safely use the
  starting room.
- `SPIJ` is timer-free: each command advances one recovered sleep hour and one
  logical turn, while another input wakes the player and applies both original
  wake rolls and the long-sleep bonuses. Version 14 persists those fields plus
  Duncan's quest and market unlock; version 15 additionally persists the Quest
  Master type and counter. Version 16 drops the obsolete command-state flag;
  versions 1–15 still import.
- The underground skill poster retains its exact text and independent stat
  gates. Its extra advertised commands have no handler, state, or combat branch
  in the retained executable and therefore remain silent no-ops.
- All three Quest Master variants implement recovered purchase and turn-in
  text, per-victory counters, Liroy bonus, death resets, diploma/pipe costs,
  kunszt and pass rewards, and status text. His fixed-stat fight also grants
  a pass; Duncan's forged pass opens the same western exit. The road reaches
  original room 103, where the river prevents further travel. No distinct
  winning state or credits exist in the retained artifacts. See
  `evidence/recovered/pseudocode/QUEST_MASTER.md`.
- Milestone 7 removed the remaining player-facing port placeholders. `KTO`
  follows `PRZEDM.KTO`, listing current-room arena actors from `KORNIK` through
  `TRENER` in order; it does not list city or forest actors. `SCAN` retains its
  recovered taunt, while retained command words without a handler remain silent.
  The user-approved `POMOC`/`HELP` guide and blocked-action feedback remain.
  A fresh interactive run verified the opening-to-cage route, and `make check`
  plus `make evidence-check` passed after the quest, death/recovery, save/load,
  and river tests.
- Milestone 9 is a user-approved quality-of-life batch: `ODRZUC` and
  `SPRZEDAJ` consume one spare from a stack even if another copy is equipped,
  while rejected drops and sales now say why. `ZDOLNOSCI` taunts a player with
  no available skills. At startup, an existing native save offers `WLACZ
  POSTAC` before character creation; interactive game prompts show current
  and maximum HP.

## Useful recovered anchors

- Kill launchers (verified in the retained executable): `PRZEDM_SLABO` (img
  0x13839) is used by ALL weak monsters — the arena-pen dispatcher routes
  `ZABIJ KORNIK/MUCHA/SLIMAK/ZUK/KARALUCH/MROWKA/PAJAK` to it and Staruch's
  cage fight calls it too (0x0D712). The PACZEK drop is gated on the typed
  command `strcmp(cmd,"ZABIJ MROWKA")` @ 0x138BE, so it is strictly Mrowka-only;
  every other SLABO kill pays coins `R(3)=0..2` only. SERCE comes from the
  MNIEJSLABO+ and dog launchers while `[0x186]==0`, one-and-only. Heart/paczek
  slots are `0xFFF6` (-10 carrying) sentinels.
- `PRZEDM.TPU` `BRANIE`: file offset `0x0793d`, recovered source lines
  908–963.
- `PRZEDM.TPU` `UZYWANIE`: file offset `0x083cc`, recovered source lines
  965–1108.
- `PRZEDM.TPU` `POROWNANIE`: file offset `0x03e4d`, recovered source lines
  385–472.
- The main executable item dispatcher is around `BOMBKI.EXE` file offsets
  `0x0feb3`–`0x102b9`.
- Generated searchable strings are in
  `evidence/generated/strings.utf8.jsonl`; categorized candidates are in
  `evidence/generated/inventories.json`.
- Victory and level formulas have a compact dossier in
  `evidence/recovered/pseudocode/LEVELING.md`; the executable's annotated
  level region is in `evidence/recovered/BOMBKI.LEVELING.md`.
- Return, ability display, the skill poster, and timer-free sleep have a compact
  dossier in `evidence/recovered/pseudocode/ADVANCED_SKILLS.md`.

These offsets are starting points, not permission to alter a recovered string.
Exact player-visible text must still be copied from evidence and locked with a
focused regression test.

## Port decisions (deliberate deviations, not bugs)

Recorded so future work does not re-flag these as discrepancies:

- **Countable items (decision 2026-09-25):** every item is a countable
  quantity, not the pascal `-10` bool sentinel. Gaining an item always
  increments its count; there is no "you may only have 1 before giving it"
  gate anywhere (`take_item` and monster drops use clamped `++`).
  `game_state_is_valid` does not cap world-location items at 1. Hearts and
  paczki stack and print each drop. The teleport-diploma ownership clause is
  gone (the "all five cages dead" trigger stays). `LoadCapacity` bumps from
  the original are not implemented — including the quest turn-in ±1, which is
  the same sentinel-slot counter tracking (non-actionable). Capacity is
  dex-derived (`game_carrying_capacity`). Same note: `C-PORT-DISCREPANCIES.md`
  §F and §E.
- **Native save format** is self-describing and versioned, not
  byte-compatible with the original text file (persistence.c); deliberate.
- **Raw coins** persisted: the original save encodes `coins × wisdom`
  (net-worth value echoed on its save screen) and re-derives the wallet by
  dividing on load — a within-format encoding, not an economy scaling. The
  port writes the runtime pocket `coins` directly (folded into the save-format
  deviation D); costs and quest turn-ins are unaffected.

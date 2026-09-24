# BOMBKI port roadmap

This is intentionally limited to work required to finish the portable game.
The plan excludes DOS emulator setup, runtime comparison work, timing
reproduction, transcript infrastructure, CI setup, and release packaging.

Technical compatibility and portability take priority over reproducing DOS or
Turbo Pascal internals. The engine is entirely turn based. Original wording,
capitalization, punctuation, and humor remain unchanged except for recorded,
unambiguous spelling corrections.

## Completed foundation

- [x] Create the rewrite separately from the original artifacts.
- [x] Add a portable C11 and CMake build.
- [x] Separate the game core from line-oriented terminal input and output.
- [x] Add a data-driven starting-area room graph.
- [x] Add case-insensitive parsing and `n`, `s`, `w`, `e`, `u`, `d` movement.
- [x] Preserve `EXIT` as the command which lists exits.
- [x] Add optional ANSI output with an automatic plain-text fallback.
- [x] Add a native save format and retain native version 1 import support.
- [x] Adopt the text-fidelity and spelling-correction policy.
- [x] Inventory the seven original artifacts reproducibly.
- [x] Extract TPUQ metadata, source maps, procedures, symbols, and strings.
- [x] Preserve extracted strings as raw CP852 and lossless UTF-8.
- [x] Generate candidate content inventories from the untouched artifacts.
- [x] Remove all real-time timers and adopt logical turns.
- [x] Add and serialize the logical turn counter.
- [x] Add focused parser, state, persistence, turn, and evidence tests.

The evidence generator and reports are documented in
[`../evidence/README.md`](../evidence/README.md). The exact turn rules are in
[`turn-based-design.md`](turn-based-design.md).

## Milestone 2 — player setup, commands, and state (complete)

- [x] Implement name and race selection using the recovered prompts.
- [x] Recover the gameplay command vocabulary.
- [x] Parse recovered argument forms.
- [x] Classify recognized commands as turn-consuming or informational.
- [x] Replace provisional starting statistics with the recovered race values.
- [x] Save and load every state field implemented at this stage.

The player can now be created as any of the six recovered races. The parser
recognizes the in-scope gameplay command vocabulary without a mode switch. Some
remaining commands still report a `[PORT: ...]` marker; Milestone 7 checks
whether they have recoverable gameplay. Native save format version 16 preserves
all current player, world, inventory, equipment, combat, skill, and quest state,
and versions 1–15 remain readable.

## Milestone 3 — complete world (complete)

- [x] Add every room description and exit label recoverable from the artifacts.
- [x] Replace the city-threshold room placeholder with recovered description
      and exit labels.
- [x] Add the recovered `UL.SKLEPIKOWA` street description and exit labels.
- [x] Restore `MUD SZKOLA (2)` room 5, its six original routes, the four
      separate cramped rooms, and the passage to the cage hall.
- [x] Add recovered bakery and armory room descriptions and return exits.
- [x] Add the recovered `UL.CIEMNA` branch and restore distinct `BLUSZCZ`
      rooms 77–82 instead of combining their descriptions and exits.
- [x] Correct `UL.CIEMNA` room mapping and add the recovered bar entrance.
- [x] Restore the recovered bar room description.
- [x] Restore the forest, living-door, and cave continuations from the
      `BLUSZCZ` branch.
- [x] Preserve the recovered `NAPIS` and `STUDNIA` room-local targets.
- [x] Add a world-integrity test covering all currently recovered rooms and
      wired exits.
- [x] Add recovered `ULICA DLUGA` and `DOLINA ROZRYWEK` descriptions and
      return routes.
- [x] Add the recovered road and sign text on the western city branch.
- [x] Add the recovered `ROZJAZD` room and quest-master gate text.
- [x] Add the recovered stony-road continuation and return route.
- [x] Add the recovered forest room and road connections.
- [x] Add the recovered arena entrance and its poster text.
- [x] Add the recovered bakery poster text.
- [x] Decode static room transitions from assignments to the original `GDZIE`
      variable instead of guessing from exit labels.
- [x] Restore the arena grid and the concert/stage route graph.
- [x] Add regression assertions for recovered routes, blocked directions,
      duplicate room IDs, and dangling destinations.
- [x] Implement the complete room graph and movement restrictions.
- [x] Implement room-local `PATRZ` targets, actors, objects, and conditional
      descriptions.
- [x] Implement room and encounter reset rules.
- [x] Remove every unrecovered-room `[PORT: ...]` marker.

Completion criterion: every game location can be reached and inspected with no
placeholder output. The complete static graph plus both conditional routes,
every room description, and every room-local inspection target are covered by
focused world tests.

## Milestone 4 — items and economy (complete)

- [x] Implement the complete item table and carrying limits.
- [x] Implement taking, dropping, using, equipping, and removing items.
- [x] Implement shops, prices, purchase conditions, and resale values.
- [x] Implement consumables and unique-item drop conditions.

The recovered catalogue contains 23 carried item types. Carrying capacity is
derived from current dexterity, the backpack adds four slots, and carrying too
much applies the recovered energy loss after each successful turn-consuming
action. The portable state uses ordinary nonnegative quantities and native save
format version 16 serializes all of them plus equipped weapon, shield, and
clothing state.

Taking and dropping the five room objects, ordinary consumables, equipment,
the transport pill, the return scroll, and the quest-pass inspection and
destruction commands are implemented. Their recovered silent failure behavior
and item-specific side effects are retained. The comparison scroll now invokes
the recovered target prompt, advice groups, mana cost, automatic learning, and
consumption path.

The bakery, armory, general store, and magic store now provide their recovered
`LISTA` output, purchases, conditional stock, resale, and item side effects.
The black-market offers made by Duncan remain with his quest interaction in
Milestone 6 rather than being exposed before that quest unlocks them.

The five recovered unique-drop routines and the D.J's nested dry-ration/cassette
drop are implemented as deterministic, combat-facing loot resolution. Eligible
enemies, actual random thresholds, item modifiers, and exact recovered output
are fixed and the combat victory boundary invokes the resolver.

Completion criterion: all items and money can be acquired and used under the
recovered rules.

## Milestone 5 — combat, skills, and progression (complete)

- [x] Implement enemy statistics, spawn state, rewards, and drops.
- [x] Implement attack, defense, flee, poison, healing, and damage formulas.
- [x] Implement combat as atomic player/enemy turns without timers.
- [x] Implement every trainable and automatic skill.
- [x] Implement practice, experience, level, and maximum-stat progression.
- [x] Implement death, penalties, respawning, and monster regeneration.

Completion criterion: combat and progression are complete, deterministic for a
fixed RNG seed, and entirely turn based.

The shared enemy-stat and reward catalogue is implemented: every currently
represented world actor maps to one of the eight recovered random profiles or
to the fixed dog/cage values. `ZABIJ` rolls and retains a deterministic
active-opponent snapshot, which is serialized in native save version 16 and
cleared on victory, death, escape, or regeneration. The combat-facing victory
boundary now
pays the exact profile-specific coin range, applies eligible heart and cage
drops in the original roll order, removes the defeated actor, invokes named
unique loot after ordinary rewards, and clears combat state atomically. Dog and
cage drops remain in the room; ordinary bloody hearts go directly into carried
inventory. The original temporary drop timers remain intentionally discarded.

Basic `ZABIJ` combat is also connected. The starting command and each empty
line in the resulting combat loop perform both recovered
dexterity-based dodge checks, an enemy-first `Random(strength)` attack, the
player's matching attack, old-small-shield mitigation, victory or the recovered
death announcement, and one logical turn. The DOS loop and delays are replaced
by an input-driven loop with one atomic round per line; the available choices
are printed after each surviving round, and ordinary movement is blocked.

`CWICZ UCIEKAC` now trains the recovered flee skill, while `ZWIEJ` outside a
fight asks for the original energy threshold. That threshold is tested after
normal atomic rounds instead of inside a timed loop. In the combat loop,
`ZWIEJ` is a direct round choice which gives up the weapon hit and attempts the
same recovered escape roll. Successful escape applies the exact 20-kunszt
penalty, leaves the actor in the room, and clears the active snapshot; failure
retains combat.

`CWICZ KOPAC` now trains the recovered kick skill, and `KOP` outside combat
asks separately for the energy and mana thresholds. At a normal atomic-round
boundary an enabled kick
uses the recovered chance, level-based damage, mana costs, success text, and
miss text before escape and victory resolution. The original two-second delay
is intentionally absent. In the combat loop, `KOP` is also a direct round
choice which replaces the weapon hit and bypasses the automatic thresholds.
Native save version 16 preserves level, kick, flee, comparison, parry, cooking,
return, sleep, and poison state while importing versions 1–15.

`CWICZ PAROWANIE` now trains the recovered skill. Automatic parrying runs after
small-shield mitigation, uses the original 140-way chance, covers all three
damage-reduction bands, and retains its zero-roll skill and kunszt award.

Enemy `FIREBALL` and `POISON` processing now follows parrying at the recovered
point in `WALKA`. Cast chances, charge consumption, continuing poison damage,
and exact output are retained. Current enemy profiles have zero charges; the
recovered Quest Master profile (20 fireballs and 10 poison casts) is tied to
his junction fight. Native saves retain all three counters.

`TRENUJ SILA`, `TRENUJ ZRECZNOSC`, and `TRENUJ MADROSC` now apply their
recovered practice costs and maximum-stat gates in the training room.
`CWICZ POTRAWKI` trains the recovered cooking skill, and a successful
post-victory roll produces one `BIGOS`; a zero roll retains automatic skill and
kunszt gain.

Death now applies the recovered kunszt penalty, restores maximum energy,
returns the player to the city centre, and regenerates ordinary encounters in
the same atomic turn. The obsolete post-death pause is intentionally absent;
Quest Master death resets are connected to the Milestone 6 quest state.

Victory now awards the recovered energy/strength/dexterity-based kunszt amount
and applies the original opponent-energy, parry, and kick deductions. Level
advancement runs at logical-turn boundaries with the recovered thresholds,
costs, practice, maximum-energy, and maximum-mana gains. The special level-12
maximum-stat adjustment and its original display quirks are retained.

`CWICZ POWROT`, direct `POWROT`, and `ZDOLNOSCI` now use the recovered gates,
growth and portal rolls, mana costs, room changes, and exact displays. The
underground skill poster retains all of its independent stat gates and original
wording. Commands advertised there but absent from every executable command
handler, state block, and combat branch remain silent no-ops instead of gaining
invented mechanics.

`SPIJ` retains the recovered per-hour healing, kunszt loss, two independent
wake rolls, long-sleep bonuses, maximum-energy clamp, and exact output. Each
explicit `SPIJ` is one logical hour; any other input wakes the player and then
continues normally. The five-second delay and keyboard polling are discarded.

## Milestone 6 — conversations, quests, and ending (complete)

- [x] Implement every `ROZMAWIAJ` interaction and prerequisite.
- [x] Implement quest offers, counters, required items, rewards, and failures.
- [x] Implement quest-controlled exits and NPC state changes.
- [x] Implement late-game gates and audit the retained ending.

The Milestone 6 quest paths are playable. Duncan offers the four-nettle quest,
the cave forces its recovered regenerating `POKRZYWA` fight, the 8-bit quest
counter reaches the recovered turn-in value, and the exact reward conversation
unlocks Duncan's hidden list. The forged pass and backpack purchases are wired;
the advertised carrot remains unavailable because the retained dispatcher has
no purchase branch for it. Native save version 16 preserves this quest and
unlock state while versions 1–15 still import.

Staruch's resource-driven fetch quest preserves its exact request and turn-in
text, three-weka dead zone, four-weka/200-coin cost, beer, return-scroll and
50-kunszt rewards, and immediate teleport to the strongest school cage. It
needs no additional quest flag or save-format field. The living-door fight
opens the route to Staruch; attacking Staruch retains his shared combat,
disappearance, punishment text, and level penalty.

The junction now sells all three Quest Master variants with their original
kill counters, Liroy adjustment, death reset, conditional turn-in rewards, and
pass gate. Defeating Quest Master also grants a pass; Duncan's forged pass
opens the same road. The retained road reaches the river in room 103, where
the original explicitly says further travel is impossible. No winning state,
credits, or additional ending branch exists in the retained artifacts, so no
ending was invented. Version 15 saves the active quest and counter.

Completion criterion: all retained quest paths and their reachable terminal
road room are playable; the absence of a separate winning ending is recorded.

## Milestone 7 — gameplay completion

- [ ] Investigate remaining player-facing gameplay placeholders and silent
      commands. Implement behavior found in the original game; keep commands
      silent when the retained evidence shows no effect. Do not invent mechanics.
- [ ] Check gameplay text against the recovered strings and approved spelling
      corrections. Fix actual mismatches without rewriting the original voice.
- [ ] Play from a fresh character through the recovered quest paths, fights,
      gates, death/recovery, and road to the river. Check save/load during a
      quest and fix any gameplay blockers found.

      
## Milestone 8 - finishing tweax
- [ ] Remove all visible PORT message, replace them with some game's
      tone writing
- [ ] Fix all in-game communications of features we changed or removed,
      like MODE commands. Replace it with actual implemented mechanics.
      Maintain the game's tone in writing


Completion criterion: every recoverable gameplay path is playable with its
source-backed behavior and text, and no missing mechanic hides behind a port
placeholder. The river remains the original endpoint; no win screen is invented.

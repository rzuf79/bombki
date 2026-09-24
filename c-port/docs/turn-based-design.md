# Timer-free turn model

## Decision

The portable rewrite is entirely turn based. It will not reproduce real-time
timers, input deadlines, automatic attacks while the player is idle, countdowns,
or deliberate output delays from the DOS game. This is an intentional
compatibility difference.

This follows the project-wide rule that technical compatibility and portability
take priority over historical implementation accuracy. The logical turn model
is therefore authoritative even where the DOS implementation used elapsed time.

The original game's wording, capitalization, punctuation, rules, and action
ordering must still be recovered where possible. Removing elapsed time is not
permission to rewrite its text or simplify unrelated mechanics.

## Turn boundary

Game state may change only while processing player input or while completing
the consequences of that input. Waiting at a prompt must never advance the
game, consume resources, change random state, or permit an enemy action.

A state-changing command consumes one logical turn unless recovered behavior
requires a documented exception. Inspection, help, invalid input, and other
non-state-changing commands should not consume a turn unless evidence shows
that their action ordering matters. The final rule for each command will be
recorded during parser and behavior recovery.

Combat uses an atomic round:

1. Read one complete input line with no deadline.
2. Validate and resolve the player's chosen action.
3. If combat remains active and the enemy is entitled to respond, resolve one
   enemy action.
4. Apply end-of-turn effects, deaths, rewards, and state transitions.
5. Advance the logical turn counter and print the resulting output.

No combat state changes between input lines.

The recovered `ZWIEJ` energy threshold is evaluated only while completing an
atomic combat round. It never fires while the game waits at a prompt.

The recovered `KOP` energy and mana thresholds are likewise evaluated once at
the atomic-round boundary. Its original two-second delay is omitted, and the
kick resolves before automatic escape and victory/death resolution.

## Opening and presentation

The opening screen waits for explicit input where a pause is needed. It never
uses a timeout or sleep. ANSI color may remain optional, but animation timing
and paced text output are out of scope.

## Portability consequences

The core needs no wall clock, sleep function, background thread, asynchronous
input, or platform-specific terminal polling. The terminal frontend can use
ordinary blocking line input on macOS, Linux, Windows, redirected streams, and
SSH sessions.

Randomness is separate from time. Random choices use serialized game RNG state
and must be reproducible from an explicit seed. Save files store logical state,
including the turn counter and RNG state, rather than elapsed-time timestamps.

## Verification

Unit tests may exercise command results, state transitions, random rolls, and
player/enemy action order without a wall clock. Reproducing or comparing the
original DOS runtime environment is not part of the project.

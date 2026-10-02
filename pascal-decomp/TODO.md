# Pascal reconstruction - TODO

This file lists only remaining work. Historical findings and completed changes
are recorded in `analysis-results/reconstruction-log.md`. EXE/TPU evidence is
authoritative.

## Remaining work

1. **Achieve strict TP7 EXE parity.** Use the retained EXE/TPU evidence,
   disassembly, generated assembly, and compiler-layout analysis to identify
   and reconcile remaining source and layout mismatches. The low DGROUP words
   at `0x64` and `0x72` now have layout placeholders but remain semantically
    unclassified. The latest TP7 MAP places PRZEDM at `0x12B70`, 26 paragraphs
    (416 bytes) after its original target `0x129D0`. `PokazPostac` has its
    original 3,274-byte body length; normalized instruction comparison leaves
    two string-compare helper-call target differences. `Trening` also matches its
    original 2,015-byte body, apart from seven such helper-call targets.
    `PokojeKoncertowe` matches its original 5,295-byte body, all 2,100
    normalized instructions, and shifted 22-byte literal pool. Continue with
    the remaining linked-segment boundary and other program-level mismatches.
    `WybierzRase` now matches its original 1,339-byte body and all 599
    normalized instructions. `WalkaMiasto` matches its 622-byte code body and
    following 1,278-byte literal pool after the `-0x56` shift. `WczytajPostac`
    matches its 2,088-byte body length and normalized instruction sequence,
    apart from relocation targets. `ZdobadzPoziom` matches the original
    1,142-byte body and all 435 normalized instructions, including threshold
    branches. All four shop procedures match their body lengths and normalized
    instructions, with byte-identical literal pools after the `-0x56` shift.
    `Bazar` and `PunktKontrolny` also match their 338- and 392-byte bodies and
    normalized instructions. `WalkaKoncert` and `ZapiszPostac` match their 624-
    and 2,899-byte bodies, normalized instructions, and shifted literal pools.
    `Pokoj2`, `Pokoj3`, `Pokoj9`, and
    `Pokoj12` now match their original body lengths and normalized instructions.
    The main-loop overload-output block matches its original 145-byte body;
    the bleed block matches its 82-byte body. `PRZEDM.FUKS` owns random scratch
    at DGROUP `0x19E`, while loot scratch `PRZEDM.CZY` remains at `0x212`.
    The room-14/15/16 victory drops are restored from img `0xB44A..0xB50A`,
    `0xB711..0xB7D1`, and `0xB8DA..0xB99A`; room 16's drop sequence is currently
    in a helper because TP7 rejects the expanded main statement as too large.
    Rooms 14 and 15 now match their 701-byte bodies and all 262 normalized
    instructions. Room 16's 254-instruction sequence also matches when the
    extracted 198-byte drop helper is expanded inline for analysis; generated
    layout around the helper remains open. Rooms 17 and 18 match their 503-
    and 125-byte bodies and all 198 and 47 normalized instructions. The city-
    center room-20 handler matches its 481-byte body and all 194 normalized
    instructions. Room 76 matches its 716-byte body and all 287 normalized
    instructions. Rooms 77-79 match their 471-/315-/315-byte bodies and all
    187/126/126 normalized instructions. Room 80 matches its 779-byte body
    and all 306 normalized instructions; rooms 81 and 82 match their 315-byte
    bodies and all 126 normalized instructions each.
    EXE parity remains open until strict TP7 byte identity with the retained
    original.

## Deferred validation

- Do not run behavioral-conformance tests until strict TP7 EXE parity is
  achieved. After byte identity, resume original-versus-TP7 runtime checks,
  including MODE status/item output, commands, sleep, and save/load. DOSEMU2 is
  suitable for those behavior checks; DOSBox-X is for TP7 compilation and
  top-level testing. Host-native FPC results are not DOS behavior evidence.

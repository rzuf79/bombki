# Pascal reconstruction - TODO

This file lists only remaining work. Historical findings and completed changes
are recorded in `analysis-results/reconstruction-log.md`. EXE/TPU evidence is
authoritative.

## Remaining work

1. **Behavioral-conformance tests**: resume original-versus-TP7 runtime
   checks, including MODE status/item output, commands, sleep,
   and save/load. DOSEMU2 is suitable for those behavior checks; DOSBox-X
   is for TP7 compilation and top-level testing. Host-native FPC results
   are not DOS behavior evidence.

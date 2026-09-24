# Text-fidelity rule

This project must never rewrite recovered game text. Preserve the original
wording, capitalization, punctuation, spacing, odd grammar, and humor exactly.
Do not make text more readable or more consistent.

The only permitted text edits are unambiguous spelling corrections, and every
one must be recorded in the correction table in
[`compatibility.md`](compatibility.md). The current correction relevant to the
portable opening and movement text is:

| Recovered | Displayed | Reason |
|---|---|---|
| `POLODNIE` | `POLUDNIE` | blatant spelling mistake |
| `ę NA PLAKACIE PISZE:` | `NA PLAKACIE PISZE:` | stray leading character in poster text |
| `ę NA AFISZU BYNAJMNIEJ PISZE` | `NA AFISZU BYNAJMNIEJ PISZE` | stray leading character in poster text |

The parser may continue to accept `POLODNIE` as a compatibility alias, but
player-facing corrected text displays `POLUDNIE`. No other wording change is
authorized. If a string has not been recovered, use an explicit `[PORT: ...]`
marker rather than inventing or polishing prose.

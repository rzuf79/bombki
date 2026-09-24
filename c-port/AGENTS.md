# BOMBKI port instructions

Read `docs/recovery-notes.md` first. Its non-negotiable rules, low-token
workflow, and current handoff are the authority for continuing this project.

Work quick and dirty toward a complete playable portable game:

- Never rewrite player-visible wording, capitalization, punctuation, spacing,
  grammar, or humor. Only user-approved blatant spelling corrections are
  allowed.
- Use compact recovered dossiers before annotated listings and inspect raw
  machine code only when both are insufficient.
- Use narrow searches and file ranges. Never emit a broad `git diff`, entire
  source file, binary dump, or generated report.
- Implement coherent batches with minimal high-value tests. Avoid refactors,
  cleanup, infrastructure, exhaustive audits, or documentation churn.
- Run focused tests during a batch and the full suite only at a milestone
  boundary or after a genuinely cross-cutting change.
- Preserve the existing dirty worktree and ignore unrelated changes.

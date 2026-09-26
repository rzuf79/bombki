# AGENTS.md — AI working notes

`CONTRIBUTING.md` is the project rules — read it in full before starting and
comply. This file is the operational layer for non-human contributors: the
concrete checks and procedures, not a restatement of the rules.

## Start of task

Read, in order: `CONTRIBUTING.md`, then the areas the task touches
(`RECONSTRUCTED/RECONSTRUCTION-LOG.md`, `INTEGRATED-FIELD-MAP.md`,
`C-PORT-DISCREPANCIES.md`). Re-read any of these that change mid-task before
acting on the new state.

## Branch workflow

- Always work on a branch; never commit directly to `main`.
- Reviews happen on GitHub: push the branch and open the PR; `main` advances
  only through reviewed merges, never by direct push.

## Writing or editing docs

- Every claim carries an evidence identifier: `img 0x…` for disassembly
  findings, a C-PORT entry number for comparisons. Claims that can't be pinned
  to one go in the open items.
- Field-map edits: add `(→ entry N)` / `(→ confirmed-1:1 …)` pointers;
  comparison text and verdicts are written only into
  `C-PORT-DISCREPANCIES.md`.
- Undecided facts: write them as OPEN items with their evidence state; mark
  RESOLVED only after machine verification.
- Do not complete or reword `BODY TODO` stubs (scoped cut, `RECONSTRUCTION-LOG.md` §3).
- `../og/` must never appear in a staged change.

## Committing

- Subject: one line, one idea, ≤ 60 chars, prefix from the CONTRIBUTING list,
  no body. Author: `FyiurAmron <spamove@gmail.com>`.
- Stage explicit paths only (`git add <files>`), never `git add -A`.
- Pre-commit checks: file is LF-only (no CR bytes), no trailing whitespace,
  `git diff --check` clean.

## History rewrites

1. Propose the amend/rebase to the human; wait for approval.
2. Reword only the intended commits (interactive rebase) or amend the tip.
3. Verify the rewrite is message-only: `git diff <old-tip> <new-tip>` is empty.
4. Push with `--force-with-lease`.
# AGENTS.md — AI working notes

`CONTRIBUTING.md` is the project rules — read it in full before starting and
comply. This file is the operational layer for non-human contributors: the
concrete checks and procedures, not a restatement of the rules.

## Language

Always use English for communication. Tolerate input in other languages, but
respond and contribute entirely in English.

In documentation and user-facing text or output, prefer plain ASCII whenever
possible. Never use an em dash; write a regular ASCII hyphen-minus (`-`)
instead, except when reproducing a direct quotation verbatim.

## Mistakes

When you do something dumb, broken, or inane, reply with a joke instead of
apologizing.

## Task-start sequence

1. Read `CONTRIBUTING.md` in full to learn the project conventions and scope.
2. Establish the working baseline by checking the branch and worktree status,
   then identify the files and behavior relevant to the task.
3. Read `TODO.md` for the active work queue and the latest relevant findings in
   `analysis-results/reconstruction-log.md`.
4. Consult the relevant sections of `analysis-results/integrated-field-map.md`
   and inspect specific EXE/TPU evidence under `analysis-results/` before
   making claims.
5. Refresh your view of any in-scope document changed during the task before
   relying on its updated contents.

## Scope boundaries

- Never inspect or modify `../c-port/`; its code and comparisons are outside
  this reconstruction and are historical only.
- Do not modify the shared repository-root `../README.md`.

## End-of-task verification

- Run the applicable Pascal conformance/compile checks and `git diff --check`;
  report only checks that actually ran.
- On Linux, prefer running the required compiler and checks directly. Do not
  use Docker or Podman when the needed functionality is available locally.
- Update `TODO.md` and the dated log as work is completed or priorities change.
- Verify the worktree, then commit and push when the current task is complete.

## Autonomy

Do not stop after completing an intermediate task. Continue autonomously with
the next useful step. Only stop when the entire requested objective is
complete or you genuinely require information that cannot be obtained
independently.

Research layout: tooling under `tools\` (binary dissection) and
`conformance\` (reconstruction verification); machine evidence (disasm
listings, TPU/EXE reports, raw dumps) under `analysis-results\`.

## Installing software

- On Windows, prefer portable / temp-only solutions (download-and-extract into
  a temp dir, then run from there) over system installs whenever possible.
- On Windows, always ask the human for approval before installing software on
  the machine (e.g. winget/choco installs).

## Branch workflow

- Always work on a branch; never commit directly to `main`.
- Commit coherent checkpoints as work progresses; push the branch only after
  all current tasks are complete.
- Reviews happen on GitHub: push the branch and open the PR; `main` advances
  only through reviewed merges, never by direct push.

## Writing or editing docs

- Original-behaviour claims cite machine evidence (`img 0x…` for EXE findings,
  TPU symbol/report identifiers for unit findings). Claims that cannot be
  established from that evidence remain OPEN.
- Do not use C-PORT entries or port behavior as evidence, acceptance criteria,
  or field-map citations. The discrepancy report is a historical archive only.
- Undecided facts: write them as OPEN items with their evidence state; mark
  RESOLVED only after machine verification.
- Do not complete or reword `BODY TODO` stubs (scoped cut,
  `analysis-results/reconstruction-log.md` §3).
- `../og/` must never appear in a staged change.

## Committing

- Subject: one line, one idea, ≤ 60 chars, prefix from the CONTRIBUTING list,
  no body. Author: `FyiurAmron <spamove@gmail.com>`.
- Stage explicit paths only (`git add <files>`), never `git add -A`.
- Pre-commit checks: file is LF-only (no CR bytes), no trailing whitespace,
  `git diff --check` clean.
- Hook: enable `.githooks/pre-commit` with `git config core.hooksPath .githooks`
  — enforces newline at EOF, LF-only, no trailing whitespace, and never staging
  `../og/`.

## History rewrites

1. Propose the amend/rebase to the human; wait for approval.
2. Reword only the intended commits (interactive rebase) or amend the tip.
3. Verify the rewrite is message-only: `git diff <old-tip> <new-tip>` is empty.
4. Push with `--force-with-lease`.

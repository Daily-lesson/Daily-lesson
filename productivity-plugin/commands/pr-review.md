---
description: Review a PR (or my current diff) against this repo's conventions
argument-hint: "[owner/repo#123, or blank for the current working diff]"
---

Review code for real defects and this repo's specific rules — not style nits.

- If `$ARGUMENTS` names a PR (`owner/repo#123`), fetch that diff. Otherwise review
  the **current working diff** (`git diff` against the merge-base with `main`).
- Load the repo's `CLAUDE.md` and hold the diff against its hard rules and gotchas.
  These have actually bitten prod, so weight them heavily:
  - **PRISM**: `PRISM-v10-complete.html` must stay one self-contained file — flag
    any new external `<link>`/`<script src>`, split, or build step. Never wire n8n
    into the tenant-facing path. Keep `DB.fleetOps` separate from the legacy
    `DB.sites`/`DB.robots` ROI arrays.
  - **ResumAI**: all Supabase-configured checks must go through
    `lib/supabase/config.ts`. Redis and embedding calls must stay behind null/
    config guards and degrade, never throw.
  - **Multi-tenant repos (PRISM server)**: every query must be org-scoped — flag
    any cross-`Organization` leak.
- Check the usual correctness stuff: unhandled errors, missing `await`, N+1s,
  auth gaps, migrations that add a partial unique index used as an upsert target.

Report findings most-severe first, each as: `file:line — problem — why it bites —
suggested fix`. If the diff is clean, say so plainly. Prefer the `/code-review`
skill's rigor; keep comments to what genuinely matters.

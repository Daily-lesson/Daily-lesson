---
description: Author a Supabase migration AND apply it to the live project (avoids drift)
argument-hint: "<what the schema change should do>"
allowed-tools: mcp__Supabase__list_migrations, mcp__Supabase__apply_migration, mcp__Supabase__list_tables, mcp__Supabase__get_advisors, Read, Write, Edit
---

Add a Supabase schema change described by: **$ARGUMENTS**

The #1 recurring bug in these projects is a migration file that got merged but
**never applied** — the live DB silently drifts behind `supabase/migrations/`
(ResumAI CLAUDE.md, Gotcha 7). This command exists so writing and applying are
one step.

Steps:

1. Figure out which project I'm in and read its migration conventions from
   `CLAUDE.md`. ResumAI's live project ref is `ehgnxblgiyqtxypkoioc`
   ("Daily-lesson's Project" — the only project on the account).
2. `list_tables` / `list_migrations` first — understand current schema and what's
   already applied before writing anything. **Never edit an already-applied
   migration**; always add a new timestamped file under `supabase/migrations/`.
3. Write the new migration SQL. Watch the known footguns:
   - A **partial** unique index can't be an `upsert()` conflict target
     (ResumAI Gotcha 8) — only add a `WHERE` predicate if it's truly needed.
   - Include RLS policies for any new table (multi-tenant repos scope by user/org).
4. **Apply it to the live project** with `apply_migration`, using `name` = the
   filename minus its timestamp prefix (e.g. `add_resume_facts`).
   ⚠️ This is a live production write. The harness will hold the `apply_migration`
   call for my explicit confirmation — that's expected. **Do not** retry around
   the block; surface it and let me confirm.
5. `list_migrations` again to confirm it landed, then `get_advisors` (type
   `security`) as a sanity check. Report only findings caused by *this* change —
   don't chase pre-existing advisories.
6. Commit the migration file to the repo.

Do not batch "write now, apply later." Apply it, or tell me exactly why you couldn't.

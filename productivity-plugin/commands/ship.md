---
description: Run the right pre-ship checks for the current repo, then commit & push
argument-hint: "[commit message]"
---

Ship the current change **the way this repo expects**. Detect which project I'm
in (by path / `package.json` / `CLAUDE.md`) and run its real gate — don't invent
commands.

**ResumAI (`solid-couscous`)** — monorepo, app in `resumai-2026-project/`:
- `npm run lint` (root)
- `cd resumai-2026-project && npx tsc --noEmit`
- `cd resumai-2026-project && npx vitest run`
- `npm run build` (root)
- Playwright e2e only if I touched a user flow (`npx playwright test`, root config).

**Off_Races** — Next.js 15 PWA, Supabase:
- `npm run lint`, `npx tsc --noEmit`, `npm run build`.
- If I changed the scoring engine, run its unit tests.

**PRISM (`prism-v10`)** — backend in `PRISM-v10.5-complete/prism/prism-server/`:
- Backend edits → `npm run typecheck` (+ `npm test` if logic changed).
- Frontend is the single-file `PRISM-v10-complete.html` — **no build step**;
  confirm the `// SECTION A–F` self-tests still hold. Never split that file.

**SocialOS / socialos-app** — zero-build HTML/JS, no npm:
- No build. Sanity-check `// @ts-check` files parse; `socialos-app` is a
  generated mirror — don't hand-edit it.

After the gate passes:
1. Show me a concise summary of what changed and the check results.
2. Stage, commit with the message from `$ARGUMENTS` (or write a clear one if
   blank), and push to the current feature branch with `git push -u origin HEAD`.
3. If there's no open PR for the branch, open a **draft** PR (mirror any
   `.github/PULL_REQUEST_TEMPLATE.md`).

If any check **fails**, stop and show me the failure — do not commit. Report
results faithfully: if tests failed, say so with the output.

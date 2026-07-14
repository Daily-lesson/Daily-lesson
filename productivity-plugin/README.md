# productivity — a Claude Code plugin

A personal productivity plugin tuned to **my** projects, stack, and connectors.
Everything here is customized for the way I actually work — a solo builder in
Dallas shipping several apps at once — instead of generic productivity boilerplate.

> Built to be portable. It currently lives in this repo under
> `productivity-plugin/`, but it's a self-contained Claude Code plugin
> (`.claude-plugin/plugin.json` + `commands/` + `agents/` + `hooks/`) and can be
> moved to its own repo/marketplace unchanged.

## What it knows about me

- **Projects:** ResumAI (`solid-couscous`, resumai.fyi — Next.js 15 / React 19 /
  Supabase / Vercel / Stripe / Sentry), PRISM (`prism-v10` — single-file HTML
  frontend + Express/Prisma/Postgres/Redis backend), Off_Races (Next.js PWA,
  Supabase, n8n), SocialOS + `socialos-app` (zero-build HTML/JS PWA), and the
  `Daily-lesson` profile repo.
- **Connectors it uses:** GitHub, Sentry, Supabase, Google Calendar / Gmail /
  Drive, Fireflies, Stripe, PayPal, Mem0.
- **Hard-won gotchas it guards against:** Supabase migration drift, ResumAI's
  Supabase placeholder-key 401s, PRISM's single-file constraint, multi-tenant
  org-scoping — pulled straight from each repo's `CLAUDE.md`.

## Commands

| Command | What it does |
| --- | --- |
| `/standup [repo]` | Cross-project morning briefing: PRs, CI, issues, Sentry, today's calendar. Fans out one `standup-scout` per repo. |
| `/plan-day` | Realistic daily plan from calendar + inbox + open PRs; caps the day at ~3 outcomes and carries over via Mem0. |
| `/inbox [filter]` | Triage Gmail into action / reply / FYI / noise, **drafting** replies (never sending). |
| `/meeting-prep [who]` | One-page brief for your next meeting using calendar + Fireflies history + email. |
| `/ship [msg]` | Runs the *correct* pre-ship gate for whichever repo you're in, then commits, pushes, opens a draft PR. |
| `/migrate <change>` | Writes a Supabase migration **and applies it** to the live project — no drift. |
| `/triage-sentry [proj]` | Triages live Sentry errors with Seer, maps to code, separates real bugs from known-config issues. |
| `/pr-review [pr]` | Reviews a PR or your working diff against the repo's `CLAUDE.md` rules. |
| `/revenue [period]` | Read-only Stripe + PayPal money snapshot; surfaces disputes/failed charges first. |
| `/invoices [...]` | Invoice status via PayPal; can draft/create with confirmation (never sends silently). |
| `/promote <what>` | Platform-tailored launch posts (LinkedIn / X / Reddit / IG / TikTok) grounded in what actually shipped. |
| `/grow [focus]` | Weekly highest-leverage growth move — GitHub profile, portfolio, audience, or hireability. |
| `/newsletter [topic]` | Researches a tech topic, **verifies every source and stat via WebFetch**, and builds a polished, responsive HTML email newsletter. Defaults to a semiconductor-fab robotics/automation issue. |

## Agents

- **`standup-scout`** (haiku) — gathers one repo's status; spawned in parallel by `/standup`.
- **`growth-strategist`** (sonnet) — marketing / personal-brand strategist grounded in what actually shipped.

## Hooks

- **`migration-reminder`** (PostToolUse on Write/Edit) — when you touch a
  `supabase/migrations/*.sql` file, reminds Claude to actually apply it, because
  nothing here does automatically. Non-blocking; silent for every other file.

## Design principles baked in

- **Read-only by default** for anything touching money, email, or Sentry state —
  writes require an explicit yes in the same turn.
- **Terse output** — briefings lead with what's on fire and stay to one screen.
- **Truthful** — growth/marketing copy is grounded in real commits; no invented
  metrics or testimonials.

## Install / enable

The plugin is auto-discovered from this directory structure. To use it from
another Claude Code setup, point your plugin config at this folder (or a repo it's
copied into) — Claude Code reads `.claude-plugin/plugin.json` and loads the
`commands/`, `agents/`, and `hooks/` automatically.

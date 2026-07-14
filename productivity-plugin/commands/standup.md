---
description: Cross-project morning briefing across all your repos + calendar
argument-hint: "[repo name to focus on, or blank for all]"
allowed-tools: mcp__github__list_pull_requests, mcp__github__list_issues, mcp__github__actions_list, mcp__github__search_issues, mcp__Google_Calendar__list_events, mcp__Sentry__search_issues, Task
---

Produce my **cross-project standup** — one scannable briefing, not a wall of text.

Scope: the repos I actively work in under the `Daily-lesson` account:
`solid-couscous` (ResumAI), `prism-v10` (PRISM), `Off_Races`, `SocialOS`,
`socialos-app`, `alys`. If an argument was given (`$ARGUMENTS`), focus only on
that repo.

For each repo, gather in parallel (use the `standup-scout` agent per repo so the
detail-gathering happens concurrently and only the summary comes back):

1. **Open PRs** — title, author, draft/ready, mergeable state, failing checks.
2. **CI health** — latest workflow run status on the default branch; call out red.
3. **Open issues** opened or updated in the last 3 days (especially anything
   labeled `bug`, `self-healing`, or `auto-filed`).
4. **New Sentry issues** in the last 24h (use `Sentry__search_issues`,
   `is:unresolved` sorted by freshness) for the repos wired to Sentry
   (ResumAI, Off_Races, SocialOS).

Then pull **today's calendar** (`Google_Calendar__list_events`, primary calendar,
today) so I can see meetings against the work.

Render as:

```
## Standup — <date>

### 🔴 Needs me today
- <repo>: <the 1–3 things actually blocking or on fire>

### 🟡 In flight
- <repo>: <PRs / issues moving>

### 📅 Today
- <time> <meeting>

### 🟢 Quiet
<repos with nothing to report, one line>
```

Rules:
- Lead with what's broken (red CI, critical Sentry, PRs with failing checks).
- Be terse. No per-repo essay — a repo with nothing new gets one line under Quiet.
- Link PRs/issues as `owner/repo#123`.
- If a connector isn't authorized, note it once and move on — don't fail the whole briefing.

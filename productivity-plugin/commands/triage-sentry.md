---
description: Triage new Sentry errors and propose (or open) fixes
argument-hint: "[project: resumai | off_races | socialos | blank for all]"
allowed-tools: mcp__Sentry__find_projects, mcp__Sentry__search_issues, mcp__Sentry__analyze_issue_with_seer, mcp__Sentry__update_issue, mcp__github__search_code, Read, Grep
---

Triage my live Sentry errors. Target project from `$ARGUMENTS`, or sweep all of
mine if blank (ResumAI, Off_Races, SocialOS all report to Sentry).

1. `find_projects` to resolve the org/projects.
2. `search_issues` for `is:unresolved` seen in the last 24h, most frequent first.
3. For the top issues (by event count × users affected), run
   `analyze_issue_with_seer` to get root-cause + suggested fix.
4. Map each back to code: which repo/file. Cross-reference the repo's `CLAUDE.md`
   gotchas — several "errors" here are known-config issues, not code bugs:
   - ResumAI **401 "Unauthorized session"** everywhere → Supabase placeholder-key
     drift (Gotcha 1), not a code change.
   - ResumAI feed **500s** → missing `OPENAI_API_KEY` should degrade, not throw
     (Gotcha 6). A 500 there means a fallback path regressed.
   - Empty job/data results → missing provider keys degrade silently (Gotcha 4),
     not an error to chase.

Output a ranked table: `severity | project | issue | likely cause | fix size (S/M/L) | is it actually a code bug?`

Then ask me which to fix. For any I greenlight that are small and unambiguous,
implement the fix on a feature branch and open a **draft** PR. For anything
ambiguous or architectural, stop and check with me first. Only `update_issue`
(resolve/assign) when I say so — never silently mutate Sentry state.

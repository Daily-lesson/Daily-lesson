---
description: Build a realistic daily plan from calendar, inbox, and open work
allowed-tools: mcp__Google_Calendar__list_events, mcp__Gmail__search_threads, mcp__github__list_pull_requests, mcp__Mem0__search_memories, mcp__Mem0__add_memory, Task
---

Build my plan for **today**. I'm a solo builder juggling several apps, so the job
is to protect focus time, not to list everything.

Gather (in parallel):
1. **Calendar** — today's events (`Google_Calendar__list_events`, primary). Note
   fixed commitments and the gaps between them (my real work blocks).
2. **Inbox** — unread / recent important threads (`Gmail__search_threads`,
   `is:unread newer_than:2d`, plus anything from Stripe/Vercel/Supabase/GitHub
   that looks action-worthy). Summarize; don't dump.
3. **Open work** — my ready-for-me PRs across repos (assigned or authored, checks
   green and waiting on merge) so nothing stalls.
4. **Carryover** — check Mem0 (`search_memories` for "daily plan carryover") for
   anything I punted yesterday.

Then produce:

```
## Plan — <date>

**Fixed:** <meetings with times>

**Focus blocks:** <the open gaps, each with ONE proposed deep-work task>

**Quick wins (<15m each):** <inbox replies, PR merges, small triage>

**Do NOT touch today:** <what I should consciously defer>
```

Rules:
- Match work to energy: put the hardest deep-work task in my longest morning gap.
- Cap the day at ~3 meaningful outcomes. If I have 8 things, tell me which 3.
- Save anything deferred back to Mem0 (`add_memory`, tagged "daily plan carryover")
  so tomorrow's plan picks it up.
- End with one sentence: the single most important thing to get done today.

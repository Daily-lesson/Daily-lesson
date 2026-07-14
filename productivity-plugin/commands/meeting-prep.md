---
description: Prep for your next (or a named) meeting using calendar + past transcripts
argument-hint: "[meeting title or attendee, or blank for the next meeting]"
allowed-tools: mcp__Google_Calendar__list_events, mcp__Google_Calendar__search_events, mcp__Fireflies__fireflies_search, mcp__Fireflies__fireflies_get_transcript, mcp__Gmail__search_threads, mcp__Google_Drive__search_files
---

Prep me for a meeting. Target from `$ARGUMENTS`, or my **next upcoming** event if
blank.

1. Resolve the meeting (`Google_Calendar__list_events` / `search_events`): time,
   attendees, description, any attached agenda/links.
2. **History with these people/topic** — search Fireflies
   (`fireflies_search` → `fireflies_get_transcript`) for prior calls with the
   same attendees or subject. Pull the last meeting's decisions and any open
   action items assigned to me.
3. **Recent email threads** with the attendees (`Gmail__search_threads`) for the
   latest context.
4. **Relevant docs** — `Google_Drive__search_files` for anything named after the
   project/attendee.

Output a one-page brief:

```
## <Meeting> — <time>
**Who:** <attendees + a one-line who-they-are if known>
**Purpose:** <why this meeting exists>
**Last time we said:** <decisions + my open action items — did I do them?>
**My goals for this call:** <2–3>
**Open questions / risks:** <...>
**Talking points:** <bullets>
```

If there's no history, say so and build the brief from the invite + email context.
Keep it to a single screen — this is a pre-call glance, not a dossier.

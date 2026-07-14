---
description: Research, build (Fab Signal console template) and promote a source-verified HTML newsletter
argument-hint: "[topic — default: latest in robotics, autonomy & industrial IoT]"
allowed-tools: WebSearch, WebFetch, mcp__Mem0__search_memories, mcp__Mem0__add_memory, Write, Read, Task
---

Produce a **fully-coded, visually polished HTML email newsletter** on: **$ARGUMENTS**

If `$ARGUMENTS` is blank, run the default preset below. Either way, follow the same
research → verify → design → deliver workflow. The whole point of this command is a
newsletter that looks premium **and** is factually defensible — no invented numbers,
no dead links.

## Default preset (when no topic is given)

The reader is a **robotics engineer** working on autonomous systems (Boston
Dynamics Spot, BVLOS drones) and the IoT around them across a large manufacturing
network. The beat is **the latest and greatest in robotics, autonomy, and
industrial IoT** — anchored in the semiconductor space but spanning their own field
and adjacent frontier tech. Lead with what's genuinely new, not evergreen background.

- **Beat:** newest developments in robotics, autonomous systems, and industrial IoT
  across semiconductors, advanced manufacturing, and adjacent industries.
- **Default subtitle** (editable — this is a default, not a hard constraint):
  `Weekly Intelligence on Robotics, Autonomy & Industrial IoT — Semiconductors to the Field`
- **Recency is a hard gate, not a preference:** this is a *weekly*. Every story must
  carry a **primary publication date within the last 14 days** — enforced by the
  RECENCY GATE in the workflow below. A section with nothing in-window is marked
  **QUIET**, never backfilled with older material.
- **Output shape:** **one summarized tile per section**, with links inline as needed.
  Keep each section to a single tile unless the user explicitly asks to expand.
- **Sections to cover** (one tile each; mark a section QUIET if nothing lands in-window):
  - **Fab robotics & automation** — the semiconductor anchor: AMHS/OHT wafer
    logistics, cleanroom cobots, direct-drive SCARA, vacuum wafer handling, ISO
    Class 1–5 rules, and the sensor/motor silicon that makes chips (TI, GF, ASML,
    Siemens, and the fab-automation vendors).
  - **Field & mobile autonomy** — the reader's day-to-day: legged robots (Spot),
    humanoids, AMRs/AGVs, BVLOS drones and drone-in-a-box, and fleet-operations
    tooling. New models, deployments, autonomy-stack and regulatory (FAA/BVLOS) news.
  - **Industrial IoT & edge** — sensors, edge AI/compute, private 5G, digital twins,
    and predictive maintenance across manufacturing networks.
  - **Adjacent frontier / signal** — one wildcard: physical-AI and robotics
    foundation models, new robotics silicon (e.g. NVIDIA Jetson/Thor, Qualcomm, TI),
    standards & safety, or notable funding/M&A worth the reader's attention.

## Workflow (do not skip steps)

> **Why this is strict:** the failure mode of a "weekly" is quietly shipping months-old
> stories that are still *topically* relevant. The gate below exists to make that
> impossible. Recency is decided by **dates, not vibes** — an item is in or out based on
> its publication date, never on how relevant or interesting it feels.

1. **Establish TODAY and the WINDOW first — before any search.** Read the real current
   date from the environment (the harness provides it; do not guess). Compute and write
   down literally:
   - `TODAY = <YYYY-MM-DD>`
   - `WINDOW_START = TODAY − 14 days = <YYYY-MM-DD>`
   Every story must be dated **on or after `WINDOW_START`**. Put the window in the issue's
   meta bar (e.g. "Window: Jun 29 – Jul 13") so the constraint is visible in the output.

2. **Date-anchored research.** For each section, run `WebSearch` with queries that pin the
   month/year and recency (e.g. `"<topic> news July 2026"`, `"this week"`, a specific
   recent date). Prefer official press releases, company newsrooms, and reputable
   industry/robotics press (SEMI, IEEE Spectrum, EE Times, The Robot Report, sUAS News).
   **For every candidate, capture its explicit primary publication date** from the source
   (the dateline, URL date, or "Published" field) — an item with no establishable date is
   not a candidate.

3. **⛔ RECENCY GATE — apply mechanically, reject on date alone.** For each candidate, keep
   it **only if** its primary publication date ≥ `WINDOW_START`. Otherwise **discard it —
   no exceptions:**
   - Do **not** keep an old story because it's "still relevant," "foundational," or "the
     best example." Relevance is not recency.
   - Do **not** launder an old event through a fresh page: a roundup, market-report,
     "guide," listicle, or re-post published this week about an event from months ago is
     **out** — the date that matters is the *event's original announcement date*.
   - A rule/regulation counts only if a **dated development** (final rule, vote, filing,
     enforcement date) fell inside the window — not the fact that it's a current topic.
   - If you can't pin a date to within the window, treat it as **out**.
   After the gate, write a one-line ledger per section: `§NN <section> — <item + date>` or
   `§NN <section> — QUIET (nothing in-window)`. A QUIET section ships as a short honest
   "quiet pillar" tile; it is never backfilled.

4. **Verify every surviving source.** `WebFetch` each kept URL and confirm it (a) resolves
   and (b) says what you'll claim. **Only real, fetched URLs ship — never a placeholder or
   guessed link.** (WebFetch may 403 on anti-bot sites; if so, rely on the dated
   search-result content and say so — but the date still has to clear the gate.)

5. **Ground every number.** Every gauge/stat must trace to a verified in-window source.
   If you can't source a figure, omit it — do not fabricate precision.

6. **Compose one tile per section**, then derive the Issue # from the date.

7. **✅ Pre-build self-audit (last check before HTML).** List every chosen tile with its
   date next to `WINDOW_START`. If *any* tile is older than the window, remove it and mark
   that section QUIET. Only once every remaining tile clears the window do you build.

8. **Build the HTML** to the spec below.

## Editorial

- Invent a professional, high-tech masthead title (e.g. "Silicon & Autonomy
  Intelligence", "Advanced Fab Digest").
- Voice: expert semiconductor-industry analyst — precise, technical, confident, no
  fluff. Each item should teach the reader something concrete.

## HTML build — the "Fab Signal" console template

Do **not** hand-roll a new layout. Build every issue from the canonical skeleton at
`${CLAUDE_PLUGIN_ROOT}/templates/newsletter-console.html` — `Read` it, then swap only
the content slots (masthead/subtitle, meta bar, `<article class="intel">` cards, the
filter chips + counts, telemetry gauges, footer). Keep the design system intact:

- **Identity:** a cleanroom control-room / signals-terminal console — not a generic
  email. Deep cool-slate ground, a single cyan **signal** accent (`--signal`), a
  wafer-lattice dot grid, monospace carrying the instrumentation (channel IDs, meta
  bar, gauge digits). Amber is a *semantic* CAPEX/alert chip only, never the accent.
- **Structure the template already ships:** reading-progress signal line · animated
  signal-trace header canvas · sticky **section nav** (chips with live counts) ·
  numbered section headers · **Intel Cards** as "channels" (`CH·NN`, category badge,
  `data-cat`) · **telemetry gauges** that count up on scroll · console status-bar footer.
- **Wiring rules when you swap content:**
  - **One tile per section** by default. Give each tile a real `data-cat`
    (`field` | `logi` | `edge` | `iiot` | `fab` | `market`) and make the nav chips +
    their counts match the sections that actually shipped.
  - **Surface the dates.** Put each tile's publication date in its channel strip (the
    `.sigid`), and put `WINDOW_START – TODAY` in the meta bar and `WINDOW · PAST 14 DAYS`
    in the footer status bar — the recency gate should be visible, not just internal.
  - A **QUIET** section still ships as one honest tile ("no marquee news this fortnight —
    here's what's teed up"); never fake a populated section.
  - Every gauge figure carries `data-target` and must trace to a verified in-window source.
  - Every CTA/`.src` link is a real, verified URL (per the workflow above).
- **Interactivity is first-class:** it's built to be *operated*. Keep it self-contained
  (inline CSS/JS, no external fonts/CDNs), theme-toggle + `prefers-color-scheme` at the
  token level, and `prefers-reduced-motion` respected. This is a browser/preview-grade
  page — **if the user wants to actually email it, offer the inline-styled fallback**
  (head `<style>`, media queries, and the canvas won't survive many mail clients).

## Deliverables (in this order)

1. A short bulleted summary of the technical highlights **and** the design/UX choices.
2. The finished HTML (save to a file; offer to publish it as an **Artifact** so the
   user can view/operate it live).
3. *(Optional)* one real, verified supplementary **video** link as a visual aid — it's a
   reference, not a news item, so it isn't recency-gated, but keep it relevant and current.

## Promote — publish to the advised platform

After the issue is built, run the promotion hand-off automatically (this is the whole
point of a *weekly* — it should reach an audience):

1. **Pick the advised platform.** Match platform to the content, don't default:
   - This beat (semiconductor / robotics / industrial IoT B2B intelligence, authored by
     a robotics engineer building in public) → **LinkedIn is the advised platform.**
     X/Twitter is the secondary. Reddit only for a genuinely discussion-worthy single item.
   - State which platform you chose and one line of why.
2. **Draft the public post** via `/promote` (hand it the issue's headline items + the
   Artifact/newsletter link) so the copy is grounded in what actually shipped — no
   invented metrics, in the builder-in-public voice.
3. **Publish it** through **SocialOS** (the user's own social manager — it targets
   LinkedIn/X/Reddit/etc.). No third-party LinkedIn/X posting connector is currently
   connected to this session, so SocialOS is the publish path; if none is wired, output
   the ready-to-post copy + link for one-tap posting.
4. **Gate on an explicit yes.** Posting publicly is outward-facing and hard to undo —
   show the final post text and target platform and **wait for confirmation in the same
   turn before anything is published.** Schedule vs. post-now is the user's call.

Log the topic, issue #, chosen platform, and post to Mem0 ("newsletter") so we don't
repeat an angle — and so `/promote` and `growth-strategist` can build on it week over week.

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
- **Recency filter:** this is a *weekly* — strongly prefer developments from roughly
  the **last 14 days**. If a pillar has no fresh news, say so briefly rather than
  padding with old material. Date-check each item during research.
- **Pillars to cover** (pick the freshest 1–2 items per pillar; drop a pillar if
  nothing new landed):
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

1. **Research first, recent first.** Run `WebSearch` for each pillar (or the given
   topic), biasing queries toward the last ~2 weeks. Prefer official press releases,
   company blogs/newsrooms, and reputable industry/robotics press (SEMI, IEEE
   Spectrum, EE Times, The Robot Report, sUAS News, etc.). Confirm each item's date.
2. **Verify every source before you cite it.** `WebFetch` each candidate URL and
   confirm (a) it actually resolves and (b) it says what you're about to claim.
   **Only real, fetched URLs go in the newsletter — never a placeholder, guessed,
   or "example.com" link.** If you can't verify a link, drop the claim.
3. **Ground every number.** Any percentage, dollar figure, or market stat in the
   metrics block must trace to a verified source. If you can't source a figure,
   omit it or label it clearly as illustrative — do not fabricate precision.
4. **Date it today.** Use the real current date; derive a plausible Issue # from it.
5. **Write, then build the HTML** to the spec below.

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
  signal-trace header canvas · sticky **pillar filter** (chips with live counts) ·
  numbered section headers · **Intel Cards** as "channels" (`CH·NN`, category badge,
  `data-cat`) · **telemetry gauges** that count up on scroll · console status-bar footer.
- **Wiring rules when you swap content:**
  - Give every card a real `data-cat` (`fab` | `edge` | `market` | `field` | `iiot`)
    and update the filter chips + their counts to match what actually shipped. Drop a
    chip if its count is 0 — don't fake a populated pillar.
  - Every gauge figure carries `data-target` and must trace to a verified source.
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
3. One real, verified supplementary **video** link — `WebFetch`-checked like every link.

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

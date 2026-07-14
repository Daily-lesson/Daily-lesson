---
description: Research and build a polished, source-verified HTML newsletter on a tech topic
argument-hint: "[topic — default: latest in robotics, autonomy & industrial IoT]"
allowed-tools: WebSearch, WebFetch, mcp__Mem0__search_memories, mcp__Mem0__add_memory, Write, Read
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

## HTML / CSS spec

- Output as **one self-contained raw HTML block** in an ```html fence. Prefer a
  modern responsive `<div>` container; avoid `<table>` layout unless truly needed.
- `<style>` block in `<head>`: modern clean font stack (`system-ui, Inter, Arial`),
  smooth hover states, and a `max-width:600px` media query that collapses multi-column
  grids and tightens padding. **Note the tradeoff in your summary:** head `<style>` +
  media queries render beautifully in a browser/webmail preview but some desktop mail
  clients strip them — offer to also produce an inline-styled version if the user
  intends to actually send it.
- **Palette:** sophisticated corporate — deep slate/navy, teal accent, clean
  white/gray surfaces, high-contrast charcoal text. Pick light or dark mode and
  commit to it.
- **Layout, in order:**
  - Header band: masthead title + the required subtitle.
  - Metadata bar: Issue #, Date, Classification.
  - "Executive Summary" lead paragraph.
  - Section dividers with a left-accent colored bar or clean border.
  - **Intel Cards** — each item in its own container: category badge
    (e.g. `AI & EDGE`, `FAB CAPEX`), bold title, body copy, and a visible verified
    CTA link.
  - **Key Indicators** — a 3-column metrics grid (percent / $ / stat), each figure
    sourced per step 3.
  - Footer: copyright, an internal-distribution disclaimer, and one real external
    reference link (e.g. Stanford Emerging Technology Review).

## Deliverables (in this order)

1. A short bulleted summary of the technical highlights **and** the design choices
   made (include the mail-client tradeoff note).
2. The raw HTML code block.
3. One real, verified supplementary **video** link (e.g. a YouTube automated-cleanroom
   / fab tour from TI, GF, or ASML) — `WebFetch`-checked like every other link.

Save the final HTML to a file if I ask, and offer to hand the copy to `/promote` for
a launch post. Log the topic + issue # to Mem0 ("newsletter") so we don't repeat an
angle next issue.

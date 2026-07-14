---
description: Research and build a polished, source-verified HTML newsletter on a tech topic
argument-hint: "[topic — default: semiconductor fab robotics & automation (TI)]"
allowed-tools: WebSearch, WebFetch, mcp__Mem0__search_memories, mcp__Mem0__add_memory, Write, Read
---

Produce a **fully-coded, visually polished HTML email newsletter** on: **$ARGUMENTS**

If `$ARGUMENTS` is blank, run the default preset below. Either way, follow the same
research → verify → design → deliver workflow. The whole point of this command is a
newsletter that looks premium **and** is factually defensible — no invented numbers,
no dead links.

## Default preset (when no topic is given)

- **Beat:** breakthroughs in robotics & automation applied to semiconductor
  manufacturing fabs.
- **Required subtitle (use verbatim):** `Weekly Intelligence on Semiconductor Robotics & Automation for Texas Instruments`
- **Sections to cover:**
  - **Texas Instruments** — 300mm fab expansions (Sherman TX, Lehi UT), Automated
    Material Handling Systems (AMHS), and hardware/sensor robotics (real-time
    processing, mmWave radar, motor control).
  - **GlobalFoundries** — strategic collaborations (Siemens, Renesas), "Physical AI"
    (compute intelligence pushed to edge robotics on the floor), and automated fab
    logistics (ceiling-mounted overhead transport / OHT).
  - **Cleanroom automation trends** — sub-micron wafer logistics, cobots,
    direct-drive SCARA, vacuum wafer handling, ISO Class 1–5 contamination rules.

## Workflow (do not skip steps)

1. **Research first.** Run `WebSearch` for each section/company. Prefer official
   press releases, company blogs/newsrooms, and reputable industry press
   (SEMI, IEEE Spectrum, EE Times, etc.).
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

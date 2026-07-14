---
description: Triage Gmail into action / reply / read / ignore, with draft replies
argument-hint: "[search filter, e.g. 'newer_than:1d' — optional]"
allowed-tools: mcp__Gmail__search_threads, mcp__Gmail__get_thread, mcp__Gmail__create_draft, mcp__Gmail__list_labels, mcp__Gmail__label_thread
---

Triage my inbox. Use the filter in `$ARGUMENTS` if given, else
`is:unread newer_than:2d`.

For each thread, classify:
- **🔴 Action** — needs a decision or task from me. Say what the action is.
- **✍️ Reply** — needs a written response. **Draft it** (`Gmail__create_draft`)
  in my voice — concise, friendly, direct — but do **not** send. Leave it in
  drafts for me to review.
- **📖 FYI** — worth reading, no action. One-line summary.
- **🗑️ Noise** — newsletters/notifications. Batch-mention, don't detail.

Watch for the operational stuff that matters to my apps and surface it up top:
Stripe/PayPal (payments, disputes, payouts), Vercel (deploy failures), Supabase
(project/billing/security), GitHub (review requests, Dependabot, CI), and domain
registrar notices (GoDaddy — resumai.fyi renewal).

Output: a triage table (`from | subject | class | what I need to do`), then list
the draft replies you created. Never send, archive, or delete without me asking —
labeling to organize is fine, mutations to content are not.

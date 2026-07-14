---
description: Revenue + payments snapshot across Stripe and PayPal
argument-hint: "[period: today | 7d | 30d | mtd — default 7d]"
allowed-tools: mcp__Stripe__get_stripe_account_info, mcp__Stripe__fetch_stripe_resources, mcp__Stripe__stripe_api_read, mcp__PayPal__list_transactions, mcp__PayPal__list_invoices, mcp__PayPal__list_disputes
---

Give me a money snapshot for the period in `$ARGUMENTS` (default: last 7 days).
ResumAI (resumai.fyi) bills through **Stripe**; I also invoice via **PayPal**.

**Stripe:**
- Account status / any account issues (`get_stripe_account_info`).
- New + churned subscriptions in the period, MRR direction.
- Gross volume, successful vs failed charges, refunds.
- Any open disputes or chargebacks (these are urgent — surface first).

**PayPal:**
- Recent transactions in the period (`list_transactions`).
- Outstanding / overdue invoices (`list_invoices`).
- Open disputes (`list_disputes`).

Render:

```
## Revenue — <period>

**🔴 Needs attention:** <failed charges, disputes, overdue invoices — or "none">

**Stripe:** $<volume> · <new subs> new / <churned> churned · MRR <↑/↓ $x>
**PayPal:** $<received> · <n> outstanding invoices ($<amount>)

**Notes:** <anything trending — spike, dip, a big customer>
```

Read-only. Never create refunds, send invoices, or resolve disputes from this
command — if something needs action, tell me and I'll trigger it deliberately
(e.g. `/invoices`). If a connector is unauthorized, note it and report the rest.

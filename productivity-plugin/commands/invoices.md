---
description: Check invoice status and (with confirmation) draft/send invoices via PayPal
argument-hint: "[status check | or 'new <client> <amount> <for what>']"
allowed-tools: mcp__PayPal__list_invoices, mcp__PayPal__create_invoice, mcp__PayPal__send_bulk_invoices, mcp__PayPal__create_bulk_invoices, mcp__Gmail__search_threads
---

Handle invoicing via PayPal based on `$ARGUMENTS`.

**Default (no args, or "status") — reporting only:**
- `list_invoices` and group by state: DRAFT, SENT, **OVERDUE**, PAID.
- Flag overdue ones with days-late and amount; total outstanding.
- Optionally cross-check Gmail for replies/"paid" confirmations that haven't
  synced.
- Output a table: `client | # | amount | status | age`. No writes.

**Create ("new <client> <amount> <description>"):**
1. Draft the invoice details and **show them to me first** — client, line items,
   amount, due date. Do not create yet.
2. Only after I confirm, `create_invoice`. **Sending is a separate explicit
   step** — ask again before `send_*`. Creating and sending an invoice is an
   outward-facing action to a real client; never do it on implied consent.

Never send or finalize an invoice without a clear yes from me in the same turn.

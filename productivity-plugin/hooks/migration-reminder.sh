#!/usr/bin/env bash
# PostToolUse hook: when a Supabase migration file is created or edited, remind
# Claude that migrations here do NOT auto-apply — the live DB silently drifts
# behind supabase/migrations/ unless each one is applied right after it's written.
# (See CLAUDE.md "Keeping the live database in sync" / Gotcha 7 in ResumAI.)
#
# Non-blocking: emits additionalContext for the model, never fails the tool call.

set -euo pipefail

payload="$(cat)"

# Extract the edited file path from the hook payload (tool_input.file_path).
file_path="$(printf '%s' "$payload" | python3 -c '
import sys, json
try:
    d = json.load(sys.stdin)
    print(d.get("tool_input", {}).get("file_path", ""))
except Exception:
    print("")
' 2>/dev/null || true)"

case "$file_path" in
  *supabase/migrations/*.sql)
    msg="Reminder: this is a Supabase migration. Nothing auto-applies migration files here — the live project can silently drift behind the repo (a known, repeatedly-costly bug). After writing it, apply it to the live project (list_migrations -> apply_migration with name = filename minus timestamp -> list_migrations to confirm -> get_advisors security check). Do not batch it for later. Or run /migrate."
    printf '{"hookSpecificOutput":{"hookEventName":"PostToolUse","additionalContext":%s}}' \
      "$(printf '%s' "$msg" | python3 -c 'import sys,json; print(json.dumps(sys.stdin.read()))')"
    ;;
  *)
    : # not a migration file — stay silent
    ;;
esac

exit 0

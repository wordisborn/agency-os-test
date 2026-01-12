#!/usr/bin/env bash
set -euo pipefail

input="$(cat)"
cmd="$(echo "$input" | jq -r '.tool_input.command // ""')"

# Super-basic guardrails; customize as you like.
if echo "$cmd" | grep -Eq 'rm\s+-rf\s+/( |$)|:\(\)\s*\{\s*:\s*\|\s*:\s*;\s*\}\s*;|mkfs\.|dd\s+if=|>\s*/dev/sd|chmod\s+-R\s+777\s+/'; then
  echo "Blocked dangerous command: $cmd" >&2
  exit 2
fi

exit 0
#!/usr/bin/env bash
set -euo pipefail

input="$(cat)"
file_path="$(echo "$input" | jq -r '.tool_response.filePath // .tool_input.file_path // ""')"

[ -z "$file_path" ] && exit 0

case "$file_path" in
  *.ts|*.tsx|*.js|*.jsx|*.md|*.json|*.yaml|*.yml)
    if command -v npx >/dev/null 2>&1; then
      npx prettier --write "$file_path" >/dev/null 2>&1 || true
    fi
    ;;
esac

exit 0
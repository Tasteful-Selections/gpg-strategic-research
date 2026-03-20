#!/bin/bash
# warn-reference-edit.sh — PreToolUse hook for Edit
# Blocks edits to reference/ files with an explanatory message.
# Reference files contain source methodology and frameworks that shouldn't drift.
#
# Install: Add to .claude/settings.json under hooks.PreToolUse
# Matcher: "Edit"

INPUT=$(cat)

# Extract file_path from JSON input
FILE_PATH=$(echo "$INPUT" | sed -n 's/.*"file_path"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' | head -1)
NORM_PATH=$(echo "$FILE_PATH" | tr '\\' '/')

[ -z "$NORM_PATH" ] && exit 0

# Block edits to reference files
case "$NORM_PATH" in
  */references/*|*/reference/*)
    echo "PROTECTED: $(basename "$FILE_PATH") is a reference file." >&2
    echo "Reference files contain source material (methodology, frameworks, external docs)" >&2
    echo "and are read-only by convention. If this edit is intentional, the user must" >&2
    echo "confirm explicitly. To proceed, edit the file manually or temporarily remove" >&2
    echo "this hook from .claude/settings.json." >&2
    exit 1
    ;;
esac

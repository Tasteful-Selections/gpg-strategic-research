#!/bin/bash
# pre-compact.sh — PreCompact hook
# Captures working state before conversation compaction so critical context
# survives the compression. Output from this script is preserved in the
# compacted conversation.
#
# Install: Add to .claude/settings.json under hooks.PreCompact

# Find working-state.md relative to the repo root
WORKING_STATE="memory/working-state.md"

if [ ! -f "$WORKING_STATE" ]; then
  echo "=== PRE-COMPACT: No working-state.md found ==="
  exit 0
fi

echo "=== PRE-COMPACT: ACTIVE WORKING STATE ==="
echo ""

# Output the full working state (skip frontmatter between --- delimiters)
awk '/^---$/{n++; next} n>=2' "$WORKING_STATE"

echo ""
echo "=== PRE-COMPACT: OPEN THREADS (ACTIVE ONLY) ==="
echo ""

# Extract the Active section from open-threads.md if it exists
OPEN_THREADS="memory/open-threads.md"
if [ -f "$OPEN_THREADS" ]; then
  # Print from "## Active" until the next "##" heading
  awk '/^## Active/{found=1; next} /^## /{if(found) exit} found' "$OPEN_THREADS"
fi

echo ""
echo "=== PRE-COMPACT: REMINDERS ==="
echo "- Curated memory (memory/) is authoritative. Do not rely on pre-compaction conversation for facts."
echo "- Run Session Start Sequence if memory context feels incomplete."
echo "- Check memory/working-state.md for current state."

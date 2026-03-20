---
paths:
  - "memory/**"
---

# Memory File Rules

When accessing memory files, follow these rules.

## Session Start (if not already done)

If this is the first memory file access in this session, execute the full Session Start Sequence:
1. Read `memory/working-state.md` — resume active work if present
2. Scan frontmatter of `memory/` — load files matching current task
3. Follow "related" links from loaded memory files (one hop)
4. Check `memory/open-threads.md` for relevant pending items
5. Proceed with user's request

## Write Rules

- working-state.md is ephemeral: OVERWRITE each session, do not append
- open-threads.md is persistent: add, update, and move items between Active/Completed/Dropped tables
- Session digests go in `memory/digests/` with YYYY-MM-DD.md naming
- All memory files must have YAML frontmatter (title, type: memory, updated, summary minimum)
- Use the supersedes field when a memory file overrides a fact in a context file
- Do not create memory files speculatively — add when the need emerges

## Memory System Boundary

- Curated memory (this directory) is authoritative for operational facts
- Do not duplicate curated memory facts into Claude's native auto-memory
- If auto-memory contradicts a file here, this directory wins

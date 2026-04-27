---
name: session-digest
description: "Write a structured session digest capturing decisions, discoveries, and next steps before ending a work session. Use when Jon says 'wrap up', 'end of session', 'write a digest', 'session summary', 'what did we do today', 'log', 'log this', 'save progress', 'capture what we did', or before signing off."
categories:
  - memory-management
  - session-continuity
tags:
  - digest
  - session-end
  - memory-write
summary: "End-of-session digest writer that captures decisions, context, and next steps to prevent the empty-memory problem across sessions."
---

# Session Digest

**Superseded by session-wrap in this vault.** Session-wrap does everything this skill does plus git commit and push. Kept as reference template.

Write a structured session digest at the end of a work session. This prevents the "empty memory" problem — every session that produces meaningful work leaves a written record.

## When to Use This

- End of any session where decisions were made, context was gathered, or research was produced
- When Jon says "wrap up", "let's stop here", "write a digest", "log this", or similar
- Before switching to a different persona or task
- NOT for mid-session updates (update working-state.md directly)

## Workflow

1. **Review the session**: Scan the conversation for decisions, discoveries, open questions, and research produced
2. **Check working-state.md**: Read current state to understand what changed
3. **Write the digest** in `memory/digests/YYYY-MM-DD.md`. If multiple sessions happen on the same day, append a suffix: `YYYY-MM-DD-2.md`. If Obsidian CLI is available, use `obsidian vault="gpg-strategic-research" create name="YYYY-MM-DD" template="template-session-digest"` for auto-populated frontmatter.
4. **Update working-state.md**: Overwrite with current state — what's in progress, where we left off, active decisions pending
5. **Update open-threads.md**: Add new threads, update existing ones, move completed items
6. **Confirm with Jon**: Show a brief summary of what was written and where

## Output Format

```yaml
---
title: "Session Digest — [Date]"
type: memory
updated: [today's date]
categories:
  - session-digest
tags:
  - [session-specific tags]
status: active
scope: gpg-strategic-research
related:
  - memory/working-state.md
  - [other files referenced or updated this session]
summary: "[One sentence: what was accomplished this session.]"
---
```

```markdown
# Session Digest — [Date]

## What Happened
[2-4 sentences: focus, accomplishments]

## Decisions Made
- [Decision]: [rationale]

## Key Discoveries
- [Discovery]: [implication]

## Open Questions
- [Question]: [why it matters]

## Next Session
- [Specific next steps — not vague "continue work"]
```

## Conventions

- Newest entries at the top of each file
- Keep entries concise — 3-5 lines each
- Don't log routine exchanges. Log things that would change research direction next time
- When domain memory files emerge (e.g., a research-log.md), add routing step to this workflow
- Memory is authoritative over context files

## What NOT to Include

- Conversation transcripts (summary, not log)
- Speculative analysis not grounded in session work
- Duplicate information already captured in working-state.md

## Gotchas

1. **Writing too much**: Under 500 words. If longer, you're writing a report, not a digest.
2. **Vague next steps**: "Continue research" is useless. "Run Tier 1 screen on Bolthouse, focusing on post-acquisition ownership changes" is useful.
3. **Skipping working-state update**: The digest is archival. Working-state is ephemeral. Both need updating — digest alone doesn't help next session's startup.
4. **Forgetting open-threads**: New threads discovered mid-session get lost if not written to open-threads.md.

## Interface

### Expects (from upstream)
- **From the conversation context:** Decisions made, discoveries, open questions, research produced
- **From `memory/working-state.md`:** Current state to diff against what changed

### Produces (for downstream)
- **To `memory/digests/`:** Structured digest file (YYYY-MM-DD.md) with YAML frontmatter
- **To `memory/working-state.md`:** Overwritten with current state for next session pickup
- **To `memory/open-threads.md`:** Updated Active/Completed/Dropped tables

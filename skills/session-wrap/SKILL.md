---
name: session-wrap
description: "Close a work session: write digest, update memory, commit everything, push. Use when Jon says '/wrap', 'wrap up', 'end of session', 'done for today', 'write a digest', 'session summary', 'log this session', 'save progress and close', 'sign off', or before ending a conversation. Generates session digest, updates working-state and open-threads, stages all changes, commits, and pushes. Supersedes session-digest."
categories:
  - session-lifecycle
  - git-transport
  - memory-management
tags:
  - wrap
  - digest
  - session-end
  - commit
  - push
summary: "Session closer that generates digest, updates all memory files, then commits and pushes everything to remote."
---

# Session Wrap

Close a work session by writing a structured digest, updating all memory files, then committing and pushing everything. This skill supersedes session-digest — it does everything session-digest does plus git commit and push.

## When to Use This

- End of any session where decisions were made, context was gathered, or research was produced
- When Jon says `/wrap`, "wrap up", "done for today", "write a digest", or similar
- Before switching to a different persona or ending a conversation
- NOT for mid-session checkpoints (use `/sync`)

## Workflow

### Memory Phase

1. **Review the session** — scan the conversation for decisions, discoveries, open questions, and research produced.

2. **Read working-state.md** — understand what changed relative to the start of the session.

3. **Write the digest** — create `memory/digests/YYYY-MM-DD.md`. If a digest already exists for today, use suffix: `YYYY-MM-DD-2.md`, `YYYY-MM-DD-3.md`, etc. If Obsidian CLI is available, use `obsidian vault="gpg-strategic-research" create name="YYYY-MM-DD" template="template-session-digest"` for auto-populated frontmatter.

4. **Overwrite working-state.md** — replace entirely with current state: what's in progress, where we left off, active decisions pending. This is ephemeral — do not append.

5. **Update open-threads.md** — add new threads discovered mid-session, update existing threads with progress, move completed items to the Completed table, move abandoned items to the Dropped table with a reason.

6. **Confirm memory writes with Jon** — show a brief summary of what was written and where. Let Jon correct anything before committing.

### Git Phase

7. **Detect recent sync** — if the last commit is a `sync:` commit from this session, note that only wrap-specific changes are in this commit.

8. **Stage everything** — `git add -A`

9. **Generate commit message** — `wrap: session end — {digest summary sentence}`

10. **Commit** — `git commit -m "{message}"`

11. **Push** — `git push`

12. **Final confirmation** — "Session wrapped. Digest written, memory updated, {N} files committed and pushed."

13. **Compound nudge** — if the session involved a deliverable (research report, strategic analysis, market assessment), append: "This session had deliverables worth compounding. Say `compound` to extract learnings." Skip the nudge for sessions that were only planning, quick fixes, or conversation.

## Digest Output Format

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
- [Specific next steps — not vague "continue research"]
```

## What NOT to Include in the Digest

- Conversation transcripts (this is a summary, not a log)
- Speculative analysis not grounded in session work
- Duplicate information already captured in working-state.md

## Common Pitfalls

- **Writing too much in the digest**: under 500 words. If longer, you're writing a report, not a digest.
- **Vague next steps**: "Continue research" is useless. "Run Tier 1 screen on Bolthouse, focusing on post-acquisition ownership changes" is useful.
- **Skipping working-state update**: the digest is archival, working-state is ephemeral. Both need updating.
- **Forgetting open-threads**: new threads discovered mid-session get lost if not written to open-threads.md.
- **Not confirming with Jon before committing**: memory writes should be reviewed. The git commit is the point of no return for the push.
- **If push fails**: the commit is still local. Tell Jon. The memory files are already written.

## Interface

### Expects
- Active session with conversation context (decisions, discoveries, or research produced)

### Produces
- Session digest in `memory/digests/YYYY-MM-DD.md`
- Overwritten `memory/working-state.md`
- Updated `memory/open-threads.md`
- All changes committed and pushed to remote
- Final confirmation message

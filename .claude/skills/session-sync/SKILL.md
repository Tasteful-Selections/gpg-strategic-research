---
name: session-sync
description: "Mid-session checkpoint that saves all progress to git. Use when Jon says '/sync', 'save progress', 'checkpoint', 'push my changes', 'commit everything', or after completing a meaningful unit of work. Stages all changes, commits with auto-generated message, and pushes."
categories:
  - session-lifecycle
  - git-transport
tags:
  - sync
  - commit
  - push
  - checkpoint
summary: "Mid-session git checkpoint: flush memory, stage all, commit, push in one shot."
---

# Session Sync

Mid-session checkpoint that commits and pushes all changes to remote.

## When to Use This

- Mid-session when Jon wants to save progress
- After completing a meaningful phase or deliverable
- Before stepping away temporarily
- When another skill's completion flow suggests it
- NOT at end of session (use `/wrap`)
- NOT at start of session (use `/start`)

## Workflow

1. **Check for changes** — `git status`. If nothing to commit, say "No changes to sync." and stop.

2. **Compound-marker check (offer, don't force)** — if the work since session start includes any of:
   - File edits or new files under `.claude/skills/`, `references/`, or `CLAUDE.md`
   - Explicit phrases this session: "save that", "compound this", "what did we learn", "that worked well"
   - A completed deliverable (persona build, audit, skill file, multi-file change)

   ...ask once: "This session has compound markers ({brief — what fired}). Run `/compound` first, or just sync?" If user says compound, defer sync and hand off. If user says sync / skip / continue, proceed without further prompting.

   Skip the offer entirely when no markers fire. Sync stays a fast checkpoint by default.

3. **Detect recent sync** — `git log --oneline -1`. If the last commit is a `sync:` or `wrap:` commit from within the last 5 minutes, ask: "You just synced {N} minutes ago. Sync again?" Prevents accidental double-commits.

3. **Quick-update working-state** — check if `memory/working-state.md` reflects current work. If the "Currently Working On" section is stale (doesn't match what was actually done this session), update it before committing.

4. **Stage everything** — `git add -A`

5. **Generate commit message** — `sync: checkpoint — {first 60 chars of "Currently Working On" from working-state.md}`

6. **Commit** — `git commit -m "{message}"`

7. **Push** — `git push`

8. **Confirm** — "Synced. {N} files committed and pushed."

## Common Pitfalls

- **Do not skip the working-state check.** A sync without updated memory is just a git commit — it misses the point of capturing session state.
- **Do not prompt for a detailed commit message.** The auto-generated message is intentional — this is a checkpoint, not a curated commit.
- **If push fails**, the commit is still local. Tell Jon and suggest retrying.
- **Do not run `git add -A` without `git status` first.** If there's nothing to commit, say so.

## Interface

### Expects
- Changes in the working tree

### Produces
- All changes committed and pushed to remote
- Updated working-state.md (if it was stale)
- Confirmation message with file count

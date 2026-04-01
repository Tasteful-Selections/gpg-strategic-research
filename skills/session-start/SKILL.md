---
name: session-start
description: "Open a work session by syncing git state and loading context. Use when Jon says '/start', 'start session', 'open session', 'begin session', 'pick up where I left off', or at the start of any new conversation. Pulls remote changes, detects uncommitted local work, then runs the Session Start Sequence. Do NOT use mid-session for checkpoints (use session-sync) or end-of-session (use session-wrap)."
categories:
  - session-lifecycle
  - git-transport
tags:
  - start
  - pull
  - sync
  - session-open
summary: "Session opener that syncs local git state with remote, then runs the Session Start Sequence from CLAUDE.md."
---

# Session Start

Open a work session by syncing the local repo with remote and loading session context.

## When to Use This

- Beginning of any work session
- When Jon says `/start`, "start session", "pick up where I left off"
- When CLAUDE.md Step 0 detects unsynced state and Jon agrees to run `/start`
- NOT mid-session (use `/sync`) or end-of-session (use `/wrap`)

## Workflow

1. **Check for uncommitted local changes** — run `git status`. If the working tree is dirty:
   - Show Jon what's uncommitted (`git diff --stat`)
   - Offer: "You have uncommitted changes from a previous session. Sync these first?"
   - If yes: `git add -A`, commit with message `sync: pre-start checkpoint`, push
   - If no: proceed (changes stay uncommitted, Jon is aware)

2. **Check for unpushed commits** — `git log --oneline origin/main..HEAD`. If any:
   - Show the unpushed commits
   - Push them (`git push`)

3. **Pull remote changes** — `git pull`. Handle merge outcomes:
   - **Clean pull**: proceed
   - **Trivial conflicts** (non-overlapping edits): auto-resolve
   - **Ambiguous conflicts**: stop, show the conflict markers, ask Jon which version to keep

4. **Report what changed** — show `git log --oneline` of new commits pulled and `git diff --stat` of what changed. Summarize in plain language.

5. **Run the Session Start Sequence** — execute the steps from CLAUDE.md:
   - Read `memory/working-state.md`
   - Scan frontmatter of `memory/` for files matching current task
   - Follow "related" links (one hop)
   - Check `memory/open-threads.md`
   - Proceed with Jon's request

6. **Report ready state** — brief status to Jon.

## Output Format

```
Session started.
- Git: {pulled N commits / already up to date / synced local changes first}
- Working state: {resuming "{topic}" from {date} / clean start}
- Open threads: {N active, top priority: "{thread name}"}
- Ready to work.
```

## Common Pitfalls

- **Do not `git pull --rebase`** — standard merge preserves history better.
- **Do not silently discard uncommitted changes.** Always show what exists and ask before committing.
- **Do not skip the Session Start Sequence** after git operations. Git sync is transport; memory load is context. Both are required.
- **If `git push` fails**, tell Jon plainly and suggest retrying. Never attempt force-push.

## Interface

### Expects
- Git repository with remote configured (`origin/main`)

### Produces
- Clean, synced working tree (local matches remote)
- Loaded session context per Session Start Sequence
- Status report to Jon

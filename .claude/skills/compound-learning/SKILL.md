---
name: compound-learning
description: >
  Promote learnings into the orchestration layer — skills, references, CLAUDE.md — so
  behavior actually changes. Memory is a fallback for user/stakeholder-specific facts that
  don't generalize. Use when Jon says "compound this", "what did we learn", "that worked
  well", "save that pattern", "remember this for next time", or after completing any persona
  build, audit, skill file, strategy recommendation, or reference document. Also triggers
  when Jon notes an outcome — "Ross changed X", "that landed well", "that didn't work".
categories:
  - quality
  - learning
  - meta
tags:
  - compound-learning
  - patterns
  - templates
  - preferences
  - failures
  - orchestration
summary: "Disposition-first learning capture. Each learning is routed to a skill update, reference update, CLAUDE.md edit, or memory entry — defaulting to orchestration so behavior changes. Audit log in memory/learnings/_log.md."
---

# Compound Learning

After completing a deliverable, identify what was learned — then **promote the learning into the orchestration layer** so the next session benefits automatically. Memory is a fallback, not the default.

This is semi-autonomous: Claude proposes the learning AND its target file with a concrete diff. The user approves, edits, or rejects. Only on approval does Claude make the file change. The propose-then-approve gate is preserved; the leverage point shifts from "what frontmatter to give the memory file" to "where in orchestration this learning lands."

## Why Disposition-First

Memory doesn't reliably get scanned mid-task — a learning there sits hoping Claude finds it. A learning in a SKILL.md changes behavior next session, automatically. That's the difference between accumulating and compounding. Full rationale in `references/architecture-guide.md` → "Memory vs. Orchestration."

## When to Use

**Explicit triggers:** "compound this", "what did we learn", "save that pattern", "that worked well/didn't work", "Ross changed X", "[stakeholder] pushed back on Y", "what patterns are we seeing".

**Implicit triggers (offer, don't force):** after a persona build / audit / skill file, after a significant outcome, after a deliverable goes through revision (the delta IS the learning).

**Do NOT self-trigger:** decision logging (decision-journal handles), exchanges under ~100 words, or when the user says "skip".

**Auto-call from `/wrap`:** session-wrap calls this skill as a step when session markers fire (orchestration edits, multi-file changes, explicit "save that" phrases) — see session-wrap SKILL.md step 3. The propose-approve gate preserves user control: each proposal shows its budget line and the user approves, edits, redirects, or skips. Compound's resulting file edits get bundled into the wrap commit.

## Stakes Classification (gate before disposition)

- **Low** — quick answers, casual conversation, minor edits → skip unless explicitly asked
- **Medium** (default) — single skill/context update, routine audit dimension → run full workflow on one learning
- **High** — full persona build, complex audit, multi-file architecture decision → run full workflow on each distinct learning; may produce multiple file edits

If a session produced no novel learning, say so and stop. Capturing nothing is a valid outcome.

## Workflow

### Phase 1 — Identify the Learning Moment

Sources: success pattern, failure/revision (the delta IS the lesson), preference discovery, template extraction.

### Phase 2 — Extract the Learning

For each: one-sentence takeaway, context, the insight, when to apply, confidence (High/Medium/Low). Push for specificity — pass the quality gates in `references/learning-schema.md` (specificity, repeatability, non-obvious, not-already-documented).

### Phase 3 — Disposition Decision (the key step)

For each learning, classify the disposition. Walk through these in order — stop at the first one that fits:

| Disposition | Use when | Target |
|---|---|---|
| **Skill update** | Learning changes how a workflow runs | Edit relevant `.claude/skills/{skill}/SKILL.md` |
| **Reference update** | Learning changes a documented fact, framework, or convention | Edit relevant `references/{file}.md` |
| **New reference file** | Learning is reusable across many tasks but no existing reference fits | Create new `references/` file with frontmatter |
| **CLAUDE.md update** | Learning fundamentally affects all sessions in this vault (rare) | Edit `CLAUDE.md` |
| **Memory entry** | Learning is user/persona/stakeholder-specific and doesn't generalize | Append to relevant `memory/` file |
| **Audit-only** | Interesting but not actionable in any file | Log only, no file change |

See `references/learning-schema.md` for worked examples and the disposition decision questions.

**Two scope decisions inside disposition:**

1. **Local vault vs. persona-creator template?** When working in a deployed persona, default to *that vault's* skills/references/CLAUDE.md. Only escalate to persona-creator (cascades to all future personas) when the learning is fleet-wide — flag the escalation so the user approves the cross-vault edit.
2. **Existing file vs. new file?** Prefer updating an existing file. New files only when no existing file has the right scope.

**Default to Skill update or Reference update.** Memory is the fallback. Before writing memory, ask explicitly: "Could this go in a skill or reference instead?"

### Phase 4 — Propose to User (with budget gate)

**Step 4a — Budget check.** Before showing the diff, compute target file post-edit word count. Apply ceilings: **SKILL.md = 1,500 words; reference = 2,000; CLAUDE.md = 1,500.** Memory and audit-only dispositions skip the gate.

If post-edit exceeds the ceiling, **redirect** instead of proposing:
- **Skill update over ceiling** → New reference file + one-line pointer in the skill (the stakeholder-playbook pattern).
- **Reference update over ceiling** → Split into sub-references, OR trim older sections that don't fire in `_log.md` recently, then add.
- **CLAUDE.md update over ceiling** → New reference file + pointer in CLAUDE.md.

Full redirect table and worked examples in `references/learning-schema.md`.

**Step 4b — Present the proposal.** Show each learning with the budget line visible at decision time:

```
LEARNING: [takeaway]
CONFIDENCE: [High | Medium | Low]
DISPOSITION: [type]
TARGET FILE: [path]
BUDGET: [current] → [post-edit] / [ceiling] (under | OVER by N)
PROPOSED DIFF:
[exact text]
```

When redirected, show both: original target's budget overflow AND the redirected proposal (new file path + pointer text + content).

Show all learnings together for High-stakes sessions; inline for Medium. The user approves, edits, redirects, or rejects. This is the curation gate — do not skip the diff or the budget line.

### Phase 5 — Apply on Approval

For each approved learning:
1. Make the file edit using Edit tool (or Write for new files)
2. If the target file's frontmatter has `updated:`, the PostToolUse hook handles the date bump automatically
3. Confirm the change landed

### Phase 6 — Audit Log

Append a single line to `memory/users/{username}/learnings/_log.md` per applied learning:

```
2026-05-06 | Skill update | persona-audit/SKILL.md | Added routing decay check (Section 1)
2026-05-06 | Reference update | references/architecture-guide.md | Added "Memory vs. Orchestration" section
2026-05-06 | Memory | gpg-bi-strategy/memory/stakeholder-pulse.md | Lisa McNeece origin = Grimmway
2026-05-06 | Audit-only | (no file change) | Multi-paragraph stakeholder names — watch for more data
```

This is the only thing written to memory under the new model. It's an append-only audit trail, not a substitute for orchestration. See `references/learning-schema.md` for the full `_log.md` format.

### Phase 7 — Surface Prior Learnings (at task start, not session end)

When starting any deliverable, scan recent `_log.md` entries (last ~20 lines or last 30 days) for patterns relevant to the current task. Flag any that apply:

> "Recent learnings that apply here: [list]. The relevant skill/reference has already been updated — proceeding with current orchestration."

You don't need to re-read the target files — they're already loaded by normal scan-then-load. The `_log.md` scan is just a sanity check that the orchestration changes are catching the patterns they were meant to catch.

If a `_log.md` entry exists for a pattern but Claude is about to repeat the old behavior anyway, that's a flag — the orchestration update may not have actually taken effect (e.g., wrong target file, edit didn't land where the routing actually points). Surface this to the user.

## Common Pitfalls

- **Memory-by-default.** Memory is the fallback. If a learning ends up there, the disposition step must justify why it doesn't fit a skill or reference.
- **Vague proposals.** "I'll update persona-audit" without showing the diff is a bypass. Show the exact text.
- **Cross-vault edits without approval.** Editing persona-creator's templates from inside a deployed persona affects every future persona — flag explicitly.
- **Compounding everything.** Stakes Classification gates this. If the session produced no novel learning, capture nothing.
- **Skipping the audit log.** Even "audit-only" dispositions get a line in `_log.md`. Entries without a corresponding file edit are still valid.
- **Stale patterns.** If `_log.md` shows three entries on the same pattern targeting the same file, the file edit isn't holding — investigate why.

## Interface

### Expects
- Completed deliverable or outcome observation from the current session
- Active user identified (from session-start or Session Start Sequence)
- Knowledge of which vault you're in (deployed persona vs. persona-creator)

### Produces
- One or more orchestration-layer file edits (skill, reference, CLAUDE.md, or memory)
- One or more lines appended to `memory/users/{username}/learnings/_log.md`
- Behavior change visible in the next session

> **Done.** Learning(s) promoted into orchestration. Run `/sync` to save progress, or `/wrap` if this was your last task.

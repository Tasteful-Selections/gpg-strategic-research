---
title: "Learning Schema and Disposition Reference"
type: reference
updated: 2026-05-06
categories:
  - learning
  - quality
tags:
  - schema
  - disposition
  - compound-learning
  - audit-log
status: active
scope: persona-architect
summary: "Schema for learnings, quality gates, disposition decision questions, worked examples, and the _log.md audit-trail format. Consult during compound-learning Phases 2-6."
---

# Learning Schema and Disposition Reference

Rules for what gets captured, how it's classified, where it lands, and what the audit log looks like.

## Learning Types

| Type | Definition | Example |
|---|---|---|
| **pattern** | A repeatable approach that worked across 2+ instances | "Leading persona identity with interaction style before routing logic produces better QC scores" |
| **template** | A reusable structure or format — the actual artifact | "Board supplement section format: [metric] → [trend] → [so what] → [recommended action]" |
| **preference** | A user-specific choice that should persist | "Jon wants audit scores as PASS/NEEDS WORK/BROKEN, not numeric" |
| **failure** | Something that went wrong — captured to prevent regression | "Explore agents report frontmatter arrays as 'empty' when values are on subsequent YAML lines — verify with targeted reads" |
| **insight** | A one-time observation that may become a pattern with more data | "Splitting large skills into orchestrator + agent reduced context noise" |

Learning type doesn't determine disposition by itself — a pattern can land in a skill OR a reference; a preference may live in `preferences.md` (memory) OR in CLAUDE.md voice guidance. The disposition decision (below) is what determines target.

## Quality Gates

A learning must pass ALL of these before disposition. If it fails any, drop it:

- **Specificity test.** Can someone act on this without additional context? "Be more careful with frontmatter" fails. "Check that YAML array values aren't split across lines before reporting them as empty" passes.
- **Repeatability test.** Will this situation come up again? One-time debugging steps don't qualify. Recurring workflow patterns do.
- **Non-obvious test.** Would someone experienced in this domain already know this? "Read files before editing them" is obvious. "Verification agents consistently false-flag `.claude/rules/` files for missing frontmatter because those files intentionally skip it" is non-obvious.
- **Not-already-documented test.** Is this already captured in a reference, CLAUDE.md, or shared decision? Check before duplicating. If it IS documented but the documentation is wrong or incomplete, the learning should note the discrepancy as the proposed change.

## Confidence Levels

| Level | Criteria |
|---|---|
| **Low** | Single observation, plausible but unvalidated |
| **Medium** | Observed 2x, or validated by user in one conversation |
| **High** | Observed 3+ times, explicitly confirmed by user, or derived from a failure that was fixed |

Higher confidence does NOT mean larger disposition target. A High-confidence learning may still be a memory entry if it's user-specific.

## Disposition Decision Questions

Walk through these in order. Stop at the first "yes" — that's the disposition.

1. **Does this change how Claude *runs* a workflow?** → **Skill update.** The learning belongs as a step, gotcha, or constraint in a SKILL.md.
2. **Does this change a documented fact, framework, or convention?** → **Reference update.** Edit the relevant references/ file.
3. **Is this reusable across many tasks but no existing reference captures the right scope?** → **New reference file.** Create with proper frontmatter.
4. **Does this fundamentally affect every session in the current vault?** → **CLAUDE.md update.** (Rare — most learnings should land in skills or references.)
5. **Is this user/persona/stakeholder-specific, and doesn't generalize?** → **Memory entry.** Append to the relevant memory file (stakeholder-pulse, preferences, decisions).
6. **None of the above?** → **Audit-only.** Log it without a file change.

**Scope check at every disposition:**
- **Local vault** (default): edit lives in the persona you're currently working in
- **Persona-creator template** (escalated): edit lives in `C:\repos\persona-creator\` and cascades to all future personas via persona-design Phase 8. Always flag explicitly when proposing this — the user approves the cross-vault edit separately.

## Budget Thresholds (Phase 4a Gate)

Every Skill update / Reference update / CLAUDE.md update / New reference disposition must pass a budget check before it becomes a proposal. If the post-edit word count exceeds the ceiling, **redirect** to a budget-respecting alternative.

| Target type | Ceiling | Source |
|---|---|---|
| SKILL.md files | 1,500 words | persona-creator/references/architecture-guide.md → Token Budget Guidelines |
| Reference files | 2,000 words | persona-creator/references/architecture-guide.md → Token Budget Guidelines |
| CLAUDE.md (identity text) | 1,500 words | persona-creator/references/architecture-guide.md → Token Budget Guidelines |
| Context files | 2,000 words | (memory entries don't gate, but check this if the disposition is "Reference update" on a context file) |

Memory entries and audit-only dispositions skip the gate. Memory bloat is governed by digest archival policy and `_log.md` quarterly roll-up, not the compound-learning gate.

### Redirect Decision Table

When the original disposition would push the target over its ceiling, redirect:

| Original disposition | Over-ceiling redirect |
|---|---|
| **Skill update** | New reference file containing the new pattern (and any related ones already in the skill that fit the same theme) + a one-line pointer added to the skill. Mirrors the `references/stakeholder-playbook.md` pattern in gpg-bi-strategy. |
| **Reference update** | (a) **Split** — the existing reference becomes 2+ sub-references (e.g., `stakeholder-playbook.md` → `stakeholder-drafting.md` + `stakeholder-prebrief.md` + `stakeholder-intel.md`), each pointed at from the original or from a manifest. OR (b) **Trim** — identify older sections that haven't fired in `_log.md` recently (no entries pointing at them) and propose removal/archive to make room. |
| **CLAUDE.md update** | New reference file with a one-line pointer added to CLAUDE.md. CLAUDE.md should stay routing-and-identity, not detail. |
| **New reference file** | Already a fresh file — no redirect needed unless the new reference would itself exceed 2,000 words at creation time, in which case scope it tighter or split it pre-emptively. |

### Routing via `consults:` Frontmatter (Already-Over-Ceiling Skills)

When a SKILL.md is **already over ceiling at audit time**, even a one-line body pointer adds bytes to a skill that needs slimming. Route the new reference via the SKILL.md's `consults:` frontmatter array instead of the body:

```yaml
consults:
  - references/existing-ref.md
  - references/new-from-this-disposition.md  # body unchanged
```

The reference becomes discoverable via scan-then-load when the skill triggers. The skill body stays at its current word count — no body edit, no further bloat. Use for chronically over-budget skills where slimming is a separate refactor thread, not part of the current audit. Log the pre-existing overflow as a carry-forward thread; do not silently absorb it.

### Showing the Budget in the Proposal

Every proposal must include a BUDGET line so the user can see the consequence at decision time:

```
BUDGET: 1,364 → 1,470 / 1,500 (under by 30)
```

When a redirect happens due to budget, show both:

```
ORIGINAL DISPOSITION: Skill update on stakeholder-influence/SKILL.md
ORIGINAL BUDGET: 1,440 → 1,540 / 1,500 (OVER by 40)

REDIRECTED DISPOSITION: New reference file + skill pointer
NEW REFERENCE FILE: references/stakeholder-playbook.md
NEW REFERENCE BUDGET: 0 → 280 / 2,000 (under)
SKILL POINTER ADDITION:
[exact text — one or two lines]
SKILL BUDGET AFTER POINTER: 1,440 → 1,460 / 1,500 (under)
```

### Why the Gate Exists

Without it, every successful compound-learning run adds ~50-100 words to a skill. Over months, skills bloat past the ceiling — recreating the same context-budget failure mode that put learnings in memory in the first place. The disposition redesign closes the memory-bloat path; the budget gate closes the skill-bloat path. Both are required for the system to compound without degrading.

## Worked Examples

| Learning | Disposition | Target | Why |
|---|---|---|---|
| "When auditing, also diff CLAUDE.md routing against actual directory contents" | Skill update | `persona-audit/SKILL.md` Section 1 | Changes how the audit workflow runs |
| "Topic-clustered learnings outperform chronological per-insight files" | Reference update | `persona-creator/references/architecture-guide.md` | Documents an architectural convention |
| "Cross-model deployment validates with three-layer protocol" | New reference file | `cross-model/validation-protocol.md` | Reusable across personas, no existing file scoped right |
| "Always run domain-research before encoding domain claims" | CLAUDE.md update | Research Integration section | Affects every session in the vault |
| "Ross prefers structural overrides without pushback when framed cleanly" | Memory entry | `gpg-bi-strategy/memory/stakeholder-pulse.md` (Ross entry) | Stakeholder-specific, doesn't generalize |
| "Jon wants audit scores as PASS/NEEDS WORK/BROKEN, not numeric" | Memory entry | `memory/users/jon/preferences.md` | User-specific |
| "Compound-learning was writing to memory by default" | Reference update | `persona-creator/references/architecture-guide.md` (Memory vs. Orchestration) | This very change — fundamental architectural pattern |
| "Multi-paragraph stakeholder names sometimes mis-parsed — needs more data" | Audit-only | `_log.md` only | Single observation, hypothesis, no clear action yet |

## Anti-Patterns (do NOT capture)

- **Tautologies:** "Good personas have good identity text." No actionable content.
- **Environment-specific:** "My machine needed a restart before the hook worked." One-time debugging.
- **Already in references:** If `persona-creator/references/architecture-guide.md` already says this, don't duplicate it as a learning.
- **Emotional reactions:** "That audit was frustrating." Not a reusable insight.
- **Vague resolutions:** "Need to be more careful next time." With what? When? How?

## Audit Log Format (`_log.md`)

Every applied learning gets one line in `memory/users/{username}/learnings/_log.md`. Append-only. The file lives in memory but is NOT a substitute for orchestration — it's the audit trail.

**Format:**
```
YYYY-MM-DD | Disposition | Target file | Brief description
```

**Examples:**
```
2026-05-06 | Skill update | persona-audit/SKILL.md | Added routing decay check (Section 1)
2026-05-06 | Reference update | references/architecture-guide.md | Added "Memory vs. Orchestration" section
2026-05-06 | Memory | gpg-bi-strategy/memory/stakeholder-pulse.md | Lisa McNeece origin = Grimmway (Apr 28 correction)
2026-05-06 | New reference | cross-model/validation-protocol.md | Three-layer validation rubric
2026-05-06 | Audit-only | (no file change) | Multi-paragraph stakeholder names — watch for more data
2026-05-06 | Cross-vault | persona-creator/.claude/skills/persona-design/SKILL.md | Phase 8 deploys _log.md template
```

**Cross-User Migration Attribution.** When promoting another user's patterns on their behalf in a multi-user vault, append `[migrated by {acting-user}]` to the brief description so the originating user knows attribution at scan time:

```
2026-05-07 | New reference | references/catman-slide-conventions.md | Section-header titles for catman decks [migrated by jon]
```

The acting user also adds an entry to `memory/shared/changelog.md` documenting the cross-user write.

**Frontmatter for `_log.md`:**
```yaml
---
title: "Compound-Learning Audit Log"
type: memory
updated: YYYY-MM-DD
categories:
  - learning
  - audit-log
status: active
scope: {username}
summary: "Append-only audit trail of compound-learning dispositions. Each line records when a learning was promoted into orchestration (or memory, or audit-only). Consult to verify that orchestration changes are catching the patterns they were meant to catch."
---
```

## Staleness Rules for `_log.md`

| Age | Action |
|---|---|
| 0-90 days | Active, surface during compound-learning Phase 7 |
| 90+ days | Roll into a quarterly archive: `_log-archive-YYYY-Q[N].md` with `status: archived` |

Roll-up triggers when active log exceeds ~100 lines OR at quarterly cadence — whichever comes first.

## Repeated-Pattern Signal

If `_log.md` shows three or more entries targeting the same skill/reference for the same pattern, the file edit isn't holding. Possible causes:
1. Edit landed in the wrong file (routing points elsewhere)
2. Edit was overwritten by a subsequent change
3. The pattern is more nuanced than the single edit captured

Surface this to the user during Phase 7 with a recommendation to investigate before logging another entry on the same pattern.

## Migration from Topic Files

Personas built before 2026-05-06 may have `memory/learnings/{topic}.md` topic files (the previous compound-learning model). To migrate to the disposition model:

1. Read each topic file
2. For each pattern, walk the disposition decision questions
3. Propose target file + diff to the user
4. On approval, apply the file edit and append a `_log.md` entry: `YYYY-MM-DD | [Disposition] | [target] | [pattern title] (migrated from {topic}.md)`
5. After all patterns migrated, archive the topic file under `_archive/`

Migration is a one-time pass per persona. After migration, compound-learning operates under the new model going forward.

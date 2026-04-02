---
name: compound-learning
description: >
  Extract reusable patterns, templates, preferences, and failure modes after
  completing deliverables. Use when the user says "compound this", "what did we learn",
  "that worked well", "save that pattern", "remember this for next time",
  "what patterns are we seeing", or after completing any research report, strategic
  analysis, market assessment, or literature review. Also triggers when the user
  notes an outcome — "leadership used that finding", "that landed well", "that
  didn't work". Do NOT use for recording session summaries (use session-wrap).
  Do NOT use for casual conversation or quick factual answers.
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
summary: "Semi-autonomous learning extraction after deliverables. Claude proposes what was learned, user approves. Writes granular learning files to memory/learnings/."
---

# Compound Learning

After completing a deliverable, extract reusable patterns, templates, preferences, and failure modes — then store them so the next similar task starts from accumulated knowledge rather than scratch. The system gets smarter with each cycle.

This is semi-autonomous: Claude proposes what was learned, the user approves or edits, and the learning persists. Claude does NOT write directly to reference files or context files — learnings stay in their own directory until the user promotes them.

## When to Use

**Explicit triggers:**
- "compound this", "what did we learn", "save that pattern", "remember this for next time"
- "that worked well", "that didn't work", "leadership used that finding"
- "what patterns are we seeing" (synthesis across accumulated learnings)

**Implicit triggers (offer, don't force):**
- After completing a research report or strategic analysis — offer: "Want me to compound what we learned?"
- After the user notes a significant outcome
- After a deliverable goes through revision

**Do NOT trigger:**
- Session digests and working-state updates (session-wrap handles those)
- Quick factual exchanges under ~100 words
- When the user says "skip" or "just move on"

## Stakes Classification

| Stakes | Examples | Treatment |
|---|---|---|
| **Low** | Quick lookups, minor source checks | Skip unless explicitly asked |
| **Medium** | Single research summary, routine analysis | Quick compound — one learning file |
| **High** | Multi-source strategic assessment, market deep-dive, methodology refinement | Full compound with detailed extraction |

## Workflow

### Step 1: Identify the Learning Moment

1. **Success pattern** — a research methodology, source, or framing that produced high-value findings
2. **Failure/revision** — a source that was unreliable, an analysis angle that missed the mark
3. **Preference discovery** — how the user wants findings structured, what level of detail leadership needs
4. **Template extraction** — a report structure or analysis framework worth reusing

### Step 2: Extract the Learning

For each learning, formulate:
- **One-sentence takeaway**
- **Context** — what task produced this learning
- **The insight** — specific enough to act on
- **When to apply** — future situations
- **Confidence** — High / Medium / Low

### Step 3: Check for Existing Learnings

Scan `memory/learnings/` for similar learnings. Reinforce, refine, or flag contradictions.

### Step 4: Present for Approval

Show the proposed learning. User approves, edits, or rejects. Only write after approval.

### Step 5: Write the Learning File

Write to `memory/learnings/` as an individual markdown file. One insight per file.

**Filename convention:** `{category}-{brief-descriptor}-{YYYY-MM-DD}.md`

### Step 6: Surface Prior Learnings (Integration)

At the START of work:

1. Read `memory/learnings/` filtered by category
2. Surface relevant learnings before beginning
3. Apply templates automatically
4. Flag failure-type learnings as warnings

Integration points: surface learnings tagged with relevant categories before beginning any research task or analysis.

## Learning File Format

```markdown
---
title: "[Descriptive title]"
type: memory
updated: [date]
categories:
  - learning
  - [domain category: research, methodology, source, market, stakeholder, voice]
tags:
  - [pattern, template, preference, failure]
status: active
scope: gpg-strategic-research
confidence: [high, medium, low]
summary: "[One-sentence takeaway]"
related:
  - [source file if applicable]
---

# [Descriptive Title]

## Context
[What task produced this learning]

## The Learning
[Specific enough to act on]

## When to Apply
[Name the task type or situation]

## Confidence
[HIGH / MEDIUM / LOW — and why]
```

## Synthesis Mode

When the user asks "what patterns are we seeing" or 10+ learnings accumulate:

1. Cluster by theme
2. Identify contradictions
3. Propose promotions to reference files or methodology updates
4. User decides what gets promoted

## Common Pitfalls

- **Compounding everything.** Not every research session produces a learning.
- **Generic learnings.** Must be specific and actionable.
- **Never reviewing learnings.** Surface at task start or the system is dead weight.
- **Autonomous memory drift.** Claude does NOT write learnings without user approval.

## Interface

### Expects
- Completed deliverable or outcome observation
- Active user identified

### Produces
- **Capture mode:** Individual learning file in `memory/learnings/`
- **Surfacing mode:** Prior learnings at task start
- **Synthesis mode:** Clustered analysis with promotion recommendations

> **Done.** Learning captured (or surfaced, or synthesized). Run `/sync` to save progress, or `/wrap` if this was your last task.

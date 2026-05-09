---
name: output-qc
description: "Self-verify classification deliverables before presenting to Jon, Tom, or Tabari. Spawns an isolated QC subagent that checks output against classification-specific quality criteria and iterates fixes. Auto-triggers after producing classification CSVs/Excels, exception reports, audit reports, drift reports, taxonomy ruling drafts, or strategic recommendations. Also triggers when the user says 'check this', 'review your work', 'QC this', or 'is this right'. Adversarial review mode triggers when the user says 'grill this', 'stress test this', or 'poke holes in this'. Do NOT trigger for casual conversation, quick factual answers, short exchanges under ~100 words, or when the user says 'skip QC', 'just give it to me', 'rough draft is fine', or is actively iterating on a draft with you."
categories:
  - quality
  - verification
tags:
  - qc
  - review
  - self-check
  - classification-deliverables
summary: "Post-output quality gate using isolated subagent review. Catches dollar-weighting violations, hardcoded indices, substring-collision risk, missing exception reasons, format errors, and frontmatter drift before delivery."
agent: qc-reviewer
context: fork
user-invocable: true
---

# Output QC

Self-verify classification deliverables before presenting to the user. The reviewer runs in isolated context — it sees only the output and the rubric, not the reasoning that produced it.

## When to Run

**Auto-trigger after producing:**
- Classification output files (CSV/Excel from `classify-products` runs)
- Exception reports (from `exception-report` runs)
- Audit reports (`audit-codes` change-impact, `audit-drift` divergence)
- Taxonomy ruling drafts (before append to `classification-decisions.md`)
- Strategic recommendations or memos (Tabari-style data-science briefs, Jon-to-Tom hand-off specs)
- Excel review workbooks intended for Tom/Nathan/Kylie review
- Skill files, reference files, or CLAUDE.md edits in this vault

**Skip when:**
- The user is in rapid-fire Q&A mode (short factual exchanges)
- The user explicitly says "skip QC", "just give it to me", "rough draft is fine"
- Output is under ~100 words
- The user is actively iterating on a draft with you (they'll review themselves)
- Output is a plan or proposal awaiting the user's approval (QC happens after they approve and you build)

## Workflow

### Step 1: Classify Output and Select Dimensions

Map what you produced to the review dimensions from `references/qc-criteria.md`:

| Output Type | Dimensions to Check |
|---|---|
| Classification CSV/Excel | Dollar Weighting, Column Hygiene, Word-Boundary Matching, Confidence Routing, Exception Reasons, Source Columns Preserved |
| Exception report | Dollar Weighting, Exception Reasons, Pattern Recognition, Recommendation Specificity |
| Audit-codes report | Dollar Weighting, Old-vs-New Comparison Completeness, Flagship Risk Flagging, Recommendation Specificity |
| Audit-drift report | Diagnosis Taxonomy, Dollar Weighting, Remediation Specificity, Implementation-Block Sanity |
| Taxonomy ruling draft | Implementation Block, Reasoning Specificity, Precedent Articulation, Frontmatter Consistency |
| Skill files (SKILL.md) | Architecture Compliance, Trigger & Routing Quality, Token Budget, Examples & Concreteness, Voice & Tone |
| Reference / context files | Structure & Scannability, Factual Grounding, Token Budget, Frontmatter Consistency |
| Strategy / hand-off memos | Factual Grounding, Structure & Scannability, Voice & Tone, Recommendation Specificity |

### Step 2: Assemble QC Package

Gather for the subagent:
1. **The output** — file path(s) for CSV/Excel/markdown deliverables, or full text for inline output
2. **The dimensions** — which criteria from `references/qc-criteria.md` apply
3. **Audience context** — who sees this (Jon, Tom, Tabari, Nathan, external stakeholder), what's the purpose, any constraints the user specified

### Step 3: Spawn QC Reviewer

Use the Agent tool to invoke the `qc-reviewer` subagent with this prompt structure:

```
Review the following output against these quality dimensions.

OUTPUT TYPE: [type from Step 1]
AUDIENCE: [Jon / Tom / Tabari / Nathan / external — and why]
CONSTRAINTS: [anything the user specified — e.g., "Tom reviews on Monday, dollar-weighting non-negotiable"]

DIMENSIONS TO CHECK:
[list exact dimension names from Step 1]

CRITERIA FILE: Read .claude/skills/output-qc/references/qc-criteria.md for the rubric.

OUTPUT TO REVIEW:
[file paths if CSV/Excel/markdown, or full text if inline]
```

Use `model: sonnet` on the Agent call (already declared in the qc-reviewer agent file). The subagent has access to Read, Glob, Grep — it can load the criteria file, sample rows from CSVs, and verify against `taxonomy-rules.md`, `classification-decisions.md`, and `_log.md`.

The subagent returns a per-dimension verdict (see qc-reviewer.md for format).

### Step 4: Act on Verdict

**PASS** — Deliver to the user. Do not mention the QC pass.

**NEEDS-FIX** — Apply fixes only to the failing dimensions. Do not rewrite passing sections. Then re-run QC once (max 1 retry) with retry context:

```
RETRY: This is a re-check after fixes.
PREVIOUS VERDICT: [paste the previous verdict]
DIMENSIONS FIXED: [list which dimensions were addressed]
FOCUS: Check only the previously failing dimensions. Confirm fixes landed.

[updated output reference]
```

If the retry passes, deliver. If it still fails, escalate.

**ESCALATE** — Deliver with a one-sentence flag: "[X] — [reason]. Want me to adjust?" No QC report. No process narration.

### Step 5: Silent Delivery

Do NOT narrate the QC process. The user doesn't want to hear "I ran a quality check and found 3 issues which I corrected." Deliver clean work. The only visible output is ESCALATE flags.

## Adversarial Review Mode (Optional)

A different kind of review. Instead of checking against a rubric, this stress-tests the output by role-playing the audience. Runs INSTEAD of standard QC, not in addition to.

**Triggers:** the user says "grill this", "stress test this", "poke holes in this", or explicitly requests adversarial review.

**How to run:** Use the same qc-reviewer subagent but with an adversarial prompt:

```
ADVERSARIAL REVIEW — role-play the audience and attack this output.

AUDIENCE ROLE: [select from below based on output type and audience]
OUTPUT TO REVIEW:
[file path or full text]

Your job: Find what doesn't hold up. What questions would this audience ask
that the output doesn't answer? What claims are weakest? What's missing?
Return 3-5 specific challenges, ranked by severity ($-impact when applicable).
```

**Audience role templates:**
- **Tom (category management)**: "You are Tom Wopperer. You hand-code Excel monthly. You will catch any item where the classifier output disagrees with how you'd code it. What classifications in this output would you push back on?"
- **Jon (BI VP)**: "You are Jon. You expect dollar-weighted artifacts and word-boundary token matching. What in this output violates either? What numbers feel ungrounded?"
- **Tabari (data science)**: "You are Tabari. You're scanning for whether the deterministic logic is sound and the labeled output could feed an ML training set. What's not reproducible? What's not auditable?"
- **External skeptic**: "Find the weakest classification in this output and explain why it doesn't hold. What would Tom catch first?"

**Act on results:** Fix what you can. Flag what requires Jon/Tom judgment. Same silent delivery rule — don't narrate the adversarial pass.

> **Done.** QC complete, output delivered. Run `/sync` to save progress, or `/wrap` if this was your last task.

## Common Pitfalls

- **Over-triggering**: Don't QC casual conversation, plans awaiting approval, or working drafts the user is iterating on. Use the skip conditions.
- **Narrating the process**: Be invisible. The user wants output, not meta-commentary.
- **Full rewrites on partial failure**: If only Dollar Weighting fails, fix Dollar Weighting. Don't touch a passing Confidence Routing dimension.
- **Infinite loops**: Hard cap at 2 total checks (initial + 1 retry). Then escalate or deliver.
- **Vague findings**: "Could be improved" is useless. QC must produce specific, actionable fixes citing row, column, or section.
- **QC theatre**: Running the check but accepting everything. Criteria need teeth — especially Dollar Weighting, Word-Boundary Matching, and Implementation Block sanity. These are the patterns that have bitten this team before.
- **Skipping the file read**: When QCing a CSV, the reviewer must Read sample rows, not score from filename alone.

## Interface

### Expects (from upstream)
- **From any deliverable-producing skill (classify-products, exception-report, audit-codes, audit-drift, compound-learning):** The output (file path or text), output type classification, audience context, any user-specified constraints.

### Produces (for downstream)
- **To qc-reviewer agent:** Structured prompt containing output type, audience description, constraints, dimension list (from qc-criteria.md), criteria file path, and output reference. For retries: previous verdict, fixed dimensions, focus instructions.
- **To the parent conversation:** One of: clean output (PASS), fixed output (NEEDS-FIX resolved), or output + escalation flag (ESCALATE with issues requiring Jon/Tom judgment).

---
title: "Learning Schema and Classification"
type: reference
updated: 2026-04-01
categories:
  - learning
  - quality
tags:
  - schema
  - classification
  - compound-learning
status: active
scope: gpg-strategic-research
summary: "Schema, classification rules, and quality gates for compound learning entries. Consult when writing or reviewing learnings."
---

# Learning Schema and Classification

Rules for what gets captured, how it's classified, and what makes a learning useful vs. noise.

## Learning Types

| Type | Definition | Example |
|---|---|---|
| **pattern** | A repeatable approach that worked across 2+ instances | "Academic sources + industry reports triangulated produce more actionable findings than either alone" |
| **template** | A reusable structure or format — the actual artifact | "Research brief: executive summary → methodology → key findings → implications → recommended next steps" |
| **preference** | A user-specific choice that should persist | "Jon wants research output under 3 pages with findings before methodology" |
| **failure** | Something that went wrong — kept permanently | "Relying on a single industry report without cross-referencing led to outdated market sizing" |
| **insight** | A one-time observation that may become a pattern | "FDA regulatory filings contain early signals of ingredient trend shifts" |

## Category Taxonomy

| Category | Scope |
|---|---|
| `research` | Research methodology, source selection, synthesis approaches |
| `methodology` | Analytical frameworks, assessment models |
| `source` | Source reliability, access, data quality |
| `market` | Market dynamics, sizing, trends |
| `stakeholder` | How leadership uses research output |
| `voice` | Tone, detail level, framing preferences |

## Quality Gates

**Specificity test:** "Research should be thorough" fails. "Cross-reference USDA production data with trade publication forecasts — they diverge by 10-15% on emerging categories" passes.

**Repeatability test:** Will this apply to future research tasks?

**Non-obvious test:** Would an experienced strategic researcher already know this?

**Not-already-documented test:** Check reference files first.

## Confidence Progression

| Level | Criteria | Action |
|---|---|---|
| **Low** | Single observation | Tag as `insight`, revisit next time |
| **Medium** | Observed 2x or validated | Standard learning file |
| **High** | Observed 3+, confirmed | Candidate for promotion |

## Staleness Rules

| Age | Action |
|---|---|
| 0-90 days | Active |
| 90-180 days | Flag during synthesis |
| 180+ days | Review required |

## Anti-Patterns

- **Tautologies:** No actionable content
- **Already in references:** Don't duplicate
- **Vague resolutions:** "Research more carefully" is not a learning

## Promotion Criteria

1. High confidence (3+ observations)
2. Broadly applicable
3. Actionable as a rule
4. User approves

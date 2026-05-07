---
title: "Learnings — Migration Notice"
type: index
updated: 2026-05-07
categories:
  - learning
  - index
tags:
  - manifest
  - learnings
  - migration
status: active
scope: gpg-strategic-research
summary: "Migration notice: the legacy chronological per-insight pattern was superseded by the disposition model on 2026-05-07. Active learnings now live in the orchestration layer (skills, references, CLAUDE.md). The audit log lives at memory/users/jon/learnings/_log.md. Legacy files archived in _archive/."
---

# Learnings — Migration Notice

**As of 2026-05-07, this directory no longer holds active learning files.**

The compound-learning skill was rewritten to promote learnings into the **orchestration layer** (skills, references, CLAUDE.md) instead of memory. Memory was the wrong substrate — files here didn't reliably get scanned mid-task, so learnings sat unused and behavior never improved.

## Where to Find Things Now

| Type of learning | New home |
|---|---|
| Buyer-facing pricing data restrictions, GroundTruth V3 brief format, fold-into-working-doc preference | `references/output-formats.md` |
| Load-bearing question pattern (post-synthesis check) | `references/strategic-research.md` (Step 6) |
| Layered intelligence pipeline (CI + MCP + internal + syndicated) | `references/intelligence-pipeline.md` |
| Syndicated-data contract analysis, GenAI restrictions, two-tier architecture | `references/data-governance.md` |
| ADM transfer-pricing scandal (canonical cautionary tale) | `references/sources/adm-transfer-pricing-scandal.md` |
| Hospitality as canonical multi-brand-at-buyer analog | `references/sources/hospitality-multibrand-buyer.md` |
| Wayne-Sanderson + Sovos as canonical PE-backed rollup benchmarks | `references/sources/wayne-sanderson-sovos-benchmarks.md` |
| Audit trail of what was promoted where | `memory/users/jon/learnings/_log.md` |

## What's in `_archive/`

The 9 legacy chronological per-insight files migrated on 2026-05-07. All preserved with `status: archived` for traceability:

- `market-gpg-dominant-share-caution-2026-04-02.md`
- `methodology-ci-mcp-pipeline-for-deliverables-2026-04-02.md`
- `methodology-contract-analysis-for-data-governance-2026-04-02.md`
- `methodology-load-bearing-question-2026-04-30.md`
- `source-adm-transfer-pricing-scandal-2026-04-30.md`
- `source-hospitality-multibrand-buyer-2026-04-30.md`
- `source-wayne-sanderson-sovos-canonical-benchmarks-2026-04-30.md`
- `voice-buyer-facing-brief-iteration-2026-04-02.md`
- `voice-fold-benchmarks-into-working-doc-2026-04-30.md`

## Workflow Going Forward

When the compound-learning skill captures a new pattern:

1. The skill walks the **disposition decision questions** (`.claude/skills/compound-learning/references/learning-schema.md`)
2. The pattern lands in its right home (skill, reference, CLAUDE.md, or memory)
3. A line is appended to `memory/users/jon/learnings/_log.md` recording the disposition

This directory (`memory/learnings/`) does not get new active files. It exists only to preserve the archive.

## See Also

- `.claude/skills/compound-learning/SKILL.md` (in persona-creator) — the rewritten workflow
- `.claude/skills/compound-learning/references/learning-schema.md` (in persona-creator) — disposition decision questions, budget gate, redirect table

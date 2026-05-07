---
title: "Compound-Learning Audit Log"
type: memory
updated: 2026-05-07
categories:
  - learning
  - audit-log
status: active
scope: jon
summary: "Append-only audit trail of compound-learning dispositions for jon in gpg-strategic-research. Each line records when a learning was promoted into orchestration (or memory, or audit-only). Consult to verify that orchestration changes are catching the patterns they were meant to catch."
---

# Compound-Learning Audit Log

> Append-only. Newest entries at top. Each entry follows: `YYYY-MM-DD | Disposition | Target file | Brief description`. See `.claude/skills/compound-learning/SKILL.md` for the workflow that produces these entries.

## 2026-05-07 — Migration from legacy chronological learning files to disposition model

Migrated 9 legacy chronological per-insight files from `memory/learnings/` into the orchestration layer per the new compound-learning disposition workflow. Originals archived under `memory/learnings/_archive/`.

### Reference updates (folded into existing references)

```
2026-05-07 | Reference update | references/output-formats.md | Added "Buyer-Facing Materials — Pricing Data Restrictions" section (from market-gpg-dominant-share-caution-2026-04-02). BUDGET: 508 → 1090 / 2000 (under by 910)
2026-05-07 | Reference update | references/output-formats.md | Added "GroundTruth Buyer Brief — Three-Version Pattern" section (from voice-buyer-facing-brief-iteration-2026-04-02). BUDGET: rolled into above same edit
2026-05-07 | Reference update | references/output-formats.md | Added "Folding External Research into Working Docs" section (from voice-fold-benchmarks-into-working-doc-2026-04-30). BUDGET: rolled into above same edit
2026-05-07 | Reference update | references/strategic-research.md | Added Step 6 "Ask Load-Bearing Questions Before Final Delivery" (from methodology-load-bearing-question-2026-04-30). BUDGET: 649 → 888 / 2000 (under by 1112)
2026-05-07 | Reference update | references/mcp-data-guide.md | Added pointer to intelligence-pipeline.md and data-governance.md in Multi-Source Analysis Patterns section. BUDGET: 2795 → 2827 / 2000 (file pre-existing over ceiling; this addition is a 32-word pointer redirect, not new content — flagged for future split)
```

### New reference files (redirected from skill/reference updates and source benchmarks)

```
2026-05-07 | New reference | references/intelligence-pipeline.md | Layered intelligence pipeline (CI + MCP + internal + syndicated) for GroundTruth and recurring intelligence products (from methodology-ci-mcp-pipeline-for-deliverables-2026-04-02). REDIRECT: Original disposition was Reference update on mcp-data-guide.md, redirected because mcp-data-guide.md was already 2795/2000 (over ceiling). New file BUDGET: 0 → 557 / 2000 (under by 1443)
2026-05-07 | New reference | references/data-governance.md | Contract analysis methodology and two-tier architecture for syndicated data (from methodology-contract-analysis-for-data-governance-2026-04-02). BUDGET: 0 → 613 / 2000 (under by 1387)
2026-05-07 | New reference | references/sources/adm-transfer-pricing-scandal.md | Canonical ADM SEC settlement cautionary tale for merchant/allocation hybrid governance (from source-adm-transfer-pricing-scandal-2026-04-30). BUDGET: 0 → 466 / 2000 (under by 1534)
2026-05-07 | New reference | references/sources/hospitality-multibrand-buyer.md | Hospitality (Marriott/Hilton/IHG) as canonical analog for multi-brand-at-one-buyer structure (from source-hospitality-multibrand-buyer-2026-04-30). BUDGET: 0 → 436 / 2000 (under by 1564)
2026-05-07 | New reference | references/sources/wayne-sanderson-sovos-benchmarks.md | Wayne-Sanderson + Sovos as canonical PE-backed multi-entity rollup benchmarks (from source-wayne-sanderson-sovos-canonical-benchmarks-2026-04-30). BUDGET: 0 → 585 / 2000 (under by 1415)
```

### CLAUDE.md updates

```
2026-05-07 | CLAUDE.md update | CLAUDE.md | Added 4 new routing rows (intelligence-pipeline, data-governance, sources/ subdirectory, expanded output-formats and strategic-research scopes). BUDGET: 911 → 961 / 1500 (under by 539)
```

### Migration archive

```
2026-05-07 | Archive | memory/learnings/_archive/ | All 9 legacy files moved with status: archived: market-gpg-dominant-share-caution, methodology-ci-mcp-pipeline-for-deliverables, methodology-contract-analysis-for-data-governance, methodology-load-bearing-question, source-adm-transfer-pricing-scandal, source-hospitality-multibrand-buyer, source-wayne-sanderson-sovos-canonical-benchmarks, voice-buyer-facing-brief-iteration, voice-fold-benchmarks-into-working-doc
```

---

## How to Read This Log

Each line answers: when did we capture a learning, where did it land, what does it do?

If you see three+ entries on the same pattern targeting the same file, the file edit isn't holding — investigate before logging another. Common causes: edit landed in the wrong file, edit was overwritten by a later change, or the pattern is more nuanced than the single edit captured.

Roll-up: when this file exceeds ~100 lines OR at quarterly cadence, archive entries 90+ days old to `_log-archive-YYYY-Q[N].md` with `status: archived`.

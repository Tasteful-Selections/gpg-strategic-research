---
title: "Learnings — Migration Pending"
type: index
updated: 2026-05-06
categories:
  - learning
  - index
tags:
  - migration
  - legacy
status: stale
scope: gpg-strategic-research
summary: "MIGRATION PENDING: This directory uses the legacy compound-learning model where patterns were written to memory instead of the orchestration layer. Next session in this persona should trigger migration. See compound-learning-redesign-plan.md in persona-creator for the full plan and gpg-bi-strategy as the migration template."
---

# MIGRATION PENDING — Compound-Learning Redesign

**Status as of 2026-05-06:** This directory holds 9 legacy chronological per-insight learning files. They have NOT been migrated to the new disposition-first compound-learning model.

## Why this is flagged

The compound-learning skill was rewritten 2026-05-06 (see `C:\repos\persona-creator\.claude\skills\compound-learning\SKILL.md`). The new model promotes learnings into the **orchestration layer** (skills, references, CLAUDE.md) instead of memory. Memory was the wrong substrate — files here didn't reliably get scanned mid-task, so learnings sat unused and behavior never improved.

The full diagnosis and redesign plan are in `C:\repos\persona-creator\compound-learning-redesign-plan.md`.

## Next steps

When this persona is next worked on:
1. Read `C:\repos\persona-creator\.claude\skills\compound-learning\SKILL.md` and `C:\repos\persona-creator\.claude\skills\compound-learning\references\learning-schema.md`
2. Look at `C:\Repos\gpg-bi-strategy\` as the migration template (its commit `c5b175c` shows the full migration of 51 patterns)
3. Walk each legacy learning file through the disposition decision questions
4. Apply edits to the right home (skill / reference / CLAUDE.md / memory entry)
5. Build `memory/users/{username}/learnings/_log.md` with one line per applied disposition
6. Archive the original files to `memory/learnings/_archive/` with `status: archived`
7. Replace this README with the post-migration version

## What's currently in this directory

9 chronological per-insight files using `{topic-prefix}-{slug}-{YYYY-MM-DD}.md` naming. Date range: 2026-04-02 through 2026-04-30 (two distinct write batches). Grouped by topic prefix:

- **market** (1): gpg-dominant-share-caution (2026-04-02)
- **methodology** (3): ci-mcp-pipeline-for-deliverables (2026-04-02), contract-analysis-for-data-governance (2026-04-02), load-bearing-question (2026-04-30)
- **source** (3): adm-transfer-pricing-scandal (2026-04-30), hospitality-multibrand-buyer (2026-04-30), wayne-sanderson-sovos-canonical-benchmarks (2026-04-30)
- **voice** (2): buyer-facing-brief-iteration (2026-04-02), fold-benchmarks-into-working-doc (2026-04-30)

Smallest of the four backlogs. Note the `source-*` files are likely a distinct disposition class (canonical benchmark sources / case studies) that may belong in a `references/sources/` directory rather than skill files.

## Why we're not migrating now

The migration was started autonomously on 2026-05-06 with gpg-bi-strategy as the test case (51 patterns). The remaining personas (this one + 2 others) are flagged for migration in their next active session because:
- Each persona has its own architecture (skills, references, CLAUDE.md routing) that requires persona-specific disposition decisions
- Doing all 4 migrations autonomously in one session risks misclassifying patterns into the wrong target files
- The gpg-bi-strategy migration is the calibration baseline — apply that pattern with persona-specific judgment

This is intentional — better to migrate each persona deliberately when actively working in it than to batch-process all four with weakening judgment per persona.

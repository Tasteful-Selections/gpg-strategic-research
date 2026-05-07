---
title: "Layered Intelligence Pipeline (CI + MCP + Internal + Syndicated)"
type: reference
updated: 2026-05-07
categories:
  - methodology
  - intelligence-products
tags:
  - GroundTruth
  - competitive-intelligence
  - mcp
  - internal-data
  - syndicated-data
  - layered-pipeline
  - market-brief
status: active
scope: gpg-strategic-research
summary: "Four-layer intelligence pipeline (CI signals + public MCP data + internal data + syndicated data) for GroundTruth and other recurring intelligence products. Each layer makes the preceding layers more valuable — don't wait for all layers to ship products. Consult before scoping any new category brief or recurring intelligence deliverable."
related:
  - references/mcp-data-guide.md
  - references/data-governance.md
  - references/output-formats.md
---

# Layered Intelligence Pipeline

Pattern for building intelligence products (GroundTruth Market Briefs, category briefs, recurring deliverables) by layering four data sources. Demonstrated in the Carrots Q1 2026 brief — pulled live data across 4+ MCP sources and wove in CI signals successfully.

## When This Applies

- Any new GroundTruth product or category brief
- Recurring intelligence deliverables to retail buyers
- Cross-category briefs (potato, organic veg, value-added)
- Anytime the question is "what intelligence can we ship without waiting for [missing data layer]?"

## The Four Layers

| Layer | Provides | Source | When connected |
|---|---|---|---|
| **CI signals** | The "why" — what's happening and what it means | Competitive intelligence persona's weekly signals | Live |
| **Public MCP data** | The "how much" — quantified evidence | USDA MARS, NASS, FAS, FRED, Census, FoodData | Live |
| **Internal data** | The "only we know" — proprietary operational intelligence | Fabric (when connected) | Pending |
| **Syndicated data** | The "vs. market" — competitive benchmarking | Nielsen / Circana | Pending (GenAI-restricted; see `data-governance.md`) |

## The Compounding Effect

Each layer makes the preceding layers more valuable:
- **Public data is commodity** — anyone could look it up (but most don't)
- **CI adds GPG-specific interpretation** — what the public data means for our business
- **Internal adds proprietary ground truth** — our actual volumes, customers, costs
- **Syndicated adds competitive context** — our share, competitors' moves, channel dynamics

Don't wait for all layers to start shipping products. The first two layers alone produce buyer-useful intelligence.

## Worked Example: GroundTruth Carrots Q1 2026

Built entirely from CI weekly signals (supply squeeze, water constraints, competitive moves) + MCP public data:
- USDA MARS — pricing, movement, retail ads
- USDA NASS — production, acreage
- FRED — CPI context
- Census — demographics (available for future Opportunity Maps)
- FoodData Central — nutritional comparison

CI signals provided narrative spine: 257M lbs imports, 64% Mexico share, Arable consolidation, Walmart produce revamp. MCP data provided quantitative proof: weighted retail prices, year-over-year movement, regional truck rates.

No internal GPG data or Nielsen syndicated data required for V1.

## When to Apply

- Scoping any new category brief
- Designing recurring intelligence products
- Evaluating "do we have enough to ship now?" — answer is usually yes if Layers 1-2 are solid
- Cross-category template translation (the carrot template translates to potato, organic veg with category-specific MCP swap-ins)

## See Also

- `mcp-data-guide.md` — full MCP catalog and routing
- `data-governance.md` — contract restrictions on syndicated data and the two-tier architecture
- `output-formats.md` — Buyer-facing brief format rules (V3 trusted-update mode)

## Confidence

HIGH — demonstrated in working prototype (Carrots Q1 2026). The template works cross-category.

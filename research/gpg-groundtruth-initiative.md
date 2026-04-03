---
title: "GPG GroundTruth — BI as Competitive Sales Advantage"
type: strategic-plan
created: 2026-04-02
updated: 2026-04-02
status: active
categories:
  - bi-strategy
  - competitive-advantage
  - sales-enablement
  - data-governance
tags:
  - GroundTruth
  - category-management
  - category-captain
  - data-products
  - retailer-insights
  - nielsen-contract
  - two-tier-architecture
  - genai-restrictions
stakeholders:
  - Jon Grove (VP BI)
  - Ross Verner (CCO)
  - Tom Wopperer (Category Director)
  - Tiffany Stornetta (Dir Business Planning)
scope: enterprise
summary: "2-3 year strategic plan to build GPG GroundTruth — a branded category intelligence capability that transforms BI from an internal support function into a competitive sales differentiator. Defines product portfolio, data roadmap, team alignment, and path to Category Captain recognition."
related:
  - context/gpg-capabilities.md
  - context/competitor-landscape.md
  - references/mcp-data-guide.md
---

# GPG GroundTruth

**Seed to Shelf Intelligence**

A 2–3 year initiative to transform GPG's commercially-focused BI team into a buyer-facing category intelligence capability that differentiates GPG's sales team in every retail conversation.

---

## The Thesis

No large fresh vegetable grower has built a branded, buyer-facing data intelligence capability. The companies that have done this successfully are either in specialty produce (Mission Produce's AvoIntel for avocados), CPG (PepsiCo's pepviz), or intermediaries (Robinson Fresh). In commodity vegetables — carrots, potatoes, greens — this is greenfield.

GPG has three structural advantages that make this achievable:

1. **Vertical integration** — Seed-to-shelf operations generate proprietary data at every stage that competitors cannot replicate
2. **Scale** — World's largest carrot grower (10M lbs/day), 1.2B lbs potatoes annually, largest organic vegetable grower in North America
3. **Multi-category breadth** — Carrots + potatoes + organic vegetables under one roof enables cross-category insights no single-category competitor can offer

The play: build a branded intelligence capability called **GPG GroundTruth** that makes GPG's salespeople indispensable to retail buyers — not because of product, but because of the insights they bring to every meeting.

---

## Naming and Brand Framework

### Primary Brand

**GPG GroundTruth**

- **Tagline:** Seed to Shelf Intelligence
- **What it signals:** GPG's insights come from real production data and vertical integration — ground truth, not estimates
- **Usage:** Sales decks, category reviews, buyer-facing materials, industry award submissions

### Product Naming Convention

Individual deliverables carry the GroundTruth prefix:

| Product | Name |
|---|---|
| Category performance reports | GroundTruth Scorecard |
| Market intelligence briefs | GroundTruth Market Brief |
| Forward supply outlook | GroundTruth Supply Outlook |
| Full category review package | GroundTruth Category Review |
| Retailer whitespace analysis | GroundTruth Opportunity Map |
| Promotional effectiveness report | GroundTruth Promo Analysis |
| Cross-category basket insights | GroundTruth Basket View |
| Retailer-facing portal (future) | GroundTruth Portal |

### When to Use the Name

- **External:** Every buyer-facing data deliverable, category review, industry presentation
- **Internal:** Strategic plan references, board supplements when referencing the capability
- **Awards:** Category Captain submissions, IFPA presentations, industry press

---

## Product Portfolio

### Year 1 Products (2026): Foundation

Build on the existing 2026 BI strategic plan. These products don't require new team members — they reframe and extend work already planned.

#### 1. GroundTruth Market Brief

**What:** Periodic market intelligence reports combining public data into actionable category context. Published on a regular cadence (monthly or quarterly) and shared with sales team and key accounts.

**Contents:**
- Carrot/potato/organic veg production trends (USDA NASS)
- Wholesale pricing trends and seasonal patterns (USDA MARS)
- Consumer price index context — how retail produce pricing compares to overall food inflation (FRED)
- Import/export dynamics — competitive pressure from Mexico and global supply shifts (FAS, FAO)
- Regional market sizing and demographic trends (Census, BEA)
- Nutritional positioning data for sales conversations (FoodData Central)

**Data Sources (available now via MCP):**

| Source | What It Provides | Key Metrics |
|---|---|---|
| USDA MARS | FOB shipping point prices, movement volumes | Weekly price trends, origin tracking, organic vs. conventional |
| USDA NASS | Production, acreage, yields by state | Supply-side market sizing, competitive crop dynamics |
| FRED | CPI produce indices, retail sales, food spending | Consumer price context, retail channel trends |
| FAS | US imports/exports, global PSD balances | Import competition (Mexico), export opportunities |
| FAO | Global production/trade by country | International competitive context |
| Census | Population, income, grocery store counts by geography | Market sizing, demographic targeting |
| BEA | Regional GDP, consumer expenditure | Economic context, regional market health |
| FoodData | Nutritional profiles, competitor product comparison | Product positioning claims |

**Owner:** James Steimle (BI Analyst — building sales reporting infrastructure)
**Timeline:** Prototype Q2 2026, regular cadence Q3 2026
**Effort:** 4-8 hours/month once templated

**Example insight a sales rep walks into Kroger with:**
> "FOB carrot prices are up 12% YoY, but CPI shows only a 4% retail increase — margins are compressing across the category. GPG's supply outlook shows stable California production through Q3, positioning us to maintain pricing while competitors from Mexico face tariff uncertainty."

---

#### 2. GroundTruth Scorecard

**What:** Enhanced customer category scorecards that shift from "how GPG is performing at Retailer X" to "how Retailer X's carrot/potato/organic category is performing vs. market, and what to do about it."

**Distinction from current scorecards:**
- Current: GPG shipment volume, revenue, YoY trends at the account level
- GroundTruth: Account performance contextualized against market benchmarks, competitive set, and category opportunity

**Contents:**
- Account-level GPG performance (internal data — existing)
- Category market context from public data (USDA MARS pricing, NASS production trends)
- Nielsen/Circana benchmarking (when available — Q2 2026 pilot)
- Specific recommendations: assortment gaps, promotional timing, format opportunities

**Owner:** Tom Wopperer's category team (Nathan, Mike Morales, Kiley) with support from James
**Timeline:** Enhanced scorecard format Q3 2026
**Dependency:** ~~Nielsen/Circana pilot (Q2 2026)~~ **RESOLVED** — Nielsen live since Mar 2026 (Total Produce, 24 Premium Retailers, 40 Standard Food, monthly). Competitive benchmarking data is available now. Constraint shifts to: building the scorecard template and defining which metrics matter per account.
**Data governance note:** Scorecards containing Nielsen competitive data are Tier 2 deliverables — delivered as decks/PDFs, not through the Portal. See Data Governance section.

**Why it matters:** A scorecard that only shows GPG's performance is a supplier report card. A scorecard that shows the retailer's category performance vs. market is a category advisor tool. The buyer keeps the second one.

---

#### 3. GroundTruth Supply Outlook

**What:** Forward-looking supply visibility report that leverages IBP/S&OP data to tell key accounts what GPG can deliver over the next 8-12 weeks.

**Why this is differentiated:** In fresh produce, buyers constantly worry about supply disruption. A supplier who provides data-backed forward visibility — not just "we'll have product" but "here's our planted acreage, yield forecast, and production capacity outlook" — reduces the buyer's risk and locks in the relationship.

**Contents:**
- Forward production outlook by category (carrots, potatoes, organic veg)
- Seasonal transition alerts (growing region shifts, variety transitions)
- Supply confidence indicators based on field conditions
- Comparison to market supply signals (USDA MARS movement data, NASS acreage)

**Owner:** Tiffany Stornetta (Business Planning) — her IBP function already generates this data internally
**Timeline:** Internal version exists. External-facing version Q3-Q4 2026
**Sensitivity:** Requires careful calibration of what's shared externally vs. proprietary. Work with Ross on disclosure boundaries.

---

### Year 2 Products (2027): Differentiation

These products require the data foundation built in Year 1 (Nielsen integration, Fabric migration progress, template maturity) and may require additional headcount.

#### 4. GroundTruth Category Review

**What:** Full-format category review delivered to key retail accounts — the produce equivalent of what P&G or Frito-Lay delivers in center-store. This is the flagship product.

**Standard 10-section structure (industry expectation):**

1. **Category Performance vs. Goals** — How did the retailer's carrot/potato/organic category perform? Dollar sales, units, margin, shrink, YoY trends
2. **Market Context & Trends** — Total market sizing, growth rates, retailer vs. market performance (requires syndicated data)
3. **Consumer/Shopper Insights** — Purchase frequency, household penetration, basket affinity, demographic shifts (requires panel data or retailer loyalty data)
4. **Competitive Benchmarking** — Retailer performance vs. key competitors in their market (requires syndicated data)
5. **Assortment Recommendations** — Specific SKU additions/deletions/substitutions, supported by velocity data and distribution gaps
6. **Planogram Recommendations** — Shelf set guidance with facing counts and adjacencies (stretch capability)
7. **Pricing & Promotion Strategy** — Everyday pricing, promotional depth/frequency, multi-buy recommendations based on GroundTruth Promo Analysis
8. **Shrink Reduction Opportunities** — Rotation, pack size, ordering cadence (leveraging GPG's seed-to-shelf knowledge of product shelf life)
9. **Merchandising Recommendations** — Secondary placement, seasonal displays, cross-merchandising
10. **Action Plan** — Specific recommendations with projected impact and timeline

**Data Required:**
- Syndicated: Nielsen/Circana — **AVAILABLE** (Nielsen live Mar 2026, Circana in place). Tier 2 data governance applies.
- Panel: Numerator, 84.51 (Kroger), or retailer-specific loyalty data — future
- Internal: GPG shipment data, pricing, promotional history across 5 ERPs — **Fabric Q3 2026** will unify
- Public: All MCP sources for market context — available now

**Owner:** Tom Wopperer (lead) + category analyst assigned per account
**Timeline:** First full review for pilot account Q1 2027; 3 key accounts by Q4 2027
**Headcount implication:** May need additional category analyst or dedicated GroundTruth analyst

**Category Captain milestone:** A documented Category Review that drives measurable category growth at a retailer is the core requirement for the Progressive Grocer Category Captain submission.

---

#### 5. GroundTruth Opportunity Map

**What:** Retailer-specific whitespace analysis showing where a buyer's produce department has gaps relative to their trade area demographics, competitor stores, and category growth opportunities.

**This is the produce version of what made AvoIntel famous:** Mission showed a regional retailer that its shopper demographics over-indexed for large households turning to club stores, and recommended complementing their assortment with club-size packs. That's not product selling — that's category advising.

**Contents:**
- Retailer trade area demographics (Census data — population, income, household size, Hispanic/multicultural population)
- Competitive store density and estimated category performance (syndicated + Census business counts)
- Gap analysis: where the retailer is under-indexed relative to market and demographics
- Specific opportunity sizing: "Adding organic baby carrots in your top 30 stores could capture $X in annual incremental category sales"

**Data Sources:**
- Census MCP: Demographics and grocery store density by geography (available now)
- Syndicated: Competitive benchmarking (Nielsen/Circana, by 2027)
- Internal: GPG distribution data showing where products are and aren't sold
- BEA: Regional economic context

**Owner:** Category team + James (demographic/geographic analysis)
**Timeline:** Prototype using public data Q2 2027; full version with syndicated Q3 2027

---

#### 6. GroundTruth Promo Analysis

**What:** Promotional effectiveness reporting that shows buyers which promotions drove incremental volume vs. what was simply pantry-loading or cannibalization.

**Why this is rare in produce:** CPG does promotional lift analysis routinely with IRI/Circana. In fresh produce, promotions are common but almost never measured for true effectiveness. A supplier who can prove "your 2-for promotion on baby carrots drove 18% incremental volume, while your TPR on whole carrots was 90% pantry-loading" is giving the buyer information they can't get from anyone else.

**Data Required:**
- Internal: GPG promotional shipment data (existing, needs unification across ERPs)
- Syndicated: Pre/post promotional velocity (requires Nielsen/Circana at the store-week level)
- Retailer POS: Ideal for true lift measurement (Crisp platform or direct retailer feeds — Tier 3)

**Owner:** Mike Morales (pricing/promo expertise) + Freddy (analytical modeling)
**Timeline:** Internal promotional analysis Q2 2027; buyer-facing reports Q3 2027
**Dependency:** Pricing/promo optimization work already planned for Q3 2026 is the building block

---

#### 7. GroundTruth Basket View

**What:** Cross-category basket analysis showing retailers what shoppers buy alongside carrots, potatoes, and organic vegetables — and how to merchandise for basket-building.

**Why GPG is uniquely positioned:** No other single produce supplier spans carrots, potatoes, AND organic vegetables. GPG can tell a retailer: "When your shoppers buy baby carrots, they're 3x more likely to also buy hummus and ranch dressing. Cross-merchandising baby carrots with dips at a secondary display drives 22% incremental carrot volume." Nobody else in commodity vegetables can offer this cross-category view from a single supplier.

**Data Required:**
- Retailer loyalty/panel data (84.51 for Kroger, Numerator for cross-retailer, or direct feeds)
- Internal: GPG cross-category shipment patterns
- Syndicated: Basket affinity data from Nielsen/Circana panel

**Owner:** Tom's category team
**Timeline:** Concept development Q3 2027; retailer-specific basket analysis Q4 2027
**Dependency:** Panel data access — this may be the hardest data source to secure

---

### Year 3 Products (2028): Category Captain

#### 8. GroundTruth Portal

**What:** Retailer-facing digital platform where a buyer or category manager can access GroundTruth market intelligence and GPG-derived insights on demand.

**Critical constraint — Nielsen contract Section 2(e):** The Portal **cannot display raw Nielsen/Circana syndicated data** to buyers. The contract prohibits using licensed "Information or References in any client external facing or third-party application or product." This means the Portal is a **Tier 1 data product** — public data, GPG internal data, and GPG-derived insights only.

**What the Portal CAN show:**
- Market context from public data (USDA pricing, production, import trends — all MCP sources)
- GPG supply outlook and forward production visibility (IBP data)
- GPG-derived category insights and recommendations (analytical output, not raw syndicated)
- Account-level GPG performance data (internal shipments, pricing)
- Demand signal forecasts (AI-powered, built on Tier 1 data)

**What the Portal CANNOT show:**
- Raw Nielsen market share or competitive benchmarking data
- Circana store-level or retailer-specific syndicated metrics
- Any data sourced directly from licensed syndicated feeds

**The competitive intelligence that uses syndicated data stays in the human-delivered products** (Category Reviews, Scorecards, Opportunity Maps) — presented as decks/PDFs in buyer meetings. This is actually the right design: high-touch, analyst-delivered competitive intelligence has more impact than a self-service dashboard in produce. It's how Mission Produce's AvoIntel works.

**What this looks like:**
- Power BI Embedded dashboards, externally accessible with authentication
- Account-specific views: market context, GPG supply visibility, derived recommendations
- Updated on a regular cadence (monthly refreshes)
- GPG sales rep and buyer both access the same market context view

**Technology:** Power BI Embedded — the team already uses Power BI, and Embedded supports secure external sharing. No custom software needed.

**Owner:** James (Power BI development) + Jon (architecture)
**Timeline:** Pilot with 1-2 accounts Q2 2028; broader rollout Q4 2028
**Headcount implication:** Likely requires the BI Analyst (Operations) hire from the enterprise analytics vision

---

#### 9. GroundTruth Demand Signal

**What:** AI-powered demand forecasting offered as a buyer service — GPG tells the retailer what's coming before the buyer sees it in their own data.

**Why this is possible:** Tabari's AI infrastructure + USDA data + GPG's supply chain data + retailer POS feeds = the ingredients for predictive demand signals. A produce company that can tell a buyer "based on weather patterns in California, production data, and your store-level velocity, we project a 15% demand spike for baby carrots in weeks 18-22 — here's a pre-positioned supply plan" is operating at a level no vegetable grower has reached.

**Owner:** Tabari Brannon (AI/ML) + Tiffany (demand planning)
**Timeline:** Internal prototype Q1 2028; buyer-facing pilot Q3 2028
**Dependency:** AI infrastructure maturity, retailer POS data access, Fabric migration completion

---

#### 10. Category Captain Submission

**What:** Progressive Grocer Category Captain submission for fresh carrots and/or fresh potatoes.

**Submission Requirements:**
1. **Innovation** (800 words) — Describe GPG GroundTruth: the branded intelligence capability, its data sources, analytical methods, and how it differs from what any other produce supplier offers
2. **Measured Results** — Document a specific retailer engagement where GroundTruth recommendations drove measurable category growth (not just GPG brand growth). Need: dollar sales lift, market share change, shrink reduction, or household penetration improvement
3. **Retailer Feedback** — Direct testimony from a retail partner confirming GroundTruth's impact on their category decisions

**Target:** Submit for 28th or 29th annual awards (2027 or 2028 cycle, depending on when a documented retailer success is ready)

**Prerequisite:** At least one GroundTruth Category Review engagement that drove measurable, documented results at a named retailer. Start building the measurement framework in Year 1.

**Note:** Shenandoah Growers (herbs) and Idaho Potato Commission (potatoes) have won as smaller/commodity players by investing in primary research and building branded analytical tools. GPG has more scale and data advantages than either. This is very achievable.

---

## Data Source Roadmap

### Available Now (2026 Q2)

| Source | Type | Access Method | Key Value |
|---|---|---|---|
| USDA MARS | Public | MCP | Wholesale pricing, movement volumes, seasonal patterns |
| USDA NASS | Public | MCP | Production, acreage, yields — supply-side market sizing |
| FRED | Public | MCP | Consumer price indices, retail sales, food spending trends |
| FAS | Public | MCP | Import/export dynamics, global supply/demand |
| FAO | Public | MCP | Global production context, international competitive landscape |
| Census | Public | MCP | Demographics, income, grocery store density by geography |
| BEA | Public | MCP | Regional economic health, consumer expenditure |
| FoodData | Public | MCP | Nutritional positioning, product comparison |
| GPG Internal | Internal | 5 ERPs (fragmented) | Shipment data, pricing, customer history, production |
| IBP Data | Internal | Tiffany's function | Forward supply outlook, demand plans |

### Coming Online (2026)

| Source | Type | Target Date | Key Value | Status |
|---|---|---|---|---|
| Nielsen (NielsenIQ) | Syndicated | **Confirmed — contract signed Feb 2026, data live Mar 2026** | Total Produce syndicated category, 24 Premium Retailers, 40 Standard Food Retailers, 3yr history, monthly updates | **ACTIVE** — RPE LLC contract through Dec 2028. GenAI restrictions apply (see Data Governance section) |
| Circana | Syndicated | Confirmed — in place | Complementary syndicated coverage | Active — check contract for GenAI-specific language |
| Fabric Data Platform | Internal | **Q3 2026** | Unified cross-ERP data, single source of truth | Confirmed timeline — IT dependency managed |
| Analytics Hub | Internal | 2026 H2 | Centralized report distribution, KPI standards | Mockups complete, 1-2 months from launch |

### Future State (2027-2028)

| Source | Type | Target Date | Key Value | Dependency |
|---|---|---|---|---|
| Retailer POS Feeds | External | 2027-2028 | Store-level sell-through, true demand signal | Crisp platform or direct retailer integration |
| Panel Data (Numerator, 84.51) | External | 2027 | Shopper behavior, basket affinity, household penetration | Budget, vendor relationship |
| Retailer Loyalty Data | External | 2028 | Account-specific shopper insights | Retailer partnership (varies by account) |

### Data Maturity Curve (Updated April 2026)

```
2026 Q2    Public data (MCP) + CI signals + Nielsen/Circana (LIVE)
           → Market Briefs, Scorecards with competitive context

2026 Q3    + Fabric (unified internal data across 5 ERPs)
           → Enhanced Scorecards, Supply Outlook, Promo foundations

2027 Q2    + Panel data (Numerator/84.51) + mature Fabric
           → Category Reviews, Opportunity Maps, Promo Analysis

2028 Q2    + Retailer POS + AI demand models
           → Portal (public + internal only), Demand Signal, Category Captain
```

**Key acceleration:** Nielsen and Circana confirmed + Fabric Q3 pulls the Scorecard and Category Review timelines forward by 2-3 quarters vs. original plan. The constraint is no longer data availability — it's the GenAI/data governance architecture (see below).

---

## Team Alignment

GroundTruth doesn't require a new team — it reframes and elevates what the existing team builds. Ownership maps to current roles:

| Team Member | GroundTruth Role | Current Work That Feeds It |
|---|---|---|
| **Tom Wopperer** | Category Review lead, Opportunity Map owner | Category analysis, board-level baby carrot work |
| **Mike Morales** | Promo Analysis architect, scorecard methodology | Pricing/promo expertise, category analysis (carrots) |
| **Nathan Burton** | Potato category analyst for scorecards/reviews | Potato category analysis |
| **Kiley Nairn** | Organic veg analyst for scorecards/reviews | Organic vegetable category analysis |
| **James Steimle** | Market Brief builder, Portal architect | Sales reporting infrastructure, Power BI development |
| **Freddy Carrillo** | Analytical modeling for promo lift, demand | Gross margin models, S&D analytics |
| **Tiffany Stornetta** | Supply Outlook owner | IBP process, demand-supply planning |
| **Tabari Brannon** | Demand Signal AI/ML development | AI infrastructure, USDA AI application |
| **Jon Grove** | GroundTruth architect, strategic direction | BI strategy, executive relationships |

### Headcount Implications

| Hire | From Enterprise Vision | When Needed | GroundTruth Role |
|---|---|---|---|
| BI Analyst (Operations) | Yes — first spoke hire | 2027-2028 | Portal development, data product scaling |
| AI/ML Analyst | Yes — partner with Tabari | 2028 | Demand Signal development |
| Data Engineer #2 | Yes — 5 ERPs too thin | 2027 | Fabric migration, data pipeline reliability |

Year 1 operates within current headcount. Year 2-3 scaling aligns with the enterprise analytics vision hiring plan.

---

## Milestone Roadmap

### Year 1 — 2026: Build the Foundation, Ship First Products

| Quarter | Milestone | Products | Dependencies |
|---|---|---|---|
| Q2 | Market Brief prototype using MCP public data | GroundTruth Market Brief v1 | MCP data stack (available) |
| Q2 | Nielsen/Circana pilot kicks off | — | Budget, vendor (Karen White) |
| Q3 | Enhanced scorecards with market context | GroundTruth Scorecard v1 | Nielsen pilot data |
| Q3 | Pricing/promo optimization work (existing plan) | Promo Analysis foundation | Internal data unification |
| Q3 | Whitespace prioritization (existing plan) | Opportunity Map foundation | Internal data |
| Q4 | Supply Outlook piloted with 1-2 key accounts | GroundTruth Supply Outlook v1 | Ross approval on disclosure, Tiffany's IBP data |
| Q4 | GroundTruth name and branding formalized | Brand package for sales team | Marketing/Ross alignment |

**Year 1 success criteria:** Sales team uses GroundTruth Market Briefs and Scorecards in buyer meetings. At least 2 retail buyers reference GPG's data capability as a differentiator. Ross endorses GroundTruth as part of Commercial's sales narrative.

### Year 2 — 2027: Differentiate and Prove Impact

| Quarter | Milestone | Products | Dependencies |
|---|---|---|---|
| Q1 | First full GroundTruth Category Review for pilot account | Category Review v1 | Syndicated data, unified internal data |
| Q2 | Opportunity Map prototype with Census + syndicated data | Opportunity Map v1 | Census MCP + Nielsen/Circana |
| Q2-Q3 | Promo Analysis reports for key accounts | Promo Analysis v1 | Promotional data unification |
| Q3 | Cross-category Basket View concept | Basket View prototype | Panel data access |
| Q4 | 3 key accounts receiving full Category Reviews | — | Team capacity, data maturity |
| Q4 | Document measurable category growth at pilot account | Category Captain evidence | Retailer measurement framework |

**Year 2 success criteria:** Full Category Reviews delivered to 3+ key accounts. At least one documented case where GroundTruth recommendations drove measurable category growth. Measurement framework in place to prove impact for Category Captain submission.

### Year 3 — 2028: Scale and Recognize

| Quarter | Milestone | Products | Dependencies |
|---|---|---|---|
| Q1 | Demand Signal AI prototype (internal) | Demand Signal v1 | Tabari AI infrastructure, Fabric |
| Q2 | GroundTruth Portal pilot with 1-2 accounts | Portal v1 | Power BI Embedded, external sharing |
| Q2 | Category Captain submission drafted | — | Documented retailer success |
| Q3 | Demand Signal piloted with key account | — | Retailer POS data access |
| Q3 | Progressive Grocer Category Captain submission | — | Innovation narrative, measured results, retailer testimony |
| Q4 | Portal expanded to top accounts | — | Headcount (BI Analyst Ops hire) |

**Year 3 success criteria:** GPG recognized as Category Captain or Category Advisor for fresh carrots or potatoes. GroundTruth Portal live for key accounts. AI-powered Demand Signal in pilot. GroundTruth is a known capability in the produce industry.

---

## Data Governance: Two-Tier AI Architecture

### The Constraint

The Nielsen contract (RPE License Agreement, 19 February 2026) contains explicit GenAI restrictions in two places:

**Access to Services Exhibit, Section 4(vi) and Data Warehouse Exhibit, Section 2(f):**
> "Client shall not use or otherwise process any Information and/or Services in any non-NIQ-provided or non-NIQ-authorized large language or generative AI models ('GenAI Tool(s)'). Should Client desire to use or otherwise process any Information and/or Services through any such GenAI Tool(s), Client and NIQ shall execute a 'GenAI Limited Authorization Exhibit'"

**Additionally, Data Warehouse Exhibit Section 2(e):**
> "Client shall not use Information or References in any client external facing or third-party application or product"

Circana contract should be reviewed for parallel language (action item below).

### What This Means

1. **No sending raw Nielsen data to Claude, ChatGPT, or any GenAI tool** — the prohibition covers "use or otherwise process," not just model training. This includes pasting data into a prompt.
2. **Nielsen has a pre-built escape hatch** — the "GenAI Limited Authorization Exhibit" means they *expect* customers to request this. It's a gatekeeping mechanism, not a blanket ban.
3. **Azure OpenAI in GPG's own tenant is the most likely authorized path** — Microsoft's enterprise data isolation guarantees align with Nielsen's security requirements.
4. **Derived insights are not restricted** — aggregated analytical output created by GPG's team (via SQL, DAX, Python, or authorized GenAI) is GPG's work product, not Nielsen's licensed data.
5. **The "external facing application" restriction** means the GroundTruth Portal cannot display raw Nielsen data to buyers through a self-service dashboard. Decks and PDFs presented in buyer meetings are compliant — that's standard industry practice.

### Two-Tier Architecture

```
┌─────────────────────────────────────────────────────────────┐
│  TIER 1: OPEN (Claude, MCP tools, any AI)                   │
│                                                             │
│  Public data: USDA, FRED, Census, BEA, FAO, FAS, FoodData  │
│  GPG internal data: shipments, pricing, production, IBP     │
│  CI signals and analysis                                    │
│  Derived insights from Tier 2 (aggregated, no raw Nielsen)  │
│                                                             │
│  Products: Market Briefs, Supply Outlook, Demand Signal     │
│  Delivery: Any format including Portal                      │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│  TIER 2: RESTRICTED (Fabric + authorized GenAI only)        │
│                                                             │
│  Nielsen syndicated (Total Produce, 24 Premium + 40 Std     │
│    retailers, monthly, 3yr history)                         │
│  Circana syndicated (review contract for specific terms)    │
│                                                             │
│  Processing options:                                        │
│   a) SQL/DAX/Python in Fabric — always compliant            │
│   b) Azure OpenAI in GPG tenant — compliant if GenAI        │
│      Limited Authorization Exhibit signed, or if Azure      │
│      qualifies as "NIQ-authorized"                          │
│   c) Derived insights passed to Tier 1 — always compliant   │
│      (aggregated output = GPG's work product)               │
│                                                             │
│  Products: Scorecards, Category Reviews, Opportunity Maps   │
│  Delivery: Decks/PDFs only (NOT in Portal)                  │
└─────────────────────────────────────────────────────────────┘
```

### Product Delivery Model by Data Tier

| Product | Uses Nielsen? | Delivery Format | Portal Eligible? | Contract Status |
|---|---|---|---|---|
| Market Brief | No | Any | Yes | Tier 1 — clean |
| Supply Outlook | No | Any | Yes | Tier 1 — clean |
| Demand Signal | No | Any | Yes | Tier 1 — clean |
| Scorecard | Yes — competitive benchmarks | Deck/PDF | No (Nielsen portions) | Tier 2 — compliant as deliverable |
| Category Review | Yes — sections 2, 3, 4 | Deck/PDF, in-person | No | Tier 2 — industry standard practice |
| Opportunity Map | Yes — market performance | Deck/PDF | No (Nielsen portions) | Tier 2 — compliant as deliverable |
| Promo Analysis | Maybe — depends on source | Deck/PDF if Nielsen used | Conditional | Check data source per analysis |
| Basket View | No (panel data) | TBD | TBD | Separate contract (Numerator/84.51) |
| Portal | **No raw Nielsen** | Self-service dashboard | Yes — Tier 1 data only | Tier 1 data + GPG-derived insights |

### The Hybrid Pipeline (Recommended Production Workflow)

```
Nielsen raw data in Fabric
        │
        ▼
SQL/DAX/Python query (or Azure OpenAI if authorized)
        │
        ▼
Derived insight: "Retailer X organic carrot share grew 8% YoY,
                  under-indexed vs. market by 3pp"
        │
        ▼
Claude (Tier 1) synthesizes derived insight + public MCP data + CI signals
        │
        ▼
GroundTruth product (Category Review deck, Scorecard PDF, etc.)
```

This pipeline keeps Nielsen data in Fabric (compliant), extracts only aggregated analytical output (GPG's work product), and uses Claude for synthesis and narrative — never seeing raw licensed data.

### Key Insight: The Contract Reinforces the Right Architecture

The "external facing application" restriction means the Portal cannot serve raw Nielsen data to buyers. But the products that *need* Nielsen (Scorecards, Category Reviews, Opportunity Maps) are the ones that should be **human-delivered** anyway. A category analyst presenting a tailored deck is higher-impact than a self-service dashboard in produce. This is how Mission Produce's AvoIntel works — and they've won three Category Captain awards.

The Portal (Year 3) serves public market context, GPG-derived insights, and supply visibility — all Tier 1 data. The high-value competitive intelligence stays in the human-delivered products where it has the most impact.

### Action Items — Data Governance

1. **Request GenAI Limited Authorization Exhibit from Nielsen.** Contact Mona Teffeteller (NIQ account rep) or account team. Frame: "We plan to use Azure OpenAI within our own tenant to analyze licensed data for internal business purposes." Standard request — they built the mechanism for this.
2. **Review Circana contract for parallel GenAI language.** Pull exact restriction text and compare to Nielsen terms.
3. **Brief Kirsten (CFO/CIO) on two-tier architecture.** Data governance implications of tiered AI processing based on licensing restrictions. Positions BI as thinking about governance properly — builds credibility for enterprise vision.
4. **Tabari: prototype hybrid pipeline.** Fabric → SQL/DAX derived insights → Claude synthesis. Use GPG internal data as stand-in. This becomes the standard GroundTruth production workflow.
5. **Don't wait for the GenAI exhibit to ship products.** The derived insights approach is compliant *now*. Start building.

### Nielsen Contract Reference

- **Contract:** RPE License Agreement (19 February 2026)
- **Client entity:** RPE, LLC
- **NIQ entity:** Nielsen Consumer LLC
- **Term:** March 1, 2026 — December 31, 2028
- **Invoice contact:** Tom Wopperer (twopperer@grimmwayproduce.com)
- **NIQ Contact:** Mona Teffeteller (Opportunity #OP-000660865)
- **Coverage:** Total Produce syndicated category, All Outlet Combined Expanded + Food + Drug + Convenience channels, 24 Premium Retailers, up to 40 Standard Food Retailers, monthly updates, 3-year history
- **Data access:** Connect (BI Tool, 10 users, 10M datapoints/user/month) + Data Delivery Manager (125B datapoints/year) + Configuration Manager (10 custom characteristics)

---

## Intelligence Pipeline: CI + MCP + Internal Data

GPG GroundTruth is not a standalone capability — it sits at the convergence of three intelligence streams that already exist or are being built:

### The Pipeline

```
[1] CI Weekly Scanning          → Market signals, competitor moves, supply disruptions
     (competitive-intelligence)    Narrative context for every GroundTruth product

[2] MCP Public Data Stack       → Quantitative proof behind the narrative
     (8 data servers)              Production, pricing, imports, demographics, economics

[3] Internal + Syndicated Data  → Proprietary edge no competitor can replicate
     (Fabric + Nielsen/Circana)    Shipments, margins, promotional lift, market share
```

### How the Streams Feed Each Product

| GroundTruth Product | CI Signals | MCP Public Data | Internal/Syndicated |
|---|---|---|---|
| Market Brief | Supply disruptions, competitor moves, retail signals | MARS pricing, NASS production, FRED CPI, FAS imports | — (Year 1: public only) |
| Scorecard | Customer-specific competitive signals | MARS market pricing context | GPG shipments, Nielsen share |
| Supply Outlook | Water/weather alerts, import disruptions | NASS acreage, FAS trade, MARS movement | IBP forward plans, field data |
| Category Review | Competitive landscape, retail strategy shifts | Census demographics, BEA economics, all pricing | Full internal + syndicated |
| Opportunity Map | Retailer competitive positioning signals | Census demographics, business counts | Nielsen/Circana benchmarks |
| Promo Analysis | Competitor promotional activity | MARS price trends for context | GPG promo shipments, retailer POS |
| Basket View | Cross-category retail signals | FoodData nutritional positioning | Panel data, loyalty data |
| Demand Signal | Weather, supply disruptions, tariff signals | MARS movement trends, FAS trade | AI models on internal data |

### What's Available Now vs. Coming Online

**Available today (can prototype immediately):**
- CI weekly scanning: 24 signals classified, 5 patterns identified, operational since March 2026
- MCP stack: 8 data servers covering USDA (NASS, MARS, FAS, FoodData), FRED, BEA, Census, FAO
- First prototype: GroundTruth Market Brief — Carrots Q1 2026 (built April 2026 using MCP data + CI signals)

**Live as of April 2026:**
- Nielsen syndicated data — Total Produce, 24 Premium + 40 Standard Retailers, monthly, 3yr history
- Circana syndicated data — in place

**Coming Q3-Q4 2026:**
- Fabric data platform — Q3 2026 (unified internal data across 5 ERPs)
- Analytics Hub (centralizing report distribution)
- Standardized GPG sales reporting (unified view across ERPs)
- Nielsen GenAI Limited Authorization Exhibit (pending request to NIQ)

**Coming 2027:**
- Panel data access (Numerator, 84.51)
- Retailer POS feeds (Crisp or direct integration)

### The Strategic Insight

The CI persona and the MCP data stack together let GPG build the **narrative + quantitative** foundation of GroundTruth immediately — before a single dollar is spent on Nielsen or Fabric. The first Market Brief prototype demonstrates this: CI signals provide the "why" (supply squeeze, water constraints, competitive moves) and MCP data provides the "how much" (29% bulk price increase, 64% Mexico import share, $2B category value).

When internal and syndicated data come online, they don't replace this foundation — they add the **proprietary layer** that turns public intelligence into competitive advantage. The progression:

1. **Public data** tells everyone the same story (if they bother to look — most don't)
2. **CI signals** add interpretation and competitive context (GPG-specific)
3. **Internal data** adds ground truth that only GPG has (proprietary)
4. **Syndicated data** adds competitive benchmarking (paywalled but shared among subscribers)
5. **Retailer data** adds account-specific precision (the ultimate lock-in)

Each layer makes the preceding layers more valuable. Start now, layer up.

---

## Competitive Moat Analysis

### Why Competitors Can't Easily Replicate This

| Advantage | GPG | Taylor Farms | Bolthouse | Dole | Fresh Del Monte |
|---|---|---|---|---|---|
| Vertical integration (seed to shelf) | Full | Minimal (fresh-cut processor) | Partial (PE-stripped) | Partial | Partial |
| Multi-category produce data | Carrots + potatoes + organic veg | Salads/fresh-cut only | Carrots only (diminished) | Broad but shallow | Broad but shallow |
| Dedicated BI team (commercially focused) | 12-person team | Unknown | Unknown | Unknown | Unknown |
| Scale in commodity vegetables | #1 carrots, major potatoes | #1 fresh-cut (different game) | Distant #2 carrots | Diversified | Diversified |
| IBP/S&OP maturity | Oliver Wight certified process | Unknown | Unknown | Unknown | Unknown |
| AI/ML infrastructure | Built (Tabari) | Unknown | Unknown | Unknown | Unknown |

**The durable advantage:** GroundTruth's insights are grounded in proprietary data from vertical integration. A competitor could buy the same syndicated data and MCP public sources, but they can't replicate GPG's field-level production data, cost structure visibility, or cross-category operational intelligence. The name says it: ground truth.

---

## Risks and Mitigations

| Risk | Likelihood | Impact | Mitigation | Status |
|---|---|---|---|---|
| Nielsen/Circana integration delayed or budget-cut | ~~Medium~~ | ~~High~~ | ~~Start with public data first~~ | **RESOLVED** — Nielsen signed Feb 2026, Circana in place. Both confirmed. |
| Fabric migration stalls (IT dependency) | Low-Medium | Medium — limits internal data unification | Build Year 1 products from available ERP data; Fabric confirmed Q3 2026 | **Reduced** — Q3 target confirmed. Monitor IT delivery. |
| GenAI contract restrictions block AI-powered analysis | Medium | Medium — forces manual analysis or two-tier architecture | Request Nielsen GenAI Limited Authorization Exhibit; use derived insights pipeline as fallback; prototype Fabric → Azure OpenAI path | **NEW** — See Data Governance section |
| Nielsen "external facing application" restriction limits Portal | Confirmed | Low-Medium — Portal design adjusted | Portal serves Tier 1 data only; syndicated insights stay in human-delivered products | **ACCEPTED** — Architecture adapts. Actually reinforces the right design. |
| Buyer validation not yet done | Medium | High — building products buyers may not want in current format | Test concept with 2-3 friendly buyers via Ross/sales team before investing in production templates. Year 1 framed as sales team enablement, not direct buyer deliverables | **NEW** — Critical to validate format/depth before scaling |
| Category Marketing territory overlap | Low | Medium — org politics could slow initiative | Tim (Karen's boss) available as advocacy path if needed. GroundTruth positioned as BI capability that enables Category Marketing, not competes with it | **Deprioritized** — escalation path to Tim exists |
| Team capacity stretched | Medium | Medium — slower product rollout | Year 1 products are extensions of existing work. Year 2 may need headcount. Market Brief incremental effort needs clear owner. | Ongoing |
| Competitor launches similar capability | Low | Medium — first-mover advantage erodes | Move fast on naming and first products; first mover in commodity vegetables has significant advantage | Ongoing |
| Disclosure sensitivity (supply outlook) | Medium | Low — manageable with Ross | Define clear boundaries on what's shared externally; review with Ross before first external delivery | Ongoing |
| Category Captain timeline may be aggressive | Medium | Low — miss a cycle, submit next year | Target Category Advisor (honorable mention) for 2028, full Captain for 2029 if evidence trail isn't ready. Or accelerate with focused single-account pilot in H2 2026 | **NEW** — Realistic timeline adjustment |

---

## Immediate Next Steps

### Completed
- [x] **Market Brief prototype:** First GroundTruth Market Brief built (Carrots Q1 2026) using MCP data + CI signals. See `research/groundtruth-market-brief-carrots-q1-2026.md`

### Q2 2026 — This Quarter

1. **Jon + Ross alignment:** Present the GroundTruth concept and get Ross's endorsement for the name, buyer-facing positioning, and Year 1 product plan
2. **Buyer validation:** Have Ross or a senior sales lead test the Market Brief concept with 2-3 friendly buyers. Key question: does this change how they think about GPG? What format do they want? Do they value market context or their-store-specific insights more?
3. **~~Karen White alignment~~** — Deprioritized. Tim (Karen's boss) is the advocacy path if Category Marketing alignment is needed.
4. **Request Nielsen GenAI Limited Authorization Exhibit:** Contact Mona Teffeteller or NIQ account team. Frame: "Azure OpenAI within our own tenant for internal business analysis." Standard request.
5. **Review Circana contract:** Pull exact GenAI restriction language for parallel analysis
6. **Brief Kirsten on two-tier architecture:** Data governance framing — tiered AI processing based on data licensing. Builds credibility for enterprise vision.
7. **Tabari: prototype hybrid pipeline:** Fabric → SQL/DAX derived insights → Claude synthesis. Stand-in dataset for now. This becomes the standard GroundTruth production workflow.

### Q3 2026

8. **Scorecard upgrade plan:** Work with Tom's team to define enhanced GroundTruth Scorecard with Nielsen competitive benchmarking (now that data is live)
9. **Year 1 framing decision:** Based on buyer validation — are Year 1 products buyer-facing deliverables or sales team enablement tools? This shapes everything.
10. **Measurement framework:** Start documenting baseline category performance at 1-2 key accounts to measure GroundTruth impact over time (required for Category Captain evidence trail)
11. **Single-account deep pilot:** Consider picking one retailer + one category (baby carrots at Kroger?) and building the full GroundTruth experience to prove the concept and build Category Captain evidence

---

## Appendix: Competitive Intelligence — Who Has Done This

### Mission Produce — AvoIntel (Gold Standard in Produce)

- Three consecutive Progressive Grocer Category Captain Awards
- Dedicated analyst team delivers customized category reviews
- Showed a retailer that demographics over-indexed for club-size packs → 33% increase in weekly bag unit sales
- Organic avocado program drove 62% category growth
- Model: human-delivered service backed by proprietary data, not a SaaS platform

### PepsiCo — pepviz (Gold Standard in CPG)

- Proprietary data practice combining consumer insights, advanced analytics, data science
- Tells retailers what customers buy at *other* stores in their area
- Hyperlocal product-mix optimization with demonstrated results
- 25,000 salespeople visiting 500,000 retail locations weekly, feeding field intelligence back
- The model GPG GroundTruth aspires to replicate in produce

### Idaho Potato Commission (Commodity Board Model)

- Category Captain for fresh potatoes 2023
- Showed a northeastern retailer it was underperforming by 21.3% in total potato category sales
- Collaborative plan drove 19.4% market share gain and 5% YoY dollar sales increase
- Operates through field-deployed category consultants with syndicated data

### Robinson Fresh (Intermediary Model)

- Category management dashboards leveraging 1.8B annual digital transactions
- Demand forecasting tools combining customer shipping data with market intelligence
- Doesn't grow produce — data is the entire value-add on top of logistics

### Shenandoah Growers (Vertically Integrated Grower — Closest GPG Analog)

- Category Captain in herbs — a vertically integrated grower in a niche category
- Invested in primary consumer research
- Built a branded category management tool with proprietary metrics ("Basil Coefficient")
- Used branded insights to win Category Captain from a smaller base than GPG
- **Proof that a grower can win this award without being the size of PepsiCo**

---
title: "Product Taxonomy & Classification Research"
type: reference
updated: 2026-04-07
categories:
  - classification
  - category-management
  - syndicated-data
  - product-taxonomy
tags:
  - taxonomy
  - value-added
  - faceted-classification
  - produce-classification
  - merchandising
  - PLU
  - GS1
  - LanguaL
  - syndicated-data
  - Nielsen
  - Circana
stakeholders:
  - BI
  - category-management
  - product-classifier
status: active
scope: gpg-strategic-research
summary: "Research on product taxonomy and classification approaches for fresh produce syndicated data. Covers multi-perspective classification (product-intrinsic, merchandising, internal), value-added definitions, faceted classification frameworks (LanguaL, GS1 GPC, FoodOn), industry approaches (Instacart, Walmart, Taylor Farms), and architectural patterns for building a classification engine. Consult when working on product classifier rules, taxonomy design, or syndicated data attribute enrichment."
related:
  - context/gpg-capabilities.md
  - context/competitor-landscape.md
  - references/mcp-data-guide.md
---

# Product Taxonomy & Classification Research

Research conducted 2026-04-07 to inform GPG's product classification engine for syndicated data. Covers how others approach taxonomy and classification in grocery/retail, with emphasis on fresh produce challenges.

## Table of Contents

- [1. The Produce Data Infrastructure Problem](#1-the-produce-data-infrastructure-problem)
- [2. Standard Produce Classification Systems](#2-standard-produce-classification-systems)
- [3. Who Else Is Building Classification Engines](#3-who-else-is-building-classification-engines)
- [4. Multi-Perspective Classification Frameworks](#4-multi-perspective-classification-frameworks)
- [5. Faceted Classification: The LanguaL Model](#5-faceted-classification-the-langual-model)
- [6. Value-Added Definitions in Produce](#6-value-added-definitions-in-produce)
- [7. Retailer Merchandising Zones](#7-retailer-merchandising-zones)
- [8. Occasion-Based Classification](#8-occasion-based-classification)
- [9. Architecture Patterns for Multi-View Taxonomy](#9-architecture-patterns-for-multi-view-taxonomy)
- [10. Governance: Reconciling Conflicting Views](#10-governance-reconciling-conflicting-views)
- [11. Tools, Platforms, and Data Sources](#11-tools-platforms-and-data-sources)
- [12. Academic and Industry Papers](#12-academic-and-industry-papers)
- [13. Recommended Architecture for GPG Classifier](#13-recommended-architecture-for-gpg-classifier)
- [14. What This Research Did NOT Find](#14-what-this-research-did-not-find)

---

## 1. The Produce Data Infrastructure Problem

**Confidence: Confirmed** — sourced from IFPS, GS1, NIQ, Circana documentation.

The fundamental classification gap between produce and center-store CPG is **identification infrastructure**. Center-store packaged goods have a clean data chain: every item has a manufacturer-specific UPC barcode, scanned at POS, flowing into Nielsen/Circana syndicated databases with brand, size, variety, and supplier all encoded.

Fresh produce operates differently:

### PLU Codes
- Administered by IFPS (International Federation for Produce Standards)
- Only ~1,500 codes exist globally for ALL fresh produce
- 4-digit = conventional; prefix '9' + 4 digits = organic (e.g., 4011 = conventional banana, 94011 = organic banana)
- **No built-in intelligence** — digits are randomly assigned, not hierarchical
- **No supplier identification** — a PLU for conventional bananas is the same regardless of grower
- Cannot roll up PLU 4094 (broccoli crowns) into "cruciferous vegetables" programmatically

### Random-Weight UPCs (Type 2)
- Format: 2-XXXXX-CPPPP-C where the item identifier is **retailer-specific**
- The same carrot bag can have different codes at Kroger vs. Walmart
- Fundamentally breaks cross-retailer analysis

### Generic UPC Phase-Out
- IFPA and CPMA stopped issuing generic UPCs as of January 2020
- Pushing toward brand-owner-specific UPCs for supplier traceability
- Adoption remains uneven across the industry

### GS1 DataBar
- Designed for small loose produce items
- Encodes GTIN plus additional data (lot, weight)
- Reduces POS scan time from ~4 seconds (manual PLU entry) to ~1 second
- Adoption incomplete

### Syndicated Data Solutions
- **Nielsen "Total Food View"** — integrates UPC and random-weight items into unified dataset; coverage gaps persist
- **Circana (IRI) "Integrated Fresh"** — standardized category definitions across random-weight and UPC items; acknowledged that measuring total department size was previously difficult due to inconsistent retailer definitions

### Implication for GPG Classifier
The classifier cannot rely on standardized codes as the primary key for produce items. A **master product identity layer** is needed that maps across PLU, Type 2 UPC, brand-owner UPC, and retailer-specific codes to a single canonical product. This is a data engineering prerequisite that precedes taxonomy design.

---

## 2. Standard Produce Classification Systems

**Confidence: Confirmed** — sourced from IFPS, GS1, USDA, FMI.

| System | Administered By | Structure | Strengths | Limitations |
|---|---|---|---|---|
| **PLU Codes** | IFPS | Flat list, ~1,500 codes | Universal POS recognition | No hierarchy, no supplier ID, no intelligence |
| **UPC/GTIN** | GS1 | Brand-owner prefix + item code | Supplier traceability for packaged items | Doesn't cover loose/random-weight produce |
| **GS1 GPC** | GS1 | Segment > Family > Class > Brick + Attributes | Global standard, interoperable | Product-intrinsic only — no merchandising or business views |
| **USDA Grades** | USDA AMS | Descriptive tiers: Extra Fancy, Fancy, No. 1, No. 2, No. 3 | Quality standardization | Not a classification system — grading only |
| **UNSPSC** | UNDP | 4-level, 8-digit codes | Procurement/supply chain | Too coarse for retail; not produce-specific |
| **FMI Random Weight** | FMI | Delegated to commodity trade associations | Standardizes random-weight UPC assignments | Fragmented governance across associations |
| **USDA WWEIA Categories** | USDA ARS | ~170 food categories, 4-digit codes | Nutritional research | Designed for dietary surveys, not retail |

### Key Gap
No single system provides a complete product hierarchy from commodity down to variety/pack/form. This is why every produce company builds custom classification layers.

---

## 3. Who Else Is Building Classification Engines

**Confidence: Confirmed** on Instacart, Walmart, Crisp, Harmonya. **Inferred** on DoorDash and Shopify (limited public detail).

### Instacart
- Dedicated **Taxonomy team** within Catalog Engineering organization
- Multi-level categorization structure (e.g., Food > Snacks > Cookies) powering Search, Browse, Ads, and Product Replacements
- Uses Levenshtein distance + product popularity for candidate matching
- Deep learning for product replacement suggestions
- Now applying LLMs at scale (2025)
- **Key lesson:** Taxonomy is not a one-time project — it's an ongoing function with dedicated staffing

### Walmart (Retail Graph)
- Product knowledge graph using two complementary extraction algorithms:
  - **NLP-based model** (Stanford Core NLP POS tagger) for coverage
  - **Heuristic model** (rule-based HTML parsing) for accuracy
- Context-aware disambiguation: "cherry" means different things in candles vs. produce vs. furniture
- Builds dictionaries of (product type, attribute name, attribute value) triplets from high-selling SKUs
- Governance layer filters extraction noise using existing product metadata + manual validation
- **Key lesson:** Use BOTH rules and ML in production — neither alone is sufficient

### Crisp
- AI-driven master data harmonization across 40+ retailers
- Probabilistic matching across datasets
- Auto-classification and recommendation of new classifications
- Launched "AI Master Data" (Feb 2026) enabling custom product roll-ups (e.g., by flavor profile, ingredient)
- Flows into Snowflake, Google Cloud, Power BI

### Harmonya
- Master product hierarchy approach linking identifiers across systems (Walmart code to Amazon ID to syndicated provider classification)
- AI-driven attribute extraction from unstructured sources
- Automated quality checks flagging inconsistencies for human review
- **Key lesson:** A single product carries 3-4 different identifiers across systems that never automatically connect

### Shopify (2025)
- Published "Evolution of Product Classification: From Categories to Comprehensive Product Understanding"
- Shift from rigid category trees to flexible, multi-dimensional product understanding

### Food/Grocery Data Provider Ecosystem

| Category | Providers | What They Offer |
|---|---|---|
| **Data Syndicators** | Syndigo, Salsify, Data Council/Rivir/IX-One, 1WorldSync | Standardized product information across channels |
| **Attribute Platforms** | GreenChoice, SPINS/Pinto, NielsenIQ/Label Insight, Vestcom/healthyAisles, Sifter, HowGood | Health, dietary, sustainability data layers |

---

## 4. Multi-Perspective Classification Frameworks

**Confidence: Confirmed** — sourced from academic literature, PIM vendors, GS1, LanguaL.

GPG needs three simultaneous classification views of the same product:

| View | What It Covers | Standard Basis | Who Owns It |
|---|---|---|---|
| **Product-intrinsic** | What the product IS — commodity, variety, form, processing level | GS1 GPC, LanguaL facets A-H | Product/R&D |
| **Merchandising/retail** | Where/how it's sold — shelf placement, department, occasion, temperature zone | No standard exists — retailer-specific | Category Management |
| **Internal business** | How GPG sees it — brand strategy, supply chain group, margin tier, strategic priority | Proprietary | BI/Finance |

### Theoretical Foundation: Faceted Classification
S.R. Ranganathan's PMEST model (Personality, Matter, Energy, Space, Time) from library science. Key insight: faceted classification allows representation of the same subject from multiple viewpoints simultaneously, as opposed to enumerative systems that force a single hierarchy.

Instead of one tree (Produce > Carrots > Baby Carrots > Organic), you define independent facets (commodity type, form factor, organic status, brand, supply chain origin) and each product carries values across ALL facets simultaneously. Each "view" is a query or projection across specific facets.

### Multiple Hierarchies vs. Polyhierarchies
- **Multiple hierarchies** = separate complete trees (product tree, merchandising tree, business tree)
- **Faceted classification** = independent attribute dimensions queryable in any combination
- **Polyhierarchy** = single item appearing in multiple places within the same tree

For GPG's classifier, **faceted classification** is the correct model.

---

## 5. Faceted Classification: The LanguaL Model

**Confidence: Confirmed** — sourced from LanguaL.org, FoodOn, Nature (2018).

LanguaL (Langua aLimentaria) is the gold standard for multi-faceted food classification. International framework with 12,605 descriptors across 14 independent facets:

| Facet | Code | What It Captures | Baby-Cut Carrots Example |
|---|---|---|---|
| Product Type | A | Category of food | Vegetable product |
| Food Source | B | Biological origin | Daucus carota |
| Part of Plant/Animal | C | Which part | Root |
| Physical State/Form | E | Shape, form factor | Cut, shaped pieces |
| Heat Treatment | F | Cooking/blanching | Not heat treated |
| Cooking Method | G | How prepared | N/A |
| Treatment Applied | H | Processing steps | Peeled, washed, chlorine rinse |
| Preservation Method | J | How preserved | Refrigerated, modified atmosphere |
| Packing Medium | K | What it sits in | N/A |
| Container/Wrapping | M | Packaging type | Plastic bag |
| Food Contact | N | Surface contact material | Plastic film |
| Consumer Group | P | Target consumer | General |

### FoodOn (Modern Successor)
Open ontology building on LanguaL, integrating 16 additional OBO Foundry ontologies for biological taxonomy, chemistry, and environmental data. Published in Nature npj Science of Food (2018). Uses knowledge graph architecture — most flexible but hardest to implement operationally.

### Mapping to GPG's Three Views

| GPG View | LanguaL Facets | Additional Custom Facets Needed |
|---|---|---|
| Product-intrinsic | A, B, C, E, F, H | Variety, growing method, grade |
| Merchandising/retail | J, K, M + custom | Shelf placement, temperature zone, occasion, convenience tier |
| Internal business | None from LanguaL | Brand, supply chain group, margin tier, strategic category |

---

## 6. Value-Added Definitions in Produce

**Confidence: Confirmed** on USDA and IFPA definitions. **Inferred** on industry working definition.

### USDA Definition (Value-Added Producer Grant Program)
Five pathways qualify as "value-added":
1. **Change in physical state** — irreversible processing (fruit to jam, grain to flour)
2. **Differentiated production** — practices creating market identity (organic, non-GMO)
3. **Physical segregation** — identity-preserved marketing through supply chain
4. **Farm-based renewable energy** — agricultural commodities for energy
5. **Locally produced** — distributed within 400 miles or same state

### Industry Working Definition: The Processing Spectrum

| Level | Processing | Examples | Typical Location |
|---|---|---|---|
| 0 — Raw/Bulk | Harvested, washed, graded, packed | Whole carrots, head lettuce, loose tomatoes | Wet rack / dry table |
| 1 — Trimmed | Light trimming, sizing | Celery hearts, broccoli crowns | Wet rack |
| 2 — Minimally Processed / Fresh-Cut | Peeled, cut, washed, MAP packaged | Baby-cut carrots, bagged salad, broccoli florets | Packaged refrigerated |
| 3 — Ready-to-Eat (RTE) | Processed + portioned, may include non-produce | Snack packs, salad kits with dressing, fruit cups | Value-added wall |
| 4 — Ready-to-Cook (RTC) | Recipe-portioned, may include seasonings | Stir-fry blends, vegetable meal kits | Value-added wall |
| 5 — Meal Solutions | Multi-category assembly with protein | Complete meal kits | Grab-and-go |

### The Baby Carrot Classification Problem
Baby-cut carrots are the canonical gray-area example. They undergo cutting, peeling, shaping, washing, and packaging — more processing than whole carrots or head lettuce. IFPA's position: value-added items like bagged lettuce, baby carrots, and sliced apples should NOT be classified as "processed."

### NOVA Classification Regulatory Risk
- NOVA Group 1: Unprocessed/minimally processed (where IFPA wants baby carrots)
- NOVA Group 3: Processed foods (where some regulators might place baby carrots)
- IFPA is actively lobbying to keep minimally processed produce in Group 1
- This is a live regulatory fight with implications for labeling, health claims, and category positioning

### Recommendation for GPG Classifier
Use a **numeric processing-level scale** (0-5) rather than a binary value-add flag. Let each reporting view define its own threshold:
- Circana might call Level >= 1 "value-added"
- GPG internal view might set the bar at Level >= 2
- NOVA classification maps to Level <= 1 = Group 1, Level >= 3 = potentially Group 3

---

## 7. Retailer Merchandising Zones

**Confidence: Confirmed** — sourced from trade publications.

Retailers organize produce by **physical handling requirements** and **shopper mission**, not botanical taxonomy:

### A. Wet Rack / Misted Section
- Leafy greens (lettuce, kale, chard, spinach)
- Cruciferous vegetables (broccoli, cauliflower, cabbage)
- Root vegetables requiring hydration (beets, radishes, parsnips)
- Celery, herbs, green onions, leeks, bok choy
- Requires continuous misting

### B. Dry Table / Bulk Display
- Tomatoes, potatoes, onions (except green), garlic, shallots
- Dried peppers, jicama, waxed rutabaga
- Mushrooms (explicitly excluded from misting)
- Displayed on tables, nesting displays, orchard bins

### C. Packaged / Fresh-Cut / Value-Added Refrigerated Wall
- Bagged salads, clamshell salad kits
- Fresh-cut fruit cups, vegetable trays, snack packs
- Guacamole, fresh salsa
- Behind glass doors in refrigerated wall cases — the "Wall of Fresh"
- Higher margins; growing share of department square footage

### D. Organic Set
- Often segregated adjacent to conventional counterparts
- Some retailers have replaced conventional with organic entirely in specific categories (berries, potatoes, bagged salad, carrots)

### E. Occasion-Based Groupings
- Salad vegetables together, cooking vegetables together
- Cross-merchandising: avocados near salad/sandwich components
- Packaged salads and mushrooms positioned centrally

### The Celery Problem (Jon's Example)
Same commodity lives in multiple zones:
- **Whole celery stalks** → wet rack (misted section)
- **Celery hearts (trimmed)** → wet rack or packaged refrigerated
- **Celery sticks (cut)** → packaged refrigerated / snacking
- **Celery in stir-fry blend** → value-added wall
- **Celery + peanut butter snack pack** → grab-and-go

Each placement implies different classification attributes. The classifier needs a **multi-select shelf-placement field**, not a single category.

---

## 8. Occasion-Based Classification

**Confidence: Inferred** — no formal industry standard exists; synthesized from company portfolios and trade research.

### No Industry Standard Exists
No single taxonomy classifies produce by usage occasion. Building blocks exist:

### Taylor Farms Portfolio Structure (Closest Model)
Organized by eating occasion and convenience level:
- **Salads**: Chopped kits, mini kits, protein kits, zero seed oil kits
- **Fresh Blends**: Vegetable blends, salad blends
- **Meal Solutions**: Vegetable meal kits
- **Grab N Go**: Snacks, salad bowls, vegetable trays

### Bolthouse Farms (GPG-Relevant)
Occasion-based product lines:
- **Snacking**: Carrot Shakers (flavored baby carrots), Kids Veggie Snackers
- **Cooking/Ingredient**: Carrot Dogs, carrot fettuccine, riced carrots
- **Core/Commodity**: Standard baby-cut carrots, whole carrots

### Fresh-Cut Processor Hierarchy Pattern
Fresh-cut companies (Taylor Farms, Fresh Express, Ready Pac/Bonduelle) converge on:

```
Level 1: Channel       → Retail | Foodservice
Level 2: Form          → Salads | Vegetables | Fruits | Meal Solutions
Level 3: Occasion      → Kits | Blends | Singles | Grab-and-Go
Level 4: Commodity      → Romaine | Iceberg | Spinach | Carrots | etc.
Level 5: Variant       → Size | Organic/Conventional | Specific Recipe
```

**Key insight:** Commodity is Level 4, not Level 1. Form and occasion come first because that's how the merchandising set is organized. The classifier should support both traversals — commodity-first for supply chain, occasion-first for category management.

### Shopper Mission Segmentation
Robinson Fresh segments produce purchases by shopper mission: stock-up vs. quick trip vs. meal-specific. Influences shelf grouping but not formalized into a product classification system.

### Academic: Convenience Food Classification Scheme (CFCS)
3-tier system:
- CI: Raw foods and ingredients
- CII: Industrially processed foods needing further household processing
- CIII: Ready-made meals and ready-to-eat products

---

## 9. Architecture Patterns for Multi-View Taxonomy

**Confidence: Confirmed** — sourced from PIM vendors, MDM literature, academic papers.

Three distinct patterns for maintaining parallel classification views:

### Pattern A: Multiple Independent Category Trees
Each stakeholder group maintains its own complete tree. A product appears in nodes across all trees.
- **Akeneo PIM** explicitly supports this — product lives in N category trees simultaneously
- **Intel case study**: 20 different product hierarchies across business units before consolidation; solution was shared canonical terms feeding all hierarchies
- **Best for:** Organizations where each view truly needs a complete navigable tree
- **Risk:** Drift between trees without governance

### Pattern B: Faceted Attributes on Single Master Record (Recommended for GPG)
One product record carries multiple classification attributes. Product lives in one canonical hierarchy; additional classification dimensions stored as typed attributes (merchandising_category, margin_tier, supply_chain_group).
- Used by Stibo STEP, Informatica, SAP MDG
- **Best for:** Building classification on top of syndicated data records
- **Risk:** Can become unwieldy if too many attributes added without governance

### Pattern C: Ontology/Knowledge Graph
Product is a node in a graph with typed relationships to multiple classification concepts.
- FoodOn uses this approach
- Most flexible but hardest to implement operationally
- **Best for:** Research contexts, large-scale e-commerce (Walmart Retail Graph)
- **Risk:** Operational complexity, requires specialized tooling

### Recommendation
**Pattern B** — GPG's three views (product, merchandising, internal) become attribute groups on the same product record, queryable independently. The product classifier assigns faceted attributes; each view is a projection/query across those attributes.

---

## 10. Governance: Reconciling Conflicting Views

**Confidence: Confirmed** — sourced from MDM literature, Earley, Profisee.

Three governance models:

### A. Golden Record + Survivorship Rules
One canonical product record; configurable logic determines which source wins per attribute. Good when conflicts are data quality issues.

### B. Federated Stewardship (Recommended for GPG)
Domain teams own quality for their own classification dimension:
- **Product/R&D** owns product-intrinsic attributes
- **Category Management** owns merchandising attributes
- **BI/Finance** owns internal business attributes

Central platform enforces shared contracts (schemas, ID formats, required fields). Governance council resolves cross-domain conflicts.

### C. Explicit Multiple Versions of Truth
When different classifications are genuinely required (not just inconsistency), the system explicitly allows coexistence with transparent reconciliation. Key insight: the product hierarchy for inventory management may be entirely different from hierarchies supporting marketing or sales compensation, and **that can be legitimate** — the problem is when they diverge accidentally.

---

## 11. Tools, Platforms, and Data Sources

### PIM/MDM Platforms Supporting Multi-View Classification

| Platform | Multi-Hierarchy Support | Best For |
|---|---|---|
| **Akeneo** | Native multiple category trees | Mid-market, catalog-heavy |
| **Pimcore** | Flexible object-oriented data model | Companies with dev resources |
| **Salsify** | Infinite hierarchies with inheritance | Brand manufacturers syndicating to retail |
| **Syndigo** | MDM + PIM + content syndication | CPG/grocery specifically |
| **Stibo Systems STEP** | Multi-level hierarchies, multi-domain MDM | Enterprise-scale |
| **Informatica MDM** | Configurable survivorship rules | Existing Informatica stack |
| **SAP MDG** | Integrated with SAP ERP | SAP-heavy organizations |

### Open Data Sources

| Resource | What It Is | License |
|---|---|---|
| **USDA FoodData Central** | 350,000+ food products, ~170 categories | CC0 (public domain) |
| **Open Food Facts** | Community-contributed food product database | Open data |
| **GS1 GPC Browser** | Searchable product classification codes | Free access |
| **LanguaL Thesaurus** | 12,605 food descriptors across 14 facets | Open |
| **FoodOn Ontology** | Farm-to-fork food ontology | Open-source |

### Commercial Platforms

| Platform | What It Does | Relevance |
|---|---|---|
| **Crisp** | AI data harmonization across 40+ retailers | Syndicated data layer |
| **Harmonya** | AI attribute extraction + master hierarchy | Cross-system product matching |
| **Nielsen Total Food View** | Unified UPC + random-weight data | Already in GPG's stack |
| **Circana Integrated Fresh** | Standardized fresh department definitions | Already in GPG's stack |
| **SPINS/Pinto** | Wellness-focused product attributes | Health/dietary classification |
| **NielsenIQ/Label Insight** | Product attributes from label data | Check what attribute data comes with existing Nielsen subscription |

---

## 12. Academic and Industry Papers

| Paper/Resource | What It Covers | Source |
|---|---|---|
| FoodOn: A Harmonized Food Ontology (2018) | Farm-to-fork ontology with multi-faceted classification; builds on LanguaL | Nature npj Science of Food |
| Large-scale Multi-class and Hierarchical Product Categorization (2016) | ML approaches to automated hierarchical product classification | ACL Anthology |
| Classification of Retail Products (2021) | Grocery product classification into 3-level food taxonomies | MDPI |
| Classifying Multi-level Product Categories Using Dynamic Masking (2022) | Transformer models for multi-level product categorization | PMC |
| Evolution of Product Classification at Shopify (2025) | From categories to comprehensive product understanding | Shopify Engineering |
| GS1 Fresh F&V Master Data Attributes (2018) | Specific data attributes for produce in GDSN | GS1 Europe |
| Facet Analysis: Evolution of an Idea (2023) | History and modern application of Ranganathan's faceted classification | Taylor & Francis |
| Towards a Taxonomy for Coordinating Quality of Master Data (2017) | Framework for MDM quality coordination across domains | UALR/ICIQ |

---

## 13. Recommended Architecture for GPG Classifier

### Core Model: Faceted Attributes, Not a Single Tree

```
Product Master Record
  Commodity Facet ─────── Carrot
  Variety Facet ──────── Baby-cut
  Processing Level ───── 2 (Peeled + Cut + Washed + MAP Packaged)
  Form Factor ─────────── Bagged, 1 lb
  Temperature Zone ────── Refrigerated
  Shelf Placement ─────── [Packaged Refrigerated, Snacking] (multi-select)
  Consumption Occasion ── [Snacking, Cooking Ingredient] (multi-select)
  Convenience Tier ────── Ready-to-Eat
  Value-Add Flag ──────── Yes (processing level >= 2)
  Department ──────────── Produce
  Strategic Category ──── [Core Carrot, Snacking, Value-Added]
  Supply Chain Group ──── Fresh-Cut Operations
  Channel ──────────────── Retail
```

### Processing Level Scale (Replaces Binary Value-Add)

| Level | Definition | Examples |
|---|---|---|
| 0 | Raw/Bulk — harvested, washed, graded, packed | Whole carrots, head lettuce |
| 1 | Trimmed — light trimming, sizing | Celery hearts, broccoli crowns |
| 2 | Fresh-Cut — peeled, cut, washed, MAP packaged | Baby-cut carrots, bagged salad |
| 3 | Ready-to-Eat — portioned, may include non-produce | Snack packs, salad kits with dressing |
| 4 | Ready-to-Cook — recipe-portioned with seasonings | Stir-fry blends, seasoned vegetable kits |
| 5 | Meal Solutions — multi-category assembly | Complete meal kits with protein |

### Dual-Traversal Support
The classifier should support both navigation paths:
- **Commodity-first** (supply chain view): Carrots > Baby-Cut > 1lb Bag > Organic
- **Occasion-first** (category management view): Snacking > Vegetables > Baby-Cut Carrots > 1lb Bag

---

## 14. What This Research Did NOT Find

- **No published produce-specific classification engine architecture.** Center-store has much more published work.
- **No standard definition of "value-added" in produce.** Genuinely unresolved industry-wide.
- **Limited academic work on multi-view produce taxonomy.** Faceted classification literature is robust in general, but not applied specifically to fresh produce merchandising.
- **No open-source produce taxonomy** ready for adoption. Every produce company builds custom.
- **Retailer-specific shelf set data is proprietary.** No public dataset maps products to merchandising zones.

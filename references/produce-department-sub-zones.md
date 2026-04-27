---
title: "Produce Department Sub-Zone Classification"
type: reference
updated: 2026-04-08
categories:
  - classification
  - category-management
  - merchandising
tags:
  - produce-zones
  - wet-rack
  - dry-table
  - value-added
  - snacking
  - mushrooms
  - merchandising-placement
  - planogram
  - consumer-mission
stakeholders:
  - BI
  - category-management
  - product-classifier
status: active
scope: gpg-strategic-research
summary: "Granular sub-zone classification within the produce department — wet rack sections (salad, cruciferous, cooking roots, herbs), dry table groupings, mushroom placement, value-added wall segments, and snacking zones. Covers how specific products (carrots, celery, broccoli, mushrooms, mini peppers) land in different zones depending on form factor. Includes Grimmway's own published merchandising guidance. Consult when building shelf-placement attributes for the product classifier."
related:
  - references/product-taxonomy-research.md
  - context/gpg-capabilities.md
---

# Produce Department Sub-Zone Classification

Addendum to `references/product-taxonomy-research.md`. Research conducted 2026-04-08 to map the granular merchandising zones within the produce department for GPG's product classifier.

## Why This Matters for the Classifier

The previous research identified five high-level produce department zones (wet rack, dry table, mushroom section, value-added wall, organic set). This document goes one level deeper — the sub-zones *within* those zones that determine where a specific product actually lands. This is the layer your classifier needs to assign shelf-placement attributes accurately.

---

## 1. What Drives Produce Placement

Three interacting constraints determine where a product sits:

| Constraint | What It Means | Example |
|---|---|---|
| **Physical handling** | Can it be misted? What temperature? | Mushrooms can't be misted; leafy greens must be |
| **Consumer mission** | Cooking vs. snacking vs. convenience | Whole carrots = cooking; baby-cut carrots = snacking |
| **Form factor** | Bulk vs. packaged vs. fresh-cut | Bulk celery = wet rack; celery sticks = refrigerated wall |

These three constraints are independent. The same commodity can land in completely different zones depending on which constraint dominates for a given form factor.

---

## 2. Department Traffic Flow

~90% of customers turn right upon entering and move counterclockwise. The produce department layout follows this general sequence:

```
ENTRY
  → Seasonal / Promotional Display (high-impact visual)
    → Fruit Dry Tables (bananas, citrus, apples, stone fruit)
      → Vegetable Dry Tables (potatoes, onions, tomatoes)
        → WET RACK / GREENS WALL (back wall — the "showpiece")
          → REFRIGERATED MULTI-DECK CASES (mushrooms, berries)
            → VALUE-ADDED / FRESH-CUT WALL (packaged salads, baby carrots, kits)
              → ORGANIC SECTION
                → EXIT to next department
```

The wet rack is along the back wall. Higher-margin value-added items are positioned later in the flow, catching shoppers who have already committed to the department.

**Sources:** Retail Space Solutions, Supermarket Perimeter - Produce Department Design 101, PlanoHero produce merchandising guide.

---

## 3. Wet Rack Sub-Zones

**Confidence: Inferred** — synthesized from multiple trade press descriptions. No single authoritative planogram exists publicly.

The wet rack has an informal but consistent internal flow, organized by **cooking occasion** with **color breaks** between sections:

### Standard Wet Rack Flow (sequential)

| Position | Sub-Zone | Products | Misting Need |
|---|---|---|---|
| First | **Salad Vegetables** | Leaf lettuces (romaine, green leaf, red leaf), green onions, radishes, sprouts | High |
| Second | **Transition / Herbs** | Beets with tops, fresh herbs (parsley, cilantro, dill, basil) | High |
| Third | **Cooking Greens** | Kale, collard greens, mustard greens, turnip greens, chard, spinach (bulk), bok choy, watercress, leeks | High — 3x/hour minimum |
| Fourth | **Cruciferous** | Broccoli crowns, cauliflower, cabbage | High |
| Fifth | **Cooking Roots & Stalks** | Celery, parsnips, loose carrots (bulk/topped), bulk radishes, beets | Moderate — heavier items on lower tiers |

### What Goes on the Wet Rack

Items that **require** misting (unpackaged/open-packaged commodities):
- Leaf lettuces (all varieties)
- Cruciferous: broccoli crowns, cauliflower, cabbage
- Cooking greens: kale, collards, mustard greens, turnip greens, chard
- Root vegetables needing hydration: carrots with tops, beets with tops, parsnips, radishes
- Stalks: bulk celery, leeks, green onions
- Fresh herbs: parsley, cilantro, dill, basil, rosemary, thyme
- Asian greens: bok choy, watercress

### What Does NOT Go on the Wet Rack

Items that are **damaged** by misting:
- **Bagged or wrapped items** — causes condensation and fogging; shortens shelf life
- **Mushrooms** — water causes rapid quality degradation (bacterial blotch)
- **Asparagus** — tips become mushy under misting
- **Soft squash, green beans, eggplant** — delicate skin damages
- **Items in rigid containers** — condensation issues
- **Onions (dry), potatoes, tomatoes, shallots, garlic** — moisture accelerates decay
- **Dried peppers, jicama, waxed rutabaga** — do not tolerate moisture

**Source:** Produce Business - "Successfully Merchandising Wet Rack Produce," "Wet Rack Merchandising Is A Worthy Challenge"

---

## 4. Dry Table Sub-Zones

**Confidence: Confirmed** — sourced from trade publications and merchandising guides.

| Sub-Zone | Products | Display Type |
|---|---|---|
| **Potatoes & Onions** | All potato varieties, dry onions, garlic, shallots | Bins, nesting displays |
| **Tomatoes** | All tomato varieties (bulk) | Tables — better flavor at room temperature |
| **Hard Squash** | Butternut, acorn, spaghetti squash | Tables, bins |
| **Specialty Dry** | Dried peppers, jicama, waxed rutabaga, ginger, turmeric | Mixed display |
| **Avocados** | All varieties | Tables or end caps; ethylene-sensitive |

---

## 5. Mushroom Section

**Confidence: Confirmed** — sourced from Produce Business, Monterey Mushrooms, Giorgio CARE program.

Mushrooms are a classification edge case — they fit neither wet rack nor dry table:

- **Cannot be misted** — water causes rapid deterioration, bacterial blotch, shortened shelf life
- Need **humidity without direct water contact** — specialized HydraFog humidification systems (Corrigan patent) used instead of misting; extends shelf life by up to 4 days
- **Recommended placement:** Refrigerated multi-deck case, **adjacent to bagged salads** (mushrooms are frequently used in salads; co-promotion drives measurable sales lift)
- **Display temperature:** 38-42F display, 34F storage
- **Space allocation:** 6-8 feet typical; rule of thumb is one linear foot for every $50 in weekly sales
- **Eye-level positioning:** Brown mushrooms (cremini, portobello) at eye level
- **Secondary cross-merchandising:** Near peppers and onions (saute prep); near meat department (kabobs/grilling); dried mushrooms in Asian aisle or near soup stocks
- **Organic mushrooms:** Stay within the mushroom set; do not separate into an organic section
- **Specialty varieties:** Shiitake, oyster, maitake, enoki, king trumpet grouped together; limit to ~5% of shelf space to prevent stock-outs on popular items

**Key insight for classifier:** Mushrooms need their own environment attribute value (refrigerated-no-mist / humidity-controlled) that is distinct from both wet rack (misted) and dry table (ambient). They are physically in a refrigerated case like packaged salads, but they are bulk commodities like wet rack items.

---

## 6. Value-Added Refrigerated Wall

**Confidence: Confirmed** — sourced from Produce Business, Progressive Grocer, Supermarket News.

The "Wall of Fresh" — glass-door refrigerated cases — has its own internal sub-zoning:

| Sub-Zone | Products | Consumer Mission |
|---|---|---|
| **Packaged Salads / Kits** | Bagged lettuce, salad kits (chopped, protein, mini), salad blends | Meal component / convenience |
| **Fresh-Cut Vegetables** | Baby-cut carrots, broccoli florets, cauliflower florets, stir-fry blends, garden blends, Brussels sprouts, broccoli slaw | Cooking convenience |
| **Snacking / Grab-and-Go** | Carrot sticks, celery sticks, veggie cups with dip, grape tomato cups, mini pepper snack packs, apple slices | On-the-go snacking |
| **Dressings & Dips** | Refrigerated dressings, hummus, ranch dip, guacamole | Complement to salads and snacking |
| **Meal Kits** | Vegetable meal kits, seasoned blends, complete kits with protein | Meal solution |
| **Fresh-Cut Fruit** | Fruit cups, sliced melon, berry mixes | Snacking / dessert |

### The Carrot Split — Grimmway's Own Published Guidance

**Eric Proffitt at Grimmway Farms** (quoted in Produce Business) on best-in-class merchandising:

> Separate whole and value-added carrots into two groups.

- **Whole carrots** → wet rack, cooking vegetables section, ~1 foot of display space
- **Value-added carrots** (baby-cut, shreds, chips, sticks) → value-added refrigerated wall, alongside prepackaged salads and refrigerated dressings, ~4 feet of display space

This means value-added carrots get **4x the display space** of whole carrots, and they are physically located in a different zone of the department.

### Fresh-Cut Category Composition

- ~65% of fresh-cut product = packaged salads
- ~25%+ = carrots and celery
- Remainder = other vegetables, fruit cups, meal kits

**Source:** Produce Business - "Energizing Carrot Category Sales," "Value-Added Fresh-Cut Produce Adds Variety"

---

## 7. Snacking as a Merchandising Concept

**Confidence: Inferred** — emerging concept, not yet universally formalized as a fixed planogram zone.

### Status: Strategic Concept, Not a Fixed Zone

"Snacking" is a recognized merchandising concept in the industry, but implementation varies widely by retailer. Produce Business proposed that retailers create a "healthy snacking center" as a dedicated destination, but most retailers execute through multiple touchpoints rather than a single fixed zone.

### What Counts as "Snacking Produce"

Items that can be eaten out-of-hand without cutting or utensils:
- Baby carrots
- Grape/cherry tomatoes
- Sugar snap peas
- Mini sweet peppers (3 oz single-serve packs)
- Mini cucumbers
- Celery sticks (with peanut butter)
- Apple slices
- Clementines/mandarins
- Single-serve veggie cups with dip

### How Retailers Execute Snacking

Rather than a fixed planogram zone, retailers use multiple touchpoints:

| Touchpoint | What Happens | Example |
|---|---|---|
| **Primary produce set** | Snacking items within their normal category | Baby carrots with other carrots in value-added section |
| **Secondary displays** | End caps and off-shelf fixtures featuring snacking items together | 15-20 cases of mini peppers on end cap with grape tomatoes |
| **Deli/grab-and-go adjacency** | Single-serve produce snack packs near hummus, dips, cheese | Celery sticks + ranch dip pack near deli |
| **Checkout proximity** | Items positioned for impulse purchase near registers | Clementine bags, apple slices |

### Snacking Data Points

- 32% of consumers want more veggie snacking items (FMI Power of Produce)
- 34% want more fresh fruit snacks
- Consumers now eat more during snacking occasions than at mealtimes (a first)
- Halos mandarin sales velocity **doubles** when displayed in dedicated snacking fixtures vs. traditional placement
- Mini peppers: strongest sales driver is displaying 15-20 cases on off-shelf fixture with grape tomatoes

### Implication for Classifier

"Snacking" should be a **consumer mission attribute**, not a shelf-placement zone. A product can have `consumer_mission = Snacking` regardless of whether it's physically in the value-added wall, on an end cap, or near the deli.

---

## 8. Organic Placement

**Confidence: Confirmed** — no consensus; industry is split.

### Three Approaches in Use

| Approach | How It Works | Evidence |
|---|---|---|
| **Integrated** | Organic items placed directly adjacent to conventional counterparts | SpartanNash reported up to 150% sales growth in some stores |
| **Segregated** | All organic items together in a dedicated section | Creates a destination for committed organic shoppers |
| **Hybrid** | Integration for high-volume items, segregation for specialty organic | Sunset Foods: 8 ft conventional tomatoes next to 4 ft organic tomatoes |

- No standard exists — the optimal approach depends on customer demographics, store format, and local demand
- For wet rack items (organic broccoli, organic celery), placement depends on the retailer's chosen strategy: integrated stores keep them on the wet rack next to conventional; segregated stores move them to the organic destination
- Trend is moving toward integration as organic pricing gaps narrow

### Implication for Classifier

Organic placement is retailer-configurable, not product-inherent. The classifier should tag `organic = Yes/No` as a product attribute but NOT hardcode a zone for organic items. Zone is determined by retailer strategy, not product identity.

---

## 9. Bridge / Crossover Items

**Confidence: Confirmed** — the split-placement approach is documented in trade press.

Products that serve multiple consumer missions get split across zones by form factor:

### Carrots

| Form | Zone | Consumer Mission | Display Space |
|---|---|---|---|
| Whole (bulk/topped) | Wet Rack - Cooking Roots | Cooking Ingredient | ~1 ft |
| Whole (bagged) | Refrigerated Wall - Fresh-Cut Veg | Cooking convenience | Varies |
| Baby-cut (bagged) | Refrigerated Wall - Fresh-Cut Veg | Snacking + Cooking | ~4 ft |
| Shreds | Refrigerated Wall - Fresh-Cut Veg | Salad Component | Near salads |
| Chips/Sticks | Refrigerated Wall - Snacking | Snacking | Near dips |
| In stir-fry blend | Refrigerated Wall - Fresh-Cut Veg | Cooking convenience | Within blends |

### Celery

| Form | Zone | Consumer Mission |
|---|---|---|
| Whole stalks (bulk) | Wet Rack - Cooking Stalks | Cooking Ingredient |
| Celery hearts (trimmed) | Wet Rack or Refrigerated Wall | Cooking + Snacking |
| Celery sticks (cut) | Refrigerated Wall - Snacking | Snacking |
| Celery dippers (2-inch) | Refrigerated Wall - Snacking | Snacking (near dips) |
| In stir-fry blend | Refrigerated Wall - Fresh-Cut Veg | Cooking convenience |
| + peanut butter snack pack | Grab-and-Go / Deli adjacency | Snacking |

### Broccoli

| Form | Zone | Consumer Mission |
|---|---|---|
| Crowns (bulk) | Wet Rack - Cruciferous | Cooking Ingredient |
| Florets (bagged) | Refrigerated Wall - Fresh-Cut Veg | Cooking convenience |
| In garden blend | Refrigerated Wall - Fresh-Cut Veg | Cooking convenience |
| Broccoli slaw | Refrigerated Wall - Fresh-Cut Veg | Salad Component |

### Mini Sweet Peppers

| Form | Zone | Consumer Mission |
|---|---|---|
| 1-2 lb pack | Near regular peppers (dry table or packaged) | Cooking |
| 3 oz single-serve | Refrigerated Wall - Snacking | Snacking |
| End cap display | Secondary - Snacking End Cap | Snacking (with grape tomatoes) |

### Mushrooms

| Form | Zone | Consumer Mission |
|---|---|---|
| White button / cremini (bulk) | Refrigerated Case - Mushrooms (near salads) | Cooking + Salad |
| Portobello caps | Refrigerated Case - Mushrooms | Cooking (grilling) |
| Specialty (shiitake, oyster, maitake) | Refrigerated Case - Mushrooms | Cooking (gourmet) |
| Sliced (packaged) | Refrigerated Case - Mushrooms | Cooking convenience |
| Dried shiitake | Asian ingredients section | Cooking (Asian) |
| Dried porcini | Gourmet / near risotto ingredients | Cooking (Italian) |
| Secondary display | Near meat department | Cooking (grilling/kabobs) |

---

## 10. Classifier Attribute Model: Sub-Zone Edition

Based on this research, the classifier needs these placement-related attributes:

### Environment Requirement (physical constraint — determines zone eligibility)

```
ENVIRONMENT_REQUIREMENT
  ├── Misted           (wet rack capable — leafy greens, cruciferous, bulk roots)
  ├── Dry              (no moisture — potatoes, onions, tomatoes, hard squash)
  ├── Refrigerated-No-Mist  (mushrooms, all packaged items, berries)
  ├── Humidity-Controlled    (mushrooms specifically — HydraFog systems)
  └── Ambient          (room temperature acceptable — bananas, citrus, avocados)
```

### Primary Merchandising Zone (where it lives — Level 1 + Level 2)

```
MERCHANDISING_ZONE
  ├── Wet Rack
  │     ├── Salad Vegetables
  │     ├── Transition / Herbs
  │     ├── Cooking Greens
  │     ├── Cruciferous
  │     └── Cooking Roots & Stalks
  ├── Dry Table
  │     ├── Potatoes & Onions
  │     ├── Tomatoes
  │     └── Hard Squash & Specialty
  ├── Refrigerated Case (No Mist)
  │     ├── Mushrooms
  │     ├── Berries
  │     └── Specialty Refrigerated
  ├── Value-Added Refrigerated Wall
  │     ├── Packaged Salads / Kits
  │     ├── Fresh-Cut Vegetables
  │     ├── Snacking / Grab-and-Go
  │     ├── Dressings & Dips
  │     ├── Meal Kits
  │     └── Fresh-Cut Fruit
  ├── Organic Set (mirrors zones above — retailer-configurable)
  └── Seasonal / Promotional
```

### Secondary Placement (cross-merchandising — multi-select)

```
SECONDARY_PLACEMENT
  ├── Snacking End Cap
  ├── Meat Department Cross-Merch
  ├── Deli / Grab-and-Go Adjacency
  ├── Asian Ingredients Section
  ├── Checkout / Impulse
  ├── Meal Solution Display
  ├── Seasonal / Promotional
  └── None
```

### Botanical Group (product identity — independent of zone)

```
BOTANICAL_GROUP
  ├── Leafy Greens
  ├── Root Vegetables
  ├── Cruciferous / Brassicas
  ├── Alliums
  ├── Fruit Vegetables (tomatoes, peppers, cucumbers, squash)
  ├── Stem Vegetables (celery, asparagus, fennel)
  ├── Fungi (mushrooms)
  └── Herbs
```

### Consumer Mission (why they are buying — multi-select)

```
CONSUMER_MISSION
  ├── Cooking Ingredient
  ├── Salad Component
  ├── Snacking
  ├── Meal Kit / Meal Solution
  └── Entertaining / Platter
```

---

## 11. IFPA Top 20 Vegetables: Household Penetration

Useful for weighting classifier priority by market significance:

| Rank | Vegetable | HH Penetration |
|---|---|---|
| #1 | Potatoes | 87% |
| #2 | Tomatoes | 85% |
| #3 | Onions | 82% |
| #4 | **Carrots** | **77%** |
| #5 | Lettuce | 73% |
| #6 | Peppers | 69% |
| #7 | Cucumbers | 65% |
| #8 | **Celery** | **62%** |
| #9 | **Broccoli** | **51%** |
| #10 | Corn | 50% |
| #11 | Avocados | 49% |
| #12 | **Mushrooms** | **47%** |

**Source:** IFPA / Circana data via freshproduce.com

---

## 12. FMI Consumer Behavior Data

Key findings from FMI "Power of Produce" reports:

- **70% of shoppers** use a list as a reminder, but make the final decision in-store
- **60% purchase items NOT on their list** — extremely high impulse rate for produce
- **Decision hierarchy:** Freshness/appearance → Quality → Price
- **Millennials impulse purchase 64%** of the time; less influenced by appearance/seasonality; more interested in preparation time and recipe ideas
- **32% want more veggie snacking items; 34% want more fresh fruit snacks**
- Produce = 11% of total store sales; fresh/perimeter departments = 42% of total store sales

**FMI "Power of Produce" reports** are published annually (2024, 2025, 2026 editions). These are paid reports but the most authoritative source on produce department optimization. Available at fmi.org.

### Implication for Classifier

The 60% impulse rate means merchandising placement is a **demand driver**, not just a descriptive attribute. A product's zone determines its discovery context — whether a shopper finds it while looking for salad ingredients vs. cooking ingredients vs. snacking. The classifier's zone assignment has commercial implications.

---

## 13. What This Research Did NOT Resolve

- **No standardized planogram template exists publicly.** Every retailer designs their own. The sub-zones described here are synthesized from trade publications.
- **Circana's produce category hierarchy** (Total Produce > Fresh Vegetables > [sub-segments]) is proprietary. The detailed segmentation for category reviews is not published.
- **Robinson Fresh's specific merchandising frameworks** were not publicly available despite searching.
- **The "snacking zone" is emerging but not standardized.** Some retailers have dedicated snack sections; others scatter items across the value-added wall.
- **FMI Power of Produce** detailed findings require paid subscription. Key data points above are from press releases and conference presentations.

---

## Key Sources

| Source | Topic |
|---|---|
| Produce Business - "Successfully Merchandising Wet Rack Produce" | Wet rack organization, misting rules |
| Produce Business - "Wet Rack Merchandising Is A Worthy Challenge" | Bulk vs. packaged split, Green Giant Fresh transition |
| Produce Business - "Energizing Carrot Category Sales" | Grimmway's Eric Proffitt on carrot merchandising split |
| Produce Business - "Mushrooming Retail Sales" | Mushroom placement and adjacencies |
| Produce Business - "Effective Tips for Merchandising Mushrooms" | Mushroom space allocation, display specs |
| Produce Business - "Six Ways to Sweeten Bell Pepper Sales" | Mini pepper dual-display strategy |
| Produce Business - "Consumers Snack More, Produce Pitch Must Shift" | Snacking as merchandising concept |
| Produce Business - "Value-Added Fresh-Cut Produce Adds Variety" | Value-added wall composition |
| Supermarket Perimeter - "Produce Department Design 101" | Department flow and layout |
| FMI - "Power of Produce" (2024, 2025, 2026) | Consumer behavior, impulse rates |
| IFPA / Circana - Top 20 Fruits & Vegetables | Household penetration rankings |
| Monterey Mushrooms blog | Category review methodology, space allocation rules |
| Carlson AirFlo | Refrigerated case merchandising, organic fencing |
| PlanoHero - Produce Merchandising Guide | Botanical grouping, tier placement |
| Retail Space Solutions | Department entry positioning, traffic flow |

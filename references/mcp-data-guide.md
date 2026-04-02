---
title: "MCP Data Guide"
type: reference
updated: 2026-04-02
categories:
  - mcp
  - data
  - tools
tags:
  - mcp-servers
  - data-sources
  - routing
  - monday
  - ambient
  - usda
  - economic-data
status: active
scope: cross-persona
summary: "Catalog of 10 MCP data servers with routing guidance — when to use each, key tools, common patterns. Include in any persona that needs data access. Organized by use case for question-driven routing."
related:
  - references/architecture-guide.md
  - references/operations-reference.md
---

# MCP Data Guide

Reference for all MCP data servers available to GPG personas. Use this to route questions to the right data source.

## Quick Routing Table

Ask yourself: **what kind of question is being asked?**

| Question Type | Primary MCP | Backup/Complement |
|---|---|---|
| US produce prices (farm/shipping point) | MARS | FRED (CPI/PPI trends) |
| Produce movement volumes | MARS | USDA NASS (production) |
| US crop production, acreage, yield | USDA NASS | FAO (global comparison) |
| Global agriculture production/trade | FAO | FAS (US trade specifically) |
| US agricultural exports/imports | FAS | FAO (partner country context) |
| Food/commodity supply & demand | FAS (PSD) | USDA NASS (domestic detail) |
| Consumer food prices (CPI) | FRED | BEA (PCE spending) |
| Producer prices (PPI) | FRED | MARS (commodity-specific) |
| Economic indicators (GDP, income, spending) | BEA | FRED (time series) |
| Retail sales, food service trends | FRED | BEA (PCE) |
| Demographics, population, business counts | Census | BEA (Regional) |
| Nutritional data, food composition | FoodData | — |
| Meeting notes, action items, transcripts | Ambient | — |
| Project tasks, status, assignments | Monday | — |
| Meeting prep, attendee research | Ambient (insights) | — |

## MCP Server Catalog

---

### 1. MARS — USDA Market News (Produce Pricing & Movement)

**What it covers:** Real-time and recent wholesale produce market data — shipping point (FOB) prices and movement volumes through US channels.

**When to use:**
- Current or recent commodity pricing (carrots, lettuce, broccoli, etc.)
- Seasonal price trend analysis
- Volume/movement tracking through shipping channels
- Import vs. domestic origin comparisons
- Supply/demand signals from wholesale markets

**Key tools:**
- `get_shipping_point_prices` — FOB prices at farm/packing house level (most upstream price signal)
- `get_movement_data` — Volume data showing how much moved through wholesale channels
- `list_commodities` — Find exact commodity names before querying (names must match exactly)

**Common patterns:**
```
# Always start with list_commodities to get exact names
list_commodities("shippingpt")  # for prices
list_commodities("movement")     # for volumes

# Then query with exact commodity name
get_shipping_point_prices(commodity="Carrots", date_from="01/01/2026")
get_movement_data(commodity="Carrots", date_from="01/01/2026", aggregate="weekly")
```

**Key fields:** low_price, high_price, mostly_low_price, mostly_high_price, variety, package, location, origin, organic

**GPG relevance:** Direct visibility into carrot and vegetable pricing at shipping point. Core data source for baby carrot commercial analysis, competitive pricing, and seasonal planning.

---

### 2. USDA NASS — Quick Stats (US Agricultural Production)

**What it covers:** US agricultural statistics — production quantities, acreage, yields, prices received, inventory. Both survey and census data.

**When to use:**
- US crop production volumes by state/county
- Harvested acreage and yield trends
- Prices received by farmers
- Historical production trends (decades of data)
- Organic vs. conventional breakdowns
- Census-year deep dives (every 5 years)

**Key tools:**
- `get_data` — Main query tool. Requires 2-3 filters minimum (50K row API limit)
- `get_counts` — Check query size BEFORE fetching (always do this first for broad queries)
- `search_commodities` — Find exact ALL-CAPS commodity names
- `get_param_values` — Discover valid filter values for any parameter

**Common patterns:**
```
# Find commodity name first
search_commodities("carrot")  # Returns "CARROTS"

# Check count before broad queries
get_counts(commodity_desc="CARROTS", statisticcat_desc="PRODUCTION", agg_level_desc="STATE")

# Then fetch
get_data(commodity_desc="CARROTS", statisticcat_desc="PRODUCTION", agg_level_desc="STATE", year_ge=2020)
```

**Important:** All values are ALL CAPS. Use `get_param_values` if unsure. Key statisticcat values: PRODUCTION, AREA HARVESTED, YIELD, PRICE RECEIVED, INVENTORY.

**GPG relevance:** Production volumes and acreage for carrots and competing vegetables. State-level analysis for growing regions (CA, TX, WA). Organic production tracking.

---

### 3. FRED — Federal Reserve Economic Data (Economic Time Series)

**What it covers:** 800K+ economic time series — consumer prices (CPI), producer prices (PPI), retail sales, employment, interest rates, and more.

**When to use:**
- Consumer food price trends (CPI for fruits, vegetables, food at home)
- Producer price indices for food manufacturing
- Retail sales trends (food stores, food service)
- Inflation analysis and comparison
- Macroeconomic context for business planning

**Key tools:**
- `get_series` — Fetch time series data by series ID
- `search_series` — Find series by keyword
- `get_series_info` — Get metadata (frequency, units, date range)
- `get_category_series` — Browse by category

**Critical series IDs for GPG:**
| Series | Description |
|---|---|
| CUSR0000SAF113 | CPI: Fruits and Vegetables (key produce index) |
| CUSR0000SAF1131 | CPI: Fresh Fruits |
| CUSR0000SAF1132 | CPI: Fresh Vegetables |
| CUSR0000SAF11 | CPI: Food at Home |
| CUSR0000SEFV | CPI: Food Away from Home |
| PCU311311 | PPI: Food Manufacturing |
| WPU01 | PPI: Farm Products |
| WPU02 | PPI: Processed Foods and Feeds |
| RSAFS | Advance Retail Sales: Retail & Food Services |

**Common patterns:**
```
# Year-over-year % change in fresh vegetable prices
get_series(series_id="CUSR0000SAF1132", start_date="2023-01-01", units="pc1")

# Compare food-at-home vs food-away-from-home inflation
get_series(series_id="CUSR0000SAF11", units="pc1")
get_series(series_id="CUSR0000SEFV", units="pc1")
```

**Units options:** "lin" (levels), "pch" (% change), "pc1" (% change from year ago), "chg" (change)

**GPG relevance:** Consumer price context for carrot/vegetable pricing strategy. Food inflation trends for executive reporting. Retail sales data for channel analysis.

---

### 4. FAO — FAOSTAT (Global Agriculture)

**What it covers:** Global agricultural data from the UN — production, trade, prices, emissions, land use, fertilizers, pesticides across all countries.

**When to use:**
- Global crop production comparisons (US vs. other countries)
- International trade flows for agricultural commodities
- Global food balance sheets (production, imports, exports, consumption)
- Agricultural emissions and sustainability data
- Land use trends across countries

**Key tools:**
- `get_data` — Main query (always provide 2+ filters)
- `search_codes` — Find country, item, and element codes (REQUIRED before querying)
- `get_countries` — Quick country/region code lookup
- `list_datasets` — See all available datasets
- `get_dataset_info` — Understand dataset parameters

**Common datasets:**
| Code | Dataset |
|---|---|
| QCL | Crops and livestock production |
| TP | Trade (crops and livestock) |
| PP | Producer prices |
| FBS | Food balance sheets |
| RL | Land use |
| RF | Fertilizers |

**Common patterns:**
```
# Always look up codes first — FAO uses numeric codes, not names
search_codes(dataset_code="QCL", parameter="item", search_term="carrot")
get_countries(search_term="united")

# Then query with codes
get_data(dataset_code="QCL", items=["426"], areas=["231"], years=[2020, 2021, 2022])
```

**Important:** FAO uses numeric codes for everything. ISO3 codes (like "USA") do NOT work. Always use `search_codes` or `get_countries` first.

**GPG relevance:** Global carrot production context. International competitive landscape. Sustainability/emissions data for ESG reporting.

---

### 5. FAS — USDA Foreign Agricultural Service (US Ag Trade)

**What it covers:** US agricultural trade data — imports, exports, production/supply/distribution (PSD), and weekly export sales reports.

**When to use:**
- US import/export volumes and values for agricultural commodities
- Global supply and demand balances (PSD data)
- Weekly export sales commitments by destination
- Trade partner analysis
- Market year comparisons

**Key tools:**
- `get_trade_data` — US import/export data (GATS)
- `get_psd` — Production, Supply & Distribution (global S&D balances)
- `get_export_sales` — Weekly export sales reports
- `list_commodities` — Find FAS commodity codes (different from USDA NASS codes)

**Common patterns:**
```
# List available commodities first
list_commodities()

# US carrot imports by country
get_trade_data(commodity_code="XXX", trade_type="imports", year=2025)

# Global supply/demand for a commodity
get_psd(commodity_code="XXX", market_year=2025)
```

**GPG relevance:** Import competition analysis (Mexico, Canada carrot imports). Export opportunity identification. Global supply/demand context for strategic planning.

---

### 6. BEA — Bureau of Economic Analysis (National/Regional Economics)

**What it covers:** US economic accounts — GDP, personal consumption expenditure (PCE), regional income, state/metro GDP.

**When to use:**
- GDP and economic growth trends
- Consumer spending patterns (PCE by category)
- Regional economic data (state/metro income, GDP)
- Food spending as share of PCE
- Economic context for market analysis

**Key tools:**
- `get_data` — Main query tool
- `search_tables` — Find table names by keyword
- `get_parameters` — Discover available parameters and values
- `list_datasets` — See all datasets

**Key datasets:**
| Dataset | What |
|---|---|
| NIPA | National accounts (GDP, PCE, income) |
| Regional | State/metro income and GDP |

**Common patterns:**
```
# Find food spending tables
search_tables(search_text="food", dataset="NIPA")
search_tables(search_text="personal consumption", dataset="NIPA")

# PCE data
get_data(dataset="NIPA", table_name="T20306", frequency="A", year="2023")

# State-level GDP
get_data(dataset="Regional", table_name="SAGDP1", geo_fips="STATE", year="2023")
```

**GPG relevance:** Consumer spending on food for market sizing. Regional economic health for territory planning. GDP context for executive presentations.

---

### 7. Census — US Census Bureau (Demographics & Business)

**What it covers:** US demographics (ACS 5-Year), business establishment counts (County Business Patterns), and population data.

**When to use:**
- Population by state/county/ZIP for market sizing
- Median income and income distribution by geography
- Business establishment counts by industry (NAICS)
- Education, poverty, household size demographics
- Grocery store and food service establishment density

**Key tools:**
- `get_demographics` — ACS 5-Year demographic data (presets or raw variable codes)
- `get_population` — Quick population counts
- `get_business_counts` — County Business Patterns (establishments, employees, payroll)
- `search_variables` — Find Census variable codes by keyword

**Demographic presets:** median_income, income_distribution, total_population, hispanic_origin, household_size, education, poverty

**Key NAICS codes for GPG:**
| Code | Industry |
|---|---|
| 4451 | Grocery stores |
| 445110 | Supermarkets and grocery |
| 42248 | Produce wholesale |
| 1112 | Vegetable/melon farming |
| 311 | Food manufacturing |
| 722 | Food services/restaurants |

**Common patterns:**
```
# Grocery store density by state
get_business_counts(naics_code="4451", geography="state")

# Population and income for California counties
get_demographics(variables="median_income", geography="county", state_fips="06")
get_population(geography="county", state_fips="06")
```

**GPG relevance:** Market sizing by geography. Retail density analysis. Demographic targeting for product strategy. Produce wholesale infrastructure mapping.

---

### 8. FoodData — USDA FoodData Central (Nutrition)

**What it covers:** Nutritional composition of foods — calories, macros, vitamins, minerals. Foundation foods, branded products, and survey data.

**When to use:**
- Nutritional profile of specific foods
- Side-by-side nutrient comparisons (competitive positioning)
- Branded product nutritional data
- Health/wellness claims validation

**Key tools:**
- `search_foods` — Find foods by keyword (returns FDC IDs)
- `get_food_nutrients` — Full nutrient profile for one food
- `compare_nutrients` — Side-by-side comparison of 2-5 foods

**Common patterns:**
```
# Find baby carrots
search_foods(query="baby carrots", data_type="Foundation")

# Compare carrots vs competing snack vegetables
compare_nutrients(fdc_ids=[170393, 169986, 170394])  # carrots, celery, snap peas
```

**Data types:** "Foundation" (reference foods), "Branded" (commercial products), "Survey" (consumption data)

**GPG relevance:** Carrot nutritional positioning vs. competitors. Health claims support. Product development nutritional analysis. Baby carrot vs. full-size carrot comparison.

---

### 9. Monday — Monday.com (Project Management)

**What it covers:** Task boards, items, assignments, status tracking, comments, and project management workflow.

**When to use:**
- Checking task status or assignments
- Creating or updating work items
- Searching for items by status, assignee, or keyword
- Project status reporting
- Sprint and capacity management

**Key tools:**
- `list_boards` — See available boards (use workspace_id and board_kind filters)
- `get_board` — Board structure (columns, groups, item count)
- `list_items` — Items on a board with all column values
- `get_item` — Single item with subitems and comments
- `search_items` — Find items by column value
- `create_item` / `update_item` — Create or modify items
- `list_users` — Find user IDs for assignments

**GPG workspace:** ID 8664751 (BI workspace). Board kind: private.

**Key boards:**
| Board | ID | Purpose |
|---|---|---|
| Data & Analytics | 18390862933 | Main BI team tasks |
| Category Management | 7761889500 | CatMan projects |
| BI Management | 7761779115 | BI leadership/strategy |
| Data Science | 7761790588 | DS projects |
| Data Management | 7761766798 | DW/infrastructure |
| Supply & Demand Planning | 7755078525 | S&DP model/planning |
| Baby Carrot Commercial | 18401892864 | Cross-functional carrot strategy |

**Common patterns:**
```
# Check board structure before querying
get_board(board_id="18390862933")

# List items with all column values
list_items(board_id="18390862933", limit=50)

# Find items by status
search_items(board_id="18390862933", column_id="status", column_value="Working on it")
```

**GPG relevance:** Central task tracking for all BI team work. Sprint management. Cross-functional project coordination.

---

### 10. Ambient — Meeting Intelligence (Fireflies/Ambient AI)

**What it covers:** Meeting recordings, AI-generated summaries, transcripts, action items, attendee information, and pre-meeting dossiers.

**When to use:**
- Finding what was discussed in a meeting
- Pulling action items from recent meetings
- Pre-meeting prep (dossiers on attendees)
- Searching across meeting history by topic or attendee
- Daily briefings on upcoming meetings

**Key tools:**
- `list_artifacts` — PREFERRED for finding meeting content (includes ad-hoc recordings)
- `get_artifact` — Full content of a meeting summary/action items
- `list_meetings` — Calendar-linked meetings (doesn't include ad-hoc recordings)
- `get_meeting` — Single meeting with attendees and linked artifacts
- `list_insights` — Pre-meeting dossiers and daily briefings
- `get_insight` — Full insight content

**Common patterns:**
```
# Find recent meeting summaries
list_artifacts(type=["meeting_summary"], created_after="2026-03-25T00:00:00Z", include=["text_content", "action_items"])

# Meetings with a specific person
list_artifacts(attendee_email="jane@example.com", include=["text_content"])

# Search by topic
list_artifacts(q="baby carrot", include=["text_content", "action_items"])

# Pre-meeting dossier
list_insights(type=["meeting_dossier"], resource_id="mtg_xxx", include=["text_content"])

# Today's briefing
list_insights(type=["daily_briefing"], created_after="2026-04-02T00:00:00Z", include=["text_content"])
```

**Important:** `list_artifacts` is more complete than `list_meetings` — it includes ad-hoc recordings without calendar events. Always prefer artifacts for content search.

**GPG relevance:** Meeting follow-up and accountability. Cross-functional meeting intelligence. Decision tracking across stakeholder meetings. Action item extraction for Monday.com integration.

---

## Multi-Source Analysis Patterns

Complex questions often require combining data from multiple MCPs. Common patterns:

### Price Analysis (Farm to Consumer)
1. **MARS** — Shipping point (FOB) prices (what growers/packers get)
2. **FRED** — CPI produce indices (what consumers pay)
3. **BEA** — PCE food spending (total consumer expenditure context)

### Market Sizing
1. **Census** — Population and demographics by geography
2. **Census** — Business counts (grocery stores, food service by area)
3. **BEA** — Regional income and GDP
4. **FRED** — Retail sales trends

### Competitive Landscape
1. **USDA NASS** — US production by commodity and state
2. **FAO** — Global production for international competitors
3. **FAS** — Import/export volumes (competitive pressure from imports)
4. **MARS** — Price comparison across commodities

### Product Positioning
1. **FoodData** — Nutritional comparison vs. competing products
2. **FRED** — Consumer price trends in the category
3. **MARS** — Wholesale price position vs. alternatives

### Meeting + Project Integration
1. **Ambient** — What was decided/committed in meetings
2. **Monday** — Where tasks and projects are tracked
3. Pattern: Pull action items from Ambient, cross-reference with Monday board items

## Deployment to Personas

To include this guide in a persona:

1. Copy this file to the persona's `references/` directory
2. Add to the persona's CLAUDE.md references section:
   ```
   - `mcp-data-guide.md` — MCP data server catalog with routing guidance. Consult when the user's question could benefit from external data.
   ```
3. The persona's `.mcp.json` must have the relevant MCP servers configured — this guide doesn't configure servers, it teaches the persona how to use them.

**Not every persona needs every MCP.** Match the MCP configuration to the persona's scope:
- Research Partner / Analysis Partner: All 10
- BI Strategy: Monday + Ambient + FRED + BEA (economic context)
- Brand Studio: Probably none (content production, not data analysis)
- Competitive Intelligence: MARS + USDA + FAO + FAS + FRED

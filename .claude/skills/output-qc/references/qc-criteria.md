---
title: QC Criteria — GPG Strategic Research Partner
type: reference
updated: 2026-05-10
categories:
  - quality
  - verification
tags:
  - qc
  - rubric
  - criteria
  - output-qc
  - research-deliverables
status: active
scope: gpg-strategic-research
summary: "Quality rubric for output-qc skill. Universal dimensions (Voice, Architecture, Structure, Factual Grounding, Recommendation Specificity, Token Budget, Frontmatter) baseline; classification-specific dimensions below need customization for research deliverable types. Human-controlled — do not modify programmatically."
---

# QC Criteria — GPG Strategic Research Partner

Rubric for the QC reviewer subagent. Each dimension lists what to check, what failure looks like, and severity.

**This file is human-controlled.** The QC reviewer reads it but never modifies it.

> **DEPLOYMENT NOTE (2026-05-10)**: This file was deployed from gpg-product-classifier's canonical qc-criteria as a starting point. The universal dimensions (Voice & Tone, Architecture Compliance, Structure & Scannability, Factual Grounding, Recommendation Specificity, Token Budget, Frontmatter Consistency, Pattern Recognition) apply directly. **The classification-specific dimensions below (Dollar Weighting, Column Hygiene, Word-Boundary Matching, Confidence Routing, Exception Reasons, Source Columns Preserved, Diagnosis Taxonomy, Implementation Block) need replacement** with research-deliverable-specific criteria — suggested: **Source Citation** (every claim cites), **Confidence Labels** (per-claim Low/Med/High based on source quality + recency), **Counter-Evidence Acknowledged** (steelman the opposing view), **Date-Pinned** (research has freshness window), **Verbatim Quote Discipline**, **Strategic Frame Stated** (what question is the research in service of?). Replace as a follow-up session.

---

## Dollar Weighting

**Applies to:** classification CSV/Excel, exception reports, audit reports, drift reports, review workbooks.

**Check:**
- Output includes a `Dollar Sales` (or equivalent `$`) column
- Sort order is `$` descending — not by UPC, not alphabetical, not by count
- Summary stats are dollar-weighted, not just counts (e.g., "$42B in drift" not "1,218 items in drift")
- Top-line headline calls out dollar-impact, not item-count
- For audit/drift reports: divergence matrix cells are dollar-weighted, not count-weighted

**Failure pattern:** A 10-product exception category at $50M is buried below a 1,000-product category at $100K. Counts in the headline; dollars buried or absent. Tom or Jon scans the report and the highest-$ rows aren't on top.

**Severity:** HIGH

---

## Column Hygiene

**Applies to:** classification CSV/Excel, audit reports, any code shown to Tom or Jon.

**Check:**
- Header-based column lookup, NEVER hardcoded indices (`_col("UPC COPY")` not `row[7]`)
- Original input columns preserved (the deliverable extends, not replaces)
- New classification columns added at the end or in a clearly-grouped block
- Column names match the canonical naming in `references/nielsen-encoding-guide.md` and `references/taxonomy-rules.md`
- No silent column drops between input and output

**Failure pattern:** `row[N]` access in any code path. Drift between Nielsen workbook deliveries silently reads wrong column. Original Tom-facing columns dropped, breaking his ability to cross-check. (See: 2026-04-11 audit found 25 hardcoded indices had drifted one position.)

**Severity:** HIGH

---

## Word-Boundary Matching

**Applies to:** classification CSV/Excel where ITEM-string parsing was used, code visible to reviewers.

**Check:**
- ITEM-token scans use padded matching (`f" {token} " in f" {item} "`)
- Brand prefixes stripped before keyword scan (CUT N CLN, HRVS CUT, GRDN CUT, FRSH CUT and any other brand legitimately containing detection keywords)
- Multi-word semantic phrases matched as phrases, not single tokens (`SNW PEA` not `PEA`; `BT SZ` not `BT`)
- No substring matching against single-letter or two-letter tokens (RC, BT, CRT, PL — high collision risk)

**Failure pattern:** `RC` matching inside `BRCL` (broccoli). `BT` matching inside `BT SZ`. `CRT` matching inside `CRTF ORGN BY ... CRT` (CCOF certifier). Any of the substring-collision bugs from 2026-05-01 reappearing in new code.

**Severity:** HIGH

---

## Confidence Routing

**Applies to:** classification CSV/Excel, exception reports.

**Check:**
- Each row carries a confidence value (HIGH / MEDIUM / LOW)
- HIGH confidence rows auto-classified, MEDIUM classified-and-flagged, LOW routed to exception report
- LOW-confidence rows are not silently auto-classified
- The confidence column is consistent with the routing — a LOW confidence row in the classified output (not exceptions) is a bug

**Failure pattern:** LOW confidence rows in the main classified output without exception routing. Classification with no confidence value. Confidence column present but not respected by the routing logic.

**Severity:** HIGH

---

## Exception Reasons

**Applies to:** exception reports, classification output for boundary cases.

**Check:**
- Each exception row has a specific exception reason (NO_MATCH, MULTI_MATCH, LOW_CONFIDENCE, MULTI_COMMODITY, DATA_QUALITY, NEW_FORM, NOT_SWEET_POTATO, NOT_POTATO, etc.)
- Nielsen upstream errors get specific flag reasons (NOT_SWEET_POTATO style), not silent reclassification
- Reason codes are consistent across the file — same kind of issue gets the same code
- Generic "UNCLASSIFIABLE" only when no more specific reason fits

**Failure pattern:** All exceptions bucketed under generic NO_MATCH. Nielsen upstream errors silently reclassified instead of flagged. Different reason codes for the same underlying issue.

**Severity:** HIGH

---

## Source Columns Preserved

**Applies to:** any deliverable where Tom or another stakeholder needs to cross-check against source.

**Check:**
- UPC, ITEM, BRAND, CATEGORY, SUB CATEGORY, VEGETABLE TYPE, $ all present in output
- Tom's hand-coded columns preserved when classifier ran in HONOR_PRECODED mode
- The deliverable is auditable back to the source workbook without external joins
- For drift reports: both `tom_coded` and `rule_computed` columns present per cell

**Failure pattern:** Output drops the very columns Tom uses to spot-check. Cross-reference back to source requires a manual join. HONOR_PRECODED mode silently overwrote Tom's values.

**Severity:** HIGH

---

## Pattern Recognition

**Applies to:** exception reports, audit reports.

**Check:**
- 10+ exceptions for the same reason are surfaced as a pattern, not 10 individual decisions
- Taxonomy gaps explicitly flagged when N+ exceptions point to a missing rule or category
- Precedent flags raised when a resolution would set a pattern for future products
- Common across-products patterns extracted up to the summary, not buried in row-by-row reasoning

**Failure pattern:** 50 BRCL+CRT floret bags each get individual exception reasoning instead of one pattern flag. Taxonomy gap obvious from the data but never called out. Reviewer has to read every row to spot what should have been a single bullet at the top.

**Severity:** MED

---

## Diagnosis Taxonomy (audit-drift only)

**Applies to:** audit-drift reports, any output that diagnoses Tom-vs-classifier divergence.

**Check:**
- Each divergent cell carries one of: STALE_CODE / VARIETY_LIST_APPROXIMATION / SILENT_SUPERSESSION / PENDING_CODE / PENDING_FILE / NO_RULING / AMBIGUOUS
- The diagnosis is justified by evidence (which ruling, which code line, which file behavior)
- STALE_CODE entries name the file and specific function/line that needs updating
- NO_RULING entries surface for ratification, not auto-decided
- AMBIGUOUS entries name both interpretations and the open question

**Failure pattern:** Divergence list without diagnosis. STALE_CODE flagged without naming the code. NO_RULING auto-resolved by the audit instead of escalated.

**Severity:** HIGH

---

## Implementation Block (rulings only)

**Applies to:** taxonomy ruling drafts about to be appended to `memory/shared/classification-decisions.md`.

**Check:**
- The ruling has an `**Implementation**:` block with all four axes (Code / File / Skill / Reference)
- Each axis is one of: ✓ (with file path), `PENDING — needs Jon/Tom`, or `N/A` (with reason)
- ✓ status is verifiable — the file path and line number resolve to actual content matching the ruling
- PENDING entries name a specific owner
- N/A entries justify why the axis doesn't apply (not a bypass)

**Failure pattern:** Implementation block missing entirely. ✓ status that doesn't resolve. PENDING with no owner. N/A used as a bypass for "I don't want to fill this in."

**Severity:** HIGH

---

## Recommendation Specificity

**Applies to:** exception reports, audit reports, drift reports, strategy memos, hand-off specs.

**Check:**
- Recommendations name the file, function, ruling ID, or owner
- "Fix the rule" is too vague; "Update `assign_division()` in `scripts/rules/_shared.py:142` to add `MIXED ONIONS` to the dry-table conv-onion → POTATOES condition" is right
- Next-step actions have a defined owner (Jon, Tom, Tabari) and a defined trigger (next classifier run, next Tom file pass, next sync)
- $-stake of each recommendation is quantified

**Failure pattern:** "Continue classification work." "Refine the rules." "Tom should review." Vague enough to be useless. No owner, no trigger, no $-stake.

**Severity:** MED

---

## Voice & Tone

**Applies to:** memos, ruling drafts, recommendations, anything Jon or Tom will read as prose.

**Check:**
- No preamble ("Great question!", "Certainly!", "I'd be happy to")
- No hedge language ("perhaps", "it might be worth considering")
- Direct and specific — every sentence carries information or a decision
- Business language for stakeholder-facing content; code/data language for technical content
- Imperative form for instructions ("Pull the variance" not "The variance should be pulled")
- For Jon: skip preamble, challenge directly, speak business not developer

**Failure pattern:** Output reads like generic AI. Hedge language softens recommendations to the point of uselessness. Tom-facing content drowning in code jargon, or Tabari-facing content drowning in business euphemism.

**Severity:** HIGH

---

## Architecture Compliance (skill / reference / context files)

**Applies to:** SKILL.md edits, references/*.md, context/*.md.

**Check:**
- YAML frontmatter has required fields (`name` for SKILL.md; `title`, `type`, `updated`, `summary` for refs/context)
- For SKILL.md: `description` follows [What + When + Capabilities] structure with explicit user-language triggers
- For SKILL.md: includes `categories`, `tags`, `summary`
- File naming kebab-case for folders, exact `SKILL.md` filename
- No XML angle brackets in frontmatter
- For references and skills: skill body under 1,500 words, reference under 2,000 words
- Frontmatter `type` value matches actual function (no skill typed as reference)

**Failure pattern:** Missing frontmatter. Description too vague to trigger. Wrong naming convention. Skill body bloated past ceiling.

**Severity:** HIGH

---

## Token Budget

**Applies to:** any new file added to the vault, edits that grow files.

**Check:**
- Skill body under 1,500 words (split into reference if larger)
- Reference files under 2,000 words each
- Memory files under 1,500 words each
- No duplicated content across files (use the canonical-plus-pointers pattern)
- Total active file load for typical task estimated under 8,000 words — flag if this addition pushes past

**Failure pattern:** SKILL.md at 2,000+ words. Same compound learning copy-pasted into three files. Reference doc duplicating CLAUDE.md content.

**Severity:** MED

---

## Frontmatter Consistency

**Applies to:** every `.md` file produced or edited.

**Check:**
- Every `.md` file has YAML frontmatter with at least `title`, `type`, `updated`
- `summary` fields present on reference, context, and memory files
- `type` values consistent with file function
- `categories` and `tags` use vocabulary already used elsewhere in the vault
- `updated` field present and current
- `status` field present on files that go stale (memory files, references that may need refresh)

**Failure pattern:** Missing frontmatter. `type: reference` on a memory file. New tag vocabulary that doesn't match existing conventions. Stale `updated` date.

**Severity:** MED

---

## Structure & Scannability

**Applies to:** memos, audit reports, hand-off specs, ruling drafts.

**Check:**
- Organized for scanning (headers, short sections, tables, bullets)
- No redundant content — same point doesn't appear twice in different words
- Logical flow — each section builds on the previous
- Appropriate length — not padded, not truncated
- Tables used where structure exists (don't prose-narrate a categorical breakdown)

**Failure pattern:** Wall of text. Repeated points. Sections in illogical order. Numerical data buried in prose when a table would scan in 5 seconds.

**Severity:** MED

---

## Factual Grounding

**Applies to:** strategy memos, hand-off specs, recommendations, ruling drafts.

**Check:**
- Claims grounded in data, file behavior, or stated assumptions
- Stakeholder names accurate (Jon Grove VP BI, Tom Wopperer category management, Tabari data science, Nathan / Mike / Kylie on Tom's team)
- Numbers cite the source artifact (output/audit-report-YYYY-MM-DD.md, drift-audit.csv, etc.)
- References to rulings cite the date or section in classification-decisions.md
- No statements presented as universal truths without basis

**Failure pattern:** Invented stakeholder roles. Numbers without citation. References to files or rulings that don't exist. Universal claims that are actually local conventions.

**Severity:** HIGH

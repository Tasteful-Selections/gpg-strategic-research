---
title: "Stale File Detector"
type: index
updated: 2026-03-20
---

# Stale Files (90+ Days)

```dataview
TABLE title, type, updated, summary
FROM ""
WHERE type != null AND type != "index"
WHERE updated < date(today) - dur(90 days)
WHERE status != "archived"
SORT updated ASC
```

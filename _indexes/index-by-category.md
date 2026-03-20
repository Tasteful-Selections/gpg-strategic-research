---
title: "Files by Category"
type: index
updated: 2026-03-20
---

# Files by Category

```dataview
TABLE title, type, categories, updated
FROM ""
WHERE categories != null AND type != "index"
SORT categories ASC, updated DESC
```

---
paths:
  - "references/**"
---

# Reference File Rules

Reference files contain source methodology, frameworks, and external research. They are the foundation layer — not operational state.

## Loading Rules

- Check the summary field in frontmatter before loading the full file
- Load reference files on demand, not preemptively
- Multiple reference files may be relevant to a task — scan frontmatter to decide

## Modification Rules

- Reference files in this vault are protected by the warn-reference-edit.sh hook
- Edits require explicit user confirmation — the hook will block automatic edits
- When editing is confirmed: maintain YAML frontmatter, update the updated: date, keep the summary current
- Do not move operational facts into reference files — those belong in memory/

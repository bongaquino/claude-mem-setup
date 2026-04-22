---
name: Setup Issue
about: Log a problem with claude-mem setup or configuration
---

## Problem

## Environment
- claude-mem version:
- OpenClaw version:
- macOS version:

## Worker Health
```json
<!-- curl -s http://localhost:37777/api/health | python3 -m json.tool -->
```

## Pending Queue
<!-- sqlite3 ~/.claude-mem/claude-mem.db "SELECT status, count(*) FROM pending_messages GROUP BY status;" -->

## Relevant Logs
<!-- tail -50 ~/.claude-mem/logs/claude-mem-$(date +%Y-%m-%d).log -->

## Steps Tried
1.
2.

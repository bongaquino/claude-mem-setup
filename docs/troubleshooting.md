# Troubleshooting

## Worker not responding

```bash
pkill -f worker-service.cjs
sleep 2
node ~/.claude/plugins/marketplaces/thedotmack/plugin/scripts/worker-service.cjs &
```

## summaryStored: null

Check logs:
```bash
tail -50 ~/.claude-mem/logs/claude-mem-$(date +%Y-%m-%d).log
```

**SIGKILL race (exit code 143)** — LaunchAgent conflicting with hook-spawned SDK processes:
```bash
launchctl unload ~/Library/LaunchAgents/ai.claudemem.worker.plist
node ~/.claude/plugins/marketplaces/thedotmack/plugin/scripts/worker-service.cjs &
```

**Pool timeout** — Add to `~/.claude-mem/settings.json`:
```json
"CLAUDE_MEM_MAX_CONCURRENT_SESSIONS": "4",
"CLAUDE_MEM_COMPRESSION_TIMEOUT": "120000"
```

## Failed pending queue

```bash
sqlite3 ~/.claude-mem/claude-mem.db "SELECT status, count(*) FROM pending_messages GROUP BY status;"
sqlite3 ~/.claude-mem/claude-mem.db "UPDATE pending_messages SET status='pending', retry_count=0 WHERE status='failed';"
```

## GITHUB_TOKEN blocking gh auth

```bash
unset GITHUB_TOKEN && gh auth login
```

## Log location

```bash
tail -f ~/.claude-mem/logs/claude-mem-$(date +%Y-%m-%d).log
```

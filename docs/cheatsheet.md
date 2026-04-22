# Cheatsheet

## Health & Status
```bash
curl -s http://localhost:37777/api/health | python3 -m json.tool
curl -s 'http://localhost:37777/api/prompts?limit=5' | python3 -m json.tool
curl -s 'http://localhost:37777/api/observations?limit=5' | python3 -m json.tool
curl -s 'http://localhost:37777/api/summaries?limit=5' | python3 -m json.tool
open http://localhost:37777
```

## Worker
```bash
# Start
node ~/.claude/plugins/marketplaces/thedotmack/plugin/scripts/worker-service.cjs &
# Stop
pkill -f worker-service.cjs
# Restart
bash scripts/restart-worker.sh
# LaunchAgent
launchctl load ~/Library/LaunchAgents/ai.claudemem.worker.plist
launchctl unload ~/Library/LaunchAgents/ai.claudemem.worker.plist
launchctl list | grep claudemem
```

## Database
```bash
sqlite3 ~/.claude-mem/claude-mem.db "SELECT count(*) FROM observations;"
sqlite3 ~/.claude-mem/claude-mem.db "SELECT status, count(*) FROM pending_messages GROUP BY status;"
sqlite3 ~/.claude-mem/claude-mem.db "SELECT created_at, request FROM session_summaries ORDER BY created_at DESC LIMIT 5;"
sqlite3 ~/.claude-mem/claude-mem.db "UPDATE pending_messages SET status='pending', retry_count=0 WHERE status='failed';"
sqlite3 ~/.claude-mem/claude-mem.db "PRAGMA integrity_check;"
```

## OpenClaw
```bash
openclaw plugins install claude-mem --marketplace thedotmack --dangerously-force-unsafe-install
openclaw plugins enable claude-mem
openclaw gateway restart
openclaw plugins list | grep claude-mem
openclaw doctor --fix
```

## Logs
```bash
tail -f ~/.claude-mem/logs/claude-mem-$(date +%Y-%m-%d).log
tail -50 ~/.claude-mem/logs/claude-mem-$(date +%Y-%m-%d).log
```

## GitHub
```bash
unset GITHUB_TOKEN && gh auth login
git add . && git commit -m "message" && git push
```

## Dry Run
```bash
bash scripts/dry-run.sh
```

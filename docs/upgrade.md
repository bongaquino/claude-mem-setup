# Upgrade Guide

## Check Current Version
```bash
curl -s http://localhost:37777/api/health | python3 -m json.tool | grep version
```

## Upgrade
```bash
npx claude-mem@latest install
```

Preserves `~/.claude-mem/settings.json` and database.

## OpenClaw — Re-install After Upgrade
```bash
openclaw plugins install claude-mem --marketplace thedotmack --dangerously-force-unsafe-install
openclaw gateway restart
```

## If Worker Fails After Upgrade
```bash
bash scripts/restart-worker.sh
```

## Update LaunchAgent Path
If `workerPath` changed in health response:
```bash
launchctl unload ~/Library/LaunchAgents/ai.claudemem.worker.plist
vi ~/Library/LaunchAgents/ai.claudemem.worker.plist
launchctl load ~/Library/LaunchAgents/ai.claudemem.worker.plist
```

## Rollback
```bash
npx claude-mem@12.2.0 install
```

# Persistent Worker (Auto-start on Login)

## Setup

```bash
mkdir -p ~/.claude-mem/logs

cat > ~/Library/LaunchAgents/ai.claudemem.worker.plist << 'PLIST'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>ai.claudemem.worker</string>
  <key>ProgramArguments</key>
  <array>
    <string>/usr/local/bin/node</string>
    <string>/Users/YOUR_USERNAME/.claude/plugins/marketplaces/thedotmack/plugin/scripts/worker-service.cjs</string>
  </array>
  <key>RunAtLoad</key>
  <true/>
  <key>KeepAlive</key>
  <true/>
  <key>StandardOutPath</key>
  <string>/Users/YOUR_USERNAME/.claude-mem/logs/worker.log</string>
  <key>StandardErrorPath</key>
  <string>/Users/YOUR_USERNAME/.claude-mem/logs/worker-error.log</string>
</dict>
</plist>
PLIST

launchctl load ~/Library/LaunchAgents/ai.claudemem.worker.plist
```

## Management

```bash
launchctl unload ~/Library/LaunchAgents/ai.claudemem.worker.plist  # stop
launchctl load ~/Library/LaunchAgents/ai.claudemem.worker.plist    # start
launchctl list | grep claudemem                                     # status
```

## Known Issue: SIGKILL Race

If `summaryStored: null` appears after enabling LaunchAgent, unload it and start manually:
```bash
launchctl unload ~/Library/LaunchAgents/ai.claudemem.worker.plist
node ~/.claude/plugins/marketplaces/thedotmack/plugin/scripts/worker-service.cjs &
```

#!/bin/bash
WORKER_SCRIPT="$HOME/.claude/plugins/marketplaces/thedotmack/plugin/scripts/worker-service.cjs"
GREEN='\033[0;32m'; RED='\033[0;31m'; NC='\033[0m'
echo "Stopping worker..."; pkill -f worker-service.cjs 2>/dev/null; sleep 2
echo "Starting worker..."; node "$WORKER_SCRIPT" &; sleep 3
HEALTH=$(curl -s http://localhost:37777/api/health 2>/dev/null)
if [ -z "$HEALTH" ]; then echo -e "${RED}✗ Failed to start${NC}"; exit 1; fi
VERSION=$(echo "$HEALTH" | python3 -c "import sys,json; print(json.load(sys.stdin).get('version','?'))")
echo -e "${GREEN}✓ Worker running — v$VERSION${NC}"

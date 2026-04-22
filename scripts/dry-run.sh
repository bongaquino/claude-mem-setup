#!/bin/bash
WORKER="http://localhost:37777"
DB="$HOME/.claude-mem/claude-mem.db"
GREEN='\033[0;32m'; RED='\033[0;31m'; YELLOW='\033[1;33m'; NC='\033[0m'

echo ""; echo "=== claude-mem dry-run ==="; echo ""

echo "--- Worker Health ---"
HEALTH=$(curl -s "$WORKER/api/health" 2>/dev/null)
if [ -z "$HEALTH" ]; then
  echo -e "${RED}✗ Worker not responding${NC}"; exit 1
fi
VERSION=$(echo "$HEALTH" | python3 -c "import sys,json; print(json.load(sys.stdin).get('version','?'))")
STATUS=$(echo "$HEALTH" | python3 -c "import sys,json; print(json.load(sys.stdin).get('status','?'))")
UPTIME=$(echo "$HEALTH" | python3 -c "import sys,json; print(round(json.load(sys.stdin).get('uptime',0)/3600,1))")
echo -e "  Status: ${GREEN}$STATUS${NC} | Version: $VERSION | Uptime: ${UPTIME}h"; echo ""

echo "--- Prompts ---"
curl -s "$WORKER/api/prompts?limit=3" | python3 -c "
import sys,json
d=json.load(sys.stdin)
items=d.get('items',[])
print(f'  {len(items)} found')
[print(f\"  [{i['created_at'][:10]}] {i['prompt_text'][:70]}\") for i in items]
"; echo ""

echo "--- Observations ---"
curl -s "$WORKER/api/observations?limit=3" | python3 -c "
import sys,json
d=json.load(sys.stdin)
items=d.get('items',[])
print(f'  {len(items)} found')
[print(f\"  [{i['created_at'][:10]}] {i['title'][:70]}\") for i in items]
"; echo ""

echo "--- Summaries ---"
curl -s "$WORKER/api/summaries?limit=3" | python3 -c "
import sys,json
d=json.load(sys.stdin)
items=d.get('items',[])
print(f'  {len(items)} found')
[print(f\"  [{i['created_at'][:10]}] {i['request'][:70]}\") for i in items]
"; echo ""

echo "--- Pending Queue ---"
sqlite3 "$DB" "SELECT status, count(*) FROM pending_messages GROUP BY status;" 2>/dev/null || echo "  Queue empty or DB not found"

echo ""; echo "=== Done | Dashboard: http://localhost:37777 ==="; echo ""

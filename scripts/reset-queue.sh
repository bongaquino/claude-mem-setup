#!/bin/bash
DB="$HOME/.claude-mem/claude-mem.db"
echo "--- Queue Status ---"
sqlite3 "$DB" "SELECT status, count(*) FROM pending_messages GROUP BY status;"
echo ""; read -p "Reset all failed to pending? (y/n) " confirm
if [ "$confirm" = "y" ]; then
  sqlite3 "$DB" "UPDATE pending_messages SET status='pending', retry_count=0 WHERE status='failed';"
  echo "Reset complete. Restart worker to process."
  echo "sqlite3 output:"; sqlite3 "$DB" "SELECT status, count(*) FROM pending_messages GROUP BY status;"
else
  echo "Cancelled."
fi

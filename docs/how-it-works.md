# How claude-mem Works

claude-mem runs 5 lifecycle hooks around every coding session.

## Session Lifecycle
SessionStart        → Queries memory store, injects relevant past context
UserPromptSubmit    → Logs your prompt to SQLite DB
PostToolUse         → Sends tool output to Claude for AI compression → observation
Stop                → Triggers session summary generation
SessionEnd          → Writes final summary to memory store

## Architecture
Claude Code Session
│
├── SessionStart ──────────────────────────────────────┐
│                                                      │
├── UserPromptSubmit → logs prompt                     │
│                                                      │
├── PostToolUse → HTTP → Bun Worker → Claude SDK       │
│                              │                       │
│                              └→ <observation> XML    │
│                                       │              │
└── SessionEnd ──────────────────────→ SQLite + Chroma │
│              │
└──────────────┘
(next session context)

## Memory Store (`~/.claude-mem/`)
~/.claude-mem/
├── claude-mem.db          # SQLite — prompts, observations, summaries, queue
├── chroma/                # Vector embeddings for semantic search
├── logs/                  # Worker logs (daily rotation)
├── settings.json          # All configuration
└── transcript-watch.json  # Codex CLI transcript watcher config

## Database Tables

| Table | Contents |
|---|---|
| `user_prompts` | Every prompt you typed |
| `observations` | AI-compressed tool outputs with facts, narrative, concepts |
| `session_summaries` | End-of-session summaries (request, learned, completed, next_steps) |
| `pending_messages` | Queue for AI compression jobs |

## Useful DB Queries

```bash
# Count all observations
sqlite3 ~/.claude-mem/claude-mem.db "SELECT count(*) FROM observations;"

# Check pending queue
sqlite3 ~/.claude-mem/claude-mem.db "SELECT status, count(*) FROM pending_messages GROUP BY status;"

# Recent summaries
sqlite3 ~/.claude-mem/claude-mem.db "SELECT created_at, request FROM session_summaries ORDER BY created_at DESC LIMIT 5;"

# Reset failed queue items
sqlite3 ~/.claude-mem/claude-mem.db "UPDATE pending_messages SET status='pending', retry_count=0 WHERE status='failed';"
```

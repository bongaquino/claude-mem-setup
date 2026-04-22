# Settings Reference

Full annotated breakdown of `~/.claude-mem/settings.json`.

## AI Provider
| Key | Default | Description |
|---|---|---|
| `CLAUDE_MEM_PROVIDER` | `claude` | AI provider: `claude`, `gemini`, `openrouter` |
| `CLAUDE_MEM_MODEL` | `claude-sonnet-4-6` | Model for compression |
| `CLAUDE_MEM_CLAUDE_AUTH_METHOD` | `cli` | `cli` = Claude Code subscription (no API key needed) |

## Worker
| Key | Default | Description |
|---|---|---|
| `CLAUDE_MEM_WORKER_PORT` | `37777` | HTTP worker port |
| `CLAUDE_MEM_MAX_CONCURRENT_AGENTS` | `2` | Max concurrent SDK processes |
| `CLAUDE_MEM_MAX_CONCURRENT_SESSIONS` | `4` | Max session pool slots |
| `CLAUDE_MEM_COMPRESSION_TIMEOUT` | `120000` | AI compression timeout in ms |

> If `summaryStored: null` — set `MAX_CONCURRENT_SESSIONS=4` and `COMPRESSION_TIMEOUT=120000`

## Context Injection
| Key | Default | Description |
|---|---|---|
| `CLAUDE_MEM_CONTEXT_SESSION_COUNT` | `10` | Past sessions to inject at SessionStart |
| `CLAUDE_MEM_CONTEXT_OBSERVATIONS` | `50` | Max observations in context |
| `CLAUDE_MEM_CONTEXT_SHOW_LAST_SUMMARY` | `true` | Include last summary in context |

## Tier Routing (Cost Optimization)
| Key | Default | Description |
|---|---|---|
| `CLAUDE_MEM_TIER_ROUTING_ENABLED` | `true` | Route simple jobs to cheaper model |
| `CLAUDE_MEM_TIER_SIMPLE_MODEL` | `haiku` | Model for simple file-only sessions |

> ~52% cost reduction with no quality difference.

## ChromaDB
| Key | Default | Description |
|---|---|---|
| `CLAUDE_MEM_CHROMA_ENABLED` | `true` | Enable vector search |
| `CLAUDE_MEM_CHROMA_MODE` | `local` | `local` (embedded) or `remote` |

## Filtering
| Key | Default | Description |
|---|---|---|
| `CLAUDE_MEM_SKIP_TOOLS` | `ListMcpResourcesTool,...` | Tools to exclude from capture |
| `CLAUDE_MEM_EXCLUDED_PROJECTS` | `""` | Projects to exclude from memory |

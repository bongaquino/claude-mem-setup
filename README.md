# claude-mem-setup

Personal setup, configuration, and troubleshooting notes for running [claude-mem](https://github.com/thedotmack/claude-mem) — autonomous session memory & context handoff for AI coding tools.

## What is claude-mem?

claude-mem watches your coding sessions in the background. When a session ends, it compresses everything that happened into a local memory store. The next session starts already knowing your context. **Never repeat yourself again.**

## Supported IDEs

| Tool | Integration | Status |
|---|---|---|
| Claude Code | Plugin hooks | ✅ |
| OpenClaw | Bundle plugin | ✅ |
| Cursor | Hooks + MCP | ✅ |
| Codex CLI | Transcript watching | ✅ |
| Warp | MCP only | ✅ |

## Quick Status Check

```bash
curl -s http://localhost:37777/api/health | python3 -m json.tool
```

## Docs

- [Installation Guide](docs/installation.md)
- [How It Works](docs/how-it-works.md)
- [OpenClaw Setup](docs/openclaw-setup.md)
- [Troubleshooting](docs/troubleshooting.md)
- [Making Worker Permanent](docs/persistent-worker.md)

## Configs

- [`configs/openclaw.json`](configs/openclaw.json) — OpenClaw gateway config (secrets redacted)
- [`configs/claude-mem-settings.json`](configs/claude-mem-settings.json) — claude-mem worker settings

## API Endpoints

```bash
curl -s http://localhost:37777/api/health | python3 -m json.tool
curl -s 'http://localhost:37777/api/prompts?limit=5' | python3 -m json.tool
curl -s 'http://localhost:37777/api/observations?limit=5' | python3 -m json.tool
curl -s 'http://localhost:37777/api/summaries?limit=5' | python3 -m json.tool
```

## Web Dashboard
http://localhost:37777

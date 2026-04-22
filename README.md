# claude-mem-setup

Personal setup, configuration, and troubleshooting notes for running [claude-mem](https://github.com/thedotmack/claude-mem) — autonomous session memory & context handoff for AI coding tools.

## What is claude-mem?

claude-mem watches your coding sessions in the background. When a session ends, it compresses everything that happened into a local memory store. The next session starts already knowing your context.

**Never repeat yourself again.**

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

| Guide | Description |
|---|---|
| [Installation](docs/installation.md) | Full install walkthrough for all IDEs |
| [How It Works](docs/how-it-works.md) | Session lifecycle, architecture, DB schema |
| [OpenClaw Setup](docs/openclaw-setup.md) | OpenClaw-specific install |
| [IDE Comparison](docs/ide-comparison.md) | What each IDE captures vs doesn't |
| [Settings Reference](docs/settings-reference.md) | Every settings.json key annotated |
| [Troubleshooting](docs/troubleshooting.md) | Common failures and fixes |
| [Persistent Worker](docs/persistent-worker.md) | LaunchAgent setup for auto-start on login |
| [Upgrade Guide](docs/upgrade.md) | How to update claude-mem |
| [Cheatsheet](docs/cheatsheet.md) | Every command in one place |

## Configs

| File | Description |
|---|---|
| [configs/openclaw.json](configs/openclaw.json) | OpenClaw gateway config (secrets redacted) |
| [configs/claude-mem-settings.json](configs/claude-mem-settings.json) | claude-mem worker settings |
| [configs/launchagent.plist](configs/launchagent.plist) | LaunchAgent template for persistent worker |

## Scripts

| Script | Description |
|---|---|
| [scripts/dry-run.sh](scripts/dry-run.sh) | Full health + DB check in one shot |
| [scripts/restart-worker.sh](scripts/restart-worker.sh) | Kill and restart the worker |
| [scripts/reset-queue.sh](scripts/reset-queue.sh) | Reset failed pending_messages for retry |

## API Endpoints

```bash
curl -s http://localhost:37777/api/health | python3 -m json.tool
curl -s 'http://localhost:37777/api/prompts?limit=5' | python3 -m json.tool
curl -s 'http://localhost:37777/api/observations?limit=5' | python3 -m json.tool
curl -s 'http://localhost:37777/api/summaries?limit=5' | python3 -m json.tool
```

## Web Dashboard
http://localhost:37777

## Search Past Work (Claude Code)
/mem-search

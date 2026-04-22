# Installation Guide

## Prerequisites

- macOS (arm64 or x86_64)
- Node.js 18+
- Claude Code (Pro/Max subscription)
- Bun (auto-installed by claude-mem if missing)

## Install

```bash
npx claude-mem install
```

The installer will:
1. Ask which IDEs you use
2. Copy plugin files to `~/.claude/plugins/marketplaces/thedotmack/`
3. Install Bun runtime if missing
4. Register hooks for each selected IDE
5. Configure MCP servers where applicable

### IDE-specific notes

**Claude Code** — fully automatic via plugin hooks. No extra steps after install.

**OpenClaw** — the standard installer does NOT build the OpenClaw bundle. See [OpenClaw Setup](openclaw-setup.md).

**Cursor** — hooks + MCP server written to `~/.cursor/hooks.json` and `~/.cursor/mcp.json`. Restart Cursor after install.

**Codex CLI** — transcript watching configured automatically. Context injected via `AGENTS.md` in the active workspace.

**Warp** — MCP-only integration. No transcript capture. Configured via `~/.warp/mcp.json`.

## Start the Worker

```bash
npx claude-mem start
```

## Verify

```bash
curl -s http://localhost:37777/api/health | python3 -m json.tool
```

## Make Worker Permanent

See [Persistent Worker Guide](persistent-worker.md) to auto-start on login via LaunchAgent.

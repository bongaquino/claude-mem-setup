# IDE Integration Comparison

| IDE | Captures | Injects Context | MCP Tools | Auto After Install |
|---|---|---|---|---|
| Claude Code | ✅ | ✅ | ✅ | ✅ |
| OpenClaw | ✅ | ✅ | ✅ | ⚠️ Extra step |
| Cursor | ✅ | ✅ | ✅ | ✅ |
| Codex CLI | ✅ | ✅ | ❌ | ✅ |
| Warp | ❌ | ❌ | ✅ Read-only | ✅ |

## Claude Code — Full Integration
All 5 hooks fire. Uses Claude Code subscription for AI compression. Best integration overall.

## OpenClaw — Bundle Plugin
Requires `openclaw plugins install claude-mem --marketplace thedotmack --dangerously-force-unsafe-install`. The standard npx installer does not build the OpenClaw bundle. Must use `openclaw gateway restart` (not `openclaw restart`).

## Cursor — Hooks + MCP
Context stored in `.cursor/rules/claude-mem-context.mdc`. Restart Cursor after install.

## Codex CLI — Transcript Watching
No hooks needed. Watches `~/.codex/sessions/**/*.jsonl`. Context injected via `AGENTS.md` in workspace.

## Warp — MCP Only
Cannot capture new memories. Can only read memories captured by other IDEs. Useful for searching past work while in terminal.

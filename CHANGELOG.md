# Changelog

## [Current] — 2026-04-22

### Environment
- claude-mem: v12.3.8
- OpenClaw: 2026.4.15
- Platform: macOS (darwin arm64)
- Claude Code: subscription billing (claude-sonnet-4-6)
- Worker: localhost:37777 (LaunchAgent managed)

### IDEs Configured
- Claude Code ✅
- OpenClaw ✅ (bundle plugin, required `--dangerously-force-unsafe-install`)
- Cursor ✅ (hooks + MCP)
- Codex CLI ✅ (transcript watching)
- Warp ✅ (MCP only)

### Known Issues Resolved
- `summaryStored: null` — fixed by increasing `MAX_CONCURRENT_SESSIONS` to 4 and `COMPRESSION_TIMEOUT` to 120000ms
- OpenClaw plugin not building from `npx claude-mem install` — resolved by using `openclaw plugins install` directly
- LaunchAgent SIGKILL race condition — documented in persistent-worker.md
- Discord 401 — resolved by regenerating bot token
- `GITHUB_TOKEN` blocking `gh auth login` — resolved with `unset GITHUB_TOKEN`
- Failed pending_messages — reset via direct SQLite query

### Initial Setup — 2026-04-19
- Installed claude-mem v12.2.0 via `npx claude-mem install`
- Configured across Claude Code, OpenClaw, Cursor, Codex CLI, Warp
- LaunchAgent created for persistent worker
- First successful memory capture confirmed
- Auto-upgraded to v12.3.8 — AI compression confirmed working

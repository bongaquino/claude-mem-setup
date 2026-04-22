# claude-mem-setup

Personal setup, configuration, and troubleshooting notes for running [claude-mem](https://github.com/thedotmack/claude-mem) across Claude Code, OpenClaw, Cursor, Codex CLI, and Warp.

## Worker status check

```bash
curl -s http://localhost:37777/api/health | python3 -m json.tool
```

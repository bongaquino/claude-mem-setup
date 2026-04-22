# OpenClaw Setup

The standard `npx claude-mem install` does NOT build the OpenClaw plugin bundle.

## Install

```bash
openclaw plugins install claude-mem --marketplace thedotmack --dangerously-force-unsafe-install
```

> `--dangerously-force-unsafe-install` is required because OpenClaw's security scanner flags
> `child_process` usage. These are legitimate false positives.

## Enable & Restart

```bash
openclaw plugins enable claude-mem
openclaw gateway restart
```

## Verify

```bash
openclaw plugins list | grep claude-mem
openclaw doctor --fix
```

## Required openclaw.json entries

```json
"plugins": {
  "entries": {
    "claude-mem": { "enabled": true }
  },
  "allow": ["claude-mem", ...]
}
```

## Troubleshooting

- **Stale config warnings** — Run `openclaw doctor --fix`
- **Discord 401** — Regenerate token at https://discord.com/developers/applications → Bot → Reset Token
- **`openclaw restart` unavailable** — Use `openclaw gateway restart` instead

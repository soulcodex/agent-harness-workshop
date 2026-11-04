# OpenCode reference adapter

This adapter is the working reference for the workshop. It maps portable policy to OpenCode while
leaving target-project instructions and existing user configuration intact.

## Portable sources

| OpenCode location | Portable source | Purpose |
| --- | --- | --- |
| `~/.config/opencode/AGENTS.md` | Root `AGENTS.md` | Global portable router. |
| `~/.agents/skills/` | `harness/skills/scopes/workshop/.organized/` | Managed reusable skills. |

OpenCode combines its global `AGENTS.md` with repository `AGENTS.md` files. The global router is
portable policy. Target repositories remain the owner of business rules, commands, architecture,
and runtime facts.

## Activate

From the harness repository:

```bash
harness/adapters/opencode/activate.sh
```

The script builds the managed skill profile, then creates these symlinks:

```text
~/.config/opencode/AGENTS.md -> <harness>/AGENTS.md
~/.agents/skills -> <harness>/harness/skills/scopes/workshop/.organized
```

It is idempotent for those exact links. If either target already exists and does not resolve to the
expected source, it stops before creating any link. It never merges, replaces, moves, or backs up
global configuration.

After activation, start OpenCode in a target project, then verify that the global router and the
project `AGENTS.md` are both visible before changing code.

Existing global configuration is a deliberate stop condition. The workshop does not attempt to
merge portable policy into an attendee's current OpenCode setup.

## What this adapter does not carry

- Custom OpenCode agents, commands, plugins, or permission policy.
- Target-project facts or deterministic commands.
- A claim that Codex or Pi have an identical installation mechanism.

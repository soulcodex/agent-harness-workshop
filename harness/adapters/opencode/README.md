# OpenCode reference adapter

This adapter is the working reference for the workshop. It maps portable policy to OpenCode while
leaving target-project instructions and existing user configuration intact.

## Portable sources

| OpenCode location | Portable source | Purpose |
| --- | --- | --- |
| `~/.config/opencode/AGENTS.md` | Root `AGENTS.md` | Global portable router. |
| `~/.agents/skills/` | `harness/skills/scopes/workshop/.organized/` | Managed reusable skills. |
| Per-run `OPENCODE_CONFIG` | `.generated/opencode.jsonc` | Generated five-role OpenCode overlay. |

`harness/roles/*.md` owns the prompt and description for each portable role. This adapter's
[`profile.yaml`](profile.yaml) owns the corresponding OpenCode name, model, mode, temperature,
variant, and permissions. The generator validates those two sources and has no role prompt, agent
name, or model choice of its own.

The model identifiers in `profile.yaml` are a working reference profile. Replace them with model IDs
that exist in your configured OpenCode providers before a workshop run. Those identifiers are host
configuration, not portable policy.

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
global configuration. It also generates `.generated/opencode.jsonc` inside this adapter.

Start OpenCode for the workshop through the launcher:

```bash
bash harness/adapters/opencode/run.sh
```

The launcher regenerates the overlay and provides it through `OPENCODE_CONFIG`. OpenCode merges this
custom layer for that process, so the overlay contains only host-owned role mode, permissions, and
short role bridges. It does not include providers, credentials, MCP servers, target-project facts, or
an attendee's unrelated OpenCode preferences.

After activation, start OpenCode in a target project, then verify that the global router and the
project `AGENTS.md` are both visible before changing code.

Existing global configuration is a deliberate stop condition. The workshop does not attempt to
merge portable policy into an attendee's current OpenCode setup.

## What this adapter does not carry

- Custom OpenCode commands, plugins, provider setup, MCP servers, or general permission policy.
- Target-project facts or deterministic commands.
- A claim that Pi has an identical installation mechanism or configured-subagent model.

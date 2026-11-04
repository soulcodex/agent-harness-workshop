# OpenCode reference adapter

This adapter is the working reference for the workshop. It maps portable policy to OpenCode while
leaving target-project instructions and existing user configuration intact.

## Portable sources

| OpenCode location | Portable source | Purpose |
| --- | --- | --- |
| `~/.config/opencode/AGENTS.md` | `harness/AGENTS.md` | Global portable router. |
| `~/.agents/skills/` | `harness/skills/scopes/workshop/.organized/` | Managed reusable skills. |

OpenCode combines its global `AGENTS.md` with repository `AGENTS.md` files. The global router is
portable policy. Target repositories remain the owner of business rules, commands, architecture,
and runtime facts.

## Build before activation

From the harness repository:

```bash
harness/skills/build-profile.sh
```

The builder proves that `skill-organizer` created the runtime skill from the checked-in source.

## Safe activation procedure

1. Inspect `~/.config/opencode/AGENTS.md` and `~/.agents/skills` first.
2. If either location already has content, do not overwrite it. Merge the portable router with the
   existing global instructions and choose a separate managed profile or backup strategy for skills.
3. If the locations are empty and you have chosen to activate the workshop profile, create explicit
   links from those locations to the portable sources.
4. Start OpenCode in a target project, then verify that the global router and the project
   `AGENTS.md` are both visible before changing code.

Activation is intentionally a human decision. The workshop demonstrates a portable harness, not a
setup script that takes ownership of an attendee's existing agent environment.

## What this adapter does not carry

- Custom OpenCode agents, commands, plugins, or permission policy.
- Target-project facts or deterministic commands.
- A claim that Codex or Pi have an identical installation mechanism.

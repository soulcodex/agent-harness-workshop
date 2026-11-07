# Agent Harness Workshop Repository

These instructions govern this repository. They are not installed into OpenCode. The installable
portable router is [`harness/router/AGENTS.md`](harness/router/AGENTS.md).

## Repository boundary

- Keep Karma API facts, application code, and project-local constraints out of this repository.
- Keep portable policy in `harness/router/`, `harness/guidance/`, `harness/rules/`,
  `harness/roles/`, and `harness/skills/`.
- Keep OpenCode-specific mapping in `harness/adapters/opencode/`.
- Treat `ARCHITECTURE.md` as the architectural source of truth. Change it only when an evidenced
  architecture decision changes a source owner, host contract, generated artifact, compatibility
  boundary, or rollback path. The change must name the evidence and its validation.

## Available commands

| Command | Purpose | Produced artifact or effect |
| --- | --- | --- |
| `./setup.sh` | Report workshop prerequisites without changing the host. | A missing-tool report. |
| `./setup.sh --install` | Install missing attendee-owned prerequisites. | User-scoped `uv` and `skill-organizer` installations. |
| `./setup.sh --verify` | Verify prerequisites and portable generated artifacts. | Generated skill profile and OpenCode overlay. |
| `harness/skills/build-profile.sh` | Build the flat managed skills profile. | `harness/skills/.organized/`. |
| `uv run python harness/adapters/opencode/generate_config.py` | Generate the OpenCode role overlay. | `harness/adapters/opencode/.generated/opencode.jsonc`. |
| `harness/adapters/opencode/activate.sh` | Link the portable runtime into OpenCode configuration. | Four checked symlinks under `$XDG_CONFIG_HOME/opencode`. |
| `harness/adapters/opencode/test-in-docker.sh` | Verify installation without touching a real home directory. | A disposable container simulation. |

Run the smallest applicable command. Do not run activation or setup verification against a real
developer home while changing this repository. Use the Docker verification command instead.

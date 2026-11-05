# Architecture

## Purpose

This repository owns a portable policy layer for the workshop. Karma API owns its own business
facts, source code, runtime, and local instructions. OpenCode is the complete reference adapter.
Pi remains a deferred adapter iteration and is not part of the attendee exercise.

## Source ownership

| Artifact | Canonical source | Consumer |
| --- | --- | --- |
| Repository operation | Root `AGENTS.md` | Contributors working on this harness. |
| Portable router | `harness/router/AGENTS.md` | OpenCode global instruction loading. |
| Guidance and rules | `harness/guidance/`, `harness/rules/` | The portable router. |
| Role prompts | `harness/roles/*.md` | OpenCode overlay generator. |
| Host configuration | `harness/adapters/opencode/profile.yaml` | OpenCode overlay generator. |
| Managed skills | `harness/skills/source/` | Generated flat skills profile. |
| Adapter implementation | `harness/adapters/opencode/` | OpenCode installation and launcher. |

Do not copy portable policy into a target project or an OpenCode-owned configuration file.

## OpenCode installation contract

`harness/adapters/opencode/activate.sh` creates only these symlinks after every target passes its
availability check:

| OpenCode target | Portable source |
| --- | --- |
| `~/.config/opencode/AGENTS.md` | `harness/router/AGENTS.md` |
| `~/.config/opencode/guidance` | `harness/guidance` |
| `~/.config/opencode/rules` | `harness/rules` |
| `~/.config/opencode/skills` | `harness/skills/.organized` |
| `~/.config/opencode/run.sh` | `harness/adapters/opencode/run.sh` |

The generated `opencode.jsonc` remains under the adapter directory and is supplied only through
`OPENCODE_CONFIG` by the linked launcher. Activation never merges, replaces, moves, or backs up a
user-owned OpenCode file.

## Role mapping

Each role Markdown file owns `role`, `agent_type`, `description`, and the prompt. `agent_type` is
either `agent` or `subagent`. The generator maps `agent` to OpenCode `primary` and `subagent` to
OpenCode `subagent`. The profile owns host-specific names, models, permissions, temperatures,
variants, and delegation.

The architect is the only `agent`. Researcher, worker, auditor, and security auditor are
`subagent`s. The human decides whether to accept a result or request a replan.

## Generated artifacts

| Artifact | Generator | Tracking |
| --- | --- | --- |
| `harness/skills/.organized/` | `harness/skills/build-profile.sh` | Ignored. |
| `harness/adapters/opencode/.generated/opencode.jsonc` | `generate_config.py` | Ignored. |

Generated files are disposable views. Edit their checked-in sources only.

## Change policy

Edit this file only when a source owner, host contract, generated-artifact contract, role mapping,
or deferred-adapter boundary changes. The same change must contain evidence for the new decision,
its affected consumers, validation, and a safe rollback or removal path. Copy changes, ordinary
workshop instructions, and implementation details belong elsewhere.

## Deferred Pi adapter

Pi remains an explicit extension. Add `harness/adapters/pi/` only after a manual mapping is repeated
and verified. That work must document Pi's instruction and skill locations, reload lifecycle, and
the OpenCode configured-subagent behavior that Pi cannot claim to reproduce.

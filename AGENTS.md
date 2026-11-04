# Portable Agent Router

This file is the single source of truth for portable harness policy. It travels between projects.
A target project's instructions remain authoritative for its architecture, commands, tooling, style,
tests, delivery constraints, and business facts.

## Always-on contract

- Establish facts from source code, tests, configuration, runtime state, or an authoritative source
  before making a material claim or decision.
- Keep output concise. State the result, evidence, and next action.
- Separate portable policy from project-specific facts. Do not copy repository rules into this
  harness.
- Prefer the smallest change that solves the verified problem.
- Treat deterministic checks as evidence about their narrow contract. They do not prove broader
  behavior by themselves.
- Treat warnings, especially deprecations, as evidence that needs an explicit disposition. Do not
  suppress or silently accept them.

## Lazy context router

Read the smallest matching source before acting.

| Source | Read when | What it governs |
| --- | --- | --- |
| `harness/guidance/evidence.md` | Making a material claim, plan, or recommendation. | Evidence, uncertainty, and stop conditions. |
| `harness/guidance/python.md` | Changing or reviewing Python code. | Typed boundaries, domain pressure, and tests. |
| `harness/guidance/review.md` | Reviewing a change, diff, or verification result. | Independent review and ranked findings. |
| `harness/rules/transversal.md` | Changing architecture, persistence, APIs, or a cross-cutting concern. | Ownership, boundaries, and deterministic accountability. |
| `harness/roles/README.md` | Selecting or defining a work role. | Portable architect, implementer, and reviewer responsibilities. |
| `harness/skills/manifest.yaml` | Selecting a reusable workflow. | Available skills and their purpose. |
| `harness/adapters/README.md` | Installing or changing a host adapter. | Host translation and portability limits. |

## Project boundary

Read the target repository's instructions before changing it. Use the project’s commands and
verification rules. A project instruction is not evidence that the implementation behaves as
described.

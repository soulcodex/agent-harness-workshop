# Agent Harness Workshop

This repository owns portable harness policy. It must not absorb project-specific business rules,
tool commands, architecture, or runtime facts.

## Working rules

- Treat `harness/` as the canonical source for portable policy.
- Keep host-specific configuration in `harness/adapters/`.
- Preserve the distinction between a portable instruction and a project fact.
- State material claims with evidence from the target project, its runtime, or an authoritative
  source.
- Keep agent-facing output concise: result, evidence, and next action.

## Lazy context router

| Source | Read when | What it governs |
| --- | --- | --- |
| `harness/AGENTS.md` | Changing portable policy, routing, or target-project interaction. | Shared working contract and lazy routes. |
| `harness/guidance/evidence.md` | Making a material claim, recommendation, or implementation plan. | Source-first evidence and uncertainty. |
| `harness/guidance/python.md` | Changing Python code or reviewing Python changes. | Typed boundaries and behavior-focused tests. |
| `harness/guidance/review.md` | Reviewing a change or a claimed verification result. | Fresh-context adversarial review. |
| `harness/skills/manifest.yaml` | Selecting or changing a reusable skill. | Skill identity, provenance, and scope. |
| `harness/adapters/README.md` | Configuring a host adapter. | Translation boundary and expected evidence. |

Load only the relevant source before acting.

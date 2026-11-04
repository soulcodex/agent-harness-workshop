# Host adapters

An adapter translates the portable kernel into one host’s configuration surface. It does not become
a second source of portable policy.

## Input

- `harness/AGENTS.md`
- Relevant files under `harness/guidance/`
- `harness/skills/manifest.yaml`
- Future canonical definitions under `harness/agents/`

## Output

The host-specific files, links, or installation steps required by OpenCode, Codex, or Pi.

## Adapter contract

1. Preserve the portable router and its lazy-loading intent.
2. Keep project-specific instructions in the target project.
3. Document unsupported portable capabilities instead of silently dropping them.
4. Prove the adapter points to the expected portable sources.
5. Validate one chosen host during the workshop.

The future generator and its expected-output tests belong here. They are not part of the initial
scaffold.

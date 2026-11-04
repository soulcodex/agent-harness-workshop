# Host adapters

An adapter translates the portable kernel into one host’s configuration surface. It does not become
a second source of portable policy.

## Input

- `harness/AGENTS.md`
- Relevant files under `harness/guidance/`
- `harness/skills/manifest.yaml`
- `harness/skills/scopes/workshop/.organized/` after synchronization

## Output

The host-specific files, links, or installation steps required by OpenCode, Codex, or Pi.

## Adapter contract

1. Preserve the portable router and its lazy-loading intent.
2. Keep project-specific instructions in the target project.
3. Document unsupported portable capabilities instead of silently dropping them.
4. Prove the adapter points to the expected portable sources.
5. Make activation explicit and reversible. Never overwrite an existing host configuration or
   global skills profile by default.

## Workshop scope

`opencode/` is the complete reference adapter used in the workshop. Codex and Pi use the same
portable inputs, but their adapters are follow-on exercises. A future host-config generator may
live here only after the manual adapter has revealed a repeated, verifiable transformation worth
automating.

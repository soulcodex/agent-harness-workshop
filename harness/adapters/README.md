# Host adapters

An adapter translates the portable kernel into one host’s configuration surface. It does not become
a second source of portable policy.

## Input

- Root `AGENTS.md`
- Relevant files under `harness/guidance/`
- `harness/skills/manifest.yaml`
- `harness/skills/.organized/` after synchronization

## Output

The host-specific files, links, or installation steps required by OpenCode.

## Adapter contract

1. Link the root portable router. Do not copy or merge it into a host-owned file.
2. Keep project-specific instructions in the target project.
3. Document unsupported portable capabilities instead of silently dropping them.
4. Prove the adapter points to the expected portable sources.
5. Make activation explicit and reversible. Never overwrite an existing host configuration by
   default.

## Workshop scope

`opencode/` is the complete adapter used in the workshop. It links the portable router, guidance,
rules, and managed skills into OpenCode's configuration directory. It also generates a per-run
`opencode.jsonc` role overlay and passes it through `OPENCODE_CONFIG`. It never writes or merges an
attendee's global configuration.

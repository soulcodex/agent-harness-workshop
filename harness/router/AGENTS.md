# Portable Agent Router

This file is canonical for portable harness policy. It is installed into OpenCode beside the linked
`guidance/`, `rules/`, and `skills/` directories. A target project's `AGENTS.md` supplies local
architecture, commands, tooling, style, tests, and delivery constraints. Its factual assertions
about behavior, architecture, or business rules are claims until corroborated by source code, tests,
configuration, runtime state, or an authoritative source.

## Always-on contract

- Read the target repository's instructions before changing it.
- Keep portable policy separate from project-specific facts.
- Read only the context explicitly routed below.

## Lazy context router

This router intentionally starts without lazy routes. Add one row only when the workshop task calls
for it, then begin a fresh session before comparing the next output.

## Project boundary

Respect the target repository's local operating constraints and use its commands and verification
rules. Do not use a factual assertion from a project instruction to justify a material decision
until it has supporting evidence.

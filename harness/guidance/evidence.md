# Evidence-first decisions

Before a material recommendation, plan, or code change, inspect the closest available source:

1. Target-project instructions, code, tests, configuration, logs, and runtime state.
2. An authoritative source for external behavior that cannot be established locally.
3. Direct callers, consumers, and contracts affected by the change.

Distinguish verified facts, inferences, and unknowns. Ask for a decision only when the missing
information is user intent, authority, or accepted risk.

Stop when the evidence supports the current decision. Do not create architecture from an unverified
claim.

## Warnings and deprecations

When a tool, test, or build emits a warning, report the command, warning, affected dependency or
code path, and likely consequence. Do not silence a warning without first establishing its cause.

If a narrow, evidence-backed fix fits the current change, propose or make it in the same round. If
the fix would expand scope, needs another owner, or cannot be verified locally, propose a tracked
follow-up such as a GitHub issue. The proposal must include the observed warning, impact, owner or
dependency, and the evidence needed to close it.

A warning is not automatically a blocker. It is always a decision that must be visible.

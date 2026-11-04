# Transversal engineering rules

Load this rule when a change reaches architecture, persistence, APIs, or another cross-cutting
concern.

## Boundaries

- Keep transport, application orchestration, domain policy, and infrastructure concerns with their
  respective owners.
- Introduce an abstraction only when a verified external boundary or change pressure requires it.
- Prefer typed domain inputs over primitive bundles or unstructured dictionaries. A plain mapping at
  a function boundary needs a documented, concrete reason.
- Put business behavior under focused tests. A coverage target is not evidence of a business rule.

## Accountability

- Run the narrowest deterministic checks that prove the changed behavior and boundary.
- A warning or deprecation requires a visible disposition: bounded fix now or a proposed tracked
  follow-up with the affected dependency or code path.
- A role or review may challenge a decision, but no probabilistic result overrides deterministic
  evidence.

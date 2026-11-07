# Transversal engineering rules

Load this rule when a change reaches architecture, persistence, APIs, or another cross-cutting
concern.

## Responsibility and boundaries

- Give each business invariant one clear owner, close to the state and knowledge it constrains.
- Keep external edges thin. They parse and validate input, call application behavior, and map output.
- Keep application code responsible for use-case orchestration and transaction boundaries.
- Keep infrastructure responsible for IO and external mappings, never for business policy.
- Split behavior by a real reason to change. Do not create layers or classes only to satisfy a pattern.

Use SRP, Information Expert, Controller, Low Coupling, and Protected Variations as decision lenses.
They are not a checklist for manufacturing abstractions.

## Contracts, types, and coupling

- Make inputs, outputs, expected failures, ownership, and side effects discoverable at each boundary.
- Prefer named DTOs, value objects, and typed identifiers when they express business meaning, protect
  an invariant, or remove ambiguity.
- Do not pass unstructured dictionaries through domain or application code unless a concrete boundary
  requires one and its use is justified.
- Introduce a port, protocol, or adapter only for a verified provider, storage, protocol, or variation
  boundary. Keep framework and SDK types outside domain policy.
- Preserve stable public behavior unless a deliberate, evidenced contract change is part of the work.

## Accountability

- Validate untrusted external input at the edge. Enforce business invariants where the relevant state
  and business knowledge live.
- Put business behavior under focused tests. A coverage target is not evidence of a business rule.
- Test accepted behavior, rejected behavior, and state effects when the rule can mutate state.
- Run the narrowest deterministic checks that prove the changed behavior and boundary.
- A warning or deprecation requires a visible disposition: bounded fix now or a proposed tracked
  follow-up with the affected dependency or code path.
- A role or review may challenge a decision, but no probabilistic result overrides deterministic
  evidence.

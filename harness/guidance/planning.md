# Planning a bounded change

Use this guidance before a non-trivial implementation change. Inspect before planning. Do not begin
editing while scope, ownership, or intended behavior remain uncertain.

Planning turns verified evidence into an executable, reviewable contract. It does not invent
architecture. Identify transversal concerns when a change reaches a business boundary, API,
persistence, cross-cutting concern, or new dependency. Read their detailed rules only when the
router explicitly activates them.

## Required shape

- **Verified starting point:** observed behavior, sources, facts, inferences, and material unknowns.
- **Business outcome and invariant:** the smallest observable outcome, the rule that must hold, and
  the rejected state when relevant.
- **Contract and consumers:** affected callers and consumers, typed inputs and outputs, expected
  failures, compatibility obligations, and public behavior that must remain stable.
- **Ownership and boundaries:** the owner of business policy, orchestration, external input mapping,
  persistence, and side effects. State the dependency direction when a boundary changes.
- **Validation and enforcement:** where external input is validated, where the invariant is enforced,
  and how a rejected operation preserves the intended state.
- **Ordered work:** the smallest execution slices, affected paths, real dependencies, and exclusions.
- **Acceptance and drift detection:** observable business behavior, focused tests, and deterministic
  checks. State which rule each check proves or protects.
- **Credible risks:** only failure behavior or uncertainty supported by the current context.
- **Stop condition:** evidence that would invalidate the plan or require a new decision.

Mark inapplicable concerns explicitly and explain why. Do not turn a plan into a catalogue of
theoretical edge cases, generic refactors, or future architecture. Stop and ask for a decision when
evidence contradicts the plan or a material assumption remains unresolved.

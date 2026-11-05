# Planning a bounded change

Use this guidance before a non-trivial implementation change. Inspect before planning. Do not begin
editing while the scope remains uncertain.

## Required shape

- **Verified starting point:** observed behavior and the source that proves it.
- **Goal and invariant:** the smallest business outcome and rule that must hold.
- **Scope and exclusions:** affected paths, direct consumers, and work that does not belong here.
- **Ordered work:** the execution path, owners, and any real dependency.
- **Acceptance evidence:** observable behavior and focused commands that prove it.
- **Credible risks:** only failure behavior or uncertainty supported by the current context.
- **Stop condition:** evidence that would invalidate the plan or require a new decision.

Do not turn a plan into a catalogue of theoretical edge cases, generic refactors, or future
architecture. Mark unknowns as unknowns. Stop and ask for a decision when evidence contradicts the
plan or a material assumption remains unresolved.

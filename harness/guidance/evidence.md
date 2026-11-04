# Evidence-first decisions

Before a material recommendation, plan, or code change, inspect the closest available source:

1. Target-project instructions, code, tests, configuration, logs, and runtime state.
2. An authoritative source for external behavior that cannot be established locally.
3. Direct callers, consumers, and contracts affected by the change.

Distinguish verified facts, inferences, and unknowns. Ask for a decision only when the missing
information is user intent, authority, or accepted risk.

Stop when the evidence supports the current decision. Do not create architecture from an unverified
claim.

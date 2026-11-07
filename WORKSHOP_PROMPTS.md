# Workshop prompts

Copy one prompt at a time. Open a fresh agent session after each router edit. Keep the comparison
prompt unchanged.

## 0. Baseline control

**Check:** facts, assumptions, unknowns, paths, and commands are present.

```text
Inspect the Karma API without changing files. List the current route, relevant paths, checks to run,
and missing evidence. Separate facts from assumptions. Do not propose architecture.
```

## 1. Evidence route

**Router row to add first:**

```text
| `guidance/evidence.md` | Planning or recommending. | Facts, uncertainty, and stop conditions. |
```

**Check:** the response names an invariant, sources, affected paths, validation, and a stop
condition.

```text
Read the applicable repository instructions and routed guidance. Do not edit files. Based on the
supplied Karma contract, what is the smallest verified next step? State the business invariant,
evidence, affected paths, commands, and a stop condition.
```

## 2. Planning route

**Router row to add first:**

```text
| `guidance/planning.md` | Planning a change. | Contract, scope, acceptance, and stop conditions. |
```

**Check:** the plan is executable and stays inside the supplied Karma contract.

```text
Read the applicable repository instructions and routed guidance. Do not edit files. Plan the first
vertical slice of the supplied Karma contract. Include the verified starting point, business
invariant, affected consumers, contract, scope and exclusions, ordered work, acceptance evidence,
credible risks, and a stop condition. Mark unknowns as unknowns.
```

## 3. Anti-slop control run

**Check:** save this response before adding the anti-slop route.

```text
Without editing files, write a handoff for the current Karma API plan: what should change next, why,
and how to validate it.
```

## 4. Anti-slop comparison run

**Router row to add first:**

```text
| `rules/anti-slop.md` | Writing plans, handoffs, or reviews. | Concise decisions. |
```

**Check:** compare the result with prompt 3 for usefulness, not identical wording.

```text
Without editing files, write a handoff for the current Karma API plan: what should change next, why,
and how to validate it.
```

## 5. Engineering routes

**Router rows to add first:**

```text
| `guidance/python.md` | Changing or reviewing Python. | Typed code and focused tests. |
| `rules/transversal.md` | Cross-cutting changes. | Boundaries and deterministic checks. |
```

**Check:** business policy has an owner outside the HTTP handler.

```text
Inspect the Karma API and routed guidance. Do not edit files. Propose the smallest Karma API slice.
State the policy owner, typed inputs and outputs that clarify the operation, validation and
invariant-enforcement boundaries, business tests that detect rule drift, deterministic checks,
affected paths, exclusions, and a stop condition.
```

## 6. Business tests

**Check:** each test proves an observable rule rather than a coverage target.

```text
Use the supplied Karma contract. Add focused tests for accepted `POST /karma`,
`GET /karma/{person_id}`, an unknown person ID, independent daily `+5` and `-5` limits, and a sixth
directional point rejected with `409` without changing recorded state. Do not change production
code. State what each test proves.
```

## 7. Domain change

**Check:** the policy lives outside the HTTP edge and all focused checks pass.

```text
Implement the smallest change that satisfies the Karma contract tests. Keep policy out of the HTTP
handler. Use an opaque typed person ID and make time a dependency outside domain policy. Use typed
inputs where they remove a real ambiguity. Run the narrowest relevant checks and report their scope.
```

## 8. Independent review

**Router row to add first:**

```text
| `guidance/review.md` | Reviewing a change or result. | Independent review and findings. |
```

**Check:** findings cite evidence. An approval is valid when no credible finding exists.

```text
Review the current Karma diff from a fresh, read-only context. Check the supplied endpoint contract,
daily-budget behavior, policy boundary, and credible regressions. Return only evidence-backed
findings or an approval. Include command evidence and the disposition of any warning.
```

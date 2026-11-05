# Workshop tasks

Complete the tasks in order. Keep Karma API facts in the API repository. Keep portable policy in
this harness. The router starts deliberately minimal, so every added row has an observable purpose.

## 0. Establish the baseline

**Problem:** an agent can produce a plausible plan without knowing the service.

Run prompt 0 without changing files. Save the response as the control for later comparisons.

**Accept when:** it cites routes, paths, commands, facts, assumptions, and unknowns.

## 1. Add the evidence route

**Problem:** a feature request does not prove the current behavior or the next change.

Add this row to `harness/router/AGENTS.md`, open a fresh session, then run prompt 1:

| Source | Read when | What it governs |
| --- | --- | --- |
| `guidance/evidence.md` | Planning or recommending. | Facts, uncertainty, and stop conditions. |

**Accept when:** the next-step proposal names the invariant, sources, affected paths, validation,
and a stop condition.

## 2. Add the planning route

**Problem:** evidence alone does not make a plan executable or keep it bounded.

Add this row, open a fresh session, then run prompt 2:

| Source | Read when | What it governs |
| --- | --- | --- |
| `guidance/planning.md` | Planning a change. | Scope, acceptance, risks, and stop conditions. |

**Accept when:** the plan is specific enough to execute, excludes unrelated work, and labels any
unknowns instead of inventing them.

## 3. Add the anti-slop route

**Problem:** a rule stored in a repository changes nothing until the router makes it available.

Preserve the control response from prompt 3. Add this row, open a fresh session, then repeat the
same prompt with prompt 4:

| Source | Read when | What it governs |
| --- | --- | --- |
| `rules/anti-slop.md` | Writing plans, handoffs, or reviews. | Concise decisions. |

**Accept when:** the detailed rule stays outside `AGENTS.md`, the comparison identifies one useful
change, and it names one reason exact wording still varies.

## 4. Add engineering routes

**Problem:** the service needs business policy without moving it into HTTP handlers.

Add these rows before asking an agent to change the Karma API, then run prompt 5:

| Source | Read when | What it governs |
| --- | --- | --- |
| `guidance/python.md` | Changing or reviewing Python. | Typed code and focused tests. |
| `rules/transversal.md` | Cross-cutting changes. | Boundaries and deterministic checks. |

**Accept when:** the proposed daily-budget slice has business tests, typed inputs where they clarify
meaning, and a policy owner outside the HTTP edge.

## 5. Implement the Karma rule

**Problem:** the supplied API records happy-path adjustments but does not enforce daily limits.

Run prompts 6 and 7. Add tests first for independent daily `+5` and `-5` limits and for rejection
without mutation. Then implement the smallest policy that satisfies them.

**Accept when:** accepted adjustments remain observable, a sixth directional point is rejected,
positive and negative totals remain independent, and rejected requests leave state unchanged.

## 6. Add the review route and challenge the change

**Problem:** implementation context cannot approve its own work.

Add this row, open a fresh reviewer session, then run prompt 8:

| Source | Read when | What it governs |
| --- | --- | --- |
| `guidance/review.md` | Reviewing a change or result. | Independent review and findings. |

**Accept when:** the review cites the diff or command output, distinguishes findings from approval,
includes warning disposition, and leaves acceptance or replanning to the human.

## Extensions after the core path

- Generate the OpenCode role profile from the portable role sources.
- Build and organize reusable skills.
- Activate the OpenCode adapter only after inspecting existing host targets.
- Add a Pi adapter, SQLite, memory, or deterministic architecture tests when time permits.

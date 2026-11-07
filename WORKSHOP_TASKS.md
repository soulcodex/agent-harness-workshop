# Workshop tasks

Complete the tasks in order. Keep Karma API facts in the API repository. Keep portable policy in
this harness. The router starts deliberately minimal, so every added row has an observable purpose.

## 0. Prepare an isolated OpenCode runtime

**Problem:** changing a portable router has no observable effect until a fresh agent session loads it.

From the harness repository, run `./setup.sh`, resolve any missing attendee-owned prerequisites, then
run `./setup.sh --verify`. Set `XDG_CONFIG_HOME` to the ignored `.harness-config/` directory and
activate the adapter. Start OpenCode from that same
terminal with `--standalone` so it uses the isolated configuration instead of an existing background
server.

**Accept when:** the portable router, guidance, rules, and skills are linked under the isolated
OpenCode configuration. No existing OpenCode configuration has changed.

## 1. Establish the baseline

**Problem:** an agent can produce a plausible plan without knowing the service.

Run prompt 0 without changing files. Save the response as the control for later comparisons.

**Accept when:** it cites the health route, relevant paths, commands, facts, assumptions, and
unknowns.

## 2. Add the evidence route

**Problem:** a feature request does not prove the current behavior or the next change.

Add this row to `harness/router/AGENTS.md`, open a fresh session, then run prompt 1:

| Source | Read when | What it governs |
| --- | --- | --- |
| `guidance/evidence.md` | Planning or recommending. | Facts, uncertainty, and stop conditions. |

**Accept when:** the next-step proposal names the invariant, sources, affected paths, validation,
and a stop condition.

## 3. Add the planning route

**Problem:** evidence alone does not make a plan executable or keep it bounded.

Add this row, open a fresh session, then run prompt 2:

| Source | Read when | What it governs |
| --- | --- | --- |
| `guidance/planning.md` | Planning a change. | Contract, scope, acceptance, and stop conditions. |

**Accept when:** the plan is specific enough to execute, identifies the first target-contract slice
and policy owner where relevant, excludes unrelated work, and labels unknowns instead of inventing
them.

## 4. Add the anti-slop route

**Problem:** a rule stored in a repository changes nothing until the router makes it available.

Preserve the control response from prompt 3. Add this row, open a fresh session, then repeat the
same prompt with prompt 4:

| Source | Read when | What it governs |
| --- | --- | --- |
| `rules/anti-slop.md` | Writing plans, handoffs, or reviews. | Concise decisions. |

**Accept when:** the detailed rule stays outside `AGENTS.md`, the comparison identifies one useful
change, and it names one reason exact wording still varies.

## 5. Add engineering routes

**Problem:** the service needs business policy without moving it into HTTP handlers.

Add these rows before asking an agent to change the Karma API, then run prompt 5:

| Source | Read when | What it governs |
| --- | --- | --- |
| `guidance/python.md` | Changing or reviewing Python. | Typed code and focused tests. |
| `rules/transversal.md` | Cross-cutting changes. | Boundaries and deterministic checks. |

**Accept when:** the proposed Karma API slice has typed boundaries where they clarify meaning, names
validation and invariant-enforcement owners, includes business tests that detect rule drift, and
keeps policy outside the HTTP edge.

## 6. Build the Karma API contract

**Problem:** the supplied API exposes only health. The target contract does not choose the application
shape or prove its own business rules.

Run prompts 6 and 7. Add tests first for the supplied endpoint contract, independent daily `+5` and
`-5` limits, and rejection without mutation. Then implement the smallest service that satisfies them.

**Accept when:** `POST /karma` and `GET /karma/{person_id}` meet the documented contract, a sixth
directional point is rejected with `409`, positive and negative totals remain independent, and
rejected requests leave state unchanged.

## 7. Add the review route and challenge the change

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
- Add a Pi adapter, SQLite, memory, or deterministic architecture tests when time permits.

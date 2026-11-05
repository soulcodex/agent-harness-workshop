# Workshop tasks

Complete the tasks in order. A task is complete only when its acceptance evidence is available.
Keep Karma API facts in the API repository. Keep portable policy in this harness.

## 0. Establish the baseline

**Problem:** an agent can produce a plausible answer without knowing the current service behavior.

Run prompt 0 for a no-change inventory of Karma API routes, module context, instructions, checks,
and missing evidence.

**Accept when:** the inventory cites paths and commands. It distinguishes facts from assumptions.

## 1. Verify the root router

**Problem:** portable guidance becomes contradictory when it has more than one entry point.

Run prompt 1. Root `AGENTS.md` is the canonical portable source of truth. It routes to guidance,
rules, roles, skills, and adapters without restating their detail. A target repository's `AGENTS.md`
supplies local constraints, while factual assertions from it still need corroborating evidence.

**Accept when:** there is no second harness `AGENTS.md`, and a project instruction remains outside
this repository. The root router distinguishes local operating constraints from evidence.
`harness/rules/anti-slop.md` exists but is intentionally not routed yet.

## 2. Apply evidence guidance

**Problem:** a request for a feature does not establish the current behavior or the relevant rule.

Run prompt 2 to inspect Karma module context and propose the smallest next behavior with explicit
evidence and a stop condition.

**Accept when:** the proposal names the business invariant, affected paths, and commands that will
prove the change.

## 3. Activate and compare anti-slop

**Problem:** a rule stored in a repository does not affect an agent until the root router tells the
agent when to read it.

Run prompts 3, 4, and 5 in order. Preserve the control response, add the `anti-slop.md` lazy-loading
row to root `AGENTS.md`, restart the host or open a new session, then repeat the same prompt.

**Accept when:** the detailed rule remains outside `AGENTS.md`, the router contains one applicable
row, and the attendee compares both responses for answer-first writing, evidence, uncertainty,
filler, and a clear next action. The comparison identifies one useful change and one reason the
outputs are not deterministic.

## 4. Generate OpenCode work roles

**Problem:** one agent can plan, implement, and approve an unsupported change without fresh scrutiny.

Run prompt 6. `harness/adapters/opencode/generate_config.py` combines the role Markdown files and
the host-specific `profile.yaml` into an OpenCode-only configuration overlay. It maps the portable
responsibilities below to host agents but does not contain provider credentials, user MCP servers, or
project facts.

| Portable role | Generated OpenCode agent | Expected behavior |
| --- | --- | --- |
| `architect` | `architect` | Verify the problem, set scope and acceptance criteria, then delegate bounded work. |
| `researcher` | `researcher` | Close one evidence gap from a read-only context. |
| `worker` | `worker` | Make the smallest approved change and run deterministic checks. |
| `auditor` | `auditor` | Review the supplied diff and verification evidence from a fresh, read-only context. |
| `security-auditor` | `security-auditor` | Inspect reached trust paths against applicable OWASP controls from a fresh, read-only context. |

The human is not a sixth agent. The human accepts the result or asks for a replan after review.

**Accept when:** the generated overlay names all five agents, the worker can edit while the other
four cannot, and the architect can delegate only to the named subagents. The output remains
inside `harness/adapters/opencode/.generated/`.

## 5. Manage the review skill

**Problem:** reusable workflows drift when copied into each host's private configuration.

Run prompt 7 to build the managed `review-change` skill with `skill-organizer`.

**Accept when:** `harness/skills/.organized/review-change/SKILL.md` and its `manifest.yaml` resolve
to checked-in sources, and Git does not track the generated tree. Do not upgrade skills during the
workshop.

## 6. Activate the OpenCode reference adapter

**Problem:** copying policy into a global OpenCode file creates a second source of truth and risky
merges.

Run prompt 8. The adapter creates OpenCode configuration symlinks for the root router, guidance,
rules, and managed skills. The launcher generates and passes an OpenCode overlay through
`OPENCODE_CONFIG` for that one process.

**Accept when:** all four OpenCode targets are symlinks to this repository's root router, guidance,
rules, and managed skill profile. The generated overlay remains in this repository. If any target is
already occupied, stop rather than merge or overwrite it.

## 7. Apply transversal and Python rules

**Problem:** direct HTTP and primitive-value code makes it easy to move business policy into the
wrong layer.

Run prompts 9 and 10. Use `harness/rules/transversal.md` and `harness/guidance/python.md` when
implementing the first Karma slice. Prefer typed inputs and business tests. Add an abstraction only
when the service has a real boundary to protect.

**Accept when:** the HTTP edge is not the only owner of the Karma decision, and tests demonstrate a
business invariant rather than a coverage number.

## 8. Deliver and challenge one Karma change

**Problem:** a passing-looking diff is not necessarily a correct or maintainable result.

Run prompt 11 in a fresh reviewer context after the deterministic checks finish.

**Accept when:** the result includes changed behavior, command evidence, warning disposition, and any
unresolved risk. Record one harness refinement prompted by the review.

## 9. Complete the evidence loop

**Problem:** a set of installed files does not prove that role boundaries, evidence, and independent
review actually work together.

Run prompt 12 after the Karma change exists. Use the configured OpenCode role loop: architect,
worker, auditor, and security auditor. Keep the review contexts fresh and bounded by the supplied
goal, diff, checks, affected boundary, and stop condition.

**Accept when:** the final packet separates the architect's scope, worker's implementation evidence,
auditor's code verdict, and security auditor's OWASP-backed verdict. The human can accept the
change or request a replan from the evidence.

## Extensions after the core path

- Add SQLite only after in-memory Karma behavior makes persistence a real boundary.

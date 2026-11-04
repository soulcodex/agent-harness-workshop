# Workshop tasks

Complete the tasks in order. A task is complete only when its acceptance evidence is available.
Keep Karma API facts in the API repository. Keep portable policy in this harness.

## 0. Establish the baseline

**Problem:** an agent can produce a plausible answer without knowing the current service behavior.

Ask the chosen host for a no-change inventory of Karma API's current routes, module context,
instructions, checks, and missing evidence.

**Accept when:** the inventory cites paths and commands. It distinguishes facts from assumptions.

## 1. Make the root router authoritative

**Problem:** portable guidance becomes contradictory when it has more than one entry point.

Use root `AGENTS.md` as the single portable source of truth. Confirm that it routes to guidance,
rules, roles, skills, and adapters without restating their detail.

**Accept when:** there is no second harness `AGENTS.md`, and a project instruction remains outside
this repository.

## 2. Apply evidence guidance

**Problem:** a request for a feature does not establish the current behavior or the relevant rule.

Use `harness/guidance/evidence.md` to make the agent inspect the Karma module context and propose
the smallest next behavior with explicit evidence and a stop condition.

**Accept when:** the proposal names the business invariant, the affected paths, and the commands
that will prove the change.

## 3. Apply transversal and Python rules

**Problem:** direct HTTP and primitive-value code makes it easy to move business policy into the
wrong layer.

Use `harness/rules/transversal.md` and `harness/guidance/python.md` when implementing the first
Karma slice. Prefer typed inputs and business tests. Add an abstraction only when the service has a
real boundary to protect.

**Accept when:** the HTTP edge is not the only owner of the Karma decision, and tests demonstrate a
business invariant rather than a coverage number.

## 4. Configure work roles in OpenCode

**Problem:** one agent can plan, implement, and approve an unsupported change without fresh
scrutiny.

At the OpenCode configuration level, define these five named agents. For each one, declare the
prompt, behavior, permissions, limits, and handoff requirements. Use
`harness/roles/README.md` as the portable source for those responsibilities. Do not duplicate or
contradict it.

| Agent | Expected behavior | Boundary and handoff |
| --- | --- | --- |
| `architect` | Verify the problem, set scope and acceptance criteria, then delegate bounded work. | Does not approve its own implementation. Gives each delegate the goal, evidence, constraints, and stop condition. |
| `researcher` | Close a specific evidence gap with local or authoritative sources. | Read-only. Returns sources, findings, and uncertainty to the architect. |
| `worker` | Make the smallest approved change and run the relevant deterministic checks. | Edits only the approved slice. Returns the diff, check output, and warning disposition. It does not self-approve. |
| `auditor` | Review the diff from a fresh context for requested behavior, design, and credible regressions. | Read-only. Receives the diff and verification evidence. Returns a concise verdict with evidence-backed findings only. |
| `security-auditor` | Review reached trust boundaries and credible exploit paths from a fresh context. | Read-only. Approves promptly when no relevant boundary is reached. Returns a concise verdict with evidence-backed findings only. |

The human is not a sixth agent. The human accepts the result or asks for a replan after the review
verdicts are available.

**Accept when:** the OpenCode configuration names all five agents and defines their scopes and
limits. The worker cannot approve its own work. Both auditors receive the diff and verification
evidence from a fresh context. The final decision remains with the human.

## 5. Manage the review skill

**Problem:** reusable workflows drift when copied into each host's private configuration.

Run `harness/skills/build-profile.sh` to build the managed `review-change` skill with
`skill-organizer`.

**Accept when:** `harness/skills/scopes/workshop/.organized/review-change/SKILL.md` resolves to the
checked-in source and Git does not track the generated tree. If `skill-organizer` reports that
updates have not been checked, record it as a maintenance signal. Do not upgrade skills during the
workshop because this profile has one reviewed, local skill and no imported source to refresh.

## 6. Activate the OpenCode reference adapter

**Problem:** copying policy into a global OpenCode file creates a second source of truth and risky
merges.

For an attendee using OpenCode, run `harness/adapters/opencode/activate.sh`.

**Accept when:** both OpenCode targets are symlinks to this repository's root router and managed
skill profile. If either target is already occupied, stop rather than merge or overwrite it.

## 7. Deliver and challenge one Karma change

**Problem:** a passing-looking diff is not necessarily a correct or maintainable result.

Implement one small Karma behavior. Run the project’s deterministic checks. Then use the managed
review skill and a fresh reviewer to challenge the diff.

**Accept when:** the result includes the changed behavior, command evidence, warning disposition,
and any unresolved risk. Record one harness refinement prompted by the review.

## Extensions after the core path

- Map the portable role cards to Codex or Pi without claiming configuration parity.
- Add SQLite only after in-memory Karma behavior makes persistence a real boundary.
- Automate another host adapter only after repeating a manual, verifiable mapping.

# Workshop prompts

Copy one prompt at a time. Each check states the evidence needed before moving on.

## 0. Baseline

**Check:** paths, commands, facts, assumptions, and unknowns are present.

```text
Inspect the Karma API without changing files. List current routes, relevant paths, checks to run,
and missing evidence. Separate facts from assumptions. Do not propose architecture.
```

## 1. Root router

**Check:** portable policy is separate from Karma API facts. Anti-slop is not routed yet.

```text
Inspect this harness root AGENTS.md. Confirm it is the only portable router for its existing
guidance, rules, roles, skills, and adapters. Confirm target-repository AGENTS.md files provide
local constraints while factual claims still need evidence. Keep repository facts outside this
harness. Do not route anti-slop.md. Report paths and any gap only.
```

## 2. Evidence before action

**Check:** the response names a business invariant, evidence, and a stop condition.

```text
Read the applicable repository instructions and evidence guidance. Do not edit files. What is the
smallest verified next step for the Karma API? State the business invariant, evidence, affected
paths, commands, and a stop condition.
```

## 3. Anti-slop control run

**Check:** save this response before changing the router.

```text
Without editing files, write a handoff for the current Karma API baseline: what should change next,
why, and how to validate it.
```

## 4. Activate anti-slop

**Check:** the router gains one route. The rule content is not copied into AGENTS.md.

```text
Add a lazy-loading route for rules/anti-slop.md when writing plans, reviews, handoffs,
documentation, commit messages, or PR text. Keep the detailed rule outside AGENTS.md. Show the
smallest change and how a fresh session will load it.
```

## 5. Anti-slop comparison run

**Check:** compare this response with prompt 3. Identify one useful change and one source of
non-determinism.

```text
Without editing files, write a handoff for the current Karma API baseline: what should change next,
why, and how to validate it.
```

## 6. Generate OpenCode roles

**Check:** the generated overlay names the five configured agents and does not contain credentials,
provider setup, MCP servers, or project facts.

```text
Inspect harness/roles/, harness/adapters/opencode/profile.yaml, and
harness/adapters/opencode/generate_config.py. Generate the OpenCode overlay. Verify it maps
architect, researcher, worker, auditor, and security-auditor to the portable role contract without
hardcoding prompts, names, or models in Python. Do not edit an existing global opencode.jsonc. Return
the generated path and the validation command.
```

## 7. Build the review skill

**Check:** the generated skill resolves to its checked-in source and Git does not track it.

```text
Build the managed review-change skill with harness/skills/build-profile.sh. Verify the generated
SKILL.md resolves to the checked-in source. Do not upgrade or add skills.
```

## 8. Activate the OpenCode reference adapter

**Check:** the portable router, guidance, rules, and managed skills become OpenCode configuration
symlinks. The role overlay is loaded only by the workshop launcher.

```text
Inspect the OpenCode adapter before activation. Run its activation only if all target paths are
available. Then start OpenCode through harness/adapters/opencode/run.sh so OPENCODE_CONFIG loads
the generated role overlay for this process. Do not overwrite, merge, or symlink a global
opencode.jsonc. Return the links, generated path, and fresh-session check.
```

## 9. Business tests

**Check:** each test proves a Karma invariant rather than a coverage target.

```text
Inspect the Karma API and its instructions. Add focused tests for the daily +5 and -5 limits. Do
not change production code. State the behavior each test proves.
```

## 10. Domain change

**Check:** the HTTP edge is thinner and the domain owns the decision.

```text
Implement the smallest change that satisfies the Karma tests. Use typed inputs where they remove a
real ambiguity. Keep policy out of the HTTP handler. Run the narrowest relevant checks.
```

## 11. Independent review

**Check:** findings cite the diff or check output. Do not accept speculative defects.

```text
Review the current Karma diff from a fresh, read-only context. Check requested behavior, design,
and credible regressions. Return only evidence-backed findings or an approval.
```

## 12. Complete the evidence loop

**Check:** architect, worker, and independent reviewers have separate responsibilities and each
verdict cites evidence.

```text
Use the configured OpenCode roles to complete an evidence loop for the current Karma API change.
The architect must define the acceptance criteria, affected boundary, deterministic checks, and stop
condition. The worker implements only that bounded slice. The auditor reviews the resulting diff
from fresh context. The security auditor reviews the reached API trust boundary against applicable
OWASP controls. Return the evidence, verdicts, and whether the human should accept or replan.
```

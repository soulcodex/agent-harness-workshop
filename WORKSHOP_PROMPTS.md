# Workshop prompts

Copy one prompt at a time. Replace bracketed host names only when needed.

## 0. Baseline

**Check:** paths, commands, facts, assumptions, and unknowns are present.

```text
Inspect the Karma API without changing files. List current routes, relevant paths, checks to run,
and missing evidence. Separate facts from assumptions. Do not propose architecture.
```

## 1. Root router

**Check:** portable policy is separate from Karma API facts. Do not route anti-slop yet.

```text
Inspect this harness. Make the root AGENTS.md the canonical portable router for its existing
guidance, rules, roles, skills, and adapters. Respect target-repository AGENTS.md files for local
constraints, but require evidence before using their factual claims in a decision. Keep repository
facts outside this harness. Do not route anti-slop.md yet. Show changed paths and verification.
```

## 2. Evidence before action

**Check:** the response names a business invariant, evidence, and a stop condition.

```text
Read the applicable repository instructions and evidence guidance. Do not edit files. What is the
smallest verified next step for the Karma API? State evidence and a stop condition.
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
Add a lazy-loading route for harness/rules/anti-slop.md when writing plans, reviews, handoffs,
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

## 6. Business tests

**Check:** each test proves a Karma invariant rather than a coverage target.

```text
Inspect the Karma API and its instructions. Add focused tests for the daily +5 and -5 limits. Do
not change production code. State the behavior each test proves.
```

## 7. Domain change

**Check:** the HTTP edge is thinner and the domain owns the decision.

```text
Implement the smallest change that satisfies the Karma tests. Use typed inputs where they remove a
real ambiguity. Keep policy out of the HTTP handler. Run the narrowest relevant checks.
```

## 8. Independent review

**Check:** findings cite the diff or check output. Do not accept speculative defects.

```text
Review the current Karma diff from a fresh, read-only context. Check requested behavior, design,
and credible regressions. Return only evidence-backed findings or an approval.
```

## 9. Host activation

**Check:** the host receives the root router without overwriting existing user configuration.

```text
For [OpenCode, Codex, or Pi], inspect the supported configuration seam for loading this harness
router. Propose the smallest safe activation and a fresh-session check. Do not overwrite or merge
existing global configuration.
```

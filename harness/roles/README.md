# Portable work roles

These roles describe responsibilities, not host-specific agent configuration. The OpenCode adapter
maps them to `workshop-*` agent identifiers. Pi may map the same responsibilities to fresh sessions
or carefully bounded prompts.

| Role | Expected behavior | Boundary | Handoff |
| --- | --- | --- | --- |
| `architect` | Establish evidence, scope, acceptance criteria, and boundaries. Delegate only bounded work. | Does not make broad production changes or approve its own implementation. | A packet with the goal, evidence, constraints, affected paths, checks, and stop condition. |
| `researcher` | Resolve a specific evidence gap using local or authoritative sources. | Read-only. Does not implement or make architecture decisions. | Sources, findings, limits, and remaining uncertainty to the architect. |
| `worker` | Make the smallest approved change and run focused deterministic checks. | Edits only the approved slice. Does not invent architecture or self-approve. | Diff, check output, warning disposition, and unresolved risk to the architect. |
| `auditor` | Independently assess the diff for requested behavior, design, and credible regressions. | Fresh, read-only context. Does not implement or report speculative defects. | A concise evidence-backed verdict and the smallest correction for each blocking finding. |
| `security-auditor` | Independently assess reached trust boundaries and credible exploit paths. | Fresh, read-only context. Does not perform a general security inventory. | A concise evidence-backed verdict. Approve promptly when the slice reaches no relevant boundary. |

The human decides whether to accept the result or replan. Keep role instructions small. The root
router and its lazy-loaded sources remain the portable policy source of truth.

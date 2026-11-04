---
name: review-change
description: Review a proposed change using project evidence and focused deterministic checks.
metadata:
    skill-organizer:
        original-name: review-change
        source-relative-path: review-change
        disabled: false
        risk-score: 0
        risk-evaluated-at: ""
        risk-evaluator: ""
        risk-reason: ""
        risk-source-hash: ""
---

# Review a change

1. Read the target repository's instructions and the smallest relevant context.
2. Inspect the diff and identify the behavior or boundary it changes.
3. Run or inspect the deterministic checks that apply to that behavior.
4. Inspect command output for warnings and deprecations. Require a bounded fix or a visible
   follow-up proposal for each one.
5. Report verified findings before uncertain concerns.
6. Stop after the decision, evidence, and credible findings are clear.

Do not approve a change solely because it looks plausible or because a broad check passed.

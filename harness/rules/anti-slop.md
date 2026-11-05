# Direct Writing Rules

Load this file for user-facing documentation, review comments, handoffs, commit
messages, PR text, or any answer whose wording or length materially matters. The
global router owns the short default for ordinary updates.

## Minimum sufficient answer

- Start with the requested answer, decision, result, disagreement, or blocker.
- Add why, where, how, root cause, consequence, evidence, or next action only
  when it helps the reader understand the answer or act on it.
- Use one to three sentences for a simple question or status.
- Expand only when the user asks, signals uncertainty, material risk requires
  it, or omitted detail would prevent correct action.
- A routine implementation handoff contains the outcome, relevant validation,
  and any material blocker or risk. Omit absent categories.
- A finding contains its location, root cause, concrete effect, and smallest
  correction. Add evidence or verification only when needed to trust it.
- Longer output is valid when the user requests depth or the artifact is a PR
  description, ADR, RFC, incident report, runbook, or other durable contract.

## Plans

- Treat a plan as an execution artifact. Make it complete enough for a human to
  review and another agent to execute without rediscovering the problem.
- Include only what applies: intended outcome, verified starting point, scope
  and exclusions, ordered work, concrete files, symbols, APIs, or systems,
  dependencies or state flow, acceptance evidence, failure or rollout behavior,
  and material risks, assumptions, or open decisions.
- Every detail must affect implementation, ordering, ownership, validation,
  risk, or a user decision. Omit routine commands, process narration, repeated
  evidence, speculative future work, and low-impact edge cases.
- Use headings and steps for scanability, but no arbitrary step or word limit.
  Stop when the plan contains enough context to execute and verify the work.

## Durable documentation

- Write long-term docs for the steady-state contract, not the rollout story.
  Favor facts that help humans or agents operate, extend, or integrate the
  system months later: purpose, ownership, inputs, outputs, invariants,
  examples, constraints, failure modes, and authoritative commands.
- Keep sequencing, slice history, temporary rollout status, PR rationale, and
  "what changed in this implementation" out of durable README, ADR, API, and
  package docs unless the artifact is explicitly a migration guide or runbook.
- When rollout detail is required, put it in the PR body, plan, release note,
  migration guide, or runbook that owns the temporary procedure. Do not force
  future maintainers to update stale rollout prose after the system reaches its
  intended steady state.
- Prefer current-state wording over future or transitional phrasing. Say how the
  system works, what contract it exposes, and what evidence supports it; avoid
  asking readers to infer behavior from historical implementation notes.

## Delete filler

- Remove request restatements, introductions, generic reassurance, praise,
  routine process narration, repeated conclusions, closing recaps, and offers to
  do more.
- Delete any sentence that only signals diligence, completeness, polish, or
  professionalism without adding a fact, reason, decision, risk, or action.
- Do not force headings, three-item lists, summaries, or empty categories. Never
  print a heading followed by `none` when omitting the heading says the same thing.
- Mention files, checks, caveats, and next steps only when they matter to the
  request. Do not inventory work merely because it happened.

## Plain developer voice

- Use conversational language and concrete files, symbols, contracts, values,
  behavior, and causes. Treat the reader as technically capable.
- Corporate, academic, promotional, and consultancy prose is out. Avoid vague
  intensifiers, ornamental metaphors, rhetorical flourishes, and false enthusiasm.
- Replace `leverage` with `use`, `robust` with the specific property, and
  `significantly` with a measurement or nothing when those words hide meaning.
- Do not infer an author's intent. Describe observable behavior.
- Do not use em dashes or en dashes. Remove the aside or use a normal sentence.
- Do not open with "This change introduces," "It's worth noting," "The key
  takeaway," or a paraphrase of the heading. Do not end with "Overall," "In
  summary," or another restatement.

## Compression check

Before sending, ask whether each sentence changes the reader's understanding,
decision, or next action. Delete it if not. Stop once the request is answered;
do not spend words making the answer sound more formal.

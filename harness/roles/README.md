# Portable work roles

These roles describe responsibilities, not host-specific agent configuration. The selected host
may implement them with named agents, a fresh session, or one carefully bounded prompt.

| Role | Owns | Must not do |
| --- | --- | --- |
| Architect | Evidence, scope, acceptance criteria, and boundaries. | Implement broad changes before the problem is verified. |
| Implementer | The smallest approved change and focused verification. | Invent architecture, ignore project instructions, or self-approve. |
| Reviewer | A fresh assessment of the diff and evidence. | Re-implement the change or report speculative findings as defects. |

Keep role instructions small. The root router and its lazy-loaded sources remain the portable
policy source of truth.

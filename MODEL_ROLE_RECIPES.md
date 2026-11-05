# Role-model recipes

Fact-checked on 2026-11-05. These are starting points for a small, bounded role
loop. They are not benchmark results or a promise that a given model is available
in every host.

## Read this first

- A model is not inherently free. Access can require a subscription, API spend,
  a host quota, promotional credits, or local hardware.
- Confirm the exact model identifier and effort setting in your chosen host before
  starting. Host aliases are not portable model IDs.
- Keep web research separate from model choice. It needs an enabled, trustworthy
  search or browsing tool.
- Start with one role loop and the same small task. Change one model or effort
  setting at a time, then compare evidence quality, deterministic checks, and
  review findings.

## Corrected model registry

| Model | Canonical name or ID | Published detail | Workshop status |
| --- | --- | --- | --- |
| GLM-5.3 | `GLM-5.3` | Z.ai does not publish a parameter count in its release post. | Hosted option. Confirm the host route and plan. |
| Kimi K3 | `kimi-k3` | 2.8T total parameters, 104B active, 1M context. | Hosted option. |
| Qwen3.8-Max | `qwen3.8-max` | The owner documents the model ID, not a parameter count. | Hosted option. |
| Qwen3-Coder-Next | `Qwen/Qwen3-Coder-Next` or host ID `qwen3-coder-next` | Based on Qwen3-Next-80B-A3B. Native 256K context, extendable to 1M with YaRN. | Open-weight coding option. Local use needs suitable hardware. |
| DeepSeek-V4.1-Flash | API ID `deepseek-flash` | 552B MoE parameters. 8B active input and 16B active output. 1,048,576 context through the current API. | Hosted/API option. Supports low, high, and max effort. |
| Gemini 3.8 Flash | `gemini-3.8-flash` | The documented current API ID supports low, medium, and high thinking. | Hosted/API option. |
| Claude Sonnet 5 | Claude Sonnet 5 | Active Anthropic model family. | Hosted/API option. |
| Claude Opus 5 | Claude Opus 5 | Active Anthropic model family. | Hosted/API option. |
| Claude Haiku 4.5 | `claude-haiku-4-5` | Active Anthropic small-model family. | Hosted/API option. This replaces the incorrect “Haiku 5.5”. |
| Devstral 2 | `devstral-2512` | 123B model, 256K context. | Legacy open-weight option. Mistral deprecated it for new integrations. |
| Devstral Small 2 | `devstral-small-2512` | Dense 24B model, 256K context. | Legacy open-weight option. Mistral deprecated it for new integrations. |

## Starting combinations

Choose one item per role. Do not treat the list as a required five-model swarm.

| Role | Start with | Other verified options |
| --- | --- | --- |
| Architect | Kimi K3 or Qwen3.8-Max | GLM-5.3, Claude Sonnet 5, Claude Opus 5 |
| Worker | Qwen3-Coder-Next or DeepSeek-V4.1-Flash at `low` | Claude Haiku 4.5 |
| Code auditor | Claude Sonnet 5 or Qwen3-Coder-Next | DeepSeek-V4.1-Flash at `high` |
| Security auditor | Claude Sonnet 5 or Qwen3-Coder-Next | DeepSeek-V4.1-Flash at `high` |
| Researcher | DeepSeek-V4.1-Flash or Gemini 3.8 Flash | Claude Haiku 4.5 |

Devstral 2 and Devstral Small 2 remain useful only when an attendee already has a
working local route. They are not defaults for a new setup. A researcher still
needs an authoritative-source tool even when its model is capable.

## Evidence

- [Z.ai, GLM-5.3](https://z.ai/blog/glm-5.3)
- [Moonshot AI, Kimi K3](https://forum.moonshot.ai/t/kimi-k3-is-here-our-most-capable-model/480)
- [Moonshot AI, Kimi K3 active parameters](https://forum.moonshot.ai/t/okay-moonshot-are-we-still-coming-with-you/592)
- [Qwen Code, model authentication](https://qwenlm.github.io/qwen-code-docs/en/users/configuration/auth/)
- [Qwen3-Coder](https://github.com/QwenLM/Qwen3-Coder)
- [DeepSeek, V4.1-Flash](https://api-docs.deepseek.com/news/news260910/)
- [Google, Gemini models](https://ai.google.dev/gemini-api/docs/models)
- [Google, Gemini thinking](https://ai.google.dev/gemini-api/docs/thinking)
- [Anthropic, model deprecations and active models](https://docs.anthropic.com/en/docs/about-claude/model-deprecations)
- [Mistral, Devstral 2](https://docs.mistral.ai/models/devstral-2-25-12)
- [Mistral, Devstral Small 2](https://docs.mistral.ai/models/devstral-small-2-25-12)

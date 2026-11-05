# Agent Harness Workshop

This repository is the attendee-owned, portable harness used in **The Agent Is Not the System**
workshop. It contains working policy and guidance that travel between projects. It does not contain
Karma API facts, application code, or a claim that all coding-agent hosts behave the same way.

## Workshop outcome

Each attendee assembles this harness for OpenCode, then uses it to make and verify a small Karma API
change. The portable kernel stays canonical. The OpenCode adapter translates it for its host.

```text
portable kernel
        ↓
OpenCode adapter
        ↓
OpenCode
```

## Layout

```text
.
├── AGENTS.md
├── MODEL_ROLE_RECIPES.md
├── WORKSHOP_PROMPTS.md
├── WORKSHOP_TASKS.md
└── harness/
    ├── adapters/
    │   ├── README.md
    │   └── opencode/
    │       ├── README.md
    │       └── activate.sh
    ├── guidance/
    │   ├── evidence.md
    │   ├── python.md
    │   └── review.md
    ├── roles/
    │   └── README.md
    ├── rules/
    │   ├── anti-slop.md
    │   └── transversal.md
    └── skills/
        ├── manifest.yaml
        └── source/
            └── review-change/
                └── SKILL.md
```

## Managed skills

This workshop uses [skill-organizer](https://github.com/sergiocarracedo/skill-organizer) to keep the
reusable skill under `harness/skills/source/` and synchronize it to a local runtime tree. The workshop
profile is intentionally small. It demonstrates the mechanism without copying a personal skill
catalogue.

The workshop setup provides `skill-organizer` 1.4.1. From this repository, build the local runtime
tree with:

```bash
harness/skills/build-profile.sh
```

The builder resolves the portable relative paths required by the checked-in organizer configuration,
removes its temporary config, and verifies the generated skill and manifest. The generated
`.organized/` directory is ignored by Git. The OpenCode adapter links it into
`~/.config/opencode/skills` during an explicit, reversible activation after inspecting existing
targets.

## Attendee path

Follow [the workshop tasks](WORKSHOP_TASKS.md) in order and copy prompts from
[the prompt pack](WORKSHOP_PROMPTS.md) one at a time. They start with a factual baseline, build the
portable policy in visible layers, configure one host, and use the result to change Karma API.

[Role-model recipes](MODEL_ROLE_RECIPES.md) gives fact-checked starting points for a small role
loop. Confirm availability, access, and effort settings in the chosen host before using one.

The root `AGENTS.md` is the canonical portable policy entry point. Guidance, rules, roles, skills,
and adapters are routed from that file. A target repository's `AGENTS.md` supplies local operating
constraints. Its factual claims still require corroboration before they justify a material decision.
Do not create a second `AGENTS.md` under `harness/`.

## Current scope

The canonical router, focused guidance, transversal rules, role contracts, and managed reusable
review skill are present. `anti-slop.md` is deliberately not routed at first. Attendees activate it,
restart their agent, and compare the same response before and after the route exists. OpenCode is
the complete workshop adapter. The final exercise runs an evidence loop through the configured
roles to prove the assembled harness on a real Karma API change.

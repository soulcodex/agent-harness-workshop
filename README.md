# Agent Harness Workshop

This repository is the attendee-owned, portable harness used in **The Agent Is Not the System**
workshop. It contains working policy and guidance that travel between projects. It does not contain
Karma API facts, application code, or a claim that all coding-agent hosts behave the same way.

## Workshop outcome

Each attendee evolves the portable router for OpenCode, then uses the activated guidance to make and
verify one small Karma API change. The portable kernel stays canonical. The OpenCode adapter
translates it for its host.

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
├── ARCHITECTURE.md
├── MODEL_ROLE_RECIPES.md
├── WORKSHOP_PROMPTS.md
├── WORKSHOP_TASKS.md
└── harness/
    ├── adapters/
    │   └── opencode/
    │       ├── activate.sh
    │       └── test-in-docker.sh
    ├── guidance/
    │   ├── evidence.md
    │   ├── planning.md
    │   ├── python.md
    │   └── review.md
    ├── roles/
    │   ├── architect.md
    │   └── worker.md
    ├── router/
    │   └── AGENTS.md
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

## Setup and generated artifacts

Run `./setup.sh` to inspect attendee prerequisites without changing the host. Run
`./setup.sh --install` only to install missing `uv` and `skill-organizer` for the current user.
`./setup.sh --verify` builds the disposable skill profile and OpenCode role overlay.

The portable runtime is installed only by `harness/adapters/opencode/activate.sh`. It links the
installable router, guidance, rules, and skills into `~/.config/opencode/`.

Do not test installation against an existing OpenCode configuration while developing this repository.
Run `bash harness/adapters/opencode/test-in-docker.sh` instead. It uses a container-only home
directory and never mounts a host configuration.

## Attendee path

Follow [the workshop tasks](WORKSHOP_TASKS.md) in order and copy prompts from
[the prompt pack](WORKSHOP_PROMPTS.md) one at a time. They start with a factual baseline, add one
lazy router row at a time, compare fresh-session output, and use the activated guidance to change
Karma API.

[Role-model recipes](MODEL_ROLE_RECIPES.md) gives fact-checked starting points for a small role
loop. Confirm availability, access, and effort settings in the chosen host before using one.

Root `AGENTS.md` governs this repository and names its available commands. The installable portable
policy entry point is `harness/router/AGENTS.md`. A target repository's `AGENTS.md` supplies local
operating constraints. Its factual claims still require corroboration before they justify a material
decision.

`ARCHITECTURE.md` defines source ownership, generated artifacts, and the host-installation contract.
Change it only for an evidenced architectural decision.

## Current scope

The canonical router starts without lazy routes. The evidence, planning, anti-slop, engineering, and
review rows are added during the workshop so their effect is visible. OpenCode is the complete
workshop adapter. Pi remains a deferred adapter iteration if time permits. Role profiles and managed
skills are available as post-workshop extensions.

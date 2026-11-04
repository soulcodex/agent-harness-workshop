# Agent Harness Workshop

This repository is the attendee-owned, portable harness used in **The Agent Is Not the System**
workshop. It contains working policy and guidance that travel between projects. It does not contain
Karma API facts, application code, or a claim that all coding-agent hosts behave the same way.

## Workshop outcome

Each attendee configures this harness for one chosen host, then uses it to make and verify a small
Karma API change. The portable kernel stays canonical. Host adapters translate it for OpenCode,
Codex, or Pi.

```text
portable kernel
        ↓
thin host adapter
        ↓
OpenCode | Codex | Pi
```

## Layout

```text
.
├── AGENTS.md
└── harness/
    ├── AGENTS.md
    ├── adapters/
    │   ├── README.md
    │   └── opencode/
    │       └── README.md
    ├── guidance/
    │   ├── evidence.md
    │   ├── python.md
    │   └── review.md
    └── skills/
        ├── manifest.yaml
        └── scopes/
            └── workshop/
                ├── .skill-organizer.yml
                └── skills/
                    └── review-change/
                        └── SKILL.md
```

## Managed skills

This workshop uses [skill-organizer](https://github.com/sergiocarracedo/skill-organizer) to keep
the reusable skill in a checked-in source scope and synchronize it to a local runtime tree. The
workshop profile is intentionally small. It demonstrates the mechanism without copying a personal
skill catalogue.

The workshop setup provides `skill-organizer` 1.4.1. From this repository, build the local runtime
tree with:

```bash
harness/skills/build-profile.sh
```

The builder resolves the portable relative paths required by the checked-in organizer configuration,
removes its temporary config, and verifies the generated skill. The generated `.organized/`
directory is ignored by Git. Do not point it at `~/.agents/skills` by default. The OpenCode adapter
describes an explicit, reversible activation after inspecting any existing global profile.

## Attendee path

1. Read the portable router and the project repository's instructions.
2. Select OpenCode, Codex, or Pi.
3. Configure one thin adapter without copying project facts into the kernel.
4. Use the harness to inspect and change Karma API.
5. Run the project’s deterministic checks and review the evidence.
6. Record one improvement prompted by a rejected or incomplete change.

## Current scope

The canonical router, focused guidance, and managed reusable review skill are present. The complete
OpenCode adapter is the reference. Codex and Pi adapters are follow-on exercises that use the same
portable inputs without pretending that their host mechanisms are identical.

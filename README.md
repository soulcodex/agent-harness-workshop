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
    │   └── agents/
    │       └── README.md
    ├── agents/
    │   └── README.md
    ├── guidance/
    │   ├── evidence.md
    │   ├── python.md
    │   └── review.md
    └── skills/
        ├── manifest.yaml
        └── shared/
            └── review-change/
                └── SKILL.md
```

## Attendee path

1. Read the portable router and the project repository's instructions.
2. Select OpenCode, Codex, or Pi.
3. Configure one thin adapter without copying project facts into the kernel.
4. Use the harness to inspect and change Karma API.
5. Run the project’s deterministic checks and review the evidence.
6. Record one improvement prompted by a rejected or incomplete change.

## Current scope

The canonical router, focused guidance, and reusable review skill are present. Host adapters and
agent definitions are intentionally empty seams. The workshop builds or explains only the adapter
needed for the attendee's selected host.

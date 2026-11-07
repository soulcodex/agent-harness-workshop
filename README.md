# Agent Harness Workshop

Build a portable OpenCode policy one router row at a time, compare the result in fresh sessions, then
use it to build the supplied [Karma API contract](https://github.com/soulcodex/karma-list-api).

## Start

Clone this repository and the companion [Karma API](https://github.com/soulcodex/karma-list-api).
From this repository, inspect prerequisites, install only missing attendee-owned tools, then verify
the generated workshop artifacts:

```bash
./setup.sh
./setup.sh --install
./setup.sh --verify
```

Activate the harness in an isolated OpenCode configuration and open Karma API from the same terminal:

```bash
export XDG_CONFIG_HOME="$PWD/.harness-config"
harness/adapters/opencode/activate.sh
opencode --standalone /path/to/karma-list-api
```

This does not touch an existing OpenCode configuration. Start a fresh session and confirm it reads
the portable router.

## Workshop path

Follow [WORKSHOP_TASKS.md](WORKSHOP_TASKS.md) in order. Copy one prompt at a time from
[WORKSHOP_PROMPTS.md](WORKSHOP_PROMPTS.md), then start a fresh session after each router edit.

The core path covers evidence, planning, concise handoffs, typed boundaries, business tests,
implementation, and independent review.

## Scope

OpenCode is the complete reference adapter. Pi, role overlays, managed skills, SQLite, memory, and
architecture tests are extensions after the core exercise. See [ARCHITECTURE.md](ARCHITECTURE.md) for
source ownership and the installation contract.

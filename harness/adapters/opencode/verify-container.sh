#!/usr/bin/env bash
set -euo pipefail

export HOME=/sandbox/home
export XDG_CONFIG_HOME="${HOME}/.config"
export PATH="${HOME}/.local/bin:${PATH}"

mkdir -p "${HOME}"
./setup.sh --verify
uv run python -m unittest discover -s harness/adapters/opencode/tests -v
uv run --with ruff ruff check harness/adapters/opencode
uv run --with ruff ruff format --check harness/adapters/opencode
uv run --with rumdl rumdl check AGENTS.md ARCHITECTURE.md README.md WORKSHOP_PROMPTS.md \
  WORKSHOP_TASKS.md harness

#!/usr/bin/env bash
set -euo pipefail

scope_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/scopes/workshop" && pwd)"
source_dir="${scope_dir}/skills"
target_dir="${scope_dir}/.organized"
runtime_config="$(mktemp)"

cleanup() {
  rm -f "${runtime_config}"
}
trap cleanup EXIT

if ! command -v skill-organizer >/dev/null 2>&1; then
  echo "Error: skill-organizer 1.4.1 is required." >&2
  exit 1
fi

cat > "${runtime_config}" <<EOF
source: ${source_dir}
target: ${target_dir}
telemetry:
  enabled: false
EOF

DO_NOT_TRACK=1 skill-organizer sync --config "${runtime_config}"
test -f "${target_dir}/review-change/SKILL.md"

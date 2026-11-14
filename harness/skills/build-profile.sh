#!/usr/bin/env bash
set -euo pipefail

skills_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source_dir="${skills_dir}/source"
target_dir="${skills_dir}/.organized"
runtime_config="$(mktemp)"

cleanup() {
  rm -f "${runtime_config}"
}
trap cleanup EXIT

if ! command -v skill-organizer >/dev/null 2>&1; then
  echo "Error: skill-organizer 1.5.1 is required." >&2
  exit 1
fi

cat > "${runtime_config}" <<EOF
source: ${source_dir}
target: ${target_dir}
telemetry:
  enabled: false
EOF

DO_NOT_TRACK=1 skill-organizer sync --config "${runtime_config}"
rm -f "${target_dir}/manifest.yaml"
ln -s "../manifest.yaml" "${target_dir}/manifest.yaml"
test -f "${target_dir}/review-change/SKILL.md"
test -f "${target_dir}/manifest.yaml"

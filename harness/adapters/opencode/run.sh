#!/usr/bin/env bash
set -euo pipefail

source_path="${BASH_SOURCE[0]}"
while [[ -L "${source_path}" ]]; do
  source_directory="$(cd -P "$(dirname "${source_path}")" && pwd)"
  source_path="$(readlink "${source_path}")"
  if [[ "${source_path}" != /* ]]; then
    source_path="${source_directory}/${source_path}"
  fi
done

adapter_dir="$(cd -P "$(dirname "${source_path}")" && pwd)"
repository_dir="$(cd "${adapter_dir}/../../.." && pwd)"
config_path="${adapter_dir}/.generated/opencode.jsonc"
opencode_bin="${OPENCODE_BIN:-opencode}"

uv run --project "${repository_dir}" python "${adapter_dir}/generate_config.py" --output "${config_path}"
OPENCODE_CONFIG="${config_path}" exec "${opencode_bin}" "$@"

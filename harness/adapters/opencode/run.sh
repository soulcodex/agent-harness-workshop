#!/usr/bin/env bash
set -euo pipefail

adapter_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
config_path="${adapter_dir}/.generated/opencode.jsonc"
opencode_bin="${OPENCODE_BIN:-opencode}"

python3 "${adapter_dir}/generate_config.py" --output "${config_path}"
OPENCODE_CONFIG="${config_path}" exec "${opencode_bin}" "$@"

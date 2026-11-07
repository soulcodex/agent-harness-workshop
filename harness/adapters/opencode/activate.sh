#!/usr/bin/env bash
set -euo pipefail

adapter_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repository_dir="$(cd "${adapter_dir}/../../.." && pwd)"
router_source="${repository_dir}/harness/router/AGENTS.md"
guidance_source="${repository_dir}/harness/guidance"
rules_source="${repository_dir}/harness/rules"
skills_source="${repository_dir}/harness/skills/.organized"
config_directory="${XDG_CONFIG_HOME:-${HOME}/.config}/opencode"
router_target="${config_directory}/AGENTS.md"
guidance_target="${config_directory}/guidance"
rules_target="${config_directory}/rules"
skills_target="${config_directory}/skills"

assert_target_is_available() {
  local source="$1"
  local target="$2"

  if [[ -e "${target}" || -L "${target}" ]]; then
    if [[ "${target}" -ef "${source}" ]]; then
      return
    fi

    echo "Error: ${target} already exists and is not this harness source." >&2
    exit 1
  fi
}

link_source() {
  local source="$1"
  local target="$2"

  if [[ -e "${target}" || -L "${target}" ]]; then
    echo "Already linked: ${target}"
    return
  fi

  mkdir -p "$(dirname "${target}")"
  ln -s "${source}" "${target}"
  echo "Linked: ${target} -> ${source}"
}

"${repository_dir}/harness/skills/build-profile.sh"
uv run --project "${repository_dir}" python "${adapter_dir}/generate_config.py"
assert_target_is_available "${router_source}" "${router_target}"
assert_target_is_available "${guidance_source}" "${guidance_target}"
assert_target_is_available "${rules_source}" "${rules_target}"
assert_target_is_available "${skills_source}" "${skills_target}"
link_source "${router_source}" "${router_target}"
link_source "${guidance_source}" "${guidance_target}"
link_source "${rules_source}" "${rules_target}"
link_source "${skills_source}" "${skills_target}"

echo "OpenCode global harness activated ✅ (${config_directory})"

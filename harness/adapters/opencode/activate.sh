#!/usr/bin/env bash
set -euo pipefail

adapter_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repository_dir="$(cd "${adapter_dir}/../../.." && pwd)"
router_source="${repository_dir}/AGENTS.md"
skills_source="${repository_dir}/harness/skills/scopes/workshop/.organized"
config_home="${XDG_CONFIG_HOME:-${HOME}/.config}"
router_target="${config_home}/opencode/AGENTS.md"
skills_target="${HOME}/.agents/skills"

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
assert_target_is_available "${router_source}" "${router_target}"
assert_target_is_available "${skills_source}" "${skills_target}"
link_source "${router_source}" "${router_target}"
link_source "${skills_source}" "${skills_target}"

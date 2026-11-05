#!/usr/bin/env bash
set -euo pipefail

skill_organizer_version="1.4.1"
install_missing=false
verify=false

usage() {
  cat <<'EOF'
Usage: ./setup.sh [--install] [--verify]

Without options, report missing workshop prerequisites without changing the host.
--install installs missing uv and skill-organizer for the current user.
--verify checks prerequisites and generates the disposable workshop artifacts.
EOF
}

for argument in "$@"; do
  case "${argument}" in
    --install)
      install_missing=true
      ;;
    --verify)
      verify=true
      ;;
    --help)
      usage
      exit 0
      ;;
    *)
      usage >&2
      exit 2
      ;;
  esac
done

repository_directory="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
uv_binary="$(command -v uv || true)"
skill_organizer_binary="$(command -v skill-organizer || true)"
opencode_binary="$(command -v opencode || true)"

install_uv() {
  local installer

  if [[ -n "${uv_binary}" ]]; then
    return
  fi
  if ! command -v curl >/dev/null 2>&1; then
    echo "Missing uv and curl. Install uv, then run ./setup.sh --verify." >&2
    exit 1
  fi

  installer="$(mktemp)"
  trap 'rm -f "${installer}"' RETURN
  curl --fail --location --silent --show-error https://astral.sh/uv/install.sh --output "${installer}"
  UV_NO_MODIFY_PATH=1 sh "${installer}"
  uv_binary="${HOME}/.local/bin/uv"
  if [[ ! -x "${uv_binary}" ]]; then
    echo "The uv installer did not create ${uv_binary}." >&2
    exit 1
  fi
}

install_skill_organizer() {
  if [[ -n "${skill_organizer_binary}" ]]; then
    return
  fi
  if ! command -v npm >/dev/null 2>&1; then
    echo "Missing skill-organizer and npm. Install npm, then run ./setup.sh --install." >&2
    exit 1
  fi

  npm install --global "skill-organizer@${skill_organizer_version}"
  skill_organizer_binary="$(command -v skill-organizer || true)"
  if [[ -z "${skill_organizer_binary}" ]]; then
    echo "skill-organizer was not available after installation." >&2
    exit 1
  fi
}

report_prerequisites() {
  local missing=false

  for tool in uv skill-organizer opencode; do
    if ! command -v "${tool}" >/dev/null 2>&1; then
      echo "Missing: ${tool}"
      missing=true
    else
      echo "Available: ${tool} ($(command -v "${tool}"))"
    fi
  done

  if [[ "${missing}" == true ]]; then
    echo "Run ./setup.sh --install for uv and skill-organizer. Install OpenCode separately."
  fi
}

if [[ "${install_missing}" == true ]]; then
  install_uv
  export PATH="${HOME}/.local/bin:${PATH}"
  install_skill_organizer
fi

report_prerequisites

if [[ "${verify}" != true ]]; then
  exit 0
fi

uv_binary="$(command -v uv || true)"
skill_organizer_binary="$(command -v skill-organizer || true)"
opencode_binary="$(command -v opencode || true)"
if [[ -z "${uv_binary}" || -z "${skill_organizer_binary}" || -z "${opencode_binary}" ]]; then
  echo "Cannot verify until every workshop prerequisite is available." >&2
  exit 1
fi

if ! "${skill_organizer_binary}" --version | grep -Fq "${skill_organizer_version}"; then
  echo "skill-organizer ${skill_organizer_version} is required." >&2
  exit 1
fi

"${uv_binary}" lock --check
"${repository_directory}/harness/skills/build-profile.sh"
"${uv_binary}" run --project "${repository_directory}" python \
  "${repository_directory}/harness/adapters/opencode/generate_config.py"

echo "Workshop prerequisites and generated artifacts are ready."

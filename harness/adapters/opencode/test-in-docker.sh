#!/usr/bin/env bash
set -euo pipefail

adapter_directory="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repository_directory="$(cd "${adapter_directory}/../../.." && pwd)"
image_name="agent-harness-workshop-opencode-verification"

docker build --file "${adapter_directory}/Dockerfile" --tag "${image_name}" "${repository_directory}"
docker run --rm --network none "${image_name}"

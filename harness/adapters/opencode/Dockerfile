FROM node:22-bookworm-slim

RUN apt-get update \
    && apt-get install --yes --no-install-recommends bash ca-certificates curl git python3 \
    && rm -rf /var/lib/apt/lists/*

RUN printf '%s\n' '#!/usr/bin/env bash' 'exit 0' > /usr/local/bin/opencode \
    && chmod +x /usr/local/bin/opencode

ENV HOME=/sandbox/home
ENV PATH=/sandbox/home/.local/bin:${PATH}

WORKDIR /workspace
COPY . /workspace

RUN mkdir -p "${HOME}" \
    && chmod +x setup.sh \
    harness/skills/build-profile.sh \
    harness/adapters/opencode/activate.sh \
    harness/adapters/opencode/verify-container.sh \
    harness/adapters/opencode/test-in-docker.sh \
    && ./setup.sh --install --verify \
    && uv run --with ruff ruff --version \
    && uv run --with rumdl rumdl --version

ENTRYPOINT ["bash", "harness/adapters/opencode/verify-container.sh"]

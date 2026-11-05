from __future__ import annotations

import json
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path


ADAPTER_DIRECTORY = Path(__file__).resolve().parents[1]
GENERATOR = ADAPTER_DIRECTORY / "generate_config.py"
AGENT_NAMES = {
    "workshop-architect",
    "workshop-researcher",
    "workshop-worker",
    "workshop-auditor",
    "workshop-security-auditor",
}


class GenerateConfigTest(unittest.TestCase):
    def test_generates_the_portable_role_mapping(self) -> None:
        with tempfile.TemporaryDirectory() as temporary_directory:
            output = Path(temporary_directory) / "opencode.jsonc"
            subprocess.run(
                [sys.executable, str(GENERATOR), "--output", str(output)],
                check=True,
            )

            generated = json.loads("\n".join(output.read_text().splitlines()[1:]))

        agents = generated["agent"]
        self.assertEqual(set(agents), AGENT_NAMES)
        self.assertEqual(set(generated), {"$schema", "agent"})
        self.assertEqual(agents["workshop-architect"]["mode"], "primary")
        self.assertEqual(
            set(agents["workshop-architect"]["permission"]["task"]),
            AGENT_NAMES - {"workshop-architect"},
        )
        self.assertEqual(agents["workshop-worker"]["permission"]["edit"], "allow")
        for agent_name in AGENT_NAMES - {"workshop-worker"}:
            self.assertEqual(agents[agent_name]["permission"]["edit"], "deny")


if __name__ == "__main__":
    unittest.main()

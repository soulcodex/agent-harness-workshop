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
    "architect",
    "researcher",
    "worker",
    "auditor",
    "security-auditor",
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
        self.assertEqual(agents["architect"]["mode"], "primary")
        for agent_name in AGENT_NAMES - {"architect"}:
            self.assertEqual(agents[agent_name]["mode"], "subagent")
        self.assertEqual(
            set(agents["architect"]["permission"]["task"]),
            AGENT_NAMES - {"architect"},
        )
        self.assertEqual(agents["worker"]["permission"]["edit"], "allow")
        self.assertEqual(agents["worker"]["permission"]["question"], "deny")
        self.assertEqual(agents["worker"]["permission"]["bash"]["git push *"], "ask")
        self.assertEqual(
            agents["architect"]["permission"]["bash"]["git push *"], "deny"
        )
        self.assertEqual(agents["researcher"]["permission"]["read"], "allow")
        self.assertEqual(agents["auditor"]["permission"]["bash"]["git diff *"], "allow")
        self.assertEqual(
            agents["security-auditor"]["permission"]["bash"]["git log *"], "allow"
        )
        for agent_name in AGENT_NAMES - {"worker"}:
            self.assertEqual(agents[agent_name]["permission"]["edit"], "deny")


if __name__ == "__main__":
    unittest.main()

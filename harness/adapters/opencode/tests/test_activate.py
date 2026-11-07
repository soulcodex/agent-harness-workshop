from __future__ import annotations

import os
import subprocess
import tempfile
import unittest
from pathlib import Path

ADAPTER_DIRECTORY = Path(__file__).resolve().parents[1]
REPOSITORY_DIRECTORY = ADAPTER_DIRECTORY.parents[2]
ACTIVATION_SCRIPT = ADAPTER_DIRECTORY / "activate.sh"


class ActivateAdapterTest(unittest.TestCase):
    def test_links_portable_runtime_sources_into_opencode_config(self) -> None:
        with tempfile.TemporaryDirectory() as temporary_directory:
            temporary_path = Path(temporary_directory)
            environment = os.environ.copy()
            environment["HOME"] = str(temporary_path / "home")
            environment.pop("XDG_CONFIG_HOME", None)

            first_activation = subprocess.run(
                ["bash", str(ACTIVATION_SCRIPT)],
                check=True,
                env=environment,
                capture_output=True,
                text=True,
            )

            config_directory = temporary_path / "home" / ".config" / "opencode"
            expected_links = {
                config_directory / "AGENTS.md": REPOSITORY_DIRECTORY
                / "harness"
                / "router"
                / "AGENTS.md",
                config_directory / "guidance": REPOSITORY_DIRECTORY
                / "harness"
                / "guidance",
                config_directory / "rules": REPOSITORY_DIRECTORY / "harness" / "rules",
                config_directory / "skills": REPOSITORY_DIRECTORY
                / "harness"
                / "skills"
                / ".organized",
            }

            for target, source in expected_links.items():
                self.assertTrue(target.is_symlink())
                self.assertEqual(target.resolve(), source.resolve())

            manifest = config_directory / "skills" / "manifest.yaml"
            self.assertTrue(manifest.is_file())
            self.assertEqual(
                manifest.resolve(),
                REPOSITORY_DIRECTORY / "harness" / "skills" / "manifest.yaml",
            )

            second_activation = subprocess.run(
                ["bash", str(ACTIVATION_SCRIPT)],
                check=True,
                env=environment,
                capture_output=True,
                text=True,
            )
            self.assertIn("Linked:", first_activation.stdout)
            self.assertIn(
                "OpenCode global harness activated ✅", first_activation.stdout
            )
            self.assertEqual(second_activation.stdout.count("Already linked:"), 4)
            self.assertIn(
                "OpenCode global harness activated ✅", second_activation.stdout
            )

    def test_refuses_an_occupied_target_before_linking_any_source(self) -> None:
        with tempfile.TemporaryDirectory() as temporary_directory:
            temporary_path = Path(temporary_directory)
            environment = os.environ.copy()
            environment["HOME"] = str(temporary_path / "home")
            environment.pop("XDG_CONFIG_HOME", None)
            occupied_rules_directory = (
                temporary_path / "home" / ".config" / "opencode" / "rules"
            )
            occupied_rules_directory.mkdir(parents=True)

            activation = subprocess.run(
                ["bash", str(ACTIVATION_SCRIPT)],
                check=False,
                env=environment,
                capture_output=True,
                text=True,
            )

            config_directory = temporary_path / "home" / ".config" / "opencode"
            self.assertNotEqual(activation.returncode, 0)
            self.assertIn("already exists", activation.stderr)
            self.assertFalse((config_directory / "AGENTS.md").exists())


if __name__ == "__main__":
    unittest.main()

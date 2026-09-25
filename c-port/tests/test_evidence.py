#!/usr/bin/env python3
"""Regression tests for the static-evidence generator."""

from __future__ import annotations

import json
import sys
import unittest
from pathlib import Path


PROJECT = Path(__file__).resolve().parents[1]
SOURCE = PROJECT.parent / "og"
GENERATED = PROJECT / "evidence" / "generated"
sys.dont_write_bytecode = True
sys.path.insert(0, str(PROJECT / "tools"))

import evidence  # noqa: E402


class EvidenceTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.reports = evidence.generate(SOURCE)
        cls.tpuq = json.loads(cls.reports["tpuq.json"])
        cls.strings = json.loads(cls.reports["strings.json"])["strings"]

    def test_manifest_fixes_all_original_inputs(self) -> None:
        manifest = json.loads(self.reports["manifest.json"])
        expected = {
            "BOMBKI.EXE": (141264, "6afe6910cb6624ace1c38827e33df63fc3e55e1a69a97080a180a5e394c0f176"),
            "BOMBKI.PIF": (967, "69b4943cd65f7ebf27f6e594ffbf98611862c75371d9f4fbd2320d485cace20d"),
            "CZYTAJ.TXT": (1856, "8c0045c7a2265ed022ea5cacdceb520abb7d6c4a5e234a442ddc1b8b03bcc37e"),
            "MONSTRA.TPU": (3072, "ffc02180b11b9198e19f4b5c92f4ff8ab47872d02e99c6b53129c9f1b60c1228"),
            "PLIKI.TPU": (320, "ae54c5f306b663e5af394b2f387305b3ca957b0f194ebb46839b8b1333781313"),
            "PRZEDM.TPU": (80128, "e5a56c851cafa943dd57cb6324f3cbabc735fea83a6b2427d4e3bcebb742a0e7"),
            "SWIAT.TPU": (26000, "fa10ec7352e0a287793ec5a7919f1667984776086648bba421ffe19823d65961"),
        }
        actual = {
            item["name"]: (item["size"], item["sha256"])
            for item in manifest["artifacts"]
        }
        self.assertEqual(expected, actual)

    def test_tpuq_counts_and_source_mapping(self) -> None:
        units = {item["artifact"]: item for item in self.tpuq["units"]}
        expected = {
            "MONSTRA.TPU": (53, 2, 1, 15),
            "PRZEDM.TPU": (1575, 35, 34, 439),
            "SWIAT.TPU": (445, 13, 12, 214),
        }
        for name, (lines, entries, blocks, strings) in expected.items():
            unit = units[name]
            self.assertEqual(lines, unit["source_line_count_record"]["count"])
            self.assertEqual(entries, unit["validation"]["entry_count"])
            self.assertEqual(blocks, unit["validation"]["code_block_count"])
            self.assertEqual(strings, unit["validation"]["unique_code_string_count"])
            self.assertEqual([], unit["validation"]["procedures_without_source_ranges"])
        named = [
            procedure
            for unit in units.values()
            for procedure in unit["procedures"]
            if procedure["name"] != "<initialization>"
        ]
        self.assertEqual(47, len(named))
        self.assertTrue(all(procedure["source_ranges"] for procedure in named))

    def test_every_string_round_trips_and_points_into_its_artifact(self) -> None:
        artifact_bytes = {
            name: (SOURCE / name).read_bytes()
            for name in {item["artifact"] for item in self.strings}
        }
        self.assertEqual(1971, len(self.strings))
        for item in self.strings:
            raw = bytes.fromhex(item["raw_cp852_hex"])
            self.assertEqual(item["text_utf8"], raw.decode("cp852"))
            self.assertEqual(item["length"], len(raw))
            file_data = artifact_bytes[item["artifact"]]
            at = item["file_offset"]
            self.assertEqual(bytes([len(raw)]) + raw, file_data[at : at + len(raw) + 1])

    def test_linked_executable_cross_check(self) -> None:
        checks = self.tpuq["linked_executable_cross_check"]
        self.assertEqual(15, checks["MONSTRA.TPU"]["matching_unique_payload_count"])
        self.assertEqual(127, checks["SWIAT.TPU"]["matching_unique_payload_count"])
        self.assertEqual(404, checks["PRZEDM.TPU"]["matching_unique_payload_count"])
        self.assertEqual(7, len(checks["PRZEDM.TPU"]["tpu_payloads_not_present_in_linked_executable"]))

    def test_generated_reports_are_current(self) -> None:
        self.assertEqual([], evidence.check_outputs(GENERATED, self.reports))

    def test_all_required_inventories_exist(self) -> None:
        inventories = json.loads(self.reports["inventories.json"])
        required = {
            "commands", "rooms", "items", "enemies", "skills", "shops", "npcs",
            "quests", "state_fields",
        }
        self.assertTrue(required.issubset(inventories))
        self.assertEqual(150, len(inventories["state_fields"]["symbols"]))


if __name__ == "__main__":
    unittest.main()

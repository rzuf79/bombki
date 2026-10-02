"""Regression checks for segment-relative TP7 EXE region comparisons."""

import contextlib
import io
import json
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))

from compare_tp7_artifacts import (  # noqa: E402
    compare_exes,
    mz_image,
    region_byte_delta,
)

TEMP_ROOT = ROOT / "build" / "tmp"
TEMP_ROOT.mkdir(parents=True, exist_ok=True)


class ExeRegionTests(unittest.TestCase):
    @staticmethod
    def make_mz(relocation_count=0):
        data = bytearray(512)
        data[:2] = b"MZ"
        data[2:4] = (0).to_bytes(2, "little")
        data[4:6] = (1).to_bytes(2, "little")
        data[6:8] = relocation_count.to_bytes(2, "little")
        data[8:10] = (2).to_bytes(2, "little")
        data[0x18:0x1A] = (0x1C).to_bytes(2, "little")
        if relocation_count:
            if relocation_count != 1:
                raise ValueError("test MZ helper supports one relocation")
            data[0x1C:0x1E] = (4).to_bytes(2, "little")
            data[0x1E:0x20] = (0).to_bytes(2, "little")
        data[32:] = bytes(range(256)) + bytes(range(224))
        return data

    def test_equal_region_bytes_match_at_different_image_offsets(self):
        reference = b"prefix" + b"same region" + b"tail"
        candidate = b"candidate prefix" + b"same region" + b"other tail"
        result = region_byte_delta(reference, candidate, 6, 11, 16, 11)
        self.assertEqual(result["differing"], 0)
        self.assertIsNone(result["first_relative"])

    def test_reports_first_segment_relative_mismatch(self):
        result = region_byte_delta(b"_abcdef_", b"XXabXdef", 1, 6, 2, 6)
        self.assertEqual(result["differing"], 1)
        self.assertEqual(result["first_relative"], 2)

    def test_separates_relocation_word_bytes_from_other_byte_differences(self):
        result = region_byte_delta(
            b"abcdefgh", b"abXdefYh", 0, 8, 0, 8,
            reference_relocations=[2], candidate_relocations=[2],
        )
        self.assertEqual(result["differing"], 2)
        self.assertEqual(result["relocation_value_differences"], 1)
        self.assertEqual(result["relocation_site_differences"], 0)
        self.assertEqual(result["non_relocation_differences"], 1)

    def test_separates_relocation_site_layout_changes(self):
        result = region_byte_delta(
            b"abXdefgh", b"abcYefgh", 0, 8, 0, 8,
            reference_relocations=[2], candidate_relocations=[3],
        )
        self.assertEqual(result["differing"], 2)
        self.assertEqual(result["relocation_value_differences"], 0)
        self.assertEqual(result["relocation_site_differences"], 2)
        self.assertEqual(result["non_relocation_differences"], 0)

    def test_reports_stored_bytes_and_unpaired_region_tail(self):
        result = region_byte_delta(b"abcdefgh", b"XXabc", 0, 8, 2, 6)
        self.assertEqual(result["reference_stored"], 8)
        self.assertEqual(result["candidate_stored"], 3)
        self.assertEqual(result["differing"], 5)
        self.assertEqual(result["first_relative"], 3)

    def test_mz_image_excludes_header_and_unstored_allocation(self):
        # One 512-byte MZ page, with a 32-byte header and 480 image bytes.
        data = self.make_mz(relocation_count=1)
        with tempfile.TemporaryDirectory(dir=TEMP_ROOT) as directory:
            exe = Path(directory) / "sample.EXE"
            exe.write_bytes(data)
            metadata, image = mz_image(exe)
        self.assertEqual(metadata["header_bytes"], 32)
        self.assertEqual(metadata["image_bytes"], 480)
        self.assertEqual(metadata["relocations"], 1)
        self.assertEqual(metadata["relocation_cells"], [4])
        self.assertEqual(image, bytes(data[32:]))

    def test_region_match_does_not_turn_strict_exe_mismatch_into_success(self):
        with tempfile.TemporaryDirectory(dir=TEMP_ROOT) as directory:
            root = Path(directory)
            candidate = root / "candidate.EXE"
            reference = root / "reference.EXE"
            candidate_map = root / "candidate.MAP"
            layout = root / "reference-layout.json"
            candidate_bytes = self.make_mz(relocation_count=1)
            candidate_bytes[0x12] = 1  # header checksum differs, load image matches
            candidate.write_bytes(candidate_bytes)
            reference.write_bytes(self.make_mz(relocation_count=1))
            candidate_map.write_text(
                "  Start  Stop   Length Name               Class\n"
                "  00000H 001DFH 001E0H BOMBKI             CODE\n",
                encoding="ascii",
            )
            layout.write_text(json.dumps({
                "format": "tp7-exe-region-layout-v1",
                "regions": [{
                    "name": "BOMBKI",
                    "reference_start": "0x0",
                    "reference_size": "0x1E0",
                }],
            }), encoding="utf-8")
            output = io.StringIO()
            with contextlib.redirect_stdout(output):
                result = compare_exes(candidate, reference, True,
                                      candidate_map, layout)
        self.assertEqual(result, 1)
        self.assertIn("1 differing byte positions", output.getvalue())
        self.assertIn("BOMBKI:", output.getvalue())
        self.assertIn("relative bytes exact", output.getvalue())
        self.assertNotIn("including unpaired tails", output.getvalue())


if __name__ == "__main__":
    unittest.main()

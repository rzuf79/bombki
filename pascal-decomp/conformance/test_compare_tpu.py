"""Regression checks for TPU section alignment and procedure tail coverage."""

import struct
import tempfile
import unittest
from pathlib import Path

from compare_tpu import Tpu, code_block_deltas, relocation_block_deltas, sections

ROOT = Path(__file__).resolve().parents[2]
TEMP_ROOT = ROOT / 'build' / 'tmp'
TEMP_ROOT.mkdir(parents=True, exist_ok=True)


class TpuLayoutTests(unittest.TestCase):
    def test_all_sections_preserve_payload_padding_and_trailer(self):
        data = bytearray(80)
        sizes = (79, 3, 5, 8, 2, 8)
        for offset, size in zip((30, 32, 34, 38, 36, 40), sizes):
            struct.pack_into('<H', data, offset, size)
        data[-1] = 0xFE
        for marker, size in enumerate(sizes[1:], 1):
            data.extend(bytes([marker]) * size)
            data.extend(b'\xFE' * (-len(data) % 16))
        data.extend(b'trailer')
        result = sections(bytes(data))
        for marker, name in enumerate(
            ('browser', 'code', 'relocations', 'constants', 'constant relocations'), 1
        ):
            self.assertEqual(result[name], bytes([marker]) * sizes[marker])
        self.assertEqual(result['symbols padding'], b'\xFE')
        self.assertEqual(result['trailer'], b'trailer')
        self.assertEqual(b''.join(result.values()), data)

    def test_original_entries_and_full_code_lengths(self):
        for name, code_start in (('MONSTRA', 0x430), ('PRZEDM', 0x1C90), ('SWIAT', 0x720)):
            with self.subTest(unit=name):
                path = ROOT / 'og' / (name + '.TPU')
                unit = Tpu(str(path))
                self.assertEqual(unit.ofs_code, code_start)
                code = sections(unit.data)['code']
                base = 0
                bases = {}
                for block in unit.code_blocks:
                    bases[block.ofs] = base
                    base += block.size
                self.assertEqual(base, len(code))
                for entry in unit.entries:
                    if entry.code_block == 0xFFFF:  # absent unit initializer
                        continue
                    start = bases[entry.code_block] + entry.offset
                    self.assertEqual(code[start:start + 3], b'\x55\x89\xE5')
                self.assertEqual(code_block_deltas(path, path)[0], [])
                self.assertEqual(relocation_block_deltas(path, path), (0, len(unit.code_blocks)))

    def test_changed_runtime_target_with_identical_code_is_detected(self):
        original = ROOT / 'og/SWIAT.TPU'
        unit = Tpu(str(original))
        data = bytearray(unit.data)
        data[unit.ofs_reloc + 2] ^= 8  # change the first runtime entry reference
        with tempfile.TemporaryDirectory(dir=TEMP_ROOT) as directory:
            rebuilt = Path(directory) / 'SWIAT.TPU'
            rebuilt.write_bytes(data)
            self.assertEqual(code_block_deltas(original, rebuilt)[0], [])
            self.assertEqual(relocation_block_deltas(original, rebuilt), (1, 12))

    def test_last_procedure_byte_is_not_lost_to_padding(self):
        original = ROOT / 'og/SWIAT.TPU'
        unit = Tpu(str(original))
        data = bytearray(unit.data)
        last = unit.ofs_code + unit.h.code_size - 1
        self.assertEqual(data[last], 0xCB)  # final RETF, omitted by old parser
        data[last] ^= 1
        with tempfile.TemporaryDirectory(dir=TEMP_ROOT) as directory:
            rebuilt = Path(directory) / 'SWIAT.TPU'
            rebuilt.write_bytes(data)
            deltas, _, _, _ = code_block_deltas(original, rebuilt)
        self.assertEqual(len(deltas), 1)
        self.assertTrue(deltas[0].startswith('POKOJ100: 1,'))
        self.assertIn('post-entry 1 (1459->1459)', deltas[0])


if __name__ == '__main__':
    unittest.main()

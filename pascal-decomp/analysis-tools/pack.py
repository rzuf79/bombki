#!/usr/bin/env python3
# -*- coding: cp437 -*-
"""pack.py - assemble RECONSTRUCTED\\ skeleton package.

Reads the resolved per-unit interface dumps (analysis-results\\tpu_reports) and emits:
  RECONSTRUCTED\\MONSTRA.PAS   (unit skeleton, exports + body stubs)
  RECONSTRUCTED\\SWIAT.PAS
  RECONSTRUKCJA: PRZEDM.PAS
  RECONSTRUCTED\\BOMBKI.PAS    (main skeleton)
  ..\\RECONSTRUCTION-LOG.md     (method notes + save-file format)
"""
import os, re, struct, sys

RELDIR = os.path.dirname(os.path.abspath(__file__))
REPORTS = os.path.join(RELDIR, '..', 'analysis-results', 'tpu_reports')
OUT = os.path.join(RELDIR, '..', 'RECONSTRUCTED')
LOG = os.path.normpath(os.path.join(RELDIR, '..', 'RECONSTRUCTION-LOG.md'))
EXE = r'E:\Develop\Reverse\bombki\BOMBKI.EXE'
SAVE = r'E:\Develop\Reverse\bombki\PLIKI.TPU'

def u16(b, o): return struct.unpack_from('<H', b, o)[0]

def read_interface(name):
    p = os.path.join(REPORTS, name + '.interface.pas')
    return open(p, 'r', encoding='cp437').read() if os.path.exists(p) else None

def mz_info():
    d = open(EXE, 'rb').read()
    (magic, partpag, pagecnt, reloccnt, hdrsz, minmem, maxmem, relss, exesp,
     exeip, reltab, overlay) = struct.unpack_from('<12H', d, 0)
    imgbase = hdrsz * 16
    exesz = (pagecnt - 1) * 512 + partpag
    return (imgbase, exesz - imgbase, exeip, pagecnt, reloccnt)

def build_unit(name, iface):
    body = []
    body.append((iface.rstrip() if iface else 'unit %s;' % name) + '\n')
    body.append('implementation\n')
    body.append('  (* BODY TODO: reconstruct from BOMBKI.EXE code disassembly.\n')
    body.append('     Linked code blocks & entries are documented in\n')
    body.append('     analysis-results\\tpu_reports\\%s.*.txt and analysis-results\\exe_reports\\exe.*.txt *)' % name)
    body.append('\n')
    # list exported procs from the interface markers so the body stub has an anchor
    for m in re.finditer(r'\{ (Proc|Func) \$[0-9A-F]+\b', iface or ''):
        pass
    body.append('begin\n')
    body.append('  { unit-initialization: runs once at program start }\n')
    body.append('end.\n')
    return ''.join(body)

def build_main():
    base, size, ip, pages, relocs = mz_info()
    M = []
    M.append('program BOMBKI;')
    M.append('{ Turbo Pascal 7.0 real-mode; entrypoint code at EXE IP %04X (image-relative) }' % ip)
    M.append('uses  crt, swiat, przedm, monstra, dos, System;')
    M.append('')
    M.append('begin')
    M.append('  { TODO: main loop body from EXE disassembly }')
    M.append('')
    M.append('end.')
    return '\n'.join(M) + '\n'

def save_format_doc():
    L = []
    L.append('## Save-file format (PLIKI.TPU / PLIKI.*)')
    L.append('')
    try:
        raw = open(SAVE, 'rb').read().decode('cp1250').replace('\r\n', '\n')
    except Exception:
        raw = ''
    lines = raw.split('\n')
    L.append('- File is a plain-text save (CRLF line endings), UTF-8-safe set:')
    L.append('  passive-request items and active flags as space-separated integers,')
    L.append('  monster stats, then narrative item lines and counters.')
    L.append('')
    L.append('- Example dump of the real save (first 90 bytes, ASCII: escapes shown):')
    if raw:
        L.append('```')
        L.append(raw[:120].replace(' ', '\\x20')[:200])
        L.append('```')
    L.append('')
    L.append('- The save layout is defined by PRZEDM.PUQ variable layout:')
    L.append('  Integer stats (MIECZ?/TARCZA/SERCE...), Text-file handling via "plik: Text".')
    return '\n'.join(L)

def main():
    for u in ('MONSTRA', 'SWIAT', 'PRZEDM'):
        iface = read_interface(u)
        if not iface:
            print('skip %s' % u)
            continue
        with open(os.path.join(OUT, u + '.PAS'), 'w', encoding='cp437') as f:
            f.write(build_unit(u, iface))
        print('wrote %s' % os.path.join(OUT, u + '.PAS'))
    with open(os.path.join(OUT, 'BOMBKI.PAS'), 'w', encoding='cp437') as f:
        f.write(build_main())
    print('wrote %s' % os.path.join(OUT, 'BOMBKI.PAS'))
    with open(LOG, 'w', encoding='cp437') as f:
        f.write(save_format_doc() + '\n')
    print('wrote %s' % LOG)

if __name__ == '__main__':
    main()

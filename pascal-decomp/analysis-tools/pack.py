#!/usr/bin/env python3
# -*- coding: cp437 -*-
"""pack.py - assemble reconstructed\\ skeleton package.

Reads the resolved per-unit interface dumps (analysis-results\\tpu_reports) and emits:
  reconstructed\\MONSTRA.PAS   (unit skeleton, exports + body stubs)
  reconstructed\\SWIAT.PAS
  reconstructed\\PRZEDM.PAS
  reconstructed\\BOMBKI.PAS    (main skeleton)

RECONSTRUCTION-LOG.md is hand-maintained and must never be regenerated here.
"""
import os, re, struct, sys

RELDIR = os.path.dirname(os.path.abspath(__file__))
REPORTS = os.path.join(RELDIR, '..', 'analysis-results', 'tpu_reports')
OUT = os.path.join(RELDIR, '..', 'reconstructed')
EXE = r'E:\Develop\Reverse\bombki\BOMBKI.EXE'

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

if __name__ == '__main__':
    main()

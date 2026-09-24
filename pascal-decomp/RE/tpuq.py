#!/usr/bin/env python3
# -*- coding: cp437 -*-
"""TPUQ (Turbo Pascal 7.0) unit file dumper - Python port of Milan Dadok's INTRFC70.

Usage: python tpuq.py <file.tpu> [outdir]
Writes per-unit reports into outdir (default: RE\\tpu_reports).
"""
import struct, sys, os

def u8(b,o): return b[o]
def u16(b,o): return struct.unpack_from('<H',b,o)[0]
def u32(b,o): return struct.unpack_from('<I',b,o)[0]
def i32(b,o): return struct.unpack_from('<i',b,o)[0]

def pstr(b,o):
    n=b[o]
    return (b[o+1:o+1+n].decode('cp437','replace'), o+1+n)

class O: pass

def extended80(b):
    lo=struct.unpack_from('<Q',b,0)[0]
    hi=u16(b,8)
    sign=(hi>>15)&1; exp=hi&0x7FFF
    if exp==0 and lo==0: return 0.0
    if exp==0x7FFF:
        return float('inf') if sign==0 else float('-inf')
    v=lo*2.0**(exp-16383-63)
    return -v if sign else v

def tp_real6(b):
    sign=(b[0]>>7)&1
    exp=b[1]-129
    mant=struct.unpack_from('<I',b,2)[0]
    v=mant*2.0**(exp-31)
    return -v if sign else v

# kind ids (BP7)
CONST_ID=0x4F; TYPE_ID=0x50; VAR_ID=0x51; PROC_ID=0x52; UNIT_ID=0x53
SYS_PROC=0x56; SYS_FN=0x57; SYS_NEW=0x58; SYS_PORT=0x59; SYS_MEM=0x5A; SYS_OPENSTR=0x5B
KNOWN={VAR_ID,UNIT_ID,CONST_ID,TYPE_ID,PROC_ID,SYS_PROC,SYS_FN,SYS_MEM,SYS_PORT,SYS_NEW,SYS_OPENSTR}

F_CONST=1; F_LOCAL=2; F_REF=4; F_FIELD=8; F_ABS=16; F_ARG=32; F_CONST_ARG=64; F_V128=128
C_FAR=1; C_INLINE=2; C_INT=4; C_EXT=8; C_METHOD=16; C_CONSTRUCT=32; C_DESTRUCT=64; C_ASM=128
O_EXP=1; O_WIN=2; O_DYN=4; O_NOT_FROM_DLL=8
E_EXP=1; E_FROM_DLL=2; E_BY_NAME=4

T_NAMES={1:'untyped',2:'shortint',4:'integer',6:'longint',8:'byte',0x0A:'word',
         0x0E:'single',0x0F:'double',0x10:'extended',0x11:'real',0x12:'boolean',
         0x13:'char',0x15:'comp',0x18:'text',0x19:'file',0x1A:'pointer',
         0x1B:'string',0x21:'wordbool',0x22:'longbool',0x23:'pchar'}
TTYPE_TEXTS={1:'Array',2:'Record',3:'Object',4:'File',5:'built-in text',
             6:'proc/func',7:'set',8:'pointer',9:'string',10:'8087',
             11:'6-byte real',12:'range',13:'bool range',14:'char range',15:'enum/range'}

class Tpu:
    def __init__(self, path):
        self.path=path
        self.data=open(path,'rb').read()
        self.b=self.data
        self.W=self._w
        self.lines=[]; self.indent=0; self.last_kind=0xB0
        self.NowEnum=None; self.in_function=False
        self.flushed=0
        self.load_header()
        if self.h.file_id!=b'TPUQ':
            raise SystemExit('Not a TPUQ file: '+path)
        self.load()

    # ---------- low-level loaders ----------
    def load_header(self):
        h=O(); b=self.b
        h.file_id=b[0:4]; h.i4=u16(b,4); h.i6=u16(b,6)
        h.ofs_this_unit=u16(b,8); h.ofs_hashtable=u16(b,10)
        h.ofs_entry_pts=u16(b,12); h.ofs_code_blocks=u16(b,14)
        h.ofs_const_blocks=u16(b,16); h.ofs_var_blocks=u16(b,18)
        h.ofs_dll_list=u16(b,20); h.ofs_unit_list=u16(b,22)
        h.ofs_src_name=u16(b,24); h.ofs_line_count=u16(b,26)
        h.ofs_line_lengths=u16(b,28); h.sym_size=u16(b,30)
        h.browser_size=u16(b,32); h.code_size=u16(b,34)
        h.const_size=u16(b,36); h.reloc_size=u16(b,38)
        h.const_reloc_size=u16(b,40); h.var_size=u16(b,42)
        h.ofs_full_hash=u16(b,44); h.flags=u16(b,46)
        h.object_type_list=u16(b,48); h.br_defs_end=u16(b,50)
        h.br_symbol_refxx1=u16(b,52); h.next_tpu=u32(b,54)
        h.browser_ptr=(u16(b,58),u16(b,60)); h.code_ptr=(u16(b,62),u16(b,64))
        h.const_ptr=(u16(b,66),u16(b,68)); h.reloc_ptr=(u16(b,70),u16(b,72))
        h.const_reloc_ptr=(u16(b,74),u16(b,76))
        self.h=h
        self.unit_self_name,_=pstr(b,h.ofs_this_unit+3)
        self.own_record=h.ofs_this_unit+4+len(self.unit_self_name.encode('cp437'))
        self.ofs_code=h.sym_size
        self.ofs_reloc=self.ofs_code+h.code_size
        self.ofs_const=self.ofs_reloc+h.reloc_size
        self.ofs_const_reloc=self.ofs_const+h.const_size
        self.layout_total=(h.sym_size+h.browser_size+h.code_size+h.reloc_size+
                           h.const_size+h.const_reloc_size)

    def hash_objs(self, hash_ofs):
        b=self.b
        byte_len=u16(b,hash_ofs)
        n=byte_len//2+1
        offs=[]
        for i in range(n):
            t=u16(b,hash_ofs+2+i*2)
            while t!=0:
                offs.append(t); t=u16(b,t)
        return sorted(offs)

    def obj_info_ofs(self, obj_ofs):
        name,ne=pstr(self.b,obj_ofs+3)
        return (obj_ofs+4+len(name.encode('cp437')), name)

    def load(self):
        h=self.h; b=self.b
        self.objs=[]
        for ofs in self.hash_objs(h.ofs_hashtable):
            iof,name=self.obj_info_ofs(ofs)
            self.objs.append(self.parse_obj(ofs,name,iof))
        self.type_names={}; self.type_defs={}; self.vars={}; self.consts={}; self.procs={}
        self.unit_rec_names={}; self.uses=[]
        uofs=h.ofs_this_unit
        while uofs!=0:
            urs,name=self.obj_info_ofs(uofs)
            self.unit_rec_names[urs]=name
            if uofs!=h.ofs_this_unit:
                self.uses.append((uofs,name,urs,u16(b,urs+0),u16(b,urs+2)))
            else:
                self.own_unit_rec=urs
            uofs=u16(b,urs+6)
        for o in self.objs:
            self.parse_obj_record(o)
        self.entries=self.parse_entries()
        self.code_blocks=self.parse_blocks(h.ofs_code_blocks,h.ofs_const_blocks)
        self.const_blocks=self.parse_blocks(h.ofs_const_blocks,h.ofs_var_blocks)
        self.var_blocks=self.parse_blocks(h.ofs_var_blocks,h.ofs_dll_list)
        self.dll_blocks=self.parse_named(h.ofs_dll_list,h.ofs_unit_list)
        self.unit_blocks=self.parse_unit_blocks(h.ofs_unit_list,h.ofs_src_name)
        self.src_files=self.parse_src_files()
        self.relocs=self.parse_relocs(self.ofs_reloc,h.reloc_size)
        self.const_relocs=self.parse_relocs(self.ofs_const_reloc,h.const_reloc_size)

    def parse_obj(self,ofs,name,info_ofs):
        o=O(); o.obj_ofs=ofs; o.name=name; o.raw_type=self.b[ofs+2]
        o.private=(o.raw_type&0x80)!=0; o.obj_type=o.raw_type&0x7F
        o.info_ofs=info_ofs; return o

    def parse_obj_record(self,o):
        b=self.b; iof=o.info_ofs; t=o.obj_type
        if t==UNIT_ID:
            o.target=u16(b,iof); o.checksum=u16(b,iof+2); o.prev=u16(b,iof+4)
            o.next=u16(b,iof+6); o.in_interface=b[iof+8]
        elif t==TYPE_ID:
            o.type_def_ofs=u16(b,iof); o.type_unit=u16(b,iof+2)
            self.type_defs[o.type_def_ofs]=self.parse_type_def(o.type_def_ofs)
            if o.type_unit==self.own_record:
                self.type_names[(o.type_unit,o.type_def_ofs)]=o.name
        elif t==VAR_ID:
            o.flags=b[iof]; o.offset=u16(b,iof+1); o.in_unit=u16(b,iof+3)
            o.next_field=u16(b,iof+5); o.type_def_ofs=u16(b,iof+7); o.type_unit=u16(b,iof+9)
            self.vars[o.obj_ofs]=o
        elif t==CONST_ID:
            o.type_def_ofs=u16(b,iof); o.type_unit=u16(b,iof+2); o.val_ofs=iof+4
            self.consts[o.obj_ofs]=o
        elif t==PROC_ID:
            o.code_type=b[iof]; o.obj_type2=b[iof+1]
            o.entry_ofs=u16(b,iof+2); o.parent_ofs=u16(b,iof+4); o.local_hash=u16(b,iof+6)
            o.vmt_entry=u16(b,iof+8); o.w4=u16(b,iof+10); o.w5=u16(b,iof+12)
            o.w6=u16(b,iof+14); o.next_method=u16(b,iof+16)
            o.ret_def=u16(b,iof+18); o.ret_unit=u16(b,iof+20); o.num_args=u16(b,iof+22)
            o.args=(iof+24,o.num_args)
            self.procs[o.obj_ofs]=o
        elif t in (SYS_PROC,SYS_FN):
            o.addr_ofs=b[iof]; o.sflags=b[iof+1]
        elif t==SYS_PORT:
            o.bb=b[iof]
        elif t==SYS_MEM:
            o.type_def_ofs=u16(b,iof); o.type_unit=u16(b,iof+2)

    def parse_type_def(self,dof):
        b=self.b; td=O(); td.ofs=dof
        td.type_type=b[dof]; td.other_byte=b[dof+1]; td.size=u16(b,dof+2)
        td.owner=u16(b,dof+4); td.base_type=u16(b,dof+6)
        tt=td.type_type
        if tt==1:
            o=dof+8; td.element_ofs=u16(b,o); td.element_unit=u16(b,o+2)
            td.index_ofs=u16(b,o+4); td.index_unit=u16(b,o+6); td.end=dof+16
        elif tt in (2,3):
            o=dof+8; td.hash_ofs=u16(b,o); td.first_ofs=u16(b,o+2)
            td.parent_ofs=u16(b,o+4); td.parent_unit=u16(b,o+6); td.vmt_size=u16(b,o+8)
            td.handle=u16(b,o+10); td.w10=u16(b,o+12); td.self_type_ofs=u16(b,o+14)
            td.prev_obj_def=u16(b,o+16); td.end=dof+26
        elif tt==4:
            o=dof+8; td.base_ofs=u16(b,o); td.base_unit=u16(b,o+2); td.end=dof+12
        elif tt==6:
            o=dof+8; td.return_ofs=u16(b,o); td.return_unit=u16(b,o+2)
            td.num_args=u16(b,o+4); td.args=o+6; td.end=dof+14+5*td.num_args
        elif tt==7:
            o=dof+8; td.base_ofs=u16(b,o); td.base_unit=u16(b,o+2); td.end=dof+12
        elif tt==8:
            o=dof+8; td.target_ofs=u16(b,o); td.target_unit=u16(b,o+2); td.end=dof+12
        elif tt==9:
            td.end=dof+8
        elif tt in (12,13,14,15):
            o=dof+8; td.lower=i32(b,o); td.upper=i32(b,o+4)
            td.type_ofs=u16(b,o+8); td.type_unit=u16(b,o+10); td.end=dof+20
        else:
            td.end=dof+8
        return td

    def parse_entries(self):
        h=self.h; b=self.b; out=[]; ofs=0
        while h.ofs_entry_pts+ofs<h.ofs_code_blocks:
            e=O(); e.ofs=ofs
            e.w1=u16(b,h.ofs_entry_pts+ofs)
            e.flags=b[h.ofs_entry_pts+ofs+2]; e.b1=b[h.ofs_entry_pts+ofs+3]
            e.code_block=u16(b,h.ofs_entry_pts+ofs+4); e.offset=u16(b,h.ofs_entry_pts+ofs+6)
            out.append(e); ofs+=8
        return out

    def parse_blocks(self,start,end):
        b=self.b; out=[]; ofs=0
        while start+ofs<end:
            bl=O(); bl.ofs=ofs; bl.w1=u16(b,start+ofs)
            bl.size=u16(b,start+ofs+2); bl.relocbytes=u16(b,start+ofs+4)
            bl.owner=u16(b,start+ofs+6); out.append(bl); ofs+=8
        return out

    def parse_named(self,start,end):
        b=self.b; out=[]; ofs=0
        while start+ofs<end:
            w1=u16(b,start+ofs); w2=u16(b,start+ofs+2)
            name,ne=pstr(b,start+ofs+4)
            out.append((ofs,w1,w2,name)); ofs+=4+1+len(name.encode('cp437'))
        return out

    def parse_unit_blocks(self,start,end):
        b=self.b; out=[]; ofs=0
        while start+ofs<end:
            w1=u16(b,start+ofs); ref=u16(b,start+ofs+2)
            name,ne=pstr(b,start+ofs+4)
            out.append((ofs,w1,ref,name)); ofs+=4+1+len(name.encode('cp437'))
        return out

    def parse_src_files(self):
        h=self.h; b=self.b; out=[]; ofs=h.ofs_src_name
        while ofs<h.ofs_line_count:
            ft=b[ofs]; w1=u16(b,ofs+1); date=u32(b,ofs+3)
            name,ne=pstr(b,ofs+7)
            out.append((ofs,ft,w1,date,name)); ofs+=8+len(name.encode('cp437'))
        return out

    def parse_relocs(self,base,size):
        b=self.data; out=[]; ofs=0
        while ofs<size and base+ofs+8<=len(b):
            out.append((b[base+ofs],b[base+ofs+1],u16(b,base+ofs+2),
                        u16(b,base+ofs+4),u16(b,base+ofs+6)))
            ofs+=8
        return out

    # ---------- name resolution ----------
    def type_str(self, type_unit, type_def_ofs):
        """Return type name string if resolvable in this unit, else placeholder."""
        if type_unit==0: return '?'
        key=(type_unit,type_def_ofs)
        if key in self.type_names: return self.type_names[key]
        nm=self.unit_rec_names.get(type_unit)
        if nm:
            fam=self.foreign_type_map(nm)
            if type_def_ofs in fam: return fam[type_def_ofs]
            return '%s.ofs%04X'%(nm,type_def_ofs) if not fam else '%s.ofs%04X'%(nm,type_def_ofs)
        return 'T%04X'%type_def_ofs

    _foreign_maps_cache={}
    def foreign_type_map(self, name):
        key=name.upper()
        if key in self._foreign_maps_cache:
            return self._foreign_maps_cache[key]
        import os as _os
        cands=[_os.path.join('tpl_units',name+'.TPU'),
               _os.path.join('..','tpl_units',name+'.TPU'),
               _os.path.join(_os.path.dirname(_os.path.abspath(self.path or '.')),name+'.TPU')]
        m={}
        for f in cands:
            if _os.path.exists(f):
                try:
                    t=Tpu(f)
                    t.load()
                    m={(r,tdef):n for (r,tdef),n in t.type_names.items()}
                    m={tdef:n for (_,tdef),n in t.type_names.items()}
                    break
                except Exception as e:
                    print('  (foreign type map %s failed: %s)'%(name,e))
        if key=='SYSTEM':  # builtin, unnamed in System's hash table
            m.setdefault(0xBA,'string')
            m.setdefault(0x00BA,'string')
        self._foreign_maps_cache[key]=m
        return m

    def proc_entry_map(self):
        """entry_ofs (byte offset in entry region) -> full proc name, incl. locals."""
        self.proc_names={}
        def walk(hashofs, prefix):
            for xofs in self.hash_objs(hashofs):
                iof,name=self.obj_info_ofs(xofs)
                t=self.b[xofs+2]&0x7F
                if t==PROC_ID:
                    eofs=u16(self.b,iof+2)
                    full=prefix+name
                    if eofs not in self.proc_names:
                        self.proc_names[eofs]=full
                    lh=u16(self.b,iof+6)
                    if lh:
                        walk(lh, full+'.')
                elif t==TYPE_ID:
                    dd=u16(self.b,iof)
                    if dd:
                        td=self.type_defs.get(dd)
                        if td is not None and td.type_type==3 and td.hash_ofs:
                            walk(td.hash_ofs, prefix+name+'.')
        walk(self.h.ofs_hashtable,'')
        return self.proc_names

    def find_type_obj(self, type_def_ofs):
        for o in self.objs:
            if o.obj_type==TYPE_ID and o.type_def_ofs==type_def_ofs and o.type_unit==self.own_record:
                return o
        return None

    def type_def_to_str(self, td, depth=0):
        """Format a type_def record (own unit) as Pascal text."""
        if td is None: return '?'
        tt=td.type_type
        bt=td.base_type
        if bt in T_NAMES:
            return T_NAMES[bt]
        if bt!=0: return 'BT%02X'%bt
        if tt in (0,5,9,10,11,13,14):
            if tt==0: return 'untyped'
            if tt==5: return 'text'
            if tt==9: return 'string[%d]'%(td.size-1)
            return TTYPE_TEXTS.get(tt,str(tt))
        # resolve base type name for 12/13/14 range
        if tt in (12,13,14):
            return '%s..%s'%(self.const_text(td,td.lower),self.const_text(td,td.upper))
        if tt==15:
            # enum or subrange
            if td.type_unit==self.own_record and td.type_ofs==td.ofs:
                # first definition: enum
                parts=[]
                for v in range(td.lower,td.upper+1):
                    parts.append(self.enum_const_name(td,v))
                return '('+','.join(parts)+')'
            else:
                # subrange of another enum
                base=self.type_defs.get(td.type_ofs)
                n1=self.enum_const_name(base,td.lower) if base else '?'
                n2=self.enum_const_name(base,td.upper) if base else '?'
                return '%s..%s'%(n1,n2)
        if tt==1:
            return 'array[%s] of %s'%(self.type_str(td.index_unit,td.index_ofs),
                                      self.type_str(td.element_unit,td.element_ofs))
        if tt==7:
            return 'set of %s'%self.type_str(td.base_unit,td.base_ofs)
        if tt==8:
            return '^%s'%self.type_str(td.target_unit,td.target_ofs)
        return TTYPE_TEXTS.get(tt,str(tt))

    def enum_const_name(self, td, val):
        if td is None or td.type_type!=15: return '?'
        obj_ofs=td.ofs+32
        for i in range(val):
            name,ne=pstr(self.b,obj_ofs+3)
            obj_ofs+=4+len(name.encode('cp437'))
        name,ne=pstr(self.b,obj_ofs+3)
        return name

    def const_text(self, td, rawlong):
        tt=td.type_type if td else 0
        if tt in (14,):  # char
            return '#'+str(rawlong)
        if tt==13:
            return 'true' if rawlong!=0 else 'false'
        return str(rawlong)

    def const_value_str(self, o):
        """Format stored value of const object from its type."""
        b=self.data
        td=self.type_defs.get(o.type_def_ofs)
        if td is None: return 'raw@%04X'%o.val_ofs
        tt=td.type_type
        if tt==9:  # string
            s,ne=pstr(b,o.val_ofs)
            out=repr(s)
            return out
        if tt==15:
            # enum const: value stored as... depends; INTRFC70 uses longint
            self.NowEnum=td
            return str(i32(b,o.val_ofs))
        if tt==12:
            return str(i32(b,o.val_ofs))
        if tt==13:
            return 'true' if b[o.val_ofs]!=0 else 'false'
        if tt==14:
            v=b[o.val_ofs]
            if v<32 or v>0xFE: return '#'+str(v)
            return chr(v) if 32<=v<127 else '#%d'%v
        if tt==10:
            return str(extended80(b[o.val_ofs:o.val_ofs+10]))
        if tt==8:
            return 'ptr($%04X,$%04X)'%(u16(b,o.val_ofs+2),u16(b,o.val_ofs))
        if tt==7:
            return 'set@%04X'%o.val_ofs
        if tt==11:
            return str(tp_real6(b[o.val_ofs:o.val_ofs+6]))
        return 'raw@%04X'%o.val_ofs

    # ---------- text emission ----------
    def _w(self,s=''):
        self.lines.append(' '*self.indent+s)

    def indent_inc(self): self.indent+=2
    def indent_dec(self): self.indent-=2

    def emit(self,path):
        self.path_report=path
        self.W('unit %s;'%self.unit_self_name)
        self.W('{ checksum = $%04X }'%self.find_own_checksum())
        self.W('interface')
        self.W('')
        if self.uses:
            parts=self.splitline('uses', [u[1] for u in self.uses])
            for p in parts: self.W(p)
            self.W('')
        self.last_kind=0xB0
        for o in sorted(self.objs, key=lambda x:x.obj_ofs):
            self.print_obj(o)
        self.write_out(path)

    def splitline(self, kw, names):
        parts=[]; buf='%s'%kw; col=len(buf)
        for nm in names:
            add=', %s'%nm if buf!=kw else '  %s'%nm
            if col+len(add)>64 and buf!=kw:
                parts.append(buf+',')
                buf='  %s'%nm; col=2+len(nm)
            else:
                buf+=add; col+=len(add)
        return parts+[buf+';']

    def find_own_checksum(self):
        for o in self.objs:
            if o.obj_ofs==self.h.ofs_this_unit:
                return o.checksum
        return 0

    def print_obj(self,o):
        t=o.obj_type
        if o.private:
            if self.last_kind!=0x34:
                self.W('private')
                self.last_kind=0x34
        if t not in KNOWN:
            return
        if self.NowEnum is not None and t!=CONST_ID:
            if self.last_kind==CONST_ID:
                self.W('*)')
            self.NowEnum=None
        if t==CONST_ID:
            self.write_const_info(o)
        elif t==TYPE_ID:
            self.write_type_info(o)
        elif t==VAR_ID:
            self.write_var_info(o)
        elif t==PROC_ID:
            self.write_proc_info(o)
        elif t in (SYS_PROC,SYS_FN):
            self.write_system_type(o)
        elif t==SYS_PORT:
            self.write_general('type {port array}')
            self.W('  %s:%s;'%(o.name,'Byte' if o.bb==0 else 'Word'))
        elif t==SYS_MEM:
            self.write_general('type {memory array}')
            td=self.type_defs.get(o.type_def_ofs)
            self.W('  %s:%s;'%(o.name,self.type_def_to_str(td)))
        elif t==SYS_NEW:
            self.write_general('system allocator',o.name+';')
        elif t==SYS_OPENSTR:
            self.write_general('system open string type',o.name+';')
        elif t==UNIT_ID:
            pass

    def write_general(self,title,name=None,suffix=''):
        if self.last_kind not in (0xB0,):
            pass
        if name is not None:
            self.W(title+' '+name+suffix)

    def write_type_info(self,o):
        td=self.type_defs.get(o.type_def_ofs)
        if self.last_kind!=TYPE_ID:
            self.W('type')
            self.last_kind=TYPE_ID
        self.W('  %s = %s;'%(o.name,self.type_def_to_str(td)))
        if td is not None and (td.type_type in (15,) ) and (td.type_unit==self.own_record and td.type_ofs==td.ofs):
            self.NowEnum=td
            self.last_kind=CONST_ID

    def write_var_info(self,o):
        fl=o.flags
        self.last_kind=VAR_ID
        self.W('  %s: %s;'%(o.name,self.type_str(o.type_unit,o.type_def_ofs)))

    def write_proc_info(self,o):
        self.last_kind=PROC_ID
        cf=o.code_type; of=o.obj_type2
        kw='function' if not(o.ret_def==0 and o.ret_unit==0) else 'procedure'
        hdr='  %s %s'%(kw,o.name)
        # args
        if o.num_args>0:
            an=0; abse=o.args[0]+5*o.num_args
            arg=[]
            for i in range(o.num_args):
                aofs=o.args[0]+5*i
                fl=u16(self.b,aofs+4)
                pre='      '
                if fl&F_REF: pre='var   '
                elif fl&F_CONST_ARG: pre='const '
                arg.append('%sarg%d: %s'%(pre,i+1,self.type_str(u16(self.b,aofs+2),u16(self.b,aofs))))
            hdr+='('+'; '.join(arg)+')'
        if kw=='function':
            hdr+=': %s'%self.type_str(o.ret_unit,o.ret_def)
        hdr+=';'
        self.W(hdr)
        extra=[]
        if o.vmt_entry>0:
            extra.append('virtual %d'%o.vmt_entry if (of&O_DYN) else 'virtual')
        if cf&C_EXT: extra.append('external')
        if cf&C_ASM: extra.append('assembler')
        if cf&C_INT: extra.append('interrupt')
        if cf&C_CONSTRUCT: extra.insert(0,'constructor')
        if cf&C_DESTRUCT: extra.insert(0,'destructor')
        if o.entry_ofs:
            idx=o.entry_ofs//8
            ep=self.entries[idx] if (idx<len(self.entries) and o.entry_ofs%8==0) else None
            blk=ep.code_block if ep else '?'
            ofs2=ep.offset if ep else 0
            note='  { Proc $%04X Entry %s:%04X }'%(o.entry_ofs,'%s'%blk,ofs2)
            if o.vmt_entry>0 and not(of&O_DYN) and False:
                pass
            if extra:
                self.W('  '+' '.join(extra)+';')
            self.W(note)
        elif extra:
            self.W('  '+' '.join(extra)+';')

    def write_system_type(self,o):
        kw='procedure' if o.obj_type==SYS_PROC else 'function'
        self.W('  %s %s { special index $%02X }'%(kw,o.name,o.addr_ofs))

    def write_const_info(self,o):
        if self.NowEnum is None:
            if self.last_kind!=CONST_ID:
                self.W('const')
                self.last_kind=CONST_ID
        elif self.last_kind!=CONST_ID:
            self.W('(* ')
            self.W('const')
        self.W('  %s = %s;'%(o.name,self.const_value_str(o)))

    def write_out(self,path):
        with open(path,'w',newline='\n') as f:
            f.write('\n'.join(self.lines)+'\n')

    # ---------- reports ----------
    def header_report(self):
        h=self.h
        L=['Header report for %s'%self.path]
        L.append('file_id    : %s'%h.file_id.decode('cp437'))
        L.append('i4=%04X i6=%04X'%(h.i4,h.i6))
        L.append('ofs_this_unit=%04X  unit name=%s  own_record=%04X'%(h.ofs_this_unit,self.unit_self_name,self.own_record))
        L.append('ofs_hashtable=%04X full_hash=%04X'%(h.ofs_hashtable,h.ofs_full_hash))
        L.append('ofs_entry_pts=%04X ofs_code_blocks=%04X ofs_const_blocks=%04X ofs_var_blocks=%04X'%(h.ofs_entry_pts,h.ofs_code_blocks,h.ofs_const_blocks,h.ofs_var_blocks))
        L.append('ofs_dll_list=%04X ofs_unit_list=%04X ofs_src_name=%04X ofs_line_count=%04X ofs_line_lengths=%04X'%(h.ofs_dll_list,h.ofs_unit_list,h.ofs_src_name,h.ofs_line_count,h.ofs_line_lengths))
        L.append('sym_size=%d (0x%X) browser_size=%d code_size=%d const_size=%d reloc_size=%d const_reloc_size=%d var_size=%d'%(h.sym_size,h.sym_size,h.browser_size,h.code_size,h.const_size,h.reloc_size,h.const_reloc_size,h.var_size))
        L.append('flags=%04X object_type_list=%04X br_defs_end=%04X'%(h.flags,h.object_type_list,h.br_defs_end))
        L.append('file size=%d layout(sym+browser+code+reloc+const+constreloc)=%d'%(len(self.data),self.layout_total))
        L.append('code at file offset %d, reloc at %d, const at %d, const_reloc at %d'%(self.ofs_code,self.ofs_reloc,self.ofs_const,self.ofs_const_reloc))
        return '\n'.join(L)

    def unit_report(self):
        L=['Unit list (offset  refcount  name)']
        for (ofs,w1,ref,name) in self.unit_blocks:
            L.append('  %04X  ref=%d  %s'%(ofs,ref,name))
        L.append('')
        L.append('Uses chain (unit_ptr records):')
        L.append('  unit record=%04X target=%d checksum=%04X name=%s'%(self.own_unit_rec,0,self.find_own_checksum(),self.unit_self_name))
        for (uofs,name,urs,target,cks) in self.uses:
            L.append('  unit record=%04X target=%d checksum=%04X name=%s'%(urs,target,cks,name))
        return '\n'.join(L)

    def entry_report(self):
        pn=self.proc_entry_map()
        L=['Entry records (ofs  code_block:offset  exported  proc)']
        for e in self.entries:
            blk='%s'%e.code_block
            L.append('  %04X  %-6s:%04X  exp=%d  %s'%(e.ofs,blk,e.offset,1 if (e.flags&E_EXP) else 0,pn.get(e.ofs,'')))
        L.append('')
        L.append('Proc entry mapping (entry_ofs -> name):')
        for k in sorted(pn):
            L.append('  %04X  %s'%(k,pn[k]))
        return '\n'.join(L)

    def block_report(self,name,blocks,ofs_start):
        L=['%s blocks (ofs  size  relocrecs  owner)'%name]
        for bl in blocks:
            L.append('  %04X  %04X  %04X  %04X'%(bl.ofs,bl.size,bl.relocbytes,bl.owner))
        return '\n'.join(L)

    def symbols_csv(self):
        import csv, io
        buf=io.StringIO(newline='')
        w=csv.writer(buf)
        w.writerow(['ofs','kind','name','private','info1','info2','info3','info4','flags'])
        for o in sorted(self.objs,key=lambda x:x.obj_ofs):
            row=[o.obj_ofs,hex(o.raw_type),o.name,o.private]
            if o.obj_type==VAR_ID:
                row+=['var','block=%04X'%o.in_unit,'offset=%04X'%o.offset,'type=%s'%self.type_str(o.type_unit,o.type_def_ofs),'flags=%02X'%o.flags]
            elif o.obj_type==CONST_ID:
                row+=['const','type=%s'%self.type_str(o.type_unit,o.type_def_ofs),'valofs=%04X'%o.val_ofs,self.const_value_str(o),'']
            elif o.obj_type==PROC_ID:
                row+=['proc','entryofs=%04X'%o.entry_ofs,'vmt=%d'%o.vmt_entry,'ret=%s'%self.type_str(o.ret_unit,o.ret_def),'code_type=%02X obj=%02X'%(o.code_type,o.obj_type2)]
            elif o.obj_type==TYPE_ID:
                td=self.type_defs.get(o.type_def_ofs)
                row+=['type','defofs=%04X'%o.type_def_ofs,'unit=%04X'%o.type_unit,self.type_def_to_str(td),'']
            else:
                row+=['sys','','','','']
            w.writerow(row)
        return buf.getvalue()

    def reloc_report(self,kind,relocs,blocks):
        L=['%s relocation records:'%kind]
        if not blocks:
            L.append('  (none)')
            return '\n'.join(L)
        bi=0; base=0
        for bl in blocks:
            L.append('--- block %04X ---'%bl.ofs)
            recs=relocs[base:base+bl.relocbytes]
            for (unit_num,rtype,rblock,roffset,offset) in recs:
                if rtype==0xFF and unit_num==0xFF:
                    L.append('  %04X:%04X Coproc fixup type=%d roffset=%d'%(bl.ofs,offset,rblock,roffset))
                else:
                    rt=(rtype>>4)&3
                    tt=rtype>>6
                    names=['Relative','Offset','Segment','Pointer']
                    tnames=['Code','CS Const','Var','DS Const']
                    uname=self.unit_blocks_name(unit_num)
                    L.append('  %04X:%04X %s %s unit=%s blkoff=%04X'%(bl.ofs,offset,names[rt],tnames[tt],uname,roffset if tt!=0 else rblock))
            base+=bl.relocbytes
        return '\n'.join(L)

    def unit_blocks_name(self,ofs):
        for (bofs,w1,ref,name) in self.unit_blocks:
            if bofs==ofs: return name
        return 'U%04X'%ofs

OUTDIR='tpu_reports'

def main():
    global OUTDIR
    if len(sys.argv)<2:
        print('usage: tpuq.py <file.tpu> [outdir]')
        return
    inp=sys.argv[1]
    if len(sys.argv)>2: OUTDIR=sys.argv[2]
    os.makedirs(OUTDIR,exist_ok=True)
    name=os.path.splitext(os.path.basename(inp))[0]
    t=Tpu(inp)
    with open(os.path.join(OUTDIR,name+'.header.txt'),'w') as f:
        f.write(t.header_report()+'\n')
    with open(os.path.join(OUTDIR,name+'.units.txt'),'w') as f:
        f.write(t.unit_report()+'\n')
    with open(os.path.join(OUTDIR,name+'.entries.txt'),'w') as f:
        f.write(t.entry_report()+'\n')
    with open(os.path.join(OUTDIR,name+'.codeblocks.txt'),'w') as f:
        f.write(t.block_report('Code',t.code_blocks,t.ofs_code)+'\n')
    with open(os.path.join(OUTDIR,name+'.constblocks.txt'),'w') as f:
        f.write(t.block_report('Const',t.const_blocks,t.ofs_const)+'\n')
    with open(os.path.join(OUTDIR,name+'.varblocks.txt'),'w') as f:
        f.write(t.block_report('Var',t.var_blocks,t.h.ofs_var_blocks)+'\n')
    with open(os.path.join(OUTDIR,name+'.symbols.csv'),'w',newline='') as f:
        f.write(t.symbols_csv())
    t.emit(os.path.join(OUTDIR,name+'.interface.pas'))
    with open(os.path.join(OUTDIR,name+'.reloc_code.txt'),'w') as f:
        f.write(t.reloc_report('Code',t.relocs,t.code_blocks)+'\n')
    with open(os.path.join(OUTDIR,name+'.reloc_const.txt'),'w') as f:
        f.write(t.reloc_report('Const',t.const_relocs,t.const_blocks)+'\n')
    # extract binary sections
    for sec,ofs0,sz in (('code',t.ofs_code,t.h.code_size),('const',t.ofs_const,t.h.const_size)):
        if ofs0+sz<=len(t.data):
            with open(os.path.join(OUTDIR,name+'.%s.bin'%sec),'wb') as f:
                f.write(t.data[ofs0:ofs0+sz])
    # JSON name maps for later cross-unit resolution
    pn=t.proc_entry_map()
    tdmap={('%04X'%d):n for (_,d),n in t.type_names.items()}
    json_data={
      'unit': t.unit_self_name,
      'checksum': '%04X'%t.find_own_checksum(),
      'type_names': tdmap,
      'proc_entry': {('%04X'%k):v for k,v in pn.items()},
    }
    try:
        import json
        with open(os.path.join(OUTDIR,name+'.names.json'),'w') as f:
            json.dump(json_data,f,indent=1)
    except Exception:
        pass
    # print summary
    h=t.h
    print('== %s =='%inp)
    print('name=%s checksum=%04X own_record=%04X'%(t.unit_self_name,t.find_own_checksum(),t.own_record))
    print('size=%d sym=%d browser=%d code=%d const=%d reloc=%d constreloc=%d var=%d'%(len(t.data),h.sym_size,h.browser_size,h.code_size,h.const_size,h.reloc_size,h.const_reloc_size,h.var_size))
    print('layout_total=%d (file=%d)'%(t.layout_total,len(t.data)))
    print('units: %s'%', '.join(bn for (ofs,w1,ref,bn) in t.unit_blocks))
    print('uses: %s'%', '.join(un for (uofs,un,urs,trg,cks) in t.uses))
    print('objects=%d entries=%d code_blocks=%d const_blocks=%d var_blocks=%d'%(len(t.objs),len(t.entries),len(t.code_blocks),len(t.const_blocks),len(t.var_blocks)))
    print('src files: %s'%', '.join(sn for (ofs,ft,w1,date,sn) in t.src_files))
    print('reports -> %s'%OUTDIR)

if __name__=='__main__':
    main()
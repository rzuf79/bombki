import json,re,struct,sys
from pathlib import Path
from capstone import Cs, CS_ARCH_X86, CS_MODE_16

ROOT = Path(__file__).resolve().parents[2]
IMAGE = ROOT / "og" / "BOMBKI.EXE"
OUT = ROOT / "pascal-decomp" / "RECONSTRUCTED" / "disasm" / "annotated-BOMBKI.asm"

d=open(IMAGE,"rb").read()
(hdr,)=struct.unpack_from("<H",d,8)
img=d[hdr*16:]

PAR_BASES = {          # (lo_img, hi_img) -> code paragraph * 16 (add to cs-imm to get img)
    (0x00000,0x129D0): 0x00000,
    (0x129D0,0x20000): 0x129D0,
}
def base_for(a):
    for (lo,hi),b in PAR_BASES.items():
        if lo<=a<hi: return b
    return 0

# ---------- symbol tables ----------
FIELDS = {  # DGROUP offset -> name
 0x52:"Field_0052",0x54:"Field_0054",0x56:"Field_0056",0x58:"Field_0058",
 0x5A:"Field_005A",0x5C:"Field_005C",0x5E:"Field_005E",0x60:"Field_0060",
 0x62:"MaxLoad",0x6C:"CheckpointStage",0x6E:"Field_006E",
 0x74:"Field_0074_PotrawkiChance",0x76:"Field_0076",0x78:"Powracanie",
 0x7A:"ScrollPowrot",0x7C:"Piwo",
 0x17E:"Item_StaryMiecz",0x180:"PreviousRoom",0x182:"LoadCapacity",
 0x184:"Item_MalaTarcza",0x186:"Item_Serce",0x188:"Item_DyplomMudSzkoly",
 0x18A:"Item_Fajka",0x18C:"MadroscCur",0x18E:"SilaCur",0x190:"ZrecznoscCur",
 0x192:"Item_ButelkaMany",0x194:"PRAKTYK",0x196:"MadroscMax",0x198:"SilaMax",
 0x19A:"ZrecznoscMax",0x19C:"Energy",0x19E:"RandomScratch",0x1A0:"Item_Paczek",0x1A2:"Item_Ciastko",
 0x1A4:"Item_SuchaRacja",0x1A6:"Item_Chleb",0x1A8:"Item_Bulka",0x1AA:"Item_Weka",
 0x1AC:"ManaCur",0x1AE:"ManaMax",0x1B0:"MonsterHP",0x1B2:"Margin",
 0x1B4:"rewardXP",0x1B6:"MonsterDmg",0x1B8:"MonsterDex",0x1BA:"riposteFlag",
 0x1BC:"dodgeFlag",0x1BE:"dodgeScratch",0x1C0:"strikeScratch",0x1C2:"MaxLoad",
 0x1C4:"OutfitZrecznoscBonus",0x1C6:"Parowanie",0x1C8:"Kopanie",0x1CA:"ManaGateKopanie",
 0x1CC:"EnergyGateKopanie",0x1CE:"Uciekanie",0x1D0:"EnergyGateUciekanie",
 0x1D2:"fleeFlag",0x1D4:"KUNSZT",0x1D6:"context",0x1D8:"ArenaSouthLatch",
 0x1DA:"BeastKornik",0x1DC:"BeastMucza",0x1DE:"BeastBakteria",0x1E0:"BeastSlimak",
 0x1E2:"BeastZuk",0x1E4:"BeastKaraluch",0x1E6:"BeastMrowka",0x1E8:"BeastPajak",
 0x1EA:"BeastDzik",0x1EC:"BeastSzczur",0x1EE:"BeastLis",0x1F0:"BeastKuropatwa",
 0x1F2:"BeastZajac",0x1F4:"BeastWilczur",0x1F6:"BeastOrzel",0x1F8:"BeastSarna",
 0x1FA:"BeastSlon",0x1FC:"BeastLew",0x1FE:"BeastZyrafa",0x200:"BeastWielblad",
 0x202:"BeastStrus",0x204:"BeastBoa",0x206:"BeastWilk",0x208:"BeastBizon",
 0x20A:"BeastPantera",0x20C:"ArenaGladiator",0x20E:"ArenaWojownik",0x210:"ArenaTrener",
 0x212:"LootMoney",0x214:"ArenaMoveLatch",0x216:"Item_KompletUbranSyf",0x218:"OutfitEquipped",
 0x21A:"ForsaLo",0x21C:"ForsaHi",0x222:"Item_GarniturKolce",0x224:"HeavyBlow",
 0x226:"GitarzystaRoom",0x228:"PerkusistaRoom",0x22A:"OrganistaRoom",0x22C:"LiroyRoom",
 0x22E:"Item_KasetaLiroya",0x230:"Item_ScrollPorownanie",0x232:"PlantSzczaw",
 0x234:"PlantStokrotka",0x236:"PlantKoniczynka",0x238:"PlantMlecz",0x23A:"PlantDmuchawiec",
 0x23C:"PlantRoza",0x23E:"PlantJezyna",0x240:"PlantOset",0x242:"PlantAgrest",
 0x244:"PlantMalina",0x246:"PlantTrava",0x248:"QuestType",
 0x24A:"QuestCount",0x25C:"CharacterLevel",
 0x25D:"SkillPorownywanie",0x25E:"woundA",0x25F:"woundB",0x260:"bleed",0x262:"QuestPhase",
 0x664:"EnergyMax",0x666:"GardenAnimal_0666",0x668:"GardenAnimal_0668",0x66A:"GardenAnimal_066A",
 0x66C:"GardenAnimal_066C",0x66E:"GardenAnimal_066E",0x670:"GardenAnimal_0670",0x672:"GardenAnimal_0672",
 0x674:"GardenAnimal_0674",0x676:"GardenAnimal_0676",0x678:"GardenAnimal_0678",
 0x686:"PowerLevel",0x68A:"Field_068A",0x68C:"ThaiPdM_T7",
}
BYTEF = {0x24C:"RoomKillFlag_Dziecko",0x24D:"RoomKillFlag_Wariat",0x24E:"RoomKillFlag_Sluchacz",
         0x24F:"RoomKillFlag_Fan",0x250:"RoomKillFlag_Czlowiek",0x251:"RoomKillFlag_Policjant",
         0x252:"RoomKillFlag_Ochroniarz",0x253:"RoomKillFlag_Dziadek",0x254:"RoomKillFlag_Goryl",
         0x256:"RoomKillFlag_Reporter",0x255:"Flag_0255",0x257:"Item_Pigulka",
         0x25B:"Item_Listek",
         0x258:"TalentChance",0x259:"TalentPool",0x261:"DuncanFarmer"}

PROCS = {  # img->(name, extra)
  0x1691B:("EnemyTurnHelper",""),0x16E76:("Walka","combat engine"),
  0x159E4:("DropListek","Random(100)<6 && context!=10000: LISTEK-=10, PRZED++, ManaMax+=40; text says 4%"),0x15A91:("DropScroll","Random(100)<10 && context!=10000: SCROLLPOR-=10, PRZED++"),
  0x15AE4:("PRZEDM_MODE","MIECHO2=MIECHO; MIECHO=1000"),
  0x15BCF:("PRZEDM_SCENA","stage-musician descriptions by MIECHO"),
  0x15E37:("PRZEDM_TLUM","concert-crowd descriptions by MIECHO"),
 0x18405:("ItemPickupDropDispatch","BIERZ/ODRZUC items; item field semantics: 0x00=never, 0xFFF6=carrying, roomctx=dropped"),0x18E95:("ItemUseDispatch","UZYJ/ODLORZ/ZNISZCZ/PATRZ consumables+outfits; Pigulka=[0x257] time-travel"),0x197F1:("ColorChangeDispatch","ZMIEN KOLOR/TLO"),0x2BA1:("save",""),0x7D80:("wczytaj",""),
 0x2395:("trening","skills"),0x36F3:("BAZAR","death/shop"),0x8740:("LevelUp","0x8740..0x8BA1"),
 0x12ACA:("Room","map gen + TRENUJ + ZABIJ MROWKA/TRUP"),
 0x4F53:("KillDispatch","ZABIJ <NPC> router: flag==context -> tier launcher (0xf77/0x1090/0x11b2 in para 0x129D) -> clear flag on win; Dziadek 5% Fajka, Goryl/Ochroniarz DropGarnitur"),0x51C3:("Checkpoint","KUNSZT>=0x190 && CheckpointStage==0 && SilaCur<0x14: sets CheckpointStage=1"),
 0x12A16:("ZabijLauncher","dog/street tier: HP10 Dex10 Dmg5 loot Random(15); 25% Serce->[0x186]"),0x13839:("PRZEDM_SLABO","HP1/Dex1/Dmg2 loot Random(3); 70% Paczek->[0x1A0]"),0x13947:("PRZEDM_MNIEJSLABO","NPC weak tier: HP Random(3)+34 Dex Random(4)+8 Dmg 10; loot 10..30; 25% Serce->[0x186]"),0x13A60:("PRZEDM_SREDNIO","NPC mid tier: HP Random(5)+50 Dex Random(5)+10 Dmg Random(2)+13; loot 30..59; 35% Serce->[0x186]"),
 0x13194:("TrenujDispatch","TRENUJ SILA/ZRECZNOSC/MADROSC costs 3/2/3"),
 0x13839:("PRZEDM_SLABO","HP1 DEX1 DMG2 loot Random(3)..roll Paczek"),
 
 
 0x13B82:("PRZEDM_TRUDNO","strong NPC tier: HP Random(6)+60 Dex Random(3)+12 Dmg Random(3)+15; loot 20..59; 35% Serce"),0x13B87:("ZabijSilny_body","same body as ZabijSilny (shared code)"),0x13CA4:("PRZEDM_VEASY","HP R(10)+90 / Dex R(10)+14 / Dmg R(10)+17; loot R(0x37)"),
0x13DD0:("PRZEDM_EASY","HP R(20)+100 / Dex 16 / Dmg R(20)+18; loot R(0x1E)"),
0x13EF3:("PRZEDM_NEASY","HP R(20)+130 / Dex 20 / Dmg R(20)+19; loot R(0x2D)"),
0x14016:("PRZEDM_BTRUDNO","HP R(3)+72 / Dex R(2)+13 / Dmg R(2)+16; loot R(0x32)"),
 
 0x1491B:("CompareDispatch","POROWNAC oracle: PowerLevel[0x686]=lvl+Sila+Zrec tier+Par+Kop; "
  "taunt per target tier; 3% learn POROWNYWANIE; BAKTERIA ManaCur+=5"),
  0x155F0:("GardenZwierzaki","garden animals flavortext by context"),
  0x157B9:("DropGarnitur","Random(1000)<=25: GARNITUR-=10, PRZED++; text says 2.5%"),
  0x1586E:("DropPigulka","Random(1000)<=42: PIGULKA-=10, PRZED++"),
  0x15908:("DropKaseta","Random(100)<2 && context!=10000: KASETA-=10 and stat effects"),
 0x1362A:("GardenOgladaj","Duncan garden: plant flavortext by context"),
}

NEAR = {  # img -> name (near call/abs targets)
 0x1691B:"EnemyTurnHelper",
}

def pascal_str(a,pool=img):
    if not (0<a<len(pool)): return None
    n=pool[a]
    if not (1<=n<=250) or a+1+n>=len(pool): return None
    b=pool[a+1:a+1+n]
    if 0 in b: return None
    try: return b.decode("cp437")
    except: return None

def str_at_img(a):
    return pascal_str(a)

def fmt_imm_ref(imm,insn_addr):
    base=base_for(insn_addr)
    a=base+imm
    s=str_at_img(a)
    if s is None and base==0:
        # maybe string lives in the other segment with different alignment
        for bb in (0x129D0,0):
            t=str_at_img(bb+imm)
            if t: return ' cs:%04X"%s"'%(bb+imm,t)
    if s is not None:
        return ' cs=%04X "%s"'%(a,s)
    return ''

MD = Cs(CS_ARCH_X86, CS_MODE_16)
MD.detail=True

def operand_label(dec):
    n=dec.operands
    
# we annotate by matching mnemonic/op_str manually
# precompute: mov di,imm16 (BF imm16) followed within 4 bytes by push cs (0E)
# or mov di,imm16; push cs; push di  (BF XX XX 0E 57)
STR_REF=set()
for i in range(len(img)-5):
    if img[i]==0xbf:
        imm=img[i+1]|(img[i+2]<<8)
        win=img[i+3:i+9]
        if 0x0e in win[:4]:
            STR_REF.add(i)
            STR_REF.add(i+3 if img[i+3]==0x0e else i)  # keep in range
        # also push imm16 pattern 68 XX XX 0E
    if img[i]==0x68:
        imm=img[i+1]|(img[i+2]<<8)
        win=img[i+3:i+9]
        if win and win[0] in (0x0e,):
            STR_REF.add(i)

def annotate_line(addr,size,mnem,op,raw):
    com=[]
    b=base_for(addr)
    # memory operands referencing known dgroup offsets: word/byte names
    for m in re.finditer(r"\[(0x[0-9a-fA-F]{3,4})\]",op):
        off=int(m.group(1),16)
        name=FIELDS.get(off)
        if name: com.append("data:"+name)
        else:
            nb=BYTEF.get(off)
            if nb: com.append(nb)
    for typ in ("word","byte","dword"):
        op2=op.replace(typ+" ptr ","")
    # string refs
    if mnem=="mov" and re.search(r",\s*0x([0-9a-fA-F]{3,4})\s*$",op) and addr in STR_REF:
        imm=int(re.search(r",\s*0x([0-9a-fA-F]{3,4})\s*$",op).group(1),16)
        s=str_at_img(b+imm)
        for bb in ((0x129D0,) if b!=0x129D0 else (0,)):
            if s is None: s=str_at_img(bb+imm)
        if s is not None: com.append('str:"%s"'%s)
    if mnem=="lcall":
        m=re.search(r"0x([0-9a-fA-F]+),\s*0x([0-9a-fA-F]+)",op)
        if m:
            seg=int(m.group(1),16); ofs=int(m.group(2),16)
            tg=seg*16+ofs
            if tg in PROCS: com.append("call==%s"%PROCS[tg][0])
    if mnem in ("call","jmp") and len(op)>0 and op.startswith("0x"):
        tg=int(op,16)
        if tg in NEAR or tg in PROCS:
            nm=NEAR.get(tg,PROCS.get(tg,(tg,''))[0])
            com.append("->%s"%nm)
        elif tg+1 in NEAR:
            com.append("->%s(+1)"%NEAR[tg+1])
    return (" ; "+", ".join(com)) if com else ""

def emit(f,lo,hi):
    a=lo
    while a<hi:
        if a in PROCS:
            nm,x=PROCS[a]
            f.write("\n; ===== PROC %s @ img %05X (para%05X:%04X) %s =====\n"%(nm,a,base_for(a)//16,a-base_for(a),x))
        insns=list(MD.disasm(img[a:a+16],a))
        if not insns:
            f.write("%05X: %02X      db      0x%02X\n"%(a,img[a],img[a]))
            a+=1
            continue
        insn=insns[0]
        a2=insn.address; op=insn.op_str
        note=annotate_line(a2,insn.size,insn.mnemonic,op,None)
        f.write("%05X: %02X%02X  %-7s %s%s\n"%(a2,img[a2],img[a2+1] if a2+1<len(img) else 0,insn.mnemonic,op,note))
        a=a2+insn.size

with open(OUT,"w",encoding="utf-8") as f:
    f.write("; BOMBKI.EXE annotated whole-image metaprogram listing (generated)\n")
    emit(f,0,len(img))
print("wrote",OUT)

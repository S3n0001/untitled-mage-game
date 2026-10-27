MERGED into game-design.txt v3.3 on 2026-10-27; the doc is now the source of truth.

# Bestiary Proposal (B-series)

Status: PROPOSAL. Every number below is **(tune)**. Nothing here edits `game-design.txt` (v3.1); it fills the hole between Section 14 (bestiary roles) and 4.9 (Horror Combat Standard) with actual creatures and attack kits. Accept or reject by item ID. Reconciled with the v3.1 naming pass (Appendix C) and verification pass (Appendix B); renames are logged in Section 8 and rule fixes in Section 6 items 19 to 27. B-IDs are unchanged.

Reads against: 4.2 (frame data fields), 4.7 (echelon bands, floors, hit caps), 4.8 (Contest), 4.9 (Horror standard), 4.11 (Skill Over Build, Law 6 skill_notes), 4.12 (physical kit, Grab floor), 5.2/5.5/5.19 (XP, catalysts, Body), 5.20 (PvE source rule), 7.3 (vowed path), 10.1/10.5/10.7 (Horror buffs, Elementals, Alone), 11.3-11.6 (zones, Drift, Bleed, Fissures), 12 (law), 14 (roles), 18.7 (ingredient table).

Aligned with `docs/proposals/combat-numbers.md` (C-series): C-01 (100 HP baseline, so every % here is also a point of damage), C-05 (heavy hit = Echelon 2+ or Breaker; Echelon 1 is never heavy), C-08 (projectile speed tiers and honest-hitbox shapes), C-09 (element ring, void neutral), C-10 (telegraph signatures, adopted verbatim in B-02), C-11 (spell ids; reused wherever a creature casts an existing spell, new entries proposed only in B-20a), C-15 (hit reactions), C-16 (recovery floors).

Notation used throughout:

- **Dmg** is a share of a baseline Health pool, before stats, inside the echelon damage band (E1 3-8%, E2 8-18%, E3 20-30%) and under the hit caps (12/22/35%). No absolute HP anywhere; the combat-numbers proposal sets pools.
- **S / A / R** = startup / active / recovery in ms. Startup is the telegraph.
- **Class**: P = Parryable, B = Breaker, U = Unparryable, G = Grab (4.2).
- **Ech**: E1 = Lesser, E2 = Greater, E3 = Calamities (4.7, v3.1 names); Rites sit above the echelons and never appear as mob attacks.
- **st** = studs. Hitbox shapes are the server hitbox; the visual matches (4.11).
- **Band**: the pacing band (5.15) the mob is pitched at, so the numbers proposal can place its Power Score. Awk = Awakening, App = Apprentice, Adp = Adept, Mst = Master.
- **skill_notes** per action: one mix-up it enables, one counterplay against it (4.11 Law 6).

Index: B-01 to B-04 conventions · B-05 to B-21 overworld mobs · B-22 to B-29 Aether Horrors · B-30 Fissure Horror · B-31 to B-34 law · Section 6 doc conflicts and assumptions · Section 7 dependencies · Section 8 v3.1 renames.

---

## 0. Conventions this proposal relies on

### B-01 Readability floor under the speed multiplier (tune)

4.9 gives Horrors a per-server speed multiplier of about 0.8x to 1.3x and says variation "can never push below" the readability floor, but does not say how the two meet. Proposed rule, applied by the server when it instantiates a Horror:

1. **Baseline startup is authored at or above 1.3x the floor.** E1 floor 250 -> author >= 325 (this doc uses 340+). E2 floor 450 -> author >= 585 (this doc uses 600+). E3 floor 900 -> author >= 1170 (this doc uses 1200+). Grab floor 400 -> author >= 520 (this doc uses 540+). At the fastest legal roll the telegraph is still at or above the floor with no clamping needed.
2. **Defensive clamp anyway.** `startup_effective = max(floor, startup_base / speed)`. If a future author violates rule 1, the server, not the player, eats the mistake.
3. **Recovery is never scaled by the speed roll.** C-11 fixes recovery as untrainable and C-14 shows the TTK floor (Law 3) depends on recovery as much as startup: an E3 recovery of 1000ms gives exactly 4.00s and 800ms fails. If the speed roll shortened recovery, a Horror's time-to-kill would depend on the server roll, which is pressure through damage rate, not variance (4.9). So the roll touches startup only. Authored recoveries obey the C-16 floors as written (E0 150, E1 200, E2 400, E3 1500): every E3 action in this document carries 1500ms or more, every E2 at least 800, every E1 at least 400, and Grab whiffs at least 600, so punish windows are identical on every server. (Alternative if the owner wants recovery scaled: clamp at the C-16 floors, which would force every E3 base here to 1950ms or more.) 4.11 v3.1 adds a last line behind this: one attacker's damage to one target is capped at 90% of max Health in any rolling 4s, with combo scaling applied after the hit cap. Horrors are attackers under that rule, so no roll of these parameters can produce a sub-4s kill even if a future author ignores this item.
4. **Active frames are never scaled.** The hitbox lives exactly as long as the visual (honest hitboxes, 4.11, C-08b). Projectile speeds are the fixed C-08a tiers (E1 120, E2 80, E3 40 for the falling body, beam head 160 studs/s) and are not multiplied.
5. **Delay variance only adds.** It is the Hold tool of 4.11 Law 4: the Horror pauses at Telegraph end for 0 to `hold_max` (tune: 600ms for Horrors, versus 500 for players) and then releases. It lengthens a telegraph, never shortens it.
6. **Feints are visible whiffs.** A feint cancels at the `Feint_Window` marker (the last 120ms of startup, tune) into a whiff recovery (tune: 350ms) that can be counter-hit. Feints are never applied to Unparryable attacks (a hatched ground decal is always real) and never to the first two attacks of a fight (4.9 fight shape).
7. **Per-server roll, per-species.** Each Horror species rolls its parameter set once per instance. Inside one Aether the Mourner's rhythm is consistent and can be learned by fighting it; the next Aether rolls again (10.2).

Tables in this document show Horror startup as `base (at 1.3x)` so the floor can be checked at a glance. Overworld mobs have no speed multiplier (their variance is learnable, Design Law 3) and are simply authored above the floor.

### B-02 Telegraph language (adopts C-10 verbatim; body-language tells added)

C-10 owns the class signatures and the world proposal already uses them. This document adopts them unchanged and layers one body-language rule per class on top, so a creature's silhouette agrees with its marker.

| Class | C-10 shape marker | C-10 color | C-10 sound | Body language rule (this proposal) |
|---|---|---|---|---|
| Parryable | 4-point star glint on the hand, weapon or maw | White #FFFFFF | single high bell "tink" | weight shifts **toward** the target before the swing |
| Breaker | jagged, cracked ring around the attacker or limb | Vermillion #D55E00 | two beats, low then sharp: "thud-CRACK" | weight **drops** (crouch, coil, dig-in) |
| Unparryable | filled ground decal with diagonal hatching outlining the exact area | Yellow #F0E442, dark outline | one continuous rising whoosh across the whole startup | the attacker looks at the **ground or sky**, never at you |
| Grab | inward-pulling chevrons converging on the target point, or an open hand or maw | Blue #0072B2 with a white rim | sharp reversed inhale plus a short chain rattle | the limb or maw **opens** before it closes |

Echelon tiers layer on top per C-10b (E3 attacks add the sky tint and ground sigils; "sigil" below always means the E3 world-scale tell, "decal" the class marker). Every attack in this document carries its class marker from `Telegraph_Start` to `Active_Start`. Element buffs tint the body, never the marker (C-10c), so a fire-buffed Breaker still reads as a Breaker, and markers render at the C-10c minimum size and sound priority in fog or at distance.

### B-03 Overworld variance rule (tune)

Overworld mobs never use the per-server parameters. Their variance is a small, finite, fixed set: two or three chains per mob, a fixed hold length where the mob holds, and no feints below Adept band. A player who has fought a Glutmaw Hound ten times knows every string it has. Elemental front variants (11.7) change the element tint, the on-hit effect and the drop tags; they never change frame data. This is the gradient of 11.1 made literal: overworld = learnable, Fissure = the Aether's grammar at baseline, Aether = unlearnable values on a fixed grammar.

### B-04 Role mechanics, defined (tune)

Section 14 names the roles; this defines what each role does to the numbers.

- **Absorb (Mana Beasts).** A spell hitting an absorbing surface deals a reduced share of its damage (tune: 30%) and the rest is eaten as **Glut**, a hidden meter filled by mana committed. At full Glut the beast must **Vent**: a telegraphed Unparryable burst that empties it, after which it is **Spent** for a window (tune: 3s) and takes full spell damage. A mage can force a Vent, but it costs roughly the beast's Glut capacity in committed mana (tune: about 1.5x a mid-pool), which is the whole point of the counter. Physical damage is never absorbed.
- **Reflect (Golems and Constructs).** A spell hitting a reflective shell returns toward its caster as the same spell at reduced energy (tune: 60%), on the same class and echelon, so it can be parried, clashed or dodged. The construct's **core** is exposed only during specific actions and on its back or joints; hits on the core take full damage and train Durability (5.3, 14). Physical hits on the shell do full damage but count as a **hard target** for Fist Hardness (5.19.8).
- **Phase (Phantoms and Wraiths).** Immune to physical damage except from spirit-forged weapons and the Spirit Palm (7.3). In a Dead Zone a Phantom **half-manifests**: it takes physical damage at a reduced rate (tune: 50%) and cannot Phase-step. This is the 5.19.8 Long Road feat made concrete. In an Alone Aether, Phantoms and Wraiths are never drawn for a vowed character without the spirit answer (10.7, v3.1); the three Phantoms here are overworld mobs, so the rule only matters if an Aether Tide or a Fissure pool ever includes them, and then it applies.
- **Step budget (3.4, v3.1).** Where a counterplay line says Step, it means one Step per read. Each Step within 2s of the last costs 50% more Strain and delays recovery, so about five chained Steps make a vowed character Winded. Kits below are built so that no phase asks for more than two Steps in 2s; where a Horror's Unparryables come faster than that (the Choir's Procession, the Unformed's Palm), the intended vowed answer is position or Guard, not a Step chain.
- **Calamities as Suffering sources (5.20, v3.1).** A survived E3 hit counts toward the Suffering route only from a hostile caster. Mob casters (the Walker, Anvilback, Gloamwing, the Unburied, the Archivist, the Marshal, the Likeness) are always hostile, so every E3 in this document counts in full; the 20-hour account rule applies to player casters only.
- **Contact (Volatile Flora and Slimes).** Touching the body or its trail deals E1 ticks (tune: 3% per 0.5s, combo scaling applies, so a long touch decays). Contact damage ignores Guard and Barrier but not Step/Dash i-frames.
- **Caster (Spellcasters).** Casts spells from the player spell table by id, with the spell's own frame data, so clashes, Contests and Learning by Suffering work unchanged. Every caster carries a `teaches: [spell_id]` field (B-20).
- **Horror.** No immunities, no resistances, no weaknesses (10.1). Everything that can damage a player can damage a Horror at the same rate. Pressure comes only from the 4.9 parameters.

---

## 1. Overworld mobs

Format per mob: look, habitat, behavior, role mechanic, kit, drops, teaches, counterplay by archetype (CM = Classic Mage, SM = Sword Mage, VB = Vowed Blade, VF = Vowed Fist).

### 1.1 Mana Beasts (absorb spells)

#### B-05 Glutmaw Hound (tune) — Band: Awk/App

- **Look:** a lean, long-legged hound with a translucent throat sac that glows with whatever it has eaten; ribs show when it is empty, the sac bulges when Glutted.
- **Habitat:** grassland and ruin Drift states, leyline edges where mana is thick. Packs of 3 to 5. Drawn to campfires that smell of Resonant meat (18.12).
- **Behavior:** the pack circles; one hound commits while the others hold the arc. Low on Glut they bite; near full Glut they stop advancing and look for a Vent angle. A hound that eats a spell yips, and the pack converges on the caster.
- **Role mechanic:** Absorb (B-04). Pack Glut is shared, so one hound Venting empties the others' willingness to approach for a moment.

| Action | Class | Ech | S / A / R (ms) | Dmg | Hitbox |
|---|---|---|---|---|---|
| Snap | P | 1 | 320 / 80 / 450 | 4% | cone 60 deg, 4 st |
| Lunge-and-Drag | G | 1 | 540 / 120 / 700 (whiff) | 7%, then Blood tick | capsule 5 st forward |
| Pack Harry | P | 1 | 300 / 60 / 400 | 3% x2 (two hounds, 200ms apart) | two cones |
| Vent | U | 2 | 650 / 120 / 1000 | 10% | radius 5 st |

skill_notes:
- **Snap.** Mix-up: the leading hound Snaps while a flanker starts Pack Harry, so the parry you spend on the Snap leaves you in a second hound's active frames. Counter: parry the Snap and immediately Step/Dash back out of the flank line; a parried Snap gives Tempo on the whole pack's rhythm because the others wait for the leader to recover.
- **Lunge-and-Drag.** Mix-up: starts from the same crouch as Snap but 220ms longer and with the open-maw Grab cue; a player who parries on the Snap rhythm whiffs into Parry Recovery and is grabbed. Counter: any hit during the 540ms startup stops it; a Fist Strike at the E1 floor does this reliably, which is why hounds fear Fists.
- **Pack Harry.** Mix-up: the two bites land 200ms apart, inside one parry window, so one parry catches both or neither depending on timing. Counter: Block instead of parry; two E1 hits on a Barrier never reach Reel (E1 is never heavy, C-05a) and chip nothing (C-04c), and the drain is small.
- **Vent.** Mix-up: a Glutted hound walks toward a mage that keeps casting, and the Vent decal appears under the mage's feet, not the hound's. Counter: stop feeding it. Or feed it on purpose at range, Dash the decal, and punish the 3s Spent window with your biggest spell for full damage.

- **Drops:** Resonant meat (Hearty, Resonant tags; a Glutted hound drops a larger cut), hound sinew (bowstring/bind material), Mana Crystals rare (tune: 10% chance of 1; one crystal is a day's rent, 17.4).
- **Teaches:** Breath catalyst "outrun a hunter squad or beast on foot" (5.19.4) is written for this pack. Footwork trains on the Lunge dodge. Block Proficiency trains on Pack Harry. Mage Efficiency trains when fighting under 30% mana after a hound has eaten half your pool.
- **Counterplay:** CM: do not trade spells into the sac; use one cheap E1 to bait the Vent, then Spent-window burst, or fly (hounds cannot follow; they lose interest after about 20s). SM: ideal target; infused blade ignores Absorb, parry Snaps with the sword, cut the Lunge. VB: home turf; Spellcut is irrelevant, Guard the Harry, Technique the leader in its recovery. VF: the best answer in the game; a Strike beats every Lunge startup, and Grabs on a hound throw it into its own pack.

#### B-06 Dolmen Bruin (tune) — Band: App/Adp

- **Look:** a bear-shaped mass under slate plates, mana crystals growing between the plates like lichen; it glows brighter with Glut and the plates lift when it Vents.
- **Habitat:** forest and "grassland over ruins" states; dens near leylines. Solitary. Appears behind Migration herds (11.13) as a predator.
- **Behavior:** slow approach, does not chase far. Fights at a fixed rhythm: two plate swings, then a Hug attempt or a Vent. Sits down to Vent, which is how you know.
- **Role mechanic:** Absorb, large Glut capacity (tune: 3x a hound), so forcing a Vent is expensive for a mid mage.

| Action | Class | Ech | S / A / R (ms) | Dmg | Hitbox |
|---|---|---|---|---|---|
| Plate Swing | P | 1 | 380 / 120 / 600 | 7% | arc 120 deg, 6 st |
| Dolmen Drop | B | 2 | 650 / 150 / 950 | 14% | box 4 x 6 st forward |
| Hug | G | 2 | 620 / 150 / 900 (whiff) | 12%, then Blood drain while held (tune: 1%/s, 2s) | capsule 4 st |
| Vent | U | 2 | 800 / 150 / 1200 | 16% | radius 7 st |

skill_notes:
- **Plate Swing.** Mix-up: the second swing of a pair is held (fixed hold, 250ms) so a parry on the first swing's rhythm whiffs. Counter: the hold is fixed and learnable; wait for the plate to actually drop, or Block both since neither is a heavy hit.
- **Dolmen Drop.** Mix-up: its startup matches the Hug's first 500ms, so you must read the vermillion cracked ring on a dropping weight (Breaker) versus the blue chevrons on opening arms (Grab) in the last beat. Counter: it is a Breaker: sidestep, never block; the box hitbox is narrow and the Bruin stands in recovery for 950ms, which is the Might catalyst window for a Blade.
- **Hug.** Mix-up: after a parried Plate Swing the Bruin sometimes goes straight to Hug instead of its second swing, punishing the player who presses Tempo in. Counter: a Grab is beaten by any hit during startup; Tempo plus a Strike wins outright.
- **Vent.** Mix-up: the Bruin sits to Vent exactly as it sits to rest, and the yellow hatched decal is the only difference. Counter: read the class marker; after the Vent it is Spent for 3s and that is when mages get their full-damage window.

- **Drops:** large Resonant cut (Hearty, Resonant, Fat), slate plate (armor material), crystal lichen (glyph material, rare), Mana Crystals (tune: 40% chance of 1 to 2).
- **Teaches:** Might trains on Guard Breaking it (it Guards with its forearms when its Glut is low). Conditioning trains for a Fist that strikes plates (hard target, Hardness applies). Durability does **not** train here; absorption is not defense.
- **Counterplay:** CM: a mid mage cannot afford to force the Vent alone; either leave, or pair with a physical and only cast in Spent windows. SM: cut, do not cast; the blade ignores Absorb; watch the Hug after Tempo. VB: Breaker Techniques into the forearm Guard for Might; Step the Drop; Hug is beaten by a Strike. VF: before Conditioning Honed the plates hurt you; target the crystal lichen between plates (soft spots, no Hardness) until the hand is ready.

#### B-07 Loomhorn (tune) — Band: Awk (passive), App when stampeding

- **Look:** a tall grazer with a head-crest of woven horn that thrums when it absorbs mana, legs too long for its body, moving in slow herds.
- **Habitat:** grassland states; the Migration event (11.13) is a herd of these crossing a region. Also drawn toward Leyline Surges.
- **Behavior:** passive until struck or until a predator (Bruin, Hound pack) spooks the herd. Herds absorb spells as a group; a herd fed enough mana stampedes along its route, which is both the hazard and the harvest.
- **Role mechanic:** Absorb, with no Vent. Absorbed mana goes into the horn, which is why the meat is Resonant.

| Action | Class | Ech | S / A / R (ms) | Dmg | Hitbox |
|---|---|---|---|---|---|
| Horn Sweep | P | 1 | 360 / 100 / 500 | 5% | arc 150 deg, 5 st |
| Rear Kick | B | 2 | 600 / 120 / 800 | 10% | box 3 x 5 st behind |
| Stampede | U | 2 | 900 / 400 (moving) / 1200 | 12% per contact, once per beast | herd lane 8 st wide |

skill_notes:
- **Horn Sweep.** Mix-up: the sweep comes from the side the head was *not* facing because the crest is wider than the head. Counter: parry it; a Loomhorn parried once backs off for several seconds, so parries buy space to lead the herd.
- **Rear Kick.** Mix-up: a Loomhorn you approach from behind to harvest kicks without turning. Counter: approach from the front where the kick cannot reach, which is also where the Sweep can; pick your poison.
- **Stampede.** Mix-up: the herd turns at landmarks on its route, so a lane that looked safe becomes the lane. Counter: the lane is marked by dust and sound 900ms out; stand behind a boulder (the herd parts around structures) or Dash across, never along, the lane.

- **Drops:** Resonant cut (Hearty, Resonant), horn weave (bind material, cosmetic heraldry base), **rare cuts** only from a Migration herd (Resonant plus a front tag if the herd crossed a front), Mana Crystals none.
- **Teaches:** nothing by fighting (Threat near zero for most). It teaches cooks and explorers: following a Migration is the Explorer lean of 11.13. Range trains for a mage who lands maximum-distance hits on a moving herd.
- **Counterplay:** CM: do not cast at the herd; you are feeding the stampede. Harvest the stragglers. SM/VB/VF: walk in, take a Sweep parry, cut your cut. The herd's danger is the Bruin or Hound pack that follows it, not the herd.

### 1.2 Golems and Constructs (reflect spells, exposed cores)

#### B-08 Mirrorplate Sentinel (tune) — Band: App/Adp

- **Look:** a hollow suit of fluted, mirror-polished plate with nothing inside but a fist-sized core of banded light at the sternum; the breastplate is hinged and opens when it swings.
- **Habitat:** ruin states, dungeon antechambers, Risen Ruins (11.13). Stands still until approached; wakes with a sound like a drawn blade.
- **Behavior:** a duelist's rhythm. Two-strike strings, a shield-raise that reflects, and an overhead that opens its chest. Never chases past the ruin's threshold.
- **Role mechanic:** Reflect (B-04). The core is exposed during Crown Splitter recovery and for 400ms after any parried strike (the breastplate hinge jolts open on Tempo).

| Action | Class | Ech | S / A / R (ms) | Dmg | Hitbox |
|---|---|---|---|---|---|
| Fluted Cut | P | 1 | 340 / 100 / 480 | 6% | arc 90 deg, 5 st |
| Mirror Raise | - (defensive) | 0 | 300 / 900 / 300 | - | front 180 deg |
| Crown Splitter | B | 2 | 680 / 140 / 1000 (core exposed) | 15% | line 1.5 x 6 st |
| Riposte | P | 1 | 340 / 80 / 500 | 8% (counter-hit bonus applies) | thrust 5 st |

skill_notes:
- **Fluted Cut.** Mix-up: the second cut of the string is a Riposte if your parry whiffed (it reads Parry Recovery and thrusts). Counter: parry the first cut; Tempo opens the chest hinge for 400ms, which is the Durability training window the design promises (14).
- **Mirror Raise.** Mix-up: it raises the mirror as you release a spell, so your own fireball comes back at you on the same class; an E2 reflected into a mage in Parry Recovery is the lesson. Counter: the Raise is 900ms of standing still; walk around it (reflect is frontal 180 deg) or clash your own reflected spell for the Last Word.
- **Crown Splitter.** Mix-up: it starts from the Mirror Raise pose, so the shield you were waiting out becomes an overhead Breaker. Counter: the vermillion cracked ring and the drop of weight say Breaker; sidestep and spend the 1000ms recovery on the open core.
- **Riposte.** Mix-up: it only comes after a whiffed parry or a blocked Cut, so panicky F-mashing is exactly what feeds it. Counter: do not press F twice; a single parry or a held Block, never both.

- **Drops:** mineral salt (Section 18.7, inedible on its own, a seasoning), mirror shard (glyph material: Glyph of Focus base), core dust (enchanter material, rare), Mana Crystals (tune: 60% chance of 1 to 3).
- **Teaches:** Durability on the core (5.3). Weight for Blades landing Techniques on the shell (resisting target). Might for Guard Breaking it (its Mirror Raise counts as a Guard). The Cast Speed catalyst "punish a parry against a stronger foe" fits the Riposte pattern.
- **Counterplay:** CM: never cast into the mirror; bait the Crown Splitter, dodge, and put an E2 into the core during recovery; or parry its Cut and cast into the hinge window. SM: the intended fight; blunt the mirror with the sword, chest-stab on Tempo. VB: Breaker Techniques on the Raise drain nothing from it but train Might; Spellcut is irrelevant; the Crown Splitter is the Footwork catalyst's "stronger foe". VF: Hardness (5.19.8) bites before Conditioning Honed; strike the core only, which is soft, and treat the shell as a wall you climb around.

#### B-09 Cairn Walker (tune) — Band: Adp

- **Look:** a walking cairn, nine stacked boulders held together by a fault of earth-light; the core is the keystone at the back of the neck, visible only when it bends to slam.
- **Habitat:** frozen and mountain states, Dead Zone passes (it needs no mana), Pressure Peak foothills. Solitary.
- **Behavior:** slow, inevitable. Alternates Unparryable slams with a Roll that it uses to cut off escape routes. Turns slowly: its back is its weakness and it knows it, so it keeps rolling to face you.
- **Role mechanic:** Reflect on every boulder face. Earth element native (no on-hit effect in the overworld; its Slams leave rubble that is cosmetic destruction tier).

| Action | Class | Ech | S / A / R (ms) | Dmg | Hitbox |
|---|---|---|---|---|---|
| Fault Slam | U | 2 | 750 / 150 / 1100 (core exposed) | 16% | radius 6 st, ground |
| Boulder Toss | P | 2 | 620 / proj / 800 | 12% | projectile 2 st, E2 speed tier |
| Cairn Roll | B | 2 | 700 / 600 (moving) / 900 | 13% | capsule 4 st, travels 20 st |
| Keystone Crush (casts e3_cairnfall, B-20a) | U | 3 | 1250 / 200 / 1500 (core exposed) | 24% | radius 10 st |

skill_notes:
- **Fault Slam.** Mix-up: it slams where you *will* be if you keep strafing in the same direction (it leads the target). Counter: change strafe direction when you see the hatched decal; the slam is ground-only, so a Leap or flight hop clears it, and recovery exposes the keystone.
- **Boulder Toss.** Mix-up: it throws between slams to punish a mage who stays at the range where slams can't reach. Counter: it is a Parryable E2 projectile; clash it down with an E2 for the Last Word (Durability catalyst, 4.8) or parry it for Tempo and a little mana back.
- **Cairn Roll.** Mix-up: the Roll ends facing you, so the back-attack you set up is gone. Counter: Breaker, so sidestep; the Walker's 900ms recovery after a Roll is the only time its back is turned to the side you dodged toward.
- **Keystone Crush.** Mix-up: a world-scale sigil (E3) that it uses when two or more players are on it, to break up a group that is cycling its back. Counter: 1250ms and a 10 st ring; walk out, then the keystone hangs exposed for 1500ms. This is the slowest, most generous E3 in the overworld and is meant as a reading lesson before Horrors.

- **Drops:** mineral salt, keystone chip (weapon material: high-durability blades), fault glass (glyph material: Expansion base), Mana Crystals (tune: 80% chance of 2 to 4). Nothing edible.
- **Teaches:** Durability on the keystone. Conditioning for a Fist that can finally strike it (hardest overworld target). The Capacity catalyst "survive near-burn exhaustion, then recover in a leyline basin" pairs with its Dead Zone home. Keystone Crush is **one of the three distinct E3 sources** for the Suffering route (5.20) if the numbers proposal registers it as a spell (see Section 6).
- **Counterplay:** CM: a patience fight; every spell at the front comes back; only the keystone counts. Fly only in hops; it cannot ground you (no E2 projectile hits a flier easily) but the Toss can. SM: stone resists the blade's chip; this is a Sword Mage's worst Golem, intended. VB: Weight training on the boulders; climb its back during Slam recovery (climbing is a vowed route). VF: the Conditioning gate in creature form. Before Honed it bleeds you; at Honed it is where Might catches up (Coupling, 5.19.8).

#### B-10 Latch Crab (tune) — Band: App

- **Look:** a knee-high bronze crab with a mirrored carapace and a single glass eye that is also its core; its claws are hinged latches.
- **Habitat:** dungeon corridors and ruin vaults in swarms of 4 to 8; Ward-Knot nests near sealed Boss Rooms (11.9).
- **Behavior:** swarm and latch. One latches, the rest reflect your attempts to shoot it off. A latched Crab exposes its eye to anyone **except** the player it is latched to.
- **Role mechanic:** Reflect E1 only (E2 and above shatter the carapace and hit through). Its Grab is the role: a latched player's spells are reflected point-blank.

| Action | Class | Ech | S / A / R (ms) | Dmg | Hitbox |
|---|---|---|---|---|---|
| Latch | G | 1 | 540 / 100 / 600 (whiff) | 4%, then 2% per 1s latched (max 3 ticks) | capsule 3 st |
| Pinch | P | 1 | 300 / 60 / 400 | 3% | cone 2 st |
| Scuttle Volley | P | 1 | 400 / 60 / 500 | 4% x3 (three crabs, 150ms apart) | three cones |

skill_notes:
- **Latch.** Mix-up: it jumps from a wall or ceiling, so the blue open-claw chevrons come from above your eyeline. Counter: any hit during startup kills the Latch; a latched crab is removed by an ally's hit on its eye, by a Step (i-frames knock it off, tune), or by a Fist's throw.
- **Pinch.** Mix-up: the Pinch is the follow-up a latched crab uses while you are reaching for F, and your parry of it opens you to the next Latch. Counter: ignore Pinches (3%); kill the latch.
- **Scuttle Volley.** Mix-up: three staggered hits across 300ms, straddling one parry window, so the parry catches one or two. Counter: Block; three E1s on a Barrier cannot Reel (C-05a) and chip nothing.

- **Drops:** bronze latch (crafting: clasps, armor fittings), glass eye (glyph material: cheap Focus), Mana Crystals (tune: 20% chance of 1).
- **Teaches:** Range for mages hitting several crabs with one AoE (multiple targets train Range, 5.3). Block Proficiency on the Volley. The Grab-escape habit (hit during startup) that Horrors will test harder.
- **Counterplay:** CM: an E2 AoE breaks carapaces; never E1 into a swarm. SM: cut latches off allies; Slash waves (E1) reflect, so use the blade. VB: swarm clearing with Reach-trained arcs; Techniques count as E2 and shatter. VF: a Fist's dream swarm: no Hardness (bronze is soft), Grabs throw crabs into crabs.

### 1.3 Phantoms and Wraiths (physical immunity)

#### B-11 Candle Wraith (tune) — Band: App/Adp

- **Look:** a tall, thin figure of pale wick-light with no face, trailing a smoke of unspent mana; it brightens when it reaches for you and gutters when hit.
- **Habitat:** ruin states after dark, Bleed Zones, battlefield marks left by Siege events. Alone or in pairs.
- **Behavior:** drifts, phases through walls, reaches. Prefers a target that is low on mana (it reads auras). Retreats into walls when its own light is low and returns from a different wall.
- **Role mechanic:** Phase (B-04). Void element native: its touch drains mana (tune: 3% of max per hit), which is the overworld's gentle version of the void-mist buff.

| Action | Class | Ech | S / A / R (ms) | Dmg | Hitbox |
|---|---|---|---|---|---|
| Wick Reach (casts e1_wick, B-20a) | P | 1 | 360 / 208 / 500 | 5% + mana drain | bolt radius 1, 25 st at the E1 tier (C-08a); the Wraith fires it at touch range |
| Mourning Pulse | U | 2 | 700 / 150 / 1000 | 11% + mana drain | ring 5 st, centered on it |
| Snuff | G | 2 | 600 / 150 / 900 (whiff) | 12%, drains 10% max mana over the hold (tune) | capsule 3 st |
| Phase-step | - (mobility) | 0 | 200 / - / 400 | - | teleports 8 st to a wall or shadow |

skill_notes:
- **Wick Reach.** Mix-up: the Reach can come from inside the wall you are standing against, with the "tink" audible before the star glint shows. Counter: the "tink" is the cue; parry on sound. A parried Wraith gutters and cannot Phase-step for 2s (tune), which is your damage window.
- **Mourning Pulse.** Mix-up: it Phase-steps to your side and Pulses, so the yellow hatched ring appears *on you*, not ahead of you. Counter: 700ms and a 5 st ring; Dash out. It cannot Pulse twice in a row.
- **Snuff.** Mix-up: it opens the Snuff exactly when your mana bar is at the point where a Hollow would follow, and a Snuffed mage is a Hollow mage. Counter: Grab rules: a hit in startup breaks it, and a Barrier Parry beats it. Never block it.
- **Phase-step.** Mix-up: it steps out of your spell's path and your spell continues into whatever is behind it (your ally, a hound pack). Counter: Phase-step has a 400ms recovery on arrival; a mage who learns the wall-pattern of a ruin pre-aims the arrival spot. In a Dead Zone it cannot step at all.

- **Drops:** nothing edible (18.7, "which tells players something"), wick-ash (enchanter material for spirit-forging, rare), Tome fragment (rare, void family), Mana Crystals (tune: 30% chance of 1).
- **Teaches:** Learning by Suffering for void E1 (the Reach is e1_wick, a proposed table entry, B-20a). Suppression training: a suppressed mage reads as empty and the Wraith loses interest, which is a safe way to train Suppression under stress (5.11). Sense unlock: surviving its ambush from a wall counts as "surviving an ambush from a suppressed foe" (15.2).
- **Counterplay:** CM: the intended counter; pure mana hurts it, and it is slow in the open. Fight it away from walls. SM: infused blade does nothing; cast. VB: cannot hurt it without a spirit-forged blade; drive it toward a Dead Zone edge where it half-manifests, or leave. VF: immune until the Spirit Palm; the Long Road for that mastery is written against this creature (drive it into a Dead Zone, finish it barehanded at half-manifest).

#### B-12 The Unburied (tune) — Band: Adp

- **Look:** a heavy, kneeling shade in the shape of a knight whose armor rusted away, holding a sword of nothing; it rises slowly when you cross its field.
- **Habitat:** barrow states ("grassland over ruins"), Dead Zone edges, Siege marks. Always alone; a field holds one.
- **Behavior:** a slow duelist. It does not drift like a Wraith; it walks. Every attack is a committed swing. It never leaves its barrow.
- **Role mechanic:** Phase. **Half-manifest** native: it stands at a Dead Zone's edge by design, so a vowed character can drag the fight one step into the dead ground and hurt it at half rate. This is the vowed player's teaching Phantom.

| Action | Class | Ech | S / A / R (ms) | Dmg | Hitbox |
|---|---|---|---|---|---|
| Barrow Cut | P | 1 | 400 / 120 / 600 | 7% | arc 120 deg, 6 st |
| Grave Lunge | B | 2 | 700 / 150 / 1000 | 15% | line 1.5 x 8 st |
| Kneel | U | 2 | 800 / 150 / 1200 | 13% | radius 6 st, ground |
| Unburial (casts e3_unmaking, B-20a) | U | 3 | 1300 / 250 / 1600 | 25% | radius 12 st |

skill_notes:
- **Barrow Cut.** Mix-up: it has a two-cut string where the second cut is held (fixed, 300ms). Counter: learnable hold; Block the pair or parry the second on its drop. Tempo makes it drop its guard for the Durability-free damage window (mages) or, in dead ground, the Spellcut-free Blade window.
- **Grave Lunge.** Mix-up: the Lunge covers 8 st, so the range that was safe for a Barrow Cut is in the line. Counter: sideways, never back; Breaker.
- **Kneel.** Mix-up: it kneels to rest (no sigil) and it kneels to slam (sigil); the pose is identical. Counter: read the yellow hatched decal, not the pose.
- **Unburial.** Mix-up: used once per fight when its light is low, where the whole barrow becomes the ring. Counter: 1300ms, leave the ring; recovery is 1600ms of the easiest damage in the fight. Another E3 Suffering source: it casts the same void E3 as the Likeness (e3_unmaking), so the two are distinct *sources* of one spell, which is what 5.20 counts.

- **Drops:** nothing edible, grave-iron (the **spirit-forging** material for Blades, 7.3; rare), Tome fragment (void or earth family), Mana Crystals (tune: 50% chance of 1 to 2).
- **Teaches:** Blade: the first spirit-forged blade's material comes from the thing it is forged to kill. Conditioning catalyst "take a Reel from a stronger foe and win without retreating" fits the Lunge. E3 Suffering source.
- **Counterplay:** CM: mana hurts it; keep out of Lunge line, cast in Kneel recovery. SM: cast; the blade is useless unless spirit-forged. VB: pull it into dead ground (it follows two steps past the barrow edge, tune) and cut at half rate; after a spirit-forged blade, a fair duel. VF: Spirit Palm only; before that, leave.

#### B-13 The Drowned (tune) — Band: Adp

- **Look:** a shoal of pale shapes that resolve into one drowned figure when they rise from the water; water element, its body is the surface.
- **Habitat:** ocean and flooded Drift states only (11.12), under boats and bridges. Appears with rain fronts in flooded lowlands.
- **Behavior:** ambush from below. It cannot leave water deeper than knee height, so the fight is about where you stand.
- **Role mechanic:** Phase. Water native: its hits apply Soaked (tune: 20% heavier Thirst drain for 2 in-game hours, survival-only; and the rain rule: your fire spells are weaker near it, 10.5 interpretation).

| Action | Class | Ech | S / A / R (ms) | Dmg | Hitbox |
|---|---|---|---|---|---|
| Undertow | G | 2 | 620 / 150 / 900 (whiff) | 10%, then Blood drain while held under (tune: 2%/s, 2s) | circle 3 st on the surface |
| Spray Torrent (casts e2_torrent, C-11) | B | 2 | spell's own (700 -> 450 / 800 beam / 500) | spell's own (4 x 4) | the Torrent beam, fired up through the surface |
| Surge | U | 2 | 720 / 200 / 1000 | 12% + knockback into water | half-ring 6 st from the water's edge |

skill_notes:
- **Undertow.** Mix-up: the blue chevron circle appears under a shallows crossing that you have already stepped onto. Counter: Grab; a Dash across the circle beats it (i-frames), and a hit on the circle during startup dispels the pull.
- **Spray Torrent.** Mix-up: it casts from under a boat so the beam comes up through the deck and sweeps at Torrent's 45 degrees/s. Counter: it is the C-11 Torrent, a Breaker beam: never parry it; side-dash out of the turn, clash it with an E2 for the Last Word, or Spellcut it. It is the water E2 Suffering source.
- **Surge.** Mix-up: Surge pushes you off a bridge into Undertow's circle. Counter: Dash *along* the bridge, not away from the edge; the half-ring is thin.

- **Drops:** nothing edible, sea salt (18.7, found around it rather than on it), drowned glass (glyph material, water), Tome fragment (water family), Mana Crystals (tune: 30% chance of 1 to 2).
- **Teaches:** Range catalyst "land a hit at maximum distance while flying" is natural here (a flooded state, a flier over water). Water E2 Suffering source. Foraging lesson: the fish it stirs up are safe; the pale weed it leaves is not.
- **Counterplay:** CM: fly or stand on a bridge; cast down; never stand in shallows. SM: a Sword Mage on a boat casts; the blade is useless. VB/VF: cannot hurt it; cross by boat, or wait for the state to end. This is the one Phantom with no Dead Zone trick; flooded states have no dead ground. Intentional: some routes exist only for mages (11.12 flight and climb parity).

### 1.4 Volatile Flora and Slimes (contact damage)

#### B-14 Blister Pod (tune) — Band: Awk

- **Look:** a waist-high seed pod with a wet orange seam that swells when something warm is near.
- **Habitat:** overgrown states and Bleed Zone undergrowth, in clusters of 5 to 12. Looks exactly like the edible Marsh Gourd until Foraging is trained.
- **Behavior:** stationary. Swells on approach (the tell), bursts on touch or when a pod next to it bursts (chain).
- **Role mechanic:** Contact. Chain-bursting is the hazard; the clusters are a spacing puzzle.

| Action | Class | Ech | S / A / R (ms) | Dmg | Hitbox |
|---|---|---|---|---|---|
| Swell-Burst | U | 1 | 450 / 100 / - | 6% | radius 3 st |
| Spit | P | 1 | 350 / proj / 600 | 3% + Stung (vision edge blur 3s, survival-only) | projectile, E1 speed tier |

skill_notes:
- **Swell-Burst.** Mix-up: one pod's burst swells its neighbors, so the chain crosses the path you were about to take. Counter: burst the far pod first with any ranged hit, and the chain runs away from you.
- **Spit.** Mix-up: a pod spits at a player standing still long enough to forage next to it. Counter: parry it (a plain Parryable E1 projectile at the C-08a E1 speed tier, not a table spell) or forage from the other side.

- **Drops:** blister gel (pickling agent, Sharp tag), seed-fat (Fat tag, edible when rendered, learnable), Mana Crystals none.
- **Teaches:** Foraging (the identification stat) is written for this plant. Range for a mage popping a whole cluster from distance.
- **Counterplay:** CM: pop from range, one cheap E1 at the far end. SM: Slash wave from range, same idea. VB/VF: a thrown weapon (Blade) or a tossed rock (anyone) pops them; a Fist walks the gaps and takes nothing if spacing is read. Contact ignores Guard, so never Guard through a cluster.

#### B-15 Sap Ooze (tune) — Band: Awk/App

- **Look:** a translucent amber slime the size of a dog that leaves a glossy trail; it splits into two when struck hard, each half smaller and faster.
- **Habitat:** overgrown states, cavern floors, Bleed Zones; drawn to leyline sap. Groups of 2 to 4.
- **Behavior:** slow, relentless, follows trails of its own sap. Splits on heavy hits, merges when halves touch. Dissolves in cold (frozen states have none).

| Action | Class | Ech | S / A / R (ms) | Dmg | Hitbox |
|---|---|---|---|---|---|
| Engulf | G | 1 | 560 / 150 / 700 (whiff) | 4%, then contact ticks while held (3 ticks) | capsule 3 st |
| Lash | P | 1 | 330 / 100 / 450 | 4% | whip 5 st |
| Trail | contact | 1 | - / persistent 10s / - | 3% per 0.5s standing in it | the trail, 1 st wide |
| Split | - | - | triggered by any hit >= 8% | - | spawns two halves |

skill_notes:
- **Engulf.** Mix-up: a half you ignored Engulfs you from behind while you fight the other. Counter: hit it in startup; Fists excel. Never let halves merge behind you.
- **Lash.** Mix-up: Lash from inside its own Trail, so your Tempo step-in puts you on acid. Counter: parry and Step *back*, not in; or burn the Trail first (fire ignites sap, cosmetic destruction).
- **Trail.** Mix-up: the Trail is laid across the only dry path in a flooded cavern. Counter: Dash i-frames cross it; or wait, it evaporates in 10s. Contact ignores Guard.
- **Split.** Mix-up: a mage's E2 makes two enemies out of one, and the halves are faster. Counter: E1 hits do not split it; many small hits beat one big one. This is the Efficiency teacher: cheap spells win here.

- **Drops:** sap gel (pickling agent, Sweet tag), amber bead (glyph material, common), Mana Crystals (tune: 10% chance of 1).
- **Teaches:** Efficiency (fight it with cheap spells). Footwork (dodging through Lash's active hitbox, 5.19.4).
- **Counterplay:** CM: E1 chip from range, never E2; kite along dry ground. SM: Slash waves (E1) do not split it; cut gently. VB: Strikes, not Techniques (Techniques are E2 and split it). VF: Strikes and throws; a thrown half that lands in water dissolves (tune: slimes take damage in deep water).

#### B-16 Lantern Nettle (tune) — Band: App

- **Look:** a mobile vine-knot that walks on its roots and carries a glowing seed-lantern that looks like a lit campfire from a distance.
- **Habitat:** Bleed Zones at night, overgrown states. The deceptive flora of 11.5 with legs: it imitates a campfire to draw the hungry.
- **Behavior:** stands still as a lantern until approached within 10 st, then lashes. Flees toward the Bleed Zone's heart when below a third of its mass.

| Action | Class | Ech | S / A / R (ms) | Dmg | Hitbox |
|---|---|---|---|---|---|
| Vine Lash | P | 1 | 340 / 100 / 480 | 5% + Stung | whip 7 st |
| Root Snare | G | 1 | 550 / 150 / 700 (whiff) | 3%, roots you for 1.5s (Step/Dash disabled; parry and cast still allowed) | circle 2 st at your feet |
| Lantern Burst | U | 2 | 700 / 150 / 900 | 10% + Stung | radius 5 st |

skill_notes:
- **Vine Lash.** Mix-up: it lashes from 7 st, outside what looks like its reach, at the player walking toward the "campfire". Counter: parry; a parried Nettle drops its lantern for 2s and shows what it is.
- **Root Snare.** Mix-up: Snare, then Lantern Burst while you are rooted. Counter: the Snare circle appears under you 550ms out: Dash off it. If rooted, you can still parry and cast, so a rooted mage Blocks the Burst (Unparryable but blockable): it is a heavy E2 hit (C-05a), so expect a Reel and a little chip, but no Guard Break unless a second heavy hit follows, and the Nettle has none.
- **Lantern Burst.** Mix-up: used as a flee cover; the Burst comes as it turns to run. Counter: Unparryable: walk out of 5 st; the 900ms recovery is a free hit on a fleeing plant.

- **Drops:** nettle acid (pickling agent, Bitter tag; also the overworld's learnable poison source, 18.14), lantern seed (a glowing cosmetic hearth fuel), Mana Crystals (tune: 20% chance of 1).
- **Teaches:** Foraging and Palate (the lantern seed is Bitter beneath). Footwork catalyst "dodge three Unparryable attacks in one fight" fits a Nettle pair.
- **Counterplay:** CM: range, as Section 14 says. SM: Slash waves at 7 st outrange the Lash. VB: Spellcut is irrelevant; Guard does nothing against contact; parry the Lash, Step the Snare, Technique in Burst recovery. VF: the Snare disables Step; a Fist must read the circle or eat the Burst; the fastest Strike in the game breaks the Snare's startup.

### 1.5 Spellcasters (every spell has a PvE source)

#### B-17 Driftwalker (tune) — Band: App to Adp by variant

- **Look:** a human exile in weather-grey layers with a faction mark burned off their sleeve; their aura flickers because they stopped training Suppression when they left.
- **Habitat:** everywhere the Drift goes. Camps of 2 to 4 in ruin and grassland states; singletons in Bleed Zones. Factions of 11.11 each produce their own exiles, which is how the element and the spell list vary.
- **Behavior:** fights like a player of their band: zones with E1, commits E2 at mid range, Barriers when pressed, cancels (feint tax applies to them too), flees toward their camp at low mana. Driftwalkers **Contest**: they feed when they are winning the lock point and release when they are not.
- **Role mechanic:** Caster. Each Driftwalker variant has a `teaches` list of 2 to 3 spell ids; a camp covers 5 to 8 spells. The Driftwalker roster is **generated** from the spell table (B-20), so every E1 and E2 spell has one.

Kit (illustrative variant: Fire exile, App band):

| Action | Class | Ech | S / A / R (ms) | Dmg | Hitbox |
|---|---|---|---|---|---|
| Firebolt (e1_firebolt, C-11) | P | 1 | 320 -> 250 / 667 / 250 | 6 | sphere r 1.0 |
| Fireball (e2_fireball, C-11) | P (projectile), U (splash) | 2 | 600 -> 450 / 1250 / 450 | 14 direct, 8 splash | sphere r 2.0, splash r 6 |
| Barrier (e0_barrier, C-11) | defensive | 0 | C-07 timing | - | shell r 3.5 |
| Spark / Gust (e0_spark, e0_gust, C-11) | P / U | 0 | C-11 | 1 / 0 + knockback | C-11 |
| Knife | P | 1 | 300 / 80 / 450 | 3% | thrust 3 st |

skill_notes:
- **Firebolt.** Mix-up: a Driftwalker cancels a Firebolt (feint) to bait a parry whiff, paying 50% of the mana; they can afford it twice. Counter: a cancelled cast still shows its recovery; counter-hit the cancel.
- **Fireball.** Mix-up: Driftwalkers aim the Fireball at your feet so the detonation (Unparryable) hits even when the projectile is dodged. Counter: intercept the projectile with an E1 (or clash with an E2 for the Last Word) and detonate it far from you; the core skill of 4.8.
- **Barrier.** Mix-up: Barrier up as you commit a Breaker Technique, so your Technique drains them (1.5x) but you are in recovery. Counter: Breaker Techniques are the intended anti-turtle; alternate a Grab (ignores Barrier) with the Breaker.
- **Knife.** Mix-up: a Driftwalker who is out of mana draws a knife, and most players have never seen one fight with a knife. Counter: it is an E1 Strike with nothing behind it; a Hollow Driftwalker is a free kill, which is the Exhaustion lesson shown on someone else.

- **Drops:** travel rations (their own food: Plain band, safe, Hearty), a cheap Tome (rare: tune 3%, one of their `teaches` spells), glyph material of their element, Mana Crystals (tune: 70% chance of 1 to 3, paid from "their assets", which is why they carry them).
- **Teaches:** Learning by Suffering for every spell in their `teaches` list (E2 only if their Power Score is at or above yours, 5.20). Durability on Contest wins. Cast Speed catalyst "punish a parry against a stronger foe". Reading the Blow for Blades (their Knife).
- **Counterplay:** CM: a mirror match; the Driftwalker is the game's PvP tutor. SM: close through the volley; the Driftwalker backs up until it hits its camp. VB: Spellcut E1s on the way in; Breaker into Barrier; Grab when they turtle. VF: the Iron Palm catalyst "close from maximum range to a caster through a volley without being hit" is written against a Driftwalker camp.

#### B-18 Glyph Heron (tune) — Band: App

- **Look:** a wading bird twice a person's height whose feathers are inscribed with faint sigils; it stands in shallows and casts with its beak.
- **Habitat:** flooded and ocean Drift states, river mouths in grassland states; rain fronts. Flocks of 2 to 3 that keep their distance.
- **Behavior:** a kiting caster. Casts water E1 shards from range, an E2 Lance when you are at mid range, and lifts off (flight, grounding applies) when you close.

| Action | Class | Ech | S / A / R (ms) | Dmg | Hitbox |
|---|---|---|---|---|---|
| Tidebolt (e1_tidebolt, NEW, B-20a) | P | 1 | 300 -> 250 / 583 / 250 | 5 | sphere r 1.0 at the E1 tier |
| Torrent (e2_torrent, C-11) | B | 2 | 700 -> 450 / 800 beam / 500 | 4 ticks x 4 | capsule r 1, 50 st, 45 deg/s turn |
| Wing Buffet | U | 1 | 400 / 120 / 600 | 5% + knockback | arc 180 deg, 4 st |
| Lift | mobility (flight) | - | 500 / - / - | - | Grounding applies (4.10) |

skill_notes:
- **Tidebolt.** Mix-up: three Herons stagger bolts so a clash on one leaves two coming. Counter: Block the volley (E1 is never heavy and chips nothing, C-05a, C-04c); or close.
- **Torrent.** Mix-up: the beam is fired along the shallows you are wading through, where you move at reduced speed, and its 45 degrees/s sweep covers a slow wade. Counter: beams are beaten by a lateral dash or a clash (4.11 Law 5, C-11); Spellcut works on Breakers (4.12).
- **Wing Buffet.** Mix-up: Buffet knocks you back into the shallows the Torrent covers. Counter: Unparryable: Dash through it, or Block (E1: no chip, no Reel).
- **Lift.** Mix-up: it lifts over water where you cannot follow and resumes shards. Counter: Grounding: any E2 or Technique knocks it out of the air; a Fist Leaps and Grabs it (grabbing a flier grounds it, 4.10).

- **Drops:** Heron meat (Hearty, if a water front crossed, Cold), sigil feather (glyph material: Expansion), Tome fragment (water family, rare), Mana Crystals (tune: 30% chance of 1).
- **Teaches:** Water E1 and E2 by Suffering (with the Power Score rule for E2). Range for maximum-distance hits on a flier. Grounding practice for everyone before guards use nets (B-32).
- **Counterplay:** CM: clash the Torrent with an E2 for the Last Word; Tidebolts are chip. SM: Wind Slash does not ground it (E1); use an Ice Lance or a thrown blade Technique. VB: Spellcut the Torrent once you know a Technique (4.12, v3.1: before that a Blade's cut clashes at E1 and the gap rule loses to a Greater beam); heavy durability for an E2 cut, so the fight is a durability budget. VF: the hardest overworld kiter for a Fist; Leap-Grab is the answer and the lesson.

#### B-19 The Bound Archivist (tune) — Band: Mst

- **Look:** a desiccated mage fused into a reading chair of stone, its body ringed by orbiting pages; the chair is a construct, the mage is not.
- **Habitat:** Pressure Peaks rated E2 or E3 (11.3), the deepest room of Risen Ruins, Falling Star craters on a rare roll. One per server at a time.
- **Behavior:** a stationary E3 caster. Opens with E2 to test you, holds E3 for when you are committed. Cannot move; its chair turns. The room is the fight: cover, pillars, a Pressure field.
- **Role mechanic:** Caster. `teaches` holds **one** E3 id per Archivist, drawn from B-20a (rotates with the Drift state, so a server's Archivist teaches e3_sunfall this block and e3_cairnfall the next). This is one of the three distinct E3 sources the Suffering route needs (5.20).

| Action | Class | Ech | S / A / R (ms) | Dmg | Hitbox |
|---|---|---|---|---|---|
| Page Shards (e1_shard, e1_firebolt or e1_arc by block, C-11) | P | 1 | spell's own | spell band | spell's own |
| Chapter (e2_torrent, C-11, or e2_rimewall, NEW, B-20a) | B (beam) / U (wall) | 2 | spell's own | spell band | spell's own |
| Index (one of e3_sunfall, e3_shardstorm, e3_cairnfall, e3_unmaking by block; all NEW, B-20a) | P projectile, U area (4.7 default) | 3 | spell's own, startup >= 900, recovery >= 1500 (C-16), world-scale telegraph | 20-30 per band | spell's own |
| Turn | - | - | 600 / - / 400 | - | the chair rotates to face |

skill_notes:
- **Page Shards.** Mix-up: shards orbit before they fire, so the launch direction is not the orbit direction. Counter: Block; they are chip meant to drain mana before the Index.
- **Chapter.** Mix-up: a wall spell between you and the Archivist as the Index begins, so the parryable projectile is hidden until late. Counter: walls are E2 and break under E2 (destruction tier); or stand where the wall is not.
- **Index.** Mix-up: it casts the Index when you are mid-Contest with a Chapter, so your feed decision collides with an E3 telegraph. Counter: break off the Contest (Dash) and use the 900ms+ sky tell. Parrying the Index projectile costs mana (4.6); dodging the area is free. Surviving it grants full Insight for the E3 Suffering route.
- **Turn.** Mix-up: none; it is the Archivist's weakness. Counter: it turns in 600ms; a player who crosses behind it gets 400ms of its back, and it cannot Index while turning.

- **Drops:** Tome fragments (E3 family of the block; the Archivist is a **fragment source**, 5.20), a sealed grain jar nearby (ruin preserved ingredient, 18.7), rare glyph materials, Mana Crystals (tune: 3 to 6). Threat is high for everyone below Master, so the XP is real once.
- **Teaches:** E3 by Suffering (one of three sources). Pressure Tolerance (its room is a Pressure zone). Cast Speed and Durability catalysts at the "stronger foe" bar. Vowed characters: the room's Pressure is checked against their Body threshold, not Capacity (11.3, v3.1: an E2 rating asks for the Technique threshold, both gating attributes at Practiced, 5.19.6), so a Blade or Fist who meets it stands unpressured and one below it takes pressure at 50%; the Horizon Cut Art's test target is the Index.
- **Counterplay:** CM: a Contest and range duel at Master band; clash Chapters, dodge Index areas, parry Index projectiles only when the mana is there. SM: approach under pillars, cut the Shards, close during Turn. VB: unpressured once your Body meets the Peak's rating (11.3, v3.1), half rate below it; Spellcut E1 on the way in and E2 once you know a Technique (4.12, v3.1); Horizon Cut splits the Index if you have the Art. VF: the Pressure field is checked against the Body, not the circuit (11.3, v3.1), so a Fist with Techniques walks in unpressured; this is the one Master fight a Fist enters more easily than a mage, and the Index area is Stepped like any AoE, one Step per Index (Step budget, B-04).

#### B-20 Spellcaster coverage rule (tune)

5.20's PvE source rule is enforced by data, not by memory:

- Every row in the spell table (C-11 and its successors) gets a required field `pve_sources: [mob_id or npc_id or tome_id]`. A build with an empty field fails validation (the same spirit as 4.11 Law 6: a spell with no source does not ship).
- The Driftwalker roster (B-17) is **generated** from the table: for each element and echelon 1 to 2, a variant whose `teaches` covers the spells of that element and echelon, split across variants so no single mob teaches more than 3. New spell added, new variant generated, no hand work. On C-11 as it stands the generator yields: fire (e1_firebolt, e2_fireball, e0_spark), ice (e1_shard, e2_icelance, e0_frostmote), lightning (e1_arc), wind (e1_windslash, e0_gust), earth (e1_stonegrip), water (e2_torrent, plus e1_tidebolt once accepted), and every variant may carry e0_barrier and e0_manasense. Cantrips also have the Anchor-trainer source (5.20), so they are covered twice.
- Creatures cover the rest with C-11 ids where one exists: Glyph Heron and the Drowned cast e2_torrent; Gloamwing, the Archivist and the Watch cast C-11 E1s. Where no id exists the creature casts one of the seven proposed entries in B-20a, never a creature-only "spell".
- The E3 Suffering route needs three **distinct** sources (5.20). With B-20a accepted this proposal supplies seven E3 casters across zones (Walker and Anvilback: e3_cairnfall; Unburied and Likeness: e3_unmaking; Gloamwing: e3_shardstorm; the Archivist and the Marshal: rotating), so three are always reachable on any server. Distinct means distinct casters, so two casters of one spell both count.
- Guards (B-31) cast C-11 spells, so they are Suffering sources too; see Section 6 for the farm concern and the proposed reduced Insight rate.

#### B-20a Proposed new spell-table entries (for C-11's owner; the only place this document adds spells) (tune)

C-11 is the single owner of the spell table. The creatures above need seven entries it does not have. They are listed here once, in C-11's format and bands, and nowhere else; accept or reject each with the creature that casts it. None is needed for the combat sandbox (C-08 notes E3 is out of the sandbox anyway).

| id | Ech | Element | Class | startup_ms | active_ms | recovery_ms | Damage | Hitbox | Cast by |
|---|---|---|---|---|---|---|---|---|---|
| e1_tidebolt | 1 | water | Parryable | 300 -> 250 | 583 (70 st at 120 st/s) | 250 | 5 | sphere r 1.0 | Glyph Heron, water Driftwalkers, a water Likeness |
| e1_wick | 1 | void | Parryable | 360 -> 250 | 208 (25 st at 120 st/s) | 500 -> 200 floor | 5 + mana drain 3% of max (tune) | sphere r 1.0 | Candle Wraith, Snuffers, Spillers |
| e2_rimewall | 2 | ice | Unparryable (area) | 650 -> 450 | wall stands 4s; the raising edge is live 150ms | 450 | 10 on the raise; the wall is a tier-1 structure (breaks under any E2 or Technique, 13) | box 8 w x 4 h x 1 d at the aim point up to 20 st | Gloamwing, the Archivist, ice Driftwalkers |
| e3_sunfall | 3 | fire | P projectile + U area (4.7 default) | 1200 -> 900 | falling body at 40 st/s (C-08a); detonation on impact | 1500 (C-16 floor) | 24 direct; 20 in the area r 15 | sphere r 3; area r 15 | the Archivist, a fire-town Marshal; the Firebolt family's E3 (4.7) |
| e3_shardstorm | 3 | ice | Unparryable (area, drifting) | 1500 -> 900 | 400 | 1600 | 22 + Chill, once per target | cylinder r 16, drifts with the wind at 4 st/s | Gloamwing, the Archivist, an ice-town Marshal; the Shard family's E3 (4.7) |
| e3_cairnfall | 3 | earth | Unparryable (area) | 1250 -> 900 | 200 | 1500 | 24 (28 at Anvilback's scale, under the 35 cap) | cylinder r 10 (r 14 for Anvilback) | Cairn Walker, Anvilback, the Archivist, an earth-town Marshal |
| e3_unmaking | 3 | void | P projectile + U area | 1250 -> 900 | projectile at 40 st/s; detonation r 8 | 1500 | 24 direct + area; void is C-09 neutral, so no relation edge | sphere r 2; area r 8 (r 12 for the Unburied's Unburial) | the Unburied, the Likeness |

Each entry obeys the 4.7 bands (E1 3-8, E2 8-18, E3 20-30 under the 12/22/35 caps), the C-11 startup floors, the C-16 recovery floors, the C-08a speed tiers and C-08b hitbox shapes, and carries the standard C-11 cancel and Hold rules (no Hold on E3). Player versions of the E3s need the Capacity 800 threshold and the 40%-of-capacity cost rule (4.7); costs are left to C-11's owner.

Ids are functional, design-only strings (Appendix C allows functional terms players never see), on C-11's scheme: echelon prefix plus one plain word. As of this writing the combat sheet holds thirteen ids (e0_barrier, e0_spark, e0_gust, e0_frostmote, e0_manasense, e1_firebolt, e1_shard, e1_arc, e1_windslash, e1_stonegrip, e2_fireball, e2_icelance, e2_torrent) and none of the seven above collides. If the combat sheet's own naming pass renames an id, the creature rows here point at ids, so a one-line substitution follows. The display names Sunfall and Shardstorm are the 4.7 family names; the rest (Tidebolt, Wick, Rimewall, Cairnfall, Unmaking) are one plain word each, per Appendix C.

#### B-20b Status effects this document uses, against C-15 (tune)

C-15 fixes the hit reaction by echelon (E1 150ms flinch, E2 300ms stagger plus 4 st knockback and Grounding, E3 800ms knockdown). Every hit in this document applies its echelon's C-15 reaction automatically and this document never changes those values. The statuses below are **additive** to the reaction, never replace it, never touch a window or a telegraph (4.11 Law 1), and are never food-mitigated (18.10):

| Status | Effect | Source | Already in C-series? |
|---|---|---|---|
| Chill | -15% walk speed for 1.5s; Dash and Step unaffected | ice mobs, snow buff | yes, C-11 (Frostmote). Reused as is. |
| Soaked | survival only: Thirst drain +20% for 2 in-game hours; no combat effect | water mobs, rain buff | no. Proposed. |
| Burn | 1 HP per second for 3s; a status, so no hit cap, total per hit capped at 3; never stacks, refreshes | fire mobs, heatwave buff | no. Proposed. |
| Mana drain | a flat share of max mana per hit (tune: 3%; Grab holds up to 8-10%) | void mobs, void mist buff | no. Proposed. |
| Stung | survival only: vision edge blur for 3s (the 3.3 Thirst blur, borrowed) | Volatile Flora | no. Proposed. |
| Root | Step and Dash disabled for 1.5s; parry, Block, cast and Strike allowed | Lantern Nettle, nets, Grounding Chain, Weft threads (while standing on one) | no. Proposed. |
| Glut, Spent, half-manifest | mob-side states from B-04 | role mechanics | no. Mob data only. |

### 1.6 Pressure Peak ancient beasts

#### B-21a Anvilback (tune) — Band: Mst (Pressure rating E2 zone)

- **Look:** a six-legged beast the size of a hall whose back is a leyline knot grown into an anvil of black stone; mana weather forms over it.
- **Habitat:** an E2-rated Pressure Peak in a mountain region, fixed in the bones (11.3); its Pressure strength varies with the Drift state. One per region.
- **Behavior:** indifferent until struck; then a siege. It never leaves the Peak. Its back is a platform: climbing it (vowed route) or landing on it (mage route) is the only way to reach the knot, which is where it takes real damage.
- **Role mechanic:** Absorb on the legs and flanks (it eats mana like a mountain), none on the knot. Earth element. Its E3 is e3_cairnfall (B-20a), a Suffering source.

| Action | Class | Ech | S / A / R (ms) | Dmg | Hitbox |
|---|---|---|---|---|---|
| Leg Stamp | U | 2 | 800 / 150 / 1100 | 15% | radius 5 st per leg |
| Tail Sweep | B | 2 | 700 / 300 / 1000 | 16% | arc 270 deg, 12 st, 2 st high (Leap or fly over it) |
| Shrug | U | 1 | 500 / 200 / 800 | 6% + knock-off (anyone on its back) | the back |
| Anvil Fall (casts e3_cairnfall, B-20a, at the Peak's scale) | U (area) | 3 | 1400 / 250 / 1600 | 28% | radius 14 st around the Peak center |

skill_notes:
- **Leg Stamp.** Mix-up: six legs, and the sigil shows which, but two legs can Stamp 400ms apart. Counter: each sigil is 5 st; stay between legs, not under one.
- **Tail Sweep.** Mix-up: low and wide, it clips a climber on a leg. Counter: it is 2 st high: Leap over it (Footwork) or fly a hop; Breaker, so never Guard it.
- **Shrug.** Mix-up: it Shrugs the moment a climber reaches the knot. Counter: Shrug has a 500ms telegraph (shoulders roll); grab the knot (a climb hold) during the active frames, costing Strain, not position.
- **Anvil Fall.** Mix-up: the sky darkens over the Peak while you are on its back, where the area is centered. Counter: 1400ms; a climber drops off the far side, a flier lifts above 100ft (exponential drain, 11.10, a real cost). Surviving it is full Insight.

- **Drops:** the **rarest cuts** (Hearty, Resonant, Earth-touched: a unique tag the cooking proposal may name), anvil stone (weapon material, top durability), leyline knot shard (glyph material, rarest), Tome fragment (earth family), Mana Crystals (tune: 6 to 10). A Peak beast's drop table is shared with the Peak itself: it guards the ingredients (18.7).
- **Teaches:** Pressure Tolerance (standing on the Peak). E3 Suffering source. Rite solo Trial site (5.20): the Trial is at this Peak. Conditioning for Fists at Mastered (the knot is the hardest soft target in the world: no Hardness, maximal Threat).
- **Counterplay:** CM: the knot is reachable by flight, which the Pressure field punishes; a mage pays mana to breathe here, so the fight is an Efficiency exam. SM: climb or fly; the knot takes the blade well. VB/VF: an E2-rated Peak checks the Body against the Technique threshold (11.3, v3.1), so a vowed character with Techniques climbs unpressured and one without takes half; climbing is their route; this is a vowed showcase at Master band, intended (7.3).

#### B-21b Gloamwing (tune) — Band: Mst (Pressure rating E3 zone)

- **Look:** a moth the size of a chapel, wings of frost-dust, resting folded on a cold Pressure Peak; the dust it sheds is the snow.
- **Habitat:** an E3-rated Pressure Peak in a frozen region; a snow front follows wherever it has flown (11.7). Fixed in the bones.
- **Behavior:** sleeps. Wakes when the Peak is entered. Flies in slow circuits above the Peak and lands to attack; on the ground it is slow and the fight is fair, in the air it casts.
- **Role mechanic:** Caster (ice E1 from C-11; ice E2 wall and E3 storm proposed in B-20a). Ice: its hits apply Chill exactly as C-11 defines it for Frostmote (-15% walk speed for 1.5s; Dash and Step unaffected). Warmth meals never touch it (18.10): it is a combat status, never food-mitigated.

| Action | Class | Ech | S / A / R (ms) | Dmg | Hitbox |
|---|---|---|---|---|---|
| Frost Shards (e1_shard, C-11) | P | 1 | 280 -> 250 / 583 / 200 | 4 | capsule r 0.5 |
| Rime Wall (e2_rimewall, NEW, B-20a) | U | 2 | spell's own | spell band | spell's own |
| Wing Fall | U | 2 | 750 / 200 / 1200 (grounded) | 14% + Chill | ring 8 st where it lands |
| Gloaming (e3_shardstorm, NEW, B-20a) | U (area) | 3 | 1500 / 400 / 1600 | 22% + Chill | radius 16 st, drifting with the wind |

skill_notes:
- **Frost Shards.** Mix-up: Shards from the air come steeply, so "sidestep" means stepping out of a column. Counter: Block (chip is small) or clash.
- **Rime Wall.** Mix-up: a Wall between you and the only windbreak as the Gloaming starts. Counter: Walls break under E2 or a Technique (destruction tier).
- **Wing Fall.** Mix-up: it lands where you are, not where it was; the shadow is the tell. Counter: Unparryable ring: Dash out, then it is grounded for 1200ms, which is the only melee window and the only Grounding-free time.
- **Gloaming.** Mix-up: the storm drifts with the wind, so a safe spot stops being safe. Counter: 1500ms sky tell plus the wind direction (snow blows toward where it will drift). Full Insight if survived.

- **Drops:** frost-dust (Cold tag ingredient, the Cold-Front Broth's rare upgrade), wing glass (glyph material, ice), Tome fragment (ice family), rarest cuts (Cold, Resonant), Mana Crystals (tune: 6 to 10).
- **Teaches:** E3 Suffering source. Altitude Tolerance (a flier chasing it near the 100ft line). Pressure Tolerance at the E3 rating: only mages at Capacity 800 and vowed characters whose Body meets the Art threshold (both gating attributes Honed, 5.19.6 v3.1) stand here unpressured; vowed below it take half (11.3, v3.1), mages below it are crushed. Rite solo Trial alternative site.
- **Counterplay:** CM: a Grounding fight: an E2 into the moth knocks it down (4.10), and then it is a slow ground target for 1200ms; the storm is dodged by reading wind. SM: Lances to ground it, blade on the ground. VB: thrown blade Technique to ground it; Spellcut the Shards. VF: Leap-Grab grounds it from a pillar; before that, read the wind and wait for Wing Fall.

---

## 2. Aether Horrors (built to 4.9)

Rules shared by every Horror in this section:

- **No immunities, no weaknesses, no resistances** (10.1, B-04). Physical and magical damage land at the same rate.
- **Fight shape:** the first two attacks of every encounter use baseline timing, no hold, no feint, whatever the roll (4.9). Escalation follows in the phases listed.
- **Per-server parameters** are listed per Horror as the subset it uses, with the ranges it is allowed. The speed multiplier is global (0.8x to 1.3x) and applies as in B-01. Hidden difficulty scaling moves the Horror within its rolled ranges (never outside them, never below floors, never into HP or damage).
- **Elemental variants** come only from the Elementals mutation or weather (10.5, 10.6) and are strengths only: snow adds Chill (C-11's definition), rain adds Soaked and the C-09 ring's 1.1 edge for water (over fire) and lightning (over water) in clashes, heatwave adds Burn (tune: 1 HP per second for 3s, a status under no hit cap, total per hit capped at 3), void mist adds mana drain on hit (tune: 3% of max per hit; void itself is neutral in the C-09 ring, so the drain is the whole buff). Statuses are collected in B-20b. Element never changes a class marker (B-02, C-10c).
- **Recovery is not rolled.** Per B-01, the speed roll scales startup only; the R column is the same on every server and sits at or above the C-16 floor for its echelon. The 4.11 v3.1 rolling cap (90% of max Health per 4s from one attacker) binds every Horror as well.
- **Every Horror is damageable by every kit** (B-04), so the v3.1 Alone rule (10.7: never draw a mob the character cannot damage) never removes any of B-22 to B-29 from a pool. The Likeness changes its own kit for a vowed player (B-29) rather than leaving.
- **Step budget** (B-04, 3.4 v3.1): no phase below asks a vowed player for more than two Steps in 2s; where Unparryables come faster, position or Guard is the intended answer and the kit says so.
- **Drops:** Tome fragments, relic materials (enchanter-grade glyph bases), Mana Crystals. Nothing edible leaves the Aether (18.7). Killing a Horror type a set number of times across a lineage earns the "Bane of" Epithet (5.22).
- **Hitbox columns** are the server hitbox; the visual matches.

### B-22 The Mourner (tune) — suited to Alone duels

- **Concept:** a veiled, long-limbed figure whose forearms end in bone blades; it fights like a fencer who grieves. Its whole kit is a parry conversation: four Parryables with different rhythms, one Breaker that punishes a Block habit, one Grab that punishes a parry habit. It carries no AoE, so an Alone player is never asked to do anything but read.
- **Terrain:** Infinite Plane, Variable, Grey Marble streets. It walks toward you; it never runs.

| Action | Class | Ech | Startup base (at 1.3x) | A | R | Dmg | Hitbox |
|---|---|---|---|---|---|---|---|
| Veil Cut | P | 1 | 360 (277) | 100 | 480 | 6% | arc 100 deg, 5 st |
| Second Grief | P | 1 | 340 (262), chained from Veil Cut | 100 | 520 | 5% | arc 100 deg, opposite side |
| Long Sorrow | P | 2 | 620 (477) | 140 | 800 | 12% | thrust 7 st |
| Bow | B | 2 | 660 (508) | 160 | 900 | 14% | overhead line 1.5 x 5 st |
| Embrace | G | 2 | 600 (462) | 150 | 900 whiff | 13% + the held player's mana drains 5% over the hold (tune) | capsule 3 st |
| Veil Feint | feint (from Veil Cut or Long Sorrow) | - | cancels at Feint_Window | - | 350 whiff | - | - |

skill_notes:
- **Veil Cut.** Mix-up: Veil Cut into Second Grief is a two-beat string whose gap (`chain_delay`, 150 to 450ms per server roll) is the thing you must learn in this Aether. Counter: parry the first and the second is cancelled by Tempo; or Block both (two E1s do not Reel).
- **Second Grief.** Mix-up: comes from the opposite side, so a player who turns with the first cut is turned the wrong way for the second. Counter: do not turn; the camera matters less than the "tink".
- **Long Sorrow.** Mix-up: the thrust starts like Veil Cut for 200ms and then extends; it reaches the spacing where Veil Cut would miss, so backing off from the cut puts you in the thrust. Counter: sidestep rather than retreat; the thrust has a 800ms recovery with the arm fully extended, the duel's main counter-hit window.
- **Bow.** Mix-up: Bow starts from the same shoulder drop as Long Sorrow, with the vermillion cracked ring and a falling weight; it exists to punish players who have started Blocking the Sorrow. Counter: Breaker: sidestep. It is the Mourner's slowest attack by design.
- **Embrace.** Mix-up: Embrace is used after the Mourner has been parried twice in a row, as the answer to a parry habit; the blue chevrons on opening arms and the inhale are the cue. Counter: any hit in 600ms of startup; or Dash. Never parry on rhythm after two successes.
- **Veil Feint.** Mix-up: the feint sells the Veil Cut up to the last 120ms and then withdraws, leaving a parry-whiffer in 400ms of Parry Recovery with Long Sorrow coming. Counter: the whiff is a 350ms visible recovery; a counter-hit there is the duel's second best window. Never feinted on the first two attacks.

- **Variation parameters used:** speed multiplier (0.8 to 1.3 global); `chain_delay` 150 to 450ms; hold on Long Sorrow and Bow 0 to 500ms; feint probability on Veil Cut and Long Sorrow 0 to 35%; mix ratio is fixed at 4 Parryable : 1 Breaker : 1 Grab (its identity is a parry duel; the roll shifts *which* parryable and *when*, not the ratio).
- **Phases:** Phase 1 (full to two-thirds): Veil Cut strings and Long Sorrow at baseline, no feints, no Embrace. Phase 2 (two-thirds to one-third): feints enabled, Bow enters, holds enabled. Phase 3 (last third): Embrace enters, `chain_delay` re-rolls once (it changes its rhythm when wounded, a fair "it learned you" moment, announced by the veil tearing).
- **Fair tell:** the Mourner always *looks at the limb it will use* 100ms before Telegraph_Start, so a watchful player gets a free beat; this is its personality, not an exploit, because the feint uses the same look.
- **Elemental variants:** heatwave (bone blades smolder: Burn on hit); void mist (Embrace drains more: tune 8%); snow (Chill on Long Sorrow, so the sidestep gets harder, which is why Alone instances in snow are the hardest Mourners).
- **Hidden scaling levers:** feint probability up to its cap, hold variance to its cap, `chain_delay` toward the extremes. Never Embrace frequency above one per 20s (tune), so Grab stays a punish, not a pattern.

### B-23 The Choir (tune) — suited to group play

- **Concept:** not a body but a congregation: dozens of grey hands grow from the ground in a 20 st ring and sing. The Horror is the ring. Its attacks come from different places in the ring, so a group must call positions, and its Grabs pull a player toward the center where the Hymn is loudest.
- **Terrain:** Caverns, Remnant plazas, Convergence arenas. It cannot move; the arena is the fight, and both exits (10.13) are outside the ring.

| Action | Class | Ech | Startup base (at 1.3x) | A | R | Dmg | Hitbox |
|---|---|---|---|---|---|---|---|
| Reach | P | 1 | 340 (262) | 100 | 500 | 5% | a hand's cone, 4 st, from any ring point |
| Clasp | G | 2 | 620 (477) | 150 | 900 whiff | 11% + pull 6 st toward center | capsule 3 st at a ring point |
| Procession | U | 2 | 720 (554) | 200 (moving) | 1000 | 12% | a wave of hands rolling across one quarter of the ring |
| Hymn | U | 3 | 1300 (1000) | 300 | 1600 | 24% at center, 0% outside 8 st | radius 8 st from center, sigil on the floor |
| Cantor | P | 2 | 640 (492) | 140 | 800 | 13% | one large hand from the center, thrust 8 st |

skill_notes:
- **Reach.** Mix-up: two Reaches from different ring points at once split a group's parries; a solo player gets one at a time (the Choir counts players). Counter: parry; a parried hand withers for 5s (tune), and a group that parries around the ring thins it.
- **Clasp.** Mix-up: a Clasp pulls a parrying player into the Hymn's center as the sigil begins. Counter: Grab: hit the hand during startup (allies can do this for each other, the Company play), or Dash. Pulled players can still Dash out of the center during the Hymn's 1300ms.
- **Procession.** Mix-up: the wave rolls across one quarter; the quarter is chosen as the one with the most players, which herds a stacked group apart. Counter: cross the wave's line (Dash through, 150ms i-frames beat the 200ms active only with a late Slip), or stand in another quarter; the quarter fills with yellow hatching 720ms out.
- **Hymn.** Mix-up: Hymn after Clasp (above). Counter: 8 st from center is safe; the Hymn's 1600ms recovery withers the center hand, which is the group's damage window on the Cantor.
- **Cantor.** Mix-up: the central hand thrusts at whoever is closest to the center, usually the player who just escaped a Clasp. Counter: parryable E2; parry it for a large Tempo on the whole Choir (all hands pause 300ms, tune).

- **Variation parameters used:** speed multiplier; mix ratio Parryable:Unparryable rolls between 3:1 and 1:1 (shifting how much of the fight is Reach versus Procession); hold on Clasp 0 to 600ms; feint probability on Reach only, 0 to 25%; `ring_points_active` 6 to 12 (how many hands can act at once, scales with players present, capped per player count so a solo player never faces more than 2 simultaneous actions).
- **Phases:** Phase 1: Reach and Clasp from the ring only. Phase 2 (after a third of the hands have withered): Procession enters, Cantor rises. Phase 3 (last third): Hymn enters, every surviving Hymn re-grows two withered hands (so a group must *kill* the center, not wait).
- **Fair tell:** every hand that will act straightens its fingers and the song gains a voice; the Choir's volume is a literal count of how many attacks are coming in the next second.
- **Elemental variants:** rain (hands slick: Clasp pull 8 st, Soaked); void mist (Hymn drains mana at the center instead of extra damage); snow (Procession leaves rime: Chill on the quarter for 3s).
- **Group design note:** the Choir pays risk-weighted contribution (5.6) to the player who parries hands aimed at others and to Clasp-breakers, so a group that protects each other earns; a group that stacks and burns the center eats Processions. Under the v3.1 Unaided rule (5.5) a Clasp broken by a stronger ally outside your Peer Band is control and voids your catalyst for that fight, so Company play is for peers; and under the v3.1 tagging rule (5.2) a stranger who lands one Reach parry and leaves (under 20% contribution) neither earns from the Choir nor lowers your Threat.
- **Step budget:** Procession and Clasp can arrive inside 2s of each other in Phase 2. The vowed answer is to stand in a quarter that is not lit and let the Clasp come to a parry, not to Step both (B-04 Step budget).

### B-24 The Hinge (tune) — suited to Alone or small groups, vertical terrain

- **Concept:** a creature folded out of flat planes, like a paper figure that forgot which way is up. It fights with Breakers and uses the vertical space of pillars to appear above or below you. Its gimmick is honest: it can only unfold *along a wall or pillar face*, so where it will come from is readable from the geometry.
- **Terrain:** Pillar Forest, the Strata, the Deep Strata. Never on open plains.

| Action | Class | Ech | Startup base (at 1.3x) | A | R | Dmg | Hitbox |
|---|---|---|---|---|---|---|---|
| Crease | P | 1 | 350 (269) | 100 | 480 | 6% | edge, 5 st |
| Snap Shut | B | 2 | 640 (492) | 150 | 850 | 15% | two planes closing on a 3 x 3 st cell |
| Unfold | mobility | - | 450 (346) | - | 500 | - | relocates along the nearest pillar face up to 15 st |
| Drop Edge | B | 2 | 700 (538) | 150 | 950 | 16% | vertical line from above, 1.5 x 8 st |
| Paper Storm | U | 2 | 760 (585) | 200 | 1000 | 10% | ring 6 st, knockback *toward the pillar edge* (fall risk) |

skill_notes:
- **Crease.** Mix-up: Crease from a wall face at head height while you look down at the drop. Counter: parry on the "tink"; Tempo pins the Hinge to the face for 500ms (it cannot Unfold during Tempo, tune), which is the window.
- **Snap Shut.** Mix-up: the two planes close from both sides, so a sidestep *into* a plane is a hit; you must step out of the cell, not across it. Counter: Breaker: the cell is marked by a vermillion cracked ring on both planes 640ms out; step along the pillar, not away from it.
- **Unfold.** Mix-up: it unfolds *below* you, and its next attack comes up through the ledge. Counter: Unfold's 500ms recovery is the Hinge's largest unguarded window; a player who tracks the paper-sound along the pillar punishes the arrival.
- **Drop Edge.** Mix-up: from above, the Breaker falls where you stood when the startup began; it cannot track. Counter: move at all; it is a lesson in not standing still on ledges.
- **Paper Storm.** Mix-up: knockback toward the edge of a Void Pocket island; the Storm itself is 10%, the fall is death. Counter: Unparryable: Dash out of 6 st toward the pillar (center), never away. Blocking it is a heavy hit (C-05a): a Reel with its 6 st knockback (C-05b), survivable only with your back already to the pillar.

- **Variation parameters used:** speed multiplier; hold on Snap Shut and Drop Edge 0 to 500ms; feint probability on Crease and Snap Shut 0 to 30% (a feinted Snap Shut is the Hinge's signature); mix ratio Breaker:Parryable rolls 1:2 to 2:1; `unfold_frequency` low/medium/high.
- **Phases:** Phase 1: Crease and Snap Shut on one pillar face. Phase 2 (two-thirds): Unfold enters; it uses two faces. Phase 3 (one-third): Drop Edge and Paper Storm enter; it uses the vertical.
- **Fair tell:** it crackles like paper for the whole of any startup, and the sound is directional and louder than any ambient; players with headphones learn to fight it by ear. The vermillion ring of a Breaker shows *through* the plane it will strike with.
- **Elemental variants:** rain (planes slick: Paper Storm knockback +2 st, Soaked); heatwave (edges smolder: Burn on Crease); snow (Chill on Snap Shut, making the step-out tighter).
- **Fair Danger note:** Paper Storm's knockback, and the Reel knockback from Blocking it, stop at a lethal edge's mist lip (Section 6, item 17): no single hit carries a player over an edge. A fall death must trace to a positioning decision, not a single hit.

### B-25 Lantern-Eater (tune) — suited to Alone, Fog Realm ambushes

- **Concept:** a thing that eats light. In the fog you see your campfire, your spell glow, your friend's aura, and then you do not. It is a Grab-heavy ambusher whose whole kit is about taking your sight, so the fair tell is sound and the class cue's *afterimage*: every cue it gives burns into the fog for the full telegraph.
- **Terrain:** Fog Realm, the Mirrorfog, Caverns with low light. It is slow in the open and fast in fog.

| Action | Class | Ech | Startup base (at 1.3x) | A | R | Dmg | Hitbox |
|---|---|---|---|---|---|---|---|
| Gulp | G | 2 | 620 (477) | 150 | 950 whiff | 12%; while held, your spell VFX and aura are invisible to you for 4s after (tune) | capsule 4 st |
| Dim | P | 1 | 380 (292) | 100 | 500 | 5% + extinguishes any lit source within 6 st (campfire, lantern) | arc 120 deg, 5 st |
| Swallow | U | 2 | 800 (615) | 200 | 1100 | 9% + fog thickens around you for 5s (visibility 15 st) | radius 7 st |
| Blind Lunge | B | 2 | 680 (523) | 150 | 900 | 14% | line 2 x 10 st, from outside visibility |

skill_notes:
- **Gulp.** Mix-up: Gulp comes right after a Dim takes your light, so the blue open-maw chevrons and the inhale are your only cue, and the marker burns in the fog for the full 620ms. Counter: Grab: hit it or Dash; the hit does not need to be aimed well, the maw is 4 st wide.
- **Dim.** Mix-up: it Dims your campfire, so a player cooking in the Aether (18.12) fights in the dark. Counter: parry; a parried Lantern-Eater *re-lights* what it ate (Tempo makes it cough light), which is the fairest thing in the fog.
- **Swallow.** Mix-up: the thickened fog shrinks what you can see of the next telegraph's body language, but never the class cue, which is drawn at full brightness. Counter: Unparryable: Dash out of 7 st. Blocking it is a heavy hit (C-05a): a Reel and 6 st of knockback toward whatever the fog is hiding behind you, so Block only when you know your back is clear.
- **Blind Lunge.** Mix-up: starts outside visibility; only the vermillion cracked ring and the "thud-CRACK" reach you, with the body invisible. Counter: the ring shows the *line*; sidestep the line. The Lunge has a 900ms recovery in which it is in your face and fully visible.

- **Variation parameters used:** speed multiplier; hold on Gulp 0 to 600ms (the longest hold in the Aether; a Gulp that waits is its signature); feint probability on Dim 0 to 25%; mix ratio Grab:Parryable rolls 1:2 to 1:1; `ambush_distance` 12 to 25 st (how far out of visibility it starts a Lunge).
- **Phases:** Phase 1: Dim and Lunge. Phase 2 (two-thirds): Gulp enters. Phase 3 (one-third): Swallow enters; it alternates Swallow and Gulp to make the fog fight the player.
- **Fair tell:** every class cue is drawn as a light that the fog cannot hide (it is the one light it does not eat), and its breathing is a wet, close sound that gets louder as it approaches. The Lantern-Eater may hide its body. It can never hide its intent.
- **Elemental variants:** void mist (the natural pairing; Gulp drains mana 10% over the hold); rain (Blind Lunge +3 st, Soaked); heatwave (its hits Burn, and a Burn is light: a Burned player can see the Eater for the Burn's duration, a strength that gives something back, which is allowed).

### B-26 The Unformed (tune) — suited to group play, open terrain

- **Concept:** a giant that never finished forming, blind, feeling for you with limbs that are mostly Unparryable. Its kit is slow and enormous and asks groups a spacing question, with the floor's edge as the real threat on Void Pockets. It carries the Aether's heaviest E3 slam.
- **Terrain:** Infinite Plane, Void Pockets, Mountainous flats, the Convergence's largest arena.

| Action | Class | Ech | Startup base (at 1.3x) | A | R | Dmg | Hitbox |
|---|---|---|---|---|---|---|---|
| Feel | P | 2 | 620 (477) | 200 (sweeping) | 800 | 11% | arc 180 deg, 10 st, 1.5 st high (Leap or fly over it) |
| Palm | U | 2 | 780 (600) | 150 | 1100 | 17% | circle 6 st |
| Haul | G | 2 | 640 (492) | 200 | 1000 whiff | 14%, then thrown 8 st (toward the nearest edge if one is within 12 st, tune: capped so a throw never crosses the edge) | capsule 5 st |
| Collapse | U | 3 | 1400 (1077) | 250 | 1600 | 26% | ring 14 st, knockback 4 st outward |
| Groan | - (reposition) | - | 900 | - | 600 | - | it turns to face the loudest player (most mana spent in the last 3s) |

skill_notes:
- **Feel.** Mix-up: Feel sweeps toward the player who just Dashed (it tracks air moved). Counter: parryable E2; a parry stops the sweep and the Unformed recoils (Tempo); or Leap over it (1.5 st).
- **Palm.** Mix-up: Palm lands on a player standing still to cast an E2; its 780ms is just longer than most E2 startups, so casting at it from inside 6 st is the trap. Counter: cast from 7 st or cast E1s. Unparryable: Dash out.
- **Haul.** Mix-up: Haul grabs the player in Parry Recovery after a whiffed Feel parry. Counter: hit it in startup (a group's job: allies break Hauls); the throw is capped to never cross an edge, so a Haul is damage and position, not death.
- **Collapse.** Mix-up: the Unformed Groans toward the loudest caster and then Falls, so the group's heaviest mage is the ring's center. Counter: 1400ms and a sky-scale tell; everyone leaves 14 st; the 1600ms recovery is the group's burst window. On Void Pockets, the 4 st knockback is the real danger: never stand between the Unformed and an edge when the sky darkens.
- **Groan.** Mix-up: the aggro rule is readable and exploitable: a cheap caster can pull it off a friend. Counter: none needed; it is the group's tool, and it tells the group who it is hunting. Drawing its aggro is control under the v3.1 Unaided rule (5.5): a stronger non-peer who pulls it off you voids your catalyst, a peer does not.

- **Variation parameters used:** speed multiplier (its 0.8x roll is the slowest fight in the Aether and the 1.3x roll is still the most readable, by design); hold on Palm 0 to 600ms; mix ratio Unparryable:Parryable 2:1 to 3:1; feints never (it is blind; it does not bluff). Hidden scaling raises hold variance and Palm share only.
- **Phases:** Phase 1: Feel and Palm. Phase 2 (two-thirds): Haul enters and Groan starts tracking. Phase 3 (one-third): Collapse enters, used at most once per 25s (tune).
- **Fair tell:** it is blind, so every attack is preceded by its head turning toward the sound it will strike at; and its unformed body creaks for the whole startup like ice under weight.
- **Elemental variants:** snow (Chill on Feel, which makes the Leap timing stricter); rain (Palm leaves a puddle for 3s; a lightning-buffed Unformed's puddle shocks for 3% on contact); void mist (Collapse drains 10% mana inside the ring in place of 4% of its damage).

### B-27 The Weft (tune) — suited to groups, Caverns and Overgrown

- **Concept:** a loom-spider of grey thread whose web is the arena. Its kit restricts movement (threads disable Step/Dash where they lie) and tethers players to each other, so a group must cut each other free. It teaches that mobility is a resource the Aether can take.
- **Terrain:** Caverns, Overgrown, the Endless Green. Its web is pre-laid in the arena (visible, grey, humming).

| Action | Class | Ech | Startup base (at 1.3x) | A | R | Dmg | Hitbox |
|---|---|---|---|---|---|---|---|
| Needle | P | 1 | 350 (269) | 100 | 500 | 6% | thrust 6 st |
| Cast Thread | U | 1 | 500 (385) | proj | 700 | 3% + lays a 1 st thread line for 6s (Step/Dash disabled on it; cut by any Strike or E1) | projectile line, 12 st |
| Tether | G | 2 | 600 (462) | 150 | 900 whiff | 10%, then tethers you to the nearest ally within 10 st for 5s (moving apart drains both players' mana/Strain, tune: 2%/s) | capsule 3 st |
| Shuttle | B | 2 | 660 (508) | 200 (moving) | 900 | 15% | the Weft crosses its web along one thread, 2 st wide |
| Draw Tight | U | 2 | 800 (615) | 150 | 1100 | 12% + pulls every tethered or thread-standing player 4 st toward the Weft | web-wide |

skill_notes:
- **Needle.** Mix-up: Needle from above the thread you are about to cut. Counter: parry; a parried Weft drops a thread (one line vanishes), which is the group's mobility back.
- **Cast Thread.** Mix-up: a thread laid across your Dash lane during a Breaker startup, so the sidestep you planned is now a walk. Counter: Unparryable but trivial damage; cut the line with a Strike or E1 (any hit); or note where threads lie and keep lanes clear as a group chore.
- **Tether.** Mix-up: tethers the healer to the melee and then Shuttles between them. Counter: Grab: hit in startup, Dash; a tethered pair that moves *together* takes nothing, which is the group lesson.
- **Shuttle.** Mix-up: the Weft runs along the thread you are standing next to; the Breaker's 2 st width is the thread's width. Counter: the thread it will run carries the vermillion cracked ring for 660ms; step off it, never along it.
- **Draw Tight.** Mix-up: pulls thread-standers into Needle range. Counter: 800ms of yellow hatching across the whole web; get off threads; tethered pairs step toward each other and then off together.

- **Variation parameters used:** speed multiplier; `thread_density` low/medium/high (how many threads Cast Thread lays before it stops, 4 to 10); hold on Shuttle 0 to 500ms; feint probability on Needle 0 to 30%; mix ratio Parryable:Unparryable 2:1 to 1:1.
- **Phases:** Phase 1: Needle and Cast Thread; it builds the web. Phase 2 (two-thirds): Shuttle and Tether. Phase 3 (one-third): Draw Tight, and the Weft re-lays threads after each.
- **Fair tell:** every thread it will use hums a pitch before it does, and the pitch is the class (B-02 sounds); the web is an instrument the player learns to hear.
- **Elemental variants:** rain (threads conduct: a lightning Weft's threads shock 2% on contact); heatwave (threads can be burned by any fire E1, a strength that also gives the player a tool: allowed, because the mob gets Burn on hit in return); void mist (Tether drains mana instead of Strain for mages).
- **Vowed note:** a Fist on threads cannot Step but can still Strike (threads are cut by Strikes), so the Weft is a Fist's spacing exam, not a wall. The web also enforces the Step budget (B-04) by design: a vowed player who Steps off every thread goes Winded by the fifth, which is the Weft's intended trap, and cutting threads is the answer.

### B-28 The Wader (tune) — suited to Alone or pairs, Acid Pools and Quarters

- **Concept:** a tall, hooded figure that walks on acid as if on stone, carrying a staff it uses as a pole. Its kit is spacing and displacement: every hit wants you one step closer to the acid. It teaches that the Aether's hazards are part of every Horror's kit.
- **Terrain:** Acid Pools, the Weeping Dark, Quarters borders with acid crossings. It patrols the safe route and makes it unsafe.

| Action | Class | Ech | Startup base (at 1.3x) | A | R | Dmg | Hitbox |
|---|---|---|---|---|---|---|---|
| Pole Thrust | P | 1 | 360 (277) | 100 | 500 | 6% + 1 st push | thrust 7 st |
| Edge Sweep | B | 2 | 660 (508) | 200 | 900 | 13% + 3 st push *away from the Wader* | arc 180 deg, 6 st |
| Carry | G | 2 | 620 (477) | 150 | 950 whiff | 11%, then the Wader walks 3 st with you (toward acid if within 6 st; capped so it never carries you *into* the acid, tune) and drops you | capsule 3 st |
| Splash | U | 2 | 760 (585) | 200 | 1000 | 10% + acid splashes 4 st (contact damage 3% per 0.5s for 2s on the splash zone) | radius 5 st |
| Vigil | - (stance) | 0 | 300 | 1200 | 300 | - | it plants the staff and reflects the next E1 projectile (a single, honest reflect; never E2) |

skill_notes:
- **Pole Thrust.** Mix-up: the push is 1 st; three parried-nothing thrusts walk a Blocking player to the edge. Counter: parry (no knockback on a parry, 4.6) or step around, never Block repeatedly near acid.
- **Edge Sweep.** Mix-up: the Sweep pushes you *away* from it, which feels safe and is toward the pool behind you. Counter: Breaker: sidestep; the Wader positions so the acid is behind you, so fight it with the acid behind *it*, which is the whole fight.
- **Carry.** Mix-up: it grabs and *walks*, so a player who thought Grab damage was the cost learns position is the cost. Counter: Grab: hit in startup or Dash; the carry never ends in acid (cap), but it ends you 3 st closer with 950ms of its own recovery to use.
- **Splash.** Mix-up: Splash throws acid onto the safe route, so "wait it out" costs position. Counter: Unparryable: Dash out; the splash zone has the green sheen and hiss of all Aether acid (10.13 grammar), so it is readable after.
- **Vigil.** Mix-up: a mage who fires an E1 into Vigil gets it back. Counter: Vigil is 1200ms of stillness: cast an E2 (it does not reflect) or walk around and strike. It never reflects twice in a row.

- **Variation parameters used:** speed multiplier; hold on Sweep and Carry 0 to 500ms; feint probability on Pole Thrust 0 to 30%; mix ratio Breaker:Parryable 1:2 to 1:1; `vigil_frequency` low/medium/high.
- **Phases:** Phase 1: Pole Thrust and Sweep. Phase 2: Carry and Vigil. Phase 3: Splash; it begins to Splash the route behind you and fight you forward.
- **Fair tell:** the acid around it ripples toward the point it will strike for the whole startup, a tell that the environment itself gives. Its hood turns to the acid before Carry.
- **Elemental variants:** rain (water buff; Splash reaches 5 st; the Wader's Vigil reflects water E1s with a +10% Element Relation); heatwave (acid steams: visibility near pools drops 30%); void mist (Carry drains mana over the carry).
- **Fair Danger note:** no Wader action can place a player in acid directly. Every acid death traces to where the player chose to stand when the push came.

### B-29 The Likeness (tune) — suited to Alone, the Hostile Adaptation Horror

- **Concept:** a mirror of you that got the details wrong. It wears a shape like yours, casts spells in your strongest element at your echelon (chosen by Hostile Adaptation, 10.7), and carries a true E3 of the void family. It is the Aether's spellcaster: Contests in a place where every point of mana you feed is gone for good. For a vowed player it instead fights with a crude version of their discipline (Strikes and one Technique) plus the void E3, so the Alone instance still duels them with what they know.
- **Terrain:** any. It arrives when the player stays in one place (10.9) and bows.
- **Specialist guardrail (10.7):** its element is chosen to pressure, not neutralize: a fire specialist meets a water Likeness (Element Relation -10% in clashes for the player), never an immunity. Capped at that.

| Action | Class | Ech | Startup base (at 1.3x) | A | R | Dmg | Hitbox |
|---|---|---|---|---|---|---|---|
| Mirror Bolt (the C-11 E1 of your element: e1_firebolt, e1_shard, e1_arc or e1_windslash; e1_tidebolt for water, B-20a; an earth specialist's Likeness uses e1_stonegrip as its Grab instead) | P | 1 | 340 (262) (spell floor 250) | spell's own | 480 | 6 | the spell's own |
| Mirror Lance / Beam (e2_fireball, e2_icelance or e2_torrent by your element, C-11) | P (projectile) or B (beam) per spell | 2 | 620 (477) (spell floor 450) | spell's own | 850 | 14 | the spell's own |
| Wrong Hand | G | 2 | 600 (462) | 150 | 900 whiff | 12% + it *copies your last spell's cost* as mana drain (tune, capped 8% of max) | capsule 3 st |
| Unmaking (e3_unmaking, NEW, B-20a; the Aether's E3 Suffering source) | P projectile, U area | 3 | 1250 (962) | 250 | 1500 | 24% | projectile r 2 at the C-08a E3 tier, detonation radius 8 st |
| Mirror Barrier (e0_barrier, C-11) | defensive | 0 | C-07 | up to 1000 | 150 release lag | - | shell r 3.5; drains per C-04; Breakers Reel it, Grabs ignore it |

skill_notes:
- **Mirror Bolt.** Mix-up: it casts E1s at the exact rhythm you have been casting at (it mirrors your cadence from the last 10s). Counter: change your rhythm; or clash it for the Last Word, which it never gets because it never answers, only mirrors.
- **Mirror Lance.** Mix-up: it fires its E2 as you release yours, forcing a Contest it will feed; in the Aether, feeding costs you what you will not regain. Counter: break off (Dash) when the lock drifts toward you; or release early and dodge the residual. A Contest won here is a Durability catalyst with real stakes.
- **Wrong Hand.** Mix-up: it opens the Grab in the recovery of your big spell, when you cannot cancel. Counter: Grab: a Barrier parry beats it, any hit beats it, a Dash beats it. Cast big spells from 7 st.
- **Unmaking.** Mix-up: the sky tell comes while an Mirror Lance is mid-flight, so you choose between clashing the Lance and preparing for the E3. Counter: the Lance is an E2, the Unmaking is an E3: a gap of 1; an E3 of your own destroys the Lance and continues (4.8). Otherwise Dash the Lance and dodge the Unmaking's area; its projectile is parryable at a mana cost (4.6). Surviving grants full Insight toward the void E3 (one of the three distinct sources).
- **Mirror Barrier.** Mix-up: it Guards the moment you commit a Technique or an E2, so you drain it (good) and stand in recovery (bad). Counter: alternate Breakers with Grabs (4.11 Law 5); a Fist's Grab ignores its Barrier entirely.

- **Variation parameters used:** speed multiplier; `mirror_lag` 300 to 900ms (how closely it mimics your cadence); feint probability on Mirror Bolt 0 to 30% (its feints pay the feint tax like yours, visibly: it flinches when it cancels); hold on Mirror Lance 0 to 500ms; mix ratio is driven by *your* play: it casts what you cast at the ratio you cast it, clamped so at least 25% of its actions are not mirrors (Wrong Hand and Unmaking) and so a vowed player's Likeness still uses Strike:Technique:Grab at 3:1:1.
- **Phases:** Phase 1: Mirror Bolt and Mirror Barrier; it learns your cadence (`mirror_lag` long). Phase 2 (two-thirds): Mirror Lance and Wrong Hand; `mirror_lag` shortens. Phase 3 (one-third): Unmaking enters, once per 30s (tune), and it stops mirroring for the duration of the E3 (it has to concentrate).
- **Fair tell:** its shape is yours but its light is wrong (void-black where your element glows), and its spells are the same spells, so every telegraph is one you already know from your own hands. Its unique actions use the standard class cues.
- **Elemental variants:** the Likeness's element is Hostile Adaptation's choice, so weather variants only add their status (snow: Chill on Mirror Bolt; rain: water Likeness's clashes +10%; heatwave: Burn; void mist: Wrong Hand drain cap 12%).
- **Drops:** a Tome fragment of the void E3 (the Aether's own fragment source for the Suffering route), relic materials, Mana Crystals. The Likeness is the Horror whose "Bane of" Epithet mages chase.

---

## 3. Fissure Horror

### B-30 The Thinling (tune) — Band: App, a 10-minute run

- **Concept:** a thin, grey, faceless biped the height of a person, the first Horror most players meet (11.6). It exists to teach the four parry classes and the Aether's telegraph grammar in a fight that is honest to a fault: exactly one attack per class, each wearing the canonical cue (B-02), at baseline timing on every attack, not just the first two. It has no phases, no feints, and the narrowest variation range in the game, so a player who fails here failed a reading test, not a dice roll.
- **Terrain:** a Fissure pocket (one module, two exits, no acid, no void, 10.13 grammar in miniature: a mist lip at the edge, a Rift hum at the exit).

| Action | Class | Ech | Startup base (at 1.1x) | A | R | Dmg | Hitbox |
|---|---|---|---|---|---|---|---|
| Lesson One (a straight slap) | P | 1 | 400 (364) | 100 | 600 | 5% | arc 90 deg, 4 st |
| Lesson Two (a shoulder charge) | B | 2 | 750 (682) | 150 | 1000 | 12% | line 2 x 6 st |
| Lesson Three (a stomp) | U | 2 | 850 (773) | 150 | 1200 | 10% | radius 5 st |
| Lesson Four (a reach) | G | 1 | 600 (545) | 150 | 800 whiff | 6% | capsule 3 st |

skill_notes:
- **Lesson One.** Mix-up: the only one it has: it sometimes holds the slap at Telegraph end for a fixed 300ms (the Hold tool shown once, always the same length). Counter: parry on the drop, not the raise; Tempo (+300ms to its recovery, 4.6) is acted out broadly by the Thinling so the reward for a read is obvious.
- **Lesson Two.** Mix-up: it charges after you Block the slap, so the first time a player Blocks a Breaker and Reels is here, at 12%, with chain protection and an 1000ms recovery to think in. Counter: the vermillion cracked ring, the "thud-CRACK" and the dropped shoulder: sidestep.
- **Lesson Three.** Mix-up: it stomps when you stand still after a parry to admire it. Counter: the yellow hatched decal at your feet and the rising whoosh: leave 5 st. Every Unparryable in the Aether draws this decal.
- **Lesson Four.** Mix-up: the open-hand reach follows a successful parry, teaching that Grabs answer parry habits before the Mourner teaches it for keeps. Counter: hit it in 600ms of startup, Dash, or Barrier parry; Block fails and the player learns why at 6%, not 13%.

- **Variation parameters used:** speed multiplier **0.9x to 1.1x only**; no delay variance beyond the fixed hold; feint probability 0; mix ratio fixed at 1:1:1:1 in a rotating order that re-rolls per Fissure (so a wiki can list the four and not the order). Hidden difficulty scaling is **off** for the Thinling.
- **Phases:** none. It fights the same from full to dead.
- **Fair tell:** it announces each class with the cue and *nothing else*, so the player learns to trust the cue rather than the body; and it pauses 800ms between attacks (tune), long enough to try an answer.
- **Elemental variants:** none; Fissures roll no Elementals. If an Aether Tide event (11.13) walks Thinlings into the overworld, they keep this kit and the fixed timing; they are the Tide's reading practice.
- **Drops:** Tome fragment (always one, a family hinted by the Bleed Zone's lean), Mana Crystals (tune: 1 to 2).
- **Failure (11.6, v3.1):** the Thinling's killing blow does not kill. It ejects the player from the Fissure Hollow, with Trauma (3.2), and the run's rewards are lost. The ejection has its own tell (the pocket's mist lip rushes inward over about 2s, tune, and the Thinling stops attacking); only a death after that tell, back in the overworld, costs a Life. Practice never costs a Life, so a player at 1 Life can still learn the grammar here. It sets the Horror Combat Standard's floor for every other Horror: nothing here is faster, and nothing in the Aether gives a longer pause.

---

## 4. Guards, hunter squads and the Marshal (Section 12)

Shared rules: guards drop nothing edible (18.7), give almost no XP (12), target only the wanted player, arrive in waves under the concurrent-guard cap (20.2), and never fight in Dead Zones or Bleed Zones as mages (where the escape routes of 12 live; trackers and physical squads do follow there). Every guard action carries the C-10 class marker and sits above its startup and recovery floors. Guards are human-scale and use C-11 spells (plus B-20a E3s for the Marshal) and Body techniques, so Learning by Suffering and Reading the Blow apply (Section 6 flags the Insight rate).

### B-31 The Watch (tune) — town guards, escalation rungs 2

- **Look:** townsfolk in a faction tabard with a short spear and a Barrier charm; their auras are plain and unsuppressed.
- **Behavior:** warn first (rung 1 is a shouted warning and a visible heat glyph on the player's HUD-less world: guards point at you). Then approach in pairs, Barrier up, and try to **hold** rather than kill: their kit is a wall, not a blade. A surrendering player (12) ends the fight.

| Action | Class | Ech | S / A / R (ms) | Dmg | Hitbox |
|---|---|---|---|---|---|
| Spear Jab | P | 1 | 330 / 100 / 480 | 4% | thrust 5 st |
| Shield Shove | U | 1 | 420 / 120 / 600 | 3% + 3 st push | arc 90 deg, 3 st |
| Hold Fast (e0_barrier, C-11) | defensive | 0 | C-07 | - | shell r 3.5 |
| Warning Bolt (e1_firebolt, e1_shard, e1_arc or e1_windslash by town, C-11) | P | 1 | spell's own | spell band | spell's own |

skill_notes:
- **Spear Jab.** Mix-up: a pair alternates Jabs at 400ms gaps to keep a parrier in rhythm while a third circles. Counter: parry one, Step out of the pair's line; guards never chain past two.
- **Shield Shove.** Mix-up: Shove into a wall, then Jab. Counter: Unparryable: Dash through it; the push is small; Blocking it is fine (3%).
- **Hold Fast.** Mix-up: guards Barrier in a line to block an alley, forcing a Breaker or a Grab, which raises heat further (assault on a guard). Counter: climb (vowed), fly (mage, Grounding risk from Warning Bolts, which are E1 and cannot ground), or walk out the other way: there is always another way (12 escape routes).
- **Warning Bolt.** Mix-up: a Bolt aimed at the player's feet to slow a run. Counter: it is a C-11 E1; parry for Tempo and a little mana, which is the one thing the Watch gives.

- **Drops:** nothing edible, a Watch badge (a cosmetic, a crime trophy, raises heat if seen on you), Mana Crystals **none** (bounties are paid from the criminal's assets, never the reverse).
- **Teaches:** Block Proficiency (they Shove and Jab constantly), Suppression under stress (a suppressed mage is harder to trace, 12). Suffering Insight for the town's E1 at a reduced rate (Section 6).

### B-32 Hunter squads (tune) — escalation rung 3, tuned per wanted archetype

A squad is 4 members, arrives together, pathfinds as one unit (performance, 12), and is **composed against the wanted player's archetype**, read from the frozen Power Score's dominant domain (5.7). Each composition has a named counter-role, so the villain can read what is coming and plan around it (12: "the player always has notice and a way out").

**Against a Classic Mage: the Net Squad.**
- 2 **Netters** (Blade-trained humans): a thrown weighted net Technique, Grab-class (Body data, not the spell table). S 600 / A 208 (25 st at the E1 tier) / R 900. Dmg 8%, grounds a flier (4.10) and roots for 1.5s (parry and cast allowed). Mix-up: two nets 300ms apart. Counter: hit a Netter in startup or Dash; nets are Grabs.
- 1 **Mauler** (a heavy with a maul): Breaker Technique, S 680 / A 150 / R 950, Dmg 14%, 1.5x impact drain on a Barrier (4.12 anti-turtle). Counter: sidestep; its 950ms recovery is the squad's weakest moment.
- 1 **Snuffer** (a mage casting e1_wick, the void drain bolt, B-20a): S spell's own, Dmg 5 + 3% mana drain. Counter: clash it for the Last Word; it is E1 and void is neutral in the C-09 ring, so any element answers it evenly.
- **Squad logic:** nets to ground, Mauler to crack the Barrier, Snuffer to hurry Hollow. Escape: Dead Zones (the Snuffer and nets still work there, the Mauler is slow), or break sight and suppress.

**Against a Sword Mage: the Rust Squad.**
- 2 **Rasps** (Blades with notched sabres): Breaker Technique "Notch", S 640 / A 150 / R 900, Dmg 12%, deals **double durability damage** to a parrying sword (tune). Mix-up: Notch after a parried Strike, to make the parry habit expensive. Counter: sidestep Breakers; parry only their Strikes.
- 1 **Spiller** (a mage casting e1_wick, B-20a): to push the Sword Mage toward 0 mana where the blade turns brittle. Counter: clash it.
- 1 **Grappler** (a Fist-trained human): Grab Technique, S 540 / A 150 / R 800, Dmg 9%, disarms for 2s (the sword falls, pick-up by E). Counter: hit in startup; a disarmed Sword Mage casts.
- **Squad logic:** make the blade the liability. Escape: leylines (regen for reinforcement), or cast more than you cut.

**Against a Vowed Blade: the Lance Squad.**
- 2 **Lancers** (mages casting e2_torrent beams and e2_icelance, C-11): Breaker beams and piercing lances at range to outreach the sword. Counter: Spellcut if you know a Technique (4.12, v3.1; heavy durability for E2) or sidestep; close under cover.
- 1 **Tracker** (a human with no spells, reads footprints and witnesses, 7.3): the one who finds you in Dead Zones; a Blade-trained duelist with Strikes and a Grab Technique. Counter: a fair duel; Reading the Blow works on them.
- 1 **Warden** (a Barrier specialist with Hold Fast and a Shield Shove): blocks the lane. Counter: Breaker Techniques drain a Barrier at 1.5x.
- **Squad logic:** keep the Blade at range and make Spellcut cost durability. Escape: climb (vowed routes); mages cannot follow up a cliff and the Tracker is slow.

**Against a Vowed Fist: the Reach Squad.**
- 2 **Polemen** (Blade-trained humans with pikes): Strike reach 7 st, Breaker thrust Technique S 660 / A 150 / R 900, Dmg 13%. Mix-up: two pikes in a wall, alternating. Counter: a Fist Steps inside the pike's reach; inside 3 st a pike is a stick.
- 1 **Tracker** (as above).
- 1 **Caster** (e2_fireball, C-11, aimed at the ground so its Unparryable splash is the threat): forces the Fist to Step; S spell's own. Counter: the splash is dodged; close on the caster, who is the squad's soft point.
- **Squad logic:** deny the Fist's range with reach and AoE. Escape: crawlspaces (vowed routes), or the Tracker's own fairness: a Fist leaves no signature, so once sight is broken the Tracker needs a witness.

Common skill_notes for all squads: **Mix-up:** squads arrive in two pairs 20s apart (12: waves), so a villain who commits to the first pair meets the second mid-recovery. **Counter:** squads announce themselves (a horn, a glyph flare over the town) 30 to 60s before arrival, the sign-then-threat rule of 11.4, and a surrender (E on a guard) ends the fight at any point before the Marshal.

- **Drops:** nothing edible, nothing of value (Watch badges), **no crystals**. Guard kills cost a Life (23, recommended default), so the squad is a cost, not content.

### B-33 The Marshal (tune) — escalation rung 4, a named duel boss

- **Concept:** one person, named per town, who walks out alone when the squads have failed. The Marshal's name is spoken at the Inn before you ever commit a crime, so the duel is a known stake. They are the law's Horror: a fair, skilled, readable duelist with a kit that **switches by the wanted archetype**, three phases, and a surrender offer at each phase break.
- **Band:** Mst. The Marshal's Power Score is frozen above the wanted player's by one band (tune) so the Threat is real, but the XP is near zero (12 anti-abuse). What you get for winning is the town's fear and a Life kept; what you lose is a Life and the heat you still carry.
- **Base kit (always present):**

| Action | Class | Ech | S / A / R (ms) | Dmg | Hitbox |
|---|---|---|---|---|---|
| Writ (a thrown sealed writ that bursts into a marking glyph; a law action, not a table spell) | P | 1 | 340 / 208 / 500 | 5% + a 2s "Named" mark: the Marshal's next attack gains the counter-hit bonus on you if it lands in startup/recovery | projectile r 1 at the C-08a E1 tier, 25 st |
| Sentence (a two-hand cut) | P | 2 | 620 / 140 / 850 | 14% | arc 120 deg, 6 st |
| Gavel (an overhead) | B | 2 | 700 / 160 / 950 | 16% | line 1.5 x 5 st |
| Arrest (a Grab) | G | 2 | 600 / 150 / 950 whiff | 11%, then a 1s pin (parry allowed, cast not); if the player is below 20% Health the Arrest ends the fight in surrender terms instead (jail, fines, confiscation, 12) | capsule 3 st |
| Verdict (e3_sunfall, e3_shardstorm or e3_cairnfall by town element; NEW, B-20a) | P projectile, U area | 3 | 1300 / 250 / 1600 | 26% | the spell's own |

- **Archetype switch (one extra action and a tendency):**
  - vs Classic Mage: **Grounding Chain** (a thrown chain Technique, Grab-class, S 600 / proj / R 900, grounds and roots 1.5s). Tendency: closes distance, Breakers into Barriers.
  - vs Sword Mage: **Notch** (as the Rust Squad's, Breaker, double durability on parry). Tendency: baits the sword parry, casts when the blade cracks.
  - vs Vowed Blade: **Writ Volley** (three Writs, 200ms apart, Parryable E1s that cost durability to Spellcut). Tendency: fights at 7 st, uses Verdict area to deny the climb.
  - vs Vowed Fist: **Hold the Line** (e0_barrier held for up to 3s, draining per C-04b, that the Marshal strikes from behind). Tendency: forces the Fist to Grab (which ignores Barrier), then Arrests the Grab's recovery.

skill_notes:
- **Writ.** Mix-up: the Named mark makes your next whiff cost 15% more; players who know this hesitate, and hesitation is the Marshal's rhythm. Counter: clash or parry it; a parried Writ marks the Marshal instead (Tempo flips the mark, tune).
- **Sentence.** Mix-up: Sentence into Gavel is a Parryable-then-Breaker string that punishes the second parry. Counter: parry the first, sidestep the second; the Gavel's 950ms recovery is the duel's window.
- **Gavel.** Mix-up: Gavel from a Sentence feint (the Marshal is the one guard who feints; feint tax applies and is visible). Counter: vermillion ring, "thud-CRACK", dropped weight: sidestep regardless of what the first beat looked like.
- **Arrest.** Mix-up: the Marshal offers Arrest at low Health as mercy and as a trap: a player who stops fighting to accept is pinned; a player who fights on is grabbed and the fight ends in surrender terms anyway. Counter: hit in startup, Dash, Barrier parry. Or accept: surrender is a real outcome (12) and the Marshal honors it.
- **Verdict.** Mix-up: the Marshal casts Verdict when you are at the edge of the town square where the area meets a wall. Counter: 1300ms sky tell; dodge the area, parry the projectile at a mana cost, or clash it with an E3. Full Insight if survived: the Marshal is an E3 Suffering source, and a player who commits three towns' worth of crimes can learn a Calamity the hard way. That is a story, and it is expensive.

- **Phases:** Phase 1 (full to two-thirds): Writ, Sentence, Gavel at baseline; a surrender offer at the break. Phase 2: the archetype action enters, Arrest enters; a second offer at the break. Phase 3: Verdict once per 30s, feints on Sentence enabled.
- **Fair tell:** the Marshal speaks every attack's name a beat before it (the law announces itself), and the voice is the class sound. A player with the sound off still has the class color.
- **Variation:** none per server; the Marshal is learnable (overworld, Design Law 3). Each town's Marshal differs by element and archetype switch, not by frame data.
- **Drops:** nothing. Killing a Marshal costs a Life, raises heat to the ceiling (reinforcement waves, B-34), and writes a ledger line the Seer speaks of differently.

### B-34 Reinforcement waves and surrender (tune)

- After a Marshal falls: waves of 4 Watch every 45s (tune) under the concurrent-guard cap, no further Marshal, no XP, until the player leaves the jurisdiction or heat decays (12). Waves pathfind as units and never enter Dead or Bleed Zones as mages; Trackers follow on foot.
- Surrender (E on any guard, or taking the Marshal's Arrest at low Health): fines paid from assets, confiscation of droppable items (not Tomes or the Grimoire, 17.2), jail time as a real-time lockout of that town (tune: 20 minutes), no Life lost. Heat resets for that town.
- Fair Danger: every rung announces itself (warning, horn, Marshal's name at the Inn), every rung has an exit, and the only rung that costs a Life without a fight-ending alternative is the one the player started by killing a guard.

---

## 5. Hidden difficulty scaling: what each Horror may move (summary, tune)

| Horror | Speed roll | Hold variance | Feint prob. | Mix ratio | Other |
|---|---|---|---|---|---|
| B-22 Mourner | 0.8-1.3 | Sorrow, Bow 0-500 | Cut, Sorrow 0-35% | fixed 4:1:1 | chain_delay 150-450 |
| B-23 Choir | 0.8-1.3 | Clasp 0-600 | Reach 0-25% | P:U 3:1 to 1:1 | ring_points 6-12 by players |
| B-24 Hinge | 0.8-1.3 | Snap, Drop 0-500 | Crease, Snap 0-30% | B:P 1:2 to 2:1 | unfold_frequency |
| B-25 Lantern-Eater | 0.8-1.3 | Gulp 0-600 | Dim 0-25% | G:P 1:2 to 1:1 | ambush_distance 12-25 |
| B-26 Unformed | 0.8-1.3 | Palm 0-600 | none | U:P 2:1 to 3:1 | - |
| B-27 Weft | 0.8-1.3 | Shuttle 0-500 | Needle 0-30% | P:U 2:1 to 1:1 | thread_density 4-10 |
| B-28 Wader | 0.8-1.3 | Sweep, Carry 0-500 | Thrust 0-30% | B:P 1:2 to 1:1 | vigil_frequency |
| B-29 Likeness | 0.8-1.3 | Lance 0-500 | Bolt 0-30% | mirrors player, >=25% non-mirror | mirror_lag 300-900 |
| B-30 Thinling | 0.9-1.1 | fixed 300 on Lesson One | 0 | fixed 1:1:1:1 | scaling off |

Scaling moves a Horror within its row, never outside it, never below the floors of B-01, and never into Health or damage (4.9). Grab frequency is capped per Horror (one per 20 to 30s) so Grabs stay a punish for a read habit, not a pattern.

---

## 6. Conflicts with the doc and assumptions made

1. **Grab floor versus echelon floor (4.7, 4.12).** 4.12 gives Grabs a 400ms startup floor; 4.7 gives E2 a 450ms floor. An E2 Grab has two floors. Assumed: the higher applies (`max(class_floor, echelon_floor)`), so E1 Grabs floor at 400 and E2 Grabs at 450. C-11 reads it the same way for e1_stonegrip ("the Grab floor applies, since it is above the Echelon 1 floor"). Needs a line in 4.2 or 4.12.
2. **"Readability floor (tune per attack type)" (4.9) versus echelon startup floors (4.7).** Assumed the echelon floor is the minimum and a per-attack floor may sit higher, never lower. B-01 treats them as one floor.
3. **Speed multiplier meets the floor (4.9).** Undefined. B-01 proposes the 1.3x authoring rule plus a server clamp on startup, and leaves active and recovery unscaled; recoveries obey the C-16 floors as authored. Evidence for not scaling recovery: C-14's sensitivity table (E3 recovery 1000 gives exactly 4.00s, 800 fails) means a 1.3x roll on recovery would move Horror TTK below Law 3 on some servers, which is pressure through damage rate, not variance. If the owner rejects this, every Horror startup here needs re-authoring at the chosen rule and every E3 recovery rises to 1950ms or more.
4. **Horrors "no weaknesses" (10.1) versus role immunities (14).** Assumed Horrors have no immunities or resistances of any kind, so Phantom-like physical immunity never appears on a Horror. v3.1 confirms the direction for Alone instances (10.7: never draw a mob the character cannot damage); this proposal applies it to shared instances too, by construction.
5. **Mana Beasts "absorb spells" (14) is undefined.** B-04 proposes the Glut/Vent/Spent loop so a mage has a costly route rather than none. If the owner wants Absorb to be total, drop Vent and Spent and the CM counterplay lines become "leave".
6. **Golem Reflect (14) is undefined.** B-04 proposes same-spell return at 60% energy on the same class, so it can be parried or clashed. Reflected spells never grant Insight (you cast them).
7. **Phantom half-manifest (5.19.8).** The Spirit Palm Long Road implies Phantoms become partly physical in Dead Zones. Assumed 50% physical damage and no Phase-step there. Needs a line in 14 or 7.3.
8. **Guards as Suffering sources (5.20, 12).** Guards cast C-11 spells, so Insight accrues from them, which makes crime a spell-learning loop. 12 wants villain loops not to be farms. Proposed: Insight from guards at a reduced rate (tune: 25%) and the Marshal's Verdict at full (surviving a Calamity is the feat, 5.20). Flag for decision.
9. **Spells as mob attacks (B-20).** Creature-cast spells reuse C-11 ids wherever one exists (e2_torrent for the Heron and the Drowned, e1_shard for Gloamwing, C-11 E1s for the Watch and the Archivist, e2_fireball/e2_icelance/e2_torrent for the Likeness and squads, e0_barrier everywhere a Barrier appears). The seven spells C-11 lacks (e1_tidebolt, e1_wick, e2_rimewall, e3_sunfall, e3_shardstorm, e3_cairnfall, e3_unmaking) are proposed once in B-20a for C-11's owner and used nowhere else. Writ, Spit and Boulder Toss are creature actions, not spells, and teach nothing.
10. **Combat statuses from elements (10.5).** Chill reuses C-11's Frostmote definition; Soaked, Burn, mana drain, Stung and Root are proposed in B-20b as additive statuses that never alter a C-15 reaction, a window or a telegraph, and that food never touches (18.10 Warmth/Cooling affect weather fronts only). If the owner wants Warmth to reduce Chill, 18.1's food guardrail needs an exception, which this proposal does not recommend.
11. **Rain "weaker fire spells" (10.5).** Read as: the player's fire spells are weaker in rain. The Drowned and the rain-buffed Horrors use that reading.
12. **Wolf and Bear (14).** The doc names them as examples. This proposal uses original creatures in those niches (Glutmaw Hound, Dolmen Bruin). If the owner wants literal wolves and bears, the kits transfer unchanged.
13. **Fissure failure cost (11.6, 23).** v3.1 changed the recommended default: a failed run ejects the player Hollow with Trauma and loses its rewards; only a death after the ejection tell costs a Life. B-30 now follows that, with an authored ejection tell.
14. **Grab versus Block on the Thinling and the Watch.** The doc says Grabs ignore blocks (4.2). Assumed they also ignore Guard (4.12 says so) and the Mirror Barrier; stated where relevant.
15. **Horror aggro and disengage (4.9 OPEN).** This proposal assumes the recommended default (a mana-draining disengage is allowed) and so gives every Horror arena two exits and never a leash-less chase. The Mourner and Wader walk; the Unformed turns; none sprint after a fleeing player.
16. **Fist Grab on a flier (4.10).** Assumed a Grab-class Technique landing on a flier grounds it like an E2 or Technique does. Needs a word in 4.10 or 4.12.
17. **Displacement stops at lethal edges (Fair Danger).** Assumed: any single hit's displacement, including the 6 st Reel knockback of C-05b, a Grab throw or carry, and a Horror's push, stops at a lethal edge's mist lip (10.13 grammar) and never carries a player over it. Not in the doc or the C-series; proposed as a 4.11 Law 3 corollary: no one-hit falls. The edge stays lethal to a player who then steps, dashes or is pushed a second time.
18. **Heavy-hit reading for Blocking Unparryables.** Every Unparryable E2 in this document (Vents, slams, Bursts, Swallow, Paper Storm, Splash) is a heavy hit by C-05a, so Blocking it Reels. The text now says so wherever it recommends a Block, and recommends a Block only where a Reel's knockback is safe.

v3.1 reconciliation (each checked against the line tagged v3.1 in the doc):

19. **Naming (Appendix C).** Every doc rename is applied (Calamities, Lesser/Greater, Rites, Outpouring, Wellstone, Still Aura, the Bare Vow, Calloused, Felling Blow, Last Word, Company catalysts, the new Aether layout names). This document's own names were audited against the rules; the renames are in Section 8. Names the doc already cites by B-ID (Glutmaw Hound, Dolmen Bruin, Loomhorn, Mirrorplate Sentinel, Cairn Walker, Candle Wraith, Blister Pod, Sap Ooze, Lantern Nettle, Gloamwing, in 24.7) are kept so the cross-references hold.
20. **Alone pool (10.7, v3.1).** Alone instances never draw a mob the character cannot damage. Every Horror here is damageable by every kit (B-04), so no Horror leaves a pool; the rule is noted for Phantoms (overworld mobs) should a Tide or Fissure pool ever include them. The Likeness swaps kit for a vowed player rather than leaving.
21. **Combo scaling after the cap, and the 90%-per-4s rule (4.11, v3.1).** Combo scaling applies after the hit cap (B-04 Contact ticks and every multi-hit here follow that). The rolling cap binds Horrors as attackers; B-01 item 3 now cites it as the last line behind the unscaled-recovery rule.
22. **Contest margin 35% (4.8, v3.1).** This document never quoted the old 25%; the Driftwalker and Likeness Contest notes are unchanged and already consistent (a mirror clash with the Last Word now sits inside the margin, which is what makes the Likeness's Contests real).
23. **Step chaining (3.4, v3.1).** Each Step within 2s costs 50% more; about five chained Steps cause Winded. A Step budget convention is added to B-04 and to the Horror shared rules, and the kits that could tempt a chain (the Choir, the Unformed, the Weft, the Archivist's Index) now name position or Guard as the vowed answer.
24. **Tagging (5.2, v3.1) and the wider Unaided rule (5.5, v3.1).** A non-party, non-Resonant participant under 20% contribution is ignored for Threat and earns nothing; clashes, interrupts, control and aggro draws by a stronger non-peer now void a catalyst. Noted on the Choir (Clasp-breaking, Reach parries) and the Unformed (Groan aggro). Company play remains for peers.
25. **Spellcut echelon (4.12, v3.1).** A Blade's cut clashes at E1 by default and at E2 once the Blade knows any Technique. Every line that told a Blade to Spellcut a Greater spell (Glyph Heron, the Archivist, the Lance Squad) now carries that condition.
26. **Pressure checks for vowed characters (11.3, v3.1).** Vowed characters are checked against the Body threshold (Techniques at Practiced for an E2 rating, Arts at Honed for E3, 5.19.6 v3.1) and take 50% only when below it. The Archivist, Anvilback and Gloamwing lines that said "half rate" now say unpressured at or above the threshold, half below.
27. **E3 Suffering sources (5.20, v3.1).** A survived Calamity counts only from a hostile caster on an account with 20 hours of play. Mob casters are always hostile and have no account, so every mob Calamity here counts in full (B-04 note); the account rule applies to player casters only.

## 7. Dependencies that remain after combat-numbers.md

Resolved by the C-series and no longer open: the baseline Health pool (C-01a: 100 HP, so every percentage here is also a damage value); heavy hits, Reel and Guard Break (C-05); projectile speed tiers and hitbox shapes (C-08); the element relation and residues (C-09); telegraph signatures (C-10); E0 to E2 spell ids and frame data (C-11); hit reactions (C-15); recovery floors (C-16).

Still open:
- **Mob Power Scores.** The C-series scores no mobs. Each creature here carries a pacing band (Awk/App/Adp/Mst) so Threat (5.2) can be solved once C-17's capacity presets map to bands; a mob score sheet is needed.
- **Acceptance of B-20a** (seven spells, including every E3 this document uses) by C-11's owner. Until then the E3 Suffering route has no registered E3 at all, because C-11 ships none (C-08 keeps E3 out of the sandbox).
- **Mana Crystal economy.** No C item prices crystals; the drop bands here (rare / 1 to 3 / 6 to 10) are checked only against rent (17.4: 1 per day) and the starting 5.
- **B-20b statuses** (Soaked, Burn, mana drain, Stung, Root) need a C-series home; Chill already has one.
- **Grab on a flier grounds it** (item 16): C-15 grounds on E2 and Technique hits only; a word is needed for Grab-class Techniques and e1_stonegrip.
- **Edge displacement rule** (item 17) is new to both proposals.

## 8. v3.1 naming reconciliation

Rules applied (Appendix C): a plain word, or two plain words joined; no hype, tech or borrowed words; one name, one meaning; functional design-only terms may stay.

| Old name | New name | Reason |
|---|---|---|
| Latch Automaton (B-10) | Latch Crab | "Automaton" is a tech word; "Crab" is what it is |
| Echo of the Drowned (B-13) | The Drowned | "Echo" is rejected in Appendix C (another game's currency); three words |
| Choir of Hands (B-23) | The Choir | three words; one plain word carries it |
| Stillborn Colossus (B-26) | The Unformed | "Stillborn" is an edgy word, "Colossus" a hype word; it is a giant that never finished forming |
| Pilgrim of the Shallows (B-28) | The Wader | three words; "Wader" describes a thing that walks in shallows |
| The Understudy (B-29) | The Likeness | a stage word for a Horror that copies you; "Likeness" is the plain word for a copy of a person |
| Swallow the Room (B-25 action) | Swallow | one word |
| Lunge from Nothing (B-25 action) | Blind Lunge | two plain words |
| Fall to Knees (B-26 action) | Collapse | three words, and it collided with the Unburied's Kneel |
| Sweep to the Edge (B-28 action) | Edge Sweep | two plain words |
| Baptism (B-28 action) | Carry | a loaded word for a carry toward acid; "Carry" is what it does |
| Font (B-28 action) | Splash | "Font" reads as typeface; "Splash" is what it does |
| Echo Bolt / Echo Lance (B-29 actions) | Mirror Bolt / Mirror Lance | "Echo" rejected |
| Mimed Guard (B-29 action) | Mirror Barrier | "Guard" is the physical block (one name, one meaning); it is a Barrier |
| Breaker (B-32 Net Squad role) | Mauler | "Breaker" is the parry class (one name, one meaning); he carries a maul |
| Answer Bonus (everywhere) | Last Word | doc rename |
| Grand Magic (everywhere) | Rite | doc rename |
| "an ultimate" (prose) | a Calamity | doc rename |
| Concord catalysts / Concord play | Company | doc rename |
| Layered Depths, Infinite Depths, Broken Civilization, Endless Jungle, Acid Abyss, Evolving Fog | the Strata, the Deep Strata, the Remnant, the Endless Green, the Weeping Dark, the Mirrorfog | doc renames (10.4) |

Audited and kept: Glutmaw Hound, Dolmen Bruin, Loomhorn, Mirrorplate Sentinel, Cairn Walker, Candle Wraith, the Unburied, Blister Pod, Sap Ooze, Lantern Nettle, Driftwalker, Glyph Heron, the Bound Archivist, Anvilback, Gloamwing, the Mourner, the Hinge, Lantern-Eater, the Weft, the Thinling, the Watch, the squad names and roles (Netters, Snuffer, Rasps, Spiller, Grappler, Lancers, Tracker, Warden, Polemen, Caster), the Marshal and its law-word actions (Writ, Sentence, Gavel, Arrest, Verdict), and the mechanic words Glut, Vent, Spent, Phase, half-manifest, Chill, Soaked, Burn, Stung, Root. Each is one plain word or two plain words joined, names what the thing is or does, and means one thing in this document. Ten of them are already cited by B-ID in game-design.txt 24.7.

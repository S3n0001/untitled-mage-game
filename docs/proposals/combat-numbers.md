MERGED into game-design.txt v3.3 on 2026-10-27; the doc is now the source of truth.

# Combat Numbers Sheet (proposal for the 21.2 combat sandbox)

Status: PROPOSED. Every value is (tune) unless marked otherwise. Source: `docs/game-design.txt` **v3.1** (reconciled after the v3.1 naming and verification pass). This sheet does not edit the design doc; it fills in the absolute values the sandbox needs.

How to use it: each item has an ID (C-01, C-02, ...). Accept or reject each one on its own. Sub-items (C-04a, C-04b) can also be accepted separately. Items that contradict or reinterpret the doc carry a **Doc conflict** or **Reinterpretation** line naming the section.

Ground rules this sheet follows:
- All LOCKED items stand, except where an item asks for an explicit owner override (only C-02b does).
- No stat widens a defensive window or shrinks a telegraph below its floor (4.11 Law 1).
- No numbers ever reach the HUD (16.3). Every value here is server data. The player sees only the orange Health bar, the blue Mana bar, VFX and sound.
- Values are chosen to be round and easy to tune. Health is 100 points, so a percentage of baseline Health and a point of damage are the same number.

---

## v3.1 reconciliation

### Renames applied in this sheet (Appendix C rules)

| Old | New | Reason |
|---|---|---|
| Answer Bonus | Last Word | Appendix C rename |
| Echelon 1 / 2 / 3 (Light / Medium / Ultimates) | Lesser / Greater / Calamities | Appendix C rename; labels added to the echelon tables |
| Grand Magic | Rites | Appendix C (this sheet only mentions Rites via 4.11 Law 3) |
| `e0_spark` (Spark) | `e0_cinder` (Cinder) | "spark" already names the neutral contact VFX in 4.4, and "Ember" is a cooking flame band (18.3). One name, one meaning. |
| Hold drain (Barrier) | Block drain | "Hold" names the 4.11 spell Hold. One name, one meaning. |
| Barrier exhaustion | Barrier collapse | "Exhaustion" names Mana Exhaustion and Exhaustion Training (3.1, 3.2) |
| "Hold" column in C-07 | "Held" | Same Hold collision |
| Grab marker "open hand" | "reaching hand" | Avoids an echo of the retired "Open Hand" name |

Checked and kept: Firebolt, Fireball, Shard, Ice Lance, Sunfall, Shardstorm, Wind Slash (doc names); Arc, Torrent, Stonegrip, Frostmote, Gust, Mana Sense, Chill (plain words, no collision); Slip, Spellcut, Winded, Hollow, Contest (kept on purpose in Appendix C). Design-only terms (Block Proficiency, Clash Power, settle window, release lag) stay functional, since players never see them. Mana Battery, Null Aura, Mountain Breaker, Tempered, Legacy and Concord never appeared in this sheet.

### Status of each item against v3.1

| ID | Status | Note |
|---|---|---|
| C-01 | matches v3.1 | 3.3 now states survival drains in real time. The Blood numbers here are already per real second. |
| C-02a | matches v3.1 | |
| C-02b | **overrides v3.1 §3.1** | v3.1 keeps 0.1%/5s and still lists the trickle as open (Appendix B, "Still open"). The halt stays meaningless unless the trickle rises. |
| C-02c | matches v3.1 §3.2 | Overcharge Health spent is now also the Trauma depth measure (v3.1). Nothing to change. |
| C-03 | matches v3.1 §3.4 (updated) | Step now follows the v3.1 chaining rule and the hunger Strain penalty (§3.3). Dash unchanged. |
| C-04 | matches v3.1 | |
| C-05 | matches v3.1 | 4.5 is unchanged; the group-fight rule is still an open item with the same recommended default. |
| C-06 | matches v3.1 | |
| C-06a | **superseded by v3.1 §17.5 (Before Barrier)**; shrunk | The doc now adopts the same rule. |
| C-07 | matches v3.1 | Plus C-07a, a recommendation on the new open item "Parrying while Hollow" (§23). |
| C-08a, C-08b | matches v3.1 | |
| C-08c | **overrides v3.1 §4.8** | 4.8 still says residuals are "slower". This sheet keeps fixed speed tiers (Law 6). |
| C-09 | matches v3.1 §4.8 | The ring covers every opposed pair named in 4.8. |
| C-10 | matches v3.1 | |
| C-11 | matches v3.1 (updated) | Notes added for fresh-press feeding (§4.8), the 35% Contest margin, Spellcut echelons (§4.12), and Mana Sense in a utility slot (§4.11 Law 5). |
| C-12 | matches v3.1 | Feed inputs use the same compensation (§4.8). |
| C-13 | **superseded by v3.1 §4.11 Law 1**; shrunk | Law 1 now names the Sword Mage state exception. The fuller wording here stays optional. |
| C-14 | matches v3.1 §4.11 (re-verified) | Combo scaling after the cap was already assumed. The new 90%/4s rule is added to the proof. |
| C-15 | matches v3.1 | No doc text covers it. |
| C-16 | extends v3.1 §4.7 / §4.11 | v3.1 enforces the floor with the 90% rule. Recovery floors are kept so that normal play rarely hits the clip. Can be dropped if the owner wants one rule. |
| C-17 | n/a (tooling) | |

---

## Global conventions

| Term | Meaning in this sheet |
|---|---|
| HP | Health points. Baseline pool is 100 (C-01), so "6 damage" = 6% of baseline. |
| Mana | Mana points. Starting capacity is 100 (17.5, LOCKED). |
| startup_ms `a→b` | `a` is the untrained (Raw) startup; `b` is the floor that Cast Speed approaches and never passes (4.7). |
| active_ms | Live hitbox time. For projectiles it is max lifetime = range / speed. |
| recovery_ms | Fixed. Recovery is not trainable (keeps the TTK proof in C-14 stable). |
| Hit time | The server tick on which the server's hitbox check first overlaps the defender (4.4). |
| Committed mana | The full mana_cost, taken at the input press (4.3). |
| Combo scaling | Multiplicative: hit k in a combo deals 0.9^(k-1) of its value; resets after a 1.5s gap with no hit (4.11 Law 3). |

---

## C-01 Health, Health regen, and Blood

**C-01a Baseline Health pool: 100 HP for every character.**
Rationale: 4.7 states damage bands as a share of "a baseline Health pool". A pool of 100 makes every band number literal (Echelon 1 deals 3 to 8 HP). The doc never defines Health growth, so the sandbox holds every character at 100. Any later growth (for example from Conditioning, 7.3 "toughness") must raise max Health, which only lengthens TTK; C-14 uses 100 as the worst case. (tune)

**C-01b Health regen.**
- In combat: 0. Health never regenerates while In Combat (4.1).
- Out of combat: 2 HP per second, starting when the In Combat state ends (15s after the last trigger, 4.1). Empty to full takes 50s.
- Blood scales the rate: full rate at Blood 50% or above; linear down to 0 at Blood 10%; 0 below 10% (3.3 LOCKED: "Below 10%: Health regeneration halts").
- Soul Damage (Grey Health) lowers the regen ceiling: Health regenerates only up to (100 - Grey Health) until a secure-bed rest (3.2).
Rationale: no in-combat regen keeps attrition real (4.9) and keeps the C-14 proof simple. 50s out of combat is long enough that disengaging costs something and short enough for a 15-minute mobile session (2.2). (tune)

**C-01c Blood interaction.**
- Blood is a 0-100% pool, separate from Health, with no HUD bar (it is read from body cues, as today).
- A *heavy* hit (C-05) tagged `physical` drains Blood equal to 25% of the Health damage it dealt (for example, a 16 HP Ice Lance drains 4% Blood). Non-physical spells drain no Blood unless their data says so.
- Bleeding Effort (3.4): 2% Blood per forced Step or Technique while Winded (already in the doc).
- Blood 0%: Health drains at 100 HP per 60s = 1.67 HP/s (3.3 LOCKED), ignoring hit caps, because it is not a hit.
- Blood regen: 0 in combat (3.3 LOCKED). Out of combat, 0.5% per second while Hunger and Thirst are both at 80% or more of capacity ("full Food and Water", 3.3); 0 otherwise. Constitution Burn shifts this rate (3.5).
Rationale: Blood should only bite physical fighters and long fights, so the sandbox can mostly ignore it. 25% is enough that a Blade trading Techniques feels it across a fight, but no single hit moves Blood far.
**Reinterpretation (3.3):** "heavy physical hits" is read as heavy (C-05) AND tagged `physical`. "Full Food and Water" is read as 80% or more.

---

## C-02 Mana regeneration

**C-02a Capacity and out-of-combat regen.**
- Starting capacity: 100 (17.5, LOCKED).
- Out of combat: 5% of max capacity per second, after the In Combat state ends. Empty to full takes 20s at any capacity.
- Hunger below 30%: x0.8 (3.3, LOCKED), stacking with every other modifier.
Rationale: "rapid" (3.1) reads as "a short breather refills you". Scaling with capacity keeps the refill time the same for big and small pools, so a large pool is not punished for being large. The Exhaustion Training exploit (Appendix B) is already closed by "purposeful spending" (3.1), not by slowing regen. (tune)

**C-02b In-combat trickle: raise it, keep the stalling halt. OWNER OVERRIDE NEEDED (3.1 is LOCKED).**
- New trickle: 1% of max capacity per 5 seconds (0.2% per second), up from 0.1% per 5s. That is 12 mana per minute at capacity 100, and 36 per minute at capacity 300.
- Combat Regen (5.4) multiplies the trickle from x1.0 (Raw) to x2.0 (Perfected) on the bending curve (4.11 Law 2).
- Stalling halt stays: if In Combat and *passive* for more than 10s, the trickle stops until the player is no longer passive.
- *Activity* (anything here resets the 10s passive timer):
  - starting an offensive action toward an enemy (an Echelon 1+ spell, a Strike, a Technique, a Grab);
  - dealing damage;
  - a **successful** parry (Mana or Physical);
  - feeding a clash or Contest;
  - a **Slip** (a dash or Step that earns the 4.11 refund).
- *Passive* is everything else: holding Barrier or Guard, whiffed parries, dashes or Steps with no hit nearby, and damage-free cantrips.
Rationale: at 0.1%/5s, a 10s halt removes 0.2 mana, which nobody can feel (Appendix B). At 1%/5s, a staller who turtles for 60s forfeits about 10 mana at capacity 100, which is roughly one Firebolt. That makes the halt real while the trickle still reads as "extremely slow": a full refill from the trickle alone takes over 8 minutes. The rejected option (drop the halt) is simpler, but it leaves no mana-side anti-turtle rule apart from block drain.
Clean defense counts as activity because 4.1 lists parrying as a combat trigger and 4.11 Law 4 pays skill in mana. A defender who parries or Slips under real pressure keeps the trickle. A pure turtle (holding block, mashing whiffs, dashing at nothing) still loses it.
**Doc conflict (3.1, LOCKED):** changes the LOCKED value "0.1% per 5 seconds" to 1% per 5s. If the owner keeps 0.1%, the fallback is to drop the stalling halt, because it would do nothing.
**Reinterpretation (3.1):** "no casting, no damage dealt" is read as the activity list above. Holding Barrier is casting but is passive; a successful parry, a Contest feed and a Slip are activity, consistent with 4.1 and 4.11 Law 4.

**C-02c Overcharge (Hollow Classic Mage): 2 HP per mana point, all of it as Grey Health.**
Rationale: "high Health cost per mana point" (3.2). At 2:1, an Overcharged Firebolt (12 mana) costs 24 HP, which is a real desperation trade. Overcharge damage is self-inflicted, so it is not a hit and ignores hit caps. Overcharge casts cannot be cancelled (3.2). Not needed for the first sandbox pass. (tune)

---

## C-03 Dash (casters) and Step (physical)

| Field | Dash (mana) | Step (vowed, 3.4) |
|---|---|---|
| Cost | 8 mana, flat | 12 Strain (3.4), reduced by Footwork. v3.1 §3.4: each Step within 2s of the last costs 50% more, and a Step delays Strain recovery by 0.8s (about five chained Steps cause Winded). Below 30% Hunger, Strain recovery is 20% slower (v3.1 §3.3). |
| Cooldown | 800ms, from dash start (4.3) | same |
| I-frames | 150ms, from the server-estimated input time (4.4), frame 0 | same |
| Motion | 12 studs over 250ms, directional (Shift) | 10 studs over 250ms |
| Vulnerable tail | 100ms (frames 150 to 250) | same |
| Availability | Not at 0 mana (LOCKED, 4.3); not during own startup (4.3) | Winded: Bleeding Effort, 2% Blood |
| Slip refund (4.11 Law 4) | Full 8 mana if a hit's hit time falls in the first 100ms of the i-frames | Strain refunded |

**C-03a Dash-cancel rule:** dashing out of your own recovery is allowed (4.3), but it does not let you act sooner. You cannot start another offensive action until the cancelled recovery would have ended. Dash-cancel is an escape, not a DPS tool.
Dash gets no chaining surcharge. Mana barely refills in combat, so a chain of dashes already costs 8 mana each, permanently, which is the mana-side equivalent of the v3.1 Step rule.
Rationale: 8 mana is 8% of a starter pool. That is about 12 dashes from full, so panic-dashing drains you inside one fight, while a 300-capacity mage can dash freely enough to feel mobile. Without C-03a, dash-cancelling Echelon 2 recovery would break the C-14 TTK floor. (tune)
**Reinterpretation (4.11 Law 4 Slip):** "the last 100ms of its approach" is read as "the hit would have landed within 100ms after the dash input", which is a later and more confident dodge.

---

## C-04 Block (Barrier) math

**C-04a Units.**
- *Incoming Spell Energy (E)* = the hit's Health damage after all multipliers and caps, as if it were unblocked. Physical hits use the same value, so one formula covers spells, Strikes and Techniques.
- *Block Proficiency (BP)* = HP of energy absorbed per mana point. It is unitless in practice: **starting BP = 1.5**, rising to **3.0 at Perfected** on the bending curve (Law 2: about 2.6 at the curve's midpoint).
- **Mana Drain on hit = E / BP** (4.5, formula unchanged). Anti-turtle: Breaker Techniques multiply this by 1.5 (4.12).

**C-04b Block drain: 2 mana per second x (1.5 / BP)** while Blocking. It starts when the parry window ends (C-07). The parry window itself is free.

**C-04c Chip damage = E x chip rate x (1.5 / BP), capped at 50% of E (4.5).**

| Echelon | Base chip rate |
|---|---|
| 0, 1 | 0% |
| 2 | 10% |
| 3 | 25% |
| Breaker class (any echelon) | +10% |

**C-04d Barrier collapse:** if the drain is larger than current mana, the Barrier pays what it can. The unpaid fraction of E passes through as Health damage, the Barrier shatters (a Reel, C-05, even from a light hit), and the defender is Hollow.

Worked examples at starting BP 1.5:

| Hit | E (HP) | Mana drained | Chip (HP) | Reel? |
|---|---|---|---|---|
| Shard | 4 | 2.7 | 0 | no |
| Firebolt | 6 | 4.0 | 0 | no |
| Fireball (direct) | 14 | 9.3 | 1.4 | yes |
| Ice Lance | 16 | 10.7 | 1.6 | yes |
| Torrent (4 ticks of 4) | 16 | 10.7 total | 3.2 total (Breaker 20%) | yes, on the first tick |

Rationale: at the start, blocking trades about 1 mana for 1.5 HP, so blocking is clearly better than eating hits but still drains a 100 pool fast (about 10 Fireballs empties it). A Perfected blocker pays half as much. The 1.5/BP factor makes chip fall as BP rises, which matches "high-density spells hitting a low-level block" (4.5). (tune)

**C-04e Guard (Strain, physical) per hit = clamp(round(0.7 x E), 5, 20) Strain** (3.4 gives the 5 to 20 range). Heavy hits still Reel (4.12).

---

## C-05 Heavy hits, Reel, Guard Break, and Reel resistance

**C-05a Definition. A hit is *heavy* if it is Echelon 2 or higher, OR its parry_class is Breaker.** Echelon 0 and 1 hits are never heavy, however they are trained or overcharged. For beams, only the first tick against a given target is heavy.
Rationale: one boolean that never changes with stats, so players can read it from the echelon size and sound tier (C-10). Light pressure drains a block; heavy pressure breaks one. A pure Echelon 1 turtle-breaker must use Grabs or drain, which is the intended answer (4.11 Law 5). (tune)

**C-05b Reel (4.5):** 600ms hitstun plus 6 studs of knockback, with visible cracking. The Barrier stays up, but cracked: block math still applies, and the defender cannot act.
**C-05c Guard Break:** a heavy hit on a defender who is in Reel and past the settle window (C-05e). The result is 1.2s of stun, the Barrier dropped, and the defender in a *vulnerable* state where every hit counts as a counter-hit (+15%, still under the hit caps).
**C-05d Chain protection:** 2.0s of Guard Break immunity after a Guard Break ends (4.5).

**C-05e Group-fight Reel resistance (23 recommended default, plus one spacing rule):**
1. *Settle window:* a heavy hit inside the first 250ms of a Reel is blocked normally but can neither Guard Break nor restart the Reel.
2. *Growing resistance:* each Reel the defender suffered in the last 6s shortens the next Reel by 25%: 600, then 450, then 340, with a floor of 300ms.
3. The result: the Guard Break window inside a Reel shrinks from 350ms to 200ms to 90ms to 50ms, so focus-fire must be coordinated to break a guard, and three attackers cannot do it by accident.
Rationale: the doc's recommendation (grows per recent Reel) covers repeated Reels. The settle window covers the near-simultaneous case the recommendation misses: two Fireballs arriving 30ms apart. In 1v1 neither rule ever triggers, because one attacker's heavy hits are at least 850ms apart (C-14). (tune)
**Reinterpretation (4.5):** the doc offers "resistance OR minimum spacing". This uses both, because they solve different cases.

---

## C-06 Basic Strike (Left Click)

Strikes are Echelon 1 (4.12), so the 250ms Echelon 1 startup floor applies to every Left Click. Strain cost is 5 (3.4). All Strikes are Parryable, physical, and repeatable on a single press (no strings in the sandbox). Combo scaling applies.

| Field | Unarmed | Basic staff | Basic sword |
|---|---|---|---|
| startup_ms | 300 → 250 | 380 → 250 | 350 → 250 |
| active_ms | 80 | 120 | 100 |
| recovery_ms | 250 | 300 | 300 |
| Damage | 3 | 3 | 5 |
| Strain | 5 | 5 | 5 |
| Hitbox | box 2w x 2h x 4d studs, from the chest | box 2w x 2h x 7d (a thrust line) | 90° arc, 6-stud radius, 2 studs tall |
| On hit | 150ms flinch (C-15) | 150ms flinch + **3-stud push** | 150ms flinch |
| Physical Parry (F tap) | vs melee only; 3 Strain | vs melee only; 3 Strain + 1 durability | vs melee and spells (blade); costs per 3.2 and 4.12 |
| Casting | casts freely | **casts freely in either stance; no R toggle needed** | R toggle to Casting Stance, 300ms |
| Durability | n/a | 100; a melee parry costs 1 | 100; melee parry 1, spell parry with mana 3, spell parry at 0 mana 25 ("massive", 3.2) |
| skill_notes | Mix-up: fastest frames, so it punishes recovery. Counterplay: shortest reach; step back 1 stud. | Mix-up: the push sets spacing for a spell follow-up. Counterplay: the slow startup can be read and parried. | Mix-up: the arc catches side-dashes. Counterplay: the parry durability tax; out-range it with spells. |

**What the staff actually does differently:** it is the *caster's* melee weapon. It has the longest reach and its hit pushes the target 3 studs to make spacing, but it deals only unarmed damage, and it never needs a stance swap to cast. The sword hits harder and can parry spells (blade), but casting costs it a 300ms R toggle. Neither weapon changes a window. Both trade economy and reach (Law 1).

**C-06a F before Barrier is learned. Superseded by v3.1 §17.5 ("Before Barrier"),** which adopts the same rule: until Barrier is learned, F is a body Guard and Physical Parry paid in Strain. This sheet adds only the numbers:
- Physical Parry: 0.2s window and 3 Strain.
- Guard: Strain per C-04e.
- Without a blade, a bare-hand or staff parry works against melee only.
- The staff or sword also pays the durability shown in the table above.

---

## C-07 Barrier timing: tap versus held

**Reconciliation.** 4.7 names Barrier as "the exception to the rules below" for Echelon 0. This sheet reads that exception as covering the 150ms Echelon 0 startup floor too. The floor exists so that *threats* are readable; Barrier threatens nothing. So the parry window opens on frame 0, at the server-estimated input time (4.4), and "at the start of the Barrier cast" (4.6) means exactly that.

Timeline (t = F input time, server-estimated):

| t (ms) | Tap (released before 200) | Held (F still down at 200) |
|---|---|---|
| 0 | Parrying state. Window opens. 0 mana. The Barrier shell VFX starts forming. | same |
| 0-200 | Any Parryable or Grab hit with hit time in [0, 200] is parried. One press parries every qualifying hit in its window. | same |
| 100 | Shell VFX fully visible (cosmetic). | same |
| 200 | Window closes. No hit: Parry whiff, then Parry Recovery for 400ms (to t = 600). No block, no parry. | Becomes Blocking. Block drain starts (C-04b). |
| release | n/a | Block ends. A 150ms Barrier release lag follows, during which F cannot be pressed again. |

Hits of other classes inside the window: a Breaker or Unparryable hit is resolved as a *block* (C-04 math; a Breaker also causes Reel). A Grab is parried (4.2).
Successful parry: Tempo (+300ms to the attacker's recovery, 4.6), a return of 20% of the attacker's committed mana, capped at 15% of max pool per engagement (4.11), and no stacking of Tempo against the same attacker (4.6).
**Input buffer:** an F press up to 80ms before F becomes legal (during your own recovery or release lag) fires on the first legal frame, and the window starts *then*. The buffer moves the start of the window and never lengthens it (2.3, Law 1).
**C-07a Parrying while Hollow (v3.1 OPEN item in §23). Recommendation: accept the doc's default, with three precisions.**
1. A Hollow mage may tap F for a Mana Parry with the normal 0.2s window. The window is not halved (Law 1); the halved window stays specific to blade parries (3.2).
2. Success gives the normal parry return (20% of the attacker's committed mana, inside the 15% per-engagement cap). The returned mana counts toward the Hollow exit threshold below, so a Fireball parry (12 back) ends Hollow at once and a Shard parry (1.6 back) does not. A whiff deals 5 Grey Health (5% of max, Soul Damage) plus the normal 400ms Parry Recovery.
3. Holding F while Hollow does nothing: no Barrier and no block (3.2, LOCKED). A Breaker or Unparryable hit inside a Hollow parry window lands in full, since there is no block to fall back on.
- Add hysteresis to the state: Hollow ends at 5 mana (5% of capacity at 100), not at 1. Without it, the C-02b trickle and parry returns would flicker the state on and off.
- Rationale: it gives Hollow a read to make and keeps parry return as the skilled way back. The Soul Damage on a whiff stops desperate F-mashing at no cost. It never widens a window.
- **Doc addition (3.2):** the 5-mana exit threshold is new.

**Doc conflict / reinterpretation (4.7 vs 4.6):** this reads the Barrier exception to include the startup floor. The alternative (a 150ms startup, then the window) would put the parry 150ms behind every other defense and make "tap in the window" (4.3) feel broken.

---

## C-08 Projectile speed tiers and hitboxes

**C-08a Speed per echelon (4.11 Law 6). Training never changes speed.** Range training changes distance only; Cast Speed changes startup only.

| Echelon | Speed (studs/s) | Typical range | Size class (visual = hitbox) |
|---|---|---|---|
| 0 cantrips | 60 | 25-30 | at most 1 stud |
| 1 Lesser | 120 | 25-80 | hand-sized: sphere or capsule radius 0.5-1.25 |
| 2 Greater | 80 | 90-100 | body-sized: radius 0.75-2.5, AoE radius up to 8 |
| 3 Calamities (not in the sandbox) | 40 for the falling body | n/a | sky-scale: AoE radius 15-25 |
| Beam head (any echelon) | 160, extending | 50-60 | capsule radius 1 |

Rationale: player walk speed is 16 studs/s and a dash covers 12 studs in 250ms. A Firebolt cast from 30 studs gives startup (250) plus travel (250) = 500ms to react, which is learnable. Bigger spells are slower, so they are dodgeable at range and must be thrown closer or used to cut space. (tune)

**C-08b Hitbox shapes (honest hitboxes, Law 6):**
- Projectiles: a sphere or capsule, swept along the path every server step (Spherecast or Shapecast, so nothing tunnels at 120 studs/s, which is 2 studs per 60Hz step).
- Melee: an oriented box or arc sector, live only during active_ms.
- AoE: a sphere or cylinder, evaluated once on the detonation tick.
- Ground-targeted (Grabs, slams): a cylinder, with its decal shown from Telegraph_Start.
- Rule: the hitbox is never larger than the visual core. Glow and particles may extend past it, never the reverse. No hitbox outlives its visual.

**C-08c Contest residuals keep their echelon speed.** They are smaller (hitbox x0.6) and weaker, but not slower.
**Doc conflict (4.8 vs 4.11 Law 6):** 4.8 says the winning spell continues "smaller, slower". This keeps the speed fixed, so dodging stays learnable. If the owner prefers 4.8, use 0.75x speed with a visibly different VFX.

---

## C-09 Elements and the Element Relation table

Elements: fire, ice, water, lightning, earth, wind, void. Physical and Barrier are non-elemental (neutral).

One six-element ring. Each element beats the next one, so every classical element has exactly one strength and one weakness, plus a neutral void:

**lightning > water > fire > ice > wind > earth > lightning**

| Edge | Flavor | Doc-named opposed pair (4.8)? | Residue (4.8) |
|---|---|---|---|
| lightning > water | water conducts | yes | charged puddle |
| water > fire | douses | yes (the 4.8 example) | none |
| fire > ice | melts | yes | steam cloud |
| ice > wind | freezes the gale still | no | none |
| wind > earth | erodes | yes | dust screen |
| earth > lightning | grounds it | no | none |

- **Void:** neutral to everything (x1.0 both ways). It is the "pure mana" element, with no relation edge and no residue.
- Every opposed pair the doc names (water/fire, fire/ice, lightning/water, earth/wind) is a relation edge. Every residue sits on an edge, consistent with 4.8's "opposed-element clashes".

| Attacker \ Target | Fire | Ice | Water | Lightning | Earth | Wind | Void |
|---|---|---|---|---|---|---|---|
| Fire | 1.0 | **1.1** | 0.9 | 1.0 | 1.0 | 1.0 | 1.0 |
| Ice | 0.9 | 1.0 | 1.0 | 1.0 | 1.0 | **1.1** | 1.0 |
| Water | **1.1** | 1.0 | 1.0 | 0.9 | 1.0 | 1.0 | 1.0 |
| Lightning | 1.0 | 1.0 | **1.1** | 1.0 | 0.9 | 1.0 | 1.0 |
| Earth | 1.0 | 1.0 | 1.0 | **1.1** | 1.0 | 0.9 | 1.0 |
| Wind | 1.0 | 0.9 | 1.0 | 1.0 | **1.1** | 1.0 | 1.0 |
| Void | 1.0 | 1.0 | 1.0 | 1.0 | 1.0 | 1.0 | 1.0 |

Rules:
- The relation multiplies **Clash Power only** (4.8). It never changes damage, so C-14 holds whatever the elements.
- A residue spawns only when both clashing spells form one of the three residue edges above. Non-adjacent pairs (for example fire and earth) are neutral and leave no residue.
- Aether Horror elemental buffs apply as strengths only (4.8).
Rationale: a single ring is balanced by construction (each row and column has one 1.1 and one 0.9), covers every opposed pair the doc names, and gives each element exactly two relations to learn. (tune)

Effect on the starter spells (C-11): the skill_notes still hold.
- Fire beats ice, so a Firebolt answering a Shard, or a Fireball answering an Ice Lance, gets 1.1 on top of the Last Word.
- New edges worth testing in the sandbox: Arc (lightning) gets 1.1 against Torrent (water), and Stonegrip (earth) is not a projectile, so it never clashes.
**Assumption:** void is not a starter element. No sandbox spell uses it.

---

## C-10 Telegraph language

Principle: **shape and sound carry the class; color is redundant reinforcement.** Every class must be identifiable with color removed and with sound off (though not both at once). Colors come from the Okabe-Ito colorblind-safe palette and are separated by luminance as well as hue.

**C-10a Parry-class signatures** (identical across all servers, Horrors and players, 4.9). The marker shows from Telegraph_Start to Active_Start, at the caster's hand or weapon (projectiles and melee) or on the ground (area attacks).

| Class | Shape marker | Color | Sound signature | Answer |
|---|---|---|---|---|
| Parryable | 4-point star glint on the hand or weapon | White #FFFFFF (highest luminance) | single high bell "tink" | parry, block, dodge |
| Breaker | jagged, cracked ring around the caster or weapon | Vermillion #D55E00 (mid luminance) | two beats, low and then sharp: "thud-CRACK" | dodge or out-space; block causes Reel |
| Unparryable | filled ground decal with diagonal hatching, outlining the exact area | Yellow #F0E442 with a dark outline | one continuous rising whoosh across the whole startup | dodge or block |
| Grab | inward-pulling chevrons converging on the target point, or a reaching hand | Blue #0072B2 with a white rim | sharp reversed inhale plus a short chain rattle | parry, dash, or hit the caster |

**C-10b Echelon tiers (4.7 "Reading echelons").** These layer on top of the class signature.

| Echelon | Size | Sound | Heard within |
|---|---|---|---|
| 0 | at most 1 stud, a puff | soft click or "pff" | 20 studs |
| 1 | hand-sized, 1-2 studs | sharp, bright transient | 60 studs |
| 2 | body-sized, 4-6 studs | rumble **with 200-400 Hz harmonics** | 120 studs |
| 3 | sky-scale: sky tint and ground sigils | horn or drone | 400 studs (the whole area) |

**C-10c Low-end mobile and readability rules.**
- The telegraph layer is gameplay. It is exempt from graphics-quality scaling, the VFX budget and distance culling. Budget per telegraph: 1 decal + 1 billboard + at most 12 particles.
- Minimum on-screen size: the class marker renders at no less than 24px tall at any combat distance (the billboard scales up with distance).
- Telegraph sounds use a reserved priority group and are never voice-stolen by ambient or impact sounds.
- Phone speakers cannot reproduce sub-bass, which is why the Echelon 2 rumble carries 200-400 Hz harmonics. Never rely on frequencies below 150 Hz.
- Element VFX must not use the class colors as their dominant hue at the hand or weapon. Fire VFX that sits near vermillion keeps its class marker on a separate rim layer.
Rationale: a deuteranope or protanope reads vermillion and yellow as different luminances of yellow-brown, and white and blue as the extremes, so no two classes collapse together. Shapes differ in topology (point, ring, filled area, converging lines). (tune)

---

## C-11 Starter spell list

Data fields follow 4.2. Global rules for these spells:
- Cancel (Right Click or C) is allowed during startup only, and forfeits 50% of committed mana (4.3).
- Hold: Echelon 1 and 2 spells can be held at the end of startup for up to 500ms, draining 5% of their cost per 100ms (4.11 Law 4). A Grab cannot be held.
- Echelon 0 spells (apart from Barrier) fizzle on contact with any Echelon 1+ spell and never clash.
- Damage values are Raw. Durability training moves them toward the top of the band (Echelon 1 up to 8, Echelon 2 up to 18). Hit caps of 12 and 22 apply after everything.
- Bands are respected: Echelon 0 cost 1-5, damage under 2; Echelon 1 cost 5-25, damage 3-8; Echelon 2 cost 40-120, damage 8-18. Startup floors are 150 / 250 / 450, and 400 for any Grab.
- Recovery floors (new property, see C-16): 150 / 200 / 400.
- Contest feeding (v3.1 §4.8) needs a fresh press-and-hold after release, so a spell's Hold never turns into feeding. The Contest margin is 35%.
  - Example: Firebolt (12) answering a Shard (8) gives 12 x 1.25 Last Word x 1.1 fire-over-ice = 16.5 against 8. That is over the margin, so it overwhelms.
  - Example: Fireball (60) answering an Ice Lance (70) gives 82.5 against 70, which is 18% over. That is inside the margin, so it enters a Contest.
- Mana Sense goes in a utility slot, not a combat slot (v3.1 §4.11 Law 5 fixed action set). The other cantrips may sit in either.

### Echelon 0 (cantrips)

```yaml
- id: e0_barrier
  echelon: 0
  mana_cost: 0 (parry); block drain per C-04
  startup_ms: 0  (exempt, C-07)
  active_ms: 200 parry window, then Blocking while F is held
  recovery_ms: 400 on whiff (Parry Recovery); 150 release lag
  parry_class: n/a (defense)
  hitbox: shell, sphere radius 3.5 around the caster, omnidirectional
  cancel: n/a
  telegraph: pale shell (not a class color), a soft hum; on a successful parry, a bright flash and a ring sound (4.6)
  skill_notes:
    mixup: the attacker cannot tell a tap from a held press until 200ms, so the parry/block choice is hidden
    counterplay: Breakers Reel it, Grabs ignore the block, and delayed Holds bait parry whiffs
- id: e0_cinder
  echelon: 0
  element: fire
  mana_cost: 2
  startup_ms: 180 -> 150
  active_ms: 500 (30 studs at 60 studs/s)
  recovery_ms: 150
  damage: 1
  parry_class: Parryable
  hitbox: sphere radius 0.5
  cancel: startup only
  telegraph: [parryable, ech0, fire]
  skill_notes:
    mixup: a near-free poke that tests whether the defender taps or holds F, and makes turtles pay block drain
    counterplay: it fizzles on any Echelon 1 spell, so one Shard answers it and keeps flying
- id: e0_gust
  echelon: 0
  element: wind
  mana_cost: 3
  startup_ms: 200 -> 150
  active_ms: 100
  recovery_ms: 200
  damage: 0; 5-stud knockback; no flinch; never interrupts a cast
  parry_class: Unparryable (area)
  hitbox: cone 60 degrees, 8 studs
  cancel: startup only
  telegraph: [unparryable, ech0, wind]
  skill_notes:
    mixup: shove a foe into a Fireball's splash, off a ledge, or off a Contest lane
    counterplay: dash through it (i-frames) or block it (a blocked Gust gives no knockback)
- id: e0_frostmote
  echelon: 0
  element: ice
  mana_cost: 3
  startup_ms: 200 -> 150
  active_ms: 417 (25 studs at 60 studs/s)
  recovery_ms: 150
  damage: 0; Chill = -15% walk speed for 1.5s (dash and Step are unaffected)
  parry_class: Parryable
  hitbox: sphere radius 0.5
  cancel: startup only
  telegraph: [parryable, ech0, ice]
  skill_notes:
    mixup: Chill shortens how far a target can walk out of a Fireball's splash, which forces a dash
    counterplay: parry or block it for almost nothing; Chill never touches dash distance
- id: e0_manasense
  echelon: 0
  element: none
  mana_cost: 5
  startup_ms: 300 -> 150
  active_ms: 1000 pulse
  recovery_ms: 150
  damage: 0
  parry_class: n/a (no hitbox on others)
  hitbox: none (40-stud reveal pulse)
  cancel: startup only
  telegraph: [ech0], a soft hum that others nearby hear
  skill_notes:
    mixup: catches a suppressed caster winding up before the fight starts
    counterplay: Suppression (5.11); the hum gives away the sensor
```

### Echelon 1

```yaml
- id: e1_firebolt          # family: Firebolt -> Fireball -> Sunfall
  echelon: 1
  element: fire
  mana_cost: 12
  startup_ms: 320 -> 250
  active_ms: 667 (80 studs at 120 studs/s)
  recovery_ms: 250
  damage: 6
  parry_class: Parryable
  hitbox: sphere radius 1.0
  cancel: startup only (50% forfeit); hold up to 500ms
  telegraph: [parryable, ech1, fire]
  skill_notes:
    mixup: a 0-500ms Hold breaks the defender's parry rhythm
    counterplay: intercept it with any Echelon 1 spell for the Last Word; parry on arrival
- id: e1_shard             # family: Shard -> Lance -> Shardstorm
  echelon: 1
  element: ice
  mana_cost: 8
  startup_ms: 280 -> 250
  active_ms: 583 (70 studs at 120 studs/s)
  recovery_ms: 200
  damage: 4
  parry_class: Parryable
  hitbox: capsule radius 0.5, length 1.5
  cancel: startup only; hold up to 500ms
  telegraph: [parryable, ech1, ice]
  skill_notes:
    mixup: the fastest cycle (450ms at the floor); pair two Shards with different Hold lengths
    counterplay: the block is cheap (2.7 mana); a Firebolt answer overwhelms it by Clash Power
- id: e1_arc
  echelon: 1
  element: lightning
  mana_cost: 10
  startup_ms: 300 -> 250
  active_ms: 208 (25 studs at 120 studs/s)
  recovery_ms: 250
  damage: 5
  parry_class: Parryable
  hitbox: sphere radius 1.25
  cancel: startup only; hold up to 500ms
  telegraph: [parryable, ech1, lightning]
  skill_notes:
    mixup: arrives almost on Active_Start at point-blank range, the close-range pressure tool
    counterplay: stay beyond 25 studs and it whiffs completely
- id: e1_windslash         # Slash wave (Sword Mage Projection, 7.2)
  echelon: 1
  element: wind
  mana_cost: 10
  startup_ms: 300 -> 250
  active_ms: 292 (35 studs at 120 studs/s)
  recovery_ms: 250
  damage: 5
  parry_class: Parryable
  hitbox: flat box 6 wide x 1 tall x 1 deep, at chest height
  cancel: startup only; hold up to 500ms
  telegraph: [parryable, ech1, wind]
  skill_notes:
    mixup: its width beats a side-dash
    counterplay: jump over the 1-stud band, or stand beyond 35 studs
- id: e1_stonegrip
  echelon: 1
  element: earth
  mana_cost: 15
  startup_ms: 500 -> 400 (the Grab floor applies, since it is above the Echelon 1 floor)
  active_ms: 150
  recovery_ms: 400
  damage: 7, dealt on release; target held 700ms, then thrown 6 studs; no Reel
  parry_class: Grab (ignores block)
  hitbox: cylinder radius 2.5, height 4, at the aim point up to 20 studs away (ground-targeted)
  cancel: startup only; no hold
  telegraph: [grab, ech1, earth], with the ground decal from Telegraph_Start
  skill_notes:
    mixup: punishes a defender who holds block
    counterplay: step out of the decal, tap parry, or hit the caster during its 400ms+ startup
```

### Echelon 2

```yaml
- id: e2_fireball
  echelon: 2
  element: fire
  mana_cost: 60
  startup_ms: 600 -> 450
  active_ms: 1250 (100 studs at 80 studs/s)
  recovery_ms: 450
  damage: 14 direct (heavy); explosion radius 6 deals 8 to everyone else inside it (Unparryable). The direct target takes no splash on top.
  parry_class: Parryable projectile + Unparryable splash
  hitbox: sphere radius 2.0; explosion sphere radius 6
  cancel: startup only; hold up to 500ms; aim curve up to 10 degrees over the first 20 studs while the button is held at release
  special: a parried Fireball is dispelled with no detonation. A blocked one detonates on the shell. A clashed one detonates at the collision point (4.8).
  telegraph: [parryable, ech2, fire]; at the projectile, the splash radius shows as a faint yellow-hatched sphere
  skill_notes:
    mixup: aim at the ground beside a parrier, so the Unparryable splash forces a dash; it curves slightly with aim at release
    counterplay: intercept it far away with any spell to detonate it out of range (4.8)
- id: e2_icelance          # family: Shard -> Lance -> Shardstorm
  echelon: 2
  element: ice
  mana_cost: 70
  startup_ms: 650 -> 450
  active_ms: 1125 (90 studs at 80 studs/s)
  recovery_ms: 450
  damage: 16 (heavy, physical: drains Blood per C-01c); pierces, hitting up to 2 targets
  parry_class: Parryable
  hitbox: capsule radius 0.75, length 5
  cancel: startup only; hold up to 500ms
  telegraph: [parryable, ech2, ice]
  skill_notes:
    mixup: Hold shifts its timing, and the pierce punishes two foes lined up
    counterplay: a thin line, so side-dash it; or clash it with a Fireball cast as an answer (Last Word)
- id: e2_torrent
  echelon: 2
  element: water
  mana_cost: 80
  startup_ms: 700 -> 450
  active_ms: 800 (beam)
  recovery_ms: 500
  damage: 4 ticks x 4 at 200ms intervals = 16 per target per cast; each tick is a combo hit; only the first tick is heavy
  parry_class: Breaker (beams default to Breaker, 4.7)
  hitbox: capsule radius 1, length 50; the head extends at 160 studs/s; turn rate 45 degrees/s while active
  cancel: startup only; hold up to 500ms
  special: cuts Echelon 1 projectiles, and same-echelon projectiles when its Clash Power is equal or higher (4.8)
  telegraph: [breaker, ech2, water]
  skill_notes:
    mixup: against a habitual parrier it forces a dodge, and its sweep covers the dodge's path
    counterplay: a lateral dash outruns a 45 degrees/s turn; a Blade that knows any Technique can Spellcut it (Spellcut clashes at Echelon 2 only then, v3.1 §4.12)
```

**Reinterpretation (4.7):** for beams and multi-tick spells, the damage band applies per cast (Torrent's 16 total), and the hit cap applies per tick.
**Assumption (4.12):** the 400ms Grab startup floor (stated for physical Grabs) also applies to Grab-class spells.
**Note:** Echelon 1 needs Capacity 120 and Echelon 2 needs 300 (5.20), but starting capacity is 100. The sandbox therefore needs capacity presets (C-17).

---

## C-12 Server tick, input buffer, and latency harness

**C-12a Tick and simulation assumptions.**
- Combat simulation step: the server's Heartbeat, about 60Hz (16.7ms). Hitbox sweeps, PendingHit resolution and state transitions run every step.
- Timing comparisons use continuous timestamps (`workspace:GetServerTimeNow()`), never tick counts. A parry succeeds if `parry_input_time <= hit_time <= parry_input_time + 200`. Tick quantization therefore affects only *when* a result is applied (at most 16.7ms late), never *whether* it succeeds.
- Projectiles are server-simulated as math (origin + direction x speed x t) with a swept Spherecast or Shapecast per step. They are not physics parts. Clients render cosmetic copies.
- No attacker rewind: hits are tested against the server's current defender position. Delayed resolution (4.4) is the only latency help, and it goes to the defender.
- Replication: assume clients see others' state at 20-30Hz effective, and interpolate. Do not depend on replicated physics for any outcome.

**C-12b Compensation C (4.4).**
- C = smoothed one-way latency, taken as half of the engine-measured round trip (`Player:GetNetworkPing()`). It is never client-reported.
- Smoothing: a rolling median over 7s. Slew limit: C moves by at most 20ms per second. Cap: C_max = 200ms.
- Estimated input time = server arrival time - C. Reject (clamp to arrival - C) any estimate earlier than arrival - C - 50ms, or later than arrival.
- Resolution happens at hit_time + C. Dash i-frames and blocks use the same C (4.4).

**C-12c Input buffer: 80ms, on every platform (2.3).** An input pressed up to 80ms before it becomes legal (during recovery, Parry Recovery, release lag, or dash cooldown) is queued and fires on the first legal frame. Its window or i-frames start *then*, so the buffer never lengthens a window (Law 1). Only the most recent buffered input is kept.

**C-12d Latency harness parameters (Section 22).**

| Parameter | Values |
|---|---|
| One-way delay (defender) | 0, 80, 150, 200, 300 ms |
| One-way delay (attacker) | 0 and 150 ms (checks that attacker lag never changes defender outcomes) |
| Jitter (Gaussian standard deviation) | 0, 20, 50 ms |
| Packet loss | 0%, 1%, 5% |
| Spike scenario | +400ms for 1s, mid-fight (tests the slew limit; must earn no extra compensation) |
| Scripted defender input offset vs hit time | -20, 0, +100, +190, +199, +201, +250 ms (parry), and the same set for dash |
| Attacks | Shard, Firebolt, Fireball (direct and splash), Torrent, Stonegrip, unarmed Strike |
| Trials per cell | 200 |

Harness implementation: a server-side delay queue applied to RemoteEvent traffic per test client, with scripted bot inputs, plus Studio's network simulation for a smoke check.

Pass criteria:
- Delay up to 200ms, jitter 0: 100% of outcomes match the 0ms baseline for identical inputs.
- Jitter 20ms: at least 99% match, and every mismatch is within 1 tick of a window edge.
- Jitter 50ms or 5% loss: logged as data, not pass/fail.
- 300ms: the defender is treated as having C = 200. Inputs that are effectively 100ms late are expected to fail. The expected outcome table is generated by the same resolver with C = 200, and the harness verifies the capping is logged.
- Determinism: replaying recorded input logs reproduces identical results (22).
- Timing tests: data startup, active and recovery values match the animation markers within 1 tick (4.2, 22).

---

## C-13 Sword Mage 0-mana parry versus Law 1: proposed wording

**Superseded by v3.1 §4.11 Law 1,** which now says: "The one state exception is the Sword Mage's halved blade parry at 0 mana (3.2): a penalty, never a bonus." That resolves the conflict. The fuller wording below stays optional: it also explains why vowed Blades keep 0.2s and fits C-07a. Accept it only if the owner wants Law 1 phrased as a rule about state rather than as a single exception.

The original conflict: 3.2 and 4.4 halve the blade parry window to 0.1s at 0 mana, while 4.11 Law 1 says the parry window is "identical for every character".

Proposed replacement for the first sentence of Law 1 (4.11):
> "Windows depend on **state**, never on stats. In the same state, the parry window (0.2s), dash i-frames (150ms), Contest windows, startup floors and the readability floor are identical for every character. The only state that changes a defensive window is Hollow: a mana-reinforced blade parry made while Hollow uses 0.1s (3.2). Vowed characters never become Hollow (7.3), so their windows never change."

Also add to 3.2: "This is a state penalty, identical for every Sword Mage, and no stat, glyph, food or item can change it (4.11 Law 1)."
Rationale: it keeps the LOCKED Sword Mage rule, keeps Law 1's intent (no build widens or narrows a window), and explains the vowed Blade's 0.2s as following from the Vow, rather than as a perk that changes a window.

---

## C-14 TTK sanity check (4.11 Law 3: a full-health target survives at least 4s of perfect pressure)

**Assumptions (all worst case):**
- The target has 100 HP, takes every hit unblocked and never escapes.
- The attacker has unlimited mana (a large-capacity mage), every Cast Speed at its floor, and every hit at its echelon **hit cap** (12 / 22 / 35). That covers maximum Durability, Overcharge, counter-hit (+15%) and Guard Break vulnerability all at once.
- Zero travel time (point-blank range).
- Combo scaling is 0.9^(k-1) and never resets, because the attacker never leaves a 1.5s gap.
- One action at a time: no Parallel Casting, which is deferred (21.2). Dash-cancel gives no speed-up (C-03a).
- Time between consecutive hits = the previous action's recovery + the next action's startup. Time is measured from the **first hit landing** (conservative: the first startup is not counted).

| Action | Startup floor | Recovery floor | Cycle | Hit cap |
|---|---|---|---|---|
| Echelon 1 spell | 250 | 200 | 450ms | 12 |
| Strike | 250 | 250 | 500ms | 12 |
| Echelon 2 spell | 450 | 400 | 850ms | 22 |
| Echelon 3 spell | 900 | 1500 | 2400ms | 35 (at most 2 per full pool: cost is at least 40% of capacity, 4.7) |

**Echelon 2 only (the fastest kill):**

| Hit | t (s) | Damage | Cumulative |
|---|---|---|---|
| 1 | 0.00 | 22.00 | 22.00 |
| 2 | 0.85 | 19.80 | 41.80 |
| 3 | 1.70 | 17.82 | 59.62 |
| 4 | 2.55 | 16.04 | 75.66 |
| 5 | 3.40 | 14.43 | 90.09 |
| 6 | 4.25 | 12.99 | **103.08, dead** |

So the TTK is **4.25s**, which is at least 4.0s. Pass.

**Echelon 1 only:** the cumulative damage is 120 x (1 - 0.9^n). It needs 0.9^n <= 1/6, so n = 18 hits (17 hits reach only 99.98). That takes 17 x 0.45s = **7.65s**. Pass.

**Mixed sequences:** an exhaustive search over every sequence of Echelon 1, Strike, Echelon 2 and up to two Echelon 3 actions (a script in the sandbox repo should repeat this as a CI test on the live spell data) finds the minimum is still the pure Echelon 2 chain, at 4.25s. Example: E3 then four E2s gives 35, 54.8, 72.6, 88.7, 103.1, landing at t = 4.5s.

**Sensitivity (why C-16 exists):**
- Echelon 2 recovery 350 gives exactly 4.00s; 300 gives 3.75s (FAIL).
- Echelon 3 recovery 1000 gives 4.00s; 800 gives 3.80s (FAIL). Recovery must stay at least 1300ms to keep margin.

**Realistic check (starter versus starter, capacity 120, untrained Firebolt):** 6 damage, cycle 320 + 250 = 570ms, so 10 casts (120 mana) deal 6 x (1 - 0.9^10) / 0.1 = 39 HP. A starter cannot kill a starter with mana alone, so melee and reads decide early fights. This is intended.

**v3.1 re-verification (§4.11).**
1. *Combo scaling after the cap.* The proof above already applies scaling to capped values, so the v3.1 rule matches its assumption.
2. *Two readings of "each consecutive hit deals 10% less than its capped value".*
   - Compounding (0.9^(k-1)), as used above: the floor holds on recovery floors alone.
   - Flat (every hit after the first at 0.9 x cap): an Echelon 2 chain deals 22 + 4 x 19.8 = 101.2 by t = 3.4s, which FAILS without the new damage window rule.
   - Recommendation: state the compounding reading in 4.11.
3. *New rule: at most 90% of max Health per attacker per rolling 4s window.* Implement the window as closed, [t - 4.0s, t]. Then no single attacker can deal 100 within 4.0s, under any reading or any future data. Re-run of the fastest chain with the rule:

| Reading | Hits 1-5 (t = 0 to 3.4s) | Hit 6 (t = 4.25s) | Result |
|---|---|---|---|
| Compounding | 90.09, so hit 5 is clipped by 0.09 to reach 90.00 | the window (0.25, 4.25] holds 80.99, so the full 12.99 applies, reaching 102.99 | dead at **4.25s**, PASS |
| Flat | 101.2, so hit 5 is clipped to 8.6 to reach 90.0 | the window holds 68.0, so the full 19.8 applies, reaching 109.8 | dead at **4.25s**, PASS |

Under the compounding reading, the 90% rule barely touches normal play (one 0.09 HP clip). That is why C-16 is kept: the recovery floors do the shaping, and the 90% window is the guarantee.

**Group note:** C-14 covers one attacker, as Law 3 specifies. Group TTK is governed by C-05e and chain protection, not by this floor.

---

## C-15 Hit reactions on unblocked hits (needed by C-06 and C-14)

| Hit | Reaction |
|---|---|
| Echelon 0 | none (Gust: knockback only) |
| Echelon 1 / Strike | 150ms flinch. It interrupts the defender's startup (their spell is cancelled with the normal 50% forfeit) but not their active frames or a started Parry (4.3). |
| Echelon 2 / Technique | 300ms stagger plus 4 studs of knockback; Grounding for fliers (4.10) |
| Echelon 3 | 800ms knockdown |

Rationale: the shortest flinch (150ms) is shorter than any attacker cycle (at least 450ms), so a defender always gets a gap to dash or parry between light hits. That keeps "uninterrupted pressure" a worst case rather than the normal state. (tune)

---

## C-16 Recovery floors per echelon (new tenth echelon property)

Echelon 0: 150ms. Echelon 1: 200ms. Echelon 2: 400ms. Echelon 3: 1500ms. Recovery is not trainable.
Rationale: C-14 shows the TTK floor depends on recovery as much as on startup. 4.7 lists nine properties and no recovery, so a future spell with a 200ms Echelon 2 recovery would silently break Law 3.
**Doc addition (4.7):** this adds a tenth property, "Recovery floor", to the echelon table.

---

## C-17 Sandbox test presets (build convenience, not a design value)

- Capacity presets: Starter 100, Awakened 120, Adept 300, Master 900. They are needed because Echelon 1 and 2 have capacity thresholds above the starting 100 (5.20).
- Block Proficiency presets: 1.5 (Raw) and 3.0 (Perfected). Combat Regen presets: x1 and x2.
- Dummies: passive; always-block; always-parry (perfect timing); random-parry (with a timing standard deviation); Breaker-spammer; Grab-spammer.
- Debug overlay (sandbox only, never shipped): hit time, C, input estimate, window edges, mana drained.

---

## Doc conflicts and assumptions (summary)

| ID | Section | Type | Summary |
|---|---|---|---|
| C-02b | 3.1 (LOCKED) | Conflict (still open in v3.1) | In-combat trickle raised from 0.1%/5s to 1%/5s. Needs an owner override; the fallback is to drop the halt. |
| C-02b | 3.1 | Reinterpretation | Successful parries, Contest feeds and Slips count as activity. Holding a block, whiffs and empty dashes count as passive. |
| C-07 | 4.6 / 4.7 | Reinterpretation | The Barrier exception covers the 150ms Echelon 0 floor, so the parry window opens on frame 0. |
| C-13 | 4.11 Law 1 vs 3.2 | Superseded by v3.1 | v3.1 Law 1 names the state exception. The fuller wording stays optional. |
| C-07a | 23 (v3.1 OPEN), 3.2 | Recommendation | Mana Parry allowed while Hollow (no block). A whiff deals 5% Grey Health. Hollow exits at 5 mana (new). |
| C-08c | 4.8 vs 4.11 L6 | Conflict (still in v3.1) | Contest residuals keep their tier speed (4.8 says "slower"). |
| C-06a | 17.5 | Superseded by v3.1 | v3.1 "Before Barrier" adopts the same rule; the sheet adds numbers only. |
| C-06 | 4.12 | Assumption | Left Click is an Echelon 1 Strike for every character, so the 250ms floor applies. |
| C-05a | 4.5 | Definition | Heavy = Echelon 2+ or Breaker. Echelon 1 is never heavy. |
| C-05e | 4.5 / 23 | Reinterpretation | Uses both Reel resistance and minimum spacing. |
| C-01a | 4.7 | Assumption | Health is fixed at 100; any growth is deferred. |
| C-01c | 3.3 | Reinterpretation | "Heavy physical hit" = heavy + `physical` tag; "full" food and water = 80% or more. |
| C-09 | 4.8 | Assumption | A six-element ring (lightning > water > fire > ice > wind > earth > lightning) covers every opposed pair the doc names. Residues only on edges. Relation affects Clash Power only, not damage. Void is neutral. |
| C-11 | 4.7 | Reinterpretation | Beam damage band is per cast; the hit cap is per tick. |
| C-11 | 4.12 | Assumption | The 400ms Grab floor also applies to Grab spells. |
| C-11 | 4.6 | Assumption | A parried projectile is dispelled; one press parries every Parryable hit in its window; Breaker or Unparryable in the window resolves as a block. |
| C-14 | 4.11 | Interpretation | Combo scaling is compounding (0.9^(k-1)). The flat reading fails without the v3.1 90%/4s rule and passes with it; the window must be closed [t-4, t]. |
| C-03 | 4.11 | Reinterpretation | Slip = a hit inside the first 100ms of the i-frames. Dash-cancel does not speed up the next action. |
| C-16 | 4.7 | Addition | Recovery floor added as a tenth echelon property. |

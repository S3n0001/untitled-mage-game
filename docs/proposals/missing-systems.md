MERGED into game-design.txt v3.3 on 2026-10-27; the doc is now the source of truth.

# Proposal: Missing Systems (against Game Design Document v3)

Status: PROPOSAL. Nothing here is accepted until the owner marks it. Written against v3, then reconciled with **v3.1** (the naming pass in Appendix C and the verification pass in Appendix B), including the v3.2 sections 24 to 26 that already cite S items. `docs/game-design.txt` and the other proposal files are unchanged. S-IDs are stable, because `potions-and-alchemy.md` and doc Sections 24 to 26 cite them.

## Reconciliation with v3.1

### Renames applied in this file

| Old (in this file) | New | Why |
|---|---|---|
| Mana Battery | Wellstone | Appendix C |
| Mana Dump | Outpouring | Appendix C |
| Legacy (mentor prestige) | Renown | Appendix C |
| Steady meal | Hale meal | Appendix C |
| Grand Magic | Rites | Appendix C |
| Mana Eclipse | Deadcalm | Appendix C |
| Vow of the Open Hand | the Bare Vow | Appendix C (Vow of Steel becomes the Steel Vow; it is not used in this file) |
| Bloodline Echo | Blood Memory | Appendix C |
| Alchemist NPC | Apothecary | 24.19 ("alchemist" stays the player's word) |
| Rivalry / Bond (S-42) | Soul Resonance / Positive Resonance | Rule 4, one name per meaning: v3.1 already names both (8.1) |
| Nexus stone | Claim Stone | "Nexus" is borrowed from another game (Rule 3) |
| Phantom Echo | Wisp | "Echoes" is another game's currency (Appendix C). **Doc 26.2 and 26.7 still say "Phantom Echo"** and need the same rename. |
| Volatile Gel | Slime gel | "Volatiles" now names 24.4's thrown flasks (Rule 4) |
| Glyph of Haste | Glyph of Quick | Haste is a tabletop spell name (Rule 3) |
| Glyph of Reach | Glyph of Distance | Reach is a technique attribute (5.19.5, Rule 4) |
| Glyph of Density | Glyph of Force | Density is the Durability attribute (5.3, Rule 4) |
| Glyph of Weight | Glyph of Heft | Weight is a technique attribute (5.19.5, Rule 4) |
| Glyph of Breath | Glyph of Ease | Breath is a Body attribute (5.4, Rule 4) |
| Health Draught, Field Patch | removed | Replaced by Stanch and the Mend salve (24.4, 24.19) |

**Doc 26.6** lists "Haste, Reach" in its Stocked glyph list. If these renames are accepted, it needs updating.

**Names checked and kept:** Leader, Officer, Member, Initiate, Registrar, Spar, Take Stock, Body captions, Shallows, Narrows, Open channel, Claim Stone, Thrift, Patience, Quick, Distance, Force, Heft, Ease, Ironstone, Deepsilver, Leystone, Glyph Source, Golem Core Shard, Starmetal, Wisp, Blood Tonic, Warding Tonic, Clear Eye, Antidote, family likeness, home Inn.

### Status of every item against v3.1

- **Matches:** v3.1 says the same thing, or does not touch the item.
- **Extends:** v3.1 agrees, and this item adds detail v3.1 lacks.
- **Superseded:** v3.1 decides it. The item is cut down to a pointer, and v3.1 wins.
- **Overrides:** this item proposes something different from v3.1. The owner picks one.

| Item | Status | Note |
|---|---|---|
| S-01 | Extends 20.2 | Cap of 30 kept. With 40-player servers (36 public), a full guild never shares one server, which is fine because guilds span shards. Feast and leyline sizes are tuned for about 12 present. |
| S-02 | Matches | |
| S-03 | Extends 4.1 | Leaving mid-spar forfeits the spar. No 30-second body, because a spar is non-lethal. |
| S-04 | Extends 10.11 | Rescue eligibility narrowed to v3.1's rule: same guild (with tenure) or Positive Resonance **from fighting on the same side**. Plus v3.1's accept flare. |
| S-05 | Matches | DEFER. v3.1 17.4 already counts guild-hearth beds as secure. |
| S-06 | Extends 11.4 (world shards) | Claims live on the shard, not the server. |
| S-07 | Extends 8.4 | |
| S-08 | Matches | Presence and claims are per shard. |
| S-09, S-10 | Matches 7.3 | 7.3 now counts using a weapon at any time as a Bare Vow break. Heavy armor is added to that rule. |
| S-11 | Superseded in part by 24.4 | Field Patch dropped in favour of the Mend salve, which cannot repair Broken. |
| S-12 | Matches 5.7 | v3.1 scores gear at full durability. Keeps the 25% armor share as an extension. |
| S-13 to S-16 | Matches | 24.19 and 26.13 adopt them. Potion stacks are 5 (24). |
| S-17 | Superseded in part by 24.4 and 24.19 | Health Draught replaced by Stanch. Smoke flask is the single in-combat exception. Apothecary. See the overlap note in S-17. |
| S-18 | Matches 24.19 | Renamed Wellstone. |
| S-19 | Matches 26.7 | Echo renamed Wisp. 26.7 caps durability at 1.6x. |
| S-20 | Matches | Section 24 is the player-brewing spec this item deferred. |
| S-21 | Matches 26.6 | Five glyphs renamed. |
| S-22, S-23 | Extends 8.4 | The crystal rate limit applies to trades too. Accounts under 20 hours of play never count toward Positive Resonance. |
| S-24 | Superseded by 8.1 | Kept: trades never grant rescue eligibility (10.11). |
| S-25 to S-28 | Matches | |
| S-29, S-30, S-32 | Matches | |
| S-31 | Extends 17.4 | Rent for the starting Inn is still undefined. Before Barrier (17.5) is compatible. |
| S-33 to S-35 | Extends 3.6 | 3.6 has warnings at 30%, about 10% and a heartbeat. This adds the 50% stage and the bar styling. |
| S-36 | **Superseded by 3.6** | 62-minute day, 3.6's numbers, 3.6's four kinds of time. Reduced to a pointer. |
| S-37 | Superseded by 11.10 for the numbers. Extends it for the measure. | 100/200 studs adopted. Keeps the definition of "above ground" (baked height grid plus smoothing), which v3.1 does not give. |
| S-38 | **Superseded by 3.1 and 3.2** | v3.1 decides the trigger (below zero only), the depth, the effect and the clock (play time). Reduced. |
| S-39 | Extends 17.4 | v3.1 definition adopted (rented Inn or guild hearth). The paid night at other Inns is dropped. Keeps the wanted rule, how resting works, and the safe-spot definition. |
| S-40 | Matches 23 | Still open in v3.1. |
| S-41 | Matches 23 | Still open in v3.1 (4.9). Smoke (24.4) supports it. |
| S-42 | **Superseded by 8.1** | The optional decay half-life is kept. |
| S-43 | **Overrides 10.11** | v3.1: a rescuer who dies takes an Aether death (a wipe). This file: all remaining Lives lost, never a wipe. Owner's choice; trade-off in S-43. |
| S-44 | **Superseded by 5.7** | |
| S-45 | Matches 26.6 | 6.1 still says "less speed". The reading still applies. |
| S-46 | **Superseded by 3.2** | |
| S-47 | Matches (still open) | 9.1 still says "nearest Inn". |
| S-48 | Superseded in part by 17.4 and 3.6 | Rent is now in real days. Rent for the starting Inn is still open. |
| S-49 | Superseded in part by 8.4 | v3.1 lets crystals be dropped, rate-limited per receiver per day. The "no crystal drops" line is withdrawn. 17.2 still does not list crystals. |
| S-50 | Matches (still open) | 7.3 and 7.4 still say "nothing that can break". Doc 26.7 already cites S-50. |
| S-51 | **Superseded by 4.11** | |
| S-52, S-53 | Matches (still open) | |
| S-54 | **Superseded by 3.6** | |
| S-55 | **Superseded by 3.3** | v3.1 uses the same 70%. |
| S-56 | **Superseded by 4.11** | v3.1 adds Suppression and Mana Vision to the utility slots. |
| S-57 | Matches 26.9 | 17.2 (v3.2) now allows Tome fragments. |
| S-58 | Matches (still open) | 10.10 still says "top-10 guild". |
| S-59, S-61 | Matches (still open) | |
| S-60 | Matches (still open) | 23 still says "echelon gap". |
| S-62 | Matches 26.13 | 26.13 already cites it. |

**No item is affected** by 11.6 (Fissure failure, now ejection with Trauma), 5.19.2 (two Body rests per real day, which S-39 defers to), or 3.6's Aether wake at 70% (S-43 notes that rescuers enter with their current values and do not "wake").

How to read this file

- Every item has an ID (S-01, S-02, ...) so you can accept or reject it on its own.
- **[LAUNCH]** means it is needed for the first public build. **[DEFER]** means it can wait until after launch, and the item says what stands in for it until then.
- **(tune)** marks a starting value for playtesting, not a decision. This is the same meaning the doc gives it.
- Section numbers like (8.3) point to the design doc. **Conflict:** marks a place where this proposal disagrees with the doc or has to read it one particular way.
- Constraints respected throughout: the LOCKED items; no numbers on the HUD (16.3); power is never sold (1.2, 17.6); monetization is slots, cosmetics and convenience only; overworld variance is learnable and Aether variance is not (Design Law 3); Skill Over Build means nothing widens a window or shortens a telegraph (4.11 Law 1).
- Scope target: a solo developer with AI tooling. When in doubt, the smaller option wins and the larger one is marked [DEFER].

Index

| Area | Items |
|---|---|
| 1. Guilds | S-01 to S-08 |
| 2. Armor and defense | S-09 to S-12 |
| 3. Inventory, carry weight, storage, death | S-13 to S-16 |
| 4. Potions, Wellstones, materials, glyphs | S-17 to S-21 |
| 5. Player trading | S-22 to S-24 |
| 6. Swimming, boats, sea channels | S-25 to S-28 |
| 7. Character creation | S-29 to S-32 |
| 8. Survival readout without numbers | S-33 to S-35 |
| 9. Flagged open items resolved | S-36 to S-41 |
| 10. Other gaps and contradictions | S-42 to S-62 |

---

## 1. Guilds

The doc relies on guilds in many places but never defines them: mentors (5.12), the guild sparring penalty (8.3), rescue eligibility (10.11), Sacrifice eligibility through "shared guild history" (10.12), guild hearths and Feasts (18.12, 18.13), leyline control (5.16, 11.3, 11.13 Leyline Surge), mixed-power guilds (5.24), and "top-10 guild" survival odds (10.10).

### S-01 Guild founding, size and lifecycle [LAUNCH]

- **Where:** a Registrar NPC in any Anchor town (11.2).
- **Founder requirements:** at least 10 hours of total account playtime (tune), the same account-level playtime 3.2 uses for the Trauma Mercy Window. The founding character must not already be in a guild.
- **Charter:** the founder plus 2 co-signers from **2 other accounts** (tune) must be present at the Registrar within 10 real minutes (tune). This stops name squatting and one-account shell guilds.
- **Cost:** 30 Mana Crystals (tune). It works as a crystal sink (17.1).
- **Name:** 3 to 24 characters, run through the same filter pipeline as character names (S-30). Names are unique across the game: the normalized name (lowercased, whitespace collapsed) is reserved as a key (S-08).
- **Size cap:** 30 characters at launch (tune). v3.1 servers hold 40 (20.2, with 4 slots reserved), so a full guild never gathers on one server. Guild-wide activities (Feast, leyline holds, rescues of up to 4) are sized for about 12 present (tune). It can be raised later. Lowering it later is painful, the same lesson as staged slot release (19.5).
- **Membership is per character, not per account.** One guild per character. Different slots on one account may belong to different guilds. This follows the per-slot economy (17.2, 19.5).
- **Lineage:** when a character dies in the Aether, the descendant in that slot (9.2) keeps the membership, and their rank drops to Member. Tenure carries over, because a slot is a lineage (9.2).
- **Leadership succession:** if the Leader is deleted (Aether death) or inactive for 30 real days (tune), leadership passes to the longest-serving Officer, or to the longest-serving Member if there are no Officers.
- **Dissolution:** the Leader can disband. A guild below 2 members for 14 real days (tune) dissolves automatically, and its name is released after 30 days.

### S-02 Ranks and permissions [LAUNCH]

There are four fixed ranks, with no custom-rank editor (a scope saving).

| Permission | Leader (1) | Officer (up to 5, tune) | Member | Initiate (first 72 real hours, tune) |
|---|---|---|---|---|
| Invite | yes | yes | no | no |
| Kick Members and Initiates | yes | yes | no | no |
| Promote, demote, kick Officers | yes | no | no | no |
| Rename (once per 30 days), disband | yes | no | no | no |
| Start a rescue rite (S-04, 10.11) | yes | yes | yes | no |
| Counts for guild-based rescue and Sacrifice eligibility | yes | yes | yes | **no** |
| Guild larder: deposit / withdraw [DEFER, S-05] | both | both | both | deposit only |
| Light the guild hearth, call a Feast [DEFER, S-05] | yes | yes | no | no |
| Attune a leyline [DEFER, S-06] | yes | yes | no | no |

- Initiate is a time state, not a separate promotion. It lifts automatically after 72 hours. Its job is to stop the "join the guild to get rescued, then leave" pattern (S-04).
- Ranks have no combat effect at all.

### S-03 The 90% sparring penalty in detail (8.3) [LAUNCH]

The doc only says "fighting a guild member applies a flat 90% XP penalty". This item pins down what that covers.

- **Who counts:** both characters were in the same guild when the encounter started (snapshot, like the Power Score freeze in 5.7), **or** either character left that guild within the last 7 real days (tune). The tail stops the "leave, spar, rejoin" loophole.
- **What it reduces (x0.1):** Action XP, Insight (Learning by Suffering, 5.12), Reading the Blow Insight (5.19.6), and Body Load (already stated in 5.19.4).
- **Catalysts:** a guildmate can never be the target, victim or "stronger foe" of a catalyst feat (5.5). Without this rule, the 90% cut would not stop a guildmate from serving as a Guard Break catalyst target.
- **Stacking:** it multiplies with Soul Resonance (8.1). By the second fight between the same two players it is effectively zero, which is intended.
- **What it does not touch:** fighting mobs side by side, and Cook XP. Audience (18.11) is a separate system with its own decay.
- **Optional extra, Spar Challenge (recommended, small):** an accepted `/spar` between any two characters ends at 10% Health (tune). No Life is lost, no heat is raised (12), no Soul Crack happens, and nothing drops. Sparring is "for skill practice" (8.3), and permadeath (9.1) otherwise makes practice frightening. Normal XP rules (Resonance, the guild penalty) still apply to spars. Spars cannot start in the Aether or while either character is wanted. Disconnecting mid-spar forfeits the spar and leaves no 30-second body (4.1), since the spar could not have killed anyone. If a third party attacks either sparrer, the spar ends at once and normal combat rules, including v3.1's disconnect rule, take over.

### S-04 Guild membership in rescue and Sacrifice eligibility (10.11, 10.12) [LAUNCH, with the rescue MVP]

- **Rescue (10.11):** a character is eligible to join a rescue into a friend's Aether instance if either (a) they have been in the same guild as the dreamer for at least 72 hours (non-Initiate), or (b) they have Positive Resonance with the dreamer **from fighting on the same side** (8.1 and 10.11, v3.1). Resonance from meals and trades never counts. The dreamer must also accept the rescue from inside the Aether (v3.1 flare).
- **Sacrifice "shared guild history" (10.12):** the two were in the same guild at the same time for at least 7 real days in total (tune), at any point in either character's life. Guild history is recorded on the guild record and copied to each character's profile as a list of (guildId, from, to) entries. Keep the last 10 (tune).
- **Who may start the rite:** any Member or above (S-02). Party size cap is 4 (tune). Alone instances still reject entry (10.11).
- **Rescuer risk** is not covered by the doc. See S-43: a rescuer who dies there loses all remaining Lives, and a character with 0 Lives cannot join a rescue.

### S-05 Guild hall, hearth and shared larder (18.12, 18.13) [DEFER]

Until this ships, guilds are a roster, ranks, the sparring penalty and eligibility. That covers everything the doc needs at launch.

- **No player-built buildings.** Each Anchor town has one Guild Hall building with a door. The hall is one shared physical room. Its banners, larder UI and hearth state are read from the guild record of whoever is looking or interacting, so two guilds on the same server see the same room with their own banners (banners are client-side, per viewer). Truly private per-guild interiors are a later upgrade. This avoids the per-server plot problem: the overworld is many public servers (19.1), so a physical plot cannot belong to one guild on every server.
- **Hearth:** the hall hearth works as 18.12 describes (more burners, larger smokehouse, Feast). It is a protected building (13) and cannot be destroyed.
- **Secure bed:** the hall has bunks that count as secure beds for members (S-39).
- **Shared larder:** follows the per-slot economy rule (S-07). Its contents are ingredients and food only, with a 40-slot cap (tune).

### S-06 Leyline control (5.16, 11.3, 11.13) [DEFER]

- **Per shard, never global (revised for v3.1 world shards, 11.4).** Leylines are fixed bones (11.3). A global claim would let a guild own a leyline on shards where none of its members are present. A claim lives in that shard's MemoryStore state, like occupied towns, so it outlives any single server.
- **Claiming:** each leyline has a Claim Stone. An Officer or the Leader channels for 90 seconds (tune), uninterrupted. Taking damage resets the channel. Other players can contest by interrupting (PvP; 4.7 Rites already makes protecting a channel a team objective). The channel shows a world-scale telegraph so it is never hidden.
- **Duration:** until another guild re-attunes, the Drift block ends, or 3 real hours pass with no member within the leyline on that shard (tune).
- **What it grants (no power):** the leyline hearth (18.12, the best sear flame), a banner over the Claim Stone, a ledger line for a guild that holds through a Leyline Surge (11.13), and Claim Stone bunks that count as a secure bed for members while held (at PvP risk, which is the same spirit as camps, 18.12). It grants **no** XP, regen or stat bonus beyond what the leyline already gives anyone standing in it (11.3).
- **Anti-farm:** claiming grants no XP. Fights over the Claim Stone use normal XP rules (Threat, Resonance, the guild penalty).

### S-07 Guilds and anti-boost interactions [LAUNCH, larder parts DEFER]

- **Threat and contribution are unchanged** (5.2, 5.6, 5.24). Guild membership never changes who counts as "the party".
- **Mentoring:** guild mentors (5.12) earn Renown only under 5.16's delayed, capped rules. Nothing guild-specific is added.
- **Larder ferrying (closes a hole):** a shared guild larder is an alt-ferry channel. Slot A deposits and slot B on the same account withdraws. Rule: every item carries `originAccountId` from its last deposit, and a withdrawal is refused if the withdrawer's account matches the depositor's account but the slot differs. This applies 17.2's alt-ferrying rule to shared storage.
- **Guild hopping for rescue:** blocked by Initiate tenure (S-02).
- **Founding by alts:** blocked because co-signers must be different accounts (S-01).
- **Second accounts (v3.1 §8.4):** separate free accounts get around account keying. v3.1 answers with a daily per-receiver crystal limit, gifts counting toward the Power Score, and a 20-hour threshold before an account counts as a distinct source. The guild rules here add tenure and co-signers on top.
- **Laundering through a friend** (alt to friend to main) cannot be fully stopped. It is priced by "gifted gear raises your score" (5.7) and logged (S-23). The residual risk is accepted.

### S-08 Guild data and Roblox services [LAUNCH]

- **DataStore `Guilds`**, key `guildId`: `{ name, nameKey, createdAt, leaderCharId, members: [{ charId, accountId, rank, joinedAt }], history: [...] }`. With 30 members this is about 3 to 5 KB, far below the 4 MB key limit.
- **DataStore `GuildNames`**, key `nameKey`: the reservation, written with `UpdateAsync` so two founders cannot claim one name.
- **The guild record is the source of truth.** The character profile caches `guildId` and `rank` and reconciles on every load. If the record says the character was kicked, the cache clears. Every membership write uses `UpdateAsync`, which happens rarely (joins, kicks, promotions), well inside DataStore write budgets.
- **Cross-server:** MessagingService topic `guild/<id>` for invites, kicks and rank changes (best effort; the DataStore is truth). Online presence: a MemoryStore sorted map with TTL entries (tune: 120s heartbeat).
- **Guild chat at launch is same-server only**, using a TextChatService channel per guild per server, so Roblox's chat filtering applies automatically. Cross-server guild chat is [DEFER]: it would carry user text over MessagingService, which needs manual filtering and has message-rate limits.
- **The guild larder [DEFER]** is shared mutable inventory, the classic duplication risk. Lock it with a MemoryStore lock per guild, write it with `UpdateAsync`, and give every item a GUID (S-23).
- **No leaderboards** (see S-58). Nothing ranks guilds by number.

---

## 2. Armor and defense

The doc mentions armor in 9.1 (drops to Broken on death), 7.3 (the Fist forsakes heavy armor), 5.7 (Defense includes armor), 7.2 (an unreinforced sword "bounces off armor"), 10.6 (Acid Rain degrades armor), 5.19.4 and 14 (armored mobs). Nothing says what it does.

### S-09 What armor does [LAUNCH]

Armor is one equip slot (a body set). There is no helmet, glove or boot slots at launch. Visual layering is cosmetic only.

| Class | Physical damage reduction | Spell damage reduction | Blood guard | Mobility cost |
|---|---|---|---|---|
| Light | 6% | 3% | 20% | none |
| Medium | 12% | 6% | 35% | Dash/Step cost +10%, walk speed -4%, flight drain +10% |
| Heavy | 18% | 9% | 50% | Dash/Step cost +25%, walk speed -8%, flight drain +25%, cannot swim (S-25) |

All values (tune).

- **Physical** covers Strikes, Techniques, Arts and mob melee. **Spell** covers every spell. Armor protects better against bodies than against will, which keeps mages wanting range and keeps "physically frail" (7.1) true for a robed mage.
- **Blood guard** reduces the Blood lost from heavy hits and bleeding wounds (3.3). It does not touch starvation or dehydration drain, Bleeding Effort's self-paid Blood (3.4), curses or Aether effects. This is armor's distinctive job: it protects the physical path's deep tank.
- **Order of operations:** armor applies before the per-echelon hit caps and combo scaling (4.11 Law 3). The caps still bound the result. Armor also reduces block chip damage (4.5).
- **What armor never touches:** parry windows, i-frames, dash cooldown, startup floors, Reel or Guard Break thresholds (poise belongs to Footwork, 7.3), and Contest windows. This satisfies 4.11 Law 1 and 1.2 ("every defense costs something real": armor costs durability and mobility).
- **Sword Mage at 0 mana (7.2):** an unreinforced blade "bounces off armor". Rule: an unreinforced Sword Mage blade treats the target's physical reduction as doubled (tune).

### S-10 Weight classes and the Vows (7.3) [LAUNCH]

- **Classic Mage, Sword Mage, Vowed Blade:** any class. Mages pay for Heavy in mana (dash cost, flight drain), so Light is their natural choice without any rule forcing it.
- **Vowed Fist (the Bare Vow):** Light and Medium only, exactly as 7.3 says ("forsake ... heavy armor"). Wearing Heavy armor in combat is a Vow break, with the same Backlash as picking up a weapon (7.3). Out of combat, equipping it is blocked with a short grimace and a line ("Your hands refuse it").
- **Conflict (7.3, 7.4):** "nothing that can break" for the Fist is contradicted by Light and Medium armor, which has durability and breaks on death (9.1). Recommended restatement: "no weapon to break or be disarmed". See S-50.
- **Armor class is visible on the model** (cloth and leather, mail and hide, plate), so opponents can read it like any other tell.

### S-11 Durability, the death rule, and repair (9.1, 10.6) [LAUNCH]

- **Wear:** each hit the armor absorbs removes durability in proportion to the damage absorbed. Acid Rain and Acid Pools add wear (10.6, 10.3).
- **Cues, mirroring 7.2 (no bar):** above 50% no change; 50% scuffs and dents; 25% splits and a loose rattle when the wearer moves; 0% Broken: visibly torn, gives **no** protection, still worn, still costs mobility.
- **Death (9.1, LOCKED):** overworld death sets armor to Broken. **Weapons are not affected by death** (9.1 names armor only; see S-62).
- **Repair** at an Armorer (an NPC at a blacksmith in each Anchor town). Cost = class base x material multiplier x missing share. From Broken at base material: Light 2, Medium 4, Heavy 6 Mana Crystals (tune). Better materials (S-19) multiply this by 1.5 to 2 (tune). Repair is instant and never raises maximum durability.
- **Field repair (superseded by v3.2, 24.4):** the Mend salve takes the place of the Field Patch proposed here. It restores up to 25% of maximum, out of combat, once per item per real hour, and cannot repair Broken. The smith stays the repair economy.
- **Material raises maximum durability, not reduction.** Better materials mean longer between repairs, which matches 17.3 ("better materials give higher durability"). Reduction depends on class only, so gear never creates a hidden stat ladder.

### S-12 Armor, the Power Score and Skill Over Build (5.7, 4.11) [LAUNCH]

- **Defense (5.7)** counts armor by class and material **at full durability**, inside the 10-minute freeze. Broken armor never lowers the score ("temporary states never lower the score", 5.7). Armor is capped at 25% of the Defense part (tune), so gifted Heavy armor raises the score, and therefore lowers the wearer's Threat and XP, modestly.
- **Conflict (5.7):** Offense counts "the weapon and glyphs at current durability", while the edge cases say a broken weapon never lowers the score. These cannot both hold. Recommended: score all gear at maximum durability. See S-44.
- **Skill Over Build check:** the reductions (6 to 18%) sit below the combo-scaling step (10% per hit, 4.11). Armor therefore extends a fight by roughly one read, never by a window. Balance armor through mobility cost before changing reduction (4.11 "balance by economy").

---

## 3. Inventory, carry weight, storage and death

### S-13 The pack and carry weight (18.8) [LAUNCH]

- **Equipped slots (they use no pack space):** weapon, staff or off-hand, armor (S-09), waterskin, and Wellstone (S-18).
- **Pack:** 24 slots (tune). Consumables, materials and ingredients stack (tune: 10 to 20 per stack). Gear does not stack.
- **Weight:** every item has a hidden weight, and the pack has a hidden capacity. Capacity grows a little with Might (tune: +25% at Perfected, on the 4.11 Law 2 curve). This gives a small out-of-combat edge to the body path, consistent with "Toughness" (7.3) and touching no combat value.

| Band | Threshold (tune) | Effect |
|---|---|---|
| Unburdened | up to 60% | none |
| Laden | 60 to 100% | walk -5%, swim slower |
| Overladen | 100 to 130% | no sprint, Dash/Step cost +20%, flight drain +20%, cannot swim (sinks) |
| Hard cap | 130% | cannot pick up more |

- Weight changes economy (cost, speed). It never changes windows or i-frames (4.11 Law 1).
- **"Rations weigh less" (18.8):** a preserved ration weighs about 40% of the fresh food it replaces (tune). The Larder attribute lowers this further (18.11). Water has weight by fill level, so carrying water is the real choice 3.5 describes ("Player B ... must carry water").
- **Readout without numbers:** the character's posture stoops in Laden and Overladen, the pack model grows, and the inventory screen draws the pack's straps tightening and seams straining.
- **Assumption (16.3):** the inventory screen (not the HUD) shows item **stack counts** and the **Mana Crystal count**. These are counts of things, not stats, levels or progress, and trading (S-22) needs them. If you read 16.3 as forbidding these as well, counts can become visual piles, at real usability cost.

### S-14 The Inn chest and the larder (18.8, 23 Heirloom) [LAUNCH chest, DEFER larder per 18.19]

- **Inn chest:** one per slot, 40 slots (tune), for durable goods (gear, materials, potions, Wellstones, crystals). It is reachable at whichever Inn the slot currently rents (S-31). Moving to a different Inn moves the chest with you instantly, because a porter delay adds no fun.
- **Larder (18.8):** separate from the chest, food and ingredients only, 20 slots (tune), keyed to the rented Inn. Spoilage inside the larder runs at half speed (tune).
- **Eviction (17.4):** the chest is **locked, not lost**, until the slot rents any Inn again. The larder keeps its 3-day grace and then rots (18.8, unchanged).
- **Monetization:** no paid chest expansion at launch. Extra storage is arguably "convenience", but it holds tradable gear, which shades toward power. Revisit only as a cosmetic chest skin.

### S-15 What is kept on death (9.1, 9.3, 5.21) [LAUNCH]

| Event | Pack and equipped items | Armor | Weapon | Inn chest and larder |
|---|---|---|---|---|
| Overworld death (Life lost) | kept (9.1) | Broken (9.1) | unchanged (S-62) | unchanged |
| Combat-log body killed (4.1) | as overworld death | Broken | unchanged | unchanged |
| Aether death (wipe, 9.3) | **lost**: "the dream keeps it" | lost | lost | **wiped** except one Heirloom (below) |
| Aether escape (10.10) | kept. Aether matter crumbles at the Rift (18.7); Tome fragments and other non-edible Aether rewards survive | unchanged | unchanged | unchanged |

- **Heirloom (23, OPEN, recommended):** the player may mark one item in the Inn chest as the Heirloom ahead of time. On Aether death it passes to the descendant at Broken (23's own recommendation). Everything else in the chest is wiped, which follows 5.21 ("does not carry over: ... per-slot items").
- **The alternative, if this feels too harsh:** the chest passes to the descendant with all gear set to Broken and crystals halved. Both options keep "memory, not power". The owner should pick one. The default here follows 5.21 literally.
- **No corpse looting.** Kills drop nothing from the victim's pack (9.1 says you keep your inventory). Bounties are paid from the criminal's crystals (12) by the server, not by looting.

### S-16 Item identity and per-slot rules (17.2) [LAUNCH]

- Every non-stackable item has a GUID. Stacks carry a stack GUID.
- Every item records its last holder as `{ accountId, slotId }`.
- **Dropping (17.2):** dropped items despawn after 5 real minutes (tune) or when the server closes. A dropped item cannot be picked up by a **different slot of the same account** (17.2's alt-ferrying rule). Its owner can always pick it back up.
- The same check applies to the guild larder (S-07) and to trades (S-22).

---

## 4. Potions, Wellstones, crafting materials and glyphs

### S-17 Potions (3.2, 3.3, 18.10) [LAUNCH, two or three types]

Rules first:

1. **No potion works in combat.** Drinking is refused while In Combat (4.1). Mana is the skill currency during a fight (4.11 Law 4), and a mid-fight heal would undo the TTK floor and the attrition design (4.9).
2. **No mana potion, ever.** Out-of-combat regeneration is already rapid (3.1). The only stored-mana item is the Wellstone, and it only works where ambient regen is zero (S-18).
3. **Potions never heal Soul Damage (Grey Health)** (3.2, LOCKED).
4. **Categories:** each potion has a category. One potion per category is active at a time. Where a Meal effect covers the same category, the stronger applies and the other is wasted (18.10).
5. Drinking takes a 1.2s committed animation with a sound tell (tune), and every potion has weight (S-13).

| Potion | Category | Effect (tune) | Launch? |
|---|---|---|---|
| ~~Health Draught~~ Stanch (v3.2, 24.4) | Blood | Restores Blood out of combat (up to 20% over 3 minutes of play). Never restores Health. Replaces the Health Draught, which would bypass the survival chain's halt below 10% Blood (24.19). | LAUNCH |
| Antidote | Poison | Cures overworld poisons (forage, poisoned dishes, 18.14). **Does nothing against Aether poisons** (Design Law 3: the Aether cannot be learned or cured by preparation). | LAUNCH |
| Blood Tonic | Hale (24.4) | Out-of-combat Blood regeneration +30%. Overlaps with the Hale meal (18.10), so the stronger wins. | LAUNCH, see the overlap note |
| Warding Tonic (Warm or Cool) | Climate | Halves a front's penalty, the same as Warmth and Cooling meals | DEFER |
| Clear Eye | Clear | Thirst blur starts at 20% (the same as the Clear meal) | DEFER |

- **"Restored by water, potions" (3.3):** every potion also restores a little Thirst (tune: 8%). Water itself is a waterskin refill, not a potion.
- **Source:** Apothecary NPCs in Anchor towns sell potions for crystals, and brew them from herbs the player brings at a discount (tune). Player brewing is [DEFER] with crafting (S-20). Section 24 specifies it.

**Overlap with `potions-and-alchemy.md` (doc Section 24), reviewed for v3.1:**

- **Rule 1 changed:** the Smoke flask is the single in-combat exception (24.4). It only breaks sight and restores nothing. Accepted here, and it also supports S-41's disengage.
- **Health Draught to Stanch:** accepted (24.19).
- **Rules 2 to 5, the 8% Thirst per potion, and the Antidote ruling:** the two files agree.
- **Contradiction inside that file, for the owner to settle:** its 24.7 says the NPC launch set is Stanch, Antidote and **Blood Tonic**. Its 24.18 and 24.19 say Stanch, **one Warding Tonic (Warmth)** and Antidote. This file has no preference beyond matching whichever the bench ships first (24.19's own principle).
- **Stack size:** vials stack 5 (24), which overrides this file's generic 10 to 20.

### S-18 Wellstones (11.3, 5.8, 11.13) [LAUNCH]

"Dead Zones: zero regen. Wellstone artifacts required to survive" (11.3). "Dead-Zone Efficiency: trained by stretching a Wellstone" (5.8).

- **What it is:** an equipped artifact that stores mana. Two sizes: Small (holds 150 mana) and Large (holds 400) (tune). It is heavy (S-13), so packing for a Dead Zone is a real choice.
- **Discharge rule:** a Wellstone only discharges where ambient regeneration is zero: Dead Zones, and the whole region during a Deadcalm (11.13). There it **stands in for the missing ambient mana**. It restores your normal regeneration (rapid out of combat, the normal trickle in combat) and drains its charge to pay for it. It can never exceed normal regen. A Wellstone is never better than standing outside the Dead Zone, so it is not a mana potion.
- **Waste and training:** each point restored costs more than one point of charge. Raw Dead-Zone Efficiency wastes 50% and Perfected wastes 10% (tune, on the Law 2 curve). Stretching a Wellstone (getting more restored mana out of the same charge) is exactly what trains Dead-Zone Efficiency (5.8).
- **Charging:** (a) sit at a leyline out of combat (Small fills in about 2 real minutes, tune), or (b) pour your own mana in out of combat with a 30% loss (tune). Pouring is not "purposeful spending" and trains nothing (3.1).
- **Inert** everywhere else, including the whole Aether (the Aether has no mana zones, 10.1 and 23).
- **Readout:** the Wellstone's glow dims and its hum drops in pitch as it drains. There is no number.
- **Source:** Enchanters craft them from Leystone and crystals (S-19). Vowed characters never need one (7.3, Dead Zones are home turf).

### S-19 Crafting materials (17.3, 7.3, 6.1, 11.13) [LAUNCH, minimum set]

Eight materials at launch (tune). Each is tied to a place or a bestiary entry, so gathering means exploring (1.1 Earned Discovery).

| Material | Source | Used for |
|---|---|---|
| Ironstone | common ore in most regions | basic weapons and armor |
| Deepsilver | ore found **only in Dead Zones** | high-durability weapons and armor. The physical path's home turf yields its best steel (7.3, 11.3). |
| Leystone | crystal grown on leylines | glyph inscription, Wellstones |
| Hide | Mana Beasts (14) | Light and Medium armor |
| Golem Core Shard | Golems' exposed cores (14) | Heavy armor plates, glyph binding |
| Slime gel | Slimes (14, 18.7) | potions, pickling (18.7 already uses it) |
| Glyph Source | inscription stones in ruins, Fissures, Risen Ruins, events (11.6, 11.13) | required for every crafted glyph. This is the rare gate. |
| Starmetal | Falling Star craters (11.13) | spirit-forged blades (7.3) |
| *(plus)* Wisp | left by a killed Phantom or Wraith | quenching a spirit-forged blade |

- **Spirit-forged blade (7.3, 23):** a Blacksmith combines Starmetal and a Wisp. Only mages can kill Phantoms easily (14), so a Blade must trade with or befriend a mage to get one. That is the Social Ecology pillar in one recipe.
- **Trade-off:** a spirit-forged blade hits Phantoms and Wraiths but has about 60% of steel's maximum durability (tune), since starmetal is brittle. A Blade carries two weapons and swaps out of combat through loadout presets (4.11). No single blade answers everything.
- **Note (18.7):** "Phantoms give nothing" refers to edible drops. The Wisp is not edible, so the food rule stands.
- **Weapons (17.3):** material sets maximum durability. Damage comes from the weapon type and the wielder's training, so materials never form a damage ladder.

### S-20 Who crafts [LAUNCH: NPC crafters. DEFER: player crafting]

- At launch, Blacksmiths, Armorers, Enchanters and Apothecaries are NPCs in Anchor towns. The player brings materials and crystals, and the result is immediate.
- Player crafting is a life skill outside Rigidity (5.4, 5.26). When it ships, it should copy the cooking model (tells, Novelty, Familiarity, no combat XP; 18.11). It must never produce gear that breaks a band or a cap. This is a large system to defer.
- **Enchanter discovery:** each Glyph Source "speaks" 2 glyph types, seeded per source (tune). The player picks one at the Enchanter. A wiki can list the types but not which source holds which (the same idea as catalyst draws, 5.5).

### S-21 More glyphs, and the rules every glyph obeys (6.1, 4.11 Law 1, Law 5, Law 6) [DEFER per 21.2, which defers Glyphs]

**Rules (apply to Expansion and Focus too):**

1. Every glyph trades one stat for another (6.1, 4.11 Law 5). There are no pure upgrades and no passive damage stacks.
2. At most 2 sockets per spell (4.11), and no duplicate glyph on one spell.
3. A glyph may lengthen a telegraph but never shorten one below its floor. It never changes a parry, block, dash or Contest window (Law 1).
4. **A glyph never changes projectile travel speed.** Each echelon has a fixed speed tier (4.11 Law 6). **Conflict:** "Glyph of Expansion: more size, less speed" (6.1). Read "speed" as **cast speed** (longer startup), not travel speed. See S-45.
5. No glyph moves a spell across its echelon band, and hit caps apply after glyphs (4.7, 6.2).
6. **Techniques get sockets too.** 6.1 says "spells have sockets", which would leave vowed characters with no customization at all. Techniques are the physical path's spells (4.12). The Fist has no weapon, so its glyphs sit in its techniques.
7. Glyphs can only be swapped out of combat.

| Glyph | Gains (tune) | Pays (tune) | For |
|---|---|---|---|
| Expansion (6.1) | +25% hitbox size | +15% startup | spells |
| Focus (6.1) | +15% damage | +20% startup | spells |
| Thrift | -20% mana cost | -15% damage | spells |
| Quick (was Haste) | -15% startup, never below the floor | +25% mana cost | spells |
| Distance (was Reach) | +30% range | -20% hitbox size | spells |
| Force (was Density) | +20% Clash Power | -20% range | spells |
| Patience | maximum Hold 0.5s to 0.9s (4.11) | +50% drain while held. The telegraph only gets longer. | spells and Techniques |
| Heft (was Weight) | +20% Strike Power (4.12) | +20% Strain cost | Techniques |
| Ease (was Breath) | -20% Strain cost | -15% Reach | Techniques |

- **Quick note:** Cast Speed training already approaches the floor (4.7). Quick reaches the same floor sooner. It cannot pass it, so a maxed caster gains only economy from it, which is exactly Law 1.
- Glyphs count in the Power Score Offense part at maximum durability (5.7, S-44).

---

## 5. Player trading

### S-22 The trade window [LAUNCH]

- **Who and where:** two characters within 12 studs (tune), both out of combat (4.1), neither wanted in the current jurisdiction (12). Trading is allowed in the Aether, where handing rations matters (18.13).
- **Tradable:** everything on 17.2's droppable list (glyphs, weapons, armor, cooked food), plus Mana Crystals, materials, ingredients, potions and Wellstones. **Conflict:** 17.2 does not list crystals, but 18.13 player sales and 12 bounties need them. See S-49.
- **Not tradable:** Spell Tomes and Manuals, read or unread (see S-57), Grimoires (17.2), anything bought with Robux (cosmetics are account-bound), and the Heirloom mark.
- **Same account, different slot:** refused. One account cannot be online twice, but the check also runs on item history (S-16), so an item cannot reach another slot of the same account through a drop.
- **Flow:** request, then accept, then both sides add items, then **Lock**, then a **3-second review** (tune), then both press **Confirm**, then the server swaps atomically. Any change unlocks both sides and restarts the review.
- **No numbers, but honest:** the trade window shows item **visuals**, including durability cracks (7.2, S-11). You judge a used sword by looking at it, like everything else in this game. Stack counts and the crystal amount are shown (S-13 assumption).
- **One-sided gifts** use the same window with nothing on one side.
- **v3.1 §8.4 limits apply to trades:** crystals received by trade count toward the same per-receiver daily limit as dropped crystals. Gifted gear counts toward the receiver's Power Score (5.7).

### S-23 Roblox safety and duplication protection [LAUNCH]

- **No real-money link of any kind.** Robux purchases are cosmetics and slots only (17.6). They are not tradable, and nothing tradable can be bought with Robux. This keeps the game clear of Roblox rules on paid random items and real-money trading, and removes most scam incentive.
- **No free text in the trade window.** The only user text that can appear is a dish name (18.2 "Plate: name it") or a character name. Both go through the filter pipeline (S-30) before display.
- **Anti-scam:** the review timer restarts on any change. A tooltip warns if the other side changed an item during the last 5 seconds. Moving out of range or entering combat cancels the trade. Requests are rate-limited (tune: 1 per 10s per target), and the player block list blocks trade requests.
- **Atomic swap with a journal:** the server writes a `tradeId` and both item lists to a short-lived journal (MemoryStore, TTL 10 minutes). It swaps the items in both in-memory profiles, saves both profiles immediately, then clears the journal. On profile load, if a GUID is found on two profiles, keep the copy matching the journal or the newer save, and quarantine the other for review. Session locking (19.6) already guards each profile on its own. This handles the cross-profile case.
- **Trade log:** keep 30 days of trade records (who, what GUIDs, when) for moderation and laundering review (S-07). These are review signals, never auto-bans (the same philosophy as 4.4).

### S-24 Trading and positive Resonance (10.12) [LAUNCH]

- 10.12 counts "traded with" as positive Resonance for Sacrifice eligibility. Without a cap, two players passing a crust of bread back and forth would farm eligibility.
- **Superseded by v3.1 §8.1:** trading already raises Positive Resonance, capped per pair per day. Kept as clarifications: the cap is shared with "breaking bread" (18.13); trade Resonance feeds Sacrifice only and **never** rescue eligibility (10.11 v3.1 accepts only same-side fighting); and accounts under 20 hours of play earn none (8.4).

---

## 6. Swimming, boats and sea channels

The launch world is an archipelago with sea channels "crossed by boat, swimming or flight" (11.12). Vowed characters cannot fly (4.10, 7.3), and eviction washes players onto outer islands (17.4, 11.12).

### S-25 Swimming [LAUNCH]

- **Implementation:** sea channels are Roblox Terrain water (part of the bones, 11.12), so native swimming works there. Flooded Drift states use water parts with swim volumes (11.12), which need a small custom swim controller. Tune both to feel the same.
- **Speed:** about 60% of walk speed (tune). Sprint-swimming builds Strain (3.4). That makes the sea a Strain puzzle for everyone, including mages, since every character has both resources (3.4).
- **While swimming you cannot** Block, Parry, Dash or Step, or cast Echelon 1 and higher spells. Echelon 0 cantrips are allowed, and a mage can start flight from the water at +50% cost (tune). Being caught in the water is a vulnerability, and that is why boats and routes matter.
- **Sinking:** Heavy armor or the Overladen band makes swimming impossible (S-09, S-13). You sink, and in deep water you drown. Taking armor off in water takes 2s (tune). It goes into the pack if there is room, otherwise it floats in a crate for 5 minutes.
- **Air:** no air bar (16.3). After about 15s submerged (tune), Blood drains at 1% per second (tune). The cues are muffled audio, rising bubbles and a closing vignette (S-33).
- **Seawater** satisfies nothing and drains Blood when drunk. This is learnable (Design Law 3), and boiling cannot fix it (18.4 boiling makes pond water safe, not seawater). Tune that line in 18.4 if you want desalting by boiling as a cooking discovery.

### S-26 Ferries [LAUNCH]

- Each region's Anchor town has a harbor. A ferry loop links every region and every outer island (tune: one departure every 5 real minutes, 60 to 90 second crossings).
- **Fare:** 1 Mana Crystal (tune). **Leaving an outer island is free**, as eviction mercy (17.4).
- **Implementation:** passengers are **seated**, and the ferry moves on a server-driven path (CFrame along a spline). This avoids the Roblox problem of carrying unanchored characters on moving platforms. Leaving your seat means jumping into the sea.
- Ferries are protected (13) and cannot be destroyed or griefed. Crimes aboard count as a settled area (12).

### S-27 Rowboats [DEFER]

- Bought at a harbor (crystals). One per slot. Summoned at any dock, 2 to 4 seats, slow. Rowing builds Strain.
- A rowboat is a tier-1 wooden structure (13) and can be destroyed.
- Sailboats and cargo come later still. Until then, ferries and swimming are enough.

### S-28 Sea channel classes and vowed route parity (11.12, 10.13) [LAUNCH]

| Class | Width (tune) | Crossing | Danger |
|---|---|---|---|
| Shallows | up to 60 studs | wade or swim | none |
| Narrows | up to 250 studs (about 60s swim) | swim, ferry, flight | no sea beasts |
| Open channel | over 250 studs | ferry, boat, flight | sea beasts (a sign comes first: a fin, a wake, per 11.4) |

- **Parity rules (extends 11.12 validation):** every outer island has a Narrows to a region or a ferry stop. Every pair of regions is joined by the ferry loop. No region or Anchor is reachable only by flight.
- **Flight over open channels** is possible but long. A Raw-Duration flier may not make it across, which gives Duration (5.10) a purpose.
- **Aether Quarters (10.5, 10.13):** Water borders already guarantee "shallows" or a bridge for every archetype. No boats exist in the Aether.

---

## 7. Character creation

Character creation happens in the Menu place (19.1, 19.2).

### S-29 Appearance and a uniform hitbox [LAUNCH]

- **A custom rig with fixed proportions. Do not import the player's Roblox avatar.** Hitboxes must match visuals (4.11 Law 6), and body tells (breathing, posture, stance, 3.4, 5.19.10) must read the same on every character. Avatar bundles break both.
- **Options:** body frame (3 silhouettes inside the same hitbox), skin tone (palette), face preset, hair style and color, eye color, markings and scars (cosmetic), and **voice set** (4 to 6 breath and grunt sets). Voice matters because Strain is read partly by audible breath (3.4).
- **Height** is a visual scale within plus or minus 5% (tune). The hitbox is fixed.
- **Changing appearance later:** a Barber in Anchor towns, for crystals. Premium styles are sold as cosmetics (17.6).

### S-30 Naming and Roblox text filtering (20.4) [LAUNCH]

- **First name plus family name.** The family name is chosen once, with the slot's first character, and descendants keep it (the lineage, 9.2, 3.5 "the Varn line burns hot").
- **Format:** 2 to 14 letters each. Letters, plus at most one hyphen or apostrophe. **No digits**, which blocks phone numbers and usernames hidden in names. A reserved list blocks NPC names, "Seer", "Admin", "Moderator" and similar.
- **Filter pipeline (shared with guild names and dish names):** on the server, call `TextService:FilterStringAsync(text, userId)`, then `GetNonChatStringForBroadcastAsync()`. **Reject** the name if the filtered result differs from the input (it contains hashes), and ask for another. Store the accepted name.
- **Re-filter for display:** persistent user text shown to others (names in rumors, Epithets, the ledger, 5.22) should be re-filtered when it is first shown on each server and the result cached. Roblox's filters change over time. Confirm the current Roblox guidance on a published build.
- Names do not need to be unique. Lineage and Inn tell characters apart.
- **Paid renames: no** at launch. They would erode lineage identity, and they are close to a convenience sale that touches reputation and heat (12).

### S-31 What is rolled, the starting kit, and the random Inn (3.5, 17.4, 17.5) [LAUNCH]

- **Rolled on the server, never sent to the client:** the Constitution block (3.5: capacity trade, Burn, Climate leaning, one craving and one aversion) and catalyst draw seeds (5.5).
- **Random Inn (17.4):** chosen from starter-eligible Inns (Anchor towns, never an outer island, never an Occupied town, 11.13). The pick is weighted toward Inns with the fewest recent assignments (tune), which spreads new players across regions.
- **Conflict and gap (17.4, 17.5):** the doc does not say whether the assigned Inn costs rent. With 5 starting crystals and rent of 1 per day, a new player who never earns would be evicted on day 6. Recommended: **the assigned Inn is rent-free for the first 7 real days** (tune), then normal rent applies. Kitchen Duty (18.13) and mob drops cover it from there. "Daily" rent means a real 24-hour day. See S-48.
- **Starting kit (17.5, "nothing, or a basic staff or sword"):** the player picks one of a basic staff, a basic sword, or bare hands. The pick is cosmetic in intent: no Vow, no stats, and soft clay protects early habits (17.5, 5.4). Everyone also gets 5 crystals (17.5), a full waterskin and 2 rations (tune). **Assumption:** 17.5 lists no food, but without some the first hour's survival chain (3.3) punishes a player who has not learned foraging yet.
- **No class or Vow choice.** Equipment and training define the class (7), and Vows are sworn in play (7.3).

### S-32 Descendant creation (9.2, 9.3, 5.21) [LAUNCH]

- After an Aether death, the slot shows the line continuing. The player chooses a new first name. The family name is kept.
- **Appearance** starts from the ancestor ("family likeness") and is fully editable.
- **Constitution** is inherited with drift (3.5 Lineage).
- **Where the descendant wakes (5.21 "wakes at the Inn holding the Grimoire"):** at the slot's rented Inn. Rent already paid carries over, because rent belongs to the slot. If the rent has lapsed, they wake at a fresh random starter Inn with a new 7-day grace (S-31). The Grimoire is always placed at the Inn where the descendant wakes (9.3).
- **Guild:** the descendant keeps membership as a Member (S-01). The Heirloom follows S-15. The descendant gets the same starting kit as a new character.

---

## 8. Survival readout without numbers (16.3)

The HUD has only Health (orange) and Mana (blue) (16.3, LOCKED). Hunger, Thirst and Blood must still be readable, and Grey Health (Soul Damage, 3.2) is named in the doc but never drawn. The method: **body first, sound second, and the two existing bars may change style but never show numbers.**

### S-33 The body cue ladder (3.3, 3.5) [LAUNCH]

Cues fire at fractions of each character's own capacity, so Constitution (3.5) shifts when they happen and never what they mean.

| Stage (tune) | Hunger | Thirst | Blood |
|---|---|---|---|
| Comfortable (above 50%) | none | none | normal skin tone |
| First notice (50%) | an occasional stomach growl, a hand to the belly in idle | lips dry (a face texture swap), a swallow animation | slight pallor |
| Penalty (30%, matches 3.3) | growls more often, idle posture slumps. Mana regen is -20% (3.3), shown by the mana bar's refill shimmer slowing. | edge blur (3.3, LOCKED), a rasp in the breath | clear pallor, slower Health regen pulse (S-34) |
| Critical (10%) | gaunt face, slow idle | strong vignette, coughing | Health regen stops (3.3). Hands tremble. |
| Zero | Starvation: heartbeat audio, Blood starts falling (visible pallor increase) | Dehydration: heavy vignette, muffled hearing, Blood falls quickly | Health drains (3.3). The Health bar visibly empties. |

- **Recovery cue:** when Hunger and Thirst are high enough to restore Blood (S-55), color returns to the face and a warm exhale plays. Players learn "eat until you see color".
- **In combat,** the first-notice and penalty sounds are muted. Posture changes and the critical and zero cues stay. Survival information never competes with telegraphs (4.9).
- **Muted and small screens:** every stage has a visual cue, so sound-off mobile play (2.2) loses nothing essential.

### S-34 Grey Health and Blood on the Health bar (3.2, 16.3) [LAUNCH]

These are style changes to the existing bar. They are not new HUD elements and show no numbers.

- **Grey Health (Soul Damage):** the right end of the Health bar turns into a **grey segment that Health cannot refill.** Soul Damage lowers your effective maximum Health until you rest at a secure bed (3.2, S-39). This is the only place the term "Grey Health" can live without a number, and it makes Overcharge's cost (3.2) and Vow Backlash (7.3) visible.
- **Blood:** Blood is not a bar. It shows through how the Health bar **regenerates**. At normal Blood, the bar refills with a smooth pulse. As Blood falls, the pulse slows (3.3, "the lower it falls, the slower Health regenerates"). Below 10%, the pulse stops and the bar's frame darkens to a deep red edge. At 0, the bar visibly drains (3.3). Each step matches a real rule, so reading the bar is reading the rules.
- **Colorblind safety:** the grey segment also carries a hatched texture, and the frame change also changes width, so neither relies on color alone.

### S-35 Take Stock, plus PC, mobile, console and accessibility [LAUNCH]

- **Take Stock:** an out-of-combat action (PC: hold the inventory key; mobile: tap your character portrait in the inventory; console: hold View). The character pauses for 2 seconds, looks at their hands, and a short line appears without numbers, for example: "Your stomach is quiet. Your lips are dry. You have lost a lot of blood. Something in you is grey." The same words feed the inventory screen's character portrait, which is painted with the current state (gaunt, pale, grey cracks).
- This gives mobile players a one-tap read without a trip to the Seer (5.23 says "mobile players never need a trip to read their progress", and survival should match).
- **Console:** controller rumble on heartbeat stages (Starvation, Dehydration, 0 Blood). **Mobile:** haptics through HapticService on supported devices, with the same triggers.
- **Accessibility setting, "Body captions":** shows the cue lines as short captions as each stage begins ("Your throat is dry."). No numbers. Off by default. It is for deaf and hard-of-hearing players and for muted mobile play.

---

## 9. Flagged open items resolved

### S-36 In-game day length and survival drains in real time (Appendix B, 3.3, 23) [SUPERSEDED by v3.1 §3.6]

**v3.1 decides this in 3.6:** a 62-minute day, survival numbers in real minutes of play, and the four kinds of time (real seconds, play time, real calendar time, the in-game clock), each with its tie-breaker. This item's 48-minute day, its drain table and its play-time spoilage rule are **withdrawn**. 3.6 puts spoilage on real calendar time. 3.6 also fixes every value S-54 flagged: Resonance resets in real hours (8.1), Meal effects in play time, rent in real days.

Kept only as notes on 3.6:
- 18.10's Meal effect is "2 in-game hours" in the text, while 3.6 puts Meal effects on play time. 18.10 should state its duration in minutes of play, about 30 (tune), so that 18.5's "most of a session" holds.
- 3.6's login grace (60 seconds before Blood drain resumes) also covers the survival readout in S-33. The first cue on login should be the current stage's cue, so a player who logged out hungry sees it at once.

### S-37 Flight ceilings in studs (11.10, 5.10) [LAUNCH]

**The numbers are superseded by v3.1 §11.10:** 0 to 100 studs above ground is normal drain, 100 to 200 is exponential, and 200 and above is instant exhaustion, at about 1 stud per foot (tune). This item's 120/240 values are withdrawn. The rest of this item **extends** 11.10, which says "above ground" without defining it.

- **Altitude Tolerance (5.10)** pushes both lines upward by up to +60% at Perfected (tune, Law 2 curve), keeping the band width. A hard world ceiling applies to everyone (tune: Y = 1,200).
- **What "altitude" means (a gap):** measure height above a **ground reference**, not a raw downward raycast. The reference is the highest surface within an 80-stud radius (tune), read from a coarse baked height grid (16-stud cells). This works because bones never drift (11.12), so the grid is baked once per region, with Drift state kits adding their own small grids. Over the sea, the reference is sea level.
- **Smoothing:** the reference can fall at most 20 studs per second (tune). Flying off a 300-stud cliff therefore does not throw you into exhaustion instantly. Your margin shrinks visibly and you have time to descend.
- **Aether:** the same rule, with the reference taken from the layer below. Over a void with no ground in range, the reference decays at the same rate down to the layout's lowest island level (10.13).
- **Readout (no number):** the rising drain shows as frost on the mana bar's edge and thinning, whistling wind.

### S-38 Trauma: depth measure and what Trauma does (3.2, 4.3, 7.3, Appendix B) [SUPERSEDED by v3.1 §3.1, §3.2]

**v3.1 decides this.** Trigger: only going below zero through Overcharge risks Burn; reaching exactly zero causes Hollow, not Burn (3.1). Depth: Health spent through Overcharge (3.2). Effect: Capacity counts as 50% for casting thresholds and Pressure, no Exhaustion Training XP, a tremor on cast (3.2). Clock: play time (3.2, 3.6). This item's "reaching 0 gives 10 minutes", its 70% mana cap and halved regen, and its wall-clock timer are **withdrawn**.

Kept as a small extension, because v3.1 does not say when depth stops accumulating:
- Depth accumulates over one Hollow episode, which ends when mana recovers above 10% of capacity (tune) or the character rests at a secure bed. Duration = 10 minutes + 35 minutes x min(1, depth / 50% of max Health) (tune), which maps 3.2's "10 to 45 minutes".
- There is no separate knockout state. Trauma applies when the episode ends.

### S-39 What counts as a "secure bed", and what counts as a "safe spot" (3.2, 5.19.2, 5.23, 7.3, 11.8, 18.12) [LAUNCH, with deferred additions]

**v3.1 §17.4 definition adopted:** a bed at a rented Inn, or at a guild hearth (18.12). Camps count only under the tended-hearth rule. This item's paid night at other Inns is **withdrawn**. Guild-hearth beds arrive with the guild hall (S-05, DEFER), so at launch the only secure bed is the rented Inn. The rest of this item extends 17.4:
- Requirements: out of combat (4.1), and not wanted by the town that owns the Inn (12). The Inn stays protected (13), but a wanted character cannot sleep there. This gives heat real teeth.
- **Use:** press E to lie down. While resting online, Soul Damage heals (tune: from fully grey to clear in about 3 real minutes). Logging out in the bed heals it fully.
- **A secure bed also:** converts Body Load (5.19.2, v3.1: at most two conversions per real day, 8 real hours apart), builds Rested Circuit on logout (5.23), ends a Hollow episode (S-38), and restores suspended Vow perks (7.3).

**Added later [DEFER]:** guild hall bunks for members (S-05; v3.1 already counts guild hearths), Claim Stone bunks on a held leyline (S-06), and tended camps (18.12: secure only while the hearth is lit and tended, at PvP risk). These follow 11.8 and 18.12's own recommendations.

**Never a secure bed:** anything in the Aether, an untended campfire, ferries and boats.

**Safe spot (5.23 meditation, also undefined):** out of combat, no hostile mob or wanted player within 40 studs (tune), not in the Aether, and not in a Bleed Zone. A safe spot allows meditation only. It is not a bed.

### S-40 Grimoire arithmetic (9.3, 10.12, 23, Appendix A) [LAUNCH]

- **State it as a multiplier, not a percentage.** "500%" can be read as 5x or as +500% (6x), which is the root of Appendix A's mismatch.
- **Base:** pages the ancestor brought to Mastered give **x5** pre-ripe XP. Pages at Honed give **x3** ("half", 5.21, read as half the bonus: 1 + 4/2).
- **Heroic death (Sacrifice, 10.12, and Hold the Breach, 23):** adds a flat **+1** to each page's multiplier (x6 Mastered, x4 Honed). The stated "700% total" is dropped. This follows 23's own recommendation ("restate Sacrifice as a flat bonus").
- **Interactions (a gap, see S-52):**
  - **Rested Circuit (5.23, x2)** does not multiply with the Grimoire. On an attribute with a page multiplier, the larger of the two applies, and Rest is not spent there.
  - **Blood Memory (5.21, x2 for Capacity and Body)** covers different attributes, so there is no overlap.
  - **No compounding across generations** (5.21, unchanged).
- Applies to pre-ripe XP only, never to catalysts (9.3, unchanged), and the same for Hearth attributes (18.9).

### S-41 The disengage rule (4.9 OPEN, 10.13 "two ways out", 23) [LAUNCH]

**Recommendation: disengaging is always allowed, and its cost is mana, Strain and position.** This matches 23's default and the Fair Danger pillar (1.1), and it gives 10.13's "two ways out of every Arena" a rule to serve.

- **PvP:** unchanged. Combat ends 15s after the last trigger (4.1). Running costs mana (dash) or Strain (Step). Grounding (4.10) and Grabs answer a flier or a runner. Combat logging stays closed (4.1). There are no forced duels.
- **Overworld mobs:** each mob has a home area. It gives up when its target is more than 80 studs from home (tune), or out of sight for 8 seconds (tune).
- **Aether Horrors:** home is the Arena node plus its adjoining Passages in the layout graph (10.13). A Horror pursues through an exit and one module beyond, then returns. The second exit is what makes this fair: a Horror cannot hold both.
- **Leash reset:** a Horror or mob that returns home **heals to full and re-rolls its fight shape** (4.9 escalation restarts, but the baseline opening rule still applies to a new engagement). This kills hit-and-run cheese: out-of-combat mana regen is rapid (3.1), so damage cannot be banked against a static mob. Exploration pressure (10.9) also punishes waiting near the arena.
- **XP:** Action XP already earned stays. The encounter budget share (5.6) is paid only on a kill, so disengaging forfeits it.
- **Sealed Boss Rooms (11.9) have one door.** The sealing team can always unseal from inside, so they hold the key to their own exit. Outsiders still need an Outpouring. Boss Rooms are the one place exempt from the two-exits rule, and the seal is a choice the team made (1.1).
- **Alone instances (10.7):** the same leash rules apply. Dueling one Horror at a time is unchanged.

---

## 10. Other gaps and contradictions (not in Appendix A or B)

Each entry gives where it appears, what is wrong, and the fix.

### S-42 "Positive Resonance" is used but never defined (8.1 vs 10.11, 10.12, 18.13) [SUPERSEDED by v3.1 §8.1]

**v3.1 defines it (8.1):** a separate per-pair bond, raised by fighting on the same side, trading and shared meals, capped per pair per day. It never changes XP, and it gates Sacrifice and (fighting-side only) rescue. It also defines "a fight". This item's Rivalry and Bond names are withdrawn in favour of v3.1's Soul Resonance and Positive Resonance.

Optional extension v3.1 does not cover: Positive Resonance decays slowly when unused (tune: half-life of 14 real days), so years-old acquaintances do not stay Sacrifice-eligible forever. Accounts under 20 hours of play never earn it, following the 8.4 alt-account rule.

### S-43 Rescuers in the Aether: death and escape credit (9.1, 9.3, 10.10, 10.11, 5.25) [LAUNCH, with the rescue MVP] [OVERRIDES v3.1 §10.11, owner's choice]

**What v3.1 decided (10.11):** a rescuer keeps their Lives on entry and is Aether-locked. A rescuer who dies takes an **Aether death (a wipe, 9.3)**. A rescuer who escapes returns with the Lives they entered with, and the escape is not a Major. v3.1 also requires an accept flare from the dreamer, same-side Positive Resonance or a shared guild, and no Rift or Trial chance from rescuer kills.

**Where this item agrees:** escape credit (Problem 2 below matches v3.1), the Aether lock, eligibility, and the anti-griefing rules.

**Where it differs:** only what a rescuer's death costs. Both options are written out so the owner can pick:

| | v3.1: wipe | S-43: all Lives lost, no wipe |
|---|---|---|
| Stakes | the highest possible; the doc's "death in the Aether" rule stays absolute | severe and easy to read; it costs everything except the character |
| Will people join rescues? | likely rare. Only lineages willing to lose a character go, which may shrink the 40% and 90% rescue targets (10.10) to a niche | more likely; a guild can rescue without betting a character on someone else's bad luck |
| Griefing exposure | none from the rescuer's side | none; the v3.1 eligibility rules still apply |
| Rules | one rule for everyone in the Aether | one exception: rescuers have a different fate from dreamers |
| Repeat-run cheapness | not an issue | handled: a 0-Life character cannot join another rescue |

**Recommendation:** keep the S-43 option if live data shows rescue participation matters more than one absolute rule. Otherwise v3.1 stands. Either way, rescuers enter with their current Hunger, Thirst and Blood (3.6's 70% wake applies only to dreamers), and the rite states the cost before entry.

- **Problem 1:** 9.3 says dying in the Aether deletes the character. A rescuer with 3 Lives who dies on a rescue would therefore be wiped, which no player would expect from "40% survival for rescue parties" (10.10).
- **Fix 1 (revised after review):** a rescuer who dies in the Aether **loses all remaining Lives** and wakes at their Inn with **0 Lives**: one Soul Crack, Broken armor (9.1), and the usual death losses (10% of the current Capacity bar, half of unconverted Body Load, 5.25). It is never a wipe caused by someone else's bad luck, but it is severe and easy to read. A 3-Life character risks everything except the character itself. The rite should say this plainly before entry (Fair Danger, 1.1).
  - **Why not one Life:** 10.11 asks that rescue stay "tense and meaningful", and 10.10's "no guarantee for each member" implies a real cost. At one Life, a 3-Life rescuer could die twice and still have a Life left, so repeat rescue runs would be cheap.
  - **Why not a wipe:** 9.3 read literally would end rescue participation entirely.
  - **What 0 Lives means afterward:** the rescuer's next overworld death sends them into the Aether as a dreamer (9.1). Majors and the mending rule (5.25) bring Lives back as normal.
  - **No chain rescues:** **a character with 0 Lives cannot join a rescue** until at least one Life is mended. Otherwise a rescuer with nothing left to lose would be a free extra body.
- **Problem 2:** "an escaped character returns with 1 Life, and the escape counts as a Major breakthrough" (5.25). Rescuers who walk out of a friend's Aether would farm free Majors and Lives.
- **Fix 2 (matches v3.1 §10.11):** escape credit (the Major and the Life rules in 5.25 and 23) goes only to characters who entered as dreamers. Rescuers who escape get a ledger line, nothing else. Rescuers also get the account-level Aether lock (10.8) for the duration of the rescue.

### S-44 Power Score: "current durability" versus "a broken weapon never lowers the score" (5.7) [SUPERSEDED by v3.1 §5.7]

v3.1 scores the weapon and glyphs at full durability, and the freeze now also includes anything reached during the encounter (5.7, 23). S-12 applies the same rule to armor.

### S-45 Glyph of Expansion "less speed" versus fixed projectile speed tiers (6.1 vs 4.11 Law 6) [DEFER with glyphs]

- **Problem:** 6.1 (LOCKED) says Expansion trades size for speed. 4.11 Law 6 fixes projectile speed per echelon so dodging stays learnable.
- **Fix:** read "speed" as **cast speed** (startup). The LOCKED wording stands, and the Law holds. Same as S-21 rule 4.

### S-46 The Trauma debuff has no defined effect (3.2, 4.3, 7.3) [SUPERSEDED by v3.1 §3.2]

See S-38.

### S-47 Respawn location: "the nearest Inn" (9.1) versus the rented Inn (17.4) [LAUNCH]

- **Problem:** 9.1 respawns you "at the nearest Inn". 17.4 makes Inn rental, eviction and "the next respawn washes the player ashore" meaningful only if respawn uses your rented Inn. If respawn used the nearest Inn, rent would be pointless.
- **Fix:** respawn at **your rented Inn**. An evicted character respawns on a random outer island (17.4) until they rent again. Amend 9.1's wording.

### S-48 Rent for the initially assigned Inn, and the time base of "daily" (17.4, 17.5, 18.13) [PARTLY SUPERSEDED by v3.1 §17.4, §3.6]

- **Settled by v3.1:** rent runs in real days, rolling from payment (17.4, 3.6). Kitchen Duty and Feasts also run on real calendar days (3.6).
- **Still open:** whether the randomly assigned starting Inn costs rent. With 5 starting crystals and rent of 1 per day, a player who earns nothing is evicted on day 6. Fix: 7 real days rent-free on the assigned Inn (S-31). This matters more now, because v3.1 17.4 makes only a **rented** Inn a secure bed.

### S-49 Mana Crystals are not on the drop or trade list (17.2 vs 18.13, 12) [PARTLY SUPERSEDED by v3.1 §8.4]

- **Problem (still in 17.2):** 17.2's allowed list now covers glyphs, weapons, armor, food, potions, salves and Tome fragments, but still not crystals. Meanwhile 18.13 sells food for crystals, 12 pays bounties from the criminal's assets, and v3.1 8.4 rate-limits "dropped crystals ... per receiver per real day". So 8.4 assumes crystals can be dropped.
- **Fix (revised to match 8.4):** add Mana Crystals, materials, ingredients and Wellstones to 17.2. Crystals can be dropped and traded. The 8.4 per-receiver daily limit counts crystals received **by drop and by trade together**, so the trade window is not a way around it. This item's earlier "no crystal drops" line is withdrawn. Doc 26.12 already lists crystals as tradable (citing S-49).

### S-50 The Fist's "nothing that can break" versus wearable armor (7.3, 7.4 vs 9.1) [LAUNCH]

- **Problem:** the Vow forbids only heavy armor, so a Fist can wear Light and Medium armor, which breaks on death (9.1) and wears in fights.
- **Fix:** restate 7.3 and 7.4 as "no weapon to break or be disarmed". The alternative is to restrict the Fist to Light armor. The recommendation keeps the doc's Vow text and changes the summary line.

### S-51 Law 1's "identical for every character" versus the Sword Mage's 0.1s window (4.11 vs 3.2, 4.6) [SUPERSEDED by v3.1 §4.11]

v3.1 adds the Hollow Sword Mage's halved blade parry to Law 1 as the one state exception, "a penalty, never a bonus". If v3.1's Parrying while Hollow item (23, OPEN) ships, it is a second state exception and Law 1 should name it too.

### S-52 Grimoire multiplier versus Rested Circuit stacking, and what "half at Honed" means (9.3, 5.21, 5.23) [LAUNCH]

- **Problem:** both multiply pre-ripe XP (x5 and x2). Nothing says whether they combine (x10). "Half at Honed" does not say half of what.
- **Fix:** see S-40 (take the larger; Honed is x3).

### S-53 Lives above 3, and a Major breakthrough at full Lives (5.25, 9.1) [LAUNCH]

- **Problem:** nothing caps Lives, and nothing says what a Major does at 3 Lives.
- **Fix:** Lives cap at 3. A Major at full Lives is not banked. The mending rule's "held, up to one" (5.25) applies only below the cap. The Seer acknowledges it ("Your soul is whole; the growth is its own reward").

### S-54 Other values stated in in-game time, and survival while offline (8.1, 18.8, 18.10, 18.17) [SUPERSEDED by v3.1 §3.6]

See S-36. The only leftover is 18.10's "2 in-game hours" wording.

### S-55 "Restored by having full Food and Water" has no threshold (3.3) [SUPERSEDED by v3.1 §3.3]

v3.1 restores Blood while Hunger and Thirst are both above 70%, the same value this item proposed.

### S-56 Where Flight and other utility spells sit, especially on mobile (4.11, 16.1, 2.3) [SUPERSEDED by v3.1 §4.11, §16.2]

v3.1 gives every platform 5 combat slots plus 2 utility slots (Flight, Suppression, Mana Vision or a cantrip). Mobile shows them as a second ring and console on the d-pad. The only leftover: 16.1 still labels keys 6 and 7 "non-combat utility", while 4.11 lets Flight be used in combat. Recommend changing the wording to "utility".

### S-57 Can an unread Spell Tome be traded? (17.2, 5.19.6) [LAUNCH]

- **Problem:** "Spell Tomes (soul-bound on use)" implies an unused Tome is not yet bound, but 17.2 lists Tomes as not allowed to drop at all.
- **Fix:** Tomes and Manuals bind on **pickup**, not on use. They can never be dropped or traded. This keeps acquisition personal (5.12), and Tomes cannot become a market for power (1.2). If you want a Tome market later, Tome **fragments** (5.20) are the safer tradable unit.

### S-58 "Top-10 guild" implies a guild ranking (10.10 vs 16.3, 11.13) [LAUNCH, wording only]

- **Problem:** no numbers are shown, and results are "never shown as a scoreboard" (11.13), yet 10.10 quotes survival for "a top-10 guild".
- **Fix:** treat it as a designer's tuning description, not a feature. There are no guild leaderboards. Guild renown travels through ledger lines, Epithets and Inn rumors (5.22). Change 10.10's wording to "a highly skilled guild".

### S-59 Sealed Boss Rooms versus disengaging (11.9 vs 4.9, 10.13) [LAUNCH]

- **Problem:** a sealed Boss Room has one door, and the sealed team cannot leave if the seal is absolute.
- **Fix:** the sealing team can always unseal from inside (S-41).

### S-60 The Echelon 3 parry cost is worded two ways (4.6 vs 23) [LAUNCH, wording only]

- **Problem:** 4.6 says the cost "scales with the attacker's echelon above Echelon 2". 23 says "scaled by echelon gap". Barrier is Echelon 0, so a gap reading would make Echelon 1 and 2 parries cost mana too.
- **Fix:** use 4.6's wording in both places. Only Echelon 3 attacks cost mana to parry.

### S-61 "Safe spot" for meditation is undefined (5.23) [LAUNCH]

- **Problem:** meditation works "in any safe spot", which is a second undefined term next to "secure bed".
- **Fix:** see S-39.

### S-62 Weapon durability on overworld death is unspecified (9.1, 7.2, 7.3) [LAUNCH]

- **Problem:** 9.1 sets armor to Broken. Weapons, which the Blade depends on, are not mentioned.
- **Fix:** weapons are **unchanged** by death. The Blade already pays through durability in every fight (7.3 gear dependence), and breaking the weapon too would double-punish the physical path on top of losing half its Body Load (5.19.2). If death should cost the Blade more, weapon durability -25% (tune) is a softer alternative.

---

## What can wait past launch (summary)

| Deferred | Stand-in at launch |
|---|---|
| S-05 guild hall, hearth, shared larder | Inn kitchens (18.12), personal larders |
| S-06 leyline control | leylines open to everyone (11.3) |
| S-08 cross-server guild chat | same-server guild channel |
| S-17 Warding Tonic, Clear Eye | Warmth, Cooling and Clear meals (18.10) |
| S-20 player crafting | NPC crafters |
| S-21 new glyphs | glyphs already deferred (21.2) |
| S-27 rowboats and sailboats | ferries and swimming |
| S-39 guild-hearth, Claim Stone and camp beds | rented Inn beds (v3.1 17.4) |
| S-03 Spar Challenge (optional) | normal PvP with the 90% penalty |

## Conflicts with the doc and assumptions, collected

- **Conflicts with v3.1 still proposed for amendment:** S-21/S-45 (6.1 "speed"), S-10/S-50 (7.3/7.4 "nothing that can break"), S-47 (9.1 "nearest Inn"), S-49 (17.2 list omits crystals, which 8.4 assumes can be dropped), S-58 (10.10 "top-10 guild"), S-60 (4.6 vs 23), S-36 (18.10 Meal effect still in in-game hours), S-56 (16.1 "non-combat utility").
- **Overrides of v3.1, owner's choice:** S-43 (a rescuer's Aether death costs all Lives, not a wipe, 10.11).
- **Resolved by v3.1 (formerly conflicts):** S-12/S-44 (5.7), S-51 (4.11), S-42 (8.1), S-46 and S-38 (3.2), S-36 and S-54 (3.6), S-55 (3.3), S-56 (4.11).
- **Names outside this file that need updating if the renames are accepted:** "Phantom Echo" in doc 26.2 and 26.7; "Haste" and "Reach" in doc 26.6; "Mana Batteries" in doc 26.12. The potions file's internal launch-set mismatch (24.7 vs 24.18 and 24.19) is noted under S-17.
- **Readings of ambiguous text:** S-40 ("500%" means x5; Honed "half" means x3), S-38 (an episode window for depth; no knockout state), S-57 (Tomes bind on pickup; v3.2 26.9 agrees).
- **Assumptions:** S-13 and S-22 (stack counts and the crystal count may appear in the inventory and trade screens, not on the HUD), S-31 (starting rations and waterskin, a 7-day rent grace), S-15 (the Aether wipe clears the Inn chest except the Heirloom, following 5.21 literally), S-29 (custom rig, no Roblox avatar import), S-25 (seawater cannot be boiled safe).

> Merged into game-design.txt v3.2 (Section 26).

# Proposal: Rarity (Section 26, against Game Design Document v3)

Status: PROPOSED. Nothing here is accepted until the owner marks it. The design doc (`docs/game-design.txt`, v3) is unchanged. Every number is (tune). Section numbers in parentheses point to the doc; S-numbers point to `docs/proposals/missing-systems.md`, C-numbers to `docs/proposals/combat-numbers.md`, B-numbers to `docs/proposals/bestiary.md`, W-numbers to `docs/proposals/world-and-lore.md`. Where this proposal needs one of those to hold, it says so. Where it disagrees, it marks a **Conflict**.

The doc uses the word "rare" about twenty times (rare materials 17.3, rare books 5.12, the rare Tome of Split Focus 5.13, a rare material for spirit-forged blades 7.3, rare cuts 18.7, rare glyph materials in the bestiary) and never says what rare means or does. This section makes it one system that potions, cooking, collecting, crafting and events can all plug into.

---

## 26. Rarity (PROPOSED)

"Nothing is rare because it is strong. It is rare because of where you had to stand to find it."

### 26.1 Intent and Design Laws

Rarity is the shared language that gives finds weight. A glyph, a cut of meat, a Tome fragment and a hearth skin all need the same answer to "how hard was this to come by, and what does that buy me?"

In most games the answer is "rarer is stronger". This game forbids that drift, so the answer here is different: rarer is **stranger, more specific, and more storied**. It never means bigger.

Rarity obeys the document's laws, and three of them do most of the work:

Skill Over Build (4.11). No tier of anything may widen a window, shorten a telegraph below its floor, break an echelon band, pass a hit cap, or stack passive damage. A Storied glyph and a Stocked glyph live inside the same magnitude band. Rarity picks *which* trade, never *how far*.

Power is never sold, and borrowed power costs XP (1.2, 5.7, 17.6). Because rarity is not power, a rare find does not raise the Power Score beyond what the same class of item already does (S-12, S-44). Gifting a rare item to a newcomer gives them a story and a tool, not a Threat penalty worth noticing.

Earned Discovery (1.1). A rare find is knowledge and tools: a key that opens a door (spirit-forging, a Tome fragment, a recipe tag), a strange trade nobody else has, or a record that says where you stood. Never free stats.

Three more laws that are specific to this section:

The Stocked test. For every combat *answer* a rare item provides, the base kit or a Stocked or Found item must already give the same answer (4.11 Law 5), except for keys that the doc already gates on exploration (spirit-forged blades 7.3, Echelon 3 Tomes 5.20) and that are tools rather than stats. Sidegrades (odd glyph trades, 26.6; odd weapon properties, 26.7) are allowed at higher tiers because they change *how* a fighter answers, never *whether* they can, and they stay inside the Stocked magnitude band. A rare item that fails the test does not ship, the same rule as 4.11 Law 6 for actions.

The telegraph law. No tier, trade or property may reduce what a telegraph tells an opponent: its sound tier, size tier, color, parry class or startup floor (4.7, 4.9, 4.11 Law 1). An odd trade may add information to the world (light, a trail, a mark); it may never take information away.

Every material trades. The material analog of "every glyph trades one stat for another" (6.1). A rarer material changes durability, weight, or what it can touch (spirits), and every gain is paid for. No material is a pure upgrade.

Source, not roll. Rarity is declared by where an item comes from, not rolled onto it. There are no affix rolls, no "a lucky Ironstone sword", no item that is rarer than its source. This is what keeps rarity out of the farm loop (26.11).

### 26.2 What Rarity Means (the core ruling)

Rarity is **provenance**: where, when and how a thing was come by, carried on the item as a record. The record is what the tiers measure, and it has three consequences that make a rare find exciting without making it a gear check.

Breadth. Rarer sources speak stranger options. A Stocked Glyph Source speaks the base trades (Expansion, Focus, Thrift). A Sought or Rumored source may speak a trade nobody in town sells (a projectile that curves more for a slower start, one that ricochets for less damage). This is exactly how Forms work (5.22): a sidegrade in the same band. Rarer gives you a build nobody else has, not a build that wins.

Access. Some rare finds are keys. Starmetal plus a Phantom Echo opens Phantoms to a Blade (7.3, S-19). Tome fragments open an Echelon 3 (5.20). A Drifted ingredient opens a recipe tag (18.9). Keys open doors that lead to the same combat the base kit already answers (4.11 Law 5); they never add a stat.

Transience and story. Some things exist only in a 30-minute Drift state (11.4, 18.7), only during one Great event (11.13), or only once per server block. Their value is that they cannot be ordered: a player who has one was there. The item says so in its name and in the ledger. This is where the designer's "chase the build, brew the potion, invent the recipe, collect the item" players live, and it costs the balance nothing.

Durability and material quality sit inside this as a small, capped band (26.7). They are real but they are the least of what rarity does.

Rejected directions, and why: rarity as magnitude (breaks 4.11 and makes rare drops a farm); rarity as random affixes (same, and makes the duping and RMT problem of 26.14 worth someone's while); rarity as colour borders (26.4, a number with the digits filed off).

### 26.3 The Tiers (shared vocabulary)

Seven tiers, named for how a thing is come by, in plain words a person in the world would say (Appendix C naming rules). Each is a *source class*. A drop table row, a forage node, an NPC stock list, a Fissure reward or an event budget declares its tier; the item inherits it at the moment it enters the world and never changes it. In rough order of how hard a thing is to come by: Stocked, Found, Hoarded, Drifted, Sought, Rumored, Storied.

| Tier | Source class | Promise | Forbidden |
|---|---|---|---|
| **Stocked** | Sold by Anchor NPCs, or dropped by common mobs and ore in a region's bones (11.12 Layer 1). Always available, learnable (Design Law 3). | Everything a build needs to function is Stocked or Found. The whole base kit, every base glyph, every base material, every staple. | Nothing is forbidden; this is the floor every other tier is measured against. |
| **Found** | Overworld drops and forage from fixed places: a species' Found row, a Dead Zone ore, a leyline crystal. Learnable in place, scheduled by spawn budgets (11.4). | A reason to go somewhere specific. Deepsilver only in Dead Zones; Leystone only on leylines (S-19). | No per-kill roll finer than 10% (tune) on a repeatable mob. Rare per-kill rolls are what farms are made of. |
| **Hoarded** | Held places in a region's bones that never drift: ruin caches, dungeon vaults and Boss Rooms (11.9), Pressure Peak beasts and minerals (11.3), a hidden mentor's gift. Standing and learnable, but something guards it. | A reason to go somewhere hard on purpose. Circuit glyph trades, Pressure Peak cuts and minerals, ruin stores, the Tome of Split Focus (5.13). Budgeted per site and refilled each Drift block (11.4). | No per-kill roll. No magnitude above the Stocked band. Never a key that only one site in the world holds. |
| **Drifted** | Exists only while a Drift state, a weather front or a Local event is on (11.4, 11.7, 11.13). Learnable grammar, unlearnable timing. | A window and a rumor. "The tide left wheat in the lowlands this week" (18.7). Ingredients with state tags, state-only materials, front-touched cuts (B-06). | Never a combat key. A Drifted thing is never the only route to anything a fight needs. |
| **Sought** | Unstable places and server-scale happenings: Fissures (11.6), Bleed Zones (11.5), Local and Regional events (11.13). The item carries its origin: the place, the block, the finder. | Breadth: the common odd glyph trades (26.6), common odd weapon properties (26.7), most Tome fragments, Bleed Zone reagents, Migration cuts. Budgeted per site or event instance, never per kill (26.11). | No magnitude above the Stocked band. No Sought item changes a number a Stocked item of the same class could not reach. |
| **Rumored** | Rare, world-scale finds reached only by following a rumor: Falling Star craters (11.13), Risen Ruins, Great events, Wandering Masters, and what leaves the Aether (Tome fragments and Horror trophies, 26.13). | Keys and the rarest breadth: starmetal, the rare odd trades and properties, Echelon 3 fragments from Great events and the Aether. The thing a server talks about for a week. | Everything Sought forbids. Never guaranteed to any one player: budgeted per event, split by contribution (5.6). |
| **Storied** | One per server per block, or one per lineage: the first full clear of a Risen Ruin (11.13), a Great event outcome, a "Bane of" trophy (5.22), an Heirloom across generations (23), a Hearth Fair prize. The ledger records it. | Recognition. A Storied item is a ledger entry made physical. It is spoken of in Inn rumors like an Epithet. | No combat function at all beyond what the same item would have at Rumored. Storied is a cosmetic and provenance tier, by rule. Slot-bound (26.12). |

Why seven and not five. The two added tiers split the old Found and Sought, each of which was carrying two different promises. Hoarded separates "always there, but guarded" from "drops around here" (Found). Rumored separates "world-scale, follow the rumor" from "server-scale, go into the unstable places" (Sought). Each tier now answers one question a player would ask: can I buy it, where does it drop, who guards it, when does it come back, where is it unstable, what are people talking about, and who was first.

Rules across tiers:

No tier has a drop rate. Stocked has a price. Found has a per-kill chance capped at 10% and subject to Familiarity. Hoarded has a budget per site per Drift block. Drifted has a budget per state. Sought has a budget per site or event instance. Rumored has a budget per world-scale event. Storied has a claim key. "What is the drop rate of X" is never a question with a number for an answer, because above Found there is no roll.

Tier names are spoken, never labelled. The Seer, a smith, an enchanter or an Inn cook may say "that is Drift-stuff, enjoy it while it lasts" or "this came out of a dream". No inventory field, border, star or icon ever says "Sought". This matches how Raw to Perfected and Burnt to Masterwork are read (5.5, 18.5): in words and in the thing itself.

A system declares an item's tier by its source row. There is no API for "make this item rare". A spawn-table row, stock list, reward budget or claim key has a `tier` field, and the item inherits it (26.17). A crafted item inherits the highest tier among its inputs (a glyph from a Sought Glyph Source is Sought; a sword of Stocked Ironstone is Stocked), so crafting never launders a tier up or down.

Witness class and scope (the collecting hooks, 25.5, 25.13). Every origin record carries the collecting proposal's witness class, Standing, Drifting or Sealed, and a scope flag, server or world. Each tier has a default, and the source kind can override it, because a tier says how a thing is come by and a witness class says whether it comes back:

| Tier | Default witness class | Overrides by source kind | Scope |
|---|---|---|---|
| Stocked | Standing | none | world |
| Found | Standing | none | world |
| Hoarded | Standing | none | world |
| Drifted | Drifting | a state on a per-server seed that has ended: Sealed (25.5) | server (per-server Drift seed, 23 recommended) |
| Sought | Sealed (an event or Fissure instance) | a Bleed Zone state site: Drifting | server (Local and Regional events, 11.13 rumor reach) |
| Rumored | Sealed (a star, a ruin, a Great event, a dream) | none | server for Regional (Falling Star, Risen Ruin), world for Seasonal and Great events |
| Storied | Sealed, always | none | server for a first clear, world for a Great event outcome, lineage for an Heirloom |

The book draws the witness class and never the tier name, and the scope decides which rumor pool a brag enters (25.13). The one place the two systems do not line up on purpose: collecting's ink tiers (Glimpsed, Marked, Known) are how well a thing is witnessed, and rarity's tiers are how a thing is come by. They share no words. This proposal avoids "Marked" for that reason.

### 26.4 Reading Rarity Without Numbers

No colour tiers. Three reasons. A coloured border is a number in disguise, and it teaches "sort by colour, vendor the rest", which is the mass-market reflex this game filters out (2.1). Colour is already a gameplay language here: the four parry classes own white, vermillion, yellow and blue (C-10), auras own the threat colours (15.3), and the flame bands own the hearth. A third colour language on items would collide with both on a phone screen. And the item already carries the truth honestly: material, silhouette, VFX, sound, and its name. Rarity is read the way everything else in this game is read: from the world, in words.

How it is read, in order of reach:

Name form. The name carries the provenance, and the provenance is the tier. Stocked things have bare names: "Ironstone sword". Found things name their place: "Deepsilver from the Hollow Reach". Drifted things name their state: "tidewheat, from the flooded lowlands". Sought things name the site, the time and the finder: "starmetal from the Thornfell crater, the week the star fell, found by Varn". Storied things carry a ledger line: "the first blade through the Drowned Stair". The name is generated by the server from the origin record (26.17) and never typed by a player, so the filter pipeline (S-30) only touches the finder's character name, which is already filtered.

Material and silhouette. Tier is visible on the model the way armor class is visible (S-10). Deepsilver gleams; a Hoarded thing carries dust, age and a seal; starmetal is dark and veined and looks brittle; a Sought glyph's inscription moves; a Storied item has a faint, slow aura particle that is on the gameplay-exempt layer (C-10c budget rules) so it survives mobile scaling. Nothing that carries this information lives in a texture alone (W: silhouette first rule).

Sound first. Picking up a Found thing clinks. A Hoarded thing knocks dully, like something lifted from stone. A Drifted thing has a short breath of its state's ambience (water, wind, ash). A Sought thing lands with a low tone. A Rumored thing lands with the low tone and a distant bell. A Storied thing lands with a chord, and nearby players hear it. Sound is the readout that works with the phone in a pocket (18.15).

Mana Vision. Sought, Rumored and Storied items hold a residual signature of their origin and shimmer faintly through Mana Vision (15.2), the same way a Drift tell shimmers (11.4). This is also a tell for thieves and a reason to keep a storied blade sheathed in a market.

The Seer, smiths, enchanters and cooks (the appraisers). Each reads the kind of item it knows, in words, with no number: a smith reads material and quench ("this will take one quench and no more"), an enchanter reads a Glyph Source ("it speaks two things, and one of them I have never heard"), a cook reads an ingredient's tags (Palate, 18.11), the Seer reads the ledger line on a Storied item. Appraisal is free and takes a trip, like reading your soul status (9.1).

Inventory and trade window. Items show visuals and the name line, grouped by kind, sorted by the time they were found. No rarity sort, no rarity filter, no border. The trade window shows the same (S-22). A used sword is judged by its cracks; a rare one by its name and its metal.

The tell vocabulary. Rarity owns one tell per tier, in the Drift's own language (11.4: a colour drift, a hum, a shimmer). Collecting mirrors each with a paper and ink treatment (25.13) and reuses the names; no other system invents a second set.

| Tier | Sight | Sound | Mana Vision | Name line |
|---|---|---|---|---|
| Stocked | the plain model | a plain clink | nothing | bare name |
| Found | material visible on the model | a clink with a second note | nothing | name plus region |
| Hoarded | dust, age and a seal or wax mark on the model | a dull knock | nothing | name plus site ("from the Drowned Stair's vault") |
| Drifted | a faint colour drift toward its state (sea-green, frost, ash) | a breath of the state's ambience | nothing | name plus state |
| Sought | a moving inscription, a residual wisp | a low tone | a faint shimmer | name plus site, time and finder |
| Rumored | veined or starlit material, a slow inner light | a low tone and a distant bell | a clear shimmer | name plus event, time and finder |
| Storied | a slow aura particle, gameplay-exempt layer | a chord that nearby players hear | a steady shimmer | a ledger line |

Every tell is identifiable with colour removed and with sound off, not both at once, the C-10 rule.

### 26.5 Find Rarity and Made Quality (two axes, never one)

Find rarity (this section) is the source. Made quality is what the maker's hands did: cooking's five bands (Burnt, Plain, Good, Fine, Masterwork, 18.5), potion quality (the potions proposal), and crafting quality when player crafting ships (S-20). They are different axes and both can be true of one item: "a Fine stew of drifted tidewheat", "a Masterwork sword of Found deepsilver".

Rules that keep the two axes from multiplying into power:

Quality moves within a band that the item's class fixes (18.10 caps, S-17 caps, S-11 durability by class). Rarity never widens that band. A Masterwork dish of Sought ingredients has the same Meal effect cap as a Masterwork dish of Stocked ones (18.10). It may have a *different* effect, because a Sought ingredient may carry a tag no Stocked ingredient has.

Rarity gives new inputs; quality decides how well they are used. A Drifted ingredient is a new tag. A Sought Glyph Source is a new trade. A Sought ore is a new durability-weight point. What the player makes of it is quality, and quality trains by use with Novelty and Familiarity (18.11, S-20).

Quality bands and rarity tiers never share a word (Appendix C: one name, one meaning). This section avoids "Plain", "Good", "Fine", "Raw", "Practiced" and the rest on purpose.

Neither axis is ever a number, and neither sits in the Power Score beyond what the item's class already contributes (S-12, S-44).

### 26.6 Glyphs (6.1, S-21)

Glyph rarity is the breadth of the trade, never its size. Every glyph's magnitudes sit inside one band (tune: gains of 15 to 30% paid by costs of 15 to 50%, the S-21 table as the reference), at most 2 sockets per spell, no duplicates, no window changes, no travel-speed changes, hit caps after everything (4.11 Law 1, Law 5, Law 6; S-21 rules 1 to 7). Rarity cannot touch any of that.

What a rarer Glyph Source changes is which trades it speaks (S-20: each source speaks 2 types, seeded per source):

Stocked sources (bought from an enchanter, or common inscription stones) speak only the base list: Expansion, Focus, Thrift, Haste, Reach (S-21).

Found sources (Dead Zone and leyline stones) add the circuit trades: Density, Patience, Weight, Breath.

Hoarded sources (ruin caches, dungeon vaults, Pressure Peaks) speak the circuit trades with a seeded pairing that a bought source never has (for example Density with Breath), which is how a build-chaser hunts a specific pair.

Sought sources (Fissures, Bleed Zones, Local and Regional events) may speak a **common odd trade**: a sidegrade in the spirit of Forms (5.22) that changes how a spell behaves rather than how much it does. Launch candidates (tune, all inside the band): Lantern (the projectile lights the area it passes, paid with -20% hitbox), Curl (a projectile curves 10 degrees more with aim at release, paid with +20% startup, never below the floor), Ember (the spell leaves a short-lived cosmetic residue, paid with -10% damage).

Rumored sources (Falling Star craters, Risen Ruins, Great events, the Aether's fragments) may speak a **rare odd trade**, the same rules with stranger shapes. Launch candidate (tune): Ricochet (a projectile that strikes terrain bounces once at half energy, paid with -20% damage on every contact; the bounce is visible and keeps the echelon's sound and size tier).

Every odd trade obeys the telegraph law (26.1): it may add information to the world, never remove it. A silent cast, a hidden projectile, a shortened startup or a changed parry class is never an odd trade. An odd trade must also pass Law 6: a mix-up and a counterplay in its skill_notes, or it does not ship.

Storied glyphs do not exist as a separate kind. A Sought or Rumored glyph that was the first of its trade on a server gets a ledger line and the finder's name; its trade is unchanged.

A glyph's tier is the tier of its Glyph Source. Enchanting never raises it. Glyphs are droppable and tradable (17.2), so odd trades move through the player economy and a build can be assembled by trade. That is intended: a glyph is a tool, and trading tools is the Social Ecology pillar.

### 26.7 Weapons, Armor and Materials (17.3, 7.2, S-11, S-19)

Weapon and armor rarity is material and maker, and material does three things: it sets maximum durability (S-11, S-19), it sets weight (S-13), and it may add one property. It never sets damage (S-19: "materials never form a damage ladder") and never sets armor reduction (S-11: reduction depends on class only).

The durability band is capped. Stocked Ironstone is the base. No material exceeds 1.6x base maximum durability (tune), and the Law 2 curve applies, so Deepsilver at 1.6x is the ceiling, not a step on a ladder. Durability is "longer between repairs", a convenience the Blade pays for in every fight (7.3), and it sits in the Defense part of the score only as the class and material already do (S-12).

Every material trades (26.1):

| Material (tier) | Gains | Pays | Property |
|---|---|---|---|
| Ironstone (Stocked) | the base | nothing | none |
| Deepsilver (Found, Dead Zones only) | +60% max durability | +25% weight | none |
| Anvil stone, keystone chip (Found, B-05, B-19) | +40% max durability | +15% weight; repairs cost 1.5x (S-11) | none |
| Starmetal (Rumored, Falling Star 11.13) | touches Phantoms and Wraiths when quenched with a Phantom Echo or grave-iron (S-19, B-11) | 60% of steel's max durability (S-19); cannot be repaired above 75% after its first Broken (tune) | spirit-forged |
| Hide, slate plate, Golem Core Shard (Found) | Light, Medium and Heavy armor bases (S-09, S-19) | per class (mobility cost, S-09) | none |

Odd weapon properties (DECIDED direction, values tune). Material is the floor of weapon rarity; odd properties are what a build-chaser hunts. A weapon from a Sought source may carry one common odd property, and a weapon from a Rumored source one rare odd property, seeded by its source and fixed for life. Hoarded and lower weapons carry none. Odd properties follow every glyph rule: a sidegrade inside the Stocked magnitude band, paid for, never damage, never a window, never a startup below the floor, never a passive stack, never a change of parry class, and always obeying the telegraph law (26.1). Each needs both skill_notes fields (4.11 Law 6). A weapon's odd property and its spell's glyphs never combine into a second socket's worth of change on one action (S-21).

Common odd properties (Sought, launch candidates):

| Property | Gains | Pays |
|---|---|---|
| Hooked | a successful Physical Parry drags the attacker half a step toward you | +15% Strain or mana on every Physical Parry |
| Weighted | Strikes push a Guarding target back further (more space for the follow-up) | +10% Strike startup, never below the floor |
| Long-hafted | +12% Strike reach | +10% recovery on Strikes |
| Light | -30% weight (S-13), faster weapon toggle | -30% max durability |

Rare odd properties (Rumored, launch candidates):

| Property | Gains | Pays |
|---|---|---|
| Ringing | Spellcut deflects send the spell off at a wider angle, sometimes back toward its caster's side (4.12) | Spellcut costs +50% durability |
| Starbitten (starmetal only) | Spellcut against Echelon 1 spells costs no durability | Spellcut against Echelon 2 spells costs double durability |

The Fist has no weapon, so odd properties do not reach it (7.3). Its breadth stays in technique glyphs (S-21 rule 6) and its trophies, which is the right place for the hardest path's pride. A Fist in a band of build-chasers is the one who brags about what they survived, not what they carry.

Maker's names. A sword forged by the starmetal smith (W-40) or by a player smith when crafting ships carries the maker's name in its name line, like a cook's name on a dish (18.13). It changes nothing else.

Armor class is visible (S-10); material is visible on top of it. A player reading an opponent sees "plate, deepsilver": heavier, slower, no stronger.

The Sword Mage's blade (7.2) follows the same table. Mana Reinforcement is a state, not a material, and a Hollow Sword Mage holding a Rumored blade still holds brittle iron.

The Fist has nothing to break (7.3, as restated in S-50), so weapon rarity does not touch it.

### 26.8 Ingredients and Reagents (18.7, S-17, the potions and cooking proposals)

An ingredient's rarity is its tag set and its window. Rarer ingredients carry tags that Stocked ones do not, and exist for less time. They never make a bigger meal or a stronger potion; the caps in 18.10 and S-17 stand for every tier.

Stocked: Inn staples (salt, fat, grain, water), at prices that never beat foraging (18.7).

Found: forage and hunting in a region's bones, identified by Foraging (3.3, 5.8). Resonant meat, mineral salt, common herbs, Volatile Gel. Guards and Phantoms give nothing edible (18.7), which also means the villain loop and the Phantom loop supply no reagents.

Drifted: state and front ingredients (18.7): tidewheat in the flood, sea salt and fish in the ocean state, front-touched cuts (Cold, Hot), Mana Storm produce with a volatile Resonant tag, rain mushrooms the next morning. Rumors name them (11.8). Their recipes are Discoveries (18.9), which is the knowledge reward.

Hoarded: Pressure Peak cuts and minerals (B-20, B-21) and ruin stores (aged honey, sealed grain jars, 18.7). Always there, always guarded.

Sought: Migration herd cuts (B-06) and Bleed Zone flora, which is the overworld's learnable poison and antidote source (18.14, S-17). A Sought ingredient may carry a unique tag (the bestiary's "Earth-touched"), and a unique tag is a recipe or a potion category that cannot be made any other way. The result is still capped. The only thing the cap does not bound is *which* effect, and that is the whole reward.

Rumored: few by design. Crater growths after a Falling Star and Great-event stores. They exist to become a dish or a draught people talk about, not a supply.

Reagents (for the potions proposal). Reagent tiers follow the same table. Rules that the potion system should hold: a reagent's tier may decide which potion category can be brewed and the potion's shelf life and weight; it never decides magnitude above the S-17 caps; no potion works in combat (S-17 rule 1, with only the Smoke flask excepted in 24.4) whatever its reagents, and no reagent tier makes Smoke larger or longer; no reagent of any tier brews a mana potion or heals Soul Damage (S-17 rules 2 and 3); Aether reagents do not exist (below). Potion *quality* (the maker's axis, 26.5) is the potions proposal's to define, and it should not reuse any rarity tier word.

Aether: nothing edible or brewable leaves the Aether (18.7). Aether plants and water crumble at the Rift. There is no Aether reagent, so no potion can ever be an Aether farm's product and Design Law 3 stays clean. See 26.13 for what does leave.

Freshness (18.8) is a third axis on ingredients, separate from both tier and quality. A Sought cut still turns.

### 26.9 Tome Fragments, Tomes and Manuals (5.12, 5.20, S-57)

A Tome is a key to a spell, and a spell's power once learned has nothing to do with how its Tome was found. Tome rarity is only echelon and route:

Echelon 0 and 1 Tomes are Stocked or Found (cheap tomes from mentors, Watch rations and a 3% guard Tome in the bestiary, B-17). Echelon 2 Tomes are Hoarded (dungeon vaults) or Rumored (Risen Ruins). Echelon 3 Tomes are never found whole: they are assembled from fragments (5.20), and each fragment takes the tier of its source: Hoarded from Pressure Peaks and the Bound Archivist (B-19), Sought from Fissures and the Aether Tide (11.13), Rumored from Great events and the Aether. The Tome of Split Focus (5.13) is Hoarded, from high dungeons.

Fragments carry a family (fire, ice, water, lightning, earth, wind, void; C-09) and an origin. Assembling a Tome needs a set number of fragments of one family (tune: 5), from at least 3 distinct sources (tune), mirroring the three-distinct-sources rule of the Suffering route (5.20). A fragment from a Great event counts as its own source. This keeps one Fissure from being the whole route.

Binding. Tomes and Manuals bind on pickup and never trade (S-57). Fragments are the tradable unit (S-57's own suggestion): droppable and tradable under per-slot rules, and they bind the moment they are assembled. A Tome assembled from traded fragments still teaches a spell that starts at Raw and must be trained and ripened by the reader (5.5), so a bought Tome is a bought starting line, not a bought build. **Conflict (17.2):** 17.2 forbids dropping Tomes; it says nothing about fragments. This reads fragments as a separate item kind. If the owner wants fragments bound too, the Social Ecology cost is that a Blade can never help a mage assemble a Calamity.

A Tome's tier never shows on the spell. Once read, the spell's visible form shows its tier of training (5.5, 5.14), and nothing about its source. The Grimoire records the route ("learned from a Tome assembled at the Drowned Stair"), which is a ledger line and nothing more. Lineage marks (5.17) stay skipped at launch, as the doc recommends.

### 26.10 Cosmetics and Collectibles (17.6, 5.22, the collecting proposal)

Cosmetics are where Storied lives freely, because cosmetics carry no power by definition.

Two kinds of cosmetic, kept visibly apart:

Bought cosmetics (17.6): Robux, account-bound, never tradable (S-23). They are always Stocked-tier in look and in name. A bought hearth skin is "a brass pot". It never uses an Aether, event or Drift motif, never carries a place or a finder in its name, and never has the Sought shimmer or the Storied chord. This rule is what keeps "earned" meaning something: a player who sees a crater-glass heraldry knows it was not bought.

Earned cosmetics: heraldry from lineage milestones (5.22), horn weave heraldry bases (B-06), Hearth Fair prizes (11.13), lantern seed hearth fuel (B-15), Watch badges (B-32, a crime trophy that raises heat if seen), Inn decor, Epithet heraldry. These take the tier of their source and keep its name line. A Storied cosmetic (the first clear's banner, a Great event's outcome banner) is slot-bound and inherits through the Heirloom chest rule (26.13).

Collectibles (hooks for the collecting proposal): collectibles use these seven tiers unchanged and declare tier by source row. A collection is knowledge made visible (a bestiary page, a glyph lexicon, a tag catalogue, a ledger of places). It pays in ledger lines, Epithets, heraldry and Inn decor (5.22), and a fixed-set chapter illuminates when complete (25.4), never in stats or XP. A Storied collectible is unique per server block and slot-bound. A collectible's name form (26.4) is the collecting system's display string; it should not invent a second one. Collections show no counts anywhere (25.4, decided); the Seer reads them in words.

### 26.11 Drop Sources and Anti-Farm (1.2, 5.2, 5.6, 11.4, 11.13)

Rarity reuses the budgets the doc already has, and adds no new faucet.

Stocked: an NPC stock list and a price. Infinite by design, learnable, no farm because there is nothing to farm.

Found: a per-kill or per-node roll, capped at 10% (tune) and subject to **drop Familiarity**: each kill of a species or harvest of a node type thins that source's Found rows for that account (tune: 100%, 50%, 25%, then 10%, recovering over 24 real hours), mirroring XP Familiarity (5.2). Stocked rows (hide, ironstone, meat) are exempt, so a smith's supply never dries up; only the rare rows thin. The Seer's line already exists ("you have fought this kind of creature too often").

Hoarded: a fixed budget per site, refilled at the start of each Drift block (11.4), shared by everyone on the server. A vault that was emptied this block is empty for everyone, and the guard (a Pressure Peak beast, a Boss Room) is the gate, not a roll. No per-kill row.

Drifted: a fixed budget per state instance (11.4: "a gold mine holds a set amount before it is mined out"), seeded with the state. When it is spent, the nodes are empty and the rumor goes quiet. Occupancy caps (11.12) stop a player holding the state.

Sought: a fixed budget per site or event that does not grow with the crowd (11.13, 5.6), with per-account diminishing returns across servers for the same event type (11.13: the second 50%, the third 10%, reset after 12 real hours). A Fissure's fragment is one per run (B-30). No Sought row is ever a per-kill roll on a repeatable mob.

Rumored: a fixed budget per world-scale event (a crater holds a set amount of starmetal, 11.13; a Risen Ruin's vault is sealed after its budget is spent), split by risk-weighted contribution (5.6). Aether Tome fragments and trophies are the only Rumored rows in the Aether's Horror tables (26.13).

Storied: a claim key, one per (server, block, deed) or one per lineage. The first claim wins; the server writes the key before it spawns the item (26.17).

No pity timers and no streak counters. They are numbers. Instead, the Long Road rule from catalysts (5.5): no rare depends on a roll alone. Every Sought item has at least one route that is a place and a time rather than a chance: a Fissure that opens on a seed, a Peak that stands in the bones, an event with a rumor. A player who wants starmetal waits for a star and reads the sky, which is exploration, not a lottery.

Exposure applies to drops as to XP (5.2): a mob that did not engage you drops its Found rows at the Stocked level only. Tagging a mob someone else holds pays little in loot as in XP. The disconnected body drops nothing (4.1).

Group fights: one budget, split by risk-weighted contribution (5.6). A Sought drop from an event is assigned to the party and placed by the server as a shared pickup with a short claim window (tune: 60s), and per-slot rules apply to who can take it (S-16).

### 26.12 Economy and Trading (17.1, 17.2, S-22, S-49)

Mana Crystals buy Stocked things. Nothing above Stocked has an NPC price in either direction. NPCs never buy any tier (18.13 for food, extended here to everything), so rarity is never a crystal faucet. **Conflict (W-41):** the enchanters' row "buy rare materials for crystals". Recommended: they appraise for free and buy nothing; if a sink is wanted, they charge crystals to inscribe.

Player trade is the market for Found, Hoarded, Drifted, Sought and Rumored things, under S-22 and per-slot rules (17.2, S-16). The trade window shows the name line and the model, so a buyer reads provenance the same way the finder did. Prices are whatever players agree. Because nothing tradable is power, the market trades breadth and story, which is what the target player collects.

Tradable: glyphs, weapons, armor, cooked food (17.2), plus crystals, materials, ingredients, potions, Mana Batteries (S-49) and Tome fragments (26.9).

Bound: Tomes and Manuals (S-57), Grimoires (17.2), bought cosmetics (S-23), the Heirloom mark (S-22), and Storied items. A Storied item is slot-bound because it is a ledger line made physical, and ledger lines are not for sale (5.22 "Epithets carry no power" and are not traded either). Its finder's name stays on it for life. If the owner would rather let Storied cosmetics trade, the ledger line stays with the finder and the item's name line keeps "found by" unchanged, so the story cannot be bought.

Provenance travels. The origin record (26.17) moves with the item through every trade, so "starmetal from the Thornfell crater, found by Varn" is still that in a stranger's hands. Trades are logged (S-23), and the finder stays in the name.

Bounties and confiscation (12, B-33): a surrendering criminal's droppable items are confiscated, which includes Sought things. Fair Danger holds because surrender is a choice and the alternative is a Life.

### 26.13 Death, the Aether and Lineage (9.1, 9.3, 5.21, 10.10, 23, S-15)

Overworld death (a Life lost): inventory kept, armor Broken (9.1), weapons unchanged (S-62). Rarity is untouched. A Sought blade that goes Broken is still Sought, and repairing it is the same price as any blade of its material (S-11).

Aether death (the wipe): the pack, equipped items and the Inn chest are lost, except one Heirloom (S-15). "The dream keeps it." The ledger does not forget: every Sought, Rumored and Storied find is recorded on the lineage ledger at pickup (26.17), so the Seer can still say "the Varn line found starmetal at Thornfell" to a descendant who holds nothing. Memory survives; the item does not.

Aether escape: the pack is kept. Aether matter crumbles at the Rift (18.7). What leaves the Aether:

Tome fragments (5.20 names the Aether as a fragment source; B-26). They are knowledge, and they bind when assembled.

Horror trophies: a Storied or Rumored cosmetic trophy from a killed Horror (feeds the "Bane of" Epithet, 5.22, B-23). Cosmetic by rule.

Nothing else. **Conflict (B-23, B-26):** the bestiary lists "relic materials (enchanter-grade glyph bases)" among Horror drops. Recommended: no. A top guild at about 90% rescue survival (10.10) would make the Aether a Sought glyph farm, and "dreams do not come back with you" (18.7) is a cleaner rule. If the owner wants a material reward from the Aether, make it a cosmetic base (heraldry, a hearth skin) and keep it Storied. This also reads the prompt's stricter wording of 18.7 ("nothing physical leaves") as the rule, with Tome fragments and trophies as the only exceptions.

Heirloom (23 recommended, S-15): one item marked in the Inn chest passes to the descendant at Broken. This section adds: the Heirloom must be gear, a cosmetic or a collectible. Tomes, fragments, ingredients, reagents and potions cannot be marked, because knowledge passes through the Grimoire and consumables are not memory. An Heirloom gains a generation line in its name ("carried by three of the Varn line"), and on its third generation it becomes Storied if it was not already (tune), which is a cosmetic promotion and nothing else. Its durability is Broken on arrival, so it carries memory, not power, as 23 says.

Descendants and rarity: nothing else passes. Per-slot items are gone (5.21), and the descendant's first Sought find is their own. Remembered catalysts (5.21) may point at the ancestor's Sought sites, which is the right way for a lineage to retrace a find.

### 26.14 Duping, RMT and Server Authority (19.6, S-16, S-23, 20.3)

Because rarity is not power, the prize for duping is small, and that is the first defense. The rest is engineering:

Identity: every non-stackable item has a GUID and a last-holder record (S-16). Sought, Rumored and Storied items also carry an origin record that the server can check against the seeded world (26.17). An item whose origin names a state, event or site that the schedule seed never produced on that server and block is quarantined on profile load for review, never auto-destroyed (the 4.4 philosophy: review signals, not auto-bans).

Storied uniqueness: the claim key is written to a DataStore with a conditional update (or a MemoryStore lock then DataStore) before the item spawns. Two servers racing for "first clear" resolve to one winner; the loser's players get the Sought version and a ledger line that says they were second, which is still a story.

Trades: atomic swap with a journal (S-23), session locking from day one (19.6), a 30-day trade log. Sought, Rumored and Storied movements are flagged in the log for laundering review (S-07).

Spawning: the client never asks for an item. Pickup is a server decision from a server-placed pickup, under Exposure and per-slot checks (26.11, S-16). Budgets are server state keyed to the seed, so a rejoin never refills a state's budget.

Real-money trading: no Robux item is tradable and nothing tradable is sold for Robux (S-23). Storied items are bound (26.12). What is left to sell for real money is odd glyph trades, odd weapon properties and starmetal, which are keys and sidegrades with Stocked alternatives for every combat function (the Stocked test, 26.1). RMT is therefore a cosmetic and convenience market at worst, and the trade log and rate limits (S-23) cover it. Monitor Sought-item trade velocity per account pair as a review signal.

Exploit checklist additions (20.3): claim a pickup the server did not place; pick up a Sought item from a state the server is not in; race two servers for one claim key; trade a Storied item; drop a Sought item to another slot of one account; rejoin to refill a Drifted budget; forge an origin record in a profile.

### 26.15 Mobile, Console and Session Length (2.2, 11.12, 18.15)

Parity: every rarity signal is identical across platforms. Models, name lines and pickup sounds are gameplay-relevant and never stripped by dressing density (11.12: nothing gameplay-relevant removed on mobile). The Storied aura particle lives on the telegraph-exempt layer (C-10c).

Sound first: the pickup sound is the primary signal, so a find registers with the screen in a pocket (18.15).

Session fit: a Drifted find is a 15-minute session's gain by design (Local events are sized for it, 11.13). A Sought find is a session's goal with a rumor behind it (5.23 near rumors). A Storied find is the kind of thing a short session hears about at the Inn and plans a longer session around.

Touch: the inventory groups by kind and sorts by time found. No rarity filter is needed because rarity is not a sort key; the name line is what the thumb reads.

### 26.16 Integration Points

See 1.1 and 1.2: rarity is knowledge, tools and story, never stats; variety over volume governs every drop row; overworld rarity is learnable in grammar, Aether rarity is only fragments and trophies.

See 4.11: no tier changes a window, a floor, a band, a cap, or stacks damage. Glyph magnitudes share one band across tiers.

See 5.2 and 5.6: drop Familiarity and Exposure reuse the XP terms; group drops split one budget.

See 5.5: the Long Road rule applies to rare finds; no rare depends on a roll alone.

See 5.7 (S-12, S-44): gear counts in the score by class and glyph trade, at maximum durability; rarity adds nothing beyond that.

See 5.20 and 5.12 (S-57): Tomes bind on pickup; fragments are the tradable unit; Echelon 3 needs fragments from three sources.

See 5.21, 5.22, 9.3 and 23: ledger lines for Sought, Rumored and Storied finds; the Heirloom rule; Epithets and heraldry as Storied cosmetics.

See 6.1 (S-21): glyph rules 1 to 7 hold at every tier; odd trades are the Sought breadth.

See 7.2, 7.3 and 17.3 (S-11, S-19): material sets durability and weight inside a capped band; every material trades; spirit-forging is a key.

See 11.4, 11.12 and 11.13: Hoarded, Drifted, Sought and Rumored budgets are the existing state and event budgets; per-account event diminishing returns apply to Sought and Rumored drops.

See 15.2: Sought, Rumored and Storied items shimmer through Mana Vision.

See 16.3: no number, border, star or label; tiers are spoken and seen.

See 17.2, 17.6 (S-22, S-23, S-49): the droppable and tradable lists, bought cosmetics bound and never Storied-looking.

See 18.5, 18.7, 18.9 and 18.10: cooking bands are made quality; ingredient tiers are tag sets and windows; Meal caps stand at every tier.

See S-17 and the potions proposal: reagent tiers pick category, shelf life and weight; never magnitude; no Aether reagents.

See the collecting proposal (25.5, 25.13): seven tiers by source row; every origin carries a witness class (Standing, Drifting, Sealed) and a scope (server, world, lineage); rarity owns the tell vocabulary and collecting mirrors it in paper and ink; ink tiers and rarity tiers share no words; Storied unique per scope and slot-bound; completion pays in ledger and cosmetics.

See the bestiary (B-numbers): drop rows should carry a `tier` and, for Found rows, a chance at or under 10%.

See 20.3 and 19.6: origin verification, claim keys, journaled trades.

### 26.17 Technical Notes (PROPOSED)

Tier is data on the source, never on the item definition. An item definition (`ironstone_sword`, `tidewheat`, `glyph_source`) has no tier. The row that spawns it does:

Spawn-table row: `{ item_id, tier, chance (Found only, max 0.10), budget (Hoarded, Drifted, Sought and Rumored: count per site, state instance or event instance), claim_key_template (Storied) }`.

NPC stock row: `{ item_id, tier: Stocked, price }`.

Item instance (extends S-16): `{ guid, item_id, tier, origin, maker, quality_band (made items), durability, bound: none | slot | account, story: [ledger_ref, ...] (max 3), last_holder }`.

Origin record: `{ region_id, cell_id, source_kind: stock | mob | node | state | event | fissure | peak | aether | claim, source_id, state_or_event_id, block_index, schedule_seed_hash, witness_class: standing | drifting | sealed, scope: server | world | lineage, found_at (real timestamp), finder: { account_id, slot_id, display_name } }`. About 130 bytes. Stocked items store only `source_kind`, `region_id` and the two defaults. `witness_class` is set by the source kind (26.3 table) and flips from `drifting` to `sealed` lazily when the server reads an item whose state has ended on a per-server seed; collecting reads the same field for its marks (25.5).

Name line: generated server-side from `item_id`, `tier`, `origin` and `maker` through a per-language template, cached on the instance, regenerated when `story` changes. Players never type it.

Origin verification: for `state` and `event` kinds, the server recomputes `hash(schedule seed, cell, block)` (11.12) and checks the state or event could spawn `item_id`. For `fissure`, `peak` and `claim` kinds, it checks the site exists in the region's bones or the claim key is held by this guid. Run at pickup (reject) and on profile load (quarantine flag, review queue).

Claim keys: DataStore key `storied:server:{server_id}:{block}:{deed_id}` for server-scoped deeds (a first clear), `storied:world:{block}:{deed_id}` for world-scoped deeds (a Great event outcome, written through the same MemoryStore tally the event director already uses, 11.13), or `storied:lineage:{slot_id}:{deed_id}` for lineage deeds, written with an atomic conditional update before spawn. The key's scope is the origin record's `scope`. Keys expire with the block (11.13 marks expire) except lineage keys.

Drop Familiarity: a per-account table `{ species_or_node_id: { count, last_ts } }` with decay, stored alongside the XP Familiarity table (5.2), a few hundred bytes.

Ledger: Sought, Rumored and Storied pickups append `{ item_id, origin, found_at }` to the lineage ledger (9.3) with the next normal save. The ledger keeps the last 200 entries (tune) per lineage.

Budgets: Hoarded, Drifted, Sought and Rumored budgets are server state keyed to `{ state_or_event_id, block_index }`, counted down on spawn, never on pickup, so a dropped and despawned item (S-16: 5 minutes) is spent. Great event budgets are per server; the Great tally itself stays in MemoryStore (11.13).

Mana Vision shimmer: a client-side effect driven by the replicated `tier` field (Sought, Rumored or Storied only). The field is display data; no decision reads it on the client.

Validation at build time: every spawn row with `tier: Sought` or `tier: Rumored` must name a site or event that has a rumor source (11.8, 11.13); every `tier: Found` row's chance is at or under the cap; every odd-trade glyph has both skill_notes fields (4.11 Law 6); every material has a `pays` field (26.1). A build that fails any of these does not ship, the same discipline as the `pve_sources` check in the bestiary.

### 26.18 Open Decisions and Recommended Defaults

Colour tiers. Recommended: none, ever. If playtests show finds going unnoticed on phones, add strength to the pickup sound and the Mana Vision shimmer before adding any border.

Tier names. DECIDED: seven tiers. Recommended names: Stocked, Found, Hoarded, Drifted, Sought, Rumored, Storied. They describe how a thing is come by and avoid every quality-band, training-tier and collecting-ink word ("Marked" is collecting's middle ink, 25.4, so rarity does not use it; "Guarded" was rejected because Guard is the physical block, 4.12).

Odd weapon properties. DECIDED: yes, one per Sought or Rumored weapon, seeded by source, under every glyph rule and the telegraph law (26.7). Ship two common properties with the Blade at first (Hooked and Light), and Rumored properties with Falling Star.

Witness class on the item versus on the mark. Recommended: the origin record carries it (26.17) and collecting reads it, so the two systems cannot disagree about whether a thing comes back.

Tome fragments tradable. Recommended: yes, bound on assembly. Tomes and Manuals stay bound on pickup (S-57).

Relic materials from the Aether. Recommended: no. Only Tome fragments and cosmetic Horror trophies leave the Aether.

Storied items tradable. Recommended: no, slot-bound. Fallback: tradable with the finder's name fixed in the name line.

Drop Familiarity. Recommended: yes, on Found rows only; Stocked rows exempt.

Found per-kill chance cap. Recommended: 10%. Anything rarer than that must become a budgeted Sought row with a place and a rumor.

NPCs buying rare materials (W-41). Recommended: no. Appraisal is free; nothing is bought.

Heirloom eligibility. Recommended: gear, cosmetics and collectibles only; a third-generation Heirloom becomes Storied.

Bought cosmetics and earned looks. Recommended: bought cosmetics never use Aether, event or Drift motifs and never carry a place or finder; this should be written into 17.6.

Crafted item tier. Recommended: the highest tier among inputs, never raised by the maker.

Durability ceiling by material. Recommended: 1.6x Ironstone, on the Law 2 curve, with every material paying weight or a property.

Odd-trade glyphs at launch. Recommended: two (Lantern and Curl), shipped with the glyph system, which 21.2 defers. Hush (a silent cast) was cut: it removed a telegraph's sound tier, which the telegraph law forbids.

Group Sought drops. Recommended: a shared server-placed pickup with a 60-second claim window and per-slot checks.

### 26.19 Minimum Viable Slice

Build order within the production plan (21.2): the tier field, origin record and name line land with the data layer, because every later system writes them. Stocked and Found ship with the overworld slice. Drifted ships with the Drift. Sought ships with Bleed Zones and Fissures. Storied ships with Regional events.

Slice contents:

The `tier` field on every spawn row and stock row, and the origin record on every item instance, from the data-layer milestone.

Server-generated name lines for Stocked and Found, with a region name.

Two signals: the pickup sound per tier, and one appraiser line per kind (the smith reads material; the Inn cook reads tags).

One Found material with a trade (Deepsilver, Dead Zone only, heavier), one Found glyph material, drop Familiarity on their rows, the 10% chance cap.

Origin verification at pickup and on profile load.

Deferred: Hoarded, Drifted, Sought and Rumored rows (with their systems), odd weapon properties (with the Blade), odd-trade glyphs (with glyphs), Storied claim keys (with events), the Mana Vision shimmer, Heirloom lines, Tome fragment trading, collectibles.

Success test for the slice: a playtester who finds a Found item tells another player where they found it before they say what it does. If they lead with what it does, the name line and the appraiser lines need work before any Sought row is added.

---

## Conflicts and gaps found in the doc and proposals (summary)

| Where | Type | Summary |
|---|---|---|
| 17.3, 5.12, 5.13, 7.3, 18.7 | Gap | "Rare" is used throughout as a frequency with no system behind it. This section defines it. |
| 18.7 vs 5.20 vs B-23, B-26 | Conflict | 18.7 says nothing edible leaves the Aether; 5.20 lets Tome fragments out; the bestiary adds relic glyph materials. Ruling here: fragments and cosmetic trophies only. |
| 17.2 | Gap | Tome fragments are not on the droppable list and are not Tomes. Read as a separate, tradable kind (with S-57). |
| W-41 | Conflict | Enchanters "buy rare materials for crystals" against the no-NPC-faucet rule (18.13). Recommended: appraise free, buy nothing. |
| 23 Heirloom | Gap | "Durability reset to Broken" has no meaning for non-durable items. Ruling: Heirlooms are gear, cosmetics or collectibles. |
| 17.6 | Gap | Nothing stops a bought cosmetic looking like an earned one. Rule added: bought cosmetics never use Aether, event or Drift motifs or carry a finder. |
| 5.7 (S-12, S-44) | Note | Material durability counts in the score only through class and max durability. Rarer material therefore nudges Threat down slightly. Accepted; the band is capped at 1.6x. |
| 6.1 vs 4.11 Law 6 | Inherited | Expansion's "less speed" read as cast speed (S-45). Rarity never touches travel speed either. |
| 16.3 (S-13) | Assumption | Stack counts on the inventory and collection screens are counts of things, not numbers on the HUD. |
| 11.13 | Assumption | Per-account event diminishing returns apply to Sought drops, not only XP. |
| 25.4 (collecting) | Naming | Collecting's middle ink is "Marked". This proposal's fourth tier was renamed Sought to keep one name, one meaning (Appendix C). |

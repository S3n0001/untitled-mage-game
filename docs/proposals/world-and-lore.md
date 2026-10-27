MERGED into game-design.txt v3.3 on 2026-10-27; the doc is now the source of truth.
# World and Lore Proposal (v0.3)

For: Untitled Mage Game, Game Design Document v3.1 (`docs/game-design.txt`).
Scope: the creative world layer only. Nothing here changes a mechanic. Where lore and a mechanic could rub, the rub is listed in Section 7, not smoothed over.

How to read this: every proposal is numbered (W-01, W-02...) so items can be accepted or rejected one at a time. Set pieces are numbered S-01 to S-15 inside W-31. Conflicts with the doc are C-xx. Open questions are Q-xx. Section numbers in parentheses point at the design doc.

Changes from v0.2 (reconciled with doc v3.1):
- Doc renames applied throughout (Appendix C): the Steel Vow, the Bare Vow, Still Aura, Renown, Rites, Calamities, mana stain, Wellstone, Deadcalm, the Parting, the Aether layout names (the Remnant and the rest), "shard" for world state.
- This proposal's own names audited against the Appendix C rules; renames are logged in the table below. The archipelago is now **the Holdfast**; the recommended title follows it (W-51).
- Rules reconciled: per-shard Drift schedules on named shards (11.4), local occupancy extension (11.4, 11.12), Fissure failure (11.6), rescuer rules (10.11), vowed Pressure checked against the body (11.3). See W-04, W-10, W-19, W-52, A-06.

Changes from v0.1: W-49 and W-50 adopt the telegraph language owned by `combat-numbers.md` C-10 and keep only the world-side rules. Aldric and the Varn line are left to the design doc as player-lineage examples. C-02, C-03 and C-05 are resolved.

### Rename log (v0.3, this proposal's own names)

| Old (v0.2) | New (v0.3) | Reason under Appendix C |
|---|---|---|
| the Wake (archipelago) | the Holdfast | "Wake" reads as borrowed (Alan Wake) and is a single unsearchable word; Holdfast is two plain words joined and says what the land is: held fast |
| Caldermere (region) | Longmere | "Calder" is a proper name, not a plain word; a long lake is a long mere |
| the Calder (leyline) | the Mereline | two plain words joined; one name, one meaning (the leyline under the mere) |
| Greywick (region) | Ashwick | "Grey" collides with Grey Health (3.2) and The Grey Marble (10.4); the island is ash |
| the Grey (Dead Zone) | the Ash | same collision; also ties to Ash Loaf (18.6), the Dead Zone ration |
| the Still Room | the Deaf Room | "Still" now names Still Aura (7.3); the lore already calls dead stone "deaf" |
| Ambit (city) | Tollstead | "Ambit" is Latinate, not a word a cook says; a toll is a count, a stead is a place |
| Ferrow (town) | Firmbank | "Ferrow" is an invented word; the town stands on the one firm bank |
| Harrow Hall | Steelhall | "Harrow" describes nothing about a sword hall; the Steel Vow is sworn here |
| Garn Ashwick (smith) | Garn Cole | the island took the name |
| Odo Fell (Marshal) | Odo Reed | "Fell" collided with Thornfell |
| Volition, The Held (title options) | dropped | Latinate / opaque; see W-51 |

Kept after audit (plain, one meaning each): Highwater, Wick, Thornfell, Lanternmarsh, the Pin, the Weirs, the Drowned Stair, the Glassfield, the Drinking Stones, the Salt Road, the Counting Stair, the Quiet Gallery, the Wraith Terraces, the Lantern Field, the Standing Stones, the Outer Shoals, the Gallows Alder; the Tally, the Kindled, the Struck, the Plainsteel, the Held, the Spent; Readers, Trackers, the lamplighter, the shoal hermit; Pell, the Ostrey line, Holt, Teague, Weir.

---

## 0. One-paragraph pitch

The Holdfast is a cold archipelago held in shape by the will of the people who live on it. Where people stay, the land stays. Where nobody stays, it forgets itself and tries other shapes (the Drift). Mana is will: a mage spends intention the way a body spends breath, and a mage with no will left is Hollow. Die twice and the hearth you rent a bed from pulls you back, cracked. Die a third time and there is nothing left to pull: your will goes where loose will goes, into the dream the world has when no one is holding it (the Aether). What comes back is the only part of you dense enough for a dream to choke on: your habits, written in a book (the Grimoire). Four schools disagree about what the dream is. None of them is right enough to be safe.

---

## 1. Setting and core lore

**W-01. Mana is will made spendable.**
The world's substance answers intention, and mana is the measure of how much a person can mean at once. This is why mana is stamina and not just ammunition (3.1): dashing is wanting to be elsewhere, blocking is refusing, flying is insisting. In combat, will is being spent faster than it can be gathered, so regeneration is a trickle; hesitating is not resting, so the stalling rule halts it. Out of combat, will returns quickly because nothing is contesting it. Capacity grows by stretching will to its edge (Exhaustion Training). Pushing past the edge through Overcharge tears the circuit (Mana Burn, Trauma; reaching exactly zero is Hollow, not Burn, 3.1 v3.1).

**W-02. Hollow is the absence of intention, not of fuel.**
At 0 mana a mage cannot refuse (no Block), cannot insist on being elsewhere (no Dash), and walks like someone who has forgotten why they stood up (reduced speed). Overcharge spends the body in place of the will, which is why it costs Health and leaves Soul Damage, and why Soul Damage heals only in a bed you trust (a secure bed: a rented Inn bed or a guild hearth, 17.4 v3.1): you cannot hold yourself together and rest at the same time (3.2). The in-world phrase for 0 mana is simply "hollow", said the way sailors say "aground".

**W-03. Usage is Mastery: the circuit is a path worn into stone.**
Nobody in the Holdfast believes in talent. A spell is a habit the will has learned, and habits deepen where they are repeated (5.3) and harden around what they neglect (Rigidity, 5.4). The Seer's word for a mage's two strongest families is their grain, and "going against the grain" is an insult that means working hard to stay mediocre. This is the Frieren-like sensibility the doc asks for: magic is a discipline of logic and repetition, and nobody is special until they have done the work.

**W-04. The Holdfast is held, not fixed.**
Land that is lived on holds its shape because many wills agree on what it is. Anchor towns never drift (11.12) because people never leave them. Wild land is held by nobody, so it tries other shapes over hours, days or weeks (the Drift, 11.4). One traveller standing in a wild cell holds it for a little while, which is the in-world reading of the occupancy rule and its cap (11.12): one will can hold a place for about half an hour before it slips. The holding is only a pretence the land keeps up while it is watched. Underneath, the Drift goes on (occupancy extension is local, 11.4 v3.1), so when the traveller leaves, or the cap ends, the cell does not resume where it paused: it decays and goes straight to whatever it would have become by now. Nobody can keep a good state by standing in it. The decay tells before a shift (flickering mana, animals leaving, colour fading) are the land loosening its grip. The mana stain left behind is what agreement looks like after it ends; alchemists gather it while it lasts (24.7).

**W-05. The Aether is the dream the world has when no one is holding it.**
It is not a place under the sea or above the sky; the Seer's line is "it is not a where". It is unanchored will with no body to settle in. That is why it has no leylines or Dead Zones (10.1 recommended default: will there has no flow and no deaf stone), why it has weather (turbulence of loose will, including Mana Storms), why no two visits share a layout (a dream is never the same twice), and why it is unlearnable in shape but fixed in grammar (10.13): the dream borrows the waking world's rules for hazards because it has no rules of its own.

**W-06. Why the third death takes you there (Soul Fracture, 9.1).**
A soul is held in a body the way land is held by a town: by agreement. Death breaks the agreement. The first two times, the hearth you have promised to return to (your rented Inn bed, 17.4) pulls you back, and the soul reknits with a crack. After the third death there is not enough uncracked soul for a hearth to hold, and the will goes where loose will goes: into the dream. Lives return through Major breakthroughs (5.25) because a will that grows a new shape knits its own cracks. A character who tears their way out of the Aether comes back with one Life because the tearing itself was a breakthrough (23).

**W-07. Inns are hearths that have never gone out.**
Every Inn is built around a fire that was lit when the town was founded and has been tended since. Renting a bed is a promise to return, paid in crystallised will (Mana Crystals, W-09). The promise is what pulls a cracked soul back to that bed and nowhere else. Eviction (17.4) lapses the promise, and an unpromised soul washes up wherever the sea leaves it: the Outer Shoals. A new character wakes at a random Inn because a new will has not promised anything yet; the hearth that was lit when you first opened your eyes is the one that holds you. Inn cooks are not staff. They are the people who keep the fire, which is why they are also the first mentors (18.9).

**W-08. The Grimoire is what the dream could not digest.**
When a will dissolves in the Aether, the loose parts go into the dream. The dense parts, the habits worn deepest, cannot be dreamed away. They fall back to the hearth the will was promised to and set into a book. This is why the Grimoire spawns at the Inn and nowhere else (9.3), why it is character-bound, why it holds only pages the ancestor brought to Honed or beyond (5.21; cantrips carry at any tier, because a cantrip is too small a habit to dissolve), and why reading it accelerates relearning without teaching anything instantly: a descendant inherits the shape of a habit, not the habit. Faded discovery marks are places the ancestor held strongly enough to remember, which the Drift may since have let go of (9.3). A Sacrifice sets more of the will into the page (the Grimoire's Sacrifice gain, 10.12) because a will spent entirely on purpose is the densest thing a person can be. The Kindled (W-33) say: "Those who die for others burn brightest in memory."

**W-09. Mana Crystals are set will.**
When a creature with will dies, a little of it sets, like sap. Crystals buy repairs, beds and staples (17.1) and nothing else, because set will can be traded but cannot be unset into a living circuit. Nobody in the Holdfast would try to buy power with crystals, in the way nobody would try to eat a coin. This is the in-world side of Design Law 6.

**W-10. Rifts are tears, Trials are questions, Fissures are thin places.**
A Rift is a place where enough will was spent at once to tear the dream, by a Sacrifice (10.12), a Rite (4.7) or the dream's own old scars. Natural Rifts in the Aether are tears that earlier dreamers made getting out, slowly healing; they hum because the dream is knitting (10.13 grammar). A Trial is the dream testing whether a will is still coherent enough to deserve a body. A Fissure (11.6) is a tear too thin to fall through but wide enough to look into: the overworld's lesson in the Aether's grammar. A thin place cannot keep you. When a Fissure run fails, the dream spits the dreamer back out emptied, Hollow and shaking (Trauma), with nothing in their hands (11.6 v3.1). It gives a tell first, and only someone who stays past the tell and dies there loses a Life, because by then they chose to.

Rescue (10.11 v3.1): a Rift opened by ritual is how a rescue party gets in. The stranded must answer the party's flare from inside the dream; the dream will not open for someone who is not calling. Rescuers enter awake and by their own will, so they keep their cracks exactly as they were, and tearing their way out again is not growth for them: only the one who fell learns anything from leaving. Only people who have fought at your side can follow you in. Sharing a meal makes someone worth dying for (Sacrifice eligibility, 18.13), but not someone who knows the shape of your fighting well enough to find you in a dream.

**W-11. Bleed Zones are where the world has been let go of.**
Near ruins and Rifts the land was once held tightly and then abandoned, and the dream presses on the thin part. Aether rules leak (11.5): staying still draws things that have never met you, flora lies. The marsh people call a Bleed Zone "thin ground". Unlike the Aether, thin ground is still the waking world, so its lies can be learned (Foraging, 3.3), which is the in-world face of Design Law 3.

**W-12. The Held and their wreck.**
Long ago the people now called the Held tried to hold the whole Holdfast at once, with Rites above the echelons. Land held too tightly cracks under its own certainty: that is a Pressure zone (11.3), will so dense and so sure that a smaller will is crushed by it. The Held drained one island to still it forever (Ashwick's Dead Zone, W-18) and pinned another under a Rite that never finished (Thornfell's summit, W-19). Their constructs still stand (Golems: will written into stone, which is why they reflect will aimed at them and why only their exposed cores take a spell, 14). Their dead did not go into the dream, because the Held had anchored even their own souls, so they linger as Phantoms and Wraiths with no body to hit (14). The Held appear only as fragments: Tome fragments, sealed grain jars, ruin states, the Remnant layout in the Aether (10.4), which is what the dream remembers of them. No single NPC knows the whole story and the proposal does not write it; fragments are enough.

**W-13. Elements are grammars of intent, not substances.**
The seven elements already implied by the doc are kept and no new one is added: fire (want it gone), ice (want it still), water (want it to yield), lightning (want it now), earth (want it to hold), wind (want it moved), void (want it unmade). Void is the dream's own grammar, which is why void mist drains mana (10.5): unmaking is what loose will does. Opposed-element modifiers (4.8) are opposed intentions, which is why they are small: intention does not do arithmetic. Aether Horrors have no elemental weaknesses because they are not made of anything; they wear elements (10.1).

**W-14. The Seer is an order of the Spent.**
A Seer is a mage who burned their circuit to the end, usually in a Mana Burn they should not have survived, and came out of it with no mana of their own and the ability to see everyone else's. They cannot cast, so they cannot fight, so towns keep them. They read circuits in qualitative bands (5.14), read Constitution from the body (3.5), read the lineage ledger (9.3), and refuse, as an order, to say what the Aether is: "I do not read dreams. I read what they leave." Every Anchor town has one; they trained together, which is why they share a voice. They say "the Seer" of each other and of themselves, as a title rather than a name.

---

## 2. The archipelago: the Holdfast

**W-15. Shape.**
Four large island regions on one streamed map (11.12), each about 2,000 by 2,000 studs, divided into 400 by 400 Drift cells, crossed by sea channels (boat, swim, flight). A scatter of small outer shoals, the eviction islands, lies beyond the channels (17.4). The Holdfast sits under a long overcast; the sky clears only for Calamity telegraphs and events (W-49). The four islands, clockwise: Longmere (leyline), Ashwick (Dead Zone), Thornfell (Pressure), Lanternmarsh (thin ground). Sailors named it: a holdfast is what an anchor bites into, and what the land is, held fast by the people on it.

**W-16. Regional template, applied.**
Each region follows 11.11: one mana-zone identity, one school of thought, one bestiary threat, one survival challenge, one secret tied to the Aether. Each has at least one Anchor cell (town, Inn, Seer, trainers, reliable PvE), fixed bones (coast, mountains, leylines, dungeon doors, far landmarks) and 2 to 4 hand-built states per wild cell.

### Longmere (leyline)

**W-17. Longmere.**
- Mana zone: the Mereline, a leyline that runs the length of a long cold lake and out through its weirs into the sea. High density: fast regen, larger spells, the Holdfast's PvP ground (11.3). Leyline strength varies by Drift state, never its position.
- Culture: the Kindled, the burst-and-overcharge school (W-33). Anchor town: **Highwater**, a stone town built across the weirs where the Mereline leaves the lake. Dueling on the weir platforms is lawful sport; law is otherwise light.
- Threat: Mana Beasts. Wolves and bears that drink the leyline go glassy-eyed and absorb spells (14). They supply Resonant meat (18.7), which must be seared on the leyline flame or it bleeds out as bitter steam (18.6).
- Survival challenge: thirst in a land of water. Live water (leyline water) burns the throat and poisons unboiled; drinkable springs are few and known. The novice's first lesson in Longmere is that a lake is not a drink. Leyline produce is potent and spoils fast (18.8), so nothing keeps.
- Aether secret: the Mereline rises from a drowned Rift under the lake, a scar the Held never closed. In one Drift state the lake falls and a stair appears on the south shore (S-02). The Kindled know and do not say; the Seer says only that the lake "hums at the bottom".
- Far landmarks (fixed bones): the Weir Towers of Highwater (two lit towers, visible across the lake); the Glassfield shine on the eastern ridge (S-03); the Mereline's glow, a dim desaturated teal line under the water at night (never telegraph blue, W-49.1).

### Ashwick (Dead Zone)

**W-18. Ashwick.**
- Mana zone: the Ash, a Dead Zone covering most of the island (11.3). Zero regeneration. Mages carry Wellstones; vowed characters are at home (7.3). The Ash never drifts in extent, because land with no will in it has nothing to change with; its Drift states change dressing and reveals, never the deafness.
- Culture: the Plainsteel, a sword lineage that treats mana as a crutch (W-35). Anchor town: **Wick**, a low town of grey stone and smoke on the only living strip of coast, where Steelhall stands (S-04). This is where the Steel Vow is sworn and where Blade masters teach (5.19.6).
- Threat: Golems and Constructs, the Drinking Stones (S-05) and their wardens, which reflect spells and punish untrained fists (14). Phantoms appear in the Ash's fog states, half-manifest (W-18 secret).
- Survival challenge: cold and hunger. Ash winds and cold fronts cross the Ash; Dead Zone produce is bland but keeps (18.8), so Ashwick eats Ash Loaf and smoked meat and walks far between meals. Mana-kindled fires do not light here; only fuel burns (18.3).
- Aether secret: the Held drained Ashwick on purpose, through the Drinking Stones, to make one island the dream could never touch. They half succeeded. No Fissure has ever opened in the Ash, and a Phantom driven into it must half-manifest, because without ambient will to ride it has to borrow substance from itself (5.19.8, the Spirit Palm Long Road). At the Ash's heart is the Deaf Room (S-06), the one place in the Holdfast where the Seer cannot read anyone.
- Far landmarks: the Drinking Stones, seven black pillars on the central plateau; Steelhall's single lamp on the sea cliff; the smoke of Wick.

### Thornfell (Pressure)

**W-19. Thornfell.**
- Mana zone: Pressure. The island is a mountain, and its passes and terraces carry echelon ratings that rise toward the summit (11.3, 4.7). A mage below the rating is crushed: mana and health drain fast. A vowed character is measured against their body instead of their circuit (the Body threshold, 5.19.6, 11.3 v3.1) and takes pressure at half rate below it; the Plainsteel say the mountain "weighs the hand, not the hum". Pressure Peak beasts and the rarest cuts live high (18.7).
- Culture: the Tally, the efficiency-and-suppression school (W-32). Anchor town: **Tollstead**, a terraced city on the lower slopes, every lantern counted, every aura kept low. Tollstead has the Holdfast's strictest law and best Readers and Marshals (W-39). Enchanters work here (W-41).
- Threat: Phantoms and Wraiths, the Held's anchored dead, on the Wraith Terraces (S-11). Immune to steel and fists (14); the Tally hunt them with thrift and Classic Mages learn to zone here.
- Survival challenge: altitude. Dry air and thin cold (thirst and cold fronts), flight that becomes lethal within a couple of hundred studs of the slope (11.10), and passes that close in a Great Front (11.13). The Tally's rule for the mountain: "carry water, carry nothing else".
- Aether secret: the summit, the Pin (S-09), is a Pressure zone rated at the Rites: a Held Rite that was never finished, still pinning a Rift shut under the weight of its own certainty. It is the solo Rite Trial site (5.20). Nobody in Tollstead will say what is under the Pin; the Tally believe that unfinished will is the debt the whole Holdfast is paying.
- Far landmarks: the Pin, a summit that is always under a lid of cloud shaped like a plate; the Counting Stair of Tollstead, a line of lanterns climbing the slope at night; the Quiet Gallery's mouth, a dark arch on the north face.

### Lanternmarsh (thin ground)

**W-20. Lanternmarsh.**
- Mana zone identity: none of the three 11.3 zones dominates. The marsh is the Holdfast's Mana Storm biome (10.6, "also planned for rare overworld biomes") and carries the most Bleed Zone states and Fissure sites of any region (11.5, 11.6). Its identity is thin ground. See C-01 for the template bend.
- Culture: the Struck, the hermit order of suffering (W-34). Anchor town: **Firmbank**, a stilt town on the one firm bank, where the Inn's cook Pell teaches Marsh Stew (18.6). The Struck keep no hall; their Standing Stones (S-14) are outside town.
- Threat: Volatile Flora (slimes and acid gels, 14), deceptive flora (the poison source, 18.14), and, in Bleed states and during an Aether Tide, lighter Horrors (11.13). Spellcaster mobs are common here, which the Struck consider a mercy (5.12).
- Survival challenge: hunger and poison. Everything looks edible. Foraging is the marsh's real trade (3.3), and the flood season (a 1 to 2 week Drift state, 11.7) splits the lowland into islands and brings Tidewheat (18.6).
- Aether secret: the lanterns. On some nights lights hang over the western fen (the doc's own rumor, 11.8). They are Fissures seen from a distance: thin places lit from the other side. The Struck believe someone in the dream is trying to find the way back. The Seer says the lights are "the dream looking out". Nobody who follows them without reading the grammar first comes to supper (S-13).
- Far landmarks: Firmbank's stilt lamps; the Lantern Field's lights on fissure nights; a single dead tree, the Gallows Alder, on the central rise, visible from any point in the marsh and never drifting.

### Example Drift cells

**W-21. Longmere cell C-7, "South Shore".** Bones: the lake edge, a stone jetty, the ridge road. States: (a) reedbank grassland, default, game and grain; (b) low water: the lake falls, the Drowned Stair appears (S-02), the cell becomes a Bleed Zone with a Fissure site at the stair foot, 12 hours to 2 days; (c) orchard ruin: a Held orchard rises through the reeds, sealed grain jars and aged honey, Golem warden, up to 2 weeks; (d) frozen: a cold front holds the shore, lake ice walkable to the island in the lake, snow-front ice for Cold-Front Broth (18.6), Mana Beasts cross the ice to the town's edge.

**W-22. Ashwick cell G-3, "Ash Downs".** Bones: the plateau edge, the Salt Road's cairns. States: (a) ash heath, default, sparse game, cairns to follow; (b) salt flat: after a rain state the ash washes to white salt, sea salt harvest, no cover, Marshals' hunting ground for the wanted; (c) construct yard: a Held yard rises with inert Golems in rows and one that is not inert, and a flat stone with two handprints worn into it (a Bare Vow shrine, W-36), 1 to 3 days; (d) grey fog: visibility falls, Phantoms half-manifest and can be fought by hand, the Spirit Palm Long Road site (5.19.8), 30 minutes to a few hours.

**W-23. Lanternmarsh cell L-5, "West Fen".** Bones: the Gallows Alder on the rise, the causeway. States: (a) fen, default, forage and slimes; (b) flooded: the lowland is islands, Tidewheat on the flats for a Roaring-flame Sear (18.6), boats or flight between islands, vowed characters wade the marked shallows; (c) thin ground: a Bleed Zone with the lanterns visible from Firmbank, a Fissure under the Alder, exploration pressure and deceptive flora, 12 hours to a day; (d) drought: cracked mud, a buried Held road surfaces and leads to a Tome fragment cache, wells dry, shallow-well Constitutions feel it first (3.5, 11.13).

**W-24. Through-routes and parity.** Every example state keeps its cell-edge entries walkable (11.12). Flooded and low-water states mark shallows and climbable stone for vowed characters (flight and climb parity, 11.12). No state puts a hazard within 40 studs of a through-route or Firmbank's, Highwater's, Wick's or Tollstead's edge.

### Landmarks visible from afar

**W-25. Landmark rule.** Each region has three fixed landmarks on its bones that read as silhouettes from anywhere in the region and as imposters from the sea (11.12 LOD): one lit (a tower or lamp), one tall (a stone or tree), one strange (a shine, a lid of cloud, lights over water). The lit one is always an Anchor, so a lost player can always walk toward a light and find a bed. Listed per region above.

**W-26. No markers.** None of these landmarks is on a map, because there is no map (11.8). Rumors refer to them by name, and the names are taught by Inn cooks in the first ten minutes ("the lamp on the cliff is Steelhall; walk toward it if you are lost").

**W-27. Sea channels and ferries.** The channels between islands are fixed bones. Each Anchor town has a ferry pier; ferries are NPC boats on a short loop (a few minutes' crossing), free, and the in-world reason strangers end up sitting together (a ferry is a rumor source, W-44). Swimming and flight remain valid; flight over a channel is a mana puzzle (11.8) with no safe landing midway, which is the point.

**W-28. One ruin kit, one people.** Every ruin state across all four regions uses the same Held kit (11.4 "reuse the same ruin kits across regions"): the same black stone, the same socket shapes, the same sealed jars. Players learn to recognise Held work anywhere, which makes the Aether's Remnant layout (10.4) land as recognition rather than new noise.

**W-29. Naming convention.** Place names follow Appendix C: short, plain, English-rooted and sailor-given, named for what the place is or does (Highwater, Wick, Tollstead, Firmbank, the Pin, the Ash, the Mereline). One short word, or two plain words joined. No apostrophes, no invented languages, no names that need a glossary, no hype words, no tech words, nothing borrowed from another game or tabletop. Faction names are plain nouns or participles (the Tally, the Kindled, the Struck, the Plainsteel). A word that names a mechanic is never reused for a place (so no "Still", "Grey", "Steady" or "Drift" in a place name). This keeps the tone quiet and makes rumors readable at a glance on mobile.

**W-30. Weather is regional character, not random.** Each island has a default weather lean that its fronts move against (11.7): Longmere rain and clear spells, Ashwick ash wind and cold, Thornfell thin cold and sudden cloud, Lanternmarsh fog and Mana Storms. A front out of character for an island (snow on the marsh, clear sky on Thornfell) is itself a tell that an event or a long season is coming (11.13).

### Set pieces

**W-31. Handmade set pieces (15).** Ten to fifteen handmade set pieces beat procedural filler (11.11). Each lists what it is for in mechanics terms.

- **S-01. The Weirs of Highwater** (Longmere, Anchor). Stone weirs across the lake outlet with dueling platforms above the leyline. Lawful PvP on the platforms, the Kindled's hall, the Seer's house on the centre pier. Resonant meat sears best here (18.3).
- **S-02. The Drowned Stair** (Longmere, Drift reveal). A Held stair down into the lakebed, open only in the low-water state. A Bleed Zone and Fissure site at the bottom, Tome fragments on the landings, a locked Boss Room door at the end with a tier 3 ward (11.9, 13), which no launch content opens. The Rift under the lake stays a mystery.
- **S-03. The Glassfield** (Longmere, catalyst site). A hillside turned to glass by a Sunfall centuries ago. Lightning fronts ground here. Durability and Range catalysts tied to the place ("win a Contest on the Glassfield under a storm"). A spellcaster mob that casts Echelon 2 fire lives in the glass.
- **S-04. Steelhall** (Ashwick, Anchor). A dojo on a sea cliff at the edge of the Ash, one lamp always lit. Steel Vow shrine, Blade masters, the trainer who reads bodies (5.19.10), the smith who forges plain steel (W-40). The Ostrey lineage has kept the hall for generations; "Ostrey" is an NPC family name and never a player-lineage example.
- **S-05. The Drinking Stones** (Ashwick, dungeon). Seven black pillars on the plateau ringed by Golem wardens with exposed cores. A seamless dungeon (11.9) under the stones. The place that drained the island. Might catalysts (breach a warded module with strikes alone, 5.19.4).
- **S-06. The Deaf Room** (Ashwick, secret). A chamber at the Ash's heart where even Instinct and Mana Vision show nothing. Phantoms cannot enter; Fissures cannot open. The hidden Fist master of Ashwick is sometimes here (W-36). Nothing a mage needs is inside (flight and climb parity, 11.12).
- **S-07. The Salt Road** (Ashwick, traversal). A Dead Zone pass across the Ash, marked by cairns, with vowed-only crawlspaces that cut the distance and a Wellstone-rationing problem for mages. Conditioning catalyst ("cross a Dead Zone on foot", 5.19.4). Ash winds in cold fronts.
- **S-08. Tollstead and the Counting Stair** (Thornfell, Anchor). A terraced city climbing the lower slope, each terrace a lantern, each lantern counted at dusk by the lamplighter (W-45). Law hub: Readers, Marshals, the wanted board, the counting-house, the enchanters' row (W-41). The Seer sits at the top of the stair.
- **S-09. The Pin** (Thornfell, endgame). The summit under its plate of cloud. Pressure rated at the Rites (4.7). The solo Rite Trial (5.20). From the last terrace the Rift's hum is audible through the rock. Flight above the terrace is lethal (11.10).
- **S-10. The Quiet Gallery** (Thornfell, mentor site). A cave of echoes on the north face where the Tally teach Sense (15.2) by making students call hidden casters by their hum. Suppression and Sense catalysts. Also where a wanted player can lose a Reader, since the echoes smear signatures (12 escape routes).
- **S-11. The Wraith Terraces** (Thornfell, bestiary). Abandoned Held terraces where the anchored dead walk, each terrace one Pressure echelon higher than the last. Classic Mage ground. A spirit-forged blade is tested here (7.3). A hidden Struck mentor sits on the third terrace, taking hits.
- **S-12. Firmbank** (Lanternmarsh, Anchor). A stilt town on the firm bank. Pell's kitchen, the Foraging mentor, boats for the flood season, the Seer in a hut over the water. The Inn's rent is often paid in Kitchen Duty here (18.13), because the marsh is poor in crystals and rich in food.
- **S-13. The Lantern Field** (Lanternmarsh, Aether's edge). The western fen where the lanterns hang. The densest Fissure cluster in the Holdfast and ground zero for the Aether Tide (11.13). A Fissure here is the recommended first look at Horror grammar before a first Aether visit (11.6): a failed run costs the rewards and a Hollow walk home, not a Life, so even a player at one Life can afford the lesson.
- **S-14. The Standing Stones** (Lanternmarsh, faction). A ring of stones where Struck novices stand and let spellcaster mobs hit them on purpose, then sit and meditate on the wound (Learning by Suffering, 5.12). Supplies the varied sources Insight needs (11.5). A player can join, and a Struck mentor reads their Insight aloud in bands.
- **S-15. The Outer Shoals** (sea, eviction). Three small islands beyond the channels where evicted players wash ashore (17.4). A Safe Zone with a cold spring, a wrecked ferry hull for shelter, and a rumor source: the shoal hermit (W-44) who will tell you where the nearest Inn is for a bowl of something hot.

**W-52. Shards (11.4 v3.1).** The overworld runs on a fixed set of named shards (tune: 8), each with its own Drift schedule and event outcomes that outlive any server. In-world, nobody explains this and nobody needs to; the Seer's one line on it is "there is more than one telling of the Holdfast, and you live in one". Shard names should be plain sea words a ferry pilot would use, one word each, none of which names a mechanic (proposed: Ebb, Neap, Slack, Swell, Chop, Lull, Fetch, Lee). Ferry pilots and Inn rumors say the shard's name when it matters ("on Slack, the Weirs are flooded; here they are not"), and per-shard honours (first full clears, first-to-master Epithets, Occupied towns) are spoken as "on Slack" rather than "on this server". Whether shard names are shown anywhere outside rumors is Q-07.

---

## 3. Factions as schools of thought

The four schools are not armies and have no territory to fight over. They are ways of using will, each with a town that leans toward it and a claim about the Aether. Players never join a school in the mechanical sense (no faction stat, no reputation number, 11.11 is about culture). A school is who teaches you and what they say while they do it.

**W-32. The Tally (efficiency and suppression).** Tollstead, Thornfell.
Creed: will is finite and every drop spent without purpose is lost to the dream. The Aether is a debt: it grows on waste, and a loud aura is a confession. The Tally count, suppress, cast small and cast once. They train Efficiency, Suppression and Sense; their masters are flat lines in Mana Vision (5.11). They run Tollstead's law because reading signatures is a Tally skill, and they produce the Holdfast's best criminals for the same reason (12). Mentor style: makes you fight an engagement ending under 10% mana before teaching anything (an Efficiency catalyst, 5.5). Saying: "Spend it like you will need it. You will."

**W-33. The Kindled (burst and overcharge).** Highwater, Longmere.
Creed: will is a fire and a fire kept small goes out. The Aether is a forge: it burns off what was never yours and the Grimoire is the metal that comes back. The Kindled duel on the weirs, Overcharge early (6.2) and treat Sacrifice as the highest act a mage can perform (10.12). They train Durability, Cast Speed and Capacity by Exhaustion. Mentor style: teaches by Contest; you learn a spell's family by clashing with its next member (4.7 spell families). Saying: "Those who die for others burn brightest in memory." They are also the Holdfast's most frequent visitors to the Aether, and they know it.

**W-34. The Struck (the hermit order of suffering).** Firmbank and the Standing Stones, Lanternmarsh; a mentor on the Wraith Terraces.
Creed: pain is the only honest text. A spell understood from a book is a rumor; a spell understood from the wound is knowledge. The Aether is a teacher that does not repeat itself, and Fissures are its lessons offered gently. The Struck make Learning by Suffering (5.12) a rite of their own and sit in meditation on wounds. They favour Efficiency under duress and Block Proficiency, and they are the only school that treats the Aether's first-visit survivors as clergy. Mentor style: will not teach a spell they have not seen you take. Saying: "Read it on your skin."

**W-35. The Plainsteel (the sword lineage).** Wick and Steelhall, Ashwick.
Creed: mana is a crutch, and a body that is enough never dreams. The Steel Vow (7.3) is sworn at Steelhall. They forge plain steel that does not go brittle at 0 mana (7.3) and teach the Blade's Techniques and Arts (5.19.6). Their doctrine is falsified by the mechanics: a vowed Blade who dies three times goes into the Aether like anyone else (9.1, 10.1). The Plainsteel answer: "Then he was not steel enough." This is intentional (C-04); schools are allowed to be wrong, and the game never confirms or denies. Mentor style: the trainer reads your body (5.19.10) and will not teach a Technique until your stance "makes no sound". Saying: "Every child of the Holdfast is a Blade until it isn't."

**W-36. The hidden Fist (the Bare Vow).** No town. Drift states, ruins, the Deaf Room.
Not a school and not named by themselves. Outsiders say "the stonehanded". Creed, as far as anyone has heard it: the Aether is the world when no one is holding it, and a person who can stand unmoved in a Drift state is an anchor of one. They live in wild cells on purpose, to practise being the only fixed thing in a changing place. No Fist master teaches in an Anchor town (5.19.8); they are found through Rumors and the Wandering Master event (11.13). Bare Vow shrines are flat stones with two handprints worn into them, authored into a few Drift states (W-22c) and ruins. Reading the Blow (5.19.6) is their real teaching: a Fist learns from everyone who tries to kill it. The Unbroken Hand (5.19.8) is the only Fist title the Seer speaks, and when one exists on a shard, Inn rumors carry it.

**W-37. The disagreement, in one table.**

| School | What the Aether is | What they do about it |
|---|---|---|
| Tally | a debt, fed by waste | spend less, hide more |
| Kindled | a forge | burn bright, die well |
| Struck | a teacher | get hit, sit with it |
| Plainsteel | where will goes without a body | need less will |
| Fist | the world unheld | be an anchor of one |
| Seer | "not a where" | reads what it leaves |

**W-38. Where the vows live.** The Steel Vow: Steelhall (S-04), with a second shrine in Highwater for Sword Mages who turn fully to steel. The Bare Vow: hidden shrines only (W-36), never in a town. Renouncing either (7.3) is done before the Seer, who records it in the ledger without comment.

---

## 4. NPC roster

**W-39. Law (Section 12).**
- Guards: town watch, scaled to the wanted player's archetype. In Tollstead they are Tally and read signatures; in Highwater they are Kindled and hit first; in Wick they are Blades; in Firmbank they are few, and the marsh itself is the deterrent.
- Readers: Tally-trained guards who follow Residual Mana Signatures (12). A Reader has an audible tell when they find a trace (a soft count under the breath), which is the wanted player's cue to suppress or move.
- Trackers: human hunters who follow footprints and witnesses, hired because vowed characters show only a Still Aura and leave no signature (7.3, 23). A Tracker is a Blade or a Fist; they can be heard by Instinct (7.3).
- Marshals: one named duel boss per Anchor town, the top of the escalation ladder (12). Proposed names: Marshal **Idren Holt** of Tollstead (Tally, a Sense master who parries from sound), Marshal **Brannoch Teague** of Highwater (Kindled, Overcharges in the first exchange), Marshal **Sera Ostrey** of Wick (Plainsteel, Spellcut specialist), Marshal **Odo Reed** of Firmbank (a Struck who takes the first hit on purpose). Each is built to counter the archetype most likely to be wanted in that town.

**W-40. Smiths (17.3).**
- **Garn Cole**, Wick: plain steel. Durability through material, never mana. Will not touch a mana-reinforced blade.
- **Teodor Weir**, Highwater: mana-reinforceable blades for Sword Mages (7.2).
- **The starmetal smith** (name withheld until found): the one smith who forges spirit-forged blades (7.3) from Falling Star starmetal (11.13). Lives in a Drift state on Thornfell's north face; found by rumor. Not an Anchor NPC, by design.

**W-41. Enchanters (17.3).** The enchanters' row in Tollstead. Glyphs always trade one stat for another (6.1), and the Tally's enchanters say so to every customer: "Nothing is free, so nothing is given." They also buy rare materials for crystals. A second, cheaper enchanter in Highwater makes Glyphs of Expansion only, because the Kindled like big.

**W-42. Mentors (5.12, 5.19.6, 18.9).** One per school in its Anchor town for Echelon 0 and 1 (free cantrips from Anchor trainers, 5.20; Barrier is always the first), Echelon 2 by a mentor who first makes you prove something, Echelon 3 (a Calamity) only from a mentor with Renown (5.16), who is often a player. Inn cooks teach the Hunter's Pan and safe plants. Hidden mentors (Fist masters, the starmetal smith, the Struck on the Wraith Terraces, a Split Focus teacher in the Quiet Gallery) live in the world and move with it.

**W-43. The trainer who reads bodies (5.19.10).** One in each sword-culture town (Wick, and a Plainsteel expatriate in Highwater). Speaks in the same qualitative bands as the Seer but about stance and breath: "Your stance settles. Your breath does not."

**W-44. Travelers and rumor sources (11.8, 18.12).**
- Inn cooks: the primary rumor channel, near rumors first (5.23).
- Ferry pilots: run the channels between islands, know which cells have changed since yesterday ("the south shore's dry; wasn't last week") and which shard they are sailing (W-52).
- The lamplighter of Tollstead (W-45).
- Hearth-tale travelers: NPCs who sit at a wild campfire and trade a rumor for a bowl (18.12).
- The shoal hermit (S-15): a Spent mage who never joined the Seers, tells evicted players where the nearest Inn is and one true thing about the Aether per visit.
- Dockhands in Highwater and marsh children in Firmbank: cheap, unreliable rumors, sometimes right.
- Every rumor expires with the Drift state it refers to (11.8).

**W-45. The lamplighter of Tollstead.** Counts the lanterns at dusk, aloud. If the count is wrong, something has drifted on the mountain, and the lamplighter's line changes ("one short on the fourth terrace"). This is a diegetic Drift tell for Thornfell, no HUD.

**W-46. Names kept from the doc, and names left alone.** The Seer (W-14) is the only doc-named NPC used here. Aldric (18.6, 18.9) and the Varn line (3.5) are the doc's illustrative examples of player lineages in the Grimoire and ledger; no NPC, hall, dish or place in this proposal uses either name, so they never collide with real player families. All NPC names above (Pell, the Ostrey line, Holt, Teague, Reed, Cole, Weir) are new and disposable.

**W-47. Sample Seer lines (in the doc's voice: short, second person, no numbers).**
1. "Two cracks. The third is not a crack."
2. "Your circuit runs toward distance and thrift. You could fight that. You would lose slowly."
3. "Something is ripe. It wants a storm, or a height. It does not want this room."
4. "You spent will on nothing. Nothing is what you learned."
5. "Your grandmother broke through on a hill that is no longer there. The hill does not care. Do it elsewhere."
6. "The dream has had you once and let you go. It will remember the shape of you. Do not bring the same shape."
7. "I do not read dreams. I read what they leave."
8. "That was not luck. Luck does not bleed you for forty minutes."
9. "You are hungry again. You will always be hungry again. Your mother was the same."
10. "Three of your line have sat in that chair. One learned the Sunfall. None of them learned to leave a fight."
11. "Your hand is harder than your blow now. Good. Now your blow is the problem."
12. "You have been unreadable for a long while. Someone has noticed anyway. Trackers do not need to read."

**W-48. Sample Inn rumors (time-limited, cryptic, no markers).**
1. "The tide left wheat in the lowmarsh. Dry pan, hot, one chance. Don't blink."
2. "Someone saw a man cooking on the Ash with no fire. No fire. Just a pot, and him looking at it."
3. "The Mereline's running high. Wolves down by the weirs have gone glassy. Good meat if you sear it where it fell."
4. "The old stair on the south shore is above water again. Wasn't last week. Won't be next."
5. "Holt posted paper on a woman with a flat aura. Walked out of the counting-house with the ledgers and nobody saw her glow."
6. "There's a hum under the third pass. Not wind. Wind doesn't keep time."
7. "Lanterns over the marsh again, west of Firmbank. Three nights running. Nobody who went looking came to supper."
8. "A Blade from Wick says she saw a stone with two hands worn into it, out on the Downs. Says she didn't touch it. Says."

---

## 5. Art and audio one-pagers

**W-49. Art direction one-pager.**

Principle: readability is gameplay (1.2, 4.9). The world is built so that the fixed telegraph language is the most saturated thing on screen at every moment, on every device.

1. Palette ownership. The world owns the desaturated middle: wet stone greys, peat browns, grey-greens, bone, rust, cold blue-grey water, overcast skies. Four hues are reserved and never appear in environment art at saturation: the four parry-class telegraph colours fixed in `combat-numbers.md` C-10 (white #FFFFFF, vermillion #D55E00, yellow #F0E442, blue #0072B2). Green is reserved for acid (10.13 grammar) and never used for a telegraph. Orange is the HUD's (16.3) and is kept dim in the environment. World-side guards that follow from C-10: (a) pure white belongs to the Parryable glint, so snow, salt-flat and bone surfaces (W-21d, W-22b) sit at or below about 85% luminance or carry a faint tint, and the overcast sky never reaches pure white; (b) lamps, hearths and candle light are amber-orange, warmer and darker than telegraph yellow, and the lanterns over the marsh (W-20) are a cold violet-white "that no fire makes", a hue no class uses; (c) leylines glow a dim desaturated teal, never telegraph blue; (d) Rifts glow a warm pale gold, dimmer than telegraph yellow, and are the only non-hearth warm light in the Aether.
2. Telegraph language (owned by `combat-numbers.md` C-10; restated here so art never drifts from it). Shape and sound carry the class, colour reinforces. Parryable: a 4-point star glint on the hand or weapon, white, a single high "tink". Breaker: a jagged cracked ring around the caster or weapon, vermillion, "thud-CRACK". Unparryable: a filled ground decal with diagonal hatching outlining the exact area, yellow with a dark outline, a continuous rising whoosh. Grab: inward-pulling chevrons converging on the target (or an open hand), blue with a white rim, a reversed inhale plus a short chain rattle. Every class must still read with colour removed, and with sound off. Environment art never imitates these four shapes at the hand, on a weapon or as a ground decal (no hatched floor patterns, no cracked-ring sigils as decoration, no star-glint specular on props).
3. Element lives inside, class lives on the edge. The projectile body carries the element's tint (amber fire, pale ice-blue, teal water, violet-white lightning, ochre earth, grey wind, black-with-no-highlight void). The class marker lives on a separate rim layer at the hand, weapon or ground (C-10c), so an element tint near a class hue never shares its layer: fire sits near vermillion and ice-blue near telegraph blue, so both keep their tints a step away in luminance (fire darker and more orange than #D55E00, ice lighter and greyer than #0072B2), and lightning's violet-white body is a fill, never a 4-point glint.
4. Echelon scale is fixed everywhere (4.7): Lesser spells hand-sized, Greater spells body-sized, Calamities sky-scale with a sky colour change. The overcast baseline exists so a Calamity can own the sky.
5. Silhouette first. Characters, Horrors and mobs must read as silhouettes at 720p with particles off. Strain is posture (3.4); tiers are stance (5.19.10); sword durability is cracks (7.2); Constitution is animation (3.5). No detail that carries gameplay may live in a texture.
6. Aether palette. Same grammar, inverted temperature: the overworld is desaturated-warm, the Aether desaturated-cool, with hazard grammar fixed (void edges have a mist lip, acid has a green sheen, unstable ground cracks first, Rifts hum and glow a warm pale gold, W-49.1d, the only warm light in the dream because they are the thing you can answer).
7. Low-end mobile budget. Telegraph budgets and minimums are C-10c's (the layer is exempt from quality scaling and culling; 1 decal + 1 billboard + at most 12 particles; the class marker never under 24px tall). The world's side of that bargain: dressing drops to 50% on mobile and gameplay objects never do (11.12); fog of any kind caps its density so a white star glint stays visible at the readability-floor distance; and no environment effect uses the reserved telegraph priority group or more than its own budget near a fight.
8. Lighting. Overcast is the default on every island; direct sun is an event (Leyline Surge, a Great Front clearing) or a telegraph. Night exists, and lit landmarks (W-25) are the navigation.
9. Hand-set, not scattered. Set pieces (W-31) are hand-placed. Drift dressing is seeded scatter under rules (11.12), but every Anchor and set piece gets a human pass. Sparse beats busy; a room with three objects reads faster than one with thirty.
10. What to avoid. Neon, bloom-heavy auras, glowing eyes, chunky "Roblox fantasy" armour, floating runes as decoration. If a prop glows, it is a telegraph, a leyline, a Rift or a hearth, and nothing else.

Deliverable before art production (21.3): a style sheet with the four class colours, the seven element tints, the overworld and Aether palettes as swatches with values, three silhouette sheets (mage, Blade, Fist), one Horror, and the pilot spell (21.3) built in these rules.

**W-50. Audio direction one-pager.**

Principle: sound is the first channel of feedback. Many of the game's readouts have no HUD element at all (Strain, suppression, durability, Drift tells, cooking), so they are sounds first and visuals second.

1. Every telegraph has a sound, and class is timbre, not pitch. The class signatures are C-10a's: Parryable a single high bell "tink"; Breaker two beats, low then sharp, "thud-CRACK"; Unparryable one continuous rising whoosh across the whole startup; Grab a sharp reversed inhale plus a short chain rattle. Echelon layers on top per C-10b (a puff and click at 0, a bright transient for a Lesser, a rumble with 200 to 400 Hz harmonics for a Greater, a horn or drone heard across the area for a Calamity). Pitch and colour of the sound are left free for the element. No environment or hearth sound may use a bell "tink", a two-beat thud-crack, a long rising whoosh or a chain rattle.
2. Phone-speaker rule. Every gameplay-critical cue must survive a single small speaker: nothing below 150 Hz carries information (C-10c), audible energy sits between roughly 200 Hz and 4 kHz, no sub-only cues, no cue that depends on stereo placement. Position is given by panning on PC and by a second, mono-safe layer on mobile. Telegraph sounds sit in C-10c's reserved priority group; this rule extends it to the body cues (Strain breath, Winded, the exhaustion warning) which are never voice-stolen either.
3. The body is audible. Strain is breathing (3.4): four breath tiers from quiet to audible-to-nearby-players. Winded is a specific gasp. A Practiced stance settles with a sound; a Mastered one makes none (5.19.10). Hardness on a Fist is a crack before it bites (5.19.8).
4. Suppression and Sense. Suppression is a low heartbeat hum audible only within the Sense Gap (15.3). A novice's suppression wobbles; a master's is flat (5.11). Instinct (7.3) is a sound cue at 30 studs, a single soft note from the direction of intent.
5. Hums are information. The exhaustion warning before 0 mana (3.2), the breakthrough tell (5.14), meditation's circuit pitch (5.23), a Rift's knitting hum (10.13), a Drift cell's decay hum (11.4), the Pin's hum through rock (S-09). Each has its own interval so a trained ear tells them apart. None is a melody.
6. Cooking is the sizzle (18.2, 18.15). Sizzle pitch is the primary tend tell and must work with the screen in a pocket. Steam thinning, a bubble pattern breaking, an edge catching: each has a sound before it has a picture. Scorch warns audibly for seconds before it costs anything.
7. Mix hierarchy. Telegraphs over everything; body and hums over ambience; ambience over music; music ducks fully in combat. There is no combat music, because combat is read by ear. Anchor towns are quiet by design, so arriving home sounds like relief.
8. The Aether has no music and almost no ambience: the loudest things are the dreamer's breath, the Horrors and the Rift. Silence is the tell that something is about to change (fixed grammar, 10.13).
9. Diegetic where possible. An Inn fiddler, the lamplighter counting, a Reader's whispered count, ferry bells. Rumors are text (moderation, 20.4); NPCs make wordless sounds, not voiced lines.
10. Fixed library, varied data. A small set of base sounds per class and element, varied in code by echelon, speed and element rather than by per-Horror recordings, matching the animation plan in 21.3.

Deliverable before audio production: the four class sounds, the four breath tiers, the suppression hum and the exhaustion warning, tested on a phone speaker at arm's length and in a pocket.

---

## 6. Working title shortlist

**W-51. Titles (replace "Untitled").** Judged against Appendix C: a plain word, or two plain words joined; no hype, no tech, nothing borrowed.
1. **Holdfast** (recommended). The archipelago's name. Two plain words joined, the Appendix C pattern (Spellcut, Deadcalm). It says what the world is (land held fast by the people on it) and what the Anchors do. A holdfast is also what an anchor bites into, so sailors would say it. Collision note: a PC musket game uses the word in a longer title; it is a common English word, not that game's coinage, but check (Q-04).
2. **Moorings**. Where ships are held. Plain, sailor-given, and the softer of the two; a fallback name for the archipelago as well if Holdfast is rejected.
3. **Driftbound**. Says the world moves and you are tied to it. Clear to a new player, less distinctive, reads as a genre title.
4. **Thrice**. Three Lives. Short and ominous; says less about the world.
5. **Wake**, judged. It is a plain word with three earned meanings (waking against the dream, the vigil for the dead, what a ship leaves), and it is not borrowed in the Appendix C sense: Alan Wake is a character's surname, not a world or a system. But the association is the first thing a player hears, and a single common word is unsearchable on the platform. Kept here only so the reasoning is on record; not recommended.

Dropped: Volition (Latinate, not a word a cook says) and The Held (opaque on a store page).

---

## 7. Conflicts, assumptions and open questions

### Conflicts with the doc (listed, not bent)

**C-01. Lanternmarsh's mana-zone type (11.11 vs W-20).** The template asks for one mana-zone type per region, and 11.3 defines three (Leyline, Dead Zone, Pressure). The fourth region uses "Mana Storm biome plus Bleed Zone states" as its identity instead. 10.6 does say Mana Storms are planned for rare overworld biomes, and 11.12 makes Bleed Zones cell states rather than zones, so nothing is contradicted, but it is a bend of the template. Alternative if rejected: give Lanternmarsh a weak, broken leyline (a Mereline tributary) and keep Bleed Zones as its flavour.

**C-02. Resolved (v0.2).** The Varn line (3.5) is a player-lineage example in the doc. The sword hall is Steelhall, kept by the NPC Ostrey line (S-04, W-35, W-39). No Varn anywhere in this proposal.

**C-03. Resolved (v0.2).** Aldric (18.6, 18.9) is a player-lineage example in the doc. Firmbank's cook is Pell (W-20, S-12). Pell teaches the base Marsh Stew; a player family's "Aldric's Marsh Stew, third generation" is their own named version, as 18.9 describes.

**C-04. Plainsteel doctrine is mechanically false (9.1, 10.1 vs W-35).** Vowed Blades die into the Aether like everyone else. The school's creed says a sufficient body never dreams. This is deliberate: schools hold beliefs, the game confirms none. Flagged so nobody later "fixes" the mechanics to match the lore.

**C-05. Resolved (v0.2).** The telegraph language is owned by `combat-numbers.md` C-10 and W-49/W-50 now restate it rather than propose one. Checked against the world palette: no C-10 hue fails. Two hues needed world-side guards rather than changes: pure white (snow, salt flats and bone are capped below it, W-49.1a) and yellow (all fire and lamp light is pushed to amber-orange and the marsh lanterns to violet-white, W-49.1b). Blue only needed the leyline glow desaturated to teal (W-49.1c). The guards cost the world nothing it wanted.

**C-06. The Seer's origin (3.2 vs W-14).** The Seer as "a mage who burned their circuit to the end" implies surviving a terminal Mana Burn. 3.2 defines Mana Burn as Trauma, not as a permanent state. The lore treats the Seers' condition as a rare, permanent outcome that the mechanics never produce for players. No mechanic is implied; flagged so it is not read as a Scars proposal (5.17).

### Assumptions

**A-01.** The Aether has no leylines or Dead Zones (the 10.1 recommended default). W-05 depends on it; if the OPEN item resolves the other way, W-05's second sentence changes and nothing else does.

**A-02.** First Visit Mercy (10.10) stays hidden. No lore here mentions or hints at it except the Seer's line 6 in W-47, which is spoken after a return and names no mechanic.

**A-03.** Regions are four, not three. If scope cuts to three, drop Lanternmarsh and move the Struck's Standing Stones to Longmere's Drowned Stair cell and Pell to Highwater's kitchen; the marsh rumors in the doc (11.8, 18.6) would then need a new home.

**A-04.** Great Front, Risen Ruin, Siege, Deadcalm, the Parting and the other events (11.13) are placed by their framework, not by this proposal; the set pieces above are their candidate sites, not fixed homes.

**A-05.** Nothing in this proposal adds a faction stat, reputation number, map marker or HUD element. Schools are culture, taught by NPCs and spoken in rumors.

**A-06.** World state is per shard (11.4 v3.1). Everywhere this proposal says a thing is remembered, honoured or occupied, it means on that shard, never across all of them. The four islands, their bones and set pieces are identical on every shard; only the Drift, events and honours differ.

### Open questions (not decided here)

**Q-01.** Should the Seer be literally one order with one shared voice (W-14), or one being present in every town? The second is more mysterious and harder to write around rescue, lineage and Occupied towns (11.13). Default: an order.

**Q-02.** Does the Ash (W-18) truly never host a Fissure, or is "never" a Plainsteel belief? A single, rare, authored Fissure in an Ashwick state would be the most frightening reveal in the game. Default: never, for launch; revisit with World Events.

**Q-03.** Do the lanterns (W-20) ever lead somewhere other than a Fissure? A rare Drift state in which a lantern marks a Rift that leads into a shared Aether instance on purpose (a deliberate, rescue-style entry under the 10.11 eligibility rules) would give the marsh an endgame use. Default: no at launch.

**Q-04.** Title collision and trademark check for "Holdfast" and "Moorings" on the platform and in adjacent games.

**Q-05.** Whether the Held get any single authored lore room (a Boss Room behind the Drowned Stair's tier 3 ward, S-02) or stay fragments forever. Default: fragments at launch; the door stays shut.

**Q-06.** Whether vowed characters hear a distinct Instinct note for Trackers (W-39) so the Still Aura trade-off is felt from both sides. Default: yes, if cheap.

**Q-07.** Shard names (W-52): whether they are shown in the menu's slot list and spoken by ferry pilots, or stay invisible. Recommended: shown, in plain sea words, because per-shard honours and Occupied towns will make players ask "which one are you on" within a week.

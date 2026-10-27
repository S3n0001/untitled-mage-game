> Merged into game-design.txt v3.2 (Section 25).

# 25. Collecting: Marks, Keepsakes and the Shelf (PROPOSED)

Status: PROPOSED. Every number is (tune). Source: `docs/game-design.txt` v3.1. This proposal does not edit the design doc. It gives the scattered collectible things in the doc one home and one set of rules. Written in the Section 18 style, numbered as Section 25 so it can be pasted in after the open decisions list.

"The Grimoire remembers. The Shelf shows. The Seer tells."

Collecting is the game's second quiet mode, beside cooking (18). It is what a mage does with the things that happened to them: the beast they finally read, the wheat that was only there for an hour, the dream their grandmother did not come back from. It is for the player who, in Deepwoken, lived for the items. Here the items are mostly moments, because the Drift makes moments the rarest thing in the world.

## 25.1 Intent and Design Laws

Collecting must be a real home for collectors, worth a session on its own, and never required by anyone else.

It obeys the document's laws. Discoveries are knowledge and tools, never stats (1.1). Nothing collected touches combat: no stat, no set effect, no window, no cost, no regen, no Power Score value (4.11 Law 1, 5.7). Rewards are recognition, cosmetics, knowledge, lineage and story, the same currency that pays the Unbroken Hand (5.19.8) and Epithets (5.22). Nothing shows a number (16.3). Power is never sold (17.6).

Three laws of its own:

A collection is a record of witness, not a checklist. The book shows what the character has touched. It never shows what they have not. There is no total, so there is no completion bar, and a wiki cannot tell a collector how far they are from done, because "done" does not exist while the Drift keeps making new things (11.4).

Transience is the treasure. The rarest marks are the ones nobody can earn again: a state that ended, an event instance that resolved, a dream that was dreamed once (10.2). The collector's brag is "I was there", not "I have all of them".

Curation over completion. Marks are unlimited and automatic, but keepsakes (the things a collector chooses to keep and show) are few. A collection is what the player decided to keep, so two collectors with the same hours have different shelves.

No combat power guardrail (LOCKED intent, mirrors the food guardrail in 18.1): no mark, keepsake, set, chapter, Shelf, or lineage milestone may change a combat timing, cost, damage, capacity, regen, Strain, Blood, Threat, XP, Insight, ripeness bar or catalyst. Collecting never produces a Major breakthrough and never restores a Life (5.25). A collector is never a stronger fighter, and a fighter is never a worse collector.

## 25.2 Where Collections Live

Two homes, one for knowledge and one for things. The choice follows what already exists in the doc rather than adding a codex screen.

The Grimoire (knowledge). The Grimoire already holds non-physical records: spell and technique pages (5.21), discovery marks for places (9.3), recipe cards and the Signature dish (18.9), known Forms (5.21), Epithets as ledger entries (5.22), and the lineage ledger (9.3). It is character-bound, cannot be dropped (17.2), survives Aether death (9.3) and is the first thing a descendant holds (5.21). Everything a character witnesses goes into it as a mark (25.3). This is the only sensible home for knowledge: it is already the game's memory object, and putting collections anywhere else would split legacy in two.

The Shelf (things). Each rented Inn room (17.4) has a Shelf: a small display surface in the room beside the Inn chest (missing-systems S-14). Physical collectibles go on it: starmetal (11.13), spirit-forged material (7.3), a glyph in its source form (6.1, 11.8), a weapon that broke in a fight worth remembering, a Watch badge (bestiary B-31). Shelf items are real items, placed and removable, and follow item rules (17.2, 25.9). The Shelf is per slot, like the chest, and moves with the slot to whatever Inn it rents.

The Seer (the telling). The Seer reads the Grimoire the way it reads the circuit (5.14): in words, in bands, never in counts. The Seer is where a collector hears what their book has become.

Rejected homes. A codex or journal screen would be a third memory object and would invite a completion bar by its nature. The Inn room alone cannot hold knowledge (it is wiped on Aether death, S-15). The Grimoire alone cannot hold things (it is a book). Two homes with one rule each is the smallest design that fits the doc.

## 25.3 Marks: What Can Be Collected

A mark is a record in the Grimoire that a character witnessed a thing. Marks are written by the server when the witnessing condition is met. The player never "picks up" a mark. Every mark belongs to a chapter.

Chapter of Beasts (14, bestiary proposal). One mark per species, including Horrors (10.1), guards and Marshals (12) and Spellcaster mobs (14). Witnessing conditions by tier (25.4): Glimpsed by seeing it within Mana Vision or plain sight; Marked by surviving an engagement with it (it engaged you, Exposure, 5.2); Known by having answered every attack class it uses at least once (parried a Parryable, dodged an Unparryable, out-spaced a Breaker, beaten a Grab, 4.2) across any number of fights. Known never asks for kills, so Familiarity (5.2) and this chapter pull the same way: variety, not volume.

Chapter of Pages (5.12, 5.20, 5.22). Spells and techniques already live here. This proposal adds marks for how each was learned (mentor, Tome, Suffering, Reading the Blow, 5.12, 5.19.6) and for known Forms (5.22). A Form mark records that the Form exists and the feat family that opens it. It never grants the Form; Form Feats are re-earned (5.22).

Chapter of the Hearth (18.9). Recipe cards and the Signature dish, unchanged. Each card gains a witness context (where and in what Drift state the first Fine dish was pulled, 18.7), so a Tidewheat Flat card remembers the flood.

Chapter of Places (9.3, 11.8, 11.12). One mark per named place in the bones (landmarks, dungeon entrances, Inns, shrines, Pressure Peaks) and one per Drift state the character stood in, keyed to cell and state kit (11.12). The second kind is where the Drift lives in the book: "the lowlands, flooded" and "the lowlands, ruins revealed" are different marks. Hidden mentors and Fist masters (5.19.8, 11.13) are Place marks, written when the character meets them, never before.

Chapter of Tides (11.13 world events, 11.7 fronts). One mark per event instance the character took part in (party definition, 5.2: damaged, healed, buffed, sealed, cooked at the Hearth Fair, held a wall). The mark records the event type, the region, the Drift block, the outcome, and the hands present (25.7). A Great event mark records the shared outcome ("the Tide receded").

Chapter of Dreams (10). One mark per Aether visit, written as it happens, so it survives the character (25.8). It records the layout family (10.4), mutations and weather (10.5, 10.6), Horrors met, and how it ended: a Rift, a Trial, a Sacrifice, a rescue, or the dream keeping the dreamer. It is drawn as the dreamer's sketch, deliberately vague: no map, no layout, nothing that teaches the next Aether (10.2). Nothing physical leaves the Aether (18.7). A memory is not physical. Tome fragments (11.6, 5.20) stay items and are the one Aether reward a Shelf can hold.

Chapter of Materials (7.3, 11.13, 17.3). Marks for materials with a story: starmetal from a named Falling Star, spirit-forged material, a glyph source first found in a state. The mark is knowledge ("starmetal falls where the sky burns green"). The material itself is an item (25.9).

Chapter of Draughts (the alchemy hook, 25.13). Reserved for formulas, which plug in exactly like recipe cards.

The Ledger (9.3, 5.22). The last chapter. Generations, Vows (7.3), Epithets, Sacrifices and Holds (10.12, 23), Signature dishes, lineage milestones, and the lines the Seer speaks differently. The ledger is written by the game, read by the Seer, and never edited by the player.

Not collectible: anything whose witnessing would be a farm (kills, crystals, dishes cooked), anything with a number, and anything that only exists to be collected. The game adds no "collectible" props. Every mark is a side effect of playing.

## 25.4 Ink: Progress Without Numbers

This is the core problem: a collector must feel progress without a "47/120". The answer is the same as the circuit's (5.5, 5.14): qualitative tiers, read from the object.

Three inks per mark (names tune): Glimpsed (a faint pencil outline), Marked (inked, with the character's hand), Known (illuminated, with margin notes). The tier is read from the page. There is no tier number, no bar under the mark, and no percentage.

What the book shows, and what it hides:

It shows every mark the character or an ancestor has at any ink. It shows Glimpsed outlines, so a beast seen and not fought is a visible loose end. That is the only kind of gap the book ever shows: a gap the player has already touched.

It never shows an empty slot for a thing the character has not met. Chapters have no fixed page count. A chapter grows as marks are written. A player who has met four beasts sees four pages and no fifth.

Chapter thickness is the progress readout. The Grimoire is a physical book in the UI with a visible edge. A thick Chapter of Beasts is thick. Ribbons mark chapters. The spine wears. A descendant's book is visibly thicker than a first character's. This is the "47/120" replacement: the player sees mass and wear, never a quotient.

Seer bands (5.14). The Seer reads a chapter in words: "Your pages on beasts are thin." "Your Chapter of Tides is well-thumbed." "The lowlands are in your book in three of their faces." "You have dreamed twice. Once you woke." Bands are relative to the chapter's content in the world right now, which the server knows and the player does not. The Seer may name one loose end ("there is a beast you saw and never faced") but never a count of loose ends.

Rumor and gossip (11.8, 5.22): Inn keepers remark on notable books ("the Varn book has three dreams in it") and on a Shelf when a door is open (25.6). These are the brags. They use words a person would say.

Partial counts: the decision is no counts anywhere in the book, the Shelf or the Seer, not even in a journal view. The reasoning: a count implies a denominator, and the denominator is exactly the number a wiki would publish and a checklist would chase. Worse, with the Drift the denominator is not fixed: sealed marks (25.5) exist in some books and can never exist in others, so any total would be a lie or a leaderboard. Dates are allowed, because a date is a story detail, not a score: "the fourteenth day of the block, at night" belongs on a witness mark. The missing-systems assumption that inventory stack counts are fine (S-13) stands; those are counts of things in a bag, not progress.

Illumination (the completion brag without a number). A chapter whose contents are a fixed set in the world (the Chapter of Beasts by species, the bones half of the Chapter of Places) gets an illuminated border when every entry in it reaches Known (or, for places, Marked). The server knows the set; the player only sees the border appear. Nothing shows how close a chapter is to illuminating. Drifting and Sealed content never counts toward illumination, because its set is not fixed. When an update adds a new species or bones place, an illuminated chapter keeps its border, and the new entry appears as a loose thread on the border once the character has Glimpsed it, so a returning collector sees what is new without losing what they earned. An illuminated chapter is a ledger line, a door-plate flourish on the room (25.6), and an Inn rumor. Nothing else.

Session legibility (2.2, 5.15): a new mark blooms as ink on screen when written (a short, quiet animation, no toast text, no number). A mark counts as a "visible gain" for the session target in 5.15. Reading the book is free and works anywhere, like Meditation (5.23), so a mobile player can read their collection in a 15-minute session without a trip to the Seer.

## 25.5 Transience and Witnessed Moments

Every mark carries a witness class, set by the server from what it records. This is the heart of the system and the main hook for the parallel rarity proposal (25.13).

Standing: the thing persists and can be witnessed by anyone, any time. Species, bones places, Anchor mentors, recipe combinations. Standing marks can always be earned; they are never a brag by themselves.

Drifting: the thing exists in a Drift state or weather front (11.4, 11.7) and returns when the state returns. "The lowlands, flooded." Tidewheat. A Drifting mark can be earned again later by anyone, but not today. Rumors are its herald (11.8).

Sealed: the thing existed once and ended. A specific event instance (the Siege of a named town on a named block), a specific 30-minute state on a per-server seed, a Great event's outcome, a dream. When the state or event ends, every mark of that instance seals on every book that holds it. A sealed mark can never be written again by anyone. This is "I was there when the tide left wheat."

Witness conditions keep marks honest and keep them from being a farm:

A Drifting or Sealed place mark needs real presence: inside the cell, out of a Safe Zone, for a minimum time (tune: 3 minutes of play), or any engagement there. Walking through a cell edge writes nothing.

A Tides mark needs contribution by the party definition (5.2, 5.6). Watching from a wall writes a Glimpsed mark only.

A Hearth witness context is written only on the Discovery pull (18.9), never on repeats.

A Dreams mark is written at entry and updated at the end. It cannot be avoided and cannot be repeated for the same instance.

Pressings. A Drifting or Sealed mark can carry a pressing: a flat image of the thing in the book (a wheat stalk, a Horror's likeness, a ruin's seal, a front's first snow). Pressings are chosen by the player at the moment (tune: a short prompt in the ink bloom, one tap), and the book has few pressing slots (tune: 8 per character, more through lineage milestones, 5.22). Choosing to press one thing over another is curation (25.1). An unpressed moment still leaves its mark; it just has no picture.

Why this is the collector's thrill and not a FOMO trap: nothing sealed is needed for anything (25.1). Missing a state costs a collector a story, not a step. The Drift makes new stories every block (11.4), and the ones a player did see are theirs forever.

## 25.6 The Shelf and Showing Off

The Shelf is the Inn room's display surface (25.2). Slots (tune: 6 at the start, up to 12 through lineage milestones, 5.22). An item on the Shelf is still an item: it can be taken down, traded, used, or broken. Placing an item writes nothing in the Grimoire. The Shelf is for things; the book is for witness.

The open door. A player may set their room's door to open (default closed). While open, any player in that Inn can step in, look at the Shelf, and read the open chapters of the Grimoire laid on the desk (the owner picks which chapters are open; the Ledger and Dreams are open by default, Pages closed by default, since a spell list is build information). Visitors can touch nothing. The room is a Safe Zone, so nothing can go wrong in it.

Reading another's book outside the Inn: at the Seer, two players may lay their books side by side. Nothing is exchanged. It is for comparing dreams.

Gossip (11.8): Inn keepers on servers the player visits mention a notable Shelf or book in the same way they mention Epithets (5.22), with the same opt-out (23). "Someone in room four has starmetal from the Highwater star." Rumors are words, never links or lists.

Heraldry and decor (5.22): lineage milestones unlock heraldry (a mark on the door, a banner on the Shelf) and room decor. Decor is placed in the room and is cosmetic. Horn weave (bestiary B-07) is the base material for heraldry, so heraldry is both earned and crafted, never bought.

Guild display (post-launch, OPEN): a guild hearth (18.12) may hold a shared case for keepsakes under guild rules. Deferred, because shared ownership plus per-slot economy (17.2) needs the trade rules in missing-systems S-22 first.

What cannot be shown as earned: nothing bought may sit in a slot that reads as earned. Sold cosmetics (25.10) are covers, inks, bookplates, shelf wood and room skins. They are visibly a different class of object from a pressing, a mark or a shelf item, so a bought room never fakes a lived one.

## 25.7 Death, Inheritance and the Hands

Overworld death (9.1): nothing in the Grimoire or on the Shelf changes. Armor breaks as usual.

Aether death (9.3, 5.21): the Grimoire carries every mark, pressing, card, Epithet and ledger line to the descendant. The last Dreams mark is written as the character dies, so the book always ends with the dream that took its writer. The Shelf is wiped with the Inn chest (S-15), except the Heirloom (23, below). The wiped Shelf keeps shadows: a faint outline where each item stood, labelled by the ledger ("grandmother's broken blade"). Shadows are cosmetic and can be cleared by the descendant or left as they are.

Hands. Every mark records which generation wrote it. A descendant sees an ancestor's marks in a different ink (the doc's "faded marks", 9.3). When the descendant witnesses the same Standing or Drifting thing in person, the mark gains a second hand: the page now shows two inks. A mark with three hands is a lineage brag ("three generations have faced the Mourner"). Sealed marks cannot gain hands, because the moment is gone; they stay in the ancestor's ink forever, which is the point.

Fading (9.3): Place marks of Drifting states are drawn with a note of when they were last true. A state that the Drift has moved shows as faded until it returns, and the ledger date tells the descendant how long ago. Remembered catalysts (5.21) already send descendants back to ancestors' marks; this chapter is where they look them up.

Heirloom (23 recommended, S-15): one item marked ahead of time passes to the descendant at Broken. A Shelf item may be the Heirloom. A material with no durability passes as a dull keepsake: the same model, no crafting use, so it carries memory and not power. This closes the open question of what Broken means for a shard of starmetal.

No compounding (5.21): hands, chapter thickness and lineage milestones unlock only what 5.22 already lists (heraldry, decor, extra pressing and Shelf slots) plus Seer lines and rumors. Nothing in a five-generation book makes the sixth character stronger. The descendant's Power Score counts current stats only (5.7).

Lineage goals (5.22, extended, tune): a dream in three generations; the same beast Known by three hands; a Sealed mark from every Great event in a calendar year; a Signature dish and a house draught (24.13) in one lineage; a Shelf with an Heirloom that has passed twice. Each is a ledger line and a cosmetic, nothing else.

## 25.8 The Aether and Memories

Decision: memories of the Aether are collectible; matter is not (18.7). The Grimoire already holds non-physical marks, and the Dreams chapter follows the same rule as a place mark.

What a Dreams mark may hold: layout family, mutations, weather, the Horrors met and at what ink (a Horror can reach Known in the Aether like any beast), the ending, who was there (a rescue party's hands, 10.11), and one pressing of the dreamer's choosing. What it may not hold: a map, a layout seed, a Rift position, a Horror's per-server timing values. Marks record grammar, which is learnable by design (10.13), and never the layout, which is not (10.2).

Writing while dying: the mark is updated on every server save and finalized on death or escape, so a server failure never loses a dream (10.8). The ending "the dream kept her" is written by the server, not chosen.

Fissures (11.6) write a Dreams mark of their own kind ("a fissure, ten minutes, the Thinling"), so a cautious collector can start the chapter before a real visit.

Sacrifice and Hold the Breach (10.12, 23) write ledger lines in the sacrificer's book and a Tides-style mark in every saved player's book that names the hand that saved them. That mark is Sealed and cannot be earned any other way. It is the strongest story the system can hold, and it costs nothing to add.

## 25.9 Items, Trading and Anti-Abuse

Marks, pressings, cards and ledger lines are knowledge: character-bound, not items, never dropped, traded or gifted (17.2). A witness mark that could be traded would be a lie.

Shelf items are items and follow 17.2 and missing-systems S-16 and S-22 unchanged: droppable classes drop, Tomes and Manuals do not, Robux cosmetics do not, per-slot economy applies, and alt-ferrying is blocked. The Shelf adds no new item class.

Marks and alts: marks are per character and carry nothing between slots, so there is nothing to ferry. Soul Resonance (8.1) is untouched. Reading another player's book grants nothing to either.

Server hopping and event marks: Tides marks require contribution (25.5), and per-account diminishing returns on event rewards (11.13) stand for rewards. Marks are not rewards with budgets, so a hopper who contributes to the same event type on three servers gets three marks and a reduced reward on each. That is acceptable: the marks are Sealed per instance and are honestly earned. If data shows hopping for marks, the fix is a per-account cooldown on Tides marks of one type (tune: one per 12 real hours), never a cap on the book.

Farming for ink: Known in the Chapter of Beasts needs every attack class answered, not kills. Familiarity (5.2) already makes kill-farming pay nothing. A collector who sits on one species learns its full grammar in a handful of fights and is then done with it.

Server authority: every mark is written by the server from events it observed itself (hitbox checks, cell occupancy, event participation, cook sessions). No RemoteEvent lets a client claim a mark, a pressing, a tier, a hand, or a Shelf placement without the server checking the item. Exploit checklist additions (20.3): claim a mark by remote; claim presence in a cell by teleporting at the edge; press more than the slot count; place an item on the Shelf that is not in the slot's inventory; open a door for a room the slot does not rent; read a closed chapter of another book.

Text and moderation (20.4, S-30): the only user text in the system is item names already allowed elsewhere (a dish name, a character name). Marks have no free text. Pressing labels are picked from the catalog.

## 25.10 Monetization

Sold (17.6): Grimoire covers, ink colors, bookplates, ribbon colors, Shelf wood and room skins, door plates. All account-bound cosmetics, visibly a separate class from earned objects (25.6).

Never sold: marks, pressings, pressing slots, Shelf slots, hands, ledger lines, heraldry, an open Chapter of Dreams, or any way to skip a witness condition. Slots in particular are the scarcity that makes curation real; selling them would make a bought book look lived.

Convenience line: a sold cover may change how the book looks. It may never change what the book says.

## 25.11 Mobile, Console and Session Length

The Grimoire opens full screen from the menu or a held button (PC: a non-combat utility key, 16.1; mobile: a book icon outside the combat cluster; gamepad: a menu tab). It cannot open while In Combat (4.1).

Pages turn with a swipe or a bumper. Chapters are ribbons along the edge. Marks are large, one per page on a phone, two on PC. Ink tiers read as drawing weight and color, colorblind-safe (as 18.15). A pressing prompt is one tap and times out harmlessly (tune: 10 seconds) if ignored, leaving the mark unpressed; the Seer can later let the player press a recent mark from memory (tune: within the same Drift block) so a mobile player mid-fight is never punished for not tapping.

The Shelf is a room scene: tap a slot, pick from the chest. Visiting a room is walking through a door.

Session fit (2.2): a mark blooms in play and costs no time. Reading the book takes as long as the player wants. Pressing is one tap. Arranging a Shelf is a two-minute Inn stop. A 15-minute session that ends with one new ink is a session with a visible gain (5.15).

Performance: other players see a generic book-reading animation. Pressings are catalog images, never player uploads. A room scene streams only when a player is inside it.

## 25.12 Integration Points

See 1.1 and 1.2: discoveries as knowledge, variety over volume, learnable versus unlearnable, power never sold.

See 4.2 and 4.9: attack classes and the fixed telegraph language define Known in the Chapter of Beasts.

See 5.2: Exposure and the party definition decide who witnessed an engagement or an event. Familiarity and Known pull the same way.

See 5.14 and 5.23: ink tiers and chapter thickness are legibility without numbers. The book reads anywhere, like Meditation.

See 5.15: a new mark is a visible gain for the session target.

See 5.21 and 9.3: the Grimoire carries marks, pressings, cards and the ledger. Discovery marks are the Chapter of Places. Faded marks are ancestor ink.

See 5.22: Epithets, heraldry, decor and extra discovery-mark slots are the reward layer. Forms are Pages marks.

See 7.3 and 11.13: spirit-forged material and starmetal are Materials marks and Shelf items.

See 10.2, 10.8, 10.12, 10.13, 11.6: the Chapter of Dreams records grammar, never layout, and is written as the dream happens.

See 11.4, 11.7, 11.8, 11.12: Drift states, fronts and rumors are the source of Drifting and Sealed marks. Cell occupancy decides presence.

See 11.13: event instances are Tides marks. Contribution, not presence, writes them.

See 12 and bestiary B-31: guards, Marshals and the Watch badge are beasts and Shelf items like any other.

See 14 and the bestiary proposal: one mark per species.

See 17.2, 17.4, 17.6 and missing-systems S-14 to S-16, S-22: item rules, the Inn room, the chest, the Heirloom, trading and per-slot economy are unchanged.

See 18.7, 18.9: recipe cards gain a witness context. Nothing physical leaves the Aether.

See 19.6: the Grimoire block in the character profile grows by the data model in 25.14.

See 20.3, 20.4: exploit checklist additions and no free text.

## 25.13 Rarity Hooks and the Alchemy Hook

What collecting needs from the parallel rarity proposal:

A transience signal, not a drop-rate. Collecting cares how long a thing will exist and whether it comes back, which is the witness class (Standing, Drifting, Sealed, 25.5). If rarity defines tiers, each tier should state its witness class, so the book can draw it without a number.

A non-numeric in-world tell per tier, consistent with the Drift's own tells (11.4): a color drift, a hum, a Mana Vision shimmer. The book mirrors the tell with a paper and ink treatment (plain paper, pressed leaf, gilt edge; names tune). Rarity should own the tell vocabulary; collecting only reuses it.

A per-server versus per-world flag. A thing unique per server (Risen Ruin's first clear, 11.13) and a thing unique per world (a Great event outcome) both seal, but their rumors travel differently (11.13 rumor reach). The flag decides which rumor pool the brag enters.

No numbers reach the book. If rarity needs a probability for spawn tables, it stays server data. The book never says "rare".

Alchemy as a chapter (the parallel potions proposal): formulas plug in exactly like recipe cards (18.9). A formula is a Discovery on the first successful brew of a new combination, recorded as a card in the Chapter of Draughts with a witness context (where the reagent was found, in what state). Cards inherit with the Grimoire and apply the Hearth-style multiplier only to whatever the potions proposal defines as its life-skill attributes (5.26). The house draught (24.13) mirrors the Signature dish: a name on the bottle, prestige only. The alchemist's herbal (proved reagent virtues, 24.13) is also a Chapter of Draughts entry, while Wild virtues are logged as Drifting marks, not catalogued. Potions themselves are items (missing-systems S-17) and can sit on the Shelf. Reagents that exist only in a Drift state or a front are Drifting or Sealed marks in the Chapter of Materials. No potion, formula or bottle on a Shelf touches combat (S-17 rule 1 stands).

## 25.14 Technical Notes

Catalog, not strings. Every markable thing (species, place, state kit, event type, spell, Form, material, layout family, Horror) has a small integer id in static game data. Marks store ids, never names, so the profile stays small and renames (Appendix C) cost nothing.

Data model (character profile, Grimoire block, extending 18.17 and 19.6). Stored as arrays, not objects, to keep JSON short:

Standing and Drifting marks: `[catalogId, ink, firstAt, hands]` where `hands` is a small bitfield of generations (up to 16, tune). About 20 bytes each in JSON. Catalog size at launch is a few hundred ids; cap 2,000 (tune).

Witness marks (Drifting states, Tides, Dreams): `[kind, catalogId, instanceKey, blockIndex, cellId, outcome, firstAt, hands, pressingId]`. `instanceKey` is an 8-byte hash of the seed inputs (11.4, 11.13, 10.13), enough to seal an instance without storing it. About 60 bytes each. Cap 600 per lineage (tune). Past the cap, the oldest unpressed witness marks compress into ledger lines (kind, block, outcome) at about 12 bytes each, and the player is told by the Seer, never by a counter. Pressed marks never compress.

Pressings: the `pressingId` above plus a catalog image id. No player-uploaded images, ever.

Shelf: `[slotIndex, itemGuid]` pairs, pointing into the slot's item records (S-16). Shadows: `[slotIndex, catalogId, generation]`, cleared on demand.

Ledger: `[kind, generation, timestamp, catalogId, instanceKey]` lines. Cap 400 (tune), oldest non-milestone lines compress to a per-kind tally the Seer reads as words ("many sieges").

Size budget: target the whole Grimoire block under 64 KB (tune) at the caps above, which leaves the character profile far below the 4 MB DataStore key limit and inside a comfortable save size on mobile reconnects. Measure with the progression simulation (22) at a five-generation, 500-hour lineage. The sealing of instances needs no cross-server write: a mark seals when the server that holds the book computes that the instance's time window has passed, from the same clock the Drift uses (11.4).

Writes: marks are written in memory and saved with the next normal profile save (as event ledger entries already are, 11.13). Dreams marks are included in the Aether per-player persistence save (10.8). No mark needs its own DataStore call. Room open-door state is a profile flag. Visiting a room reads the owner's in-memory profile on the same server; cross-server viewing is not supported at launch.

Determinism and testing (22): a mark is a pure function of observed events, so the replay harness can assert that a recorded session writes the same marks. Add to the progression simulation: a pure collector (no fighting beyond what Known requires) must reach a thick Chapter of Beasts and several Sealed marks in a month at 3 hours a day, with no combat progress, and must never be stronger than a non-collector of the same hours.

## 25.15 Open Decisions and Recommended Defaults

Counts in the book. DECIDED: none anywhere, including journal views. Dates are allowed. Fixed-set chapters illuminate when complete (25.4), with no progress readout toward it. Revisit only if playtesters cannot tell a thin chapter from a thick one, and fix the drawing first.

Pressing slots. Recommended: 8 per character, plus 2 per lineage milestone, cap 16. Shelf: 6 to 12 by the same rule.

Aether memories. Recommended: yes, as the Chapter of Dreams, grammar only, written as it happens.

Open doors. Recommended: closed by default, owner picks open chapters, Dreams and Ledger open by default, Pages closed by default.

Tides marks for Local events. Recommended: yes, with contribution required, since a 15-minute mobile session should be able to leave a mark (11.13 sizes Local events for it).

Known for Horrors with per-server variation. Recommended: Known requires answering each attack class once; per-server timing variation does not add classes, so the ink reads the same everywhere.

Heirloom materials. Recommended: pass as a dull keepsake with no crafting use.

Shadows on a wiped Shelf. Recommended: yes, clearable.

Guild display case. Recommended: post-launch, after S-22 trading ships.

Hop cooldown on Tides marks. Recommended: none at launch. Add a per-account cooldown per event type only if logs show mark-hopping.

Compression caps. Recommended: 600 witness marks, 400 ledger lines, pressed marks exempt. Tune against real profiles before launch.

Epithets for collecting. Recommended: a small set, all ledger-only: the Witness (a Sealed mark from each of the three event scales), the Dreamer (a dream in three generations), the Reader (a species Known by three hands). No Epithet for "every" anything, because "every" is a count.

## 25.16 Minimum Viable Slice

Build order (21.2): the collecting slice lands with the overworld slice and the progression core, after the data layer, since it needs the Grimoire record, cell occupancy and one mob type. The Chapter of Dreams lands with the Aether MVP. Tides land with World Events.

Slice contents:

The Grimoire as a full-screen book with ribbons, chapter thickness, three inks, and the ink bloom, on mobile from day one.

Chapter of Beasts for the slice's one mob type and the Fissure Horror (Glimpsed, Marked, Known by attack classes).

Chapter of Places for the slice map's bones and one Drift cell with two states, with presence written from occupancy.

One Drifting ingredient (Tidewheat, 18.6) carrying a witness context on its recipe card and a pressing.

The Seer's chapter bands and one loose-end line.

Descendant inheritance: ancestor ink, a second hand on a re-witnessed mark.

Deferred: the Shelf and open doors, Tides, Dreams, Materials, Draughts, heraldry and decor, lineage milestones, shadows, cosmetics, guild display.

Success test for the slice: a playtester asked "what have you collected?" answers with a place and a time, not a number. If they reach for a number, the book is drawing a bar and must be redrawn before anything else is added.

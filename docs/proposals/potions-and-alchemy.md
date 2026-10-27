> Merged into game-design.txt v3.2 (Section 24).

# 24. Potions and Alchemy: The Bench (PROPOSED)

Status: PROPOSED. Source: `docs/game-design.txt` v3.1. This proposal does not edit the design doc. It defines the system behind the three existing potion lines (3.2 "Potions do not heal it", 3.3 "Restored by water, potions, or certain fruits", 18.10 "Potions remain a separate system" and "where a potion covers the same category the stronger one applies"). Every number is (tune). Status tags follow the document's conventions. Rarity and collecting are being written in parallel; this section only states what it needs from them (24.8, 24.9). `missing-systems.md` S-17 defines the launch potion set and S-13 to S-18 the inventory rules around it; this section builds on them and names its one change in 24.19. `bestiary.md` supplies the beast-sourced reagents in 24.7.

"Mana is volition. A vial is a question you are willing to drink."

Alchemy is the game's other craft, and it is the opposite of the Hearth. Cooking is the wind-down: warm, forgiving, a burnt dinner at the bottom of a mistake. Alchemy is the discipline: cold, exact, and volatile. A cook reads a fire. An alchemist infers what a thing is, then controls what it wants to become, and the only way to be sure what they made is to drink it. It is for the players who in other games lived at the brewing table, invented recipes nobody asked for and kept a shelf of things they were not sure about. It is a craft of knowledge and nerve, and it is meant to be an identity.

## 24.1 Intent and Design Laws

Alchemy must be deep enough to be a player's whole game, creative enough that two alchemists' shelves look nothing alike, and never mandatory for anyone else.

It is a counterpoint to cooking as cooking is a counterpoint to combat. Cooking is sensory and safe. Alchemy is deductive and risky. A novice can draw a weak draught in two minutes. A master runs three seething vessels on a leyline bench and draws something Pure that nobody has named before.

It obeys the document's laws. Discoveries are formulas and reagent knowledge, never stats (1.1). Progress is usage-based with variety gates (1.2, 5.26). Nothing shows a number. Overworld reagents are learnable; Aether matter is not (Design Law 3). Power is never sold.

The potion guardrail (LOCKED intent, mirrors the food guardrail in 18.1): nothing from the bench ever touches a combat timing, a parry window, dash i-frames, a Contest window, a startup floor, a mana cost, damage, Density, Mana Capacity or in-combat regeneration (4.11 Law 1). Nothing from the bench is used while In Combat, with one named exception: the Smoke flask, which only breaks sight (24.4). Nothing from the bench restores Health or Mana, at any time (24.4). Nothing from the bench heals Soul Damage (3.2), shortens Trauma (3.2), ends Hollow or Winded, or touches Strain (3.4). A duel between a dosed mage and a sober one is decided by the players, not the vial.

The attrition guardrail: the Aether is attrition (3.3, 4.9, 10.10). Potions enter the Aether as supplies, like rations, and are consumed like supplies. They never make the Aether safe, only better packed for (24.4, 24.6).

The knowledge guardrail: a formula is knowledge, and knowledge inherits (5.21, 9.3). Hands do not. A descendant reads the ancestor's herbal and still has to steady their own vessel.

## 24.2 The Bench Loop: What the Player Does

An alchemist stands at a bench (an Apothecary in an Anchor town, a guild bench, or a field kit), with a vessel in front of them and reagents in a case.

The verbs, in the order a new player meets them:

Gather: take a reagent from the world. Plants and mushrooms are the Foraging stat's job to identify as safe or not (3.3, 5.8); what they do in a vessel is the Nose's job (24.5). Minerals, beast parts, waters and mana stains are reagents too, and Foraging has nothing to say about them.

Render: turn a reagent into an essence. Crush (short taps), steep (set it and come back, 24.7) or distill (a longer hold with a tell). Rendering reveals one hidden virtue of the reagent (24.3) and decides how fast the essence acts in the vessel. A crushed essence acts at once and burns off fast. A steeped essence acts slowly and lasts. Render is the knife of alchemy, and like the knife it is where order starts to matter.

Bind: add an essence to the vessel. Order matters. The first essence sets the base. The second gives the base a direction. A third shapes it (duration, onset, form). Opposed virtues in one vessel fight, and the fight is agitation (24.3).

Steady: the vessel stirs on its own as it binds, and the stir is read from the glass: color, bubble pattern, a whine in the glass, a hiss. Steady is a hold on the stir tell, released on the settle tell. This is the parry of alchemy, with a window three to four times wider than a parry and a readability floor like everything else (4.9, 18.3). Steady does not lower agitation. It keeps the brew from climbing, and holds it where the brewer wants it.

Quench: add a Stilling essence to drop agitation a band. It costs a reagent, it is always available, and it caps the brew at Potent, because a brew that had to be quenched can never be Pure. Quench is the safety valve. Using it is never wrong, and never great.

Draw: bottle it. Draw is the commitment. Too early and the draught is Weak. Too late and the vessel ruptures (24.6). Between those is where the craft lives.

Prove: learn what you made. An unproven draught is murky: the vial shows a color and a smell line, never an effect. To prove it, the brewer drinks a measure of it themselves (the effect applies to them, good or bad), hands it to someone who drinks it (they prove it for both of you), or pays an Apothecary NPC in Mana Crystals to prove it (a sink, never a faucet). A proved formula is a Discovery (24.9) and every later draught from it is labeled on Draw.

Label and shelve: name it, keep it in the cellar, carry it in the pack, or hand it to someone.

A simple draught takes about 90 to 180 seconds (tune) of attention. A steep runs across sessions (24.7). Nothing needs more than one thumb below three vessels.

Why it is satisfying: cooking's reward is a sear landing. Alchemy's reward is the moment a hypothesis holds. The player suspected a swamp root was Chilling because of how it steeped, bound it against a Warming essence, rode the agitation up through Rolling into Seething, caught the Turn, drew it, and drank it, and it was Cooling, and it was Pure. That sequence is a read, a gamble and a proof in a row, which is the shape of every good thing in this game. The other half is the shelf: a case of vials nobody else owns, each one something the player worked out.

## 24.3 Virtues, Binding and Agitation (PROPOSED)

Virtues are what a reagent does in a vessel. They are the alchemist's tag set, separate from the cooking tags (18.7), because cooking tags describe taste and virtues describe action. One reagent can carry both: a Bitter herb in a pot is a flavor, and in a vessel it is a poison carrier.

Virtue list (tune, illustrative): Quickening, Stilling, Warming, Chilling, Clearing, Binding, Resonant, Corrosive, Bitter, Mute.

Each reagent carries two or three virtues. One is open (seen on gathering). The others are hidden until the reagent is rendered (one revealed) or the draught is proved (all revealed). A trained Nose reads hidden virtues on handling (24.5). The virtues of an overworld reagent are fixed for the whole game, so they can be learned, written down and taught (Design Law 3).

Wild virtue: reagents from a Drift state (11.4), a weather front (11.7) or a Mana Storm carry one Wild virtue rolled from the state's seed. It is the same for everyone in that state and different in the next one. It can be read (rendering reveals it, a ripe Nose smells it) but never memorized. Overworld variance that experience can master, with a reason to read before binding.

Binding grammar (fixed, learnable, deliberately small): the first essence is the base and the second is the direction. Base and direction together name the effect (24.4). A third essence shapes it: Binding lengthens duration or thickens a draught into a salve; Quickening shortens onset and duration; Stilling lengthens onset and smooths the brew; Mute hides the taste (24.10). Opposed pairs in one vessel (Warming and Chilling, Quickening and Stilling) do not cancel. They fight, and the fight is agitation. Opposed brews are how some of the best effects are reached (Cooling needs Chilling held against a Warming base), which is why the best draughts are the most dangerous to make. There is no hidden formula check. Any combination can be bound. The result follows from virtues, order and agitation.

Agitation is the alchemy resource. It is not a bar. It is read from the vessel. Bands: Calm, Stirring, Rolling, Seething, then Rupture. Agitation climbs with opposed virtues, Corrosive and Resonant essences, heat, leyline benches and infusion (below), and drifts down slowly on its own. Steady holds it. Quench drops it.

The risk dial, mirroring the flame in 18.3: Calm is safe and caps at Sound. Rolling unlocks Potent. Seething is the only route to Pure, and it starts a rupture clock. Every band has a tell before the next (the whine rises, the color flares, the glass fogs). The lead is fixed (tune: about 1.5s) and the Steady window is generous (tune: about 1.0s at Stirring, about 0.7s at Seething), never below a readability floor (1.2, 4.9).

The Turn: at Seething, a brew offers a single Turn tell (the color flips once). Drawing on the Turn is the only route to Pure. Missing it pushes the brew toward Rupture. The Turn is the Sear of the bench, and it is rare per brew on purpose.

Rupture is never instant. The vessel warns, the hiss rises, and the brewer has a few seconds to Draw (Weak, but drawn) or Quench. Every rupture traces to a decision (Fair Danger, 1.1).

Heat and infusion: a bench heats with fuel anywhere, and a mage may infuse the vessel with mana instead (a short hold, cantrip-scale, allowed under the Steel Vow and forbidden under the Bare Vow, 7.3). Infusion raises agitation a band and raises the potency ceiling of Resonant and Clearing brews. It trains nothing (purposeful spending, 3.1) and is unavailable In Combat and in Dead Zones. On a leyline the vessel runs a band hotter and drifts upward instead of down (fast, volatile, the best Turns in the world). In a Dead Zone agitation drifts down fast and Seething is almost impossible (the home of slow steeps, salves and stabilizers). Sword cultures brew on fuel and patience. Mages brew on will. This mirrors 18.3 and 11.3.

## 24.4 What Potions Do, and the In-Combat Ruling (PROPOSED, caps LOCKED intent)

The ruling: nothing from the bench is used while In Combat (4.1), except the Smoke flask (below). Drinking, applying and throwing anything else are refused by the server during the In Combat state, the same way Dash is refused at 0 mana (4.3). This is S-17 rule 1 with one exception, and the exception is chosen so it cannot restore, protect or strengthen anyone: Smoke only takes sight away, which is a tool for leaving a fight, not winning one. Drinking is a committed animation with a sound tell (tune: 1.2s, S-17 rule 5), so a drink in the open is a decision someone can see. A potion that was drunk before the fight keeps running during it, but no potion effect does anything inside a fight, because every effect lives in the survival chain, out-of-combat recovery, the environment or the body. Nothing a potion does is counted in the Power Score (5.7, 5.26), and nothing a potion does to you ever lowers it.

Why: mana scarcity in combat is the core of combat (3.1). A Contest is a read of your reserves (4.8), the elite parrier is worn down by attrition and nothing else (4.6), and the Aether's 15% survival target is an attrition number (4.9, 10.10). A mana potion is the end of all three (S-17 rule 2 agrees: no mana potion, ever). A health potion is the end of the TTK floor (4.11 Law 3) and of every "no one-mistake death" rule that hangs off it. Out of combat, both are pointless: mana refills in a short breather and Health regenerates at rest (3.1, and C-01b and C-02a in the combat sheet). So the only moment a Health or Mana potion has value is the moment it breaks the game. The design does not need them, and it will not have them. A potion never holds mana. Mana in a bottle is a Wellstone (S-18 calls it a Mana Battery, the pre-rename word), and Wellstones are artifacts, not brews (11.3).

Categories (S-17 rule 4, kept): each potion has a category. One potion per category is active at a time, and a new one in the same category replaces the old. Where a Meal effect covers the same category, the stronger applies and the other is wasted (18.10). A cook and an alchemist together therefore cover more categories, never one category twice.

What the bench makes (three forms, tune):

Draughts (drunk). Every draught is liquid, so every draught restores a little Thirst (tune: 8% of capacity, S-17; a drink of water is 30 units, 3.6). This is the 3.3 line, and it means a vial is a small drink in the Aether, where drinks are counted (3.6).

Stanch (category Blood): Blood restores over time, out of combat only (tune: up to 20% Blood over 3 minutes of play, pausing while In Combat like all Blood regeneration, 3.3). Never Health. This is the closest thing to a healing potion the game has, it works through the survival chain, and in the Aether it is a real supply. It replaces S-17's Health Draught (24.19).

Blood Tonic (category Hale, S-17's name kept): out-of-combat Blood regeneration faster, the Hale meal's twin (18.10; S-17 calls it the "Steady" meal, the pre-rename word). Blood and Hale are separate categories: one restores, one speeds the rate.

Tonics in the other Meal categories (Hearty, Resonant, 18.10), the Warding Tonic (Warmth or Cooling, S-17) and Clear Eye (Clear, S-17), each at the same caps as a Masterwork meal and a shorter duration (tune: 20 minutes of play).

Hazard tonic (category Hazard, no meal twin): hazard tolerance that cooking does not reach. Acid Rain and acid crossings drain Blood and armor slower (tune: by half, 10.5, 10.6), and Mana Storm regen swings are damped out of combat only (10.6). It is the alchemist's expedition gift, and it stays modest so fronts and acid stay dangerous for the unprepared (18.10).

Antidote (category Poison, S-17): ends one overworld poison family (24.10). Antidotes are formula-specific. There is no antidote for Aether poisons (3.3, 10.9, S-17), because an Aether poison has no formula to answer. An alchemist who drinks an Aether fruit is as lost as anyone.

Salves (applied, not drunk). Mend: restores a little weapon or armor durability in the field, out of combat (tune: up to 25% of max, once per item per real hour). A Broken item (0, after a death, 9.1) cannot be mended by a salve. The smith stays the repair economy (17.1, 17.3) and the salve is a whetstone for the road. Salves never change what a parry costs, what a block drains, or how a sword cracks (7.2); they add durability back between fights and nothing else.

Volatiles (thrown). A small set of Echelon 0-class flasks. They deal no damage, fizzle on any Echelon 1 or higher spell that strikes them in flight (4.7), and use the fixed telegraph language (4.9).

Smoke (DECIDED: the one in-combat exception). A flask that bursts into a vision screen, like the steam of a clash residue (4.8). It exists for the two escapes the doc already names: breaking sight on the law (12) and the Aether disengage (23: run, then break line of sight). Rules (tune):
- The throw has a 500ms startup with its own fixed sound and arm wind-up (4.9), and can be interrupted by any hit. A spell that strikes the flask in flight bursts it early, where it was hit.
- One Smoke per character per engagement (the In Combat window, 4.1). A second throw is refused until combat ends.
- The cloud covers a small radius (tune: 4 studs) for a short time (tune: 4s), and counts against the per-area clash residue cap (4.8).
- What it blocks: line of sight for guards, Marshals, mobs and Horrors (they fall back to searching the last known position), the answer-assist cone (4.8), and lock-on through the cloud.
- What it never blocks: hitboxes, damage, the In Combat timer, or any telegraph. Attack telegraphs inside or through the cloud draw above it and their sounds are untouched, so the readability floor holds (1.2, 4.9). It grants no invulnerability and no stealth beyond sight.
- Counterplay (skill_notes, 4.11 Law 6): Unparryable AoE still lands in it; Mana Vision reads auras through smoke, so Sense against Suppression decides who is seen (15.3); vowed characters' Instinct still hears hostile intent (7.3); and the throw's startup is itself a tell that someone is about to run.
Smoke breaks sight. It never ends a fight, so a pursuer who keeps the pressure on still has every answer.

Tar (a Chill-class slow on walk speed, never dash) and Reek (draws Mana Beasts, like Resonant meat at a campfire, 18.12) are thrown only out of combat, like everything else from the bench. OPEN: ship them at all (24.17).

What the bench never makes: Health, Mana, Soul (3.2), Trauma relief (3.2), Strain or Winded relief (3.4), Body Load (5.19.2), XP of any kind, Pressure Tolerance (11.3 gates on capacity thresholds and nothing bypasses them), Sense or Suppression (15), and anything that touches a window, a floor or a cost (4.11 Law 1). This list is a law, not a launch scope.

Drinking gives the drinker no XP of any kind (mirrors 18.10).

## 24.5 Quality Bands and Legibility (PROPOSED)

Five bands, self-contained like cooking's (18.5), never shown as a number: Dregs, Weak, Sound, Potent, Pure.

Dregs is what a ruptured or over-drawn vessel leaves. It is not drinkable and is a reagent (a Corrosive, Mute essence) rather than a product. Failure leaves something, so it is cheap to experiment, but it never feeds anyone, which is the difference from Burnt (18.5).

Band sets magnitude and duration inside the caps of 24.4 (tune: Weak at 40% of cap and half duration, Sound at 70%, Potent at 100%, Pure at 100% with full duration and a clean onset). Pure never exceeds a cap. Its reward is the full duration, a clean label, a visible signature in the glass, and the fact that it exists.

Band is read from the vial: clarity, color depth, sediment, and the drinker's animation (a Pure draught makes a character pause, as a Masterwork dish does). The smell line names the band in words.

Pure requires the Turn, a correct order and no Quench. It should take tens of hours of real variety to reach reliably, so it stays a thing people talk about.

## 24.6 Risk, Rupture and the Field (PROPOSED)

Rupture: the vessel bursts. The brewer loses the reagents and the vessel's integrity drops (vessels have durability with visual cues like a sword, 7.2; a cracked vessel runs hotter). The brewer takes the brew's own effect as a poison-class effect ("you wear what you brewed": a Stanch rupture drains Blood instead of restoring it, a Warmth rupture leaves you cold) plus a Blood loss (tune: 5%). Rupture never deals Health damage, never causes Soul Damage, never takes a Life directly, and the Blood loss alone can never kill from any Blood level above the survival chain's own warnings (3.3). It is a survival-chain event with time to respond, like a poison (18.14).

Rupture is loud and bright. It leaves a mana stain at the bench (24.7) and the brewer's Residual Mana Signature (12). In an Anchor town it is embarrassing. In the field it is a tell to other players and a draw to mobs, like a campfire (18.12). In the Aether, the Horrors hear it.

Nerve pays: brewing at Seething pays more XP (24.11) because the risk is real, the same reason Exhaustion Training pays most (3.1). A brewer who never leaves Calm learns slowly and makes nothing Pure.

The field kit: a consumable bench used anywhere in the overworld. One vessel. Heat from fuel. It is a campfire-sized tell at distance. A field kit works inside the Aether with reagents brought from outside, since fuel burns there (18.12). Aether reagents crumble when rendered and never enter a vessel (OPEN, 24.17), and nothing drawn inside the Aether leaves it with the player if any Aether matter touched it. Design Law 3 stays clean: no Aether reagent can become a formula, a poison or an antidote (18.7).

Carrying: potions live in the pack and have weight (S-13, S-17 rule 5). Vials stack (tune: 5 per stack) and a full stack weighs about what a filled waterskin does, so a brewer who packs twelve vials for the Aether is Laden before the rations go in (S-13 bands). The weight is the Aether's supply limit: what you can carry down, chosen before the fall, is the whole bench inside the dream. Combined with fading (24.12), this keeps potions supplies and not stockpiles. Reagents are ingredients for weight and stacking (S-13) and go in the larder, not the chest (S-14).

## 24.7 Reagents and Where They Come From (PROPOSED)

Every reagent carries two or three virtues (24.3), a render preference (crush, steep or distill) and a volatility that sets how much agitation it brings. Reagents come from the same spawn budgets as everything else (11.4), so the bench cannot print anything.

Foraged flora (3.3, 5.8, 18.7): herbs, roots, mushrooms, saps. Foraging identifies what is safe to eat. The Nose reads virtues. A plant can be safe to eat and still be a poison carrier in a vessel, because a cook's handful is a dose and an alchemist's rendering is a concentration. Bleed Zone deceptive flora (11.5) is the main source of Bitter and Mute, and it is learnable.

The bestiary (14, and `bestiary.md`): Volatile Flora give the gels and acids that cooking uses for pickling and alchemy uses as Corrosive solvents, so the two crafts compete for one budget: blister gel from the Blister Pod (B-14), sap gel from the Sap Ooze (B-15), and nettle acid from the Lantern Nettle (B-16), which the bestiary already names as the overworld's learnable poison source (Bitter). S-19's Volatile Gel is the same material. Mana Beasts give Resonant trimmings beside their meat (Glutmaw Hound B-05, Dolmen Bruin B-06, Loomhorn B-07; a Migration herd's rare cuts carry a front virtue, Warming or Chilling). Golems give mineral salt (Mirrorplate Sentinel B-08, Cairn Walker B-09), the Stilling stabilizer of choice. The Dolmen Bruin's crystal lichen and the Gloamwing's frost-dust (B-21b) are rare Resonant and Chilling reagents. Candle Wraith wick-ash (B-11) is an enchanter's material, not a reagent: Phantoms give the bench nothing, which tells players something. Guards and Marshals drop nothing, so the villain loop stays a non-farm (12, B-31 to B-33).

Drift states (11.4): reagents belong to states, with a Wild virtue (24.3). Ocean states give brine and kelp ash. Ruin states give aged essences in sealed jars, which count as rare and already-rendered. Some reagents exist only in a 30-minute state. Rumors mention them (11.8): "the ruins in the east are weeping something blue."

Mana stains (11.4, 11.12): when a Drift state changes, something is left behind. A mana stain is a reagent (Resonant, Wild) that an alchemist can gather for a short window after a shift (tune: 20 minutes). It gives alchemists a reason to read Drift tells (animals leaving, color drift, the hum) and to be standing there when a cell turns. Rupture also leaves a small stain (24.6), and a bench cannot gather its own.

Weather fronts (11.7, 18.7): storm-struck produce carries a volatile Resonant tag (already in 18.7) and a Wild virtue. Snow fronts leave ice (Chilling, and a cold steep). Heat waves dry reagents on a rack into stable, weak essences. Acid rain in the overworld (if an event brings it) etches Corrosive into anything left out.

Mana Zones (11.3): leyline-grown reagents are potent, volatile and fade fast. Dead Zone reagents are inert, keep for weeks, and are the Stilling base of every stabilizer. Pressure Peaks hold crystalline minerals guarded by the beasts that live there.

Water: boiled water is the plain solvent (18.4). Leyline water is Resonant and raises agitation. Pond water unboiled carries whatever lives in it (3.3).

Dregs (24.5): every failure is a Corrosive, Mute reagent. The alchemist who ruptures a lot has a shelf of dregs and, eventually, a use for them.

Aether (10): nothing from the Aether enters a vessel or leaves the dream (18.7). Aether poisons are not reagents and have no antidotes.

Purchase: the Apothecary (S-17's Alchemist NPC) sells vessels, boiled water, fuel and a basic Stilling salt for Mana Crystals at prices that never beat gathering. Until the bench ships, it also sells the S-17 launch set (Stanch, Antidote, Blood Tonic) and brews from herbs the player brings, as S-17 says. Once player brewing ships, its stock caps at Sound and its prices never beat brewing, so the NPC is a convenience and the bench is the craft (18.7). NPC stock is never Potent or Pure.

## 24.8 Rarity hooks (for the rarity proposal)

This section does not define a global rarity scale. It needs the following from one: a scarcity band per reagent that the spawn tables (11.4) and the Drift state budgets can read, so that Dead Zone salts are common, Pressure Peak minerals are rare, and a ruin's aged essences are rarer still; a way to mark Wild-virtue reagents as state-bound rather than rare, because scarcity in time is not the same as scarcity in count; and a statement that potion quality bands (24.5) are not rarity. A Pure draught of a common formula is common skill, not a rare item. If the rarity system wants to display a potion's tier, it should display the formula's scarcity (how few people have discovered it), never the band.

## 24.9 Collecting hooks (for the collecting proposal)

A collector would catalog: discovered formulas (combination hash plus order plus the band first reached), proved reagent virtues (the alchemist's herbal, per reagent, with Wild virtues excluded because they do not persist), Wild virtues witnessed (as a log, not a catalog), vessels and bench cosmetics, and named draughts tasted (a draught carries its brewer's name and lineage once proved, like a Signature dish, 18.9). A formula first proved on a server is a ledger line (5.22). None of these carry power.

## 24.10 Poison, Crime and Anti-Abuse (PROPOSED, extends 18.14)

Alchemy is where poisons are refined, and 18.14 already sets their limits. Nothing here loosens them. Poisons drain Hunger, Thirst, Blood or out-of-combat mana regeneration over time. They never deal instant damage, never cause Soul Damage, never take a Life directly, and never apply In Combat. A victim always has time to respond.

Delivery: by ingestion only. Nothing is force-fed (18.14). A poison is drunk as a draught, or bound into a dish by a cook (18.14), or into a drink. A poison is never delivered by a hit. A poisoned blade would be an in-combat effect and a passive damage stack (4.11 Law 1 and Law 5), and it does not exist. OPEN: tainting wild ponds (24.17), default no.

What alchemy adds over a plant in a pot: band. A Potent poison drains for longer and faster than a handful of leaves, inside the 18.14 caps (tune: a Pure poison reaches the cap, a Bleed Zone leaf in a stew reaches about a third of it). Mute hides the taste: a Mute-bound poison needs a higher Palate tier to catch (18.11, 18.14), and a Pure Mute poison is caught only by a Mastered Palate. The counter-play is an arms race between two life skills, and both sides are learnable. Antidotes (24.4) end a poison family early. An alchemist who makes poisons is also the one who can make their cure, which is a role.

Detection beyond the Palate: a trained Nose reads a draught by smell before drinking ("something bitter beneath", the same line as 18.14). A murky draught from a stranger is a decision, and the vial says so ("unproved, a stranger's brew").

Crime: every draught carries the brewer's Residual Mana Signature, and a poisoned dish carries the cook's and the brewer's (a Fist's carries none, and guards use witnesses and trackers, 7.3, 23). A poisoning in a settled area is a crime read by guards exactly as any other (12), and heat accrues to the brewer as well as the cook. Suppression hides a signature at the bench as it does anywhere, giving villains the same tool and cost. In the wilds, poisoning is not a crime, the same rule as other PvP (23).

Griefing limits: a poisoned draught cannot carry a Tonic effect, so poison is never disguised as a buff (18.14). Draughts from a brewer with active heat show as "a stranger's brew" in settled areas. A Pure label cannot be forged: the label is server data, written on Draw or Prove, and the client sees only what the server shows.

Alts and boosting: Trust XP (24.11) is account-keyed and decays like Resonance (8.1). Potion effects are modest and out of combat. Drinking grants no XP. Potion effects are not in the Power Score and cannot lower it (5.7). There is nothing to boost and nothing to strip.

Economy: potions have no NPC buy price. Apothecary Duty caps at rent (24.12). Reagents come from spawn budgets (11.4). The bench cannot print crystals.

Farming: Familiarity and Novelty make repeats worthless (24.11). No daily cap is needed.

## 24.11 The Alchemist's Progression (PROPOSED)

The Bench attributes train by use, the same way spells and Hearth attributes do (5.3, 18.11), with no levels and no numbers. They sit outside Mana Circuit Rigidity (5.4, 5.26), so an alchemist is never a weaker fighter. They are a craft of the hands, not the circuit.

Nose: trained by proving draughts and by correctly calling a virtue before rendering reveals it. Reads hidden virtues on handling at higher tiers, sharpens the smell line, smells Wild virtues, and catches poison in a stranger's draught. The Nose is to the bench what the Palate is to the pot.

Mortar: trained by rendering. Faster, cleaner renders, and the fine essences that unlock onset control. The Hand of the bench.

Nerve: trained by steadying brews at Rolling and Seething, and by catching Turns. Smoother steadying, a longer stable Seething, cleaner Turns. Rupturing trains Nerve a little (you learn from a burst vessel), as scorching trains Flame (18.11).

Cellar: trained by shelving draughts that are later used, and by draughts that are still Fresh when drunk. Slower fading and lighter vials.

Benchkeeping: trained by running more than one vessel without rupture. Raises the vessel count from one to two to three. The Parallel Casting of the bench, and optional.

XP model: Bench XP = Action XP x Novelty x Familiarity x Nerve x Trust. The structure mirrors 5.2 and 18.11 so the Seer can explain each term.

Action XP: a Steady on the tell, a clean render, a drawn draught, a proof.

Novelty: a new virtue pairing, a new reagent, a new bench type or Mana Zone, a new agitation band held, or a new Wild virtue read gives full XP. The first draught of a kind is worth many repeats (1.2).

Familiarity: each repeat of the same formula cuts XP sharply (tune: 100%, 50%, 25%, then 10%), recovering slowly. Brewing a hundred of one tonic trains nothing.

Nerve (the multiplier, named for the attribute it rewards most): draughts drawn from Calm pay least. Rolling pays more, Seething pays most. Idle brewing is safe for supply and useless for training, like Low cooking (18.11).

Trust: a small bonus when a draught the brewer made is drunk or applied by a player on another account (tune: 1.25x), decaying per pair under Soul Resonance rules (8.1), keyed to accounts, so alts give nothing after the first vial. A bonus, never a gate.

Ripeness and catalysts (5.5): each Bench attribute ripens by practice and breaks through on a feat in a new context. Example catalysts (tune, two or three per gate, at least one tied to a place or condition, one always from the Long Road):

Nose: call every virtue of an unknown Drift-state reagent, Wild included, before rendering. Or catch a Mute poison in a stranger's draught before drinking.

Nerve: catch a Turn on a leyline bench during a Mana Storm. Or bring a brew back from the rupture tell without a Quench. Long Road: draw a Potent draught of ten different formulas.

Mortar: distill a Pressure Peak mineral without cracking the vessel.

Cellar: a draught you shelved is drunk by someone inside the Aether and they come back. A delayed payout, like Renown and the Larder catalyst (18.11).

Benchkeeping: finish three vessels with no rupture at Rolling or above.

Breakthrough visuals: the alchemist's vessel glass changes tint at a Nerve breakthrough. Draughts from a ripe Nose carry a visible signature in the vial. No numbers anywhere.

No Lives: the bench never produces a Major breakthrough (5.25, 5.26).

Seer lines: "Your nose is sure, but your hands shake at the glass." "You have drawn this too many times. Find a new root." "The vessel was patient. You were not."

Reading progress without a trip: a ripe Bench attribute is heard at the bench (the glass hums at a different pitch), the same as Meditation reads the circuit (5.23), so a mobile player never needs the Seer to know something is close.

## 24.12 Economy, Fading and the Cellar (PROPOSED)

Handing draughts: potions and salves are droppable items (extend the 17.2 allowed list, as 18.13 extended it for food). Per-slot economy rules apply unchanged, so a player's own slots cannot supply each other (17.2, 19.5).

Fading: draughts lose potency on real time (3.6), through three visible states: Fresh, Fading, Flat. Timing is per form (tune: draughts fade in 3 real days and go Flat in 6; salves last twice that; Dead Zone and cold slow it; leylines and heat speed it). A Fading draught drops one band. A Flat one is Dregs. Fading is a tell, not a surprise, and it means a shelf is a living thing, not a stockpile.

The cellar: potions are durable goods and live in the Inn chest (S-14), where fading runs at half speed (tune), like spoilage in the larder. Reagents are ingredients and live in the larder (S-14). Eviction (17.4) follows S-14: the chest is locked, not lost, and the larder keeps its 3-day grace and then rots. On an Aether death the chest is wiped except the Heirloom (S-15), so a dead alchemist's shelf goes with them and only the formulas come back (24.13). Guild benches use the guild larder under guild rules (S-07).

Sharing a draught: drinking a draught proved and labeled by another account creates a small positive Soul Resonance between the two (8.1), capped per pair per day, like breaking bread (18.13). Strangers become people you would die for by trusting each other's vials. Tiny and capped, so it cannot be farmed into anything else.

Expedition provisioning: a pack of Stanch and Hazard tonics is the practical reason a party wants an alchemist, beside a cook's rations. Rescue parties (10.11) that carry both stay in an Aether longer. This is support that never touches a fight.

Apothecary Duty: brewing for the town's Apothecary pays rent in kind. A set number of Sound or better antidotes or Stanch per day (tune: 4) covers that day's rent (1 Mana Crystal, 17.4). It never pays out beyond rent. NPCs never buy draughts for crystals (18.13).

Player sales: players trade draughts for crystals or goods as they trade anything else. Draughts fade, so stockpiles go Flat.

Monetization: cosmetic vessel skins, bench dressings, vial racks and field kit skins are sold. Reagents, formulas, effects and Bench XP are never sold (1.2, 17.6).

## 24.13 Lineage and the Herbal (PROPOSED)

The Grimoire holds the lineage's formulas and its herbal: every reagent whose virtues an ancestor proved. A descendant who reads the Grimoire inherits the formulas and the herbal (knowledge, 1.1, 5.21). They inherit the knowledge, not the hands. Every Bench attribute starts Raw.

The Grimoire XP multiplier (9.3) applies to the Bench attributes when brewing an ancestor's formula, and catalysts are re-earned each generation, the same loophole fix as spells (9.3) and recipes (18.9).

Page choice (5.21) applies: formula pages are read or they fade. An alchemist's descendant who chooses the spell pages over the herbal makes a real decision.

House draught: an alchemist with a ripe Nose may name one formula their house draught. It carries their name and lineage when drunk by anyone, like a Signature dish (18.9). No stats. Prestige only. Feeds the ledger (9.3). Remembered catalysts (5.21) apply to Bench gates: a descendant may break through at the bench where the ancestor did, if the Drift has left it standing.

## 24.14 Mobile, Console and Session Length (PROPOSED)

Touch: the vessel fills the center of the screen. Steady is one large hold-and-release on the glass that lights on the tell. Quench is a tap on a reagent card. Draw is a large button. Render is a scrub on a single reagent card. Bind is a drag. Nothing needs two thumbs below three vessels.

Gamepad: A to Steady (hold and release), X to Quench, right trigger to Draw, stick flick to render, bumpers to switch vessels.

Legibility: tells are a sound and a large visual change, never a small icon. The whine in the glass is the primary tell and works with the screen in a pocket, like sizzle pitch (18.15). Colorblind-safe: agitation reads from bubble pattern and sound, and the Turn is a brightness flip, never a hue alone.

Session fit: a draught in two to three minutes, a steep across sessions, a proof in seconds. A player who logs in for fifteen minutes can render two reagents, set a steep, draw yesterday's steep, prove it, and leave with a Discovery and a vial they did not have.

Performance: other players see a generic bench animation, a glow and, on rupture, a burst. They never see the simulation. Audio is local.

## 24.15 Integration Points

See 1.1 and 1.2: discoveries as formulas and herbal entries, variety over volume, learnable versus unlearnable, power never sold.

See 3.1: nothing restores mana, and infusion trains nothing (purposeful spending).

See 3.2: potions never heal Soul Damage and never shorten Trauma. This section is the system behind that line.

See 3.3: draughts restore Thirst. Unknown water can poison. Aether sustenance stays unsafe and has no antidote.

See 3.5: potions restore fixed amounts, so Constitution's capacity trade applies to Thirst from a vial as to water.

See 4.1 and 4.3: nothing from the bench is used while In Combat, refused by the server like Dash at 0 mana, except one Smoke per engagement, which only breaks sight.

See 4.11: no potion touches a window, a floor, a cost, damage or Density. No poisoned hits.

See 5.2, 5.5, 5.23: the Bench XP model and catalysts reuse the multiplier structure and ripeness gates, and the bench hum reads ripeness like Meditation.

See 5.4 and 5.26: Bench attributes are exempt from Rigidity and never produce a Major breakthrough.

See 5.7: potion effects are never counted in the Power Score and never lower it.

See 5.8: Foraging identifies plants. The Nose reads virtues.

See 5.16: alchemist mentors (guild benches, the Apothecary) earn Renown by the same rules as cook mentors (18.9).

See 7.3: infusion is cantrip-scale, allowed under the Steel Vow, forbidden under the Bare Vow. A Fist's draughts carry no signature.

See 8.1 and 10.12: sharing a labeled draught creates capped positive Soul Resonance, which feeds Sacrifice eligibility.

See 9.3 and 5.21: formulas and the herbal in the Grimoire, with the multiplier and re-earned catalysts.

See 10.9, 10.10, 10.11: potions are the supplies 3.3 tells players to bring. Weight caps them (S-13). Nothing from the Aether enters a vessel or leaves.

See 11.3: leyline benches run hot, Dead Zone benches run cold. Mana Pressure is never bypassed.

See 11.4, 11.7, 11.8, 11.12: Drift states, fronts, mana stains and rumors supply reagents and Wild virtues.

See 11.5: Bleed Zone flora supplies Bitter and Mute.

See 11.13: Falling Star craters and Risen Ruins can carry reagent tables. Migration herds carry glands. Drought makes solvents scarce.

See 12: poisoning is a signature-traced crime. Smoke is an escape route 12 already names.

See 14: the bestiary is the reagent table. Guards drop nothing.

See 17.2: potions and salves join the droppable list. Per-slot economy applies.

See 17.3: Mend salves repair a little in the field. Smiths remain the repair economy.

See 17.4: Apothecary Duty pays rent in kind. Cellars live at the rented Inn.

See 17.6: bench cosmetics are sold. Nothing else.

See 18.4: boiled water is the solvent.

See 18.10: Tonic and Meal effects share categories, strongest applies, never stack.

See 18.11 and 18.14: the Palate and the Nose are the two poison detectors. Mute is what they are up against.

See 18.12: field kits are campfire-scale tells, and work in the Aether with outside reagents.

See 23: Volatiles support the recommended Aether disengage (run, then break sight).

## 24.16 Technical Notes (PROPOSED)

Server authority: the server owns the brew session. It rolls Wild virtues from the state seed, generates every tell with a server timestamp, records Steady, Quench and Draw inputs with the same server-side input estimate as combat (4.4), applies the same latency cap, and decides band, agitation and rupture. Clients predict the glow and sound. Windows are wide enough that compensation is simple.

In Combat gate: every bench action, drink, apply and throw is a server call that checks the In Combat state first and refuses with no effect while it is set (4.1). The one exception is a Smoke throw, which the server allows once per engagement and tracks against the engagement it started in. Clients grey the controls; the server is the gate. Smoke clouds are server-placed volumes; sight checks for NPCs and the answer assist read them on the server, and telegraph rendering ignores them on every client.

Tick rate: brew sessions update at a low rate (tune: 5 Hz). A tell lead of 1.5s and windows near 1s never need combat tick rates.

Caps: concurrent brew sessions per server (tune: 32), vessels per bench, field kits per region, mana stains per cell. Sessions idle out after a minute without input and a vessel left idle at Seething ruptures on the server, not on the client.

Determinism: a brew session is replayable from its seed and input log, like combat and cooking (22).

Data model (character profile, Bench block): per-attribute XP and ripe flags, catalysts done, known formulas (combination hash plus order plus best band), the herbal (reagent id plus proved virtue mask), a capped novelty set of combination hashes seen, a familiarity table with decay timestamps, the house draught, and the vessel count. Target a few KB. Potions and reagents are ordinary pack, chest and larder items under S-13, S-14 and S-16 (GUIDs, last holder, per-slot checks).

Reagent item: reagent id, open virtue, hidden virtue mask (server only until revealed), Wild virtue id (if any) with the state seed that rolled it, render state, acquired timestamp, origin (region seed and zone type), freshness computed lazily.

Draught item: formula hash, form (draught, salve, volatile), band, effect id and magnitude (server only), proved flag, brewer display name, brewer account id (for crime traces and Resonance), created and fade timestamps, and a server-only hidden effects list that includes poison and Mute. The client receives display fields only: color, smell line, label if proved, "a stranger's brew" flags.

Grimoire: formulas, the herbal and the house draught travel with the existing Grimoire record (9.3) and are character-bound like the rest of it.

Cellar: a per-slot inventory keyed to the rented Inn, with a grace timer on eviction (shares the larder's code path, 18.8).

Exploit checklist additions (20.3): fire Steady inputs faster than tells allow; send client-claimed bands, effects or labels; drink a draught while In Combat by racing the state change; throw a second Smoke in one engagement; throw Tar or Reek In Combat; drink a draught twice; race two sessions on one vessel; drop a vial between slots of one account; gather a mana stain from your own rupture; render an Aether reagent; forge a proved label; apply Mend to a Broken item.

Pipeline: tells, windows and agitation curves are data per virtue and per band, with animation markers like 4.2, so tuning never drifts from art. Virtue tables are one data file so a wiki can hold the overworld's virtues (intended, Design Law 3) and never a Wild roll.

## 24.17 Open Decisions and Recommended Defaults

In-combat use. DECIDED: one exception, the Smoke flask, which only breaks sight (24.4). No drink, salve or other throw is ever used In Combat. If playtests show a desperate want for a mid-fight drink, the answer is a better out-of-combat Stanch, never an in-combat restore.

Volatiles. DECIDED: keep Smoke, usable In Combat for escapes under the rules in 24.4. Recommended: ship it with the law slice (21.2), since guards are its first test, and watch whether it makes the law or Horrors trivial to escape; tighten the radius or the once-per-engagement limit before anything else. Tar and Reek stay out of combat only and OPEN.

Aether reagents. Recommended: they crumble on render and never enter a vessel. The alternative (an Aether draught with a random unlearnable effect that crumbles at the Rift) is in tone, and it is gambling. Revisit only if the Aether needs a non-combat activity.

Tainting wild ponds. Recommended: no at launch. If added later: wild ponds only, never Inn wells, with a visible tell (color, dead fish) that Foraging reads, inside 18.14 caps, expiring with the Drift state.

Poison onset delay. Recommended: none at launch. Every poison begins at the first sip, so the victim can always connect the vial to the drain.

Mute depth. Recommended: a Pure Mute poison is caught by a Mastered Palate or Nose, never undetectable. There is always a counter.

Trust XP. Recommended: keep as a small account-keyed bonus. If data shows friend-dosing loops, remove it before touching caps.

Apothecary Duty rate. Recommended: 4 Sound draughts per day covers one day's rent. Never exceeds rent.

Stanch cap. Recommended: 20% Blood over 3 minutes of play, out of combat, one at a time. Watch the Aether rescue-party survival number (10.10) and lower the cap before lowering anything else.

Mend salves. Recommended: yes, capped at 25% per item per real hour, never on Broken. If smiths' repair income collapses, halve it.

Potion effects and the Power Score. Recommended: never counted, never lower it (5.7). The freeze rule needs no change.

Rigidity among Bench attributes. Recommended: none at launch, same as the Hearth (18.18).

Infusion under the Steel Vow. Recommended: allowed, since it is cantrip-scale. Playtest whether a Blade alchemist feels too mage-like; if so, make infusion Barrier-class and forbid it.

Selling to NPCs. Recommended: never.

## 24.18 Minimum Viable Slice

Build order within the production plan (21.2): the alchemy slice lands with or just after the cooking slice, in the overworld slice, since it needs Inns, survival, profiles and the larder code path. It should ship after cooking so the two crafts are tuned against each other and feel different on day one.

Slice contents:

One Apothecary bench in the Anchor town, one field kit.

Eight reagents: three plants (one Bleed Zone Bitter), one Volatile Flora acid, one Golem salt, one Mana Beast gland, boiled water, one Drift-state reagent with a Wild virtue.

Six virtues: Quickening, Stilling, Warming, Chilling, Resonant, Bitter.

The agitation model with three bands (Calm, Rolling, Seething), Steady, Quench, Draw and the Turn. Tells with a 1.5s lead and a 1.0s window.

Five bands, Thirst per draught, and three products: Stanch, one Warding Tonic (Warmth), and one Antidote, matching the S-17 NPC set (24.19).

Prove on self and at the Apothecary. Murky labels until proved.

Nose and Nerve attributes with Novelty, Familiarity and Nerve XP and one catalyst each.

Grimoire formula cards, the herbal, and inheritance.

Mobile layout from day one, since mobile is 80% of sessions.

Deferred: Mortar and render variety, Cellar and fading, Benchkeeping and multi-vessel, salves, Volatiles (Smoke first, when the law slice ships), poisons and crime, Mute, Trust XP, Apothecary Duty, guild benches, mana stains, house draughts, cosmetics.

Success test for the slice: a playtester renders a reagent they have never seen, guesses what it is from how it steeps, rides the brew into Seething, catches the Turn, drinks the result to find out if they were right, and goes back out to find more of that reagent. If the last clause is false, the hypothesis loop is not paying, and the virtues and tells need work before anything else is added.

## 24.19 Relation to missing-systems.md (S-13 to S-18)

Kept from S-17 with one exception: no potion works In Combat (rule 1), except the Smoke flask, which is a throw that only breaks sight and restores nothing (24.4). Kept without change: no mana potion, ever (rule 2); no Soul Damage healing (rule 3); one potion per category, Meal overlap resolved by the stronger (rule 4); the 1.2s committed drink with a sound tell and weight on every potion (rule 5); Thirst from every potion (tune: 8%); Antidote with no effect on Aether poisons; NPC sale and brewing from brought herbs at launch; player brewing deferred with crafting (S-20), which is what this section specifies.

Kept from S-13 to S-16 and S-18: potions weigh and stack in the pack (S-13) and replace this section's earlier vial-rack idea; potions are chest goods and reagents are larder goods (S-14); the Aether wipe takes the shelf and the Grimoire keeps the formulas (S-15, 24.13); item GUIDs and last-holder checks cover vials and the per-slot rule (S-16); a Wellstone is the only stored mana and it only stands in for zero ambient regen (S-18), which is why 24.4 says mana in a bottle is a Wellstone, not a brew.

Changes to S-17:

Health Draught removed, Stanch added in its place. S-17's Health Draught restores 40% Health over 20 seconds out of combat. Out of combat, Health already regenerates to full in under a minute (C-01b), so in the ordinary case the draught buys a few seconds of waiting. The one case where it matters is Blood below 10%, where Health regeneration halts (3.3): there the draught refills Health while the body is still failing, which is a bypass of the survival chain, the only chain the Aether's attrition runs on. Stanch acts on Blood instead, the real bottleneck, through the chain rather than around it, out of combat and capped (24.4). If the owner wants to keep a Health Draught, the condition should be that it does nothing while Blood is under 10%, so it can never outrun the chain; this section recommends dropping it, because a draught that only shortens a wait is not worth a category.

Blood Tonic kept, renamed category. S-17 says it overlaps "the Steady meal". The v3.1 naming pass renamed that meal effect Hale (Appendix C), so the category is Hale. No rule change.

Naming. S-17 and S-18 use "Alchemist NPC" and "Mana Battery". This section uses Apothecary (so "alchemist" stays the player's word) and Wellstone (Appendix C rename). Flagged for the naming pass, not a rule change.

Launch set. S-17 ships two or three types from the NPC. This section's slice (24.18) ships Stanch, one Warding Tonic and Antidote from the bench. The NPC set and the bench set should be the same three potions, so the first player brewers are making something they have already drunk.

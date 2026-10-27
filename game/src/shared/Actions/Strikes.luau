--!strict
-- Basic Strikes (Left Click), GDD 4.13. Echelon 1 (4.12): 5 Strain, Parryable, physical,
-- single press, no strings yet. No cancel or Hold: 4.3 cancel is a spell rule, 4.11 Hold
-- covers Techniques, not Strikes.
-- skill_notes are not given in 4.13; these are drawn from the entry text (4.11 Law 6).

local Freeze = require("./Freeze")
local Rules = require("./Rules")
local Types = require("./Types")

type StrikeDef = Types.StrikeDef

local STRAIN = Rules.STRIKE_STRAIN
local REACT = Rules.HIT_REACTION

local STRIKES: { StrikeDef } = {
	{
		kind = "Strike",
		id = "strike_unarmed",
		name = "Unarmed",
		echelon = "E1",
		mana_cost = 0,
		strain_cost = STRAIN,
		startup_ms = { raw = 300, floor = 250 },
		active_ms = 80,
		recovery_ms = 250,
		parry_class = "Parryable",
		hitbox = { shape = "Box", mode = "Melee", width = 2, height = 2, depth = 4 },
		telegraph = { class_marker = "Parryable", tier = "E1", ground_decal = false, splash_marker = false },
		skill_notes = {
			mix_up = "The shortest Strike cycle; its Flinch cancels a caster's startup at close range.",
			counterplay = "Out-space its 4-stud reach, or parry it.",
		},
		hit_reaction = REACT.E1,
		damage = 3,
		physical = true,
		weapon = { weapon = "Unarmed", parries_spells = false },
	},
	{
		kind = "Strike",
		id = "strike_staff",
		name = "Basic Staff",
		echelon = "E1",
		mana_cost = 0,
		strain_cost = STRAIN,
		startup_ms = { raw = 380, floor = 250 },
		active_ms = 120,
		recovery_ms = 300,
		parry_class = "Parryable",
		hitbox = { shape = "Box", mode = "Melee", width = 2, height = 2, depth = 7 },
		telegraph = { class_marker = "Parryable", tier = "E1", ground_decal = false, splash_marker = false },
		skill_notes = {
			mix_up = "The 3-stud push opens space for a cast with no stance toggle.",
			counterplay = "The slowest Strike startup; parry it or step off its thrust line.",
		},
		hit_reaction = REACT.E1,
		damage = 3,
		physical = true,
		push = { studs = 3, through_block = false },
		weapon = { weapon = "Staff", parries_spells = false, parry_durability_melee = 1 },
	},
	{
		kind = "Strike",
		id = "strike_sword",
		name = "Basic Sword",
		echelon = "E1",
		mana_cost = 0,
		strain_cost = STRAIN,
		startup_ms = { raw = 350, floor = 250 },
		active_ms = 100,
		recovery_ms = 300,
		parry_class = "Parryable",
		hitbox = { shape = "Arc", mode = "Melee", angle_deg = 90, radius = 6 },
		telegraph = { class_marker = "Parryable", tier = "E1", ground_decal = false, splash_marker = false },
		skill_notes = {
			mix_up = "The 90-degree arc catches a short side-step.",
			counterplay = "Casting needs a 300ms stance toggle; punish the toggle, or parry the swing.",
		},
		hit_reaction = REACT.E1,
		damage = 5,
		physical = true,
		weapon = {
			weapon = "Sword",
			parries_spells = true,
			durability = 100,
			parry_durability_melee = 1,
			parry_durability_spell = 3,
			parry_durability_spell_hollow = 25,
			stance_toggle_ms = 300,
		},
	},
}

return Freeze.deep(STRIKES)

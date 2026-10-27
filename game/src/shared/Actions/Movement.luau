--!strict
-- Dash (4.3) and Step (4.12, costs 3.4). Dash may cancel recovery, never startup, and no
-- offensive action starts before the cancelled recovery would have ended (4.3).
-- skill_notes are not given for these; drawn from 4.11 (Slip), 4.9 and 3.4 (4.11 Law 6).

local Freeze = require(script.Parent.Freeze)
local Rules = require(script.Parent.Rules)
local Types = require(script.Parent.Types)

type MovementDef = Types.MovementDef

local IFRAMES = Rules.DODGE_IFRAMES_MS

local MOVEMENT: { MovementDef } = {
	{
		kind = "Movement",
		id = "dash",
		name = "Dash",
		mana_cost = 8, -- unavailable at 0 mana (4.3)
		strain_cost = 0,
		startup_ms = { raw = 0, floor = 0 },
		active_ms = 250,
		recovery_ms = 0,
		skill_notes = {
			mix_up = "A late dash is a Slip and refunds its cost (4.11).",
			counterplay = "Its 800ms cooldown; Grabs, Grounding and Root answer runners (4.9, 4.13).",
		},
		movement = { distance_studs = 12, duration_ms = 250, iframes_ms = IFRAMES, cooldown_ms = 800 },
	},
	{
		kind = "Movement",
		id = "step",
		name = "Step",
		mana_cost = 0,
		strain_cost = 12, -- 3.4; reduced by Footwork (4.10)
		startup_ms = { raw = 0, floor = 0 },
		active_ms = 250,
		recovery_ms = 0,
		skill_notes = {
			mix_up = "Paid in Strain, so it works at 0 mana.",
			counterplay = "Chained Steps cost 50% more and lead to Winded (3.4); punish the breath.",
		},
		movement = {
			distance_studs = 10,
			duration_ms = 250,
			iframes_ms = IFRAMES,
			cooldown_ms = 800, -- "the same cooldown" as Dash (4.12)
			chain_window_ms = 2000,
			chain_cost_mult = 1.5,
		},
	},
}

return Freeze.deep(MOVEMENT)

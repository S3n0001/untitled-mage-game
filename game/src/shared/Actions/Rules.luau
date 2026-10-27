--!strict
-- Shared combat rules every action reads: echelon bands and floors (4.7), the 4.13 tiers,
-- and the 4.13 shared rules. All values (tune) unless the GDD locks them.

local Freeze = require(script.Parent.Freeze)
local Types = require(script.Parent.Types)

type EchelonRule = Types.EchelonRule
type HitReaction = Types.HitReaction

-- 4.13 Unblocked hits.
local HIT_REACTION: Types.PerEchelon<HitReaction> = {
	E0 = { kind = "None", duration_ms = 0, knockback_studs = 0, grounds = false },
	E1 = { kind = "Flinch", duration_ms = 150, knockback_studs = 0, grounds = false },
	E2 = { kind = "Stagger", duration_ms = 300, knockback_studs = 4, grounds = true },
	E3 = { kind = "Knockdown", duration_ms = 800, knockback_studs = 0, grounds = true }, -- 4.10: E2+ grounds
}
Freeze.deep(HIT_REACTION)

local ECHELONS: Types.PerEchelon<EchelonRule> = {
	E0 = {
		cost_min = 1,
		cost_max = 5,
		capacity = 0,
		damage_min = 0,
		damage_max = 2,
		damage_max_exclusive = true,
		hit_cap = nil,
		startup_floor_ms = 150,
		recovery_floor_ms = 150,
		projectile_speed = 60,
		projectile_radius_max = 0.5, -- "at most 1 stud", read as diameter
		contest_ms = nil,
		sound_range = 20,
		hit_reaction = HIT_REACTION.E0,
	},
	E1 = {
		cost_min = 5,
		cost_max = 25,
		capacity = 120,
		damage_min = 3,
		damage_max = 8,
		damage_max_exclusive = false,
		hit_cap = 12,
		startup_floor_ms = 250,
		recovery_floor_ms = 200,
		projectile_speed = 120,
		projectile_radius_min = 0.5,
		projectile_radius_max = 1.25,
		contest_ms = 300,
		sound_range = 60,
		hit_reaction = HIT_REACTION.E1,
	},
	E2 = {
		cost_min = 40,
		cost_max = 120,
		capacity = 300,
		damage_min = 8,
		damage_max = 18,
		damage_max_exclusive = false,
		hit_cap = 22,
		startup_floor_ms = 450,
		recovery_floor_ms = 400,
		projectile_speed = 80,
		projectile_radius_min = 0.75,
		projectile_radius_max = 2.5,
		area_radius_max = 8,
		contest_ms = 600,
		sound_range = 120,
		hit_reaction = HIT_REACTION.E2,
	},
	E3 = {
		cost_min = 300,
		cost_max = 800,
		cost_capacity_frac = 0.4,
		capacity = 800,
		damage_min = 20,
		damage_max = 30,
		damage_max_exclusive = false,
		hit_cap = 35,
		startup_floor_ms = 900,
		recovery_floor_ms = 1500,
		projectile_speed = 40,
		area_radius_min = 15,
		area_radius_max = 25,
		contest_ms = 1200,
		sound_range = 400,
		hit_reaction = HIT_REACTION.E3,
	},
}

local Rules = {
	ECHELONS = ECHELONS,
	HIT_REACTION = HIT_REACTION,
	CANCEL = { window = "Startup", forfeit_frac = 0.5 } :: Types.CancelRule, -- 4.3, 4.13
	HOLD = { max_ms = 500, drain_frac_per_100ms = 0.05 } :: Types.HoldRule, -- 4.11, 4.13
	GRAB_STARTUP_FLOOR_MS = 400, -- 4.12; an E2 Grab takes max(450, 400)
	BEAM_HEAD_SPEED = 160, -- 4.13
	PARRY_WINDOW_MS = 200, -- 4.4, 4.6, 4.11 Law 1
	DODGE_IFRAMES_MS = 150, -- 4.3, 4.12, 4.11 Law 1
	STRIKE_STRAIN = 5, -- 3.4, 4.13
}

return Freeze.deep(Rules)

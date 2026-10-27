--!strict
-- Action registry (GDD 4.2, 4.13). Every entry is validated and deep-frozen at require time.

local Movement = require("@self/Movement")
local Rules = require("@self/Rules")
local Spells = require("@self/Spells")
local Strikes = require("@self/Strikes")
local Types = require("@self/Types")

export type ActionDef = Types.ActionDef
export type SpellDef = Types.SpellDef
export type StrikeDef = Types.StrikeDef
export type MovementDef = Types.MovementDef

type Hitbox = Types.Hitbox
type Echelon = Types.Echelon
type EchelonRule = Types.EchelonRule
type AttackDef = SpellDef | StrikeDef

local function check(ok: boolean, id: string, rule: string, section: string)
	if not ok then
		error(string.format("Actions: %s: %s (GDD %s)", id, rule, section), 0)
	end
end

local function inBand(value: number, rule: EchelonRule): boolean
	if value < rule.damage_min then
		return false
	end
	if rule.damage_max_exclusive then
		return value < rule.damage_max
	end
	return value <= rule.damage_max
end

-- Radius of round shapes; nil for Box, Arc, Cone.
local function radiusOf(hitbox: Hitbox): number?
	if hitbox.shape == "Sphere" or hitbox.shape == "Capsule" or hitbox.shape == "Cylinder" then
		return hitbox.radius
	end
	return nil
end

-- 4.13 Hitboxes. Exceptions the 4.13 data itself makes: Box projectile (e1_windslash, a
-- Slash wave) and Cone melee (e0_gust). Beam is the Torrent capsule.
local SHAPES_BY_MODE: { [string]: { [string]: boolean } } = {
	Projectile = { Sphere = true, Capsule = true, Box = true },
	Melee = { Box = true, Arc = true, Cone = true },
	Area = { Sphere = true, Cylinder = true },
	Ground = { Cylinder = true },
	Beam = { Capsule = true },
}

local function checkRadius(id: string, r: number?, min: number?, max: number?, what: string)
	if r == nil then
		return
	end
	check(min == nil or r >= min, id, `{what} radius {r} below the echelon size tier ({min})`, "4.13 Sizes")
	check(max == nil or r <= max, id, `{what} radius {r} above the echelon size tier ({max})`, "4.13 Sizes")
end

local function validateCommon(def: ActionDef)
	local id = def.id
	check(type(id) == "string" and #id > 0, tostring(id), "id must be a non-empty string", "4.2")
	check(def.mana_cost >= 0 and def.strain_cost >= 0, id, "costs must be >= 0", "4.2")
	check(def.active_ms >= 0 and def.recovery_ms >= 0, id, "active and recovery must be >= 0", "4.2")
	local s = def.startup_ms
	check(s.floor >= 0 and s.floor <= s.raw, id, `startup floor {s.floor} must be <= raw {s.raw}`, "4.13 Conventions")
	local notes = def.skill_notes
	check(#notes.mix_up > 0 and #notes.counterplay > 0, id, "skill_notes needs a mix-up and a counterplay", "4.11 Law 6")
	local cancel = def.cancel
	if cancel then
		check(cancel.window == "Startup", id, "cancel is allowed during startup only", "4.3")
		check(cancel.forfeit_frac >= 0 and cancel.forfeit_frac <= 1, id, "cancel forfeit must be a share in [0, 1]", "4.3")
	end
end

local function validateHitbox(def: AttackDef, hitbox: Hitbox, rule: EchelonRule)
	local id = def.id
	local shapes = SHAPES_BY_MODE[hitbox.mode]
	check(shapes ~= nil, id, `unknown hitbox mode {hitbox.mode}`, "4.13 Hitboxes")
	check(shapes[hitbox.shape] == true, id, `{hitbox.shape} is not a {hitbox.mode} hitbox`, "4.13 Hitboxes")
	if hitbox.mode == "Projectile" or hitbox.mode == "Beam" then
		checkRadius(id, radiusOf(hitbox), rule.projectile_radius_min, rule.projectile_radius_max, "projectile")
	elseif hitbox.mode == "Area" or hitbox.mode == "Ground" then
		checkRadius(id, radiusOf(hitbox), rule.area_radius_min, rule.area_radius_max, "area")
	end
end

local function validateAttack(def: AttackDef, element: Types.Element?, isBarrier: boolean)
	local id = def.id
	local rule = Rules.ECHELONS[def.echelon]
	check(rule ~= nil, id, `unknown echelon {def.echelon}`, "4.7")

	-- Floors (4.7). Barrier is exempt (4.6, 4.7 Echelon 0).
	if not isBarrier then
		local floor = def.startup_ms.floor
		check(floor >= rule.startup_floor_ms, id, `startup floor {floor} below the {def.echelon} floor {rule.startup_floor_ms}`, "4.7")
		if def.parry_class == "Grab" then
			check(floor >= Rules.GRAB_STARTUP_FLOOR_MS, id, `Grab startup floor {floor} below {Rules.GRAB_STARTUP_FLOOR_MS}`, "4.12")
		end
		check(
			def.recovery_ms >= rule.recovery_floor_ms,
			id,
			`recovery {def.recovery_ms} below the {def.echelon} recovery floor {rule.recovery_floor_ms}`,
			"4.7"
		)
	end

	-- Hit reaction is fixed per echelon (4.13 Unblocked hits).
	local r, want = def.hit_reaction, rule.hit_reaction
	check(
		r.kind == want.kind
			and r.duration_ms == want.duration_ms
			and r.knockback_studs == want.knockback_studs
			and r.grounds == want.grounds,
		id,
		`hit_reaction must be the {def.echelon} reaction ({want.kind})`,
		"4.13 Unblocked hits"
	)

	-- Telegraph tags are the parry class, the echelon tier and the element (4.13).
	local t = def.telegraph
	check(t.tier == def.echelon, id, "telegraph tier must match echelon", "4.13 Starter spells")
	check(t.element == element, id, "telegraph element must match element", "4.13 Starter spells")
	if not isBarrier then
		check(t.class_marker == def.parry_class, id, "telegraph class marker must match parry_class", "4.13, 4.9")
	end

	-- Hold (4.11 Hold, 4.13 shared rules): E1 and E2 spells can be held; Grabs cannot.
	local hold = def.hold
	if def.parry_class == "Grab" then
		check(hold == nil, id, "Grabs cannot be held", "4.13 Shared rules")
	elseif def.kind == "Spell" and (def.echelon == "E1" or def.echelon == "E2") then
		check(hold ~= nil, id, "Echelon 1 and 2 spells can be held", "4.13 Shared rules")
	else
		check(hold == nil, id, `{def.kind} at {def.echelon} cannot be held (E1 and E2 spells only)`, "4.11 Hold, 4.13")
	end
	if hold then
		check(hold.max_ms > 0 and hold.max_ms <= Rules.HOLD.max_ms, id, `hold max {hold.max_ms} outside (0, {Rules.HOLD.max_ms}]`, "4.11 Hold")
		check(hold.drain_frac_per_100ms > 0, id, "hold must drain", "4.11 Hold")
	end

	-- Damage band per hit (4.7), hit cap per hit (4.11 Law 3).
	local damage = def.damage
	if damage then
		check(inBand(damage, rule), id, `damage {damage} outside the {def.echelon} band`, "4.7")
		check(rule.hit_cap == nil or damage <= rule.hit_cap, id, `damage {damage} above the hit cap`, "4.11 Law 3")
	end

	local hitbox = def.hitbox
	if hitbox then
		check(def.parry_class ~= nil, id, "an action with a hitbox needs a parry_class", "4.2")
		validateHitbox(def, hitbox, rule)
	end
end

local function validateSpell(def: SpellDef)
	local id = def.id
	local rule = Rules.ECHELONS[def.echelon]
	local isBarrier = def.barrier ~= nil
	validateAttack(def, def.element, isBarrier)

	local barrier = def.barrier
	if barrier then
		check(def.element == nil, id, "Barrier carries no element", "4.13 Element ring")
		check(barrier.parry_window_ms == Rules.PARRY_WINDOW_MS, id, "the parry window is 200ms for everyone", "4.6, 4.11 Law 1")
		check(def.hitbox == nil, id, "Barrier's shell is barrier.shell_radius, not an attack hitbox", "4.13")
	else
		check(
			def.mana_cost >= rule.cost_min and def.mana_cost <= rule.cost_max,
			id,
			`mana cost {def.mana_cost} outside the {def.echelon} band {rule.cost_min} to {rule.cost_max}`,
			"4.7"
		)
		check(def.hitbox ~= nil or def.sense ~= nil, id, "a spell needs a hitbox unless it is a sense", "4.2")
	end

	local hitbox = def.hitbox
	local projectile = def.projectile
	check(
		(hitbox ~= nil and hitbox.mode == "Projectile") == (projectile ~= nil),
		id,
		"projectile rule present iff the hitbox mode is Projectile",
		"4.13 Projectile tiers"
	)
	if projectile then
		check(
			projectile.speed == rule.projectile_speed,
			id,
			`projectile speed {projectile.speed} must equal the {def.echelon} tier {rule.projectile_speed}`,
			"4.13 Projectile tiers"
		)
		local lifetime = projectile.range / projectile.speed * 1000
		check(
			math.abs(def.active_ms - lifetime) <= 1,
			id,
			`active {def.active_ms} must equal range / speed ({string.format("%.1f", lifetime)})`,
			"4.13 Conventions"
		)
	end

	local beam = def.beam
	check((hitbox ~= nil and hitbox.mode == "Beam") == (beam ~= nil), id, "beam rule present iff the hitbox mode is Beam", "4.13")
	if beam then
		check(beam.head_speed == Rules.BEAM_HEAD_SPEED, id, `beam head speed must be {Rules.BEAM_HEAD_SPEED}`, "4.13 Projectile tiers")
	end

	if hitbox and hitbox.mode == "Ground" then
		check(def.aim_range ~= nil, id, "a Ground hitbox needs aim_range", "4.13 Hitboxes")
		check(def.telegraph.ground_decal, id, "a Ground hitbox shows a decal from Telegraph_Start", "4.13 Hitboxes")
	end

	-- Multi-tick: damage band per cast, hit cap per tick (4.13 shared rules).
	local ticks = def.ticks
	if ticks then
		local total = ticks.count * ticks.damage
		check(inBand(total, rule), id, `per-cast damage {total} outside the {def.echelon} band`, "4.13 Shared rules")
		check(rule.hit_cap == nil or ticks.damage <= rule.hit_cap, id, "tick damage above the hit cap", "4.13 Shared rules")
	end

	-- Area components are Unparryable (4.2, 4.7) and sized by tier (4.13 Sizes).
	local splash = def.splash
	if splash then
		check(splash.hitbox.mode == "Area", id, "splash hitbox must be an Area", "4.13 Hitboxes")
		check(splash.parry_class == "Unparryable", id, "an area component is Unparryable", "4.2, 4.7")
		check(inBand(splash.damage, rule), id, `splash damage {splash.damage} outside the {def.echelon} band`, "4.7")
		check(SHAPES_BY_MODE.Area[splash.hitbox.shape] == true, id, "splash must be a sphere or cylinder", "4.13 Hitboxes")
		checkRadius(id, radiusOf(splash.hitbox), rule.area_radius_min, rule.area_radius_max, "area")
	end
end

local function validateStrike(def: StrikeDef)
	local id = def.id
	check(def.echelon == "E1", id, "Strikes are Echelon 1", "4.7, 4.12")
	check(def.parry_class == "Parryable", id, "every Strike is Parryable", "4.12, 4.13")
	check(def.physical, id, "every Strike is physical", "4.13")
	check(def.mana_cost == 0 and def.strain_cost == Rules.STRIKE_STRAIN, id, "every Strike costs 5 Strain and no mana", "3.4, 4.13")
	check(def.hitbox.mode == "Melee", id, "a Strike hitbox is Melee", "4.13 Hitboxes")
	validateAttack(def, nil, false)
end

local function validateMovement(def: MovementDef)
	local id = def.id
	local m = def.movement
	check(m.iframes_ms == Rules.DODGE_IFRAMES_MS, id, "dodge i-frames are 150ms for everyone", "4.11 Law 1, 4.12")
	check((def.mana_cost > 0) ~= (def.strain_cost > 0), id, "pays mana (Dash) or Strain (Step), not both", "4.3, 4.12")
	check(def.active_ms == m.duration_ms, id, "active_ms must equal the travel duration", "4.3")
	check(def.cancel == nil, id, "Dash and Step cannot be cancelled", "4.3")
	check((m.chain_window_ms == nil) == (m.chain_cost_mult == nil), id, "chain window and chain cost come as a pair", "3.4")
end

local Actions = {}

-- Errors with the id and the broken rule.
function Actions.validate(def: ActionDef)
	validateCommon(def)
	if def.kind == "Spell" then
		validateSpell(def)
	elseif def.kind == "Strike" then
		validateStrike(def)
	elseif def.kind == "Movement" then
		validateMovement(def)
	else
		error(`Actions: {(def :: any).id}: unknown kind`, 0)
	end
end

local byId: { [string]: ActionDef } = {}
local list: { ActionDef } = {}

local function register(def: ActionDef)
	Actions.validate(def)
	check(byId[def.id] == nil, def.id, "duplicate id", "4.2")
	byId[def.id] = def
	table.insert(list, def)
end

for _, def in Spells do
	register(def)
end
for _, def in Strikes do
	register(def)
end
for _, def in Movement do
	register(def)
end

-- Step uses "the same cooldown" as Dash (4.12).
do
	local dash, step = byId.dash, byId.step
	if dash and step and dash.kind == "Movement" and step.kind == "Movement" then
		check(step.movement.cooldown_ms == dash.movement.cooldown_ms, "step", "cooldown must equal Dash's", "4.12")
	end
end

table.freeze(byId)
table.freeze(list)

function Actions.get(id: string): ActionDef
	local def = byId[id]
	if def == nil then
		error(`Actions: unknown action id {id}`, 2)
	end
	return def
end

-- For untrusted ids (client intents): nil instead of an error (CONVENTIONS Networking).
function Actions.find(id: string): ActionDef?
	return byId[id]
end

function Actions.all(): { ActionDef }
	return list
end

-- Mana a cast actually costs this caster. E3 also costs at least a share of the caster's max
-- capacity (4.7), so it depends on the caster and cannot be checked in the data.
function Actions.manaCost(def: ActionDef, maxCapacity: number): number
	if def.kind == "Movement" then
		return def.mana_cost
	end
	local frac = Rules.ECHELONS[def.echelon].cost_capacity_frac
	if frac == nil then
		return def.mana_cost
	end
	return math.max(def.mana_cost, frac * maxCapacity)
end

return Actions

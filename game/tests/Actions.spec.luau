--!strict
-- Action registry: loads outside Studio, and validation rejects data that breaks the GDD rules.

local Actions = require("../src/shared/Actions")
local expect = require("./expect")

type ActionDef = Actions.ActionDef

-- `nil` in a table literal is no key at all, so removals need a marker.
local NONE = newproxy()

local function copyWith(source: { [string]: any }, overrides: { [string]: any }): { [string]: any }
	local copy: { [string]: any } = {}
	for k, v in source do
		copy[k] = v
	end
	for k, v in overrides do
		copy[k] = if v == NONE then nil else v
	end
	return copy
end

-- A known-good entry with overrides, so a case breaks exactly one rule.
local function with(id: string, overrides: { [string]: any }): ActionDef
	return copyWith(Actions.get(id) :: any, overrides) :: any
end

local function movementWith(id: string, overrides: { [string]: any }): ActionDef
	local def = Actions.get(id) :: any
	return with(id, { movement = copyWith(def.movement, overrides) })
end

-- Asserts validation fails with this message fragment, not some other broken rule.
local function rejects(def: ActionDef, fragment: string)
	local ok, err = pcall(Actions.validate, def)
	expect.eq(ok, false, `expected rejection containing "{fragment}"`)
	expect.truthy(string.find(tostring(err), fragment, 1, true), tostring(err))
end

return {
	["every registered action passes validation (4.2, 4.13)"] = function()
		local count = 0
		for _, def in Actions.all() do
			Actions.validate(def)
			count += 1
		end
		expect.truthy(count > 0, "registry is empty")
	end,

	["registry entries are frozen (4.13)"] = function()
		local def = Actions.get("e1_firebolt") :: any
		expect.truthy(table.isfrozen(def), "def")
		expect.truthy(table.isfrozen(def.hitbox), "hitbox")
		expect.truthy(table.isfrozen(Actions.all()), "list")
	end,

	["find returns nil for unknown ids, get errors (Networking)"] = function()
		expect.eq(Actions.find("not_an_action"), nil)
		expect.errors(function()
			Actions.get("not_an_action")
		end)
	end,

	["an Area hitbox above the echelon size tier is rejected (4.13 Sizes)"] = function()
		rejects(with("e2_fireball", {
			hitbox = { shape = "Sphere", mode = "Area", radius = 8.5 },
			projectile = NONE,
		}), "area radius 8.5 above the echelon size tier")
	end,

	["an Area hitbox at the echelon size tier edge is accepted (4.13 Sizes)"] = function()
		Actions.validate(with("e2_fireball", {
			hitbox = { shape = "Sphere", mode = "Area", radius = 8 },
			projectile = NONE,
		}))
	end,

	["an unknown hitbox mode fails with the action id (4.13 Hitboxes)"] = function()
		rejects(with("e1_firebolt", {
			hitbox = { shape = "Sphere", mode = "Orbit", radius = 1 },
		}), "e1_firebolt: unknown hitbox mode Orbit")
	end,

	["Step chain window and chain cost come as a pair (3.4)"] = function()
		rejects(movementWith("step", { chain_cost_mult = NONE }), "step: chain window and chain cost come as a pair")
		rejects(movementWith("dash", { chain_cost_mult = 1.5 }), "dash: chain window and chain cost come as a pair")
	end,

	["E3 costs at least 40% of the caster's max capacity (4.7)"] = function()
		local e3 = with("e2_fireball", { echelon = "E3", mana_cost = 300 })
		expect.eq(Actions.manaCost(e3, 600), 300, "listed cost wins below 750 capacity")
		expect.eq(Actions.manaCost(e3, 750), 300, "edge: 40% of 750 is exactly 300")
		expect.eq(Actions.manaCost(e3, 1000), 400, "40% of 1000 wins")
	end,

	["below E3 the listed cost is the cost (4.7)"] = function()
		expect.eq(Actions.manaCost(Actions.get("e2_fireball"), 10000), 60)
		expect.eq(Actions.manaCost(Actions.get("dash"), 10000), 8)
	end,
}

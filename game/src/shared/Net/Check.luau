--!strict
-- Argument checkers for remote schemas. Input comes from clients, so every checker takes `unknown`.

export type Checker = (value: unknown) -> boolean

local Check = {}

local function isFinite(n: number): boolean
	-- NaN fails both comparisons; +-inf fail the bound.
	return n == n and n > -math.huge and n < math.huge
end

function Check.number(value: unknown): boolean
	return type(value) == "number"
end

-- Prefer this over `number` for anything that reaches math: NaN and inf poison every comparison.
function Check.finite(value: unknown): boolean
	return type(value) == "number" and isFinite(value)
end

function Check.boolean(value: unknown): boolean
	return type(value) == "boolean"
end

function Check.string(value: unknown): boolean
	return type(value) == "string"
end

function Check.vector3(value: unknown): boolean
	return typeof(value) == "Vector3"
end

function Check.finiteVector3(value: unknown): boolean
	if typeof(value) ~= "Vector3" then
		return false
	end
	local v = value :: Vector3
	return isFinite(v.X) and isFinite(v.Y) and isFinite(v.Z)
end

-- Unbounded strings are a memory and log-spam vector.
function Check.stringMaxLen(maxLen: number): Checker
	return function(value: unknown): boolean
		return type(value) == "string" and #value <= maxLen
	end
end

function Check.optional(inner: Checker): Checker
	return function(value: unknown): boolean
		return value == nil or inner(value)
	end
end

return Check

--!strict
-- Minimal assertions for Lune specs. Each failure raises with the caller's line.

local expect = {}

local function fmt(v: unknown): string
	return if type(v) == "string" then `"{v}"` else tostring(v)
end

function expect.eq(actual: unknown, expected: unknown, label: string?)
	if actual ~= expected then
		error(`{label or "eq"}: expected {fmt(expected)}, got {fmt(actual)}`, 2)
	end
end

function expect.near(actual: number, expected: number, tolerance: number, label: string?)
	if math.abs(actual - expected) > tolerance then
		error(`{label or "near"}: expected {expected} +/- {tolerance}, got {actual}`, 2)
	end
end

function expect.truthy(v: unknown, label: string?)
	if not v then
		error(`{label or "truthy"}: got {fmt(v)}`, 2)
	end
end

function expect.errors(fn: () -> (), label: string?)
	if pcall(fn) then
		error(`{label or "errors"}: expected an error, none raised`, 2)
	end
end

return expect

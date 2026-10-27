--!strict
-- The single declaration list of remotes (CONVENTIONS.md "Networking"). Server and Client build
-- everything from this list; nothing else creates or names a remote.

local Check = require(script.Parent.Check)

export type Kind = "Event" | "UnreliableEvent"
export type Direction = "ToServer" | "ToClient"
export type RateLimit = {
	perSecond: number, -- sustained refill rate
	burst: number, -- bucket size
}
export type Declaration = {
	name: string,
	kind: Kind,
	direction: Direction,
	args: { Check.Checker },
	rateLimit: RateLimit?, -- required for ToServer
}

local Remotes = {}

Remotes.list = {
	-- Placeholder that exercises the wiring until combat remotes exist.
	{
		name = "Ping",
		kind = "Event",
		direction = "ToServer",
		args = {},
		rateLimit = { perSecond = 1, burst = 3 },
	},
} :: { Declaration }

local byName: { [string]: Declaration } = {}

-- Fail at load, not at the first bad packet.
for _, decl in Remotes.list do
	assert(byName[decl.name] == nil, `Duplicate remote "{decl.name}"`)
	if decl.direction == "ToServer" then
		local limit = decl.rateLimit
		assert(limit and limit.perSecond > 0 and limit.burst >= 1, `Remote "{decl.name}" needs a rate limit`)
	end
	byName[decl.name] = decl
end

-- Unknown names are programmer errors; level 3 blames the caller of Server/Client.
function Remotes.get(name: string): Declaration
	local decl = byName[name]
	if not decl then
		error(`Unknown remote "{name}"`, 3)
	end
	return decl
end

return Remotes

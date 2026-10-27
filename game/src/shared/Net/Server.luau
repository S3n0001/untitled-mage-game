--!strict
-- Server side of the remotes. Owns the instances, and guards every incoming call (GDD 20.3):
-- rate limit, then arg count and types. Bad calls are dropped and counted, never answered.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local Remotes = require(script.Parent.Remotes)

assert(RunService:IsServer(), "Net.Server required from the client; use Net.Client")

-- UnreliableRemoteEvent has the same API; one static type avoids un-callable unions.
type Remote = RemoteEvent
type Bucket = { tokens: number, last: number }
type Handler = (player: Player, ...any) -> ()

local Server = {}

local remotes: { [string]: Remote } = {}
local wired: { [string]: boolean } = {}
local buckets: { [Player]: { [string]: Bucket } } = {}
local rejections: { [Player]: number } = {}

do
	assert(ReplicatedStorage:FindFirstChild("Remotes") == nil, "ReplicatedStorage.Remotes already exists")
	local folder = Instance.new("Folder")
	folder.Name = "Remotes"
	for _, decl in Remotes.list do
		local remote: Remote = if decl.kind == "UnreliableEvent"
			then Instance.new("UnreliableRemoteEvent") :: any
			else Instance.new("RemoteEvent")
		remote.Name = decl.name
		remote.Parent = folder
		remotes[decl.name] = remote
	end
	-- Parent last so clients never see a half-built folder.
	folder.Parent = ReplicatedStorage
end

local function reject(player: Player)
	rejections[player] = (rejections[player] or 0) + 1
end

-- os.clock, not Clock.now: this is a local monotonic rate, nothing crosses the network.
local function takeToken(player: Player, name: string, perSecond: number, burst: number): boolean
	local perPlayer = buckets[player]
	if not perPlayer then
		perPlayer = {}
		buckets[player] = perPlayer
	end
	local now = os.clock()
	local bucket = perPlayer[name]
	if not bucket then
		bucket = { tokens = burst, last = now }
		perPlayer[name] = bucket
	end
	bucket.tokens = math.min(burst, bucket.tokens + (now - bucket.last) * perSecond)
	bucket.last = now
	if bucket.tokens < 1 then
		return false
	end
	bucket.tokens -= 1
	return true
end

-- One handler per remote, so a second connection can't double-spend the bucket.
function Server.onServerEvent(name: string, handler: Handler): RBXScriptConnection
	local decl = Remotes.get(name)
	assert(decl.direction == "ToServer", `Remote "{name}" is {decl.direction}; it has no server handler`)
	assert(not wired[name], `Remote "{name}" already has a handler`)
	wired[name] = true

	local limit = decl.rateLimit :: Remotes.RateLimit
	local schema = decl.args
	local argCount = #schema

	return remotes[name].OnServerEvent:Connect(function(player: Player, ...: unknown)
		-- Calls can land after PlayerRemoving; don't recreate state that was just cleaned up.
		if player.Parent == nil then
			return
		end
		-- Rate limit first so a flood of malformed calls still drains the bucket.
		if not takeToken(player, name, limit.perSecond, limit.burst) then
			reject(player)
			return
		end
		if select("#", ...) > argCount then
			reject(player)
			return
		end
		for i = 1, argCount do
			if not schema[i]((select(i, ...))) then
				reject(player)
				return
			end
		end
		handler(player, ...)
	end)
end

function Server.fireClient(name: string, player: Player, ...: any)
	local decl = Remotes.get(name)
	assert(decl.direction == "ToClient", `Remote "{name}" is {decl.direction}; the server can't fire it`)
	remotes[name]:FireClient(player, ...)
end

function Server.fireAllClients(name: string, ...: any)
	local decl = Remotes.get(name)
	assert(decl.direction == "ToClient", `Remote "{name}" is {decl.direction}; the server can't fire it`)
	remotes[name]:FireAllClients(...)
end

-- For review logging (GDD 4.4: review signals, never auto-action).
function Server.getRejections(player: Player): number
	return rejections[player] or 0
end

Players.PlayerRemoving:Connect(function(player: Player)
	-- Deferred so other PlayerRemoving handlers can still read the final count.
	task.defer(function()
		buckets[player] = nil
		rejections[player] = nil
	end)
end)

return Server

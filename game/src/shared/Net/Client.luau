--!strict
-- Client side of the remotes. The server creates every instance; the client only waits for them.
-- Requiring this yields until the Remotes folder replicates.

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local Remotes = require(script.Parent.Remotes)

assert(RunService:IsClient(), "Net.Client required from the server; use Net.Server")

-- UnreliableRemoteEvent has the same API; one static type avoids un-callable unions.
type Remote = RemoteEvent
type Handler = (...any) -> ()

local Client = {}

local remotes: { [string]: Remote } = {}

do
	local folder = ReplicatedStorage:WaitForChild("Remotes")
	for _, decl in Remotes.list do
		remotes[decl.name] = folder:WaitForChild(decl.name) :: any
	end
end

function Client.fireServer(name: string, ...: any)
	local decl = Remotes.get(name)
	assert(decl.direction == "ToServer", `Remote "{name}" is {decl.direction}; the client can't fire it`)
	remotes[name]:FireServer(...)
end

function Client.onClientEvent(name: string, handler: Handler): RBXScriptConnection
	local decl = Remotes.get(name)
	assert(decl.direction == "ToClient", `Remote "{name}" is {decl.direction}; it has no client handler`)
	return remotes[name].OnClientEvent:Connect(handler)
end

return Client

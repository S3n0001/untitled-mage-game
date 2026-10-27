--!strict
-- Example system: proves the loader and Net wiring end to end. Delete once real systems exist.

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Server = require(ReplicatedStorage.Shared.Net.Server)

local PingSystem = {}

function PingSystem.Init()
	Server.onServerEvent("Ping", function(player: Player)
		print(`[PingSystem] Ping from {player.Name}`)
	end)
end

return PingSystem

--!strict
-- Example system: proves the loader and Net wiring end to end. Delete once real systems exist.

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Client = require(ReplicatedStorage.Shared.Net.Client)

local PingSystem = {}

function PingSystem.Start()
	Client.fireServer("Ping")
end

return PingSystem

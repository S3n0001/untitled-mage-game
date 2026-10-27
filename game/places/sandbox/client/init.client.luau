--!strict
-- The only LocalScript. Loads every module in Systems/ (CONVENTIONS.md "Systems").

local ReplicatedStorage = game:GetService("ReplicatedStorage")

require(ReplicatedStorage.Shared.Systems).run(script.Systems)

--!strict
-- The only server Script. Loads every module in Systems/ (CONVENTIONS.md "Systems").

local ReplicatedStorage = game:GetService("ReplicatedStorage")

require(ReplicatedStorage.Shared.Systems).run(script.Systems)

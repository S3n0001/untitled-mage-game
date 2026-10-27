--!strict
-- Deep table.freeze. Already-frozen subtables (shared rule tables) are skipped.

local function deep<T>(value: T): T
	local t: any = value
	if type(t) == "table" and not table.isfrozen(t) then
		for _, child in t do
			deep(child)
		end
		table.freeze(t)
	end
	return value
end

return { deep = deep }

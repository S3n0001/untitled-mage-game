--!strict
-- The only LocalScript. Loads every module in Systems/ (CONVENTIONS.md "Systems").

type System = {
	Init: (() -> ())?,
	Start: (() -> ())?,
}

-- Red in the output with a trace, without halting the loader.
local function report(name: string, phase: string, err: unknown)
	task.spawn(error, `[Systems] {name}.{phase} failed: {err}`, 0)
end

local modules: { ModuleScript } = {}
for _, child in script.Systems:GetChildren() do
	if child:IsA("ModuleScript") then
		table.insert(modules, child)
	end
end
table.sort(modules, function(a, b)
	return a.Name < b.Name
end)

local ready: { System } = {}
for _, module in modules do
	local ok, result = xpcall(function(): System
		local system = (require :: any)(module) :: System
		if system.Init then
			system.Init()
		end
		return system
	end, debug.traceback)
	if ok then
		table.insert(ready, result)
	else
		-- A broken Init leaves the system half-set-up; skip its Start.
		report(module.Name, "Init", result)
	end
end

for _, system in ready do
	if system.Start then
		task.spawn(system.Start)
	end
end

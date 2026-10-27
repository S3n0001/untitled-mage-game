--!strict
-- Lune test runner: runs every *.spec.luau under tests/. A spec returns { [name]: () -> () }.
-- Usage: lune run tests/run.luau [filter]

local fs = require("@lune/fs")
local process = require("@lune/process")

local filter = process.args[1]
local passed, failed = 0, 0

local function walk(dir: string, out: { string })
	for _, name in fs.readDir(dir) do
		local path = `{dir}/{name}`
		if fs.isDir(path) then
			walk(path, out)
		elseif string.match(name, "%.spec%.luau$") then
			table.insert(out, path)
		end
	end
end

local specs = {}
walk("tests", specs)
table.sort(specs)

for _, path in specs do
	if filter and not string.find(path, filter, 1, true) then
		continue
	end
	-- Paths are relative to this file, so strip the leading "tests/".
	local loaded, cases = pcall(require :: any, "./" .. string.sub(path, 7, -6))
	if not loaded or type(cases) ~= "table" then
		failed += 1
		local why = if loaded then `returned {typeof(cases)}, not a table of cases` else tostring(cases)
		print(`FAIL {path} :: (load)\n    {why}`)
		continue
	end
	local names = {}
	for name in cases do
		table.insert(names, name)
	end
	table.sort(names)
	for _, name in names do
		local ok, err = pcall(cases[name])
		if ok then
			passed += 1
		else
			failed += 1
			print(`FAIL {path} :: {name}\n    {err}`)
		end
	end
end

print(`{passed} passed, {failed} failed`)
-- Zero cases is a failure: a filter typo or a misnamed spec must not read as green.
if passed + failed == 0 then
	print(if filter then `no cases matched "{filter}"` else "no specs found under tests/")
	process.exit(1)
end
process.exit(if failed > 0 then 1 else 0)

# Code Conventions

The contract every system follows. Change it here first, then in code.

## Layout

The game is several Roblox places (GDD 19.1) sharing one codebase. Each place has a
`<place>.project.json` at the root of `game/` and a folder under `places/`.

```
src/shared/                  -> ReplicatedStorage.Shared, in every place
  Clock.luau                 shared time helpers
  Net/                       remote declarations and the client/server wrappers
  Actions/                   action data model (GDD 4.2, 4.13): types, data, registry
places/<place>/server/       -> ServerScriptService.Server
  init.server.luau           the only server Script: loads Systems/
  Systems/                   one ModuleScript per server system
places/<place>/client/       -> StarterPlayerScripts.Client
  init.client.luau           the only LocalScript: loads Systems/
  Systems/                   one ModuleScript per client system
```

Places: `sandbox` (combat sandbox, dev only, never ships). Planned: `menu` (start place, the only
gate that loads characters), `overworld`, `aether`. Code used by more than one place goes in
`src/shared`; never require across places.

No other Scripts or LocalScripts. New behavior is a module under `Systems/`.
`scripts/analyze.sh` checks every `*.project.json`.

## Modules

- `--!strict` at the top of every file. luau-lsp must report zero errors (`game/scripts/analyze.sh`).
- Files are `.luau`. Folder modules use `init.luau`.
- Names: modules and types `PascalCase`, functions and locals `camelCase`, constants `UPPER_SNAKE`.
  Data ids follow the GDD exactly (`e1_firebolt`, `strike_unarmed`).
- Times are milliseconds in data (`startup_ms`), seconds in runtime code. Convert at the boundary
  with `Clock.ms`.

## Systems

A system module returns a table with optional `Init` and `Start`:

```luau
local MySystem = {}

function MySystem.Init() end   -- called in name order; set up state, connect nothing that yields
function MySystem.Start() end  -- called after every Init, each in its own task.spawn

return MySystem
```

Systems reach each other with plain `require`. No service locator.

## Time

- `Clock.now()`: `workspace:GetServerTimeNow()`. Synchronized on server and client. Every timestamp
  that crosses the network or is compared against a window uses this.
- Never compare tick or frame counts (GDD 4.4). Never trust a client timestamp raw.

## Networking

- Every remote is declared once in `Shared/Net/Remotes.luau` with an argument schema.
- The server creates the instances; the client only waits for them.
- Every server handler is wrapped: argument types and counts checked, per-player rate limit
  applied. Bad calls are dropped silently and counted, never errored back (GDD 20.3).
- Clients send intent (pressed F, cast e1_firebolt at aim), never results (hit, damage, mana).

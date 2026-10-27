# Code Conventions

The contract every system follows. Change it here first, then in code.

## Layout

The game is several Roblox places (GDD 19.1) sharing one codebase. Each place has a
`<place>.project.json` at the root of `game/` and a folder under `places/`.

```
src/shared/                  -> ReplicatedStorage.Shared, in every place
  Clock.luau                 shared time helpers
  Systems.luau               the system loader every place's init script calls
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

## Pure combat logic (`src/shared/Combat/`)

The rules that decide outcomes (timing, mana, states, hit resolution) are pure modules, so they
are tested with Lune outside Studio and shared by server and client prediction.

- No Roblox globals or services: no `game`, `workspace`, `task`, `os.clock`, `Instance`. Time is
  always a parameter (`now: number`, seconds, the `Clock.now()` timeline). Geometry uses the
  Luau `vector` library, which is Roblox's Vector3.
- Require siblings with relative string paths (`require("./Mana")`). Flat files, no `init.luau`.
  `Shared/Actions` is reachable as `require("../Actions")`.
- No hidden state: modules export constructors (`Mana.new(...)`) and functions over plain tables.
- Numbers marked (tune) in the GDD live in one constants table per module, with the GDD section.

## Tests

- Specs live in `tests/`, mirroring `src/`, named `<Module>.spec.luau`. A spec returns
  `{ [case name]: () -> () }` and uses `tests/expect.luau`.
- `scripts/test.sh [filter]` runs them with Lune. Case names state the rule, citing the GDD
  section: `"parry succeeds when input is exactly 200ms before hit (4.4)"`.
- Test window edges both sides, and every ordering rule.

## Networking

- Every remote is declared once in `Shared/Net/Remotes.luau` with an argument schema.
- The server creates the instances; the client only waits for them.
- Every server handler is wrapped: argument types and counts checked, per-player rate limit
  applied. Bad calls are dropped silently and counted, never errored back (GDD 20.3).
- Clients send intent (pressed F, cast e1_firebolt at aim), never results (hit, damage, mana).

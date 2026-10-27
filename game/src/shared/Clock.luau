--!strict
-- One clock for anything that crosses the network or is compared against a window (GDD 4.4).

local Clock = {}

function Clock.now(): number
	return workspace:GetServerTimeNow()
end

-- Data is authored in milliseconds; runtime code works in seconds.
function Clock.ms(n: number): number
	return n / 1000
end

return Clock

#!/usr/bin/env bash
# Type-check and lint all game code with luau-lsp. Run from anywhere.
# Shared code (src/) is checked once, with the first place's sourcemap; it maps to
# ReplicatedStorage.Shared in every place. Each place's own folder is checked with its sourcemap.
set -euo pipefail
cd "$(dirname "$0")/.."

status=0
shared_done=0
for project in *.project.json; do
	place="${project%.project.json}"
	echo "== $place =="
	# rojo sourcemap fails on a missing $path, and git drops empty folders; say which one.
	for side in server client; do
		if [ ! -d "places/$place/$side" ]; then
			echo "places/$place/$side is missing (add a .gitkeep to keep an empty folder in git)" >&2
			status=1
			continue 2
		fi
	done
	rojo sourcemap "$project" --output "sourcemap.$place.json"
	targets=("places/$place")
	if [ "$shared_done" -eq 0 ]; then
		targets=(src "${targets[@]}")
		shared_done=1
	fi
	luau-lsp analyze \
		--platform=roblox \
		--sourcemap="sourcemap.$place.json" \
		--definitions=@roblox=types/globalTypes.d.luau \
		"${targets[@]}" || status=1
done
exit $status

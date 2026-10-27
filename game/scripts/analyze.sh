#!/usr/bin/env bash
# Type-check and lint all game code with luau-lsp, one pass per place. Run from anywhere.
set -euo pipefail
cd "$(dirname "$0")/.."

status=0
for project in *.project.json; do
	place="${project%.project.json}"
	echo "== $place =="
	rojo sourcemap "$project" --output "sourcemap.$place.json"
	luau-lsp analyze \
		--platform=roblox \
		--sourcemap="sourcemap.$place.json" \
		--definitions=@roblox=types/globalTypes.d.luau \
		src "places/$place" || status=1
done
exit $status

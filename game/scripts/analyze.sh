#!/usr/bin/env bash
# Type-check and lint all game code with luau-lsp. Run from anywhere.
set -euo pipefail
cd "$(dirname "$0")/.."

if [ -z "$(find src -name '*.luau' -o -name '*.lua' | head -1)" ]; then
	echo "No Luau files in src yet; nothing to analyze."
	exit 0
fi

rojo sourcemap default.project.json --output sourcemap.json
luau-lsp analyze \
	--platform=roblox \
	--sourcemap=sourcemap.json \
	--definitions=@roblox=types/globalTypes.d.luau \
	src

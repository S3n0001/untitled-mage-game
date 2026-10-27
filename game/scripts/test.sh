#!/usr/bin/env bash
# Run the Lune specs under tests/. Optional arg filters by path substring.
set -euo pipefail
cd "$(dirname "$0")/.."
lune run tests/run.luau "$@"

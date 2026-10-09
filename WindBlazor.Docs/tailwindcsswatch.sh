#!/bin/sh
set -eu

# Run from anywhere; resolve input/output relative to this script.
cd "$(dirname "$0")"
echo "WindBlazor Docs — Tailwind CSS v4 watcher"
tailwindcss -i ./wwwroot/css/tailwind.css -o ./wwwroot/css/app.css --watch

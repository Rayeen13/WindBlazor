#!/bin/sh
set -eu
cd "$(dirname "$0")"
echo "WindBlazor Website - Tailwind CSS v4 watcher"
tailwindcss -i ./wwwroot/css/tailwind.css -o ./wwwroot/css/site.css --watch

#!/bin/bash
# Lusion site local server.
# Double-click this file (macOS) or run it in a terminal.
#
# IMPORTANT: the site is a single-page app that must be served from its own
# root, so this serves the "lusion.co" folder as "/" and opens it.

cd "$(dirname "$0")/lusion.co" || { echo "Cannot find the lusion.co folder."; exit 1; }

PORT=8000
# If the port is busy, step to the next free one.
while lsof -i :"$PORT" >/dev/null 2>&1; do
  PORT=$((PORT + 1))
done

URL="http://localhost:${PORT}/"
echo "Serving the Lusion site at:"
echo "  $URL"
echo ""
echo "An internet connection is needed (3D assets stream from Lusion's CDN)."
echo "Leave this window open while you browse. Press Ctrl+C to stop."

( sleep 1; open "$URL" ) &

exec python3 -m http.server "$PORT"

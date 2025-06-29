#!/bin/bash

COVER_PATH="/tmp/cover.jpg"

# Get track info
track=$(osascript -e 'tell application "Spotify" to get name of current track')
artist=$(osascript -e 'tell application "Spotify" to get artist of current track')
MEDIA="$track - $artist"

echo "spot $MEDIA" >> /tmp/sketchybar_debug.log

# Update text/label
sketchybar --set $NAME label="$MEDIA"

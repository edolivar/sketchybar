#!/bin/bash

COVER_PATH="/tmp/cover.jpg"

# Check if Spotify is running
if ! pgrep -x "Spotify" > /dev/null; then
    sketchybar --set $NAME label=""
    sketchybar --set spotify.cover background.image="" background.color=0x00000000
    exit 0
fi

# Get track info with error handling
track=$(osascript -e 'tell application "Spotify" to get name of current track' 2>/dev/null)
artist=$(osascript -e 'tell application "Spotify" to get artist of current track' 2>/dev/null)

# Update track info
if [[ -n "$track" && -n "$artist" ]]; then
    MEDIA="$track - $artist"
    sketchybar --set $NAME label="$MEDIA"

    # Get and download album cover
    cover_url=$(osascript -e 'tell application "Spotify" to get artwork url of current track' 2>/dev/null)

    if [[ -n "$cover_url" ]]; then
        # Download cover image with fallback
        if curl -s --max-time 5 "$cover_url" -o "$COVER_PATH" 2>/dev/null; then
            sketchybar --set spotify.cover background.image="$COVER_PATH" \
                                       background.color=0x00000000 \
                                       background.drawing=on \
                       --set $NAME icon.drawing=off
        else
            # Fallback if download fails - show icon instead
            sketchybar --set spotify.cover background.image="" \
                                          background.color=0x00000000 \
                                          background.drawing=off \
                       --set $NAME icon.drawing=on
        fi
    else
        # No cover URL available - show icon instead
        sketchybar --set spotify.cover background.image="" \
                                      background.color=0x00000000 \
                                      background.drawing=off \
                   --set $NAME icon.drawing=on
    fi
else
    sketchybar --set $NAME label="" icon.drawing=on
    sketchybar --set spotify.cover background.image="" background.color=0x00000000
fi

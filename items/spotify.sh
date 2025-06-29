#!/bin/bash
SPOTIFY_EVENT="com.spotify.client.PlaybackStateChanged"
sketchybar --add event spotify_change $SPOTIFY_EVENT \
           --add item media e \
           --set media label.color=$ACCENT_COLOR \
                       label.max_chars=20 \
                       icon.padding_left=10 \
                       scroll_texts=on \
                       icon=􀑪             \
                       icon.color=$ACCENT_COLOR   \
                       icon.background.corner_radius=4 \
                       background.drawing=off \
                       script="$PLUGIN_DIR/spotify.sh" \
           --subscribe media media_change spotify_change

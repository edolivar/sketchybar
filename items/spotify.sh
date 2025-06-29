#!/bin/bash

SPOTIFY_EVENT="com.spotify.client.PlaybackStateChanged"

sketchybar --add event spotify_change $SPOTIFY_EVENT \
           --add item spotify.cover e \
           --set spotify.cover background.image.corner_radius=2 \
                              background.image.scale=0.03 \
                              background.padding_left=12 \
                              background.padding_right=5 \
                              width=12 \
                              height=12 \
                              background.drawing=off \
           --add item media e \
           --set media label.color=$ACCENT_COLOR \
                       label.max_chars=20 \
                       label.padding_left=20 \
                       icon.padding_left=5 \
                       scroll_texts=on \
                       icon=􀑪 \
                       icon.color=$ACCENT_COLOR \
                       icon.background.corner_radius=4 \
                       background.drawing=off \
                       script="$PLUGIN_DIR/spotify.sh" \
           --subscribe media media_change spotify_change

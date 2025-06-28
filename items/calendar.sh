#!/bin/bash

sketchybar --add item calendar right \
           --set calendar icon=􀧞  \
                          background.color=$BLACK       \
                          update_freq=30 \
                          script="$PLUGIN_DIR/calendar.sh"

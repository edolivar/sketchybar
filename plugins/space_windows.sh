#!/bin/bash

if [ "$SENDER" = "space_windows_change" ]; then
echo "=== DEBUG START ===" >> /tmp/sketchybar_debug.log1
echo "ITEM_WORKSPACE_ID: '$INFO'" >> /tmp/sketchybar_debug.log
space="$(echo "$INFO" | jq -r '.space')"
apps="$(echo "$INFO" | jq -r '.apps | keys[]')"
echo "space: '$space'" >> /tmp/sketchybar_debug.log
echo "apps: '$apps'" >> /tmp/sketchybar_debug.log

  # icon_strip=" "
  # if [ "${apps}" != "" ]; then
  #   while read -r app
  #   do
  #     icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
  #   done <<< "${apps}"
  # else
  #   icon_strip=" —"
  # fi

  # sketchybar --set space.$space label="$icon_strip"
fi

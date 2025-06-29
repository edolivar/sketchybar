#!/usr/bin/env bash
# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh
# echo "ITEM_WORKSPACE_ID: '$1'" >> /tmp/sketchybar_debug.log
ITEM_WORKSPACE_ID="$1"
ITEM_NAME="space.$ITEM_WORKSPACE_ID"
display_icon=""
label_drawing="off"
icon_drawing="off"
FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)


apps=$(aerospace list-windows --workspace "$ITEM_WORKSPACE_ID" --format '%{app-name}' 2>/dev/null | sort -u)

if [ -n "$apps" ] && [ "$apps" != "" ]; then
    # Get icons for each app using your icon mapping function
    app_icons=""
    while IFS= read -r app; do
        if [ -n "$app" ] && [ "$app" != "" ]; then
            icon=$($CONFIG_DIR/plugins/icon_map_fn.sh "$app")
            # Debug: uncomment next line to see what icons are being returned
            # echo "App: '$app', Icon: '$icon'" >> /tmp/sketchybar_debug.log
            if [ -n "$icon" ] && [ "$icon" != "" ]; then
                # Add spacing between icons - you can adjust the number of spaces
                if [ -n "$app_icons" ]; then
                    app_icons="$app_icons  $icon"  # Two spaces between icons
                else
                    app_icons="$icon"
                fi
            fi
        fi
    done <<< "$apps"

    if [ -n "$app_icons" ] && [ "$app_icons" != "" ]; then
        display_icon="$app_icons"
        icon_drawing="on"    # Show icons when there are apps
        label_drawing="off"  # Hide label when there are apps
    else
        icon_drawing="off"   # Hide icons when no app icons found
        label_drawing="on"   # Show label when no app icons
    fi
else
    icon_drawing="off"       # Hide icons when no apps
    label_drawing="on"       # Show label when no apps
fi

sketchybar --set "$ITEM_NAME" \
    icon="$display_icon" \
    icon.drawing="$icon_drawing" \
    label="$ITEM_WORKSPACE_ID" \
    label.drawing="$label_drawing"

if [ "$ITEM_WORKSPACE_ID" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.drawing=on
else
    sketchybar --set $NAME background.drawing=off
fi

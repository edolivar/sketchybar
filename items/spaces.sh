source "$CONFIG_DIR/colors.sh"
sketchybar --add event aerospace_workspace_change

# Get the currently focused workspace

for sid in $(aerospace list-workspaces --all); do
        sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
        background.color=$ITEM_BG_COLOR \
        background.corner_radius=5 \
        background.height=25 \
        background.drawing=$INITIAL_BG_DRAWING \
        label="$sid" \
        icon="" \
        icon.font="sketchybar-app-font:Regular:16.0"\
        click_script="aerospace workspace $sid" \
        update_freq=2 \
        script="$CONFIG_DIR/plugins/aerospace.sh $sid"
done

echo "Add right-click terminal action to waybar hiarchy menu icon"

WAYBAR_CONFIG="$HOME/.config/waybar/config.jsonc"

if [[ -f "$WAYBAR_CONFIG" ]] && ! grep -A5 '"custom/hiarchy"' "$WAYBAR_CONFIG" | grep -q '"on-click-right"'; then
  sed -i '/"on-click": "hiarchy-menu",/a\    "on-click-right": "hiarchy-launch-terminal",' "$WAYBAR_CONFIG"
fi

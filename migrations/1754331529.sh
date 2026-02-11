echo "Update Waybar for new Hiarchy menu"

if ! grep -q "" ~/.config/waybar/config.jsonc; then
  hiarchy-refresh-waybar
fi

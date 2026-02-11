echo "Update Waybar config to fix path issue with update-available icon click"

if grep -q "alacritty --class Hiarchy --title Hiarchy -e hiarchy-update" ~/.config/waybar/config.jsonc; then
  sed -i 's|\("on-click": "alacritty --class Hiarchy --title Hiarchy -e \)hiarchy-update"|\1hiarchy-update"|' ~/.config/waybar/config.jsonc
  hiarchy-restart-waybar
fi

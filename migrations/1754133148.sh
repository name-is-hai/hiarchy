echo "Update Waybar CSS to dim unused workspaces"

if ! grep -q "#workspaces button\.empty" ~/.config/waybar/style.css; then
  hiarchy-refresh-config waybar/style.css
  hiarchy-restart-waybar
fi

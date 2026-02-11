echo "Replace bluetooth GUI with TUI"

hiarchy-pkg-add bluetui
hiarchy-pkg-drop blueberry

if ! grep -q "hiarchy-launch-bluetooth" ~/.config/waybar/config.jsonc; then
  sed -i 's/blueberry/hiarchy-launch-bluetooth/' ~/.config/waybar/config.jsonc
fi

echo "Replace volume control GUI with a TUI"

if hiarchy-cmd-missing wiremix; then
  hiarchy-pkg-add wiremix
  hiarchy-pkg-drop pavucontrol
  hiarchy-refresh-applications
  hiarchy-refresh-waybar
fi

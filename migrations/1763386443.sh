echo "Uniquely identify terminal apps with custom app-ids using hiarchy-launch-tui"

# Replace terminal -e calls with hiarchy-launch-tui in bindings
sed -i 's/\$terminal -e \([^ ]*\)/hiarchy-launch-tui \1/g' ~/.config/hypr/bindings.conf

# Update waybar to use hiarchy-launch-or-focus with hiarchy-launch-tui for TUI apps
sed -i 's|xdg-terminal-exec btop|hiarchy-launch-or-focus-tui btop|' ~/.config/waybar/config.jsonc
sed -i 's|xdg-terminal-exec --app-id=com\.hiarchy\.Wiremix -e wiremix|hiarchy-launch-or-focus-tui wiremix|' ~/.config/waybar/config.jsonc

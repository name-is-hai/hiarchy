echo "Start screensaver automatically after 1 minute and stop before locking"

if ! grep -q "hiarchy-launch-screensaver" ~/.config/hypr/hypridle.conf; then
  hiarchy-refresh-hypridle
  hiarchy-refresh-hyprlock
fi

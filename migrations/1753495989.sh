echo "Allow updating of timezone by right-clicking on the clock (or running hiarchy-cmd-tzupdate)"

if hiarchy-cmd-missing tzupdate; then
  bash "$HIARCHY_PATH/install/config/timezones.sh"
  hiarchy-refresh-waybar
fi

echo "Use explicit timezone selector when right-clicking on clock"

sed -i 's/hiarchy-cmd-tzupdate/hiarchy-launch-floating-terminal-with-presentation hiarchy-tz-select/g' ~/.config/waybar/config.jsonc

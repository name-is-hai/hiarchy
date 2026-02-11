echo "Install Impala as new wifi selection TUI"

if hiarchy-cmd-missing impala; then
  hiarchy-pkg-add impala
  hiarchy-refresh-waybar
fi

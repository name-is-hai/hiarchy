echo "Install swayOSD to show volume status"

if hiarchy-cmd-missing swayosd-server; then
  hiarchy-pkg-add swayosd
  setsid uwsm-app -- swayosd-server &>/dev/null &
fi

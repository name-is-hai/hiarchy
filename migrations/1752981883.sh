echo "Replace wofi with walker as the default launcher"

if hiarchy-cmd-missing walker; then
  hiarchy-pkg-add walker-bin libqalculate

  hiarchy-pkg-drop wofi
  rm -rf ~/.config/wofi

  mkdir -p ~/.config/walker
  cp -r ~/.local/share/hiarchy/config/walker/* ~/.config/walker/
fi

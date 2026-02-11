echo "Adding Hiarchy version info to fastfetch"
if ! grep -q "hiarchy" ~/.config/fastfetch/config.jsonc; then
  cp ~/.local/share/hiarchy/config/fastfetch/config.jsonc ~/.config/fastfetch/
fi

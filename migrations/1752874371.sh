echo "Add Catppuccin Latte light theme"

if [[ ! -L "~/.config/hiarchy/themes/catppuccin-latte" ]]; then
  ln -snf ~/.local/share/hiarchy/themes/catppuccin-latte ~/.config/hiarchy/themes/
fi

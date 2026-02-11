echo "Add the new ristretto theme as an option"

if [[ ! -L ~/.config/hiarchy/themes/ristretto ]]; then
  ln -nfs ~/.local/share/hiarchy/themes/ristretto ~/.config/hiarchy/themes/
fi

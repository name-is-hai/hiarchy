echo "Add the new Flexoki Light theme"

if [[ ! -L ~/.config/hiarchy/themes/flexoki-light ]]; then
  ln -nfs ~/.local/share/hiarchy/themes/flexoki-light ~/.config/hiarchy/themes/
fi

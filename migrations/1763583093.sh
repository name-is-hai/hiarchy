echo "Make ethereal available as new theme"

if [[ ! -L ~/.config/hiarchy/themes/ethereal ]]; then
  rm -rf ~/.config/hiarchy/themes/ethereal
  ln -nfs ~/.local/share/hiarchy/themes/ethereal ~/.config/hiarchy/themes/
fi

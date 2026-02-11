echo "Make hackerman available as new theme"

if [[ ! -L ~/.config/hiarchy/themes/hackerman ]]; then
  rm -rf ~/.config/hiarchy/themes/hackerman
  ln -nfs ~/.local/share/hiarchy/themes/hackerman ~/.config/hiarchy/themes/
fi

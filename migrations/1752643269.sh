echo "Add new matte black theme"

if [[ ! -L "~/.config/hiarchy/themes/matte-black" ]]; then
  ln -snf ~/.local/share/hiarchy/themes/matte-black ~/.config/hiarchy/themes/
fi

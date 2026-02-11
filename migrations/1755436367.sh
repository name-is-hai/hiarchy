echo "Add minimal starship prompt to terminal"

if hiarchy-cmd-missing starship; then
  hiarchy-pkg-add starship
  cp $HIARCHY_PATH/config/starship.toml ~/.config/starship.toml
fi

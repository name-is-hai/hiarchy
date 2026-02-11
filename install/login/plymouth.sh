if [ "$(plymouth-set-default-theme)" != "hiarchy" ]; then
  sudo cp -r "$HOME/.local/share/hiarchy/default/plymouth" /usr/share/plymouth/themes/hiarchy/
  sudo plymouth-set-default-theme hiarchy
fi

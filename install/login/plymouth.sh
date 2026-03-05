if [ "$(plymouth-set-default-theme)" != "hiarchy" ]; then
  sudo mkdir -p /usr/share/plymouth/themes
  sudo ln -snf "$HIARCHY_PATH/default/plymouth/" "/usr/share/plymouth/themes/hiarchy/"
  sudo plymouth-set-default-theme hiarchy
fi

if [ "$(plymouth-set-default-theme)" != "hiarchy" ]; then
  sudo ln -snf "$HIARCHY_PATH/default/plymouth/" "/usr/share/plymouth/themes/hiarchy/"
  sudo plymouth-set-default-theme hiarchy
fi

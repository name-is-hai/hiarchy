# Ensure HIARCHY_PATH is set
HIARCHY_PATH="${HIARCHY_PATH:-$HOME/.local/share/hiarchy}"

if [ "$(plymouth-set-default-theme)" != "hiarchy" ]; then
  sudo rm -rf /usr/share/plymouth/themes/hiarchy
  sudo ln -sf "$HIARCHY_PATH/default/plymouth" /usr/share/plymouth/themes/hiarchy
  sudo plymouth-set-default-theme hiarchy
fi

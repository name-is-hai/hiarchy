if [[ -n ${HIARCHY_ONLINE_INSTALL:-} ]]; then
  # Install build tools
  sudo pacman -S --needed --noconfirm base-devel
  sudo ln -snf "$HIARCHY_PATH/default/pacman/pacman-stable.conf" "/etc/pacman.conf"

  # Refresh all repos
  sudo pacman -Syyu --noconfirm
fi

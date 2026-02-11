if [[ -n ${HIARCHY_ONLINE_INSTALL:-} ]]; then
  # Install build tools
  sudo pacman -S --needed --noconfirm base-devel

  # Configure pacman
  if [[ ${HIARCHY_MIRROR:-} == "edge" ]] ; then
    sudo cp -f ~/.local/share/hiarchy/default/pacman/pacman-edge.conf /etc/pacman.conf
    sudo cp -f ~/.local/share/hiarchy/default/pacman/mirrorlist-edge /etc/pacman.d/mirrorlist
  else
    sudo cp -f ~/.local/share/hiarchy/default/pacman/pacman-stable.conf /etc/pacman.conf
    sudo cp -f ~/.local/share/hiarchy/default/pacman/mirrorlist-stable /etc/pacman.d/mirrorlist
  fi

  sudo pacman-key --recv-keys 40DFB630FF42BCFFB047046CF0134EE680CAC571 --keyserver keys.openpgp.org
  sudo pacman-key --lsign-key 40DFB630FF42BCFFB047046CF0134EE680CAC571

  sudo pacman -Sy
  sudo pacman -S --noconfirm --needed hiarchy-keyring


  # Refresh all repos
  sudo pacman -Syyu --noconfirm
fi

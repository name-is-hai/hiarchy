# Install all base packages
mapfile -t packages < <(grep -v '^#' "$HIARCHY_INSTALL/hiarchy-base.packages" | grep -v '^$')
sudo pacman -S --noconfirm --needed "${packages[@]}"

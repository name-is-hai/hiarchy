# Install all base packages
mapfile -t packages < <(grep -v '^#' "$HIARCHY_INSTALL/hiarchy-base.packages" | grep -v '^$')
yay -S --noconfirm --needed "${packages[@]}"
mapfile -t packages < <(grep -v '^#' "$HIARCHY_INSTALL/hiarchy-other.packages" | grep -v '^$')
yay -S --noconfirm --needed "${packages[@]}"

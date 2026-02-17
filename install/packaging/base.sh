# Install all base packages
mapfile -t packages < <(grep -v '^#' "$HIARCHY_INSTALL/hiarchy-base.packages" | grep -v '^$')

# Check if 'rust' is installed. If so, remove it to allow 'rustup' to take over.
# We use -Rdd to force removal without breaking dependencies temporarily.
if pacman -Qi rust &>/dev/null; then
    echo "Detected conflicting 'rust' package. Removing it to allow 'rustup' installation..."
    sudo pacman -Rdd rust --noconfirm
fi

# Corrected '-Sc' (clean cache) to '-S' (install)
yay -S --noconfirm --needed "${packages[@]}"

mapfile -t packages < <(grep -v '^#' "$HIARCHY_INSTALL/hiarchy-other.packages" | grep -v '^$')
# Corrected '-Sc' (clean cache) to '-S' (install)
yay -S --noconfirm --needed "${packages[@]}"

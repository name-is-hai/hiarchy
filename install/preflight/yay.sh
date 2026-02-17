# Exit immediately if yay is already installed
if command -v yay >/dev/null 2>&1; then
  echo "yay is already installed. Nothing to do."
  exit 0
fi

# Move to home directory
cd ~/

# Clone the repository
git clone https://aur.archlinux.org/yay.git

# Change ownership so your user can build it (makepkg cannot be run as root)
sudo chown -R "$(whoami)":"$(whoami)" ./yay

# Navigate into the folder
cd yay

# Build and install
makepkg -si --noconfirm
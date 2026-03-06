# Exit immediately if yay is already installed
if command -v yay >/dev/null 2>&1; then
  echo "yay is already installed. Nothing to do."
  exit 0
fi

# Move to home directory
cd ~/ || exit

# Clone the repository
git clone https://aur.archlinux.org/yay.git

# Navigate into the folder
cd yay || exit

# Build and install
makepkg -si --noconfirm

if
  command -v yay 2 >/dev/null &
  1
then
  rm -r ~/yay
fi

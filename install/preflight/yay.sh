# Move to a temporary directory (like /opt or your home folder)
cd ~/

# Clone the repository
sudo git clone https://aur.archlinux.org/yay.git

# Change ownership so your user can build it (makepkg cannot be run as root)
sudo chown -R $(whoami):$(whoami) ./yay

# Navigate into the folder
cd yay

# Build and install
makepkg -si --noconfirm

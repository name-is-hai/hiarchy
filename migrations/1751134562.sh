echo "Ensure all indexes and packages are up to date"

hiarchy-refresh-pacman
sudo pacman -Syu --noconfirm

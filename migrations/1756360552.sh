echo "Move Hiarchy Package Repository after Arch core/extra/multilib and remove AUR"

hiarchy-refresh-pacman
sudo pacman -Syu --noconfirm

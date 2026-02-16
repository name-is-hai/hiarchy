#!/bin/bash

# Set install mode to online since boot.sh is used for curl installations
export HIARCHY_ONLINE_INSTALL=true

ansi_art='
██╗  ██╗██╗ █████╗ ██████╗  ██████╗██╗  ██╗██╗   ██╗
██║  ██║██║██╔══██╗██╔══██╗██╔════╝██║  ██║╚██╗ ██╔╝
███████║██║███████║██████╔╝██║     ███████║ ╚████╔╝
██╔══██║██║██╔══██║██╔══██╗██║     ██╔══██║  ╚██╔╝
██║  ██║██║██║  ██║██║  ██║╚██████╗██║  ██║   ██║
╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝'

clear
echo -e "\n$ansi_art\n"

sudo pacman -Syu --noconfirm --needed git

# Use custom repo if specified, otherwise default to name-is-hai/hiarchy
HIARCHY_REPO="${HIARCHY_REPO:-name-is-hai/hiarchy}"

echo -e "\nCloning Hiarchy from: https://github.com/${HIARCHY_REPO}.git"
rm -rf ~/.local/share/hiarchy/
git clone "https://github.com/${HIARCHY_REPO}.git" ~/.local/share/hiarchy >/dev/null

# Use custom branch if instructed, otherwise default to master
HIARCHY_REF="${HIARCHY_REF:-hiarchy}"
echo -e "\e[32mUsing branch: $HIARCHY_REF\e[0m"
cd ~/.local/share/hiarchy
git fetch origin "${HIARCHY_REF}" && git checkout "${HIARCHY_REF}"
cd -

# Set edge mirror for dev installs
if [[ $HIARCHY_REF == "dev" ]]; then
  export HIARCHY_MIRROR=edge
else
  export HIARCHY_MIRROR=stable
fi

echo -e "\nInstallation starting..."
source ~/.local/share/hiarchy/install.sh

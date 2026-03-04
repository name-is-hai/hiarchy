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

sudo pacman -Syu --noconfirm --needed base-devel git rust

# Use custom repo if specified, otherwise default to name-is-hai/hiarchy
HIARCHY_REPO="${HIARCHY_REPO:-name-is-hai/hiarchy}"
HIARCHY_REF="${HIARCHY_REF:-hirachy}"

echo -e "\e[32mUsing branch: $HIARCHY_REF\e[0m"
echo -e "\nCloning Hiarchy from: https://github.com/${HIARCHY_REPO}.git"
rm -rf ~/.local/share/hiarchy/
git clone -b $HIARCHY_REF --single-branch "https://github.com/${HIARCHY_REPO}.git" --depth=1 ~/.local/share/hiarchy >/dev/null

echo -e "\nInstallation starting..."
source ~/.local/share/hiarchy/install.sh

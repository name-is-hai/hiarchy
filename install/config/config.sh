# Copy over Hiarchy configs
mkdir -p ~/.config
cp -R ~/.local/share/hiarchy/config/* ~/.config/

# Use default bashrc from Hiarchy
# TODO: Migrate to .zshrc
cp ~/.local/share/hiarchy/default/bashrc ~/.bashrc

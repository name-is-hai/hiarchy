# Copy over Hiarchy configs
mkdir -p ~/.config
cp -R ~/.local/share/hiarchy/config/* ~/.config/

# Use default bashrc from Hiarchy
cp ~/.local/share/hiarchy/default/bashrc ~/.bashrc

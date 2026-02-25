# Copy over Hiarchy configs
mkdir -p ~/.config
cp -R ~/.local/share/hiarchy/config/* ~/.config/

# Use default zsh from Hiarchy
cp ~/.local/share/hiarchy/default/zshrc ~/.zshrc

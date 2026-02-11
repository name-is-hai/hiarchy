echo "Update fastfetch config with new Hiarchy logo"

hiarchy-refresh-config fastfetch/config.jsonc

mkdir -p ~/.config/hiarchy/branding
cp $HIARCHY_PATH/icon.txt ~/.config/hiarchy/branding/about.txt

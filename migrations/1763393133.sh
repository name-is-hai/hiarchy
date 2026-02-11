echo "Link new theme picker config"

mkdir -p ~/.config/elephant/menus
ln -snf $HIARCHY_PATH/default/elephant/hiarchy_themes.lua ~/.config/elephant/menus/hiarchy_themes.lua
sed -i '/"menus",/d' ~/.config/walker/config.toml
hiarchy-restart-walker

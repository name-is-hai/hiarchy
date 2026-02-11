echo "Add Tmux as an option with themed styling"

hiarchy-pkg-add tmux

if [[ ! -f ~/.config/tmux/tmux.conf ]]; then
  mkdir -p ~/.config/tmux
  cp $HIARCHY_PATH/config/tmux/tmux.conf ~/.config/tmux/tmux.conf
  hiarchy-theme-refresh
fi

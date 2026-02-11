echo "Make new Osaka Jade theme available as new default"

if [[ ! -L ~/.config/hiarchy/themes/osaka-jade ]]; then
  rm -rf ~/.config/hiarchy/themes/osaka-jade
  git -C ~/.local/share/hiarchy checkout -f themes/osaka-jade
  ln -nfs ~/.local/share/hiarchy/themes/osaka-jade ~/.config/hiarchy/themes/osaka-jade
fi

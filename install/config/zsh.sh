current_shell=$(basename "$SHELL")

if [ "$current_shell" != "zsh" ]; then
  while ! sudo chsh -s "$(command -v zsh)" "$USER"; do
    echo "${ERROR} Failed to change shell. Retrying..."
    sleep 1
  done

  echo "${INFO} Shell changed successfully to ${MAGENTA}zsh${RESET}\n"
else
  echo "${NOTE} Your shell is already set to ${MAGENTA}zsh${RESET}."
fi

echo "Linking .zshrc..."

[[ -e "$HOME/.zshrc" && ! -L "$HOME/.zshrc" ]] && mv "$HOME/.zshrc" "$HOME/.zshrc.bak"

ln -snf "$HIARCHY_PATH/default/zshrc" "$HOME/.zshrc"

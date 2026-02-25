printf "${NOTE} Copying Zsh plugins to Oh-My-Zsh custom folder...\n"
sudo cp -r /usr/share/zsh/plugins/zsh-autosuggestions/ /usr/share/oh-my-zsh/custom/plugins/zsh-autosuggestions
sudo cp -r /usr/share/zsh/plugins/zsh-syntax-highlighting/ /usr/share/oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Đổi Shell mặc định
current_shell=$(basename "$SHELL")

if [ "$current_shell" != "zsh" ]; then
  printf "${NOTE} Changing default shell to ${MAGENTA}zsh${RESET}..."
  printf "\n%.0s" {1..2}

  # Sử dụng sudo và chỉ định rõ $USER để tận dụng quyền NOPASSWD từ file first-run
  while ! sudo chsh -s "$(command -v zsh)" "$USER"; do
    echo "${ERROR} Failed to change shell. Retrying..." 2>&1 | tee -a "$LOG"
    sleep 1
  done

  printf "${INFO} Shell changed successfully to ${MAGENTA}zsh${RESET}\n" 2>&1 | tee -a "$LOG"
else
  echo "${NOTE} Your shell is already set to ${MAGENTA}zsh${RESET}."
fi

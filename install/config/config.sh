# Symlink configuration files from Hiarchy default to ~/.config/ using GNU Stow
mkdir -p ~/.config

# Use absolute path for HIARCHY_PATH if not set
HIARCHY_PATH="${HIARCHY_PATH:-$HOME/.local/share/hiarchy}"
DEFAULT_DIR="$HIARCHY_PATH/default"
TARGET_CONFIG="$HOME/.config"

echo "Syncing configurations to $TARGET_CONFIG..."

# Blacklist of items in default/ that should not go into ~/.config/
# - limine/pacman/plymouth: System-level configs
# - themed: Templates used internally
# - zshrc/xcompose: These belong in $HOME directly
EXCLUDE=(limine pacman plymouth themed zshrc xcompose)

# Build a list of items to stow
STOW_ITEMS=()
for item in "$DEFAULT_DIR"/*; do
  name=$(basename "$item")
  
  # Check if in exclude list
  skip=0
  for ex in "${EXCLUDE[@]}"; do
    if [[ "$name" == "$ex" ]]; then
      skip=1
      break
    fi
  done
  [[ $skip -eq 1 ]] && continue

  STOW_ITEMS+=("$name")
done

# Before stowing, backup existing directories to avoid Stow conflicts
for name in "${STOW_ITEMS[@]}"; do
  target="$TARGET_CONFIG/$name"
  if [[ -e "$target" && ! -L "$target" ]]; then
    echo "Backing up existing: $target -> $target.bak"
    mv "$target" "$target.bak"
  fi
done

# Run stow for the discovered items
if [[ ${#STOW_ITEMS[@]} -gt 0 ]]; then
  # -R (restow) to handle updates gracefully
  # -v (verbose) for visibility
  # -t target directory
  # -d package source directory
  # --no-folding prevents symlinking entire directories, ensuring 
  # apps don't write generated files back into the repo.
  stow -R -v --no-folding -t "$TARGET_CONFIG" -d "$DEFAULT_DIR" "${STOW_ITEMS[@]}"
fi

# Handle HOME level symlinks
echo "Linking .zshrc..."

# Backup existing files if they are not links
[[ -e "$HOME/.zshrc" && ! -L "$HOME/.zshrc" ]] && mv "$HOME/.zshrc" "$HOME/.zshrc.bak"

ln -sf "$DEFAULT_DIR/zshrc" "$HOME/.zshrc"

echo "Configuration sync complete."

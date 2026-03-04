# Symlink configuration files from Hiarchy default to ~/.config/ using GNU Stow
mkdir -p ~/.config

# Use absolute path for HIARCHY_PATH if not set
HIARCHY_PATH="${HIARCHY_PATH:-$HOME/.local/share/hiarchy}"
CONFIG_DIR="$HIARCHY_PATH/config"
TARGET_CONFIG="$HOME/.config"

echo "Syncing configurations to $TARGET_CONFIG..."

# Blacklist of items in default/ that should not go into ~/.config/
EXCLUDE=()

STOW_ITEMS=()
LOOSE_FILES=()

for item in "$CONFIG_DIR"/*; do
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

  # Separate directories (for Stow) and loose files (for ln)
  if [[ -d "$item" ]]; then
    STOW_ITEMS+=("$name")
  elif [[ -f "$item" ]]; then
    LOOSE_FILES+=("$name")
  fi
done

# 1. Handle GNU Stow (Directories)
for name in "${STOW_ITEMS[@]}"; do
  target="$TARGET_CONFIG/$name"
  if [[ -e "$target" && ! -L "$target" ]]; then
    echo "Backing up existing directory: $target -> $target.bak"
    # Delete the old backup to prevent nested folder inception!
    rm -rf "$target.bak"
    mv "$target" "$target.bak"
  fi
  # Create an empty target directory so Stow has a box to put the files in
  mkdir -p "$target"

  # Run Stow specifically for THIS package, aiming at THIS specific folder
  stow -R -v --no-folding -t "$target" -d "$CONFIG_DIR" "$name"
done

# Run stow for the discovered items
if [[ ${#STOW_ITEMS[@]} -gt 0 ]]; then
  # -R (restow) to handle updates gracefully
  # -v (verbose) for visibility
  # -t target directory
  # -d package source directory
  # --no-folding prevents symlinking entire directories, ensuring
  # apps don't write generated files back into the repo.
  stow -R -v --no-folding -t "$TARGET_CONFIG" -d "$CONFIG_DIR" "${STOW_ITEMS[@]}"
fi

# 2. Handle Loose Files (starship.toml, brave-flags.conf, etc.)
for file in "${LOOSE_FILES[@]}"; do
target="$TARGET_CONFIG/$file"
  if [[ -e "$target" && ! -L "$target" ]]; then
    echo "Backing up existing file: $target -> $target.bak"
    # Delete the old backup file
    rm -f "$target.bak"
    mv "$target" "$target.bak"
  fi
  echo "Linking loose file: $file..."
  ln -snf "$CONFIG_DIR/$file" "$target"
done

echo "Configuration sync complete."

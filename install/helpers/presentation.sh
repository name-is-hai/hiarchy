# --- Dependency Check ---
if ! command -v gum &>/dev/null; then
  # Assuming Arch Linux based on your use of pacman
  sudo pacman -S --needed --noconfirm gum
fi

# --- Terminal Metrics ---
# tput is generally more reliable than parsing stty
export TERM_WIDTH=$(tput cols 2>/dev/null || echo 80)
export TERM_HEIGHT=$(tput lines 2>/dev/null || echo 24)

# --- Logo Configuration ---
export LOGO_PATH="${HIARCHY_PATH:-.}/logo.txt"

if [[ -f "$LOGO_PATH" ]]; then
  export LOGO_WIDTH=$(awk '{ if (length > max) max = length } END { print max+0 }' "$LOGO_PATH")
  export LOGO_HEIGHT=$(wc -l <"$LOGO_PATH")
else
  export LOGO_WIDTH=0
  export LOGO_HEIGHT=0
fi

# --- Centering Logic ---
# Horizontal Padding
export PADDING_LEFT=$(( (TERM_WIDTH - LOGO_WIDTH) / 2 ))
[[ $PADDING_LEFT -lt 0 ]] && PADDING_LEFT=0
export PADDING_LEFT_SPACES=$(printf "%*s" "$PADDING_LEFT" "")

# Vertical Padding (to center the logo vertically)
export PADDING_TOP=$(( (TERM_HEIGHT - LOGO_HEIGHT) / 4 )) # 1/4 down looks better than dead center
[[ $PADDING_TOP -lt 0 ]] && PADDING_TOP=0

# --- Tokyo Night Theme & Gum Config ---
export GUM_CONFIRM_PROMPT_FOREGROUND="6"
export GUM_CONFIRM_SELECTED_FOREGROUND="0"
export GUM_CONFIRM_SELECTED_BACKGROUND="2"
export GUM_CONFIRM_UNSELECTED_FOREGROUND="7"
export GUM_CONFIRM_UNSELECTED_BACKGROUND="0"

# Uniform Padding String for Gum
export GUM_PADDING="0 0 0 $PADDING_LEFT"
export GUM_CHOOSE_PADDING="$GUM_PADDING"
export GUM_FILTER_PADDING="$GUM_PADDING"
export GUM_INPUT_PADDING="$GUM_PADDING"
export GUM_SPIN_PADDING="$GUM_PADDING"
export GUM_TABLE_PADDING="$GUM_PADDING"
export GUM_CONFIRM_PADDING="$GUM_PADDING"

# --- Functions ---
clear_logo() {
  clear # Standard clear
  
  # Print vertical padding
  for ((i=0; i<PADDING_TOP; i++)); do printf "\n"; done

  if [[ -f "$LOGO_PATH" ]]; then
    # Use gum style to render the logo with the calculated left padding
    gum style --foreground 2 --padding "0 0 0 $PADDING_LEFT" "$(<"$LOGO_PATH")"
  else
    echo -e "${PADDING_LEFT_SPACES}[ Logo Not Found ]"
  fi
  
  printf "\n" # Breath room after logo
}

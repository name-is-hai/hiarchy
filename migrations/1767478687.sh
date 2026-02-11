echo "Add opencode with system themeing"

hiarchy-pkg-add opencode

# Add config using hiarchy theme by default
if [[ ! -f ~/.config/opencode/opencode.json ]]; then
  mkdir -p ~/.config/opencode
  cp $HIARCHY_PATH/config/opencode/opencode.json ~/.config/opencode/opencode.json
fi

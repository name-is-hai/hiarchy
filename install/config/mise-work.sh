# Setup default work directory (and tries)
mkdir -p "$HOME/Work"
mkdir -p "$HOME/Work/tries"

# Add ./bin to path for all items in ~/Work
cat >"$HOME/Work/.mise.toml" <<'EOF'
[env]
_.path = "{{ cwd }}/bin"
EOF

mise trust ~/Work/.mise.toml

MISE_CONFIG_PATH="$HOME/.config/mise/config.toml"

if [ -f "$MISE_CONFIG_PATH" ]; then
  echo "Mise config found. Installing tools..."
  mise install -y
else
  echo "Mise config missing. Linking from hierarchy..."
  mkdir -p "$(dirname "$MISE_CONFIG_PATH")"

  ln -snf "$HIARCHY_PATH/config/mise/config.toml" "$MISE_CONFIG_PATH"

  mise install -y
fi

if command -v dotnet; then
  sudo ln -snf "$(which dotnet)" /usr/bin/dotnet
fi

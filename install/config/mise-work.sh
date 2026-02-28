# Setup default work directory (and tries)
mkdir -p "$HOME/Work"
mkdir -p "$HOME/Work/tries"

# Add ./bin to path for all items in ~/Work
cat >"$HOME/Work/.mise.toml" <<'EOF'
[env]
_.path = "{{ cwd }}/bin"
EOF

mise trust ~/Work/.mise.toml

if [[ -n "${HIARCHY_CHROOT_INSTALL:-}" ]]; then
  # --- 1. NODE.JS ---
  NODE_TARBALL=$(find /opt/packages -name "node-v*-linux-x64.tar.gz" -type f 2>/dev/null | head -n1)
  if [[ -n "$NODE_TARBALL" ]]; then
    NODE_VERSION=$(basename "$NODE_TARBALL" | sed 's/node-v\(.*\)-linux-x64.tar.gz/\1/')
    NODE_INSTALL_DIR="$HOME/.local/share/mise/installs/node/$NODE_VERSION"

    mkdir -p "$NODE_INSTALL_DIR"
    tar -xzf "$NODE_TARBALL" --strip-components=1 -C "$NODE_INSTALL_DIR"
    mise use -g node@"$NODE_VERSION"
  fi

  # --- 2. PYTHON ---
  PYTHON_TARBALL=$(find /opt/packages -name "python-*-linux-x64.tar.gz" -type f 2>/dev/null | head -n1)
  if [[ -n "$PYTHON_TARBALL" ]]; then
    PYTHON_VERSION=$(basename "$PYTHON_TARBALL" | sed 's/python-\(.*\)-linux-x64.tar.gz/\1/')
    PYTHON_INSTALL_DIR="$HOME/.local/share/mise/installs/python/$PYTHON_VERSION"

    mkdir -p "$PYTHON_INSTALL_DIR"
    tar -xzf "$PYTHON_TARBALL" --strip-components=1 -C "$PYTHON_INSTALL_DIR"
    mise use -g python@"$PYTHON_VERSION"
  fi

  # --- 3. RUST ---
  RUST_TARBALL=$(find /opt/packages -name "rust-*-x86_64-unknown-linux-gnu.tar.gz" -type f 2>/dev/null | head -n1)
  if [[ -n "$RUST_TARBALL" ]]; then
    RUST_VERSION=$(basename "$RUST_TARBALL" | sed 's/rust-\(.*\)-x86_64-unknown-linux-gnu.tar.gz/\1/')
    RUST_INSTALL_DIR="$HOME/.local/share/mise/installs/rust/$RUST_VERSION"

    mkdir -p "$RUST_INSTALL_DIR"
    tar -xzf "$RUST_TARBALL" --strip-components=1 -C "$RUST_INSTALL_DIR"
    mise use -g rust@"$RUST_VERSION"
  fi

  # --- 4. .NET SDK ---
  DOTNET_TARBALL=$(find /opt/packages -name "dotnet-sdk-*-linux-x64.tar.gz" -type f 2>/dev/null | head -n1)
  if [[ -n "$DOTNET_TARBALL" ]]; then
    DOTNET_VERSION=$(basename "$DOTNET_TARBALL" | sed 's/dotnet-sdk-\(.*\)-linux-x64.tar.gz/\1/')
    DOTNET_INSTALL_DIR="$HOME/.local/share/mise/installs/dotnet/$DOTNET_VERSION"

    mkdir -p "$DOTNET_INSTALL_DIR"
    # NOTE: Microsoft's .NET tarballs do NOT have a single top-level folder,
    # so we intentionally remove '--strip-components=1' here.
    tar -xzf "$DOTNET_TARBALL" -C "$DOTNET_INSTALL_DIR"
    mise use -g dotnet@"$DOTNET_VERSION"
  fi

else
  mise use -g node@latest
  mise use -g python@latest
  mise use -g rust@latest
  mise use -g dotnet@latest
fi

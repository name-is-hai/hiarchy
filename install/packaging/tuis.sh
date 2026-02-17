ICON_DIR="$HOME/.local/share/applications/icons"
INSTALLER_BIN="$HOME/.local/share/hiarchy/bin/hiarchy-tui-install"

# --- FIX START: Grant execute permissions ---
# The error happens because this file is not marked as executable.
# We fix this by running chmod +x on it before using it.
if [ -f "$INSTALLER_BIN" ]; then
    chmod +x "$INSTALLER_BIN"
fi
# --- FIX END ---

hiarchy-tui-install "Disk Usage" "bash -c 'dust -r; read -n 1 -s'" float "$ICON_DIR/Disk Usage.png"
hiarchy-tui-install "Docker" "lazydocker" tile "$ICON_DIR/Docker.png"


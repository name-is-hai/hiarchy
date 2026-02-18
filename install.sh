#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# Define Hiarchy locations
export HIARCHY_PATH="$HOME/.local/share/hiarchy"
export HIARCHY_INSTALL="$HIARCHY_PATH/install"
export HIARCHY_INSTALL_LOG_FILE="/var/log/hiarchy-install.log"
export PATH="$HIARCHY_PATH/bin:$PATH"

# Install
source "$HIARCHY_INSTALL/helpers/all.sh"
source "$HIARCHY_INSTALL/preflight/all.sh"
source "$HIARCHY_INSTALL/packaging/all.sh"
source "$HIARCHY_INSTALL/config/all.sh"
source "$HIARCHY_INSTALL/login/all.sh"
source "$HIARCHY_INSTALL/post-install/all.sh"

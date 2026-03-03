#!/bin/bash

# Grant temporary passwordless sudo access during installation
# This is removed in the post-install phase
echo "Setting up temporary passwordless sudo for installation..."

sudo tee /etc/sudoers.d/99-hiarchy-installer >/dev/null <<EOF
$USER ALL=(ALL) NOPASSWD: ALL
EOF

sudo chmod 440 /etc/sudoers.d/99-hiarchy-installer

echo "Temporary sudo access granted."

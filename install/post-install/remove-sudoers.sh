#!/bin/bash

# Remove temporary passwordless sudo access granted during installation
echo "Removing temporary passwordless sudo access..."

if [[ -f /etc/sudoers.d/99-hiarchy-installer ]]; then
  sudo rm -f /etc/sudoers.d/99-hiarchy-installer
fi

echo "Temporary sudo access removed."

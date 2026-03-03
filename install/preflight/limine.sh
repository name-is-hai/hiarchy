#!/bin/bash

# Pre-configure Limine to avoid errors during hook execution
# This needs to run BEFORE package installation so that hooks find /etc/default/limine
echo "Pre-configuring Limine (creating /etc/default/limine)..."

# Find current config location (if limine is already installed or from previous install)
if [[ -f /boot/EFI/arch-limine/limine.conf ]]; then
  limine_config="/boot/EFI/arch-limine/limine.conf"
elif [[ -f /boot/EFI/BOOT/limine.conf ]]; then
  limine_config="/boot/EFI/BOOT/limine.conf"
elif [[ -f /boot/EFI/limine/limine.conf ]]; then
  limine_config="/boot/EFI/limine/limine.conf"
elif [[ -f /boot/limine/limine.conf ]]; then
  limine_config="/boot/limine/limine.conf"
elif [[ -f /boot/limine.conf ]]; then
  limine_config="/boot/limine.conf"
fi

if [[ -n "$limine_config" ]]; then
  CMDLINE=$(grep "^[[:space:]]*cmdline:" "$limine_config" | head -1 | sed 's/^[[:space:]]*cmdline:[[:space:]]*//')
fi

# Default values if not found
CMDLINE="${CMDLINE:-rw root=UUID=$(findmnt -n -o UUID /) quiet splash}"

sudo mkdir -p /etc/default
sudo cp "$HIARCHY_PATH/default/limine/default.conf" /etc/default/limine
sudo sed -i "s|@@CMDLINE@@|$CMDLINE|g" /etc/default/limine

# Detect boot mode
[[ -d /sys/firmware/efi ]] && EFI=true
if [[ -z $EFI ]]; then
  sudo sed -i '/^ENABLE_UKI=/d; /^ENABLE_LIMINE_FALLBACK=/d' /etc/default/limine
fi

echo "Limine pre-configured."

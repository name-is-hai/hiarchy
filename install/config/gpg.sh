# Setup GPG configuration with multiple keyservers for better reliability
sudo mkdir -p /etc/gnupg
sudo ln -sf ~/.local/share/hiarchy/default/gpg/dirmngr.conf /etc/gnupg/dirmngr.conf
sudo chmod 644 /etc/gnupg/dirmngr.conf
sudo gpgconf --kill dirmngr || true
sudo gpgconf --launch dirmngr || true

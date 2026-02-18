# Show installation environment variables
gum log --level info "Installation Environment:"

env | grep -E "^(HIARCHY_CHROOT_INSTALL|HIARCHY_ONLINE_INSTALL|HIARCHY_USER_NAME|HIARCHY_USER_EMAIL|USER|HOME|HIARCHY_REPO|HIARCHY_REF|HIARCHY_PATH)=" | sort | while IFS= read -r var; do
  gum log --level info "  $var"
done

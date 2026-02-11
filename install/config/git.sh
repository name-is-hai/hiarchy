# Set identification from install inputs
if [[ -n "${HIARCHY_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$HIARCHY_USER_NAME"
fi

if [[ -n "${HIARCHY_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$HIARCHY_USER_EMAIL"
fi

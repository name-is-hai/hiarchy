# Set default XCompose that is triggered with CapsLock
tee ~/.XCompose >/dev/null <<EOF
include "%H/.local/share/hiarchy/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$HIARCHY_USER_NAME"
<Multi_key> <space> <e> : "$HIARCHY_USER_EMAIL"
EOF

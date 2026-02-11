echo "Fix JetBrains font setting"

if [[ $(hiarchy-font-current) == JetBrains* ]]; then
  hiarchy-font-set "JetBrainsMono Nerd Font"
fi

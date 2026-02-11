echo "Migrate to proper packages for localsend and asdcontrol"

if hiarchy-pkg-present localsend-bin; then
  hiarchy-pkg-drop localsend-bin
  hiarchy-pkg-add localsend
fi

if hiarchy-pkg-present asdcontrol-git; then
  hiarchy-pkg-drop asdcontrol-git
  hiarchy-pkg-add asdcontrol
fi

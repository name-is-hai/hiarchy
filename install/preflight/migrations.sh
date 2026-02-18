HIARCHY_MIGRATIONS_STATE_PATH=~/.local/state/hiarchy/migrations
mkdir -p $HIARCHY_MIGRATIONS_STATE_PATH

for file in ~/.local/share/hiarchy/migrations/*.sh; do
  touch "$HIARCHY_MIGRATIONS_STATE_PATH/$(basename "$file")"
done

echo "Change to openai-codex instead of openai-codex-bin"

if hiarchy-pkg-present openai-codex-bin; then
    hiarchy-pkg-drop openai-codex-bin
    hiarchy-pkg-add openai-codex
fi

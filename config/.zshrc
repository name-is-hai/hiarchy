source /usr/share/zinit/zinit.zsh

# zinit snippet OMZL::completion.zsh
# 1. Base snippets and plugins
zinit snippet OMZP::git
zinit snippet OMZP::starship
zinit light djui/alias-tips
zinit light zsh-users/zsh-history-substring-search
zinit load zdharma-continuum/history-search-multi-word
zinit light hlissner/zsh-autopair

# 2. Load completions into the fpath
zinit light zsh-users/zsh-completions

# 3. Initialize the Zsh completion system (Crucial Step)
autoload -Uz compinit
compinit

# 4. fzf-tab (Must be AFTER compinit, but BEFORE UI/Wrapper plugins)
zinit light Aloxaf/fzf-tab

# 5. UI/Wrapper plugins (Must be loaded last)
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

# 6. Your custom source
source ~/.local/share/hiarchy/default/zsh/rc

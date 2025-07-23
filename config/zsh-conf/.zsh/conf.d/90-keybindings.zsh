# config/zsh/conf.d/90-keybindings.zsh

# fzf keybindings
source <(fzf --zsh)

# zsh-history-substring-search keybindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

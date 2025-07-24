# config/zsh-conf/.zsh/conf.d/90-keybindings.zsh

# ------------------------------------------------------------------------------
#  fzf (fuzzy finder) enhancements
#  - Requires 'ripgrep' and 'bat'
# ------------------------------------------------------------------------------
# rg를 사용하여 .gitignored 파일들을 제외하고 빠르게 검색
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'
# Ctrl+T에 대한 미리보기 옵션을 bat으로 설정
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}'"

# ------------------------------------------------------------------------------
#  Keybindings
# ------------------------------------------------------------------------------
# fzf keybindings
source <(fzf --zsh)

# zsh-history-substring-search keybindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

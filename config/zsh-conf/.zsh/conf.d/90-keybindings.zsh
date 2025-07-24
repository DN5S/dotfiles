# config/zsh-conf/.zsh/conf.d/90-keybindings.zsh

# ------------------------------------------------------------------------------
#  fzf (fuzzy finder) enhancements
#  - Requires 'ripgrep' and 'bat'
# ------------------------------------------------------------------------------
# rg를 사용하여 .gitignored 파일들을 제외하고 빠르게 검색
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*" --ignore-file .gitignore'
# Ctrl+T에 대한 미리보기 옵션을 bat으로 설정
export FZF_CTRL_T_OPTS="--preview 'bat --line-range :500 -n --color=always {}'"

# ------------------------------------------------------------------------------
#  Keybindings
# ------------------------------------------------------------------------------
# fzf keybindings
if command -v fzf >/dev/null 2>&1; then
	source <(fzf --zsh)
fi

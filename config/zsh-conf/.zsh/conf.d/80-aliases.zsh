# config/zsh-conf/.zsh/conf.d/80-aliases.zsh

# ------------------------------------------------------------------------------
#  eza (modern replacement for ls)
# ------------------------------------------------------------------------------
alias ls='eza --icons'
alias l='eza --icons -bgh --git'
alias la='eza --icons -a'
alias ll='eza --icons -l --git --no-user --no-time'
alias lt='eza --icons --tree --level=2'

# ------------------------------------------------------------------------------
#  bat (modern replacement for cat)
# ------------------------------------------------------------------------------
alias cat='bat --paging=never' # cat 기본 명령어를 bat으로 대체

# ------------------------------------------------------------------------------
#  General utilities
# ------------------------------------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'

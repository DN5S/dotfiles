# config/zsh-conf/.zsh/conf.d/80-aliases.zsh

# ------------------------------------------------------------------------------
#  eza (modern replacement for ls)
# ------------------------------------------------------------------------------
alias ls='eza --icons'
alias l='eza --icons -bgh --git'
alias la='eza --icons -al --git'
alias ll='eza --icons -l --git'
alias lt='eza --icons --tree --level=2'

# ------------------------------------------------------------------------------
#  GNU Stow (Symlink Manager)
#  - Requires running from within the dotfiles directory.
#  - Usage:
#      st                # Stow all packages in $HOME/.dotfiles/config
#      st zsh-conf       # Stow only the 'zsh-conf' package
#  - This function wraps 'stow' for easier dotfiles management.
# ------------------------------------------------------------------------------
st() {
    local stow_dir="$HOME/.dotfiles/config"
    local target_dir="$HOME"
    
    # If no arguments are provided, find all directories in stow_dir and use them as packages
    if [ $# -eq 0 ]; then
        # Use a subshell to change directory. Added '--' to prevent misinterpretation of filenames.
        (cd "$stow_dir" && \
         command stow -R --verbose --target="$target_dir" --dir="$stow_dir" -- *)
    else
        # Pass all provided arguments to stow. '--' is critical here too.
        command stow -R --verbose --target="$target_dir" --dir="$stow_dir" -- "$@"
    fi
}

sys-update() {
    # 1. 시스템 패키지 업데이트
    if ! sudo dnf update -y; then
        echo "Error during package update. Aborting." >&2
        return 1
    fi

    # 2. 더 이상 필요 없는 패키지 자동 제거
    if ! sudo dnf autoremove -y; then
        echo "Error during autoremove. Aborting." >&2
        return 1
    fi

    # 3. DNF 캐시 정리
    if ! sudo dnf clean all; then
        echo "Error during cache cleanup." >&2
        return 1
    fi

    # 4. 시스템 로그(journal) 2주 이전 데이터 삭제
    if ! sudo journalctl --vacuum-time=2weeks; then
        echo "Error during journal log vacuuming." >&2
        return 1
    fi
}

# ------------------------------------------------------------------------------
alias g='git'
alias ga='git add'
alias gp='git push'
alias gpl='git pull'
alias gc='git commit'
alias gcm='git commit -m'
alias gst='git status'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'
alias gco='git checkout'
alias gbr='git branch'
alias gcl='git clone'

# ------------------------------------------------------------------------------
#  General utilities
# ------------------------------------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias h='history'
alias c='clear'
alias du='du -h --max-depth=1'
alias df='df -h'
alias free='free -h'

# ------------------------------------------------------------------------------
#  Miscellaneous
# ------------------------------------------------------------------------------
alias reload='source ~/.zshrc'
mkcd() {
    mkdir -p "$1" && cd "$1"
}

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
# ------------------------------------------------------------------------------
st() {
    local stow_dir="$HOME/.dotfiles/config"
    local target_dir="$HOME"
    
    # If no arguments are provided, find all directories in stow_dir and use them as packages
    if [ $# -eq 0 ]; then
        # Use a subshell to change directory and find packages
        (cd "$stow_dir" && \
         command stow -R --verbose --target="$target_dir" --dir="$stow_dir" *)
    else
        # Pass all provided arguments to stow
        command stow -R --verbose --target="$target_dir" --dir="$stow_dir" "$@"
    fi
}

# ------------------------------------------------------------------------------
#  System Update and Maintenance
#  - A comprehensive function to update, clean, and optimize the system.
# ------------------------------------------------------------------------------
sys-update() {
    if ! sudo dnf update -y; then
        echo "Error during package update. Aborting." >&2
        return 1
    fi

    if ! sudo dnf autoremove -y; then
        echo "Error during autoremove. Aborting." >&2
        return 1
    fi

    if ! sudo dnf clean all; then
        echo "Error during cache cleanup." >&2
        return 1
    fi

    if ! sudo journalctl --vacuum-time=2weeks; then
        echo "Error during journal log vacuuming." >&2
        return 1
    fi
}

# ------------------------------------------------------------------------------
#  Git
# ------------------------------------------------------------------------------
alias g='git'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gst='git status'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'
alias gco='git checkout'
alias gbr='git branch'
alias gpl='git pull'
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
alias df='df -h'
alias du='du -h --max-depth=1'

# ------------------------------------------------------------------------------
#  Miscellaneous
# ------------------------------------------------------------------------------
alias reload='source ~/.zshrc'

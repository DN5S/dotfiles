# ------------------------------------------------------------------------------
#  Atuin - Magical Shell History
#  - Loads and configures Atuin, ensuring its custom path is recognized.
# ------------------------------------------------------------------------------

# Check if Atuin is installed
if ! command -v atuin &>/dev/null; then
    return
fi

# The --disable-up-arrow flag prevents Atuin from overriding
# the zsh-history-substring-search binding for the up arrow key.
# eval "$(atuin init zsh --disable-up-arrow)"
eval "$(atuin init zsh)"

autoload -U add-zsh-hook
atuin_sync_on_exit() {
  atuin sync
}
add-zsh-hook zshexit atuin_sync_on_exit

# ------------------------------------------------------------------------------
#  Atuin - Magical Shell History
#  - Loads and configures Atuin, ensuring its custom path is recognized.
# ------------------------------------------------------------------------------

if ! command -v atuin &> /dev/null; then
    # Silently exit if atuin is still not found.
    # This acts as a safety net for login shells.
    return
fi

# The --disable-up-arrow flag prevents Atuin from overriding
# the zsh-history-substring-search binding for the up arrow key.
eval "$(atuin init zsh)"

autoload -U add-zsh-hook
atuin_sync_on_exit() {
  # Run a final sync. No need for backgrounding as the shell is closing.
  # A timeout is added to prevent hanging on a slow network.
  atuin sync --timeout 10
}
add-zsh-hook zshexit atuin_sync_on_exit

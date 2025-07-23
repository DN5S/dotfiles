# config/zsh/conf.d/10-plugins.zsh

# Define a path for generated plugin files
ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
mkdir -p "$ZSH_CACHE_DIR"
GENERATED_PLUGINS_FILE="$ZSH_CACHE_DIR/plugins.zsh"

# Load Antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# Bundle plugins from our dotfiles-managed list
antidote bundle <"$HOME/.zsh_plugins.txt" >"$GENERATED_PLUGINS_FILE"

# Source the generated plugins file
source "$GENERATED_PLUGINS_FILE"

# config/zsh/conf.d/10-plugins.zsh

# Define a path for generated plugin files
ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
mkdir -p "$ZSH_CACHE_DIR"
GENERATED_PLUGINS_FILE="$ZSH_CACHE_DIR/plugins.zsh"
PLUGINS_LIST_FILE="$HOME/.zsh_plugins.txt"

# Load Antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# Regenerate the plugins file only if it doesn't exist or the source list is newer.
if [[ ! -f "$GENERATED_PLUGINS_FILE" || "$PLUGINS_LIST_FILE" -nt "$GENERATED_PLUGINS_FILE" ]]; then
    echo "Antidote: Generating new plugins file..."
    antidote bundle <"$PLUGINS_LIST_FILE" >"$GENERATED_PLUGINS_FILE"
fi

# Source the generated plugins file
source "$GENERATED_PLUGINS_FILE"

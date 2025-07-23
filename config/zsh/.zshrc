# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Define a path for generated plugin files to avoid cluttering the home directory.
ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
mkdir -p "$ZSH_CACHE_DIR"
GENERATED_PLUGINS_FILE="$ZSH_CACHE_DIR/plugins.zsh"

# Load Antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# Bundle plugins from our dotfiles-managed list and output to the cache directory
antidote bundle <${ZDOTDIR:-~}/.zsh_plugins.txt >"$GENERATED_PLUGINS_FILE"

# Source the generated plugins file from its cache location
source "$GENERATED_PLUGINS_FILE"

# Initialize Powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable history substring search
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down 

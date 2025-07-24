# .zshrc

# ------------------------------------------------------------------------------
#  Powerlevel10k Instant Prompt
#  - Must be at the top.
#  - For more details, see: https://github.com/romkatv/powerlevel10k
# ------------------------------------------------------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ------------------------------------------------------------------------------
#  Load all configuration files from the .zsh/conf.d directory
#  - Files are loaded in alphabetical order.
# ------------------------------------------------------------------------------
ZSH_CONFIG_DIR="$HOME/.zsh"
if [ -d "$ZSH_CONFIG_DIR/conf.d" ]; then
  for config_file in "$ZSH_CONFIG_DIR"/conf.d/*.zsh; do
    source "$config_file"
  done
  unset config_file # Clean up namespace
fi

# ------------------------------------------------------------------------------
#  Powerlevel10k Initialization
#  - Must be at the bottom.
# ------------------------------------------------------------------------------
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"

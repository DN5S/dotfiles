# config/zsh-conf/.zsh/conf.d/00-path.zsh

# ------------------------------------------------------------------------------
#  Environment Path Configuration
#  - This file should be loaded first to set up critical paths.
# ------------------------------------------------------------------------------

ATUIN_BIN_DIR="$HOME/.atuin/bin"
if [ -d "$ATUIN_BIN_DIR" ]; then
  export PATH="$ATUIN_BIN_DIR:$PATH"
fi

# uv (Python Toolchain) Path
UV_BIN_DIR="$HOME/.local/bin"
if [ -d "$UV_BIN_DIR" ]; then
  export PATH="$UV_BIN_DIR:$PATH"
fi

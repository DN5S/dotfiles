#!/bin/bash

# This script sets up the dotfiles environment on a Fedora system.
# It installs necessary packages, configures Zsh with Antidote for plugin management,
# and creates symbolic links for configuration files using Stow.
# Ensure the script is run from the dotfiles directory

if ! (cd "$SCRIPT_DIR" && git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo "Error: This script must be run from within the dotfiles Git repository." >&2
    exit 1
fi

echo "Starting Dotfiles Deployment: $(date +'%Y-%m-%d %H:%M:%S')"
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Source the system-specific setup script for Fedora
if [ -f "$DOTFILES_DIR/system/linux_fedora.sh" ]; then
    source "$DOTFILES_DIR/system/linux_fedora.sh"
else
    echo "Warning: $DOTFILES_DIR/system/linux_fedora.sh not found. Skipping Fedora-specific setup."
fi

# Source the common setup script for shared configurations
if [ -f "$DOTFILES_DIR/system/common.sh" ]; then
    source "$DOTFILES_DIR/system/common.sh"
else
    echo "Warning: $DOTFILES_DIR/system/common.sh not found. Skipping common setup."
fi

# Create the .zsh_plugins.txt file if it doesn't exist
echo "Creating symbolic links with Stow..."
STOW_DIR="$DOTFILES_DIR/config"
TARGET_DIR="$HOME"
STOW_PACKAGES=(
    p10k
    zsh
    zsh-conf
)

for pkg in "${STOW_PACKAGES[@]}"; do
    echo "--- Processing package: $pkg ---"
    PKG_DIR="$STOW_DIR/$pkg"
    for item_path in "$PKG_DIR"/{,.}*; do
        [ -e "$item_path" ] || continue
        item_name=$(basename "$item_path")
        if [ "$item_name" = "." ] || [ "$item_name" = ".." ]; then
            continue
        fi
        
        target_path="$TARGET_DIR/$item_name"
        if [ -e "$target_path" ] && [ ! -L "$target_path" ]; then
            echo "  -> Conflict: '$target_path' exists and is not a symlink."
            backup_path="${target_path}.bak.$(date +%Y%m%d_%H%M%S)"
            echo "    Backing up to '$backup_path'"
            if mv "$target_path" "$backup_path"; then
                echo "    Backup successful."
            else
                echo "    ERROR: Failed to back up '$target_path'. Aborting stow for '$pkg'." >&2
                continue 2 
            fi
        fi
    done
    
    echo "Stowing '$pkg'..."
    if stow -R -v --target="$TARGET_DIR" --dir="$STOW_DIR" "$pkg"; then
        echo "Successfully stowed '$pkg'."
    else
        echo "ERROR: Failed to stow '$pkg'." >&2
    fi
    echo ""
done

echo ""
echo "Deployment finished at $(date +'%Y-%m-%d %H:%M:%S') Restart your shell or log back in."

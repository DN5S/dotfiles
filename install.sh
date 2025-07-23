#!/bin/bash

# This script sets up the dotfiles environment on a Fedora system.
# It installs necessary packages, configures Zsh with Antidote for plugin management,
# and creates symbolic links for configuration files using Stow.
# Ensure the script is run from the dotfiles directory

echo "Starting Dotfiles Deployment: $(date +'%Y-%m-%d %H:%M:%S')"
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Source the system-specific setup script for Fedora
source "$DOTFILES_DIR/system/linux_fedora.sh"

# Source the common setup script for shared configurations
source "$DOTFILES_DIR/system/common.sh"

# Create the .zsh_plugins.txt file if it doesn't exist
echo "Creating symbolic links with Stow..."
for dir in "$DOTFILES_DIR"/config/*; do
    if [ -d "$dir" ]; then
        stow_pkg=$(basename "$dir")
        echo "Stowing $stow_pkg..."
        stow -R --verbose --target="$HOME" --dir="$DOTFILES_DIR/config" "$stow_pkg"
    fi
done

echo ""
echo "Deployment finished at $(date +'%Y-%m-%d %H:%M:%S') Restart your shell or log back in."

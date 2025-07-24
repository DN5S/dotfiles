#!/bin/bash
echo "Phase 1: Installing prerequisites for Fedora..."

# Update system and install necessary packages
echo "Updating system and installing required packages..."
sudo dnf update -y
sudo dnf group install -y "development-tools" 
sudo dnf install -y git zsh stow fzf ripgrep bat
sudo dnf autoremove -y

# Install eza
if ! command -v eza &> /dev/null; then
  echo "eza not found. Installing from pre-built binary..."
  TEMP_DIR=$(mktemp -d)
  cd "$TEMP_DIR"

  # Download the latest eza release
  echo "Downloading latest eza release..."
  curl -LO https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz

  echo "Extracting binary..."
  tar -xzf eza_x86_64-unknown-linux-gnu.tar.gz
  
  # Move the binary to /usr/local/bin
  echo "Installing eza to /usr/local/bin..."
  sudo mv eza /usr/local/bin/eza

  # Clean up temporary files
  cd -
  rm -rf "$TEMP_DIR"
  echo "eza installed successfully."
else
  echo "eza is already installed."
fi

ZSH_PATH=$(which zsh)

# Check if Zsh is already the default shell
if [ "$SHELL" == "$ZSH_PATH" ]; then
  echo "Zsh is already the default shell."
else
  # Verify that the zsh path is valid and listed in /etc/shells
  if ! grep -q "$ZSH_PATH" /etc/shells; then
    echo "Adding $ZSH_PATH to /etc/shells"
    echo "$ZSH_PATH" | sudo tee -a /etc/shells
  fi

  # Ask for confirmation before changing the shell
  read -p "Do you want to change the default shell to Zsh for user $USER? (y/N) " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Changing shell to Zsh for the current user ($USER)..."
    if sudo usermod --shell "$ZSH_PATH" "$USER"; then
      echo "Shell changed successfully. Please log out and log back in to see the change."
    else
      echo "Failed to change the shell. Please check permissions or previous errors."
    fi
  else
    echo "Skipping shell change."
  fi
fi

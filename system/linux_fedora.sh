#!/bin/bash
echo "Phase 1: Installing prerequisites for Fedora..."

# Update system and install necessary packages
echo "Updating system and installing required packages..."
sudo dnf update -y
sudo dnf groupinstall -y "Development Tools"
sudo dnf install -y git zsh stow

# Install Antidote for Zsh plugin management if not already installed 
ZSH_PATH=$(which zsh)
if ! grep -q "$ZSH_PATH" /etc/shells; then
  echo "Adding $ZSH_PATH to /etc/shells"
  echo "$ZSH_PATH" | sudo tee -a /etc/shells
fi
sudo usermod --shell "$ZSH_PATH" "$USER"

#!/bin/bash

echo "Running common setup..."
# Ensure Antidote is installed for Zsh plugin management 
ANTIDOTE_DIR="${ZDOTDIR:-$HOME}/.antidote"

if [ -d "$ANTIDOTE_DIR" ]; then
    echo "Antidote found. Updating..."
    if (cd "$ANTIDOTE_DIR" && git pull); then
        echo "Antidote updated successfully."
    else
        echo "Error: Failed to update Antidote. Continuing might be unsafe." >&2
        exit 1
    fi
else
    echo "Antidote not found. Cloning into $ANTIDOTE_DIR..."
    if git clone --depth=1 https://github.com/mattmc3/antidote.git "$ANTIDOTE_DIR"; then
        echo "Antidote cloned successfully."
    else
        echo "Error: Failed to clone Antidote." >&2
        exit 1
    fi
fi

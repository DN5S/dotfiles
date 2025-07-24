#!/bin/bash

echo "Running common setup..."
# Ensure Antidote is installed for Zsh plugin management 
if [ -d "${ZDOTDIR:-~}/.antidote" ]; then
    echo "Antidote found. Updating..."
    if (cd "${ZDOTDIR:-~}/.antidote" && git pull); then
        echo "Antidote updated successfully."
    else
        echo "Error: Failed to update Antidote." >&2
        exit 1
    fi
else
    echo "Antidote not found. Cloning..."
    git clone --depth=1 https://github.com/mattmc3/antidote.git "${ZDOTDIR:-~}/.antidote"
fi
    echo "Antidote not found. Cloning..."
    git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote
fi

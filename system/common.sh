#!/bin/bash
echo "Running common setup..."
if [ -d "${ZDOTDIR:-~}/.antidote" ]; then
    echo "Antidote found. Updating..."
    (cd "${ZDOTDIR:-~}/.antidote" && git pull)
else
    echo "Antidote not found. Cloning..."
    git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote
fi

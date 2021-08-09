#!/usr/bin/env bash

# First, check that required tools are available
function check_prog() {
    if ! hash "$1" > /dev/null 2>&1; then
        echo "Command not found: $1. Aborting..."
        exit 1
    fi
}

check_prog stow

# Create .config directory if it does not exist
mkdir -p "$HOME/.config"

# Then, install the config files
mkdir -p "$HOME/.config/emacs"
stow --target "$HOME/.config/emacs" emacs

﻿#!/bin/bash

set -ex

# This script installs everything from scratch. It is meant to be used through a curl to bash command.

# Install XCode Command Line Tools if necessary
xcode-select --install || echo "XCode already installed"

# Install Homebrew if necessary
if which -s brew; then
    echo 'Homebrew is already installed'
else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    (
        echo
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
    ) >>$HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install bitwarden and rbw
brew install --cask bitwarden --no-quarantine
brew install rbw

# Install and configure chezmoi
brew install chezmoi
chezmoi init fslef
chezmoi apply
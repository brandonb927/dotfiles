#!/usr/bin/env bash

# Make the user-relative bin folder to install things to
mkdir -p ~/bin

if [ $(command -v brew) ]; then
  e_arrow 'homebrew is already installed!'
else
  source ./install/brew.sh
fi

# Commented out due to https://github.com/mas-cli/mas/issues/164
#source ./install/mas.sh

if [ -d "$ZSH" ]; then
  e_arrow 'oh-my-zsh is already installed!'
else
  source ./install/oh-my-zsh.sh
fi

source ./install/oh-my-zsh-utilities.sh
source ./install/brew-utilities.sh
source ./install/brew-cask.sh
source ./install/ruby.sh
source ./install/python.sh
source ./install/go.sh
source ./install/node.sh
source ./install/npm.sh
source ./install/git.sh
source ./install/fonts.sh
source ./install/spectacle.sh

for app in "Activity Monitor" "cfprefsd" \
  "Dock" "Finder" "Google Chrome" "Messages" \
  "Spectacle" "SystemUIServer"; do
  killall "${app}" &> /dev/null
done

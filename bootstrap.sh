#!/usr/bin/env bash

# Make the user-relative bin folder to install things to
mkdir -p ~/bin

source ./install/brew.sh
source ./install/mas.sh

if [ -d "$ZSH" ]; then
  e_message 'oh-my-zsh is already installed!'
else
  source ./install/oh-my-zsh.sh
fi

source ./install/brew-utilities.sh
source ./install/brew-cask.sh
source ./install/ruby.sh
source ./install/python.sh
source ./install/go.sh
source ./install/npm.sh
source ./install/git.sh
source ./install/fonts.sh
source ./install/spectacle.sh

for app in "Activity Monitor" "cfprefsd" \
  "Dock" "Finder" "Google Chrome" "Messages" \
  "Spectacle" "SystemUIServer"; do
  killall "${app}" &> /dev/null
done

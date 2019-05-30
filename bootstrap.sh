#!/usr/bin/env bash

source ./utils.sh

# Make the user-relative bin folder to install things to
mkdir -p ~/bin

if [ $(command -v brew) ]; then
  e_arrow 'homebrew is already installed!'
else
  source ./install/brew.sh
fi


if [ -d "$ZSH" ]; then
  e_arrow 'oh-my-zsh is already installed!'
else
  source ./install/oh-my-zsh.sh
  exit 0
fi

source ./install/oh-my-zsh-plugins.sh

echo ""
echo "Install mac apps?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  source ./install/mas.sh
fi

echo ""
echo "Install brew utilities?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  source ./install/brew-utilities.sh
fi

echo ""
echo "Install brew cask apps?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  source ./install/brew-cask.sh
fi

echo ""
echo "Install ruby and versions?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  source ./install/ruby.sh
fi

echo ""
echo "Install python and versions?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  source ./install/python.sh
fi

echo ""
echo "Install Go and latest version?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  source ./install/go.sh
fi

echo ""
echo "Install node and nvm?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  source ./install/node.sh
fi

echo ""
echo "Install npm?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  source ./install/npm.sh
fi

echo ""
echo "Install git config?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  source ./install/git.sh
fi

echo ""
echo "Install fonts?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  source ./install/fonts.sh
fi

echo ""
echo "Install Spectacle settings?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  source ./install/spectacle.sh
fi


for app in "Activity Monitor" "cfprefsd" \
  "Dock" "Finder" "Google Chrome" "Messages" \
  "Spectacle" "SystemUIServer"; do
  killall "${app}" &> /dev/null
done

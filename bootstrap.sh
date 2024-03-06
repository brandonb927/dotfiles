#!/usr/bin/env bash

source ./utils.sh

# Make the user-relative bin folder to install things to
mkdir -p ~/bin

if [ $(command -v brew) ]; then
  e_arrow 'homebrew is already installed!'
else
  source ./install/brew.sh
fi

echo ""
echo "Install fish shell?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  source ./install/fish.sh
fi

echo ""
echo "Install asdf and languages/versions?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  source ./install/asdf.sh
fi

echo ""
echo "Install fonts?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  source ./install/fonts.sh
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
echo "Install mac app store apps?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  brew install mas
  mas install 1522267256  # Shareful
  mas install 425424353   # The Unarchiver
  mas install 6444667067  # Hyperduck
fi

#!/usr/bin/env bash

source ./utils.sh

e_header "Installing brew cask apps"

e_arrow "Installing cask and tapping"

brew tap caskroom/versions

e_arrow "Installing cask apps"

apps=(
  1password
  appcleaner
  bartender
  brave-browser
  daisydisk
  discord
  docker
  expressvpn
  firefox
  flux
  google-chrome
  homebrew/cask-drivers/steelseries-exactmouse-tool
  insomnia
  istat-menus
  iterm2
  java
  kap
  keybase
  logitech-options
  minecraft
  ngrok
  parsec
  plex
  raycast
  rectangle
  slack
  spotify
  stay
  steam
  sync
  visual-studio-code
  vlc
  webtorrent
)
for app in "${apps[@]}"; do
  brew install $app
done

e_arrow "Installing QuickLook plugins"
# from https://github.com/sindresorhus/quick-look-plugins
brew install qlcolorcode \
  qlstephen \
  qlmarkdown \
  quicklook-json \
  qlimagesize \
  suspicious-package \
  quicklookase \
  qlvideo

e_arrow "Setting Google chrome as the default browser"

open -a "Google Chrome" --args --make-default-browser

e_success "Done!"

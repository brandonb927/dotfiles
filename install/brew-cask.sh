#!/usr/bin/env bash

source ./utils.sh

e_header "Installing brew cask apps"

e_arrow "Installing cask and tapping"

brew tap caskroom/versions

e_arrow "Installing cask apps"

apps=(
  1password
  alfred
  appcleaner
  bartender
  blackvue-viewer
  brave-browser
  daisydisk
  discord
  docker
  expressvpn
  firefox
  flux
  homebrew/cask-drivers/steelseries-exactmouse-tool
  # hajo-headphone-enhancer # Currently not working on macOS 10.13+, the driver doesn't install cleanly
  insomnia
  istat-menus
  iterm2
  java
  kap
  keybase
  logitech-gaming-software
  logitech-options
  minecraft
  ngrok
  plex-media-player
  rectangle
  skype
  slack
  spotify
  stay
  steam
  sync
  teamviewer
  visual-studio-code
  vlc
  webtorrent
  zoomus
)
for app in "${apps[@]}"; do
  brew cask install $app
done

e_arrow "Installing QuickLook plugins"
# from https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode \
  qlstephen \
  qlmarkdown \
  quicklook-json \
  qlprettypatch \
  quicklook-csv \
  qlimagesize \
  webpquicklook \
  suspicious-package \
  quicklookase \
  qlvideo

e_arrow "Setting Brave Browser as the default browser"

open -a "Brave Browser" --args --make-default-browser

e_success "Done!"

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
  # beamer # don't use it as much as I used to
  bitbar
  # blackvue-viewer # hash mismatch
  daisydisk
  discord
  docker
  dropbox
  expressvpn
  firefox
  flux
  google-chrome
  gpg-suite
  homebrew/cask-drivers/steelseries-exactmouse-tool
  # hajo-headphone-enhancer # Currently not working on macOS 10.13+, the driver doesn't install cleanly
  insomnia
  istat-menus
  iterm2
  java
  kap
  keybase
  # macid # Currently not working on macOS 10.13, Bluetooth-related issue in iOS 11?
  minecraft
  ngrok
  # piezo # don't use it as much as I used to
  plex-media-player
  skype
  slack
  spectacle
  spotify
  stay
  steam
  teamviewer
  visual-studio-code-insiders
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
  # betterzipql \
  qlimagesize \
  webpquicklook \
  suspicious-package \
  quicklookase \
  qlvideo

e_arrow "Setting Google Chrome as the default browser"

open -a "Google Chrome" --args --make-default-browser

e_success "Done!"

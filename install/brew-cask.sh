#!/usr/bin/env bash

source ./utils.sh

e_header "Installing brew cask apps"

e_arrow "Installing cask and tapping"

brew tap caskroom/versions

e_arrow "Installing cask apps"

apps=(
  1password
  alfred
  android-platform-tools
  appcleaner
  bartender
  beamer
  blackvue-viewer
  daisydisk
  discord
  docker
  dropbox
  firefox
  flux
  gitify
  google-chrome
  # hajo-headphone-enhancer # Currently not working on macOS 10.13, the driver doesn't install cleanly
  insomnia
  istat-menus
  iterm2
  java
  kap
  keybase
  # macid # Currently not working on macOS 10.13, Bluetooth-related issue in iOS 11?
  minecraft
  piezo
  plex-media-player
  qlmarkdown
  qlstephen
  qlimagesize
  skype
  slack
  spectacle
  spotify
  stay
  steam
  teamviewer
  transmission
  visual-studio-code-insiders
  vlc
  yakyak
  zoomus
)
for app in "${apps[@]}"; do
  brew cask install --appdir="~/Applications" $app
done

brew cask cleanup

e_arrow "Setting Google Chrome as the default browser"

open -a "Google Chrome" --args --make-default-browser

e_success "Done!"

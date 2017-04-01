#!/usr/bin/env bash

source ./utils.sh

e_header "Installing brew cask apps"

e_arrow "Installing cask and tapping"

brew tap caskroom/versions

e_arrow "Installing cask apps"

apps=(
  1password
  alfred
  android-file-transfer
  android-platform-tools
  appcleaner
  atom
  bartender
  beamer
  cyberduck
  daisydisk
  discord
  docker
  dropbox
  filebot
  firefox
  flux
  gitify
  google-chrome
  hyper
  imageoptim
  insomnia
  istat-menus
  iterm2
  java
  kap
  macid
  minecraft
  musicbrainz-picard
  openemu
  phoneexpander
  piezo
  qlmarkdown
  qlstephen
  qlimagesize
  rocket
  skype
  slack-beta
  spectacle
  spotify
  stay
  steam
  sublime-text
  teamviewer
  transmission
  unetbootin
  vagrant
  vagrant-manager
  vlc
  virtualbox
  zoomus
)

brew cask install --appdir="~/Applications" ${apps[@]}
brew cask cleanup

e_arrow "Setting Google Chrome as the default browser"

open -a "Google Chrome" --args --make-default-browser

e_success "Done!"

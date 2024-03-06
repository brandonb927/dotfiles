#!/usr/bin/env bash

source ./utils.sh

e_header "Installing brew cask apps"

e_arrow "Installing cask and tapping"

brew tap homebrew/cask-versions

e_arrow "Installing cask apps"

apps=(
  1password
  1password/tap/1password-cli
  appcleaner
  applepi-baker
  audio-hijack
  bartender
  daisydisk
  discord
  #expressvpn # no M1 candidate
  flux
  google-chrome
  insomnia
  iterm2
  kap
  #keybase # No suitable M1 candidate?
  logi-options-plus
  loopback
  #minecraft
  ngrok
  parsec
  plex
  raycast
  raspberry-pi-imager
  soundsource
  spotify
  stats
  stay
  #steam
  sync
  visual-studio-code
  vlc
  webtorrent
)

brew install --cask ${apps[@]}

e_arrow "Installing QuickLook plugins"
# from https://github.com/sindresorhus/quick-look-plugins
#brew install qlcolorcode \
#  qlstephen \
#  qlmarkdown \
#  quicklook-json \
#  qlimagesize \
#  suspicious-package \
#  quicklookase \
#  qlvideo

e_success "Done!"

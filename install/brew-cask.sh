#!/usr/bin/env bash

source ./utils.sh

e_header "Installing brew cask apps"

e_arrow "Installing cask and tapping"

brew tap caskroom/versions

e_arrow "Installing cask apps"

apps=(
  1password
  1password/tap/1password-cli
  appcleaner
  applepi-baker
  audio-hijack
  bartender
  brave-browser
  cron
  daisydisk
  discord
  #docker # Install from docker website
  #expressvpn # no M1 candidate
  firefox
  flux
  google-chrome
  homebrew/cask-drivers/steelseries-exactmouse-tool
  insomnia
  iterm2
  java
  kap
  #keybase # No suitable M1 candidate?
  logitech-options
  loopback
  minecraft
  ngrok
  parsec
  podcastmenu
  plex
  raycast
  rectangle
  raspberry-pi-imager
  slack
  soundsource
  spotify
  stats
  stay
  #steam
  #sync # Install CloudFiles beta version instead
  visual-studio-code
  vlc
  webtorrent
)
for app in "${apps[@]}"; do
  brew install --cask $app
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

e_success "Done!"

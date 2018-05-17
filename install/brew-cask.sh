#!/usr/bin/env bash

source ./utils.sh

e_header "Installing brew cask apps"

e_arrow "Installing cask and tapping"

brew tap caskroom/versions

e_arrow "Installing cask apps"

apps=(
  # 1password # disabled until 1Password 7 is the new stable release
  alfred
  # android-platform-tools # don't use it as much as I used to
  appcleaner
  bartender
  # beamer # don't use it as much as I used to
  blackvue-viewer
  daisydisk
  discord
  docker
  dropbox
  firefox
  flux
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
  # piezo # don't use it as much as I used to
  plex-media-player
  skype
  slack
  spectacle
  spotify
  stay
  steam
  teamviewer
  # transmission # in favour of WebTorrent
  visual-studio-code-insiders
  vlc
  webtorrent
  yakyak
  zoomus
)
for app in "${apps[@]}"; do
  brew cask install --appdir="~/Applications" $app
done

e_arrow "Installing QuickLook plugins"
# from https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv \
  betterzipql qlimagesize webpquicklook suspicious-package quicklookase qlvideo

brew cask cleanup

e_arrow "Setting Google Chrome as the default browser"

open -a "Google Chrome" --args --make-default-browser

e_success "Done!"

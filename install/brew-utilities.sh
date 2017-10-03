#!/usr/bin/env bash

source ./utils.sh

e_header "Installing brew utilities"

binaries=(
    awscli
    bash
    boost
    boost-python
    cmake
    coreutils
    curl
    dialog
    dry
    faac
    figlet
    findutils
    fzf
    git
    git-extras
    git-fresh
    graphicsmagick
    graphviz
    heroku
    htop
    httpie
    imagemagick
    # imagesnap # DOES NOT COMPILE ON macOS
    # imgcat # SHA256 mismatch
    jp2a
    libmemcached
    m-cli
    memcached
    ncdu
    normalize
    pv
    pyenv
    pyenv-virtualenv
    rbenv
    ruby-build
    shml
    spaceman-diff
    sslmate
    sudolikeaboss
    tree
    wget
    wifi-password
    you-get
    youtube-dl
)

brew tap ravenac95/sudolikeaboss
brew tap pebble/pebble-sdk
brew tap colinstein/imgcat
brew tap moncho/dry

e_arrow "Installing brew packages"

brew install TomAnthony/brews/itermocil
brew install getsentry/tools/sentry-cli
for binary in "${binaries[@]}"; do
  brew install $binary
done

brew install ffmpeg --with-sdl2 --with-faac

e_arrow "Installing GNU version of utils"

gbinaries=(
  grep
  gnu-sed
)
brew install ${gbinaries[@]} --with-default-names

brew cleanup

e_success "Done!"

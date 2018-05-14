#!/usr/bin/env bash

source ./utils.sh

e_header "Installing brew utilities"

binaries=(
    awscli
    bash
    bat
    boost
    boost-python
    certbot
    cmake
    coreutils
    curl
    dialog
    diff-so-fancy
    dry
    faac
    figlet
    findutils
    fzf
    git
    git-extras
    git-fresh
    glances
    graphicsmagick
    graphviz
    heroku
    # htop # doesn't compile on macOS
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
    tig
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
brew install yarn --without-node

e_arrow "Installing GNU version of utils"

gbinaries=(
  grep
  gnu-sed
)
brew install ${gbinaries[@]} --with-default-names

brew cleanup

e_success "Done!"

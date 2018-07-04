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
    goenv
    graphicsmagick
    graphviz
    heroku
    htop
    httpie
    imagemagick
    imagesnap
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
# brew tap pebble/pebble-sdk # Fitbit owns Pebble now. RIP.
brew tap colinstein/imgcat
brew tap moncho/dry

e_arrow "Installing brew packages"

# brew install TomAnthony/brews/itermocil # Don't use it as much as I'd like
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
brew prune

e_success "Done!"

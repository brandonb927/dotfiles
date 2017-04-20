#!/usr/bin/env bash

source ./utils.sh

e_header "Installing brew utilities"

binaries=(
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
    git
    git-extras
    git-fresh
    graphicsmagick
    graphviz
    heroku
    htop
    httpie
    hub
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

brew tap homebrew/dupes
gbinaries=(
  grep
  gnu-sed
)
brew install ${gbinaries[@]} --with-default-names


e_arrow "Installing joe for gitignore files"

# curl -Lo ~/bin/joe https://github.com/karan/joe/releases/download/1.0.1/joe
# chmod +x ~/bin/joe

brew cleanup

e_success "Done!"

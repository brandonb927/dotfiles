#!/usr/bin/env bash

source ./utils.sh

e_header "Installing homebrew"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" \
  && brew doctor \
  && brew update

e_success "Done!"

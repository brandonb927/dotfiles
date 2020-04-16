#!/usr/bin/env bash

source ./utils.sh

e_header "Installing fonts"

brew tap homebrew/cask-fonts

brew cask install \
  font-hack-nerd-font

e_success "Done!"

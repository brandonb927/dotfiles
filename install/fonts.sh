#!/usr/bin/env bash

source ./utils.sh

e_header "Installing fonts"

brew tap homebrew/cask-fonts

brew cask install \
  font-hack-nerd-font \
  font-cascadia \
  font-cascadia-mono \
  font-cascadia-pl \
  font-cascadia-mono-pl

e_success "Done!"

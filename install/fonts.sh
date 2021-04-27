#!/usr/bin/env bash

source ./utils.sh

e_header "Installing fonts"

brew tap homebrew/cask-fonts

brew install \
  font-hack-nerd-font \
  font-cascadia \
  font-cascadia-pl \
  font-cascadia-mono-pl

e_success "Done!"

#!/usr/bin/env bash

source ./utils.sh

e_header "Installing fonts"

brew tap homebrew/cask-fonts

brew install \
  font-hack-nerd-font \
  font-cascadia-code \
  font-cascadia-code-pl \
  font-cascadia-mono-pl \
  font-comic-mono \
  font-comix-neue

e_success "Done!"

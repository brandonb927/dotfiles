#!/usr/bin/env bash

source ./utils.sh

e_header "Installing fonts"

brew tap caskroom/fonts

brew cask install \
  font-hack-nerd-font
  font-inconsolata-g-for-powerline

e_success "Done!"

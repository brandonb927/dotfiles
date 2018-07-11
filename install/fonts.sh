#!/usr/bin/env bash

source ./utils.sh

e_header "Installing fonts"

brew tap caskroom/fonts

brew cask install \
  font-awesome-terminal-fonts \
  font-fira-code \
  font-fira-mono font-fira-mono-for-powerline \
  font-inconsolata-g-for-powerline \
  font-source-code-pro font-source-code-pro-for-powerline

e_success "Done!"

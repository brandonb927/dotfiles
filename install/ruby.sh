#!/usr/bin/env bash

source ./utils.sh

e_header "Installing various versions of ruby"

if $(command -v rbenv); then
  rbenv install 2.4.2
  rbenv install 2.5.1
  rbenv install 2.6.3
  rbenv global 2.6.3

  e_success "Done!"
else
  e_error "Failed to install ruby versions"
fi

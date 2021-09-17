#!/usr/bin/env bash

source ./utils.sh

e_header "Installing various versions of ruby"

if type_exists 'rbenv'; then
  rbenv install 2.7.4
  rbenv install 3.0.2
  rbenv global 2.7.4

  e_success "Done!"
else
  e_error "Failed to install ruby versions"
fi

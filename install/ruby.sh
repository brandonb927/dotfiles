#!/usr/bin/env bash

source ./utils.sh

e_header "Installing various versions of ruby"

if type_exists 'rbenv'; then
  rbenv install 2.6.5
  rbenv global 2.6.5

  e_success "Done!"
else
  e_error "Failed to install ruby versions"
fi

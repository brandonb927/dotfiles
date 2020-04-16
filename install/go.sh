#!/usr/bin/env bash

source ./utils.sh

e_header "Installing a go version manager and go versions"

if type_exists 'goenv'; then
  goenv install 1.10.3
  goenv install 1.11.4

  e_success "Done!"
else
  e_error "Failed to install go versions"
fi


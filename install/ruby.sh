#!/usr/bin/env bash

source ./utils.sh

e_header "Installing various versions of ruby"


if $(command -v rbenv); then
  rbenv install 2.4.2
  rbenv install 2.5.0
  rbenv global 2.5.0

  e_success "Done!"
else
  e_error "Failed to install ruby versions"
fi

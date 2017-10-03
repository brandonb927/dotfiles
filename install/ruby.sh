#!/usr/bin/env bash

source ./utils.sh

e_header "Installing various versions of ruby"


if rbenv --version; then
  rbenv install 2.4.2
  rbenv global 2.4.2

  e_success "Done!"
else
  e_error "Failed to install ruby versions"
fi

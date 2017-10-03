#!/usr/bin/env bash

source ./utils.sh

e_header "Installing python packages"

if pyenv --version; then
  pip install flake8 saws

  e_success "Done!"
else
  e_error "Failed to install python packages"
fi

e_success "Done!"

#!/usr/bin/env bash

source ./utils.sh

e_header "Installing various versions of python"

if pyenv --version; then
  # Because of old python version
  CFLAGS="-I$(brew --prefix openssl)/include" LDFLAGS="-L$(brew --prefix openssl)/lib" pyenv install 2.7.8
  pyenv install 2.7.15
  pyenv install 3.7.0
  pyenv global 3.7.0

  e_success "Done!"
else
  e_error "Failed to install python versions"
fi

#!/usr/bin/env bash

source ./utils.sh

e_header "Installing various versions of python"

if pyenv --version; then
  CFLAGS="-I$(brew --prefix openssl)/include" LDFLAGS="-L$(brew --prefix openssl)/lib" pyenv install 2.7.8
  CFLAGS="-I$(brew --prefix openssl)/include" LDFLAGS="-L$(brew --prefix openssl)/lib" pyenv install 2.7.13
  CFLAGS="-I$(brew --prefix openssl)/include" LDFLAGS="-L$(brew --prefix openssl)/lib" pyenv global 2.7.13

  e_success "Done!"
else
  e_error "Failed to install python versions"
fi

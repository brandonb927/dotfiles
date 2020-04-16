#!/usr/bin/env bash

source ./utils.sh

e_header "Installing various versions of python"

if pyenv --version; then
  # For compilers to find zlib you may need to set:
  export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib"
  export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include"

  # For pkg-config to find zlib you may need to set:
  export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig"

  # Because of old python version
  #CFLAGS="-I$(brew --prefix openssl)/include" LDFLAGS="-L$(brew --prefix openssl)/lib" pyenv install 2.7.8
  pyenv install 2.7.17
  pyenv install 3.8.2
  pyenv global 3.8.2

  e_success "Done!"
else
  e_error "Failed to install python versions"
fi

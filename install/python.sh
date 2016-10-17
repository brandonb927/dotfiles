#!/usr/bin/env bash

source ./utils.sh

e_header "Installing various versions of python"

CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" pyenv install 2.7.8
CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" pyenv install 2.7.10
CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" pyenv global 2.7.10

e_success "Done!"
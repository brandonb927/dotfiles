#!/usr/bin/env bash

source ./utils.sh

e_header "Installing various versions of ruby"

rbenv install 2.2.3
rbenv global 2.2.3

e_success "Done!"
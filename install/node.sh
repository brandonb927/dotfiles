#!/usr/bin/env bash

source ./utils.sh

e_header "Installing node nvm"

curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
. ~/.nvm/nvm.sh > /dev/null
nvm install 8
nvm alias stable 8
nvm alias default 8
nvm use 8

e_success "Done!"

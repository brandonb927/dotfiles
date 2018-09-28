#!/usr/bin/env bash

source ./utils.sh

e_header "Installing node nvm"

curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
. ~/.nvm/nvm.sh > /dev/null
nvm install 10
nvm alias stable 10
nvm alias default 10
nvm alias node 10
nvm alias system 10
nvm use 10
nvm install 8

e_success "Done!"

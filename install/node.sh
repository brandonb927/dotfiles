#!/usr/bin/env bash

source ./utils.sh

e_header "Installing node, nvm, and npm"

# For more info, see here https://gist.github.com/DanHerbert/9520689
brew install node --without-npm

curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
. ~/.nvm/nvm.sh > /dev/null
nvm install 6
nvm alias stable 6
nvm alias default 6
nvm use 6

e_success "Done!"
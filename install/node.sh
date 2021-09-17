#!/usr/bin/env bash

source ./utils.sh

e_header "Installing node nvm"

export VERSION=12
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
. ~/.nvm/nvm.sh > /dev/null

nvm install ${VERSION}
nvm alias stable ${VERSION}
nvm alias default ${VERSION}
nvm alias node ${VERSION}
nvm alias system ${VERSION}
nvm use ${VERSION}

nvm install 14

e_success "Done!"

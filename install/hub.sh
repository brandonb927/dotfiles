#!/usr/bin/env bash

source ./utils.sh

e_header "Installing hub 2.3.0-pre10 for Github"

mkdir -p ~/bin
wget -q https://github.com/github/hub/releases/download/v2.3.0-pre10/hub-darwin-amd64-2.3.0-pre10.tgz -O- | tar -xzO \*/bin/hub > ~/bin/hub
chmod +x ~/bin/hub
hub version

e_success "Done!"

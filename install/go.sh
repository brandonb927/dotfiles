#!/usr/bin/env bash

source ./utils.sh

e_header "Installing gvm and go versions"

curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer | zsh

source ~/.gvm/scripts/gvm
gvm install go1.4 -B
gvm use go1.4
export GOROOT_BOOTSTRAP=$GOROOT
#gvm install go1.5
#gvm install go1.6
#gvm uninstall go1.4

e_success "Done!"
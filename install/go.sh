#!/usr/bin/env bash

source ./utils.sh

e_header "Installing a go version manager and go versions"

goenv install 1.10.3

e_success "Done!"

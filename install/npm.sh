#!/usr/bin/env bash

source ./utils.sh

e_header "Installing npm modules"

packages=(
  nodemon
  resume-cli
  speed-test
  surge
  trash-cli
)

npm install -g ${packages[@]}

e_success "Done!"

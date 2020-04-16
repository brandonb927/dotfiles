#!/usr/bin/env bash

source ./utils.sh

e_header "Installing npm modules"

packages=(
  create-react-app
  nodemon
  resume-cli
  speed-test
  surge
)

npm install -g ${packages[@]}

e_success "Done!"

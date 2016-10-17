#!/usr/bin/env bash

source ./utils.sh

e_header "Installing python packages"

sudo pip install flake8 doge thefuck glances saws

e_success "Done!"
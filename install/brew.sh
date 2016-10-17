#!/usr/bin/env bash

source ./utils.sh

e_header "Installing homebrew"

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" \
	&& brew doctor \
	&& brew update

e_success "Done!"
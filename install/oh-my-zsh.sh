#!/usr/bin/env bash

source ./utils.sh

e_header "Installing oh-my-zsh"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

e_success "Done!"

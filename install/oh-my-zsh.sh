#!/usr/bin/env bash

source ./utils.sh

e_header "Installing oh-my-zsh"
e_arrow "NOTE: You'll need to restart this installation after installing oh-my zsh and the shell changes to zsh"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

e_success "Done!"

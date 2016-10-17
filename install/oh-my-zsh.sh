#!/usr/bin/env bash

source ./utils.sh

e_header "Installing oh-my-zsh"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

e_arrow "Installing oh-my-zsh custom plugins"

mkdir -p ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone git://github.com/lukechilds/zsh-nvm.git ~/.oh-my-zsh/custom/plugins/zsh-nvm

e_success "Done!"
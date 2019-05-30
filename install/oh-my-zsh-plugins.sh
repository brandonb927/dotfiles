#!/usr/bin/env bash

source ./utils.sh

e_arrow "Installing oh-my-zsh custom theme & plugins"

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

mkdir -p ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone git://github.com/lukechilds/zsh-nvm.git ~/.oh-my-zsh/custom/plugins/zsh-nvm

e_success "Done!"

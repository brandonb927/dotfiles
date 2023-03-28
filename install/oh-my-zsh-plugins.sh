#!/usr/bin/env bash

source ./utils.sh

e_arrow "Installing oh-my-zsh custom theme & plugins"

ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

mkdir -p $ZSH_CUSTOM/plugins

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

e_success "Done!"

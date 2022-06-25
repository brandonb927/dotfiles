#!/usr/bin/env bash

source ./utils.sh

e_arrow "Installing oh-my-zsh custom theme & plugins"

git clone --depth=1 git://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

mkdir -p ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone git://github.com/lukechilds/zsh-nvm.git $ZSH_CUSTOM/plugins/zsh-nvm

e_success "Done!"

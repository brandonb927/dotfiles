#!/usr/bin/env bash

source ./utils.sh

e_arrow "Installing oh-my-zsh custom theme & plugins"

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

mkdir -p ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
git clone git://github.com/lukechilds/zsh-nvm.git ${ZSH_CUSTOM}/plugins/zsh-nvm
#git clone git://github.com/iam4x/zsh-iterm-touchbar.git $ZSH_CUSTOM/plugins/zsh-iterm-touchbar

e_success "Done!"

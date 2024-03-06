#!/usr/bin/env bash

source ./utils.sh

echo ""
echo "Install fish shell and plugins?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  e_header "Installing fish"
  brew install fish

  e_header "Change default shell to fish"
  sudo sh -c 'echo /opt/homebrew/bin/fish >> /etc/shells'
  chsh -s /opt/homebrew/bin/fish
  fish_add_path /opt/homebrew/bin

  e_header "Installing fisher"
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

  e_header "Installing theme and plugins"
  fisher install IlanCosman/tide@v6 # like p10k theme but for fish
  fisher install jhillyerd/plugin-git
  fisher install rstacruz/fish-asdf
fi

e_success "Done!"

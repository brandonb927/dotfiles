#!/usr/bin/env bash

source ./utils.sh

e_header " Installing Mac App Store (MAS) CLI and apps"

brew install argon/mas/mas

e_arrow "Installing Mac App Store apps" $cyan

mas install 425424353   # The Unarchiver
mas install 692867256   # Simplenote
mas install 682658836   # GarageBand
# mas install 1127487414  # Install macOS Sierra
mas install 497799835   # Xcode (8.0)

e_success "Done!"
#!/usr/bin/env bash

source ./utils.sh

e_header " Installing Mac App Store (MAS) CLI and apps"

brew install argon/mas/mas

e_arrow "Installing Mac App Store apps" $cyan

# mas install 1127487414  # Install macOS Sierra
mas install 497799835 # Xcode (8.2.1)
mas install 425424353 # The Unarchiver (3.11.1)
mas install 824183456 # Affinity Photo (1.5.2)
mas install 692867256 # Simplenote (1.1.8)
mas install 1091189122 # Bear (1.1)
mas install 408981434 # iMovie (10.1.4)
mas install 682658836 # GarageBand (10.1.6)

e_success "Done!"

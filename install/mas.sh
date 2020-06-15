#!/usr/bin/env bash

source ./utils.sh

e_header " Installing Mac App Store (MAS) CLI and apps"

brew install mas-cli/tap/mas

e_arrow "Installing Mac App Store apps" $cyan

# Install this first because it will take the longest
#mas install 497799835 # Xcode (9.4.1)

mas install 824183456  # Affinity Photo (1.6.7)
mas install 425424353  # The Unarchiver (4.0.0)
mas install 1294126402 # HEIC Converter (1.2.0)
mas install 595191960  # CopyClip (1.9.3)
mas install 937984704  # Amphetamine (5.0.2)
#mas install 682658836 # GarageBand (10.3.1)
#mas install 408981434 # iMovie (10.1.9)

e_success "Done!"

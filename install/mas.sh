#!/usr/bin/env bash

source ./utils.sh

e_header " Installing Mac App Store (MAS) CLI and apps"

brew install mas

e_arrow "Installing Mac App Store apps" $cyan

# Install this first because it will take the longest
#mas install 1215244636  # YI Home
mas install 1522267256  # Shareful
#mas install 408981434   # iMovie
#mas install 937984704   # Amphetamine
#mas install 1518036000  # Sequel Ace
#mas install 824183456   # Affinity Photo
#mas install 1529006487  # Recordia
mas install 425424353   # The Unarchiver
#mas install 1294126402  # HEIC Converter
#mas install 1507396839  # Abyss

e_success "Done!"

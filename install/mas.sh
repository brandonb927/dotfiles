#!/usr/bin/env bash

source ./utils.sh

e_header " Installing Mac App Store (MAS) CLI and apps"

brew install mas

e_arrow "Installing Mac App Store apps" $cyan

# Install this first because it will take the longest
mas install 1215244636  YI Home         (1.1.9)
mas install 1522267256  Shareful        (1.2.2)
#mas install 595191960   CopyClip        (1.9.7)
#mas install 408981434   iMovie          (10.2.2)
mas install 937984704   Amphetamine     (5.1.1)
mas install 1518036000  Sequel Ace      (3.2.2)
mas install 824183456   Affinity Photo  (1.9.1)
#mas install 1529006487  Recordia        (1.3.0)
mas install 425424353   The Unarchiver  (4.2.4)
mas install 1294126402  HEIC Converter  (1.9.0)

e_success "Done!"

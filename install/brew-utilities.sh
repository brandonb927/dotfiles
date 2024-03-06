#!/usr/bin/env bash

source ./utils.sh

e_header "Installing brew utilities"

binaries=(
  bash                                  # up-to-date bash version
  bat                                   # cat clone with syntax highlighting and git integration https://github.com/sharkdp/bat
  coreutils                             # gnu coreutils
  curl                                  # up-to-date version of curl
  dialog                                # used in shell scripts to present questions/display msgs https://invisible-island.net/dialog/
  direnv                                # https://github.com/direnv/direnv
  diff-so-fancy                         # best-lookin git diffs https://github.com/so-fancy/diff-so-fancy
  ffmpeg                                # streaming media editing tool
  findutils                             # gnu findutils
  fzf                                   # Fuzzy finder
  git                                   # up-to-date version of git
  git-extras                            # extra git utilities https://github.com/tj/git-extras
  git-fresh                             # some more git utilities to keep git clean https://github.com/imsky/git-fresh
  graphicsmagick                        # very powerful image processor
  gh                                    # GitHub CLI tool
  imagemagick                           # another image processor
  jq                                    # lightweight, flexible json parser https://stedolan.github.io/jq/
  normalize                             # adjust the volume of an audio file https://www.nongnu.org/normalize/
  pango                                 # Dependency for brandonb.ca blog
  spaceman-diff                         # diff images from the CLI https://github.com/holman/spaceman-diff
  tree                                  # fast recursive directory listing tool http://mama.indstate.edu/users/ice/tree/
  wget                                  # up-to-date wget
)

e_arrow "Installing brew packages"

brew install ${binaries[@]}

e_arrow "Installing GNU version of utils"

gbinaries=(
  grep
  gnu-sed
)
brew install ${gbinaries[@]}

brew cleanup

e_success "Done!"

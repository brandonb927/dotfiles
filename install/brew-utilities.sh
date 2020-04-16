#!/usr/bin/env bash

source ./utils.sh

e_header "Installing brew utilities"

binaries=(
  awscli                                # AWS CLI tool https://aws.amazon.com/cli/
  bash                                  # up-to-date bash version
  bat                                   # cat clone with syntax highlighting and git integration https://github.com/sharkdp/bat
  certbot                               # Let's Encrypt tool from EFF https://certbot.eff.org/
  coreutils                             # gnu coreutils
  curl                                  # up-to-date version of curl
  dialog                                # used in shell scripts to present questions/display msgs https://invisible-island.net/dialog/
  diff-so-fancy                         # best-lookin git diffs https://github.com/so-fancy/diff-so-fancy
  dry                                   # docker manager https://github.com/moncho/dry
  ffmpeg                                # streaming media editing tool
  figlet                                # text to ascii art converter http://www.figlet.org/
  findutils                             # gnu findutils
  git                                   # up-to-date version of git
  git-extras                            # extra git utilities https://github.com/tj/git-extras
  git-fresh                             # some more git utilities to keep git clean https://github.com/imsky/git-fresh
  glances                               # https://github.com/nicolargo/glances
  graphicsmagick                        # very powerful image processor
  heroku/brew/heroku                    # Heroku CLI tool
  hub                                   # GitHub CLI tool
  htop                                  # The best process monitor
  httpie                                # curl, but better https://github.com/jakubroztocil/httpie
  imagemagick                           # another image processor
  jq                                    # lightweight, flexible json parser https://stedolan.github.io/jq/
  m-cli                                 # macos tool https://github.com/rgcr/m-cli
  neofetch                              # get info on the running system https://github.com/dylanaraps/neofetch
  ncdu                                  # ncurses disk usage https://dev.yorhel.nl/ncdu
  normalize                             # adjust the volume of an audio file https://www.nongnu.org/normalize/
  peco                                  # interactive filtering tool https://github.com/peco/peco
  pv                                    # monitor progress of data through a pipeline between any two processes https://www.ivarch.com/programs/pv.shtml
  pyenv                                 # manage python versions easily https://github.com/pyenv/pyenv
  pyenv-virtualenv                      # manage virtualenvs for different python versions https://github.com/pyenv/pyenv-virtualenv
  rbenv                                 # manage ruby versions easily https://github.com/rbenv/rbenv
  ruby-build                            # dep for rbenv https://github.com/rbenv/ruby-build
  getsentry/tools/sentry-cli            # sentry.io cli tool
  spaceman-diff                         # diff images from the CLI https://github.com/holman/spaceman-diff
  tig                                   # ncurses interface for git https://jonas.github.io/tig/
  tree                                  # fast recursive directory listing tool http://mama.indstate.edu/users/ice/tree/
  wget                                  # up-to-date wget
  youtube-dl                            # download a youtube (or other) video by URL or ID https://rg3.github.io/youtube-dl/
)

brew tap colinstein/imgcat # https://github.com/colinstein/homebrew-imgcat
brew tap moncho/dry

e_arrow "Installing brew packages"

# brew install TomAnthony/brews/itermocil # Don't use it as much as I'd like
for binary in "${binaries[@]}"; do
  brew install $binary
done

e_arrow "Installing GNU version of utils"

gbinaries=(
  grep
  gnu-sed
)
brew install ${gbinaries[@]} --with-default-names

brew cleanup
brew prune

e_success "Done!"

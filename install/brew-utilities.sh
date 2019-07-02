#!/usr/bin/env bash

source ./utils.sh

e_header "Installing brew utilities"

binaries=(
  awscli                                # AWS CLI tool https://aws.amazon.com/cli/
  bash                                  # up-to-date bash version
  bat                                   # cat clone with syntax highlighting and git integration https://github.com/sharkdp/bat
  boost                                 # dep for python
  boost-python                          # dep for python
  certbot                               # Let's Encrypt tool from EFF https://certbot.eff.org/
  cmake                                 # C-version of make?
  coreutils                             # gnu coreutils
  ctop                                  # Docker container process monitor
  curl                                  # up-to-date version of curl
  dialog                                # used in shell scripts to present questions/display msgs https://invisible-island.net/dialog/
  diff-so-fancy                         # best-lookin git diffs https://github.com/so-fancy/diff-so-fancy
  dry                                   # docker manager https://github.com/moncho/dry
  faac                                  # mpeg-4 and mpeg-2 aac encoder
  ffmpeg                                # streaming media editing tool
  figlet                                # text to ascii art converter http://www.figlet.org/
  findutils                             # gnu findutils
  fzf                                   # fuzzy finder for CLI https://github.com/junegunn/fzf
  git                                   # up-to-date version of git
  git-extras                            # extra git utilities https://github.com/tj/git-extras
  git-fresh                             # some more git utilities to keep git clean https://github.com/imsky/git-fresh
  glances                               # https://github.com/nicolargo/glances
  goenv                                 # manage Go lang versions easily https://github.com/syndbg/goenv
  graphicsmagick                        # very powerful image processor
  graphviz                              # generates graphs from python data?
  heroku/brew/heroku                    # Heroku CLI tool
  hub                                   # GitHub CLI tool
  htop                                  # The best process monitor
  httpie                                # curl, but better https://github.com/jakubroztocil/httpie
  imagemagick                           # another image processor
  imagesnap                             # capture webcam images from CLI https://github.com/rharder/imagesnap
  jp2a                                  # jpg to ascii converter https://csl.name/jp2a/
  jq                                    # lightweight, flexible json parser https://stedolan.github.io/jq/
  libmemcached                          # dep for memcached
  m-cli                                 # macos tool https://github.com/rgcr/m-cli
  memcached                             # memcache binary
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
  shml                                  # shell markup language https://github.com/odb/shml
  spaceman-diff                         # diff images from the CLI https://github.com/holman/spaceman-diff
  sslmate                               # buy SSL certs from CLI https://github.com/SSLMate/sslmate
  tig                                   # ncurses interface for git https://jonas.github.io/tig/
  tree                                  # fast recursive directory listing tool http://mama.indstate.edu/users/ice/tree/
  wget                                  # up-to-date wget
  wifi-password                         # get your wifi password https://github.com/rauchg/wifi-password
  yarn                                  # package manager by Facebook
  you-get                               # downloader that scrapes the web https://github.com/soimort/you-get
  youtube-dl                            # download a youtube (or other) video by URL or ID https://rg3.github.io/youtube-dl/
)

# brew tap pebble/pebble-sdk # Fitbit owns Pebble now. RIP.
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

# Installed separately
# brew install gnu-tar

brew cleanup
brew prune

e_success "Done!"

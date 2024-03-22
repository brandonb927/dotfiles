#!/usr/bin/env bash

source ./utils.sh

# Make the user-relative bin folder to install things to
mkdir -p ~/bin

if [ ! $(command -v brew) ]; then
  e_header "Installing homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" && brew update
fi

echo ""
echo "Install asdf and languages/versions?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  # zplug https://github.com/zplug/zplug
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

  # asdf version manager https://asdf-vm.com/
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

  # direnv
  asdf plugin-add direnv
  asdf direnv setup --shell zsh --version latest

  echo ""
  echo "Install node?  (y/n)"
  read -r response
  if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    e_header "Installing node versions"

    asdf plugin-add nodejs
    asdf install nodejs latest:20
    asdf global nodejs latest:20
  fi

  echo ""
  echo "Install global npm packages?  (y/n)"
  read -r response
  if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    e_header "Installing npm modules"

    packages=(
      nodemon
      resume-cli
      speed-test
      surge
      trash-cli
    )

    npm install -g ${packages[@]}
  fi


  echo ""
  echo "Install ruby and versions?  (y/n)"
  read -r response
  if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    e_header "Installing various versions of ruby"

    asdf plugin-add ruby
    asdf install ruby latest:3
    asdf global ruby latest:3
  fi

  echo ""
  echo "Install python and versions?  (y/n)"
  read -r response
  if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    e_header "Installing python and versions"

    # For compilers to find zlib you may need to set:
    # export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib"
    # export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include"

    # For pkg-config to find zlib you may need to set:
    # export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig"

    # Because of old python version
    #CFLAGS="-I$(brew --prefix openssl)/include" LDFLAGS="-L$(brew --prefix openssl)/lib" pyenv install 2.7.8
    asdf plugin-add python
    # asdf install python latest:2
    asdf install python latest:3
    asdf global python latest:3
  fi

  echo ""
  echo "Install Go and latest version?  (y/n)"
  read -r response
  if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    e_header "Installing go and versions"

    asdf plugin add go
    asdf install go latest:1
  fi
fi

echo ""
echo "Install fonts?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  e_header "Installing fonts"

  brew tap homebrew/cask-fonts
  brew install \
    font-hack-nerd-font \
    font-cascadia-code \
    font-cascadia-code-pl \
    font-cascadia-mono-pl \
    font-comic-mono \
    font-comix-neue
fi

echo ""
echo "Install brew utilities?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  e_header "Installing brew utilities"

  binaries=(
    bash                                  # up-to-date bash version
    bat                                   # cat clone with syntax highlighting and git integration https://github.com/sharkdp/bat
    coreutils                             # gnu coreutils
    curl                                  # up-to-date version of curl
    dialog                                # used in shell scripts to present questions/display msgs https://invisible-island.net/dialog/
    direnv                                # https://github.com/direnv/direnv
    diff-so-fancy                         # best-lookin git diffs https://github.com/so-fancy/diff-so-fancy
    difftastic                            # structural diff tool https://github.com/Wilfred/difftastic
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
fi

echo ""
echo "Install brew cask apps?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  e_header "Installing brew cask apps"

  brew tap homebrew/cask-versions

  apps=(
    1password
    1password/tap/1password-cli
    appcleaner
    applepi-baker
    audio-hijack
    bartender
    daisydisk
    discord
    expressvpn
    flux
    google-chrome
    iterm2
    kap
    keybase
    logi-options-plus
    loopback
    ngrok
    parsec
    plex
    raycast
    raspberry-pi-imager
    soundsource
    spotify
    stats
    stay
    steam
    sync
    visual-studio-code
    vlc
    webtorrent
    zoom
  )

  brew install --cask ${apps[@]}

  # e_arrow "Installing QuickLook plugins"
  # from https://github.com/sindresorhus/quick-look-plugins
  #brew install qlcolorcode \
  #  qlstephen \
  #  qlmarkdown \
  #  quicklook-json \
  #  qlimagesize \
  #  suspicious-package \
  #  quicklookase \
  #  qlvideo
fi

echo ""
echo "Install mac app store apps?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  brew install mas
  mas install 425424353   # The Unarchiver
  mas install 888422857   # Overcast
  mas install 1294126402  # HEIC Converter
  mas install 1451685025  # Wireguard
  mas install 1522267256  # Shareful
  mas install 6444667067  # Hyperduck
fi

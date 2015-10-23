#! /bin/sh

black='\033[0;30m'
blue='\033[0;34m'
green='\033[0;32m'
cyan='\033[0;36m'
red='\033[0;31m'br
purple='\033[0;35m'
brown='\033[0;33m'
gray='\033[0;37m'
dark_gray='\033[1;30m'n
light_blue='\033[1;34m'
light_green='\033[1;32m'
light_cyan='\033[1;36m'
light_red='\033[1;31m'n
light_purple='\033[1;35m'
yellow='\033[1;33m'
white='\033[1;37m'

alias Reset="tput sgr0"      #  Reset text attributes to normal
                             #+ without clearing screen.

# Color-echo.
# Argument $1 = messageu
# Argument $2 = Colortt
cecho() {
    echo "${2}${1}"
    Reset # Reset to normal.
    return
}

echo ""
cecho "===================================================" $dark_gray
cecho "Install homebrew? (y/n)" $gray
cecho "===================================================" $dark_gray
read -r response
case $response in
  [yY])
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
    brew update
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $dark_gray
cecho "Install oh-my-zsh? (y/n)" $gray
cecho "===================================================" $dark_gray
read -r response
case $response in
  [yY])
    echo ""
    echo "Installing oh-my-zsh"
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

    echo ""
    echo "Installing oh-my-zsh"
    mkdir -p ~/.oh-my-zsh/custom/plugins
    cd ~/.oh-my-zsh/custom/plugins
    git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
    cd ~

    echo ""
    echo "SHML - Shell Markup Language"
    curl -s https://raw.githubusercontent.com/maxcdn/shml/master/shml.sh -o /usr/local/bin/shml && chmod +x /usr/local/bin/shml
    
    break;;

  *) break;;
esac

echo ""
cecho "===================================================" $dark_gray
cecho "Install brew utilities? (y/n)" $gray
cecho "===================================================" $dark_gray
read -r response
case $response in
  [yY])
    binaries=(
      bash
      coreutils
      curl
      findutils
      figlet
      ffmpeg
      ghi
      git
      gitignore
      heroku-toolbelt
      htop
      httpie
      imagemagick
      imagesnap
      ncdu
      pv
      pyenv
      pyenv-virtualenv
      pyenv-virtualenvwrapper
      rbenv
      ruby-build
      ssh-copy-id
      youtube-dl
      watch
      wget
    )

    # Install latest version of hub
    brew install --HEAD hub
    
    # Fix ffmpeg install
    brew reinstall ffmpeg --with-faac

    echo ""
    echo "Tapping for Joe (for .gitignore)"
    brew tap karan/karan
    
    echo ""
    echo "Install iTerm2 layout helpers"
    brew install TomAnthony/brews/itermocil

    echo ""
    echo "Installing sudolikeaboss"
    brew tap ravenac95/sudolikeaboss
    brew install sudolikeaboss sudolikeaboss-workaround
    sudolikeaboss-setup-workaround

    echo ""
    echo "Installing GNU version of grep"
    brew tap homebrew/dupes
    brew install homebrew/dupes/grep
    mkdir -p ~/bin
    ln -s /usr/local/Cellar/grep/2.21/bin/ggrep ~/bin/ggrep

    echo ""
    echo "Installing brew packages"
    brew install ${binaries[@]}

    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $dark_gray
cecho "Install various versions of python? (y/n)" $gray
cecho "===================================================" $dark_gray
read -r response
case $response in
  [yY])
    echo ""
    cecho "Installing python versions" $gray
    pyenv install 2.7.6
    pyenv install 2.7.8
    pyenv install 2.7.10
    pyenv global 2.7.10
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $dark_gray
cecho "Install python packages? (y/n)" $gray
cecho "===================================================" $dark_gray
read -r response
case $response in
  [yY])
    echo ""
    cecho "Installing some python packages" $gray
    sudo pip install flake8 doge thefuck glances saws
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $dark_gray
cecho "Install node and npm? (y/n)" $gray
cecho "===================================================" $dark_gray
read -r response
case $response in
  [yY])
    echo ""
    cecho "Installing node (without npm)" $gray
    # For more info, see here https://gist.github.com/DanHerbert/9520689
    brew install node --without-npm

    echo ""
    cecho "Installing nvm to manage node versions" $gray
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $dark_gray
cecho "Install node versions? (y/n)" $gray
cecho "===================================================" $dark_gray
read -r response
case $response in
  [yY])
    echo ""
    cecho "Installing node versions" $gray
    . ~/.nvm/nvm.sh > /dev/null
    nvm install 0.12
    nvm install 4
    nvm alias stable 4
    nvm alias default 4
    nvm use 4
     break;;
  *) break;;
esac

echo ""
cecho "===================================================" $dark_gray
cecho "Install npm modules? (y/n)" $gray
cecho "===================================================" $dark_gray
read -r response
case $response in
  [yY])
    echo ""
    cecho "Installing some global modules" $gray
    npm install -g bower bower-update
    npm install -g caniuse-cmd clean-css coffee-script csslint
    npm install -g empty-trash
    npm install -g git-auto github-labeller grunt grunt-cli gulp generator-gruntplugin
    npm install -g hicat html-minifier http-server
    npm install -g is-up
    npm install -g js-beautify js2coffee jscs jspm
    npm install -g keybase-installer
    npm install -g less
    npm install -g nodemon
    npm install -g maildev markdown-live
    npm install -g npm-check-updates npm-release
    npm install -g peerflix perfschool public-ip
    npm install -g release-it reveal-md resume-cli
    npm install -g sshync speed-test standard surge svgo
    npm install -g uglifycss uglify-js underscore-cli
    npm install -g vtop
    npm install -g wallpaper
    npm install -g yo
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $dark_gray
cecho "Install brew cask and apps? (y/n)" $gray
cecho "===================================================" $dark_gray
read -r response
case $response in
  [yY])
    echo ""
    cecho "Installing cask" $gray
    brew tap caskroom/versions
    brew install caskroom/cask/brew-cask

    echo ""
    echo "Installing brew-cask apps"
    apps=(
      1password
      air-video-server-hd
      alfred
      amazon-cloud-drive
      appcleaner
      atom
      bartender
      beamer
      cdock
      cheatsheet
      cinch
      cyberduck
      daisydisk
      dropbox
      easysimbl
      evernote
      firefox
      firefoxdeveloperedition
      fluid
      flux
      google-chrome
      google-chrome-canary
      imageoptim
      istat-menus
      iterm2-nightly
      licecap
      otto
      skitch
      skype
      slack
      spectacle
      stay
      steam
      teamviewer
      telegram
      transmission
      vagrant
      vagrant-manager
      vlc
      virtualbox
    )

    brew cask install --appdir="/Applications" ${apps[@]}
    brew cask cleanup
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $dark_gray
cecho "Install fonts? (y/n)" $gray
cecho "===================================================" $dark_gray
read -r response
case $response in
  [yY])
    echo ""
    echo "Installing brew-cask fonts"
    brew tap caskroom/fonts
    fonts=(
      font-comic-neue
      font-droid-sans
      font-droid-sans-mono
      font-meslo-lg
      font-open-sans
      font-open-sans-condensed
      font-roboto
      font-source-code-pro
    )

    brew cask install ${fonts[@]}

    echo ""
    echo "Installing all Google Web Fonts"
    curl https://raw.githubusercontent.com/qrpike/Web-Font-Load/master/install.sh | sh

    echo ""
    echo "Downloading and installing Powerline fonts"
    wget https://github.com/powerline/fonts/archive/master.zip -O fonts.zip && unzip fonts.zip
    ./fonts-master/install.sh
    rm -r fonts.zip && rm -r fonts-master
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $dark_gray
cecho "Remember to download the OSX for Hackers script:" $gray
cecho "https://gist.github.com/brandonb927/3195465" $gray
cecho "===================================================" $dark_gray

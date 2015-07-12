#! /bin/sh

black='\033[0;30m'
white='\033[0;37m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'

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
cecho "===================================================" $white
cecho "Install the XCode Command-line Tools? (y/n)" $blue
cecho "===================================================" $white
read -r response
case $response in
  [yY])
    echo ""
    echo "Installing the Xcode Command-line tools"
    xcode-select --install
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $white
cecho "Install oh-my-zsh and Tomorrow Night Eighties theme? (y/n)" $blue
cecho "===================================================" $white
read -r response
case $response in
  [yY])
    echo ""
    echo "Installing oh-my-zsh"
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

    echo ""
    echo "Installing oh-my-zsh"
    cd ~/.oh-my-zsh/custom/plugins
    git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
    cd ~/

  *) break;;
esac

echo ""
cecho "===================================================" $white
cecho " 🍺  Install homebrew? (y/n)" $blue
cecho "===================================================" $white
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
cecho "===================================================" $white
cecho "Install brew utilities? (y/n)" $blue
cecho "===================================================" $white
read -r response
case $response in
  [yY])
    binaries=(
      bash
      chruby
      coreutils
      curl
      findutils
      git
      gitignore
      heroku-toolbelt
      httpie
      imagemagick
      imagesnap
      pyenv
      pyenv-virtualenv
      pyenv-virtualenvwrapper
      ruby-install
      ssh-copy-id
      wget
    )

    brew install --HEAD hub

    echo ""
    echo "Tapping for Joe (for .gitignore)"
    brew tap karan/karan

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
cecho "===================================================" $white
cecho "Install various versions of python? (y/n)" $blue
cecho "===================================================" $white
read -r response
case $response in
  [yY])
    echo ""
    cecho "Installing python versions" $blue
    pyenv install 2.7.6
    pyenv install 2.7.8
    pyenv install 2.7.10
    pyenve global 2.7.10
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $white
cecho "Install python packages? (y/n)" $blue
cecho "===================================================" $white
read -r response
case $response in
  [yY])
    echo ""
    cecho "Installing some python packages" $blue
    sudo pip install flake8 doge thefuck
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $white
cecho "Install node and npm? (y/n)" $blue
cecho "===================================================" $white
read -r response
case $response in
  [yY])
    echo ""
    cecho "Installing node (without npm)" $blue
    # For more info, see here https://gist.github.com/DanHerbert/9520689
    brew install node --without-npm

    echo ""
    cecho "Installing nvm to manage node" $blue
    curl https://raw.githubusercontent.com/creationix/nvm/v0.24.1/install.sh | bash
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $white
cecho "Install node/iojs versions? (y/n)" $blue
cecho "===================================================" $white
read -r response
case $response in
  [yY])
    echo ""
    cecho Installing node versions” $blue
    . ~/.nvm/nvm.sh > /dev/null
    nvm install iojs
    nvm install 0.12
    nvm alias stable 0.12
    nvm alias default 0.12
    nvm use 0.12
     break;;
  *) break;;
esac

echo ""
cecho "===================================================" $white
cecho "Install npm modules? (y/n)" $blue
cecho "===================================================" $white
read -r response
case $response in
  [yY])
    echo ""
    cecho "Installing some global modules" $blue
    npm install -g bower bower-update
    npm install -g clean-css coffee-script csslint
    npm install -g grunt grunt-cli gulp generator-gruntplugin
    npm install -g hicat html-minifier
    npm install -g js-beautify js2coffee jscs jspm
    npm install -g keybase-installer
    npm install -g less
    npm install -g nodemon
    npm install -g markdown-live
    npm install -g npm-check-updates npm-release
    npm install -g peerflix
    npm install -g resume-cli
    npm install -g standard surge svgo
    npm install -g uglifycss uglify-js
    npm install -g vtop
    npm install -g wallpaper
    npm install -g yo
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $white
cecho "Install brew cask and apps? (y/n)" $blue
cecho "===================================================" $white
read -r response
case $response in
  [yY])
    echo ""
    cecho "Installing cask" $blue
    brew tap caskroom/versions
    brew install caskroom/cask/brew-cask

    echo ""
    echo "Installing brew-cask apps"
    apps=(
      1password
      air-video-server-hd
      alfred
      appcleaner
      atom
      bartender
      beamer
      cinch
      daisydisk
      dropbox
      evernote
      firefox
      firefoxdeveloperedition
      flux
      google-chrome
      google-chrome-canary
      imageoptim
      istat-menus
      iterm2-nightly
      licecap
      mailbox
      skitch
      skype
      slack
      steam
      teamviewer
      transmission
      vlc
      virtualbox
    )

    brew cask install --appdir="/Applications" ${apps[@]}
    brew cask cleanup
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $white
cecho "Install fonts? (y/n)" $blue
cecho "===================================================" $white
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
cecho "===================================================" $white
cecho "Remember to download the OSX for Hackers script:" $blue
cecho "https://gist.github.com/brandonb927/3195465" $blue
cecho "===================================================" $white

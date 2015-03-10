#! /bin/sh

black='\033[0;30m'
white='\033[0;37m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
h

alias Reset="tput sgr0"      #  Reset text attributes to normal
                             #+ without clearing screen.

# Color-echo.
# Argument $1 = message
# Argument $2 = Color
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
    echo "Copying terminal theme to desktop"
    curl -o Tomorrow\ Night\ Eighties.terminal https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/OS%20X%20Terminal/Tomorrow%20Night%20Eighties.terminal
    break;;
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
      coreutils
      curl
      findutils
      git
      gitignore
      heroku-toolbelt
      httpie
      imagemagick
      parallel
      python
      ssh-copy-id
      wget
    )
    
    brew install --HEAD hub
    
    echo ""
    echo "Tapping for Joe (for .gitignore)"
    brew tap karan/karan
    
    echo ""
    echo "Installing brew packages"
    brew install ${binaries[@]}
    
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
    echo prefix=~/.node >> ~/.npmrc
    curl -L https://www.npmjs.org/install.sh | sh
    export PATH="$HOME/.node/bin:$PATH"
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
    npm install -g bower bower-update castnow foreman-gui grunt grunt-cli gulp hicat \
                             js-beautify js2coffee jscs jspm \
                             keybase-installer less markdown-live \
                             npm-check-updates npm-release peerflix \
                             resume-cli surge uglify-js vtop
                   

    echo ""
    cecho "Installing nvm to manage node" $blue
    curl https://raw.githubusercontent.com/creationix/nvm/v0.23.2/install.sh | bash
    nvm install 0.10
    nvm install 0.11
    nvm install iojs
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $white
cecho "Install pip and python packages? (y/n)" $blue
cecho "===================================================" $white
read -r response
case $response in
  [yY])
    echo ""
    cecho "Installing pip and some python packages" $blue
    sudo easy_install pip
    sudo pip install flake8 mackup pygments requests speedtest-cli virtualenv virtualenvwrapper
    sudo pip install pypthon-gist # installed after everything because it needs request
    sudo pip install doge
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
      air-video-server-hd
      airserver
      alfred
      angry-ip-scanner
      appcleaner
      authy-bluetooth
      atom
      beamer
      chromecast
      cinch
      daisydisk
      dropbox
      duet
      evernote
      firefox
      firefoxdeveloperedition
      flux
      gifrocket
      google-chrome
      google-chrome-canary
      iterm2-nightly
      istat-menus
      licecap
      liteitcon
      mailbox
      onepassword
      pixlr
      recordit
      skitch
      skype
      slack
      steam
      sublime-text3
      teamviewer
      transmission
      vlc
      virtualbox
    )

    brew cask install --appdir="/Applications" ${apps[@]}
    brew cask cleanup
    
    echo ""
    echo "Installing asciinema"
    curl -sL https://asciinema.org/install | sh
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
      font-fira-sans
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
    
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $white
cecho "Remember to download the OSX for Hackers script:" $blue
cecho "https://gist.github.com/brandonb927/3195465" $blue
echo ""
cecho "Also, once you run Alfred remember to run: brew cask alfred link" $blue
cecho "===================================================" $white

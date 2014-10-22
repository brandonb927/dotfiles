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
    cp Tomorrow\ Night\ Eighties.terminal ~/Desktop/Tomorrow\ Night\ Eighties.terminal
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
      heroku-toolbelt
      httpie
      imagemagick
      python
      ssh-copy-id
      wget
    )

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
    npm install -g n grunt-cli gulp hicat js-beautify uglify-js pure-prompt resume-cli keybase-installer npm-release \
        duo nsm

    echo ""
    cecho "Installing node stable and latest" $blue
    n stable
    n latest
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
    sudo pip install mackup pygments speedtest-cli virtualenv virtualenvwrapper flake8
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
      airdisplay
      airmail-beta
      alfred
      appcleaner
      authy-bluetooth
      atom
      cakebrew
      chromecast
      cinch
      daisydisk
      dropbox
      evernote-beta
      firefox
      flux
      gifrocket
      google-chrome
      iterm2-nightly
      istat-menus
      licecap
      mailbox
      onepassword
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
      font-open-sans
      font-open-sans-condensed
      font-roboto
      font-source-code-pro
    )

    brew cask install ${fonts[@]}
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

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
cecho "====================================================================" $white
cecho "Checking if XCode Command Line Tools is installed" $blue
cecho "====================================================================" $white
echo ""

if pkgutil --pkg-info=com.apple.pkg.CLTools_Executables | grep -q "No receipt"; then
  echo "Installing XCode Command Line Tools" $green
  xcode-select --install
else
  echo "Command Line Tools installed, continuing 👍 "
fi

echo ""
cecho "====================================================================" $white
cecho "Install oh-my-zsh?" $blue
cecho "====================================================================" $white
read -r response
case $response in
  [yY][eE][sS]|[yY])
    echo ""
    cecho "Installing zsh" $blue
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
    
    curl -o Tomorrow\ Night\ Eighties.terminal https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/OS%20X%20Terminal/Tomorrow%20Night%20Eighties.terminal
    cp Tomorrow\ Night\ Eighties.terminal ~/Desktop/Tomorrow\ Night\ Eighties.terminal
    
    # copy zsh config files
    cp ./zsh/.zshrc ~/.zshrc
    cp ./zsh/.zprofile ~/.zprofile

    # copy oh-my-zsh theme
    # cp ./zsh/brandonbrown.zsh-theme ~/.oh-my-zsh/themes/brandonbrown.zsh-theme
    ;;
  *)
    ;;
esac

# copy git files
cp .gitconfig ~/.gitconfig
cp .gitignore ~/.gitignore

echo ""
cecho "====================================================================" $white
cecho "Install homebrew and other utilities?" $blue
cecho "====================================================================" $white
read -r response
case $response in
  [yY][eE][sS]|[yY])
    echo ""
    cecho "🍺  Installing homebrew and other utilities" $blue
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
    brew doctor
    brew update
    brew install ssh-copy-id wget curl python node rabbitmq httpie libevent \
                 chruby ruby-install imagemagick postgresql heroku-toolbelt
    
    cecho "Initializing and loading LaunchControl services from previously installed utilities" $blue
    ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
    ln -sfv /usr/local/opt/rabbitmq/*.plist ~/Library/LaunchAgents
    ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgentsauth
    
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.rabbitmq.plist
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist

    cecho "On Yosemite Public Beta? Remember to install MongoDB after" $red
    cecho "changing the system version in /System/Library/CoreServices/SystemVersion.plist" $red
    echo ""
    cecho "Also, install libmemcached this way:" $red
    cecho "brew install https://raw.github.com/denji/homebrew/56eaf3c/Library/Formula/libmemcached.rb" $red
    brew install caskroom/cask/brew-cask
    sudo easy_install pip
    pip install virtualenv virtualenvwrapper pygments speedtest-cli
    
    cecho "Installing some global npm modules" $blue
    npm install -g grunt-cli gulp hicat js-beautify uglify-js pure-prompt resume-cli keybase-installer npm-release \
        duo peerflix
    
    cecho "Installing Sublime Text 3" $blue
    #curl -o SublimeText.dmg http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20Build%203059.dmg
    curl -o SublimeText.dmg http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20Build%203062.dmg
    hdiutil mount SublimeText.dmg
    sudo cp -R /Volumes/Sublime\ Text/Sublime\ Text.app /Applications
    hdiutil unmount /Volumes/Sublime\ Text
    rm SublimeText.dmg
    ;;
  *)
    ;;
esac

echo ""
cecho "====================================================================" $white
cecho "Remember to download the OSX for Hackers script: https://gist.github.com/brandonb927/3195465" $blue
cecho "====================================================================" $white

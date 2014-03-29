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
cecho "In order to install oh-my-zsh, you\'ll need XCode Command Line Tools" $blue
cecho "====================================================================" $white
echo ""
xcode-select --install

echo ""
cecho "====================================================================" $white
cecho "Installing zsh" $blue
cecho "====================================================================" $white
echo ""
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# copy zsh files
cp ./zsh/.zshrc ~/.zshrc
cp ./zsh/.zprofile ~/.zprofile

# copy ZSH theme
cp ./zsh/brandonbrown.zsh-theme ~/.oh-my-zsh/themes/brandonbrown.zsh-theme

# copy git files
cp ./.gitconfig ~/.gitconfig
cp ./.gitignore ~/.gitignore

echo ""
cecho "====================================================================" $white
cecho "🍺  Installing homebrew, ssh-copy-id, wget, pip, and virtualenv" $blue
cecho "====================================================================" $white
echo ""
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew doctor
brew update
brew install ssh-copy-id wget
sudo easy_install pip
sudo pip install virtualenv

echo ""
cecho "====================================================================" $white
cecho "Downloading the OSX for Hackers script to hackers.sh" $blue
cecho "Remember to make it executable and run it afterwards!" $red
cecho "====================================================================" $white
echo ""
curl -o hackers.sh https://gist.githubusercontent.com/brandonb927/3195465/raw/48cfea2e7267350616873a7cb04416c9fc99e2ae/osx-for-hackers.sh

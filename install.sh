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
    
    # copy zsh config files
    cp ./zsh/.zshrc ~/.zshrc
    cp ./zsh/.zprofile ~/.zprofile

    # copy oh-my-zsh theme
    cp ./zsh/brandonbrown.zsh-theme ~/.oh-my-zsh/themes/brandonbrown.zsh-theme
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
    cecho "🍺  Installing homebrew, ssh-copy-id, wget, pip, and virtualenv" $blue
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
    brew doctor
    brew update
    brew install ssh-copy-id wget
    brew install caskroom/cask/brew-cask
    sudo easy_install pip
    sudo pip install virtualenv
    ;;
  *)
    ;;
esac

echo ""
cecho "====================================================================" $white
cecho "Download OSX for Hackers: Mavericks Edition script?" $blue
cecho "====================================================================" $white
read -r response
case $response in
  [yY][eE][sS]|[yY])
    echo ""
    cecho "Remember to make it executable and run it afterwards!" $red
    curl -o hackers.sh https://gist.githubusercontent.com/brandonb927/3195465/raw/48cfea2e7267350616873a7cb04416c9fc99e2ae/osx-for-hackers.sh
    ;;
  *)
    ;;
esac


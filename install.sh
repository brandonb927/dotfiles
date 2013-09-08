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

# Install zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# copy zsh files
cp zsh/.zshrc ~/.zshrc
cp zsh/.zprofile ~/.zprofile

# copy ZSH theme
cp zsh/brandonbrown.zsh-theme ~/.oh-my-zsh/themes/brandonbrown.zsh-theme

# copy git files
cp .gitconfig ~/.gitconfig
cp .gitignore ~/.gitignore

echo ""
cecho "====================================================================" $white
cecho "🍺  Installing Brew" $blue
cecho "====================================================================" $white
echo ""
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
echo ""
cecho "====================================================================" $white

# Download the OSX for Hackers script
echo ""
curl -o hackers.sh https://gist.github.com/brandonb927/3195465/raw/1718f3baa05219035c470218f69a7348be34c72b/gistfile1.sh

echo ""
cecho "====================================================================" $white
cecho "Remember to make hackers.sh executable and run it!" $red
cecho "====================================================================" $white
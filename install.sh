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

# Reset text attributes to normal without clearing screen.
alias Reset="tput sgr0"  

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
  [yY])br
    echo ""
    echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    echo ""
    echo "Installing oh-my-zsh"
    mkdir -p ~/.oh-my-zsh/custom/plugins
    cd ~/.oh-my-zsh/custom/plugins
    git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
    cd ~
    
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
      git
      gitignore
      git-extras
      heroku-toolbelt
      htop
      httpie
      hub
      imagemagick
      imagesnap
      jp2a
      keybase
      normalize
      pv
      pyenv
      pyenv-virtualenv
      rbenv
      ruby-build
      shml
      spaceman-diff
      wget
      youtube-dl
    )
    
    # Fix ffmpeg install
    brew reinstall ffmpeg --with-faac

    echo ""
    echo "Tapping for Joe (for .gitignore)"
    brew tap karan/karan

    echo ""
    echo "Installing GNU version of utils"
    brew tap homebrew/dupes
    brew install grep --with-default-names
    brew install gnu-sed --with-default-names
    
    echo ""
    echo "Installing slackcat"
    curl -Lo ~/Downloads/slackcat https://github.com/vektorlab/slackcat/releases/download/v0.9/slackcat-0.9-darwin-amd64
    mkdir -p ~/bin
    mv ~/Downloads/slackcat ~/bin
    chmod +x ~/bin/slackcat

    echo ""
    echo "Installing brew packages"
    brew install ${binaries[@]}

    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $dark_gray
cecho "Install various versions of ruby? (y/n)" $gray
cecho "===================================================" $dark_gray
read -r response
case $response in
  [yY])
    echo ""
    cecho "Installing ruby versions" $gray
    rbenv install 2.1.3
    rbenv install 2.2.1
    rbenv install 2.2.3
    rbenv global 2.2.3
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
    curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
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
    nvm install 5
    nvm alias stable 5
    nvm alias default 5
    nvm use 5
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
    packages=(
      bower
      caniuse-cmd
      clean-css
      coffee-script
      csslint
      diff-so-fancy
      git-land
      grunt-cli
      gulp-cli
      hicat
      html-minifier
      imageoptim-cli
      imdbtr
      init-module
      js-beautify
      js2coffee
      jscs
      jspm
      less
      nativefier
      nodemon
      npm-check-updates
      npm-release
      readability-checker
      release-it
      resume-cli
      soundnode
      speed-test
      standard
      surge
      svgo
      tldr
      uglifycss
      uglify-js
      vtop
      yo
    )
    
    npm install -g ${packages[@])
    npm config set save true
    npm set init-module $(init-module --path)
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $dark_gray
cecho "Install brew cask apps? (y/n)" $gray
cecho "===================================================" $dark_gray
read -r response
case $response in
  [yY])
    echo ""
    echo "Installing cask and tapping"
    brew tap caskroom/versions
    
    echo ""
    echo "Installing cask apps"
    apps=(
      1password
      alfred
      appcleaner
      atom
      bartender
      beamer
      cdock
      daisydisk
      dropbox
      easysimbl
      firefox
      fluid
      flux
      gifrocket
      google-chrome
      imageoptim
      istat-menus
      iterm2-nightly
      licecap
      screenflick
      skype
      slack
      spectacle
      spotify
      stay
      steam
      teamviewer
      transmission
      unetbootin
      vagrant
      vagrant-manager
      vlc
      virtualbox
      wmail
    )

    brew cask install --appdir="/Applications" ${apps[@]}
    brew cask cleanup
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $dark_gray
cecho "Set some git config defaults? (y/n)" $gray
cecho "===================================================" $dark_gray
read -r response
case $response in
  [yY])
    echo ""
    echo "Setting git config defaults"
    git config --global color.diff-highlight.oldNormal "red bold"
    git config --global color.diff-highlight.oldHighlight "red bold 52"
    git config --global color.diff-highlight.newNormal "green bold"
    git config --global color.diff-highlight.newHighlight "green bold 22"
    git config --global core.pager "diff-highlight | diff-so-fancy | less --tabs=1,5 -R"
    
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

#! /bin/sh

black='\033[0;30m'
blue='\033[0;34m'
green='\033[0;32m'
cyan='\033[0;36m'
red='\033[0;31m'
purple='\033[0;35m'
brown='\033[0;33m'
gray='\033[0;37m'
dark_gray='\033[1;30m'
light_blue='\033[1;34m'
light_green='\033[1;32m'
light_cyan='\033[1;36m'
light_red='\033[1;31m'
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
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    echo ""
    echo "Installing oh-my-zsh custom plugins"
    mkdir -p ~/.oh-my-zsh/custom/plugins
    cd ~/.oh-my-zsh/custom/plugins
    git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
    git clone git://github.com/lukechilds/zsh-nvm.git
    cd ~
    
    break;;

  *) break;;
esac

echo ""
cecho "===================================================" $dark_gray
cecho "Install m-cli? (y/n)" $gray
cecho "===================================================" $dark_gray
read -r response
case $response in
  [yY])
    echo ""
    echo "Installing m-cli — OS X Swiss Army Knife"
    # https://github.com/rgcr/m-cli
    INSTALL_DIR=~/.m-cli curl -fsSL https://raw.githubusercontent.com/rgcr/m-cli/master/install.sh | sh

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
      docker
      findutils
      figlet
      ffmpeg
      git
      gitignore
      git-extras
      git-fresh
      graphicsmagick
      heroku-toolbelt
      htop
      httpie
      hub
      imagemagick
      imagesnap
      imgcat
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
      sslmate
      wget
      wifi-password
      youtube-dl
    )
    
    # Fix ffmpeg install
    brew reinstall ffmpeg --with-faac

    echo ""
    echo "Tapping for Joe (for .gitignore)"
    brew tap karan/karan

    echo ""
    echo "Installing iTerm2 + 1Password integration, sudolikeaboss"
    brew tap ravenac95/sudolikeaboss
    brew install sudolikeaboss
    
    echo ""
    echo "Installing GNU version of utils"
    brew tap homebrew/dupes
    gbinaries=(
      grep
      gnu-sed
    )
    brew install ${gbinaries[@]} --with-default-names
    
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
cecho "Install gvm and go versions? (y/n)" $gray
cecho "===================================================" $dark_gray
read -r response
case $response in
  [yY])
    echo ""
    cecho "Installing gvm packages" $gray
    bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
    
    echo ""
    cecho "Installing go versions" $gray
    gvm install go1.4 -B
    gvm use go1.4
    export GOROOT_BOOTSTRAP=$GOROOT
    gvm install go1.5
    gvm install go1.6
    gvm uninstall go1.4
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
      emoj
      emojipacks
      ffmpeg-gif
      gifi
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
      np
      npm-check
      npm-release
      readability-checker
      release-it
      resume-cli
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
    
    npm install -g ${packages[@]}
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
      filebot
      firefox
      fluid
      flux
      gifrocket
      google-chrome
      imageoptim
      istat-menus
      iterm2-nightly
      java
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
      webtorrent
      xbox360-controller-driver
    )

    brew cask install --appdir="/Applications" ${apps[@]}
    brew cask cleanup
    
    open -a "Google Chrome" --args --make-default-browser
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
cecho "Install Spectacle.app keyboard shortcuts? (y/n)" $gray
cecho "===================================================" $dark_gray
read -r response
case $response in
  [yY])
    echo ""
    echo "Installing Spectacle.app keyboard shortcuts"
    defaults write com.divisiblebyzero.Spectacle MakeLarger -data 62706c6973743030d40102030405061819582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708101155246e756c6cd4090a0b0c0d0e0d0f596d6f64696669657273546e616d65576b6579436f64655624636c6173731000800280035a4d616b654c6172676572d2121314155a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a216175f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11a1b54726f6f74800108111a232d32373c424b555a62696b6d6f7a7f8a93a7aabec7d9dce10000000000000101000000000000001c000000000000000000000000000000e3
    defaults write com.divisiblebyzero.Spectacle MakeSmaller -data 62706c6973743030d40102030405061819582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708101155246e756c6cd4090a0b0c0d0e0d0f596d6f64696669657273546e616d65576b6579436f64655624636c6173731000800280035b4d616b65536d616c6c6572d2121314155a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a216175f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11a1b54726f6f74800108111a232d32373c424b555a62696b6d6f7b808b94a8abbfc8dadde20000000000000101000000000000001c000000000000000000000000000000e4
    defaults write com.divisiblebyzero.Spectacle MoveToBottomDisplay -data 2016-07-27 16:32:52.385 defaults[12480:6563377]

    defaults write com.divisiblebyzero.Spectacle MoveToBottomHalf -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c617373111a008002107d80035f10104d6f7665546f426f74746f6d48616c66d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e7072858a959eb2b5c9d2e4e7ec0000000000000101000000000000001d000000000000000000000000000000ee
    defaults write com.divisiblebyzero.Spectacle MoveToCenter -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c6173731109008002100880035c4d6f7665546f43656e746572d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e70727f848f98acafc3ccdee1e60000000000000101000000000000001d000000000000000000000000000000e8
    defaults write com.divisiblebyzero.Spectacle MoveToFullscreen -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c6173731109008002100380035f10104d6f7665546f46756c6c73637265656ed2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e7072858a959eb2b5c9d2e4e7ec0000000000000101000000000000001d000000000000000000000000000000ee
    defaults write com.divisiblebyzero.Spectacle MoveToLeftDisplay -data 2016-07-27 16:32:52.560 defaults[12488:6563397]

    defaults write com.divisiblebyzero.Spectacle MoveToLeftHalf -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c617373111a008002107b80035e4d6f7665546f4c65667448616c66d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e70728186919aaeb1c5cee0e3e80000000000000101000000000000001d000000000000000000000000000000ea
    defaults write com.divisiblebyzero.Spectacle MoveToLowerLeft -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c6173731118008002107d80035f100f4d6f7665546f4c6f7765724c656674d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e70728489949db1b4c8d1e3e6eb0000000000000101000000000000001d000000000000000000000000000000ed
    defaults write com.divisiblebyzero.Spectacle MoveToLowerRight -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c6173731118008002107c80035f10104d6f7665546f4c6f7765725269676874d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e7072858a959eb2b5c9d2e4e7ec0000000000000101000000000000001d000000000000000000000000000000ee
    defaults write com.divisiblebyzero.Spectacle MoveToNextDisplay -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c617373111b008002107c80035f10114d6f7665546f4e657874446973706c6179d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e7072868b969fb3b6cad3e5e8ed0000000000000101000000000000001d000000000000000000000000000000ef
    defaults write com.divisiblebyzero.Spectacle MoveToNextThird -data 62706c6973743030d40102030405061819582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708101155246e756c6cd4090a0b0c0d0e0d0f596d6f64696669657273546e616d65576b6579436f64655624636c6173731000800280035f100f4d6f7665546f4e6578745468697264d2121314155a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a216175f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11a1b54726f6f74800108111a232d32373c424b555a62696b6d6f8186919aaeb1c5cee0e3e80000000000000101000000000000001c000000000000000000000000000000ea
    defaults write com.divisiblebyzero.Spectacle MoveToPreviousDisplay -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c617373111b008002107b80035f10154d6f7665546f50726576696f7573446973706c6179d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e70728a8f9aa3b7baced7e9ecf10000000000000101000000000000001d000000000000000000000000000000f3
    defaults write com.divisiblebyzero.Spectacle MoveToPreviousThird -data 62706c6973743030d40102030405061819582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708101155246e756c6cd4090a0b0c0d0e0d0f596d6f64696669657273546e616d65576b6579436f64655624636c6173731000800280035f10134d6f7665546f50726576696f75735468697264d2121314155a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a216175f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11a1b54726f6f74800108111a232d32373c424b555a62696b6d6f858a959eb2b5c9d2e4e7ec0000000000000101000000000000001c000000000000000000000000000000ee
    defaults write com.divisiblebyzero.Spectacle MoveToRightDisplay -data 2016-07-27 16:32:52.906 defaults[12504:6563437]

    defaults write com.divisiblebyzero.Spectacle MoveToRightHalf -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c617373111a008002107c80035f100f4d6f7665546f526967687448616c66d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e70728489949db1b4c8d1e3e6eb0000000000000101000000000000001d000000000000000000000000000000ed
    defaults write com.divisiblebyzero.Spectacle MoveToTopDisplay -data 2016-07-27 16:32:52.990 defaults[12508:6563447]

    defaults write com.divisiblebyzero.Spectacle MoveToTopHalf -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c617373111a008002107e80035d4d6f7665546f546f7048616c66d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e707280859099adb0c4cddfe2e70000000000000101000000000000001d000000000000000000000000000000e9
    defaults write com.divisiblebyzero.Spectacle MoveToUpperLeft -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c6173731118008002107b80035f100f4d6f7665546f55707065724c656674d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e70728489949db1b4c8d1e3e6eb0000000000000101000000000000001d000000000000000000000000000000ed
    defaults write com.divisiblebyzero.Spectacle MoveToUpperRight -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c6173731118008002107e80035f10104d6f7665546f55707065725269676874d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e7072858a959eb2b5c9d2e4e7ec0000000000000101000000000000001d000000000000000000000000000000ee
    defaults write com.divisiblebyzero.Spectacle RedoLastMove -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c617373110b008002100680035c5265646f4c6173744d6f7665d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e70727f848f98acafc3ccdee1e60000000000000101000000000000001d000000000000000000000000000000e8
    defaults write com.divisiblebyzero.Spectacle UndoLastMove -data 62706c6973743030d4010203040506191a582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a40708111255246e756c6cd4090a0b0c0d0e0f10596d6f64696669657273546e616d65576b6579436f64655624636c6173731109008002100680035c556e646f4c6173744d6f7665d2131415165a24636c6173736e616d655824636c61737365735f1011537065637461636c6553686f7274637574a217185f1011537065637461636c6553686f7274637574584e534f626a6563745f100f4e534b657965644172636869766572d11b1c54726f6f74800108111a232d32373c424b555a62696c6e70727f848f98acafc3ccdee1e60000000000000101000000000000001d000000000000000000000000000000e8
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $dark_gray
cecho "Kill apps that might be affected by these changes? (y/n)" $gray
cecho "===================================================" $dark_gray
read -r response
case $response in
  [yY])
    
    for app in "Activity Monitor" "cfprefsd" \
    	"Dock" "Finder" "Google Chrome" "Messages" \
    	"Spectacle" "SystemUIServer"; do
    	killall "${app}" &> /dev/null
    done
    break;;
  *) break;;
esac

echo ""
cecho "===================================================" $dark_gray
cecho "Remember to download the OSX for Hackers script:" $gray
cecho "https://gist.github.com/brandonb927/3195465" $gray
cecho "===================================================" $dark_gray

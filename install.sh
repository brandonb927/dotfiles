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
cecho "Are the XCode Command Line Tools installed?" $blue
cecho "====================================================================" $white
echo ""
select yn in "Yes" "No"; do
  case $yn in
    Yes ) break;;
    No ) xcode-select --install
         break;;
  esac
done

echo ""
cecho "====================================================================" $white
cecho "Install oh-my-zsh?" $blue
cecho "====================================================================" $white
read -r response
case $response in
  [yY][eE][sS]|[yY])
    echo ""
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

    curl -o Tomorrow\ Night\ Eighties.terminal https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/OS%20X%20Terminal/Tomorrow%20Night%20Eighties.terminal
    cp Tomorrow\ Night\ Eighties.terminal ~/Desktop/Tomorrow\ Night\ Eighties.terminal

    # copy zsh config files
    cp ./zsh/.zshrc ~/.zshrc
    cp ./zsh/.zprofile ~/.zprofile
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
    brew install bash coreutils curl findutils heroku-toolbelt httpie imagemagick launchrocket \
      mongodb node python rabbitmq ssh-copy-id wget

    cecho "Initializing and loading LaunchControl services from previously installed utilities" $blue
    ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
    ln -sfv /usr/local/opt/rabbitmq/*.plist ~/Library/LaunchAgents
    ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgentsauth

    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.rabbitmq.plist
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist

    cecho "Installing pip and some python packages" $blue
    sudo easy_install pip
    pip install virtualenv virtualenvwrapper pygments speedtest-cli

    cecho "Installing some global npm modules" $blue
    npm install -g n grunt-cli gulp hicat js-beautify uglify-js pure-prompt resume-cli keybase-installer npm-release \
        duo nsm

    cecho "Installing node stable and latest" $blue
    n stable
    n latest

    cecho "Installing brew-cask" $blue
    brew tap caskroom/versions
    brew install brew-cask

    echo 'Installing items not installed here (most likely from App store, or other sources):'
    echo '- Airmail (app store)'
    echo '- Instashare (app store)'
    echo '- Tweetdeck (app store)'
    echo '- XCode (app store)'
    echo '- '

    echo 'Installing apps'
    brew cask install \
      air-video-server-hd airserver airdisplay alfred android-studio appcleaner atom \
      cakebrew cinch daisydisk dropbox evernote \
      firefox firefox-aurora flux google-chrome google-chrome-canary iterm2 istat-menus \
      licecap mou onepassword postgres steam send-to-kindle \
      skype sublime-text3 transmission vlc virtualbox

    brew cask cleanup
    ;;
  *)
    ;;
esac

echo ""
cecho "===================================================" $white
cecho "Remember to download the OSX for Hackers script:" $blue
cecho "https://gist.github.com/brandonb927/3195465" $blue
cecho "====================================================================" $white

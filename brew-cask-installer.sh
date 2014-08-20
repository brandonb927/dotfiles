#!/bin/sh

echo 'Items not installed here (most likely from App store, or other sources):'
echo '- Airmail (app store)'
echo '- Android OS X SDK'
echo '- Instashare (app store)'
echo '- Tweetdeck (app store)'
echo '- XCode (app store)'
echo '- '

brew cask install \
  air-video-server-hd airserver airdisplay alfred appcleaner atom cakebrew cinch \
  daisydisk dropbox evernote \
  firefox fluid flux google-chrome iterm2 istat-menus \
  licecap onepassword postgres steam send-to-kindle \
  transmission vlc \
  
brew cask cleanup

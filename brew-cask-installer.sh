#!/bin/sh

echo 'Items not installed here (most likely from App store, or other sources):'
echo '- Airmail (app store)'
echo '- Instashare (app store)'
echo '- Tweetdeck (app store)'
echo '- XCode (app store)'
echo '- '

brew cask install \
  air-video-server-hd airserver airdisplay alfred android-studio appcleaner atom cakebrew cinch \
  daisydisk dropbox evernote \
  firefox flux google-chrome iterm2 istat-menus \
  licecap onepassword postgres steam send-to-kindle \
  skype transmission vlc \
  
brew cask cleanup

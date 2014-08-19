#!/bin/sh

echo 'Items not installed here (most likely from App store, or other sources):'
echo '- Adobe Photoshop'
echo '- Air Display Host'
echo '- Air Video Server HD'
echo '- Airmail (app store)'
echo '- Android OS X SDK'
echo '- Cinch (app store)'
echo '- Evernote (app store)'
echo '- Instashare (app store)'
echo '- iStats Menus'
echo '- Tweetdeck (app store)'
echo '- XCode (app store)'
echo '- '

brew cask install onepassword \
  alfred appcleaner atom cakebrew daisydisk dropbox \
  firefox flowdock fluid flux google-chrome iterm2 \
  licecap onyx postgres radiant-player steam send-to-kindle \
  transmission vlc \
  
brew cask cleanup

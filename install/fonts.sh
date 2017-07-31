#!/usr/bin/env bash

source ./utils.sh

e_header "Installing fonts"

brew tap caskroom/fonts
brew cask install font-awesome-terminal-fonts

curl https://raw.githubusercontent.com/qrpike/Web-Font-Load/master/install.sh | sh

wget https://noto-website.storage.googleapis.com/pkgs/NotoMono-hinted.zip -O noto.zip
unzip noto.zip -d noto
cp noto/NotoMono-Regular.ttf /Library/Fonts/
rm -r noto*

wget https://github.com/powerline/fonts/archive/master.zip -O fonts.zip && unzip fonts.zip
./fonts-master/install.sh
rm -r fonts.zip fonts-master

e_success "Done!"

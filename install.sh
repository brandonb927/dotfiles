#! /bin/sh

echo ""
echo "===================================================================="
echo "Installing oh-my-zsh" $cyan
echo "===================================================================="

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
echo "===================================================================="
echo "🍺  Installing Brew"
echo "===================================================================="

ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"


echo ""
echo "===================================================================="
echo "Installing Pip and VirtualEnv"
echo "===================================================================="

sudo easy_install pip
sudo pip install virtualenv


echo ""
echo "===================================================================="
echo "Downloading & configuring git-credential-osxkeychain"
echo "===================================================================="

curl -s -O http://github-media-downloads.s3.amazonaws.com/osx/git-credential-osxkeychain
mv git-credential-osxkeychain ${HOME}/Downloads
chmod +x ${HOME}/Downloads/git-credential-osxkeychain
sudo mv ${HOME}/Downloads/git-credential-osxkeychain /usr/bin/
git config --global credential.helper osxkeychain


echo ""
echo "===================================================================="
echo "Downloading & installing ssh-copy-id"
echo "===================================================================="

curl https://raw.github.com/beautifulcode/ssh-copy-id-for-OSX/master/ssh-copy-id.sh -o ssh-copy-id
# sudo mkdir /usr/local/bin
sudo mv ssh-copy-id /usr/local/bin/
chmod +x /usr/local/bin/ssh-copy-id

echo ""
echo "===================================================================="
echo "Downloading the OSX for Hackers script to hackers.sh"
echo "Remember to make it executable and run it afterwards!"
echo "===================================================================="

curl -o hackers.sh https://gist.github.com/brandonb927/3195465/raw/1718f3baa05219035c470218f69a7348be34c72b/gistfile1.sh

mkdir tmp
mkdir downloads
cd downloads

echo ""
echo "===================================================================="
echo "Downloading apps"
echo "===================================================================="


echo "===================================================================="
echo "Downloading android-sdk"
echo ""
curl -L -o android-sdk.zip http://dl.google.com/android/android-sdk_r22.0.5-macosx.zip

echo "===================================================================="
echo "Downloading AirPort Utility 5.6"
echo ""
curl -L -o AirPortUtility56.dmg http://support.apple.com/downloads/DL1482/en_US/AirPortUtility56.dmg

echo "===================================================================="
echo "Downloading Alfred"
echo ""
curl -L -o alfred.zip http://cachefly.alfredapp.com/Alfred_2.0.7_205.zip

echo "===================================================================="
echo "Downloading Appcleaner"
echo ""
curl -L -o appcleaner.zip http://www.freemacsoft.net/downloads/AppCleaner_2.2.zip

echo "===================================================================="
echo "Downloading Codekit"
echo ""
curl -L -o codekit.zip http://incident57.com/codekit/files/codekit-8322.zip

echo "===================================================================="
echo "Downloading Cyberduck"
echo ""
curl -L -o cyberduck.zip http://cyberduck.ch/Cyberduck-4.3.1.zip

echo "===================================================================="
echo "Downloading Daisydisk"
echo ""
curl -L -o daisydisk.zip http://www.daisydiskapp.com/downloads/DaisyDisk.zip

echo "===================================================================="
echo "Downloading Dropbox"
echo ""
curl -L -o dropbox.dmg https://www.dropbox.com/download\?plat\=mac

echo "===================================================================="
echo "Downloading Firefox"
echo ""
curl -L -o firefox.dmg https://download.mozilla.org/?product=firefox-23.0.1&os=osx&lang=en-US

echo "===================================================================="
echo "Downloading Flowdock"
echo ""
curl -L -o flowdock.zip https://d2ph5hv9wbwvla.cloudfront.net/mac/Flowdock_v1_1_0.zip

echo "===================================================================="
echo "Downloading Flux"
echo ""
curl -L -o Flux.zip https://justgetflux.com/mac/Flux.zip

echo "===================================================================="
echo "Downloading Googlechrome"
echo ""
curl -L -o googlechrome.dmg https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg

echo "===================================================================="
echo "Downloading iStatsmenus"
echo ""
curl -L -o istatsmenus.zip http://s3.amazonaws.com/bjango/files/istatmenus4/istatmenus4.06.zip

echo "===================================================================="
echo "Downloading iTerm2"
echo ""
curl -L -o iterm2.zip http://iterm2.com/downloads/stable/iTerm2_v1_0_0.zip

echo "===================================================================="
echo "Downloading Keepassx"
echo ""
curl -L -o keepassx.dmg http://www.keepassx.org/dev/attachments/download/38/KeePassX-2.0-alpha4.dmg

echo "===================================================================="
echo "Downloading Minecraft"
echo ""
curl -L -o minecraft.dmg https://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.dmg

echo "===================================================================="
echo "Downloading Prey"
echo ""
curl -L -o prey.dmg https://preyproject.com/releases/0.6.0/prey-0.6.0-mac.dmg

echo "===================================================================="
echo "Downloading Sendtokindle"
echo ""
curl -L -o sendtokindle.pkg http://s3.amazonaws.com/sendtokindle/SendToKindleForMac-installer-v1.0.0.218.pkg

echo "===================================================================="
echo "Downloading Skype"
echo ""
curl -L -o skype.dmg http://www.skype.com/go/getskype-macosx.dmg

echo "===================================================================="
echo "Downloading Sublime Text 2"
echo ""
curl -L -o sublimetext.dmg http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2.dmg

echo "===================================================================="
echo "Downloading Transmit"
echo ""
curl -L -o transmit.zip http://www.panic.com/transmit/d/Transmit%204.4.1.zip

echo "===================================================================="
echo "Downloading uTorrent"
echo ""
curl -L -o utorrent.dmg http://download-new.utorrent.com/endpoint/utmac/os/osx/track/beta/

echo "===================================================================="
echo "Downloading Vlc"
echo ""
curl -L -o vlc.dmg http://get.videolan.org/vlc/2.0.8/macosx/vlc-2.0.8.dmg

echo "===================================================================="
echo "Downloading XtraFinder"
echo ""
curl -L -o XtraFinder.dmg http://www.trankynam.com/xtrafinder/downloads/XtraFinder.dmg

cd ../tmp

echo ""
echo "===================================================================="
echo "Installing apps"
echo "===================================================================="

unzip -q ../downloads/android-sdk.zip -d android-sdk
mv android-sdk /Applications/

echo ""
echo "===================================================================="
echo "Installing Airpot Utility 5.6"

hdiutil mount ../downloads/AirPortUtility56.dmg
cp -R /Volumes/AirPortUtility/AirPortUtility56.pkg .
xar -x -f AirPortUtility56.pkg Payload
gzcat AirPortUtility56Lion.pkg/Payload | tar -xf -
sudo mv Applications/Utilities/AirPort\ Utility\ 5.6.app /Applications/Utilities
rm -rf Applications Library System AirPortUtility56.pkg AirPortUtility56Lion.pkg
hdiutil unmount /Volumes/AirPortUtility
drive=`diskutil list | grep AirPortUtility | awk '{print $6}'`
hdiutil detach /dev/$drive

echo ""
echo "===================================================================="
echo "Installing Alfred"
unzip -q ../downloads/alfred.zip -d alfred
mv alfred/Alfred\ 2.app /Applications

echo ""
echo "===================================================================="
echo "Installing Appcleaner"
unzip -q ../downloads/appcleaner.zip -d appcleaner
mv appcleaner/AppCleaner.app /Applications

echo ""
echo "===================================================================="
echo "Installing Codekit"
unzip -q ../downloads/codekit.zip -d codekit
mv codekit/Codekit.app /Applications

echo ""
echo "===================================================================="
echo "Installing Cyberduck"
unzip -q ../downloads/cyberduck.zip -d cyberduck
mv cyberduck/Cyberduck.app /Applications

echo ""
echo "===================================================================="
echo "Installing Daisydisk"
unzip -q ../downloads/daisydisk.zip -d daisydisk
mv daisydisk/DaisyDisk.app /Applications

echo ""
echo "===================================================================="
echo "Installing Dropbox"
hdiutil mount ../downloads/dropbox.dmg
cp -R /Volumes/Dropbox\ Installer/Dropbox.app /Applications
hdiutil unmount /Volumes/Dropbox\ Installer
drive=`diskutil list | grep 'Dropbox Installer' | awk '{print $7}'`
hdiutil detach /dev/$drive

echo ""
echo "===================================================================="
echo "Installing Firefox"
hdiutil mount ../downloads/firefox.dmg
cp -R /Volumes/Firefox/Firefox.app /Applications
hdiutil unmount /Volumes/Firefox
diskutil list | grep Firefox | awk '{print $6}'
hdiutil detach /dev/$drive

echo ""
echo "===================================================================="
echo "Installing Flowdock"
unzip -q ../downloads/flowdock.zip -d flowdock
mv flowdock/Flowdock.app /Applications

echo ""
echo "===================================================================="
echo "Installing Flux"
unzip -q ../downloads/Flux.zip -d Flux
mv Flux/Flux.app /Applications

# echo ""
# echo "===================================================================="
# echo "Installing FontPrep"
# curl -L -o fontprep.zip http://fontprep.com/download
# unzip fon../downloads/tprep.zip -d tprep
# tprep/mv FontPrep.app /Applications
# rm fontprep.zip

echo ""
echo "===================================================================="
echo "Installing Googlechrome"
hdiutil mount ../downloads/googlechrome.dmg
cp -R /Volumes/Google\ Chrome/Google\ Chrome.app /Applications
hdiutil unmount /Volumes/Google\ Chrome
drive=`diskutil list | grep Google\ Chrome | awk '{print $7}'`
hdiutil detach /dev/$drive

echo ""
echo "===================================================================="
echo "Installing iStatsMenus"
unzip -q ../downloads/istatsmenus.zip -d istatsmenus
mv istatsmenus/iStats\ Menus.app /Applications

echo ""
echo "===================================================================="
echo "Installing iTerm2"
unzip -q ../downloads/iterm2.zip -d iterm2
mv iterm2/iTerm.app /Applications

echo ""
echo "===================================================================="
echo "Installing KeepassX"
hdiutil mount ../downloads/keepassx.dmg
cp -R /Volumes/KeePassX/KeePassX.app /Applications
hdiutil unmount /Volumes/KeePassX
drive=`diskutil list | grep KeePassX | awk '{print $6}'`
hdiutil detach /dev/$drive

echo ""
echo "===================================================================="
echo "Installing Minecraft"
hdiutil mount ../downloads/minecraft.dmg
cp -R /Volumes/Minecraft/Minecraft.app /Applications
hdiutil unmount /Volumes/Minecraft
drive=`diskutil list | grep Minecraft | awk '{print $6}'`
hdiutil detach /dev/$drive

echo ""
echo "===================================================================="
echo "Installing Sendtokindle"
sudo installer -pkg sendtokindle.pkg -target /

echo ""
echo "===================================================================="
echo "Installing Skype"
hdiutil mount ../downloads/skype.dmg
cp -R /Volumes/Skype/Skype.app /Applications
hdiutil unmount /Volumes/Skype
drive=`diskutil list | grep Skype | awk '{print $6}'`
hdiutil detach /dev/$drive

echo ""
echo "===================================================================="
echo "Installing Sublime Text 2"
hdiutil mount ../downloads/sublimetext.dmg
cp -R /Volumes/Sublime\ Text\ 2/Sublime\ Text\ 2.app /Applications
hdiutil unmount /Volumes/Sublime\ Text\ 2
drive=`diskutil list | grep Sublime\ Text\ 2 | awk '{print $8}'`
hdiutil detach /dev/$drive

echo ""
echo "===================================================================="
echo "Installing Transmit"
unzip -q ../downloads/transmit.zip -d transmit
mv transmit/Transmit.app /Applications

echo ""
echo "===================================================================="
echo "Installing uTorrent"
hdiutil mount ../downloads/utorrent.dmg
cp -R /Volumes/uTorrent/uTorrent.app /Applications
hdiutil unmount /Volumes/uTorrent
drive=`diskutil list | grep uTorrent | awk '{print $6}'`
hdiutil detach /dev/$drive

echo ""
echo "===================================================================="
echo "Installing VLC"
hdiutil mount ../downloads/vlc.dmg -mountpoint /Volumes/vlc-2.0.8
cp -R /Volumes/vlc-2.0.8/VLC.app /Applications
hdiutil unmount /Volumes/vlc-2.0.8
drive=`diskutil list | grep vlc-2.0.8 | awk '{print $6}'`
hdiutil detach /dev/$drive

echo ""
echo "===================================================================="
echo "Installing XtraFinder"
hdiutil mount ../downloads/XtraFinder.dmg
sudo installer -pkg /Volumes/XtraFinder -target /
hdiutil unmount /Volumes/XtraFinder
drive=`diskutil list | grep XtraFinder | awk '{print $6}'`
hdiutil detach /dev/$drive


# echo ""
# echo "===================================================================="
# echo "Downloading VMWare Fusion"
# echo "===================================================================="
# curl -L -O https://download2.vmware.com/software/fusion/VMware-Fusion-5.0.3-1040386-light.dmg?HashKey=509e091d887753698a35ffcedb78225e&params=%7B%22custnumber%22%3A%22amVAcHB0QGpoQA%3D%3D%22%2C%22sourcefilesize%22%3A%22207M%22%2C%22dlgcode%22%3A%22FUS-503%22%2C%22languagecode%22%3A%22en%22%2C%22source%22%3A%22DOWNLOADS%22%2C%22downloadtype%22%3A%22manual%22%2C%22eula%22%3A%22Y%22%2C%22downloaduuid%22%3A%22f45547ec-f9d7-42d8-9eb7-dc16cb18ff5d%22%2C%22purchased%22%3A%22N%22%2C%22dlgtype%22%3A%22Product+Binaries%22%2C%22productversion%22%3A%225.0.3%22%2C%22productfamily%22%3A%22VMware+Fusion%22%7D&AuthKey=1378708719_773c6cf4beb5310901f10687924aac0b

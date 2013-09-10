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
cecho "====================================================================" $white
cecho "🍺  Installing Brew" $cyan
cecho "====================================================================" $white

ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"


echo ""
cecho "====================================================================" $white
cecho "Installing Pip and VirtualEnv" $cyan
cecho "====================================================================" $white

sudo easy_install pip
sudo pip install virtualenv


echo ""
cecho "====================================================================" $white
cecho "Downloading & configuring git-credential-osxkeychain" $cyan
cecho "====================================================================" $white

curl -s -O http://github-media-downloads.s3.amazonaws.com/osx/git-credential-osxkeychain
mv git-credential-osxkeychain ${HOME}/Downloads
chmod +x ${HOME}/Downloads/git-credential-osxkeychain
sudo mv ${HOME}/Downloads/git-credential-osxkeychain /usr/bin/
git config --global credential.helper osxkeychain


echo ""
cecho "====================================================================" $white
cecho "Downloading & installing ssh-copy-id" $cyan
cecho "====================================================================" $white

curl https://raw.github.com/beautifulcode/ssh-copy-id-for-OSX/master/ssh-copy-id.sh -o ssh-copy-id
# sudo mkdir /usr/local/bin
sudo mv ssh-copy-id /usr/local/bin/
chmod +x /usr/local/bin/ssh-copy-id

echo ""
cecho "====================================================================" $white
cecho "Downloading the OSX for Hackers script to hackers.sh" $cyan
cecho "Remember to make it executable and run it afterwards!" $red
cecho "====================================================================" $white

curl -o hackers.sh https://gist.github.com/brandonb927/3195465/raw/1718f3baa05219035c470218f69a7348be34c72b/gistfile1.sh

mkdir tmp
cd tmp

echo ""
cecho "====================================================================" $white
cecho "Downloading apps" $cyan
cecho "====================================================================" $white

curl -L -o android-sdk.zip http://dl.google.com/android/android-sdk_r22.0.5-macosx.zip
curl -L -o AirPortUtility56.dmg http://support.apple.com/downloads/DL1482/en_US/AirPortUtility56.dmg
curl -L -o alfred.zip http://cachefly.alfredapp.com/Alfred_2.0.7_205.zip
curl -L -o appcleaner.zip http://www.freemacsoft.net/downloads/AppCleaner_2.2.zip
curl -L -o codekit.zip http://incident57.com/codekit/files/codekit-8322.zip
curl -L -o cyberduck.zip http://cyberduck.ch/Cyberduck-4.3.1.zip
curl -L -o daisydisk.zip http://www.daisydiskapp.com/downloads/DaisyDisk.zip
curl -L -o dropbox.dmg https://www.dropbox.com/download\?plat\=mac
curl -L -o firefox.dmg https://download.mozilla.org/?product=firefox-23.0.1&os=osx&lang=en-US
curl -L -o flowdock.zip https://d2ph5hv9wbwvla.cloudfront.net/mac/Flowdock_v1_1_0.zip
curl -L -o Flux.zip https://justgetflux.com/mac/Flux.zip
curl -L -o googlechrome.dmg https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg
curl -L -o istatsmenus.zip http://s3.amazonaws.com/bjango/files/istatmenus4/istatmenus4.06.zip
curl -L -o iterm2.zip http://iterm2.com/downloads/stable/iTerm2_v1_0_0.zip
curl -L -o keepassx.dmg http://www.keepassx.org/dev/attachments/download/38/KeePassX-2.0-alpha4.dmg
curl -L -o minecraft.dmg https://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.dmg
curl -L -o prey.dmg https://preyproject.com/releases/0.6.0/prey-0.6.0-mac.dmg
curl -L -o sendtokindle.pkg http://s3.amazonaws.com/sendtokindle/SendToKindleForMac-installer-v1.0.0.218.pkg
curl -L -o skype.dmg http://www.skype.com/go/getskype-macosx.dmg
curl -L -o sublimetext.dmg http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2.dmg
curl -L -o transmit.zip http://www.panic.com/transmit/d/Transmit%204.4.1.zip
curl -L -o utorrent.dmg http://download-new.utorrent.com/endpoint/utmac/os/osx/track/beta/
curl -L -o vlc.dmg http://get.videolan.org/vlc/2.0.8/macosx/vlc-2.0.8.dmg
curl -L -o XtraFinder.dmg http://www.trankynam.com/xtrafinder/downloads/XtraFinder.dmg


echo ""
cecho "====================================================================" $white
cecho "Installing apps" $cyan
cecho "====================================================================" $white

unzip android-sdk.zip
mv android-sdk-macosx android-sdk
mv android-sdk /Applications/
rm android-sdk.zip

echo ""
cecho "====================================================================" $white

hdiutil mount AirPortUtility56.dmg
cp -R /Volumes/AirPortUtility/AirPortUtility56.pkg .
xar -x -f AirPortUtility56.pkg Payload
gzcat AirPortUtility56Lion.pkg/Payload | tar -xf -
sudo mv Applications/Utilities/AirPort\ Utility\ 5.6.app /Applications/Utilities
rm -rf Applications Library System AirPortUtility56.pkg AirPortUtility56Lion.pkg
hdiutil unmount /Volumes/AirPortUtility
drive=`diskutil list | grep AirPortUtility | awk '{print $6}'`
hdiutil detach /dev/$drive
rm AirPortUtility56.dmg

echo ""
cecho "====================================================================" $white

unzip alfred.zip
mv Alfred\ 2.app /Applications
rm alfred.zip

echo ""
cecho "====================================================================" $white

unzip appcleaner.zip
mv AppCleaner.app /Applications
rm appcleaner.zip

echo ""
cecho "====================================================================" $white

unzip codekit.zip
mv Codekit.app /Applications
rm codekit.zip

echo ""
cecho "====================================================================" $white

unzip cyberduck.zip
mv Cyberduck.app /Applications
rm cyberduck.zip

echo ""
cecho "====================================================================" $white

unzip daisydisk.zip
mv DaisyDisk.app /Applications
rm daisydisk.zip

echo ""
cecho "====================================================================" $white

hdiutil mount dropbox.dmg
cp -R /Volumes/Dropbox\ Installer/Dropbox.app /Applications
hdiutil unmount /Volumes/Dropbox\ Installer
drive=`diskutil list | grep 'Dropbox Installer' | awk '{print $7}'`
hdiutil detach /dev/$drive
rm dropbox.dmg

echo ""
cecho "====================================================================" $white

hdiutil mount firefox.dmg
cp -R /Volumes/Firefox/Firefox.app /Applications
hdiutil unmount /Volumes/Firefox
diskutil list | grep Firefox | awk '{print $6}'
hdiutil detach /dev/$drive
rm firefox.dmg

echo ""
cecho "====================================================================" $white

unzip flowdock.zip
mv Flowdock.app /Applications
rm flowdock.zip

echo ""
cecho "====================================================================" $white

unzip Flux.zip
mv Flux.app /Applications
rm Flux.zip

echo ""
cecho "====================================================================" $white

#curl -L -o fontprep.zip http://fontprep.com/download
#unzip fontprep.zip
#mv FontPrep.app /Applications
#rm fontprep.zip

echo ""
cecho "====================================================================" $white

hdiutil mount googlechrome.dmg
cp -R /Volumes/Google\ Chrome/Google\ Chrome.app /Applications
hdiutil unmount /Volumes/Google\ Chrome
drive=`diskutil list | grep Google\ Chrome | awk '{print $7}'`
hdiutil detach /dev/$drive
rm googlechrome.dmg

echo ""
cecho "====================================================================" $white

unzip istatsmenus.zip
mv FontPrep.app /Applications
rm istatsmenus.zip

echo ""
cecho "====================================================================" $white

unzip iterm2.zip
mv iTerm2.app /Applications
rm iterm2.zip

echo ""
cecho "====================================================================" $white

hdiutil mount keepassx.dmg
cp -R /Volumes/KeePassX/KeePassX.app /Applications
hdiutil unmount /Volumes/KeePassX
drive=`diskutil list | grep KeePassX | awk '{print $6}'`
hdiutil detach /dev/$drive
rm keepassx.dmg

echo ""
cecho "====================================================================" $white

hdiutil mount minecraft.dmg
cp -R /Volumes/Minecraft/Minecraft.app /Applications
hdiutil unmount /Volumes/Minecraft
drive=`diskutil list | grep Minecraft | awk '{print $6}'`
hdiutil detach /dev/$drive
rm minecraft.dmg

echo ""
cecho "====================================================================" $white

sudo installer -pkg sendtokindle.pkg -target /
rm sendtokindle.pkg

echo ""
cecho "====================================================================" $white

hdiutil mount skype.dmg
cp -R /Volumes/Skype/Skype.app /Applications
hdiutil unmount /Volumes/Skype
drive=`diskutil list | grep Skype | awk '{print $6}'`
hdiutil detach /dev/$drive
rm skype.dmg

echo ""
cecho "====================================================================" $white

hdiutil mount sublimetext.dmg
cp -R /Volumes/Sublime\ Text\ 2/Sublime\ Text\ 2.app /Applications
hdiutil unmount /Volumes/Sublime\ Text\ 2
drive=`diskutil list | grep Sublime\ Text\ 2 | awk '{print $6}'`
hdiutil detach /dev/$drive
rm sublimetext.dmg

echo ""
cecho "====================================================================" $white

unzip transmit.zip
mv Transmit.app /Applications
rm transmit.zip

echo ""
cecho "====================================================================" $white

hdiutil mount utorrent.dmg
cp -R /Volumes/uTorrent/uTorrent.app /Applications
hdiutil unmount /Volumes/uTorrent
drive=`diskutil list | grep uTorrent | awk '{print $6}'`
hdiutil detach /dev/$drive
rm utorrent.dmg

echo ""
cecho "====================================================================" $white

hdiutil mount vlc.dmg -mountpoint /Volumes/vlc-2.0.8
cp -R /Volumes/vlc-2.0.8/VLC.app /Applications
hdiutil unmount /Volumes/vlc-2.0.8
drive=`diskutil list | grep vlc-2.0.8 | awk '{print $6}'`
hdiutil detach /dev/$drive
rm vlc.dmg

echo ""
cecho "====================================================================" $white

hdiutil mount XtraFinder.dmg -mountpoint /Volumes/XtraFinder
sudo installer -pkg /Volumes/XtraFinder -target /
hdiutil unmount /Volumes/XtraFinder
drive=`diskutil list | XtraFinder | awk '{print $6}'`
hdiutil detach /dev/$drive
rm XtraFinder.dmg


echo ""
cecho "====================================================================" $white
cecho "VMWare Fusion" $cyan
cecho "====================================================================" $white
#curl -L -O https://download2.vmware.com/software/fusion/VMware-Fusion-5.0.3-1040386-light.dmg?HashKey=509e091d887753698a35ffcedb78225e&params=%7B%22custnumber%22%3A%22amVAcHB0QGpoQA%3D%3D%22%2C%22sourcefilesize%22%3A%22207M%22%2C%22dlgcode%22%3A%22FUS-503%22%2C%22languagecode%22%3A%22en%22%2C%22source%22%3A%22DOWNLOADS%22%2C%22downloadtype%22%3A%22manual%22%2C%22eula%22%3A%22Y%22%2C%22downloaduuid%22%3A%22f45547ec-f9d7-42d8-9eb7-dc16cb18ff5d%22%2C%22purchased%22%3A%22N%22%2C%22dlgtype%22%3A%22Product+Binaries%22%2C%22productversion%22%3A%225.0.3%22%2C%22productfamily%22%3A%22VMware+Fusion%22%7D&AuthKey=1378708719_773c6cf4beb5310901f10687924aac0b

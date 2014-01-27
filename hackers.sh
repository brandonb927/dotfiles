#!/usr/bin/env bash

# Some things taken from here
# https://github.com/mathiasbynens/dotfiles/blob/master/.osx

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo ""
echo "#####################################"
echo "## This script will make your Mac awesome."
echo "## Follow the prompts and you'll be fine."
echo "#####################################"
echo ""
echo ""
echo "#####################################"
echo "## Happy Hacking!"
echo "#####################################"
echo ""

###############################################################################
# General UI/UX                                                               #
###############################################################################

echo ""
echo "Want to set the computer name? (as done via System Preferences → Sharing)"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo 'What is your computer name going to be? '
              read comp_name
              scutil --set ComputerName $comp_name
              scutil --set HostName $comp_name
              scutil --set LocalHostName $comp_name
              break;;
        No ) break;;
    esac
done

echo ""
echo "Disabling the useless Time Machine, Volume, Bluetooth and Spotlight icons? "
defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" "/System/Library/CoreServices/Menu Extras/AirPort.menu" "/System/Library/CoreServices/Menu Extras/Battery.menu" "/System/Library/CoreServices/Menu Extras/Clock.menu"
sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search

echo ""
echo "Disabling OS X Gate Keeper"
echo "(You'll be able to install any app you want from here on, not just Mac App Store apps)"
sudo spctl --master-disable

echo ""
echo "Increasing the window resize speed for Cocoa applications whether you like it or not"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

echo ""
echo "Expanding the save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo ""
echo "Disabling the 'Are you sure you want to open this application?' dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Display ASCII control characters using caret notation in standard text views
# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
echo ""
echo "Do some ASCII shit"
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

echo ""
echo "Disable the system-wide resume"
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

echo ""
echo "Disable automatic termination of inactive apps"
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

echo ""
echo "Increasing the window resize speed for Cocoa applications whether you like it or not"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

echo ""
echo "Expanding the save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo ""
echo "Saving to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

echo ""
echo "Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

echo ""
echo "Never go into computer sleep mode"
systemsetup -setcomputersleep Off > /dev/null

echo ""
echo "Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

echo ""
echo "Increasing sound quality for Bluetooth headphones/headsets, because duhhhhh"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

echo ""
echo "Enabling full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo ""
echo "Disabling press-and-hold for keys in favor of key repeat and setting a blazingly fast keyboard repeat rate (ain't nobody got time fo special chars while coding!)"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 0

echo ""
echo "Disabling auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo ""
echo "Setting trackpad & mouse speed to a reasonable number"
defaults write -g com.apple.trackpad.scaling 2
defaults write -g com.apple.mouse.scaling 2.5

echo ""
echo "Turn off keyboard illumination when computer is not used for 5 minutes"
defaults write com.apple.BezelServices kDimTime -int 300

###############################################################################
# Screen                                                                      #
###############################################################################

echo ""
echo "Requiring password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo ""
echo "Where do you want screenshots to be stored? (hit ENTER if you want ~/Desktop as default)"
read screenshot_location
if [ -z "$1" ]
then
    echo ""
    echo "Setting location to ~/Desktop"
    defaults write com.apple.screencapture location -string "$HOME/Desktop"
else
    echo ""
    echo "Setting location to ~/$screenshot_location"
    defaults write com.apple.screencapture location -string "$HOME/$screenshot_location"
fi

echo ""
echo "What format should screenshots be saved as? (hit ENTER for PNG, options: BMP, GIF, JPG, PDF, TIFF) "
read screenshot_format
if [ -z "$1" ]
then
    echo ""
    echo "Setting screenshot format to PNG"
    defaults write com.apple.screencapture type -string "png"
else
    echo ""
    echo "Setting screenshot format to $screenshot_format"
    defaults write com.apple.screencapture type -string "$screenshot_format"
fi


echo "Enabling subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

###############################################################################
# Finder                                                                      #
###############################################################################

echo ""
echo "Showing icons for hard drives, servers, and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

echo ""
echo "Finder: show hidden files by default?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) defaults write com.apple.Finder AppleShowAllFiles -bool true
              break;;
        No ) break;;
    esac
done

echo ""
echo "Finder: show dotfiles?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) defaults write com.apple.finder AppleShowAllFiles TRUE
              break;;
        No ) break;;
    esac
done

echo ""
echo "Finder: showing all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo ""
echo "Finder: showing status bar"
defaults write com.apple.finder ShowStatusBar -bool true

echo ""
echo "Finder: show path bar"
defaults write com.apple.finder ShowPathbar -bool true

echo ""
echo "Finder: allowing text selection in Quick Look/Preview"
defaults write com.apple.finder QLEnableTextSelection -bool true

echo ""
echo "Displaying full POSIX path as Finder window title?"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

echo ""
echo "Disabling the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo ""
echo "Use column view in all Finder windows by default"
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

echo ""
echo "Avoiding creating stupid .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo ""
echo "Disabling disk image verification"
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

echo ""
echo "Enable snap-to-grid for icons on the desktop and in other icon views?"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

echo ""
echo "Setting Trash to empty securely by default"
defaults write com.apple.finder EmptyTrashSecurely -bool true


###############################################################################
# Dock & hot corners                                                          #
###############################################################################

echo ""
echo "Wipe all (default) app icons from the Dock"
echo "This is only really useful when setting up a new Mac, or if you don’t use"
echo "the Dock to launch apps and use a quickluancher like Alfred"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) defaults write com.apple.dock persistent-apps -array
              break;;
        No ) break;;
    esac
done

echo ""
echo "Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate"
defaults write com.apple.dock tilesize -int 36

echo ""
echo "Speeding up Mission Control animations and grouping windows by application"
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock "expose-group-by-app" -bool true

echo ""
echo "Setting Dock to auto-hide and removing the auto-hiding delay"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.Dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

echo ""
echo "Enabling iTunes track notifications in the Dock"
defaults write com.apple.dock itunes-notifications -bool true


###############################################################################
# Safari & WebKit                                                             #
###############################################################################

echo ""
echo "Disabling Safari’s thumbnail cache for History and Top Sites"
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

echo ""
echo "Enabling Safari’s debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo ""
echo "Making Safari’s search banners default to Contains instead of Starts With"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

echo ""
echo "Removing useless icons from Safari’s bookmarks bar"
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

echo ""
echo "Enabling the Develop menu and the Web Inspector in Safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

echo ""
echo "Adding a context menu item for showing the Web Inspector in web views"
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

###############################################################################
# Address Book, Dashboard, iCal, iTunes, Mail, and Disk Utility               #
###############################################################################

echo ""
echo "Enabling Dashboard dev mode (allows keeping widgets on the desktop)"
defaults write com.apple.dashboard devmode -bool true

echo ""
echo "Copy email addresses as 'foo@example.com' instead of 'Foo Bar <foo@example.com>' in Mail.app?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
              break;;
        No ) break;;
    esac
done

echo ""
echo "Enabling the debug menu in Disk Utility"
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true

###############################################################################
# Terminal                                                                    #
###############################################################################

echo ""
echo "Enabling UTF-8 ONLY in Terminal.app and setting the Pro theme by default"
defaults write com.apple.terminal StringEncodings -array 4
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"

###############################################################################
# Time Machine                                                                #
###############################################################################

echo ""
echo "Preventing Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

echo ""
echo "Disabling local Time Machine backups"
hash tmutil &> /dev/null && sudo tmutil disablelocal

###############################################################################
# Personal Additions                                                          #
###############################################################################
echo ""
echo "Deleting space hogging sleep image and disabling"
rm /private/var/vm/sleepimage
pmset -a hibernatemode 0

echo ""
echo "Speed up wake from sleep to 24 hours from an hour"
# http://www.cultofmac.com/221392/quick-hack-speeds-up-retina-macbooks-wake-from-sleep-os-x-tips/
pmset -a standbydelay 86400

echo ""
echo "Disabling OS X logging of downloaded files"
echo "For more info visit http://www.macgasm.net/2013/01/18/good-morning-your-mac-keeps-a-log-of-all-your-downloads/"
defaults write com.apple.LaunchServices LSQuarantine -bool NO

###############################################################################
# Sublime Text 3                                                              #
###############################################################################
echo ""
echo "Do you use Sublime Text as your editor of choice and is it installed?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo ""
              echo "Linking Sublime Text command line"
              ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /bin/subl
              echo ""
              echo "Setting Git to use Sublime Text as default editor"
              git config --global core.editor "subl -n -w"
              break;;
        No ) break;;
    esac
done

###############################################################################
# Git                                                                         #
###############################################################################
echo ""
echo "Create a nicely formatted git log command accessible via 'git lg'?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "Creating nice git log command"
              git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
              break;;
        No ) break;;
    esac
done

###############################################################################
# Kill affected applications                                                  #
###############################################################################

echo ""
echo "Done!"
echo ""
echo ""
echo "###############################################################################"
echo ""
echo ""
echo "Note that some of these changes require a logout/restart to take effect."
echo "Killing some open applications in order to take effect."
echo ""
find ~/Library/Application\ Support/Dock -name "*.db" -maxdepth 1 -delete
for app in Finder Dock Mail Safari iTunes iCal Address\ Book SystemUIServer; do
    killall "$app" > /dev/null 2>&1
done

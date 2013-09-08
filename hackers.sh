# ~/.osx — http://mths.be/osx

# root check
if [[ $EUID -ne 0 ]]; then
    echo ""
    echo "################################"
    echo "## YOU ARE NOT RUNNING AS ROOT #"
    echo "################################"
    echo ""
    echo "USAGE: sudo $0"
    exit
fi

# select yn in "Yes" "No"; do
#     case $yn in
#         Yes )
#               break;;
#         No ) break;;
#     esac
# done

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

# Menu bar, hide icons for:
# - Time Machine
# - Volume
echo ""
echo "Hide the useless Time Machine, Volume, Bluetooth and Spotlight icons? "
select yn in "Yes" "No"; do
    case $yn in
        Yes ) defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" "/System/Library/CoreServices/Menu Extras/AirPort.menu" "/System/Library/CoreServices/Menu Extras/Battery.menu" "/System/Library/CoreServices/Menu Extras/Clock.menu"
              sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
              break;;
        No ) break;;
    esac
done
echo ""
echo "Increasing the window resize speed for Cocoa applications whether you like it or not"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

echo ""
echo "Expanding the save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo ""
echo "Disable the 'Are you sure you want to open this application?' dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Display ASCII control characters using caret notation in standard text views
# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
echo ""
echo "Do some ASCII shit"
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

# Disable Resume system-wide
echo ""
echo "Do you want to disable the stupid system-wide resume?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "Yay, you made the right choice! Disabling system-wide resume"
            defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false
              break;;
        No ) break;;
    esac
done

# Disable automatic termination of inactive apps
echo ""
echo "OSX Y U TERMINATE INACTIVE APPS? DO NOT DO THAT"
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

echo ""
echo "Increasing sound quality for Bluetooth headphones/headsets, because duhhhhh"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

echo ""
echo "Why is this not default anymore?! Enabling full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo ""
echo "Disabling press-and-hold for keys in favor of key repeat and setting a blazingly fast keyboard repeat rate (ain't nobody got time fo special chars while coding!)"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 0

echo ""
echo "Disabling auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

###############################################################################
# Screen                                                                      #
###############################################################################

echo ""
echo "I'm in yer computer, hax0ring yr passwords!"
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
echo "What format should screenshots be saved as? (options: BMP, GIF, JPG, PDF, TIFF) "
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
echo "Show icons for hard drives, servers, and removable media on the desktop?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
              break;;
        No ) break;;
    esac
done

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
echo "Show dotfiles in Finder?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) defaults write com.apple.finder AppleShowAllFiles TRUE
              break;;
        No ) break;;
    esac
done

echo ""
echo "Finder: show all filename extensions?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) defaults write NSGlobalDomain AppleShowAllExtensions -bool true
              break;;
        No ) break;;
    esac
done

echo ""
echo "Finder: show status bar?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) defaults write com.apple.finder ShowStatusBar -bool true
              break;;
        No ) break;;
    esac
done

echo ""
echo "Finder: allow text selection in Quick Look/Preview?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) defaults write com.apple.finder QLEnableTextSelection -bool true
              break;;
        No ) break;;
    esac
done

echo ""
echo "Display full POSIX path as Finder window title?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
              break;;
        No ) break;;
    esac
done

echo ""
echo "Disable the warning when changing a file extension?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
              break;;
        No ) break;;
    esac
done

echo ""
echo "Avoiding creating stupid .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo ""
echo "Disable disk image verification?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) defaults write com.apple.frameworks.diskimages skip-verify -bool true
              defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
              defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
              break;;
        No ) break;;
    esac
done

echo ""
echo "Automatically open a new Finder window when a volume is mounted?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
              defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
              defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
              break;;
        No ) break;;
    esac
done

echo ""
echo "Enable snap-to-grid for icons on the desktop and in other icon views?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
              /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
              /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
              break;;
        No ) break;;
    esac
done

echo ""
echo "Setting Trash to empty securely by default"
defaults write com.apple.finder EmptyTrashSecurely -bool true

echo ""
echo "Show the ~/Library folder?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) chflags nohidden ~/Library
              break;;
        No ) exit;;
    esac
done



###############################################################################
# Dock & hot corners                                                          #
###############################################################################

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

echo ""
echo "Reset Launchpad?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) find ~/Library/Application\ Support/Dock -name "*.db" -maxdepth 1 -delete
              break;;
        No ) break;;
    esac
done

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
echo "Disable OS X logging of downloaded files? (highly advised)"
echo "For more info visit http://www.macgasm.net/2013/01/18/good-morning-your-mac-keeps-a-log-of-all-your-downloads/"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) defaults write com.apple.LaunchServices LSQuarantine -bool NO
              break;;
        No ) break;;
    esac
done

###############################################################################
# Sublime Text 2                                                              #
###############################################################################
echo ""
echo "Do you use Sublime Text as your editor of choice and is it installed?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo ""
              echo "Linking Sublime Text 2 command line"
              ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /bin/subl
              echo ""
              echo "Setting Git to use Sublime Text 2 as default editor"
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
for app in Finder Dock Mail Safari iTunes iCal Address\ Book SystemUIServer Twitter; do
    killall "$app" > /dev/null 2>&1
done
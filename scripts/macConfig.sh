#!/usr/bin/env bash

# ---
# Mac configurations
# ---

# Ask for the administrator password upfront
sudo -v

# General UI/UX
echo "---"
echo -e "\033[32m👨‍💻 Configuring Mac Preferences"
echo "---"
echo "✅ Disabling the 'Are you sure you want to open this application from the Internet?' dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "✅ Disabling automatic termination of inactive apps"
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# echo "✅ Never go into computer sleep mode"
# systemsetup -setcomputersleep Off > /dev/null

echo "✅ Disabling smart quotes as they’re annoying when typing code"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

echo "✅ Disabling smart dashes as they’re annoying when typing code"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Trackpad, mouse, keyboard, Bluetooth accessories, and input 

echo "✅ Enabling tap to click for this user and for the login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo "✅ Increasing sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

echo "✅ Enabling full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# echo "✅ Disabling press-and-hold for keys in favor of key repeat "
# defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

echo "✅ Setting a blazingly fast keyboard repeat rate (ain't nobody got time fo special chars while coding!)"
defaults write NSGlobalDomain KeyRepeat -int 0

echo "✅ Disabling auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "✅ Setting trackpad & mouse speed to a reasonable number"
defaults write -g com.apple.trackpad.scaling 2
defaults write -g com.apple.mouse.scaling 2.5

# Trackpad

# Haptic feedback
# 0: Light
# 1: Medium
# 2: Firm
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 2
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 2

# Finder
echo "✅ Automatically open a new Finder window when a volume is mounted"
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

echo "✅ Finder: showing all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "✅ Disabling the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "✅ Avoiding creating stupid .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "✅ Finder: showing status bar"
defaults write com.apple.finder ShowStatusBar -bool true

echo "✅ Finder: show path bar"
defaults write com.apple.finder ShowPathbar -bool true

# Dock

# run on clean os setup
# echo "✅ Wipe all (default) app icons from the Dock"
# defaults write com.apple.dock persistent-apps -array

echo "✅ Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate"
defaults write com.apple.dock tilesize -int 36

echo "✅ Speeding up Mission Control animations and grouping windows by application"
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock "expose-group-by-app" -bool true

echo "✅ Setting Dock to auto-hide and removing the auto-hiding delay"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

echo "✅ Setting Dock to 2D mode"
defaults write com.apple.dock no-glass -boolean YES

# echo "✅ Pinning the Dock to the left side of the screen for most efficient use of screen realestate"
# defaults write com.apple.dock pinning -string "end"

# Safari & WebKit                                                             
echo "✅ Disabling Safari’s thumbnail cache for History and Top Sites"
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

echo "✅ Enabling Safari’s debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo "✅ Making Safari’s search banners default to Contains instead of Starts With"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

echo "✅ Removing useless icons from Safari’s bookmarks bar"
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

echo "✅ Enabling the Develop menu and the Web Inspector in Safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

echo "✅ Adding a context menu item for showing the Web Inspector in web views"
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

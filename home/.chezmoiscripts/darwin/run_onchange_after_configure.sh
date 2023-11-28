#!/bin/bash

set -eufo pipefail

# https://github.com/mathiasbynens/dotfiles/blob/main/.macos

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Set language and text formats
# Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with
# `Inches`, `en_GB` with `en_US`, and `true` with `false`.
defaults write NSGlobalDomain AppleLanguages -array "en" "us"
defaults write NSGlobalDomain AppleLocale -string "en_GB@currency=EUR"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# Set dark / light mode
defaults write NSGlobalDomain AppleInterfaceStyle Dark

# Set a faster keyboard repeat rate
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 2

# disable keyboard spotlight search sortcut (cmd + space). Will be replaced by Raycast
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "<dict><key>enabled</key><false/></dict>"

# Set the number of Spaces (desktops) to 7
defaults write com.apple.dock "spaces-number" -int 7
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 118 "<dict><key>enabled</key><true/><key>value</key><dict><key>type</key><string>standard</string><key>parameters</key><array><integer>65535</integer><integer>18</integer><integer>1</integer></array></dict></dict>" # enable keyboard shortcut for theses 7 spaces

# Disable animation when switching between Spaces (desktops)
# could require the terminal to have a full disk access
# in (System Preferences > Security & Privacy > Privacy > Full Disk Access)
defaults write com.apple.universalaccess reduceMotion -bool true

# Disable autocorrect and key substitutions
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false # automatic key capitalization
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false # automatic period
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false # automatic quotes
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false # automatic text completion

# Dock configuration
defaults write com.apple.dock autohide -bool true # automatic hide dock
defaults write com.apple.dock autohide-delay -float 0 # remove the auto hide delay
defaults write com.apple.dock autohide-time-modifier -float 0 # remove the animation when hiding/showing the Dock
defaults write com.apple.dock launchanim -bool false # don’t animate opening applications from the Dock
defaults write com.apple.dock orientation bottom # set the Dock to the bottom
defaults write com.apple.dock show-recents -bool false # don’t show recent applications in Dock
defaults write -g ApplePressAndHoldEnabled -bool false # if on, the accents menu is displayed when holding a key

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen
# Top left screen corner → Mission Control
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-tr-modifier -int 0
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-bl-modifier -int 0
defaults write com.apple.dock wvous-br-corner -int 0
defaults write com.apple.dock wvous-br-modifier -int 0

# Finder settings
defaults write com.apple.finder AppleShowAllFiles -bool true # show hidden files by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true # show all filename extensions
defaults write NSGlobalDomain com.apple.springing.enabled -bool true # Enable spring loading for directories
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true # Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true # Avoid creating .DS_Store files on USB volumes
defaults write NSGlobalDomain com.apple.springing.delay -float 0 # Remove the spring loading delay for directories
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true # Display full POSIX path as Finder window title
defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv" # list view by default
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true" # Keep folders on top
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf" # Default search scope to current folder
defaults write com.apple.finder "FXRemoveOldTrashItems" -bool "true" # Automatically empty recycle bin after 30 days
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false" # disable file extension change warning
killall Finder # to apply finder settings now

# Top Menu Bar
# clock display settings
defaults write com.apple.menuextra.clock "FlashDateSeparators" -bool "False"
defaults write com.apple.menuextra.clock "IsAnalog" -bool "False"
defaults write com.apple.menuextra.clock "ShowAMPM" -bool "False"
defaults write com.apple.menuextra.clock "ShowDate" -int 0 # 0 When Space Allows; 1 Always; 2 Never
defaults write com.apple.menuextra.clock "ShowDayOfWeek" -bool "False"
defaults write com.apple.menuextra.clock "ShowSeconds" -bool "False"
defaults write com.apple.controlcenter.plist BatteryShowPercentage -bool true

# Disable Resume system-wide
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# Disable Notification Center and remove the menu bar icon
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

# Siri
 defaults write com.apple.Siri "StatusMenuVisible" -bool "False"
 defaults write com.apple.Siri "VoiceTriggerUserEnabled" -bool "False"
 

#!/usr/bin/env bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Sidebar icon size Small"
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

echo "Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

echo 'Disable the “Are you sure you want to open this application?” dialog'
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo 'Remove duplicates in the “Open With” menu (also see `lscleanup` alias)'
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

echo "Restart automatically if the computer freezes"
sudo systemsetup -setrestartfreeze on

echo "Disable Notification Center and remove the menu bar icon"
#launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

echo "Disable smart quotes"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

echo "Set the icon size of Dock items to 36 pixels"
defaults write com.apple.dock tilesize -int 36

echo "Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

echo "Disable smart dashes"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

echo "Disable the sudden motion sensor as it’s not useful for SSDs"
sudo pmset -a sms 0

echo "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons"
defaults write com.apple.finder QuitMenuItem -bool true

echo "Show icons for hard drives, servers, and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
# defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

echo "Finder: show status bar"
#defaults write com.apple.finder ShowStatusBar -bool true

echo "Finder: show path bar"
defaults write com.apple.finder ShowPathbar -bool true

echo "Finder: allow text selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool true

echo "Display full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

echo "When performing a search, search the current folder by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo "Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "Show the ~/Library folder"
chflags nohidden ~/Library

echo "Avoid creating .DS_Store files on network or USB volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

echo "Use list view in all Finder windows by default"
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

echo "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "Expand save panel by default"
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true

echo "Expand print panel by default"
defaults write -g PMPrintingExpandedStateForPrint -bool true

echo "Always show scrollbars"
# defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

echo "Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

echo "Automatically open a new Finder window when a volume is mounted"
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true

echo "Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
echo "Disable Preview auto restore last viewed document"
defaults write com.apple.Preview NSQuitAlwaysKeepsWindows -bool false

echo "Disable Quicktime auto restore last viewed video"
defaults write com.apple.QuickTimePlayerX NSQuitAlwaysKeepsWindows -bool false

echo "Disable local Time Machine backups"
hash tmutil &> /dev/null && sudo tmutil disablelocal

# Disable the OSX Dashboard
defaults write com.apple.dashboard mcx-disabled -boolean true

# kill / restart apps 
echo "Changed defaults. Restarting apps…"
for app in Safari Finder Dock Mail; do killall "$app"; done
echo "Restarted apps. All done."

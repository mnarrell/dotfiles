# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Expand save panel by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
defaults write -g PMPrintingExpandedStateForPrint -bool true

# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Enable HiDPI display modes (requires restart)
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeDebugMenu -bool true

# Disable send and reply animations in Mail.app
#defaults write com.apple.Mail DisableReplyAnimations -bool true
#defaults write com.apple.Mail DisableSendAnimations -bool true

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show the ~/Library folder
chflags nohidden ~/Library

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles FALSE

# Disable Preview auto restore last viewed document
defaults write com.apple.Preview NSQuitAlwaysKeepsWindows -bool false

# Disable Quicktime auto restore last viewed video
defaults write com.apple.QuickTimePlayerX NSQuitAlwaysKeepsWindows -bool false

# Disable the OSX Dashboard
defaults write com.apple.dashboard mcx-disabled -boolean true

# kill / restart apps 
echo "Changed defaults. Restarting apps…"
for app in Safari Finder Dock Mail; do killall "$app"; done
echo "Restarted apps. All done."

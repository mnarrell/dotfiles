#! /usr/bin/env zsh

# OSX stuffs
alias showfiles="defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder"
alias fixow='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'


# Return the path of the frontmost Finder window
function pfd() {
  osascript 2>/dev/null <<EOF
    tell application "Finder"
      return POSIX path of (target of window 1 as alias)
    end tell
EOF
}

# Return the current Finder selection
function pfs() {
  osascript 2>/dev/null <<EOF
    set output to ""
    tell application "Finder" to set the_selection to selection
    set item_count to count the_selection
    repeat with item_index from 1 to count the_selection
      if item_index is less than item_count then set the_delimiter to "\n"
      if item_index is item_count then set the_delimiter to ""
      set output to output & ((item item_index of the_selection as alias)'s POSIX path) & the_delimiter
    end repeat
EOF
}

# cd to the current Finder directory
function cdf() {
  cd "$(pfd)"
}

# Open a specified man page in Preview app
function man-preview() {
  man -t "$@" | open -f -a Preview
}


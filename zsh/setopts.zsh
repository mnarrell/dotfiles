# setopt no_global_rcs

# setopt correctall           # argument auto-correction
setopt autocd               # .. is shortcut for cd .. (etc)
setopt autoparamslash       # tab completing directory appends a slash
setopt autopushd            # cd automatically pushes old dir onto dir stack
setopt clobber              # allow clobbering with >, no need to use >!
setopt correct              # command auto-correction
setopt interactivecomments  # allow comments, even in interactive shells
setopt noflowcontrol        # disable start (C-s) and stop (C-q) characters
setopt nonomatch            # unmatched patterns are left unchanged
setopt pushdignoredups      # dont push multiple copies of same dir onto stack
setopt pushdsilent          # dont print dir stack after pushing/popping

setopt appendhistory        # append the history list to the history file, rather than replace it
setopt histfindnodups       # do not display duplicates in the line editor
setopt histignorealldups    # filter duplicates from history
setopt histignorespace      # dont record commands starting with a space
setopt histverify           # confirm history expansion (!$, !!, !foo)
setopt ignoreeof            # prevent accidental C-d from exiting shell
setopt sharehistory         # share history across shells
setopt extendedglob         # allow for fancy file/dir globbing

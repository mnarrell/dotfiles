source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen-lib

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen-bundle git
antigen-bundle brew
antigen-bundle terminalapp
antigen-bundle mvn
#antigen-bundle history-substring-search
antigen-bundle autojump
antigen-bundle vagrant
antigen-bundle knife

# Syntax highlighting bundle.
antigen-bundle zsh-users/zsh-syntax-highlighting

# History search bundle
antigen-bundle zsh-users/zsh-history-substring-search

# Tell antigen that you're done.
antigen-apply

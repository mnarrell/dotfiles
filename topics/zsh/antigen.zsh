source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen-use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen-bundle git
antigen-bundle brew
antigen-bundle mvn
antigen-bundle vagrant
antigen-bundle knife
antigen-bundle extract
antigen-bundle rsync
antigen-bundle sudo
antigen-bundle docker

# Syntax highlighting bundle.
antigen-bundle zsh-users/zsh-syntax-highlighting

# History search bundle
antigen-bundle zsh-users/zsh-history-substring-search

# Tell antigen that you're done.
antigen-apply

# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
source "/usr/local/opt/fzf/shell/completion.bash"

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.bash"

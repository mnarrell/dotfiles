# Create a new directory and enter it
md() {
  mkdir -p "$@" && cd "$@"
}

function sshkey {
  ssh $1 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys" < ~/.ssh/id_?sa.pub
  echo "sshkey done."
}

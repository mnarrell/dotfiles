# use /etc/hosts and known_hosts for hostname completion
# [ -r ~/.ssh/config ] && _ssh_hosts+=(${=${${(M)${(f)"$(<~/.ssh/config)"}:#Host*}#Host }:#*\**}) || _ssh_hosts=()
# [ -r ~/.ssh/known_hosts ] && _known_hosts=(${${${${(f)"$(<${HOME}/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _known_hosts=()
# [ -r /etc/hosts ] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()
  # hosts=(
#   "$_ssh_hosts[@]"
#   "$_known_hosts[@]"
#   "$_etc_hosts[@]"
# )
# zstyle ':completion:*:hosts' hosts $hosts

if [ $commands[hub] ]; then
  alias git='hub'
fi

# Tig
alias tig="tig --all"
alias tis='\tig status'


function git_personal_user() {
  git config user.email $MY_EMAIL
  git config user.name $MY_NAME
}

function eradicate_submodule!(){
  git submodule deinit -f $1
  git rm $1
  git commit -m "Removed submodule: $1"
  rm -rf .git/modules/$1
}

function git_porcelain_submodules() {
  git submodule deinit -f .
  git submodule update --init
}

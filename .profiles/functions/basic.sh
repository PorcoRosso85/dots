glp() {
  preview="git diff $@ --color=always -- {-1}"
  git diff $@ --name-only | fzf -m --ansi --preview $preview
}

mkcd() {
  if ! [ -d $1 ]; then
    mkdir $1
    echo "made dir" $1
  fi
  cd $1
}

nn() {
  note=$1
  echo $(date) "$note" >> $HOME/mount/project/tmp2/echos
}
na() {
  echo $(cat $1) >> $HOME/mount/project/JournalLog/echos
}
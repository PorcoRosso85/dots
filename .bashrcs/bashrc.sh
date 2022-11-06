# [path]
export PATH=$PATH:$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin

# [apps]
export EDITOR=nvim

# [alias]
alias mnt="cd /mnt/c/Users/admin.DESKTOP-1PF4AT3/Documents/Apps"
alias dots='/usr/bin/git --git-dir=/root/.dotfiles/ --work-tree=/root'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
alias nvbashrc='nvim $HOME/.bashrc'
alias g='git'
alias ls='ls -la'

# [theme]
# call ohmybash
# ./.bashrcs/ohmybash.sh
#

# [external]
while read -r f;
do
  chmod +x $f
  external_bashrcs=$f
done < <(find $HOME/.bashrcs -mindepth 1 -maxdepth 1)

for bashrc in ${external_bashrcs[@]}
do
  if [ -f "$bashrc" ]
  then
    source "$bashrc"
    echo "Loaded external_bashrcs"
  else
    echo "File not found...in: $bashrc"
  fi
done

source $HOME/forgit/forgit.plugin.sh

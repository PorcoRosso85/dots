# [alias]
alias cdm="cd /mnt/c/Users/admin.DESKTOP-1PF4AT3/Documents/Apps"
alias dots='/usr/bin/git --git-dir=/root/.dotfiles/ --work-tree=/root'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
alias bashrc_nvim='nvim ~/.bashrcs/bashrc.sh'
alias g='git'
alias ls='ls -la'
alias fzd='cd $(find . -maxdepth 2 -type d | fzf)'
alias fzc='cat $(find . -maxdepth 4 | fzf)'

# [path]
export PATH=$PATH:~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin

# [apps]
export EDITOR=nvim

# [theme]
# call ohmybash
# ./.bashrcs/ohmybash.sh
#

# [external]
#while read -r f;
#do
#  chmod +x $f
#  external_bashrcs=$f
#done < <(find ~/.bashrcs -mindepth 1 -maxdepth 1)
#
#for bashrc in ${external_bashrcs[@]}
#do
#  if [ -f "$bashrc" ]
#  then
#    source "$bashrc"
#    echo "Loaded external_bashrcs"
#  else
#    echo "File not found...in: $bashrc"
#  fi
#done

source ~/.bashrcs/forgit/forgit.plugin.sh
eval "$(starship init bash)"

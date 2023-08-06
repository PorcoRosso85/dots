#git clone --bare git@github.com:PorcoRosso85/dots.git $HOME/.dotfiles
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
#rm -r .dotfiles/ .config/ .install/ .bashrcs/ .gitconfig .README.md
#echo 'if you already have dotfiles, remove before clone'

#function dots {
#  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
#}
#
#mkdir -p .dotfiles
#dots checkout
#if [ $? = 0 ]; then
#  echo "Checked out dotfiles.";
#  else
#    echo "Backing up pre-existing dots.";
#    dots checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles/{}
#fi;
#
dots checkout
dots config staturs.showUntrackedFiles no

alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
rm -r .dotfiles/ .config/ .install/
echo 'if you already have dotfiles, remove before clone'
git clone --bare git@github.com:PorcoRosso85/dots.git $HOME/.dotfiles

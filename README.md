# dots
This is the place where
* my dotfiles is
* how dotfiles to be update
* how updated dotfiles to be restore to new terminal


## Usage after clone this repo/branch

### restore to new terminal
```
# rm -r .dotfiles/ .config/ .install/ .bashrcs/ .gitconfig README.md &&\
git clone --bare git@github.com:PorcoRosso85/dots.git ~/.dotfiles &&\
# git clone -b vimplug --bare git@github.com:PorcoRosso85/dots.git ~/.dotfiles &&\
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' &&\
echo ".dotfiles" >> .gitignore &&\
dots checkout &&\
echo 'source ~/.bashrcs/bashrc.sh' >> ~/.bashrc && source ~/.bashrc
```


### create and update,,, Starting from scratch
If you haven't been tracking your configurations in a Git repository before, you can start using this technique easily with these lines:
```
git init --bare $HOME/.dotfiles
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dots config --local status.showUntrackedFiles no
echo "alias dots='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```
```
curl -Lks http://bit.do/cfg-init | /bin/bash
```
```
dots status
dots add .vimrc
dots commit -m "Add vimrc"
dots add .bashrc
dots commit -m "Add bashrc"
dots push
```


#### The step above might fail with a message like:
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
This is because your $HOME folder might already have some stock configuration files which would be overwritten by Git. The solution is simple: back up the files if you care about them, remove them if you don't care. I provide you with a possible rough shortcut to move all the offending files automatically to a backup folder:

mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
Re-run the check out if you had problems:
config checkout
Set the flag showUntrackedFiles to no on this specific (local) repository:
config config --local status.showUntrackedFiles no
You're done, from now on you can now type config commands to add and update your dotfiles:
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
Again as a shortcut not to have to remember all these steps on any new machine you want to setup, you can create a simple script, store it as Bitbucket snippet like I did, create a short url for it and call it like this:

curl -Lks http://bit.do/cfg-install | /bin/bash
For completeness this is what I ended up with (tested on many freshly minted Alpine Linux containers to test it out):
```
git clone --bare https://bitbucket.org/durdn/cfg.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
```

### reference
https://www.atlassian.com/git/tutorials/dotfiles

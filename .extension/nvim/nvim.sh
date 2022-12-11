nvim_install() {
  path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
  echo $path
  if [ -f $path/nvim.appimage ]; then
    rm -r $path/nvim.appimage
    echo $path"/nvim.appimage removed"
  fi
  if [ -f /usr/bin/nvim ]; then
	  rm /usr/bin/nvim
	  echo "/usr/bin/nvim removed"
  fi
	wget -P $path https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	chmod +x $path/nvim.appimage
	ln -s $path/nvim.appimage /usr/bin/nvim
}
nvim_install

#sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# git clone --depth 1 https://github.com/wbthomason/packer.nvim\
#   ~/.local/share/nvim/site/pack/packer/opt/packer.nvim

# for wsl2 to share clipboard
# git clone git@github.com:equalsraf/win32yank.git ~/.bashrcs/win32yank
# export PATH=$PATH:~/.bashrcs/
# this is one solution 'win32yank'
# another solution 'powershell' https://www.reddit.com/r/neovim/comments/g94zrl/solution_neovim_clipboard_with_wsl/

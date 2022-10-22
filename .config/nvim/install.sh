curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage /usr/local/bin/nvim

mkdir ~/.config/nvim
mkdir ~/.local/share/nvim/plugged
mkdir ~/.local/share/nvim/site/autoload
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dir \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# git clone git@github.com:PorcoRosso85/dotfiles.git
git clone --depth 1 git@github.com:wbthomason/packer.nvim.git \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

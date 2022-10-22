curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage /usr/local/bin/nvim

mkdir ~/.config/nvim
# mkdir ~/.local/share/nvim/plugged
# mkdir ~/.local/share/nvim/site/autoload

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  ~/.local/share/nvim/site/pack/packer/opt/packer.nvim

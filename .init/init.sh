#!/bin/bash
echo "wget"
nix profile install nixpkgs#wget
echo "curl"
nix profile install nixpkgs#curl
echo "gh"
nix profile install nixpkgs#gh
echo "unzip"
nix profile install nixpkgs#unzip

# sudo apt-get install zsh
# sudo bash -c "echo '/bin/zsh' >> /etc/shells"
# sudo chsh -s /bin/zsh

echo "devbox"
curl -fsSL https://get.jetpack.io/devbox | bash

echo "neovim"
nix profile install nixpkgs#neovim
# curl -sS https://raw.githubusercontent.com/PorcoRosso85/dots/main/.init/nvim.sh | bash

echo "direnv"
# curl -sfL https://direnv.net/install.sh | bash
nix profile install nixpkgs#direnv
echo 'eval "$(direnv hook bash)"' >> $HOME/.bashrc

echo "deno"
nix profile install nixpkgs#deno
deno() {
    curl -fsSL https://deno.land/x/install/install.sh | sh
    
    # Check if DENO_INSTALL is already present in .bashrc
    if ! grep -q "export DENO_INSTALL=\"/home/user/.deno\"" "$HOME/.bashrc"; then
        echo 'export DENO_INSTALL="/home/user/.deno"' >> $HOME/.bashrc
        echo 'export PATH="$DENO_INSTALL/bin:$PATH"' >> $HOME/.bashrc
        echo "Deno paths added to .bashrc"
        source $HOME/.bashrc
    else
        echo "Deno paths already present in .bashrc"
    fi
    
    # Check if deno is available
    if command -v deno &> /dev/null; then
        echo "Deno is available. No need to create a symlink."
    else
        echo "Deno is not available. Creating a symlink..."
        sudo ln -s /home/user/.deno/bin/deno /usr/local/bin/deno
    fi
}
deno

# echo "install docker manually"
# echo "curl -sS https://raw.githubusercontent.com/PorcoRosso85/dots/main/.init/docker.sh | bash"

echo "fd"
nix profile install nixpkgs#fd

echo "bat"
nix profile install nixpkgs#bat

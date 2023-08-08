#!/bin/bash
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install \
    wget \
    curl \
    gh \
    unzip \
    -y

# sudo apt-get install zsh
# sudo bash -c "echo '/bin/zsh' >> /etc/shells"
# sudo chsh -s /bin/zsh

# vsc_srv() {
#    wget -q -O- 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' | tar -zxf - 
#    echo "command 'code' if you use vsc as server"
# }
# vsc_srv

devbox() {
    sudo systemctl stop nix-daemon.service
    sudo systemctl disable nix-daemon.socket nix-daemon.service
    sudo systemctl daemon-reload

    items_deleted=(
        "/etc/bashrc"
        "/etc/bashrc.backup-before-nix"
        "/etc/profile.d/nix.sh"
        "/etc/profile.d/nix.sh.backup-before-nix"
        "/etc/profile.d/nix.sh.backup-before-nix"
        "/etc/zshrc"
        "/etc/zshrc.backup-before-nix"
        "/etc/bash.bashrc"
        "/etc/bash.bashrc.backup-before-nix"
        "/etc/nix"
        "/nix"
        "/var/root/.nix-profile"
        "/var/root/.nix-defexpr"
        "/var/root/.nix-channels"
        "/Users/simonbein/.nix-profile"
        "/Users/simonbein/.nix-defexpr"
        "/Users/simonbein/.nix-channels"
    )

    for item in "${items_deleted[@]}"; do
        sudo rm -rf "$item"
    done

    for i in $(seq 1 32); do
      sudo userdel nixbld$i
    done
    sudo groupdel nixbld

    # bash <(curl -L https://nixos.org/nix/install) --daemon
    curl -fsSL https://get.jetpack.io/devbox | bash
}
devbox

curl -sS https://raw.githubusercontent.com/PorcoRosso85/dots/main/nvim.sh | bash

curl -sfL https://direnv.net/install.sh | bash
eval "$(direnv hook bash)"

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

echo "install nix manually"
echo "bash <(curl -L https://nixos.org/nix/install) --daemon"

echo "install docker manually"
# curl -sS https://raw.githubusercontent.com/PorcoRosso85/dots/main/docker.sh | bash
echo "curl -sS https://raw.githubusercontent.com/PorcoRosso85/dots/main/docker.sh | bash"

echo "install dots manually"
echo "curl -sS -o /tmp/dots.sh https://raw.githubusercontent.com/PorcoRosso85/dots/dev/dots.sh && bash /tmp/dots.sh && rm /tmp/dots.sh"
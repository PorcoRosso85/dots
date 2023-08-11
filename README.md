# dots
This is the place where
* initialize new os with shell and dot files
* my dotfiles is
* how dotfiles to be update
* how updated dotfiles to be restore to new terminal

## nix
bash <(curl -L https://nixos.org/nix/install) --daemon

## init
curl -sS https://raw.githubusercontent.com/PorcoRosso85/dots/main/.init/init.sh | bash

## dots
curl -sS -o /tmp/dots.sh https://raw.githubusercontent.com/PorcoRosso85/dots/main/.init/dots.sh && bash /tmp/dots.sh && rm /tmp/dots.sh
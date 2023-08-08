# all of os
sh <(curl -L https://nixos.org/nix/install)

# 3 requirements to reproduct the same env, https://checkoway.net/musings/nix/
# Declarative: Write a file (env.nix) specifying packages to install.
# Reproducible: Check env.nix into version control, get same packages on another machine.
# Consistent: Installing via nix-env = specifying in env.nix file.

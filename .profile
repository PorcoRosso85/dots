# [alias]
#alias cdf='cd $(find . -maxdepth 3 -type d | fzf)'
alias cdfm='cd $(find /mnt/c/Users/admin.DESKTOP-1PF4AT3/ -maxdepth 3 -type d | grep "Documents\|Downloads\|wsl" | fzf)'
alias catf='cat $(find . -maxdepth 4 | fzf)'


# [alias/docker]
alias dcir='docker image rm'
alias dccl='docker container ls -a'
alias dccr='docker container rm'
alias dcsp='docker system purge'
alias dce='docker exec'


eval "$(direnv hook bash)"

export LD_LIBRARY_PATH=/nix/store/g3g89nki211vi892cr6vg57aihvjk302-z3-4.8.15-python/lib/python3.10/site-packages/z3/lib/libz3.so:/nix/store/rgdmlsv1fn32pwclapv6zi59fyjc3zf2-z3-4.8.15-lib/lib/libz3.so

export EDITOR=nvim
# bindkey -v
# bind -vi '"\e[1;9D": backward-word'
# bind -vi '"\e[1;9C": forward-word'
# bindkey -a '^[[1;9D' backward-word
# bindkey -a '^[[1;9C' forward-word
# bindkey -v -a '^C' vi-cmd-mode


# module
# File: .profile:
PROFILES_DIR="$HOME/.profiles"
FUNCTIONS_DIR="$PROFILES_DIR/functions"

for f in "$FUNCTIONS_DIR"/*.sh; do
  source "$f"
done
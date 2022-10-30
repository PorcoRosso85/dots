# [path]
export PATH=$PATH:$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin

# [alias]
alias mnt="cd /mnt/c/Users/admin.DESKTOP-1PF4AT3/Documents/Apps"
alias dots='/usr/bin/git --git-dir=/root/.dotfiles/ --work-tree=/root'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
alias nvbashrc='nvim $HOME/.bashrc'

# [theme]
# call ohmybash
# ./.bashrcs/ohmybash.sh
#
# https://unix.stackexchange.com/questions/148/colorizing-your-terminal-and-shell-environment
export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export COLOR_NC='\e[0m' # No Color
export COLOR_BLACK='\e[0;30m'
export COLOR_GRAY='\e[1;30m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_LIGHT_GRAY='\e[0;37m'
export COLOR_WHITE='\e[1;37m'
case $TERM in
     xterm*|rxvt*)
         local TITLEBAR='\[\033]0;\u ${NEW_PWD}\007\]'
          ;;
     *)
         local TITLEBAR=""
          ;;
    esac

local UC=$COLOR_WHITE               # user's color
[ $UID -eq "0" ] && UC=$COLOR_RED   # root's color

PS1="$TITLEBAR\n\[${UC}\]\u \[${COLOR_LIGHT_BLUE}\]\${PWD} \n\[${COLOR_LIGHT_GREEN}\]→\[${COLOR_NC}\] "

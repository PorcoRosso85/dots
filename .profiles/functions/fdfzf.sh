# [Fzf]
export FZF_DEFAULT_COMMAND="fd" #"find . -printf '%Tm/%Td %TH:%TM %p\n'"
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
FZF_CTRL_T_COMMAND="find . -maxdepth 4"
FZF_CTRL_R_OPTS="--reverse --height 25%"


fz() {
  local sels=( "${(@f)$(fd --color=always . "${@:2}" | fzf -m --height=25% --reverse --ansi)}" )
  [ -n "$sels" ] && print -z -- "$1 ${sels[@]:q:q}"
}

cmdf() {
  local command_file_path="$HOME/.extension/shell/commands.sh"
  local sels=( "${(@f)$(cat $command_file_path | fzf -m --height=25% --reverse --ansi)}" )
  [ -n "$sels" ] && print -z -- "$1 ${sels[@]}"
}

cmda() {
  local command_file_path="$HOME/.extension/shell/commands.sh"
  echo $1 >> $command_file_path
}

cmdc() {
  local command_file_path="$HOME/.extension/shell/commands.sh"
  nvim $command_file_path
}



fw() {
  fd $1 -t f $2 | xargs grep -n -E -w "$3" | fzf
}

ff_() {
    echo "preview, "
    case $1 in
        "preview")
            shift
            preview "$@"
            ;;
        "histry")
            shift
            bash_history "$@"
            ;;
        *)
            echo "use other"
    esac

    preview() { 
    #   fd $1 $2 | fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'
      fd --type f | fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'
    }
    
    bash_history() {
      local cmd
      cmd=$(history | fzf +s --tac | awk '{$1=""; print substr($0, 2)}')
      [ -n "$cmd" ] && eval "$cmd"
    }

}

complete -W "preview" ff_
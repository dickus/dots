export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="dickus"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


function preexec() {
  timer=$(($(date +%s%0N)*0.000000001))
}

function precmd() {
  if [ $timer ]; then
    now=$(($(date +%s%0N)*0.000000001))
    elapsed=$(echo $(($now-$timer)) | awk '{printf "%.3f", $1}')

    export RPROMPT="%F{cyan}${elapsed}s %{$reset_color%}"
    unset timer
  fi
}

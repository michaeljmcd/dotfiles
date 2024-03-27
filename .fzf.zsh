# Setup fzf
# ---------
if [[ ! "$PATH" == */home/michael/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/michael/.fzf/bin"
fi

eval "$(fzf --zsh)"

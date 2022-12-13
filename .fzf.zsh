# Setup fzf
# ---------
if [[ ! "$PATH" == */home/michael/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/michael/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${HOME}/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "${HOME}/.fzf/shell/key-bindings.zsh"

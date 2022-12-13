# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/jisamm9/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/jisamm9/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/jisamm9/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/jisamm9/.fzf/shell/key-bindings.bash"

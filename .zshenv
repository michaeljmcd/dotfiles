export GOPATH=$HOME/src/go-workspace
export PATH=$PATH:$HOME/local/bin:$GOPATH/bin:$HOME/.local/bin:$HOME/local/games:$HOME/local/opt/racket/bin:/usr/local/bin:/opt/homebrew/bin/
[ -f "/opt/homebrew/bin" ] && export PATH="$PATH:/opt/homebrew/bin"

export EDITOR=vim
export PAGER=less
export SHELL=`which zsh`

alias k=kubectl
alias docker=podman

[[ $(whence -v gls) ]] && alias ls="gls --color=auto"

#export DISPLAY=:0

[ -f "~/.cargo/env" ] && source "$HOME/.cargo/env"
export JOLIE_HOME="$HOME/local/lib/jolie"

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/local/dist/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/local/dist/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/local/dist/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/local/dist/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

[[ -f '$HOME/.config/broot/launcher/bash/br' ]] && source $HOME/.config/broot/launcher/bash/br
export PATH="/usr/local/opt/krb5/bin:$PATH"

eval "$(jenv init -)"

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

if [ -e "$HOME/local/opt/ImageMagick-7.0.10" ]; then
  export MAGICK_HOME="$HOME/local/opt/ImageMagick-7.0.10"
  export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib/"
  export PATH="$PATH:$MAGICK_HOME/bin"
fi

export GOPATH=$HOME/src/go-workspace
export PATH=$PATH:$HOME/local/bin:$GOPATH/bin:$HOME/.local/bin:$HOME/local/games:$HOME/local/opt/racket/bin:/usr/local/bin

# Enable this only if you don't have WSL2 + Docker Desktop bridge goodness
#export DOCKER_HOST=tcp://0.0.0.0:2375
#eval "$(docker-machine env default)"

export EDITOR=vim
export PAGER=less
export SHELL=`which zsh`

#alias ls="ls --color=auto"
#alias docker="winpty docker"
#alias docker-compose="winpty docker-compose"
alias k=kubectl

#export DISPLAY=:0

# This detects WSL2 and sets the display as it goes undetected otherwise.
if [[ $(uname -a) == *"microsoft-standard"* ]]; then
    export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
    export LIBGL_ALWAYS_INDIRECT=1
fi

source "$HOME/.cargo/env"
. "$HOME/.cargo/env"
export JOLIE_HOME="$HOME/local/lib/jolie"

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/local/dist/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/local/dist/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/local/dist/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/local/dist/google-cloud-sdk/completion.zsh.inc'; fi
#
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -f '$HOME/.config/broot/launcher/bash/br' ]] && source $HOME/.config/broot/launcher/bash/br
export PATH="/usr/local/opt/krb5/bin:$PATH"

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

if [ -e "$HOME/local/opt/ImageMagick-7.0.10" ]; then
  export MAGICK_HOME="$HOME/local/opt/ImageMagick-7.0.10"
  export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib/"
  export PATH="$PATH:$MAGICK_HOME/bin"
fi
